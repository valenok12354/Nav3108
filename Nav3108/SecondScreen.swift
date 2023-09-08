//
//  SecondScreen.swift
//  Nav3108
//
//  Created by Koiv Igor on 31.08.2023.
//

import SwiftUI

struct SecondScreen: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("SecondScreen").font(.largeTitle)
                List {
                    NavigationLink(destination: SportsOpeningScreen()) {
                        Text("Open Sports")
                            .padding()
                            .background(.blue)
                            .font(.title)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
