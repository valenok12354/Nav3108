//
//  ProfileScreen.swift
//  Nav3108
//
//  Created by Koiv Igor on 31.08.2023.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
//        VStack {
            NavigationView {
                VStack {
                    Text("ProfileScreen").font(.largeTitle)
                    NavigationLink(destination: FoodScreen()) {
                        Text("Foods")
                            .padding()
                            .background(.pink)
                            .font(.largeTitle)
                    }
                }
            }
//        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
