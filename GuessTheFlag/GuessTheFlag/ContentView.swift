//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dawid Kubicki on 05/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            Button {
                showAlert()
            } label: {
                Label("Sign in with Apple", systemImage: "applelogo")
                    .padding([.bottom, .top], 14)
                    .padding([.leading, .trailing], 30)
                    .background(.black)
                    .foregroundStyle(.white)
                    .cornerRadius(20)
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("OK") {}
            }
        }
    }
    
    func showAlert() {
        showingAlert.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().preferredColorScheme(.dark)
    }
}
