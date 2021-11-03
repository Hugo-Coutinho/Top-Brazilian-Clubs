//
//  StarCollectionView.swift
//  TopBrazilianClubs
//
//  Created by hugo.coutinho on 13/10/21.
//

import UIKit

class ClubCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI ATTRIBUTES -
    private lazy var clubImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isAccessibilityElement = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - INIT -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponents()
    }
    
    // MARK: - PUBLIC FUNCTIONS -
    func bindCell(team: TeamEntity) {
        clubImageView.downloaded(from: team.clubLogoUrl, contentMode: .scaleAspectFill)
        setupAccessibilities(team: team)
    }
}

extension ClubCollectionViewCell {
    private func setupAccessibilities(team: TeamEntity) {
        isAccessibilityElement = true
        accessibilityTraits = .selected
        accessibilityLabel = team.name
        accessibilityHint = "Double tap to enter the \(team.name) details"
    }
}

// MARK: - UI -
extension ClubCollectionViewCell {
    private func setupComponents() {
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(clubImageView)
        NSLayoutConstraint.activate([
            clubImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            clubImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            clubImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            clubImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
