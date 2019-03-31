//
//  Show.swift
//  App
//
//  Created by Stefano Mondino on 30/03/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import Foundation

struct ShowResult: Codable {

    var score: Int
    var show: Show
    
}

extension ShowResult: CollectionItem {
    
    var identifier: Identifiers.Cells { return .mainShow }
    var title: String { return show.name }
    var image: WithImage { return show.image?.original ?? "" }
}
