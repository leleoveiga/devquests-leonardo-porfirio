//
//  ListViewTableViewCell.swift
//  GitHubApp
//
//  Created by Leonardo Veiga de Medeiros Porfírio on 31/10/22.
//

import Foundation
import UIKit

class ListViewCell: UITableViewCell {
    var repository: Repository? {
        didSet {
            getImageFrom(url: repository?.owner.avatarURL ?? "", { image in
                self.repositoryImage.image = image
            })
            repositoryNameLabel.text = repository?.name
            repositoryOwnerUsernameLabel.text = repository?.owner.login
        }
    }
    
    private let repositoryNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let repositoryOwnerUsernameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private let imageSize: CGFloat = 50
    private lazy var repositoryImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(systemName: "person"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = imageSize / 2
        return imgView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupSubviews()
        setupConstraints()
    }
    

    func setupSubviews() {
        addSubview(repositoryImage)
        addSubview(repositoryNameLabel)
        addSubview(repositoryOwnerUsernameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            repositoryNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            repositoryNameLabel.bottomAnchor.constraint(equalTo: repositoryOwnerUsernameLabel.topAnchor, constant: -5),
            repositoryNameLabel.leadingAnchor.constraint(equalTo: repositoryImage.trailingAnchor),
            repositoryNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            repositoryOwnerUsernameLabel.topAnchor.constraint(equalTo: repositoryNameLabel.bottomAnchor),
            repositoryOwnerUsernameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            repositoryOwnerUsernameLabel.leadingAnchor.constraint(equalTo: repositoryNameLabel.leadingAnchor),
            repositoryOwnerUsernameLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor),
            
            repositoryImage.widthAnchor.constraint(equalToConstant: imageSize),
            repositoryImage.heightAnchor.constraint(equalToConstant: imageSize),
            repositoryImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            repositoryImage.trailingAnchor.constraint(equalTo: repositoryNameLabel.leadingAnchor, constant: -15),
            repositoryImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListViewCell {
    func getImageFrom(url: String, _ completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let imageData = data, let image = UIImage(data: imageData) else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
}
