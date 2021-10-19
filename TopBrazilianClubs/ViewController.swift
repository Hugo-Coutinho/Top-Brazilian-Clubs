//
//  ViewController.swift
//  TopBrazilianClubs
//
//  Created by hugo.coutinho on 08/10/21.
//

import UIKit

typealias TableViewProtocols = UITableViewDataSource & UITableViewDelegate
typealias CollectionViewProtocols = UICollectionViewDelegate & UICollectionViewDataSource

class ViewController: UIViewController {

    // MARK: - UI ATTRIBUTES -
    private lazy var clubCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.height * 0.20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ClubCollectionViewCell.self, forCellWithReuseIdentifier: "ClubCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.shouldGroupAccessibilityChildren = true
        collectionView.isAccessibilityElement = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    
    // MARK: - VARIABLES -
    private lazy var teams: Teams = TeamsService().getClubs()
    
    
    // MARK: - LIFE CYCLE -
    override func viewDidLoad() {
        setupUI()
    }
}

// MARK: - COLLECTION VIEW PROTOCOLS -
extension ViewController: CollectionViewProtocols {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClubCollectionViewCell", for: indexPath) as? ClubCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.bindCell(team: teams[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = ClubDetailViewController()
        detailVC.configureVC(team: teams[indexPath.row])
        navigationController?.present(detailVC, animated: true, completion: nil)
    }
}

// MARK: - PRIVATE FUNCTIONS -
extension ViewController {
    private func setupUI() {
        view.backgroundColor = .clear
        view.addSubview(clubCollectionView)
        NSLayoutConstraint.activate([
            clubCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            clubCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            clubCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            clubCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
}

