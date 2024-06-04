//
//  PreviewProvider.swift
//  crashcourse
//
//  Created by Egemen Öngel on 7.10.2023.
//

import Foundation
import SwiftUI

extension PreviewProvider{

    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }

}

class DeveloperPreview{

    static let instance = DeveloperPreview()

    let vm = CharactersViewModel()
    private init() { }

    let character = CharacterModel(id: 1, name: "Char",
                                   images: ["https://static.wikia.nocookie.net/naruto/images/4/44/Amachi.png/revision/latest/scale-to-width-down/300?cb=20150528184924"],
                                   debut: Debut(anime: "Anime", appearsIn: "Episode #"),
                                   jutsu: ["Jutsu 1", "Justu 2"],
                                   rank:Rank(ninjaRank: NinjaRank(borutoManga: "Ninja Rank")))
}
