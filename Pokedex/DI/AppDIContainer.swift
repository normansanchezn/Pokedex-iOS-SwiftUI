//
//  AppDIContainer.swift
//  Pokedex
//
//  Created by Norman Sánchez on 25/03/26.
//

import Foundation
import Supabase
import pokemon_domain
import pokemon_data
import pokemon_presentation

struct AppDIContainer {
    // MARK: - Use cases
    let fetchPokemonListUseCase: FetchPokemonListUseCase
    let getPokemonDetailsUseCase: GetPokemonDetailsUseCase
    let getPokemonUserUseCase: GetPokemonUserUseCase
    
    // MARK: - View models
    let homeViewModel: HomeViewModel
    let pokemonDetailsViewModel: PokemonDetailsViewModel
    let emailViewModel: EmailViewModel

    // MARK: - Init function
    init(
        fetchPokemonListUseCase: FetchPokemonListUseCase,
        getPokemonDetailsUseCase: GetPokemonDetailsUseCase,
        getPokemonUserUseCase: GetPokemonUserUseCase
    ) {
        self.fetchPokemonListUseCase = fetchPokemonListUseCase
        self.getPokemonDetailsUseCase = getPokemonDetailsUseCase
        self.getPokemonUserUseCase = getPokemonUserUseCase
        
        self.homeViewModel =
            HomeViewModel(fetchPokemonListUseCase: fetchPokemonListUseCase)
        self.pokemonDetailsViewModel =
            PokemonDetailsViewModel(getPokemonDetailsUseCase: getPokemonDetailsUseCase)
        self.emailViewModel = EmailViewModel()
    }

    // MARK: - Go live App DI Container
    static func live() -> AppDIContainer {
        let fetcher = PokemonAPIStoreImpl()
        // TODO: Replace with your actual Supabase URL and anon/public key
        let supabaseURLString = "https://azqdwgyakkawmswuyzpi.supabase.co"
        let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF6cWR3Z3lha2thd21zd3V5enBpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ2NDczMDcsImV4cCI6MjA5MDIyMzMwN30.e1ZJ1OExwtDJFi6Bfio4K8Ztnn8_kJFRDAYWfeTn6kA"

        guard let supabaseURL = URL(string: supabaseURLString) else {
            fatalError("Invalid Supabase URL: \(supabaseURLString)")
        }

        let supabaseClient = SupabaseClient(
            supabaseURL: supabaseURL,
            supabaseKey: supabaseKey
        )
        let pokemonRepository = PokemonRepositoryImpl(api: fetcher)
        let userRepository = UserRepositoryImpl(supabaseClient: supabaseClient)
        
        let fetchPokemonListUseCase =
            FetchPokemonListUseCaseImpl(pokemonRepository: pokemonRepository)
        let getPokemonDetailsUseCase =
            GetPokemonDetailsUseCaseImpl(pokemonRepository: pokemonRepository)
        let getPokemonUserUseCase =
            GetPokemonUserUseCaseImpl(userRepository: userRepository)

        return AppDIContainer(
            fetchPokemonListUseCase: fetchPokemonListUseCase,
            getPokemonDetailsUseCase: getPokemonDetailsUseCase,
            getPokemonUserUseCase: getPokemonUserUseCase
        )
    }
}

