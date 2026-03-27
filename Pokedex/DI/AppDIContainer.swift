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
    // MARK: - Use cases
    let fetchPokemonListUseCase: FetchPokemonListUseCase
    let getPokemonDetailsUseCase: GetPokemonDetailsUseCase
    
    // MARK: - View models
    let homeViewModel: HomeViewModel
    let pokemonDetailsViewModel: PokemonDetailsViewModel

    // MARK: - Init function
    init(fetchPokemonListUseCase: FetchPokemonListUseCase, getPokemonDetailsUseCase: GetPokemonDetailsUseCase) {
        self.fetchPokemonListUseCase = fetchPokemonListUseCase
        self.getPokemonDetailsUseCase = getPokemonDetailsUseCase
        self.homeViewModel = HomeViewModel(fetchPokemonListUseCase: fetchPokemonListUseCase)
        self.pokemonDetailsViewModel = PokemonDetailsViewModel(getPokemonDetailsUseCase: getPokemonDetailsUseCase)
    }

    // MARK: - Go live App DI Container
    static func live() -> AppDIContainer {
        let fetcher = PokemonAPIStoreImpl()
        let pokemonRepository = PokemonRepositoryImpl(api: fetcher)
        let fetchPokemonListUseCase = FetchPokemonListUseCaseImpl(pokemonRepository: pokemonRepository)
        let getPokemonDetailsUseCase = GetPokemonDetailsUseCaseImpl(pokemonRepository: pokemonRepository)

        return AppDIContainer(fetchPokemonListUseCase: fetchPokemonListUseCase, getPokemonDetailsUseCase: getPokemonDetailsUseCase)
    }
}
