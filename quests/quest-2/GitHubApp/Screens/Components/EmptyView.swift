//
//  EmptyView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 01/08/22.
//

import Foundation
import UIKit

final class EmptyView: UIView {

    private var stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private var titleLabel: UILabel = {

        let label = UILabel()
        label.text = "No repositories found"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()

    private var subtitleLabel: UILabel = {

        let label = UILabel()
        label.text = "Search for users to see their public repositories here!"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private var searchButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Search", for: .normal)
        return button
    }()
    
    init() {
        
        super.init(frame: .zero)

        self.configureSubviews()
        self.configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        
        self.backgroundColor = .white

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(searchButton)
        addSubview(stackView)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
    }
    
}
