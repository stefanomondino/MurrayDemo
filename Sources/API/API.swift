//
//  API.swift
//  App
//
//  Created by Stefano Mondino on 30/03/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import Foundation
import Moya
import RxSwift

struct DataManager {
    static let provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin(verbose: true, cURL: true)])
    
    static let decoder: JSONDecoder = {
        return JSONDecoder()
    }()
    
    static func schedule() -> Observable<[Episode]> {
        return provider.rx
            .request(.schedule)
            .asObservable()
            .map([Episode].self, atKeyPath: nil, using: decoder, failsOnEmptyData: false )
            .debug()
    }
}

enum API {
    case schedule
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: "http://api.tvmaze.com")!
    }
    
    var path: String {
        switch self {
        case .schedule: return "schedule"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return Task.requestParameters(parameters: parameters, encoding: URLEncoding.methodDependent)
    }
    var parameters: [String: Any] {
        return [:]
    }
    var headers: [String : String]? {
        return nil
    }
    
    
}
