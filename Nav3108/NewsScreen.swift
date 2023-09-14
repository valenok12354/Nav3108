//
//  NewsScreen.swift
//  Nav3108
//
//  Created by Koiv Igor on 08.09.2023.
//

import SwiftUI
import NewsApiNetworking

extension Article: Identifiable {
    public var id: String {
        url
    }
}

final class NewsScreenViewModel: ObservableObject {
    
    @Published var articles: [Article] = .init()
    @Published var articles2d: [[Article]] = .init()
    
    init() {
        nextPage()
    }
    
    func nextPage() {
        ArticlesAPI.everythingGet(
            q: "iPhone 15",
            from: "2023-09-10",
            sortBy: "publishedAt",
            language: "ru",
            apiKey: "7ee714fca1fd486081e9a071d7e9221d") { data, error in
                self.articles = data?.articles ?? []
                self.collectArticles2d()
            }
    }
    
    func collectArticles2d() {
        let columned = articles.publisher.collect(2)
        _ = columned.collect().sink(receiveValue: {
            self.articles2d = $0
        })
    }
}

struct NewsScreen: View {
    @StateObject var newsVM: NewsScreenViewModel = .init()
    
    var listOptions = ["List", "Grid", "Grid Ios13"]
    @State var listOptionsIndex = "List"
    
    var body: some View {
        VStack {
            Picker("", selection: $listOptionsIndex) {
                ForEach(listOptions, id: \.self) { index in
                    Text(index).tag(index)
                }
            }
                .pickerStyle(SegmentedPickerStyle())
            
            switch listOptionsIndex {
            case "List":
                list
            case "Grid":
                grid
            case "Grid Ios13":
                grid13
            default:
                EmptyView()
            }
        }
    }
    
    var list: some View {
        List(newsVM.articles) { article in
            ListArticleCell(
                title: article.title ?? "",
                description: article.description ?? ""
            )
        }
    }
    
    var grid: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: .init(), count: 2)) {
                ForEach(newsVM.articles) { article in
                    ListArticleCell(
                        title: article.title ?? "",
                        description: article.description ?? ""
                    )
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    var grid13: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(0 ..< newsVM.articles2d.count, id: \.self) { row in
                    HStack(spacing: 8)  {
                        ForEach(newsVM.articles2d[row]) { article in
                            ListArticleCell(
                                title: article.title ?? "",
                                description: article.description ?? ""
                            )
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ListArticleCell: View {
    let title: String
    let description: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.mint)
            VStack {
                Text(title.isEmpty ? description : title)
                    .foregroundColor(.white)
                    .padding()
            }
            
        }
        .frame(width: .infinity)
        .frame(height: 200)
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
