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
            DashboardScreen()
                .tag(0)
                .tabItem {
                    Label("DashboardScreen", systemImage: "star")
                }
            ProfileScreen()
                .tag(1)
                .tabItem {
                    Label("ProfileScreen", systemImage: "person")
                }
            DlScreen()
                .tag(2)
                .tabItem {
                    Label("DlScreen", systemImage: "square.and.arrow.up")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
