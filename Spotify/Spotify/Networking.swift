//
//  Networking.swift
//  Santander Mobile App Sweden
//
//  Created by Paul Griffin on 2017-01-30.
//  Copyright © 2017 Santander. All rights reserved.
//

import UIKit
//Various methods for getting information over http(s)
extension URL {
    
    func getData(url:URL, token:Token?, _ callback: @escaping (Response<Data>) -> Void) {
        sendData(url: url, token: token, method: "GET", json: nil, retryCount: 3, headers: [:], callback)
    }
    func sendData(url:URL, token:Token?, method: String, json:JSON?, retryCount: Int = 0, headers incomingHeaders:[String:String], _ callback: @escaping (Response<Data>) -> Void) {
        var headers = incomingHeaders
        if let token = token{
            headers["Authorization"] = "\(token.type) \(token.token)"
        }else{
            headers["Authorization"] = "Basic VW5pdGVkQXBwOnRvQmVEZWZpbmVk"
        }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        if let json = json {
            request.httpBody = try? json.rawData()
        }
        request.allHTTPHeaderFields = headers
        request.httpMethod = method
        request.timeoutInterval = 100
        
        let dataTask = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            
            if let response = response as? HTTPURLResponse
                , response.statusCode == 401/*NOT AUTHORIZED*/ {
                
                if token != nil {
                    //No callback since not logged in
                    
                    return
                }
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode == 503 && retryCount > 0{
                return self.sendData(url: url, token: token, method: method, json: json, retryCount: retryCount - 1, headers: headers, callback)
            } else if let response = response as? HTTPURLResponse
                , !(200..<300).contains(response.statusCode){
                if let data = data{
                    print("Response code: \(response.statusCode)")
                    //return callback(.error(self.errorFromJson(data: data)))
                }else{
                    //return callback(.error(KnownError.ParseError.error))
                }
                return callback(.error(NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Could not parse data from server"])))
            }else if let data = data {
                return callback(.success(data))
            } else if let error = error {
                return callback(.error(error))
            } else {
                return callback(.error(NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Could not parse data from server"])))
            }
        })
        dataTask.resume()
    }
    
    func putJson(url:URL, token:Token?, json:JSON, _ callback: @escaping (Response<JSON>) -> Void) {
        sendJson(url: url, token: token, method: "PUT", json: json, callback)
    }
    func postJson(url:URL, token:Token?, json:JSON, _ callback: @escaping (Response<JSON>) -> Void) {
        sendJson(url: url, token: token, method: "POST", json: json, callback)
    }
    func getJson(url:URL, token:Token?, _ callback: @escaping (Response<JSON>) -> Void) {
        sendJson(url: url, token: token, method: "GET", json: nil, retryCount: 3, callback)
    }
    func deleteJson(url:URL, token:Token?, _ callback: @escaping (Response<JSON>) -> Void) {
        sendJson(url: url, token: token, method: "DELETE", json: nil, callback)
    }
    func sendJson(url:URL, token:Token?, method:String, json:JSON?, retryCount: Int = 0, _ callback: @escaping (Response<JSON>) -> Void) {
        
        let headers = [
            "Accept":"application/json",
            "Content-Type":"application/json"]
        
        sendData(url: url, token: token, method:method, json: json, retryCount: retryCount, headers: headers) {
            callback($0.flatMap { data in
                do {
                    var tmp = String(data:data, encoding: .utf8)
                    let rawJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
                    let json = JSON(object: rawJSON)
                    
                    return .success(json)
                    
                } catch (let error){
                    return .error(error)
                }
            })
        }
    }
}

extension String{
    var percentEncoded:String?{
        get{
            return self.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        }
    }
}

struct Token {
    let type:String
    let token: String
}
