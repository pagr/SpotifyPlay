//
//  CallbackCombiner.swift
//  Santander Mobile App Sweden
//
//  Created by Paul Griffin on 2017-03-21.
//  Copyright © 2017 Santander. All rights reserved.
//

import Foundation

class Combiner<A,B>{
    static func inSeries(a: ( @escaping (Response<A>) -> ()) -> (), b: @escaping ( @escaping (Response<B>) -> ()) -> (), callback: @escaping (Response<A>, Response<B>?) -> ()){
        a{  responseA in
            if responseA.isSuccess{
                b{ responseB in
                    callback(responseA, responseB)
                }
            } else {
                callback(responseA, nil)
            }
        }
    }
    
    static func inParallel(a: ( @escaping (Response<A>) -> ()) -> (), b: ( @escaping (Response<B>) -> ()) -> (), callback: @escaping (Response<(A,B)>) -> ()){
        assert(OperationQueue.current == OperationQueue.main)
        var responseA: Response<A>! = nil
        var responseB: Response<B>! = nil
        
        let onComlpete = {
            if let responseA = responseA,
                let responseB = responseB{
                switch (responseA, responseB) {
                case (.success(let a), .success(let b)):
                    callback(.success(a,b))
                case (.error(let error), _):
                    callback(.error(error))
                case (_, .error(let error)):
                    callback(.error(error))
                default:
                    assert(false, "This is here to make the compiler happy")
                }
            }
        }
        
        a({ (response) in
            OperationQueue.main.addOperation {
                responseA = response
                onComlpete()
            }
        })
        b({ response in
            OperationQueue.main.addOperation {
                responseB = response
                onComlpete()
            }
        })
    }
}
