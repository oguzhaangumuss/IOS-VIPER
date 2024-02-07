//
//  Router.swift
//  CryptoViper
//
//  Created by Oğuzhan Gümüş on 7.02.2024.
//

import Foundation
// Talks to -->
// Class , Protool
// EntryPoint

protocol AnyRouter {
    static func startExecution() -> AnyRouter
}
class CryptoRouter : AnyRouter {
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        return router
    }
    
    
}
