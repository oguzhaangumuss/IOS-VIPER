//
//  Interactor.swift
//  CryptoViper
//
//  Created by Oğuzhan Gümüş on 7.02.2024.
//

import Foundation
//Talks to --> presenter
//Class , Protocol

protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
    
    func downloadCryptos()
}
class CryptoInteractor : AnyInteractor{
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data
            //clearing data data [weak self] after usege
            , response, error in
            guard let data = data , error == nil else {
                 self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetowkError.NetworkFailed))
                return
            }
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            } catch {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetowkError.ParsingFailed))
                
            }
        }
        task.resume()
        
    }
}
