//
//  ContentView.swift
//  NarutoApp
//
//  Created by Egemen Öngel on 24.05.2024.
//

import SwiftUI

struct HomeView: View {
    let columns = [GridItem(.flexible()),GridItem(.flexible())]
    @StateObject private var viewModel = CharactersViewModel()

    var body: some View {
        NavigationStack{
            VStack {
                LazyVGrid(columns: columns, pinnedViews: [], content: {
                    NavigationLink(destination: CharactersView().environmentObject(viewModel)) {
                        ZStack{
                            VStack(alignment: .leading){
                                ImageLoader(url: "https://narutodb.xyz/cards/characters.jpg",
                                            width: 150,
                                            height: 150
                                )

                            }
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            VStack{
                                Spacer()

                                Text("Characters")
                                    .background(Color(hue: 1.0, saturation: 0.038, brightness: 0.063, opacity: 0.318))
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 200)

                        }
                    }

                })
            }
            .padding()
        }
    }
}




#Preview {
    HomeView()
}
