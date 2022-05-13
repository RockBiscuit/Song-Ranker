//
//  afterRank.swift
//  songRanker
//
//  Created by 90308616 on 5/10/22.
//

import SwiftUI

struct afterRank: View {
    
    @State var scores: [Int]
    @State var songs: [String]
    @State public var rankedSongs = [""]
    @State public var bob = 1
    var body: some View {
        let max = scores.max()
        let ind = scores.firstIndex(of: max!) ?? 0
        VStack{
            if(songs.count > 1){
                Button(action: {
                    rankedSongs.append(songs[ind])
                    bob += 1
                    songs.remove(at: ind)
                    scores.remove(at: ind)
                }, label: {Text("Reveal Ranking (You gotta click this a few times)")})
                
            } else{
                VStack{
                ForEach(1..<rankedSongs.count){ i in
                    VStack{
                        Text(String(i) + ". " + rankedSongs[i])
                    }
                }
                    Text(String(rankedSongs.count) + ". " + songs[0])
            }
            }
        }
    }
}

func heyo (scores: [Int], songs: [String]) {
    print(scores[1])
}

struct afterRank_Previews: PreviewProvider {
    static var previews: some View {
        afterRank(scores: Array(repeating: 0, count: 5), songs: ["song1", "song2", "song3", "song4", "song5"])
    }
}
