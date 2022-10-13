//
//  LoadingView.swift
//  GitHubApp
//
//  Created by Leonardo Veiga de Medeiros Porfírio on 12/10/22.
//

import Foundation
import UIKit

final class LoadingView: UIView {
    
    
    private var stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private var titleLabel: UILabel = {

        let label = UILabel()
        label.text = "Searching repositories..."
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private var loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        loadingIndicator.color = .black
        loadingIndicator.startAnimating()
        loadingIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        return loadingIndicator
    }()
    
    init() {
        super.init(frame: .zero)

        self.setupSubviews()
        self.setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        self.backgroundColor = .white

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(loadingIndicator)
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
    }
}

