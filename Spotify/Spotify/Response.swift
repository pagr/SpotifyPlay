//
//  Response.swift
//  Santander Mobile App Sweden
//
//  Created by Paul Griffin on 2017-01-31.
//  Copyright © 2017 Santander. All rights reserved.
//

import Foundation

//Class for handling errors. Especially good for asynchronous tasks
enum Response<T> {
    case success(T)
    case error(Error)
    
    var isSuccess:Bool{
        get{
            if case .success(_) = self{
                return true
            }
            return false
        }
    }
    var isError:Bool{
        get{ return !isSuccess }
    }
    
    var successValue:T?{
        get{
            if case .success(let value) = self{
                return value
            }
            return nil
        }
    }
    
    var errorValue:Error?{
        get{
            if case .error(let error) = self{
                return error
            }
            return nil
        }

    }
    
    //Applicerar en transform om success annars inte.
    func map<G>(_ transform: (T) -> G) -> Response<G> {
        switch self {
        case .success(let value):
            return .success(transform(value))
        case .error(let error):
            return .error(error)
        }
        
    }
    
    static func flatten<T>(_ response: Response<Response<T>>) -> Response<T> {
        switch response {
        case .success(let innerResponse):
            return innerResponse
        case .error(let error):
            return .error(error)
        }
    }
    
    func flatMap<G>(_ transform: (T) -> Response<G>) -> Response<G> {
        return Response.flatten(map(transform))
    }
}
