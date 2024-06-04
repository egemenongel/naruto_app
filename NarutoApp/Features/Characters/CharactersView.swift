//
//  CharactersView.swift
//  NarutoApp
//
//  Created by Egemen Öngel on 24.05.2024.
//

import SwiftUI

struct CharactersView: View {

    @EnvironmentObject private var vm: CharactersViewModel

    var body: some View {
        NavigationStack{
                List { ForEach(vm.allCharacters){
                character in
                        CharacterCard(character: character, vm: vm)
                }
            }
        }
        .navigationTitle("Characters")
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
            .environmentObject(dev.vm)
    }
}


