//
//  QuoteAPIService.swift
//  ECS198F003-Assignment4
//
//  Created by Moises Lopez on 5/20/22.
//

import Foundation

class QuoteAPIService {
    static let endpoint = "https://zenquotes.io/api/quotes"
    static func getQuotes() async -> Quotes? {
        guard let validResponse = URL(string:endpoint) else {
            print("invalid url")
            return nil
        } //when executed sucessfully it will return data or if errror it will return nill
        
        guard let (data, response) =  try? await URLSession.shared.data(from: validResponse) else {  return nil }
        //check status code from API response
        guard let httpResponseStatus = response as? HTTPURLResponse,
                httpResponseStatus.statusCode == 200  else { return nil}
        guard let dataResponse = try? JSONDecoder().decode(Quotes.self, from: data) else {return nil}
        return dataResponse
        

    }
}

//You must use try? when calling JSONDecoder().decode().

//You must use try-do-catch block on URLSession.shared.data() to catch and print the error if an error occurs.
