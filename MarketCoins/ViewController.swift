//
//  ViewController.swift
//  MarketCoins
//
//  Created by Maria on 20/07/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let dataProvider = ListCoinsDataProvider()
        dataProvider.delegate = self
        dataProvider.fetchListCoins(by: "brl", with: nil, orderBy: "market_cap_desc", total: 10, page: 1, percentagePrice: "1h")
    }
}

extension ViewController: ListCoinsDataProviderDelegate {
    
    func success(model: Any) {
        let coinsList = model as? [CoinModel]
        print(coinsList ?? "Vazio")
    }
    
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error) {
        print(error.localizedDescription)
    }

}
