//
//  ThirdScreen.swift
//  Nav3108
//
//  Created by Koiv Igor on 04.09.2023.
//

import SwiftUI

final class ThirdScreenViewModel: ObservableObject {
    @Published var isShowed: Bool = false
}


struct ThirdScreen: View {
    @StateObject var dlScreenVM: ThirdScreenViewModel = .init()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("ThirdScreen")
                Button {
                    dlScreenVM.isShowed.toggle()
                } label: {
                    Text("Sheet")
                }
                .sheet(isPresented: $dlScreenVM.isShowed) {
                    Text("Sheet")
                        .font(.system(size: 100))
                }
            }
        }
    }
}

struct DlScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThirdScreen()
    }
}
