//
//  NetworkManager.swift
//  TailorHelper
//
//  Created by Hanh Vu on 2023/09/23.
//

import Foundation

final class NetworkManager {
    private var apiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist") else {
                fatalError("Couldn't find file 'Config.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let apiKey = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'TMDB-Info.plist'.")
            }
            return apiKey
        }
    }
    
    private var orgId: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist") else {
                fatalError("Couldn't find file 'Config.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let orgId = plist?.object(forKey: "ORGANISATION_ID") as? String else {
                fatalError("Couldn't find key 'ORGANISATION_ID' in 'Config.plist'.")
            }
            return orgId
        }
    }
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://platform.bodygram.com/api/"
    
    private init() {
    }
}
