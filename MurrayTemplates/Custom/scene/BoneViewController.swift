//
//  {{name|firstUppercase}}ViewController.swift
//  App
//
//  Created by {{ username }} - {{ userEmail }}.
//  Copyright © 2019 {{ username }}. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class {{name|firstUppercase}}ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "{{name|uppercase}}"
        self.collectionView.delegate = self
        let items: Observable<[CollectionItem]> = DataManager.schedule().map { $0 }
        self.reload(items: items)
    }
    
    func reload(items: Observable<[CollectionItem]>) {
        
        disposeBag = DisposeBag()
        collectionView.rx
            .bind(to: items)
            .disposed(by: disposeBag)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2.0
        return CGSize(width: width , height: width / 2.0)
    }
}

