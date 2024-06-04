//
//  CharacterCard.swift
//  NarutoApp
//
//  Created by Egemen Öngel on 25.05.2024.
//

import SwiftUI
import Kingfisher

struct CharacterCard: View {
    let character: CharacterModel
    let vm: CharactersViewModel
    var body: some View {

        ZStack {
            let url = character.images?.first ?? ""
            ImageLoader(url: url,
                        width: UIScreen.screenWidth,
                        height: 250
            )
            VStack {
                Spacer()
                Text(character.name ?? "Unknown")
                    .frame(maxWidth: .infinity, maxHeight: 20)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.051, brightness: 0.175, opacity: 0.36))
                    .foregroundStyle(Color.theme.secondaryTextColor)
            }
            .shadow(radius: 5)
            .onAppear {
                if character == vm.allCharacters.last {
                    vm.getCharacters()
                }
            }
        }
        .frame(width: UIScreen.screenWidth, height: 250)

    }
}

struct CharacterCard_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCard(character: dev.character, vm: dev.vm)
            .environmentObject(dev.vm)
            .previewLayout(.sizeThatFits)
    }
}


