//
//  QuoteViewModel.swift
//  ECS198F003-Assignment4
//
//  Created by Moises Lopez on 5/20/22.
//

import Foundation

class QuoteViewModel:ObservableObject {
    @Published var quotes: [Quote] = []
    
    func loadQuotes() async {
        guard let result = await QuoteAPIService.getQuotes() else {return}
        quotes = result
    }
}
