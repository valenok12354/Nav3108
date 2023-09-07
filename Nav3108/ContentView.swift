//
//  ContentView.swift
//  Nav3108
//
//  Created by Koiv Igor on 31.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State var section: Int = 0
    
    var body: some View {
        TabView (selection: $section) {
            FirstScreen()
                .tag(0)
                .tabItem {
                    Label("FirstScreen", systemImage: "star")
                }
            SecondScreen()
                .tag(1)
                .tabItem {
                    Label("SecondScreen", systemImage: "person")
                }
            ThirdScreen()
                .tag(2)
                .tabItem {
                    Label("ThirdScreen", systemImage: "square.and.arrow.up")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
