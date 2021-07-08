//
//  GameView.swift
//  Tic_Tac_Toe
//
//  Created by Akash Sarkar on 2/7/21.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack() {
                Spacer()
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(0..<9) { i in
                        ZStack {
                            Circle()
                                .foregroundColor(.red).opacity(0.5)
                                .frame(width: geometry.size.width / 3 - 15,
                                       height: geometry.size.width / 3 - 15)
                            
                            Image(systemName:viewModel.moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            viewModel.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isGameBoardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: { viewModel.resetGame() }))
            }
        })
    }
}

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView()
        }
    }
}
