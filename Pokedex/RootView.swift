//
//  RootView.swift
//  Pokedex
//
//  Created by Norman Sánchez on 25/03/26.
//

import SwiftUI
import pokemon_presentation

struct RootView: View {
    @State private var router = AppRouter()
    
    let dependencies: AppDIContainer
    
    init(dependencies: AppDIContainer) {
        self.dependencies = dependencies
    }
    
    var body: some View {
        navigationStack {
            HomeScreen(
                viewModel: dependencies.homeViewModel,
                onEffect: router.handleOnSelectedPokemonEffect
            )
        }
    }
    
    @ViewBuilder
    private func navigationStack<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
        NavigationStack(path: $router.path) {
            content()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .pokemonDetail(pokemon: let pokemon):
                        //PokemonDetailView(pokemon)
                        EmptyView()
                    }
                }
        }
    }
    
    
}
