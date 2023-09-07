//
//  DashboardScreen.swift
//  Nav3108
//
//  Created by Koiv Igor on 31.08.2023.
//

import SwiftUI

struct DashboardScreen: View {
    @State var text = NSMutableAttributedString(string: "")
    
    var body: some View {
        VStack {
            Text("DashboardScreen").font(.largeTitle)
            VStack {
                TextView(text: $text)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .scrollDisabled(true)
                Button {
    
                } label: {
                    Text("Sheet")
                }
            }
           
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
