//
//  AppHandlerNavigation.swift
//  Pokedex
//
//  Created by Norman Sánchez on 25/03/26.
//

import SwiftUI
internal import Combine

@MainActor
final class AppHandlerNavigation: ObservableObject {
    enum State: Equatable {
        case loading
        case successListPokemon
    }
    
    @Published private(set) var state: State = .loading
    
    private var didLoad = false
    init() {
        
    }
}
