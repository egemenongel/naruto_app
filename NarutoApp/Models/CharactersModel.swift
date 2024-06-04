//
//  CharacterModel.swift
//  NarutoApp
//
//  Created by Egemen Öngel on 24.05.2024.
//

import Foundation

// MARK: - Characters

struct CharactersModel: Codable {
    let characters: [CharacterModel]?
}

// MARK: - Character
struct CharacterModel: Codable, Identifiable {
    let id: Int?
    let name: String?
    let images: [String]?
    let debut: Debut?
    let jutsu: [String]?
    let personal: Personal?
    let rank: Rank?
    let voiceActors: VoiceActors?
}

// MARK: - Debut
struct Debut: Codable {
    let anime, appearsIn: String?
}

// MARK: - Personal
struct Personal: Codable {
    let sex, affiliation, clan: String?
}

// MARK: - Rank
struct Rank: Codable {
    let ninjaRank: NinjaRank?
}

// MARK: - NinjaRank
struct NinjaRank: Codable {
    let borutoManga: String?
}

// MARK: - VoiceActors
struct VoiceActors: Codable {
    let japanese: String?
}
