//
//  Presenter.swift
//  CryptoViper
//
//  Created by Oğuzhan Gümüş on 7.02.2024.
//

import Foundation
// Talks to -> interactor , router , view
// Class , protocol

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result : Result<[Crypto],Error>)
    
}
class CryptoPresenter : AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            print(cryptos)
            //update view
        case .failure(let error):
            print(error)
        }
    }
    
    
}
