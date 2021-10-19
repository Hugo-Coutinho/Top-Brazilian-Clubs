//
//  TableViewCell.swift
//  TopBrazilianClubs
//
//  Created by hugo.coutinho on 08/10/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - UI ATTRIBUTES -
    private lazy var teamView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 238/255, green: 247/255, blue: 253/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var DescriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.textAlignment = .center
        return descriptionLabel
    }()
    
//    private lazy var mainStarStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.distribution = .fill
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    
    
    // MARK: - OVERRIDE -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupComponents()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
        setupComponents()
    }
    
    private lazy var currentTeam: TeamEntity? = nil
    
    // MARK: - PUBLIC FUNCTIONS -
    func bindCell(team: TeamEntity) {
        currentTeam = team
        DescriptionLabel.text = team.description
        teamImageView.downloaded(from: team.clubLogoUrl, contentMode: .scaleToFill)
    }
}

// MARK: - UI -
extension TableViewCell {
//    private func bindStars(starCount: Int) {
//        let horizontalStarStackCount = Int(ceil(Double(starCount)/4))
//        [Int](1...horizontalStarStackCount).forEach { horizontalIndex in
//            let isLastHorizontalStack = horizontalIndex == horizontalStarStackCount
//            let starStackView = UIStackView()
//            starStackView.axis = .horizontal
//            starStackView.distribution = .fillEqually
//            starStackView.translatesAutoresizingMaskIntoConstraints = false
//            if isLastHorizontalStack {
//                let value = (4*horizontalStarStackCount) - starCount
//                let lastStarsCount = value == 0 ? 4 : value
//                [Int](1...lastStarsCount).forEach { _ in
//                    guard let starImage = UIImage(named: "star") else { return }
//                    let singleStarImageView = UIImageView(image: starImage)
//                    let singleStarView = UIView()
//                    singleStarView.addSubview(singleStarImageView)
//                    starStackView.addArrangedSubview(singleStarView)
//                    NSLayoutConstraint.activate([
//                        singleStarImageView.leadingAnchor.constraint(equalTo: singleStarView.safeAreaLayoutGuide.leadingAnchor),
//                        singleStarImageView.trailingAnchor.constraint(equalTo: singleStarView.safeAreaLayoutGuide.trailingAnchor),
//                        singleStarImageView.bottomAnchor.constraint(lessThanOrEqualTo: singleStarView.safeAreaLayoutGuide.bottomAnchor),
//                        singleStarImageView.topAnchor.constraint(equalTo: singleStarView.safeAreaLayoutGuide.topAnchor),
//                    ])
//                }
//                guard lastStarsCount != 4 else { return }
//                starStackView.distribution = .fillProportionally
//            } else {
//                [Int](0...3).forEach { _ in
//                    guard let starImage = UIImage(named: "star") else { return }
//                    let singleStarImageView = UIImageView(image: starImage)
//                    let singleStarView = UIView()
//                    singleStarView.addSubview(singleStarImageView)
//                    starStackView.addArrangedSubview(singleStarView)
//                    NSLayoutConstraint.activate([
//                        singleStarImageView.leadingAnchor.constraint(equalTo: singleStarView.safeAreaLayoutGuide.leadingAnchor),
//                        singleStarImageView.trailingAnchor.constraint(equalTo: singleStarView.safeAreaLayoutGuide.trailingAnchor),
//                        singleStarImageView.bottomAnchor.constraint(lessThanOrEqualTo: singleStarView.safeAreaLayoutGuide.bottomAnchor),
//                        singleStarImageView.topAnchor.constraint(equalTo: singleStarView.safeAreaLayoutGuide.topAnchor),
//                    ])
//                }
//            }
//            mainStarStackView.addArrangedSubview(starStackView)
//        }
//    }
    
    private func setupComponents() {
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(teamView)
        teamView.addSubview(teamImageView)
        contentView.addSubview(DescriptionLabel)
//        contentView.addSubview(starCollectionViewCell)
//
//        DescriptionLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
//        starCollectionViewCell.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
//        DescriptionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
//        starCollectionViewCell.setContentHuggingPriority(.defaultLow, for: .vertical)
//
//        NSLayoutConstraint.activate([
            // MARK: - TEAM IMAGE VIEW CONTRAINTS -
//            teamView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
//            teamView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
//            teamView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
//            teamView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.6),
//
//            // MARK: - TEAM IMAGE VIEW CONTRAINTS -
//            teamImageView.topAnchor.constraint(equalTo: teamView.safeAreaLayoutGuide.topAnchor, constant: 8),
//            teamImageView.bottomAnchor.constraint(equalTo: teamView.safeAreaLayoutGuide.bottomAnchor, constant: -8),
//            teamImageView.leadingAnchor.constraint(equalTo: teamView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
//            teamImageView.trailingAnchor.constraint(equalTo: teamView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
//
//            // MARK: - DESCRIPTION CONTRAINTS -
//            DescriptionLabel.leadingAnchor.constraint(equalTo: teamView.safeAreaLayoutGuide.trailingAnchor, constant: 8),
//            DescriptionLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            DescriptionLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
//
//            // MARK: - STAR COLLECTIONVIEW CONTRAINTS -
//            starCollectionViewCell.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
//            starCollectionViewCell.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            starCollectionViewCell.topAnchor.constraint(equalTo: DescriptionLabel.safeAreaLayoutGuide.bottomAnchor, constant: 8),
//            starCollectionViewCell.leadingAnchor.constraint(equalTo: teamView.safeAreaLayoutGuide.trailingAnchor, constant: 8),

            
//            // MARK: - STAR STACKVIEW CONTRAINTS -
//            mainStarStackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
//            mainStarStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            mainStarStackView.topAnchor.constraint(equalTo: DescriptionLabel.safeAreaLayoutGuide.bottomAnchor, constant: 8),
//            mainStarStackView.leadingAnchor.constraint(equalTo: teamView.safeAreaLayoutGuide.trailingAnchor, constant: 8),
//            mainStarStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        
            
            // MARK: - MAIN VIEW CONTRAINTS -
            //            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            //            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            //            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            // MARK: - MAIN STACK VIEW CONTRAINTS -
            //            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 4),
            //            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            //            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -8),
            //            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -4),
            
            // MARK: - BUTTON CONTRAINTS -
            //            reloadButton.centerYAnchor.constraint(equalTo: walletBalanceView.centerYAnchor),
            //            reloadButton.trailingAnchor.constraint(equalTo: walletBalanceView.trailingAnchor, constant: -14),
            //            reloadButton.heightAnchor.constraint(equalToConstant: 20),
            //            reloadButton.widthAnchor.constraint(equalToConstant: 25),
            
            // MARK: - BOTTOM LINE CONTRAINTS -
            //            bottomLineView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            //            bottomLineView.heightAnchor.constraint(equalToConstant: 0.5),
            //            bottomLineView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 16),
//        ])
    }
}
