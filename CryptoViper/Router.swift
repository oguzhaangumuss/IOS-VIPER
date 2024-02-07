//
//  Router.swift
//  CryptoViper
//
//  Created by Oğuzhan Gümüş on 7.02.2024.
//

import Foundation
import UIKit
// Talks to -->
// Class , Protool
// EntryPoint
//setup every component here to orchestrate and route the application

typealias EntryPoint = AnyView & UITableViewController

protocol AnyRouter {
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class CryptoRouter : AnyRouter {
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
            
            let router = CryptoRouter()
            
            var view : AnyView = CrpytoViewController()
            var presenter : AnyPresenter = CryptoPresenter()
            var interactor : AnyInteractor = CryptoInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            
            interactor.presenter = presenter
            
            router.entry = view as? EntryPoint
            
            return router
    }
    
    
}
