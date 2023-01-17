//
//  HomeController.swift
//  SpotifyApp
//
//  Created by Kaan Yalçınkaya on 6.01.2023.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    let menuBar = MenuBar()
    let playListCellId = "playListId"
    let music: [[Track]] = [playlists, artists, albums]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PlaylistCell.self, forCellWithReuseIdentifier: playListCellId)
        cv.backgroundColor = .spotifyBlack
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let colors: [UIColor] = [.systemRed, .systemBlue, .systemTeal]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .spotifyBlack
        menuBar.delegate = self
        
        layout()
    }
    
    func layout() {
        
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menuBar)
        view.addSubview(collectionView)
        
        menuBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(42)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(menuBar.snp.bottom).offset(2)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        
        
    }
}
