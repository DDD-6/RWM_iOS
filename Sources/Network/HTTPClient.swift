//
//  HTTPClient.swift
//  RWM
//
//  Created by 김수완 on 2021/10/26.
//  Copyright © 2021 com.6hc. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class HTTPClient {
    public static let shared = HTTPClient()
    private let provider = MoyaProvider<RWMAPI>()

    public func networking<T: Codable>(api: RWMAPI, model networkModel: T.Type) -> Single<T> {
        return provider.rx.request(api).map(T.self)
    }
}
