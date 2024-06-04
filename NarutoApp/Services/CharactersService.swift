//
//  CharactersService.swift
//  NarutoApp
//
//  Created by Egemen Öngel on 24.05.2024.
//

import Foundation
import Combine

class CharactersService{

    @Published var allCharacters: [CharacterModel] = []

    var characterSubscription: AnyCancellable?
    init(){
        getCoins()
    }

    func getCoins(){
        guard let url = URL(string: "https://narutodb.xyz/api/character")
        else { return }

        let request = URLRequest(url: url)

        characterSubscription = NetworkingManager.get(urlRequest: request)
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] (data) in
                if let responseString = String(data: data, encoding: .utf8) {
                    
                }
                do {
                    let decodedData = try JSONDecoder().decode(CharactersModel.self, from: data)
                    self?.allCharacters = decodedData.characters ?? []
                } catch {
                    print("Decoding error: \(error)")
                }
            }

    }
}
