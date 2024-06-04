//
//  CharacterModel.swift
//  NarutoApp
//
//  Created by Egemen Öngel on 24.05.2024.
//

import Foundation

// MARK: - Characters

struct CharactersModel: Codable, Equatable {
    let characters: [CharacterModel]?
}

// MARK: - Character
struct CharacterModel: Codable, Identifiable, Equatable {
    let id: Int?
    let name: String?
    let images: [String]?
    let debut: Debut?
    let jutsu: [String]?
//    let personal: Personal?
    let rank: Rank?
//    let voiceActors: VoiceActors?
}

// MARK: - Debut
struct Debut: Codable, Equatable {
    let anime, appearsIn: String?
}

// MARK: - Personal
//struct Personal: Codable {
//    let sex, affiliation, clan: String?
//}

// MARK: - Rank
struct Rank: Codable, Equatable {
    let ninjaRank: NinjaRank?
}

// MARK: - NinjaRank
struct NinjaRank: Codable, Equatable {
    let borutoManga: String?
}

// MARK: - VoiceActors
//struct VoiceActors: Codable {
//    let japanese: String?
//}
