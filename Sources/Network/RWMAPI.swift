//
//  RWMAPI.swift
//  RWM
//
//  Created by 김수완 on 2021/10/26.
//  Copyright © 2021 com.6hc. All rights reserved.
//

import Moya
import KeychainSwift

enum RWMAPI {
    // Auth
    case kakaoLogin(kakaosTocken: String)

    // Running
    case generateRunning(
        isPrivateRoom: Bool,
        distance: Int,
        limitMinutes: Int,
        limitUserCounts: Int,
        isFreeMode: Bool
    )
    case joinRunning(
        inviteCode: String,
        runningId: Int
    )
    case lookupPartipant(runningId: Int)
}

extension RWMAPI: TargetType {

    var baseURL: URL {
        return URL(string: "http://3.34.1.228")!
    }

    var path: String {
        switch self {
        case .kakaoLogin:
            return "/api/user/v1/token"
        case .generateRunning:
            return "/api/running/v1"
        case .joinRunning:
            return "/api/running/v1/participation"
        case .lookupPartipant(let runningId):
            return "/api/running/v1/\(runningId)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .kakaoLogin, .generateRunning, .joinRunning:
            return .post
        case .lookupPartipant:
            return .get
        }
    }

    var task: Task {
        switch self {

        case .kakaoLogin(let kakaosTocken):
            return .requestParameters(parameters: [
                "access_token": kakaosTocken,
                "category": "kakao"
            ], encoding: JSONEncoding.default)

        case .generateRunning(
            let isPrivateRoom,
            let distance,
            let limitMinutes,
            let limitUserCounts,
            let isFreeMode
        ):
            return .requestParameters(parameters: [
                "category": isPrivateRoom ? "private" : "public",
                "config": [
                    "distance": distance,
                    "limit_minutes": limitMinutes,
                    "limit_user_counts": limitUserCounts
                ],
                "mode": isFreeMode ? "free" : "competition"
            ], encoding: JSONEncoding.default)
            
        case .joinRunning(
            let inviteCode,
            let runningId
        ):
            return .requestParameters(parameters: [
                "invite_code": inviteCode,
                "running_id": runningId
            ], encoding: JSONEncoding.default)
            
        default:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return [:]
    }

    var validationType: ValidationType {
        return .successAndRedirectCodes
    }

}
