//
//  SignInWithAppleButtonView.swift
//  GuessTheFlag
//
//  Created by Dawid Kubicki on 07/04/2022.
//

import SwiftUI

struct SignInWithAppleButtonView: View {
    
    @State var showingAlert = false
    
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
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            }
        }
    }
    
    func showAlert() {
        showingAlert.toggle()
    }
}

struct SignInWithAppleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithAppleButtonView()
    }
}
