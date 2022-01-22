//
//  UIViewController + Extension.swift
//  iChat
//
//  Created by Pavel Olegovich on 22.01.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func configure<T: SelfConfiguringCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as? T else { fatalError("Unable do dequeue \(cellType)")}
            cell.configure(with: value)
            return cell
    }
}
