//
//  startView.swift
//  songRanker
//
//  Created by 90308616 on 5/16/22.
//

import SwiftUI


struct Album: Identifiable {
    let id = UUID()
    let name: String
    let songs: [Song]
}

struct AlbumRow: View {
    var album: Album
    
    var body: some View {
        Text(album.name)
    }
}

struct startView: View {
    
    let albums = [
        Album(name: "Paul's Boutique", songs: [Song(name: "a", score: 0), Song(name: "a2", score: 0), Song(name: "a3", score: 0), Song(name: "Hello4", score: 0)]),
        Album(name: "a2", songs: [Song(name: "a4", score: 0), Song(name: "Hello2", score: 0)]),
        Album(name: "IGOR", songs: [Song(name: "Hello", score: 0), Song(name: "Hello2", score: 0)])
    ]
    @State private var searchText = ""
    
    var body: some View {
        VStack{
            NavigationView {
                List(searchResults) { album in
                    NavigationLink(destination: startRank(songs: album.songs, albumName: album.name)) {
                        AlbumRow(album: album)
                    }
                }
                .searchable(text: $searchText)
                .navigationBarTitle("Search")
                }
            }
    }
        var searchResults: [Album] {
            if searchText.isEmpty {
                return albums
            } else {
                return albums.filter { $0.name.localizedStandardContains(searchText) }
            }
        }
        
        struct startView_Previews: PreviewProvider {
            static var previews: some View {
                startView()
            }
        }
    }
