//
//  MainShowCollectionViewCell.swift
//  App
//
//  Created by Stefano Mondino on 30/03/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainShowCollectionViewCell: UICollectionViewCell, CollectionCell {
    
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
