//
//  Quote.swift
//  ECS198F003-Assignment4
//
//  Created by Moises Lopez on 5/20/22.
//

import Foundation

struct Quote: Decodable, Hashable{
    let q, a, c, h:String
}

typealias Quotes = [Quote]
