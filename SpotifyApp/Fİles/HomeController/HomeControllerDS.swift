//
//  HomeControllerDS.swift
//  SpotifyApp
//
//  Created by Kaan Yalçınkaya on 13.01.2023.
//

import Foundation
import UIKit

extension HomeController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return music.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: playListCellId, for: indexPath) as! PlaylistCell
        cell.backgroundColor = colors[indexPath.item]
        cell.tracks = music[indexPath.item]
        return cell
    }
    
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
    
    //Görüntülenen içeriğin hangi sayfada olduğunu temsil eder. Daha sonra, bu değer kullanılarak "view.frame.width" ile bölünür ve elde edilen sonuç Int tipine dönüştürülür. Bu sayfanın index'ini temsil eder.
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
//        //Bu metod, belirtilen index'in menü öğesini seçer ve bu sayede menü barın görüntülenen sayfayla senkronize olmasını sağlar.
//        menuBar.selectItem(at: Int(index))
    }
    
    //Scrolling - Complex but beautiful
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.scrollIndicator(to: scrollView.contentOffset)
    }
}

extension HomeController: MenuBarDelegate {
    func didSelectItemAt(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: [], animated: true)
    }
    
    
}
