//
//  ContentView.swift
//  RemoveDice
//
//  Created by Aaron Thompson on 10/08/2024.
//

import SwiftUI

struct ContentView: View {

    @State var rolledNumber = 0
    @State var remainingNumbers = [1, 2, 3, 4, 5, 6]
    @State var selectedNumbers = [Int]()
    @State var presAlert = false
    
    var body: some View {
        
            VStack {
                Text("\(rolledNumber)").font(.largeTitle)
                    .padding()
                Button("Roll", action: rollDice)
            }
            .frame(width: 300, height: 100)
            
           
    
        NavigationStack{
            List {
                ForEach(selectedNumbers, id: \.self){ num in
                    Text("\(num)")
                }
            }
            .navigationTitle("Previous Numbers")
            .animation(.default)
        }
        .alert("All sides rolled." ,isPresented: $presAlert){
            Button("Restart", action: restartRolls)
        }
        
        
    }
    
    func rollDice() {
        rolledNumber = remainingNumbers.randomElement() ?? 0
        
        if(rolledNumber == 0){
            presAlert = true
            return
        }
        selectedNumbers.append(rolledNumber)
        remainingNumbers = remainingNumbers.filter {
            $0 != rolledNumber
        }
        
    }
    
    func restartRolls() {
        rolledNumber = 0
        remainingNumbers = [1, 2, 3, 4, 5, 6]
        selectedNumbers = [Int]()
        presAlert = false
    }
}

#Preview {
    ContentView()
}
