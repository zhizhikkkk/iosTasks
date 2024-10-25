//
//  FavoriteGamesViewController.swift
//  Favoritegames
//
//  Created by Arman Sarvardin on 25.10.2024.
//

import Foundation
import UIKit

final class FavoriteGamesViewController: UIViewController {
    
    var data: [FavoriteGame] = FavoriteGame.all
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FavoriteGameCellka.self, forCellReuseIdentifier: "FavoriteGameCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        title = "Favorite games"
        
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension FavoriteGamesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteGameCell", for: indexPath) as! FavoriteGameCellka
        let game = data[indexPath.row]
        cell.configure(with: game)

        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        nil
    }
}
