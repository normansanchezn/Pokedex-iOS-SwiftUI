//
//  AppDIContainer.swift
//  Pokedex
//
//  Created by Norman Sánchez on 25/03/26.
//

import Foundation
import pokemon_domain
import pokemon_data
import pokemon_presentation

struct AppDIContainer {
    let fetchPokemonListUseCase: FetchPokemonListUseCase
    let homeViewModel: HomeViewModel

    init(fetchPokemonListUseCase: FetchPokemonListUseCase) {
        self.fetchPokemonListUseCase = fetchPokemonListUseCase
        self.homeViewModel = HomeViewModel(fetchPokemonListUseCase: fetchPokemonListUseCase)
    }

    static func live() -> AppDIContainer {
        let fetcher = PokemonAPIFetcherImpl()
        let pokemonRepository = PokemonRepositoryImpl(api: fetcher)
        let fetchPokemonListUseCase = FetchPokemonListUseCaseImpl(pokemonRepository: pokemonRepository)

        return AppDIContainer(fetchPokemonListUseCase: fetchPokemonListUseCase)
    }
}
