//
//  HeroDetailsViewController.swift
//  Superhero
//
//  Created by Arman Sarvardin on 20.11.2024.
//


import UIKit
import Kingfisher

class HeroDetailsViewController: UIViewController {
    var hero: HeroesResponseElement!
    
    private let scrollView = UIScrollView()
    private let contentView = UIStackView()
    private let heroImageView = UIImageView()
    private let detailsStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.style = .editor
        navigationItem.title = hero.name
        setupUI()
        Task {
            await configureHeroDetails()
        }
    }
    
    private func setupUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentView.axis = .vertical
        contentView.spacing = 16
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
        
        heroImageView.contentMode = .scaleAspectFit
        heroImageView.layer.cornerRadius = 12
        heroImageView.clipsToBounds = true
        heroImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        contentView.addArrangedSubview(heroImageView)
        
        detailsStackView.axis = .vertical
        detailsStackView.spacing = 8
        contentView.addArrangedSubview(detailsStackView)
    }
    
    private func configureHeroDetails() async {
        if let url = URL(string: hero.images.lg) {
            heroImageView.kf.setImage(with: url)
        }
        
        addDetailRow(label: "Name", value: hero.name)
        addDetailRow(label: "Full Name", value: hero.biography.fullName)
        addDetailRow(label: "Gender", value: hero.appearance.gender.rawValue)
        addDetailRow(label: "Race", value: hero.appearance.race ?? "Unknown")
        addDetailRow(label: "Alignment", value: hero.biography.alignment.rawValue.capitalized)
        addDetailRow(label: "Place of Birth", value: hero.biography.placeOfBirth)
        addDetailRow(label: "Publisher", value: hero.biography.publisher ?? "Unknown")
        addDetailRow(label: "Occupation", value: hero.work.occupation)
        addDetailRow(label: "Base", value: hero.work.base)
        addDetailRow(label: "Group Affiliation", value: hero.connections.groupAffiliation)
    }
    
    private func addDetailRow(label: String, value: String) {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading

        let labelView = UILabel()
        labelView.text = "\(label):"
        labelView.font = .boldSystemFont(ofSize: 16)
        labelView.textColor = .black

        let valueView = UILabel()
        valueView.text = value
        valueView.font = .systemFont(ofSize: 16)
        valueView.textColor = .darkGray
        valueView.numberOfLines = 0
        valueView.lineBreakMode = .byWordWrapping

        stackView.addArrangedSubview(labelView)
        stackView.addArrangedSubview(valueView)

        detailsStackView.addArrangedSubview(stackView)
    }
}
