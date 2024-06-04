//
//  NarutoAppApp.swift
//  NarutoApp
//
//  Created by Egemen Öngel on 24.05.2024.
//

import SwiftUI
import Kingfisher

@main
struct NarutoAppApp: App {
    @StateObject private var viewModel = CharactersViewModel()
    init()  {    
        let downloader = KingfisherManager.shared.downloader
        downloader.downloadTimeout = 15.0
      
    }
    var body: some Scene {
        WindowGroup {
       
            HomeView()
        }
    }
}
