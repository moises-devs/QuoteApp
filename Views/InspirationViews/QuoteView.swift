//
//  QuoteView.swift
//  ECS198F003-Assignment4
//
//  Created by Moises Lopez on 5/20/22.
//

import SwiftUI

struct QuoteView: View {
    @StateObject var quoteVM = QuoteViewModel()
    
    var body: some View {
        ScrollView {
            quoteFeed
        }
}
    
    var quoteFeed: some View {
            
            ScrollView {
                LazyVStack(spacing: 13) {
                    ForEach(quoteVM.quotes, id: \.self) { item in
                        quoteBuilder(for: item)
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 3, x: 2, y: 2)
                            .padding(.horizontal)
                    }
                }
        }.task {
            await quoteVM.loadQuotes()
        }
    }
    
    
    @ViewBuilder
    func quoteBuilder(for quote: Quote) -> some View {
        VStack {
            HStack {
                Text("\(quote.q)")
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            Spacer()
            HStack {
                Spacer()
                Text("\(quote.a)")
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.trailing)
            }
        }
        .textSelection(.enabled)
        .padding()
        .frame(maxHeight: 150)
        .background(Color.secondarySystemBackground)

    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
