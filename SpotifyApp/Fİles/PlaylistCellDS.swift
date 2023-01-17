//
//  PlaylistCellDS.swift
//  SpotifyApp
//
//  Created by Kaan Yalçınkaya on 16.01.2023.
//

import Foundation
import UIKit

extension PlaylistCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let tracks = tracks else { return 0 }
        return tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trackCellId, for: indexPath) as! TrackCell
        cell.track = tracks?[indexPath.item]
        return cell
    }
}

extension PlaylistCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: trackCellHeight)
    }
}
