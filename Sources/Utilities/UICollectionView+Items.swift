//
//  UICollectionView+Items.swift
//  App
//
//  Created by Stefano Mondino on 30/03/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol CollectionItem {
    var identifier: Identifiers.Cells { get }
    var title: String { get }
    var image: WithImage { get }
}

extension CollectionItem {
    var nib: UINib {
        return UINib(nibName: identifier.id, bundle: nil)
    }
}

protocol CollectionCell: UICollectionViewCell {
    func set(item: CollectionItem)
}

extension Reactive where Base: UICollectionView {
    func bind(to items: Observable<[CollectionItem]>) -> Disposable {
        return items
            .asDriver(onErrorJustReturn: [])
            .drive(base.rx.items) { (collectionView, item, element) in
                collectionView.register(element.nib, forCellWithReuseIdentifier: element.identifier.id)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: element.identifier.id, for: IndexPath(item: item, section: 0))
                (cell as? CollectionCell)?.set(item: element)
                
                return cell
        }
    }
}
