//
//  ContentView.swift
//  Raffle
//
//  Created by Drayton Lavender on 8/10/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel

    @State private var newRaffleParticipant: String = ""
    @State private var showResetAlert: Bool = false
    
    private let colorTheme: Color = .teal
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                
                ScrollView {
                    ForEach (viewModel.model.raffleParticipants, id: \.self) { raffleEntry in
                        HStack {
                            Text(raffleEntry)
                                .font(.title3)
                                .fontWeight(.medium)
                        }
                        .padding(.horizontal)
                        if viewModel.model.raffleParticipants.count > 1 {
                            Divider()
                        }
                    }
                }
                
                Divider()
                
                toolbar
                .padding()
                
                Spacer()
            }
            .navigationTitle("Raffle")
        }
    }
    
    var toolbar: some View {
        VStack(spacing: 15) {
            if let idx = viewModel.model.chosenParticipantIdx {
                HStack {
                    Text("🌟\(viewModel.model.raffleParticipants[idx])🌟")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            TextField("", text: $newRaffleParticipant, prompt: Text("New Entry"))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            HStack(alignment: .bottom, spacing: 15) {
                VStack {
                    Image(systemName: "ticket")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 20)
                    Text("Total: \(viewModel.model.raffleParticipants.count)")
                        .font(.title3)
                }
                
                Spacer()
                
                Button {
                    showResetAlert.toggle()
                } label: {
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .frame(maxWidth: 40, maxHeight: 40)
                        .alert("Are you sure you want to clear the participant list and winner?", isPresented: $showResetAlert) {
                            Button("OK") {resetRaffle()}
                            Button("Cancel", role: .cancel) { }
                        }
                }
                .buttonStyle(.bordered)
                .foregroundColor(.red)
                
                Button {
                    withAnimation() {
                        chooseWinner()
                    }
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(maxWidth: 40, maxHeight: 40)
                }
                .buttonStyle(.bordered)
                .foregroundColor(colorTheme)
                
                Button {
                    withAnimation() {
                        addRaffleEntry()
                    }
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(maxWidth: 40, maxHeight: 40)
                }
                .buttonStyle(.bordered)
                .foregroundColor(colorTheme)
            }
        }
    }
    
    func resetRaffle() {
        viewModel.model.raffleParticipants = []
        viewModel.model.resetChosnParticipant()
    }
    
    func chooseWinner() {
        _ = viewModel.model.choseParticipant()
    }
    
    func addRaffleEntry() {
        viewModel.model.raffleParticipants.append(newRaffleParticipant)
        newRaffleParticipant = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
