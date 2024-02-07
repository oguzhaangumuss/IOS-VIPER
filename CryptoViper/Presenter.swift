//
//  Presenter.swift
//  CryptoViper
//
//  Created by Oğuzhan Gümüş on 7.02.2024.
//

import Foundation
// Talks to -> interactor , router , view
// Class , protocol

enum NetowkError : Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result : Result<[Crypto],Error>)
    
}
class CryptoPresenter : AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor?{
        didSet{
            interactor?.downloadCryptos()
        }
    }

    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            view?.update(with: cryptos)
            //update view
        case .failure( _):
            view?.update(with: "Try again later")
        }
    }
    
    
}
