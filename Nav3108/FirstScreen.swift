//
//  FirstScreen.swift
//  Nav3108
//
//  Created by Koiv Igor on 31.08.2023.
//

import SwiftUI

struct FirstScreen: View {
    @State var text = NSMutableAttributedString(string: "")
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text("FirstScreen").font(.largeTitle)
                    TextView(text: $text)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                        .colorInvert()
                        .scrollDisabled(true)
                    NavigationLink(destination: SecondScreen()) {
                        Text("Open second screen")
                            .padding()
                            .background(.yellow)
                            .font(.title)
                    }
                    NavigationLink(destination: SportsOpeningScreen()) {
                        Text("Open Sports")
                            .padding()
                            .background(.pink)
                            .font(.title)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
