//
//  ClubDetailViewController.swift
//  TopBrazilianClubs
//
//  Created by hugo.coutinho on 14/10/21.
//

import UIKit

class ClubDetailViewController: UIViewController {

    // MARK: - UI ATTRIBUTES -
    private lazy var clubImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIgnoresInvertColors = true
        imageView.accessibilityIdentifier = "ClubImage"
        return imageView
    }()
    
    private lazy var DescriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.textAlignment = .center
        descriptionLabel.isAccessibilityElement = true
        descriptionLabel.accessibilityTraits = .staticText
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.accessibilityIgnoresInvertColors = true
        descriptionLabel.accessibilityIdentifier = "ClubDescription"
        return descriptionLabel
    }()
    
    private lazy var nationalLeagueWinLabel: UILabel = {
        let nationalLeagueWinLabel = UILabel()
        nationalLeagueWinLabel.translatesAutoresizingMaskIntoConstraints = false
        nationalLeagueWinLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        nationalLeagueWinLabel.numberOfLines = 0
        nationalLeagueWinLabel.lineBreakMode = .byTruncatingTail
        nationalLeagueWinLabel.textAlignment = .center
        nationalLeagueWinLabel.isAccessibilityElement = true
        nationalLeagueWinLabel.accessibilityTraits = .staticText
        nationalLeagueWinLabel.adjustsFontForContentSizeCategory = true
        nationalLeagueWinLabel.accessibilityIgnoresInvertColors = true
        nationalLeagueWinLabel.accessibilityIdentifier = "clubWins"
        return nationalLeagueWinLabel
    }()
    
    // MARK: - LIFE CYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.accessibilityIgnoresInvertColors = true
    }
    
    // MARK: - PUBLIC FUNCTIONS -
    func configureVC(team: TeamEntity) {
        setupAccessibilities(team: team)
        setupVC(team: team)
    }
}

// MARK: - PRIVATE FUNCTIONS -
extension ClubDetailViewController {
    private func setupAccessibilities(team: TeamEntity) {
        accessibilityLabel = team.name
        accessibilityHint = "Double tap to enter the \(team.name) details"
        clubImageView.accessibilityLabel = team.name
        DescriptionLabel.accessibilityLabel = team.description
        nationalLeagueWinLabel.accessibilityLabel = "\(team.name) have been champion of national league \(team.nationalLeagueWinsCount) times"
    }
    
    private func setupVC(team: TeamEntity) {
        nationalLeagueWinLabel.text = "national league wins: \(team.nationalLeagueWinsCount)"
        DescriptionLabel.text = team.description
        clubImageView.downloaded(from: team.imageDetailUrl, contentMode: .scaleAspectFill)
    }
}

// MARK: - PRIVATE FUNCTIONS -
extension ClubDetailViewController {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(clubImageView)
        view.addSubview(DescriptionLabel)
        view.addSubview(nationalLeagueWinLabel)
        NSLayoutConstraint.activate([
            // MARK: - CLUB IMAGE VIEW CONTRAINTS -
            clubImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            clubImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            clubImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            clubImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            
            // MARK: - NATIONAL LEAGUE WINS LABEL CONTRAINTS -
            nationalLeagueWinLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nationalLeagueWinLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nationalLeagueWinLabel.topAnchor.constraint(equalTo: clubImageView.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            nationalLeagueWinLabel.heightAnchor.constraint(equalToConstant: 30),
            
            // MARK: - DESCRIPTION LABEL CONTRAINTS -
            DescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            DescriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            DescriptionLabel.topAnchor.constraint(equalTo: nationalLeagueWinLabel.safeAreaLayoutGuide.bottomAnchor, constant: 16),
        ])
    }
}
