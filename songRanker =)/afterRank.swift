//
//  afterRank.swift
//  songRanker
//
//  Created by 90308616 on 5/10/22.
//

import SwiftUI

struct afterRank: View {
    @State var songs: [Song]
    var body: some View {
        let rankedSongs = songs.sorted(by: { $1.score < $0.score })
        
        VStack(alignment: .leading) {
            List(0..<songs.count) { i in
                HStack{
                    Text(String(i+1) + ". " + rankedSongs[i].name)
                    Text("- " + String(rankedSongs[i].score))
                    
                }
            }
            
            
        }
        
    }
    
    
    struct afterRank_Previews: PreviewProvider {
        static var previews: some View {
            afterRank(songs: [Song(name: "Hello", score: 2), Song(name: "Hello2", score: 3)])
        }
    }
}
