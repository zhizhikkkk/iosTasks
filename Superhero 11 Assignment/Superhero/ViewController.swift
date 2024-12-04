//
//  ViewController.swift
//  Superhero
//
//  Created by Arman Sarvardin on 20.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let client = Client()
    
    // MARK: - UI Elements
    
    let getHeroButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Random", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var loaderOverlay: UIView?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavigationBar()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(getHeroButton)
        
        NSLayoutConstraint.activate([
            getHeroButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getHeroButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            getHeroButton.widthAnchor.constraint(equalToConstant: 200),
            getHeroButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        getHeroButton.addTarget(self, action: #selector(getHeroButtonTapped), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Superhero Finder"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemRed
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func showLoader() {
        let overlay = UIView()
        overlay.backgroundColor = .black.withAlphaComponent(0.2)
        overlay.translatesAutoresizingMaskIntoConstraints = false
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(overlay)
        overlay.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor)
        ])
        
        loaderOverlay = overlay
    }
    
    private func hideLoader() {
        loaderOverlay?.removeFromSuperview()
        loaderOverlay = nil
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func getHeroButtonTapped() {
        Task {
            do {
                showLoader()
                
                let response = try await client.getAllHeroes()
                
                guard let randomHero = response.randomElement() else {
                    throw NSError(domain: "No heroes found", code: 404, userInfo: nil)
                }
                
                let detailsView = HeroDetailsViewController()
                detailsView.hero = randomHero
                
                await MainActor.run {
                    navigationController?.pushViewController(detailsView, animated: true)
                }
                await MainActor.run {
                    hideLoader()
                }
            } catch {
                await MainActor.run {
                    showErrorAlert(message: "Failed to fetch hero. Please try again. Error: \(error.localizedDescription)")
                }
                await MainActor.run {
                    hideLoader()
                }
            }
        }
    }
}
