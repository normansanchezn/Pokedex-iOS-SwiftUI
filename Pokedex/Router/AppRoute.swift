//
//  AppRoute.swift
//  Pokedex
//
//  Created by Norman Sánchez on 25/03/26.
//

import pokemon_shared

enum AppRoute: Hashable {
    case pokemonDetail(pokemonID: Int)
    case goToSignUpView
    case goToEmailScreen
}
