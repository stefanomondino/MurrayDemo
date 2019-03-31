//
//  {{name | firstUppercase}}CollectionViewCell.swift
//  App
//
//  Created by {{ username }} - {{ userEmail }}.
//  Copyright © 2019 {{ username }}. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class {{name|firstUppercase}}CollectionViewCell: UICollectionViewCell, CollectionCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(item: CollectionItem) {
        
        disposeBag = DisposeBag()
        
        titleLabel.text = item.title
        
        item.image.getImage()
            .startWith(UIImage())
            .asDriver(onErrorJustReturn: UIImage())
            .drive(imageView.rx.image)
            .disposed(by: disposeBag)
    }
    
    
    
    
}
