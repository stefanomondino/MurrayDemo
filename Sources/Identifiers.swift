//
//  Identifiers.swift
//  App
//
//  Created by Stefano Mondino on 30/03/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import Foundation
import UIKit

protocol Identifier {
    var id: String { get }
}
extension String {
    func firstUppercased() -> String {
        return self.prefix(1).uppercased() + self.dropFirst()
    }
}

struct Identifiers {
    
    enum Cells: String, Identifier {
        
        var id: String {
            return rawValue.firstUppercased() + "CollectionViewCell"
        }
        
        var nib: UINib {
            return UINib(nibName: self.id, bundle: nil)
        }
        case mainShow
        //CELLS PLACEHOLDER
    }
    
    enum Scenes: String, Identifier {
        
        var id: String {
            return rawValue.firstUppercased() + "ViewController"
        }
        
        var nib: UINib {
            return UINib(nibName: self.id, bundle: nil)
        }
        
        func scene() -> UIViewController {
            let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
            if let classObject =  NSClassFromString(bundleName + "." + self.id) as? UIViewController.Type {
                    return classObject.init(nibName: id, bundle: nil)
            }
            return UIViewController()
        }
        
        case demo
        //SCENES PLACEHOLDER
    }
}
