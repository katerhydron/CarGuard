//
//  NetworkManager.swift
//  AutoTracker
//
//  Created by Kamil Kwiatkowski on 19/09/2017.
//  Copyright © 2017 Dignital. All rights reserved.
//

import UIKit

/// This define the type of HTTP method used to perform the request
public enum HTTPMethod: String {
    case post   = "POST"
    case put    = "PUT"
    case get    = "GET"
    case delete = "DELETE"
    case patch  = "PATCH"
}

public enum APIPath: String {
    case positions  = "positions"
    case devices    = "devices"
}

protocol NetworkProtocol {
    func didFailedRequest()
    
    func didReceived(positions : Data?)
    func didReceived(devices : Data?)
}

struct NetworkConstants {
    static let kHostUrl = "http://gps.easy-wifi.pl:8082/api/"
    static let kPositions = "positions"
    static let kDevices = "devices"
    
    static let kUsername = "kwikam@gmail.com"
    static let kPassword = "welcome2gps"
}

class NetworkManager: NSObject {
    
    static let sharedInstance = NetworkManager()
    var delegate : NetworkProtocol?
    
    func fetchPositions() {
        let url = self.urlWithPath(path: APIPath.positions.rawValue)
        fetchDataFromUrl(url)
    }
    
    func fetchDevices() {
        let url = self.urlWithPath(path: APIPath.devices.rawValue)
        fetchDataFromUrl(url)
    }
    
    func fetchDataFromUrl(_ url : URL) {
        let session = URLSession(configuration: self.sessionConfiguration(username: NetworkConstants.kUsername, password: NetworkConstants.kPassword))
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.delegate?.didFailedRequest()
                return
            }
            if url.lastPathComponent == APIPath.positions.rawValue {
                self.delegate?.didReceived(positions: data)
            } else if url.lastPathComponent == APIPath.devices.rawValue {
                self.delegate?.didReceived(devices: data)
            }
        }
        task.resume()
    }
    
    private func urlWithPath(path : String) -> (URL) {
        return URL(string:NetworkConstants.kHostUrl + path)!
    }
    
    private func sessionConfiguration(username : String, password : String) -> URLSessionConfiguration {
        let sesssionConfiguration = URLSessionConfiguration.default
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        let authString = "Basic \(base64LoginString)"
        sesssionConfiguration.httpAdditionalHeaders = ["Authorization" : authString]
        
        return sesssionConfiguration
    }
}
