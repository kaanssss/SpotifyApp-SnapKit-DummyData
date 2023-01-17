//
//  PlaylistCell.swift
//  SpotifyApp
//
//  Created by Kaan Yalçınkaya on 13.01.2023.
//

import Foundation
import UIKit

let trackCellHeight: CGFloat = 72

class PlaylistCell: UICollectionViewCell {
    
    let trackCellId = "trackId"
    
    var tracks: [Track]?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TrackCell.self, forCellWithReuseIdentifier: trackCellId)
        cv.backgroundColor = .spotifyBlack
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}

struct Track {
    let imageName: String
    let title: String
    let artist: String
}

class TrackCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    
    var track: Track? {
        // "didSet" bloğu, "track" değişkeninin değeri değiştiğinde çalışan bir kod bloğudur. Yani, eğer "track" değişkeninin değeri değişirse (örneğin, başka bir sınıftan atama yapılır), o zaman "didSet" bloğu çalışır ve içindeki kod çalıştırılır.
        didSet {
            guard let track = track else { return }
            let image = UIImage(named: track.imageName) ?? UIImage(named: "placeholder")
            
            imageView.image = image
            titleLabel.text = track.title
            subtitleLabel.text = track.artist
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body).withTraits(traits: .traitBold)
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitleLabel.alpha = 0.7
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = makeStackView(axis: .vertical)
        stackView.spacing = 6
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        
        addSubview(imageView)
        addSubview(stackView)
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.width.equalTo(trackCellHeight)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(32)
        }
        
    }
    
}
