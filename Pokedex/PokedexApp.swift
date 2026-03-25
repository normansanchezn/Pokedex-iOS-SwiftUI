//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Norman Sánchez on 24/03/26.
//

import SwiftUI
import pokemon_presentation

@main
struct PokedexApp: App {

    private let dependencies = AppDIContainer.live()
    var body: some Scene {
        WindowGroup {
            RootView(dependencies: dependencies)
        }
    }
}
