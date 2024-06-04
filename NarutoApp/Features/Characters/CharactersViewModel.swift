//
//  CharactersViewModel.swift
//  NarutoApp
//
//  Created by Egemen Öngel on 24.05.2024.
//

import Foundation
import Combine

class CharactersViewModel: ObservableObject{
    @Published var allCharacters: [CharacterModel] = []
    @Published var currentPage = 1
    @Published var isLoading = false


    private var cancellables = Set<AnyCancellable>()
    private let service = CharactersService()

    init(){
        getCharacters()
    }

    func getCharacters() {
        guard let url = URL(string: "https://narutodb.xyz/api/character?page=\(currentPage)&limit=20")
        else { return }
//        print(url.absoluteURL)
        var request = URLRequest(url: url)
            URLSession.shared.dataTaskPublisher(for: request)
                .subscribe(on: DispatchQueue.global(qos: .default))
               .map(\.data)
               .decode(type: CharactersModel.self, decoder: JSONDecoder())
               .receive(on: DispatchQueue.main)
               .sink(receiveCompletion: { [weak self] completion in
                   if case .failure(let error) = completion {
                       print("Error fetching data: \(error.localizedDescription)")
                   }
                   self?.isLoading = false
               }, receiveValue: { [weak self] response in
                   self?.allCharacters.append(contentsOf: response.characters ?? [])
                   self?.currentPage += 1
               })
               .store(in: &cancellables)
        }
}
