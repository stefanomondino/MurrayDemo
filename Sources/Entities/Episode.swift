//
//  Show.swift
//  App
//
//  Created by Stefano Mondino on 30/03/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import Foundation

struct Episode: Codable {
    var name: String
    var show: Show
}

extension Episode: CollectionItem {
    var identifier: Identifiers.Cells { return .mainShow }
    var title: String { return name }
    var image: WithImage { return show.image?.original ?? "" }
}
