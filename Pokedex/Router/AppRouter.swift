//
//  AppRouter.swift
//  Pokedex
//
//  Created by Norman Sánchez on 25/03/26.
//

import SwiftUI
import pokemon_presentation
import pokemon_shared

@Observable
final class AppRouter {
    var path = NavigationPath()
    
    func handleOnSelectedPokemonEffect(_ effect: OnPokemonSelectedEffect) {
        switch effect {
        case .pokemonSelected(pokemonIDSelected: let pokemonID):
            path.append(AppRoute.pokemonDetail(pokemonID: pokemonID))
        }
    }
}
