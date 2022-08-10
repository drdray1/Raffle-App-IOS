//
//  RaffleApp.swift
//  Raffle
//
//  Created by Drayton Lavender on 8/10/22.
//

import SwiftUI

@main
struct RaffleApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
