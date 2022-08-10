//
//  ViewModel.swift
//  Raffle
//
//  Created by Drayton Lavender on 8/10/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var model: Model
    
    init() {
        model = Model()
    }
}
