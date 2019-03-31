//
//  Show.swift
//  App
//
//  Created by Stefano Mondino on 30/03/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import Foundation

struct Show: Codable {
    
    struct Picture: Codable {
        var medium: String
        var original: String
    }
    
    let image: Picture?
    let name: String
}


