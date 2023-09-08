//
//  SportsOpeningScreen.swift
//  Nav3108
//
//  Created by Koiv Igor on 07.09.2023.
//

import SwiftUI

struct Sports: Identifiable, Equatable {
    var id: UUID = .init()
    let name: String
}

final class SportsViewModel: ObservableObject {
    @Published var isSheetShowed: Bool = false
    @Published private(set) var sports = [
        Sports(name: "⚽️"),
        Sports(name: "🏀"),
        Sports(name: "🥎"),
        Sports(name: "🏓")
    ]
}

struct SportsOpeningScreen: View {
    @StateObject var sportsListVM: SportsViewModel = .init()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                List(sportsListVM.sports) { sport in
                    NavigationLink(destination: Text(sport.name).font(.system(size: 100))) {
                        Text(sport.name)
                    }
                    .listRowSeparator(.hidden)
                }
            }
        }
    }
}

struct SportsOpeningScreen_Previews: PreviewProvider {
    static var previews: some View {
        SportsOpeningScreen()
    }
}
