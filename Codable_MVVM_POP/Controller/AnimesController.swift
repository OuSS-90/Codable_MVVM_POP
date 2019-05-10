//
//  AnimeListController.swift
//  CodableTuto
//
//  Created by OuSS on 2/23/19.
//  Copyright © 2019 OuSS. All rights reserved.
//

import UIKit
import JGProgressHUD

class AnimesController: UITableViewController {
    
    let cellId = "cellId"
    private let hud = JGProgressHUD(style: .dark)
    var presenter: AnimeListViewModel?
    var animes = [AnimeViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
        setupPresenter()
    }
    
    fileprivate func setupNavigationBar() {
        navigationItem.title = "Anime Season List"
    }
    
    fileprivate func setupTableView() {
        tableView.register(AnimeListCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }

    fileprivate func setupPresenter() {
        presenter = AnimeListViewModel(delegate: self)
        presenter?.fetchAnimes()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animes.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AnimeListCell
        cell.animeViewModel = animes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animeController = DetailsAnimeController()
        animeController.animeViewModel = animes[indexPath.row]
        navigationController?.pushViewController(animeController, animated: true)
    }
}

extension AnimesController: AnimesDelegate {
    func showProgress() {
        hud.textLabel.text = "Loading"
        guard let view = self.navigationController?.view else { return }
        hud.show(in: view)
    }
    
    func hideProgress() {
        hud.dismiss()
    }
    
    func setAnimes(animes: [AnimeViewModel]) {
        self.animes = animes
        tableView.reloadData()
    }
}

