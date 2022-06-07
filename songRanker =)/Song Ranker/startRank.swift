//
//  ContentView.swift
//  songRanker
//
//  Created by 90308616 on 4/27/22.
//

import SwiftUI
struct Song: Identifiable {
    let id = UUID()
    let name: String
    @State var score: Int
}

struct startRank: View {
    @State var songs: [Song]
    var albumName: String
    @State var numOne = 0
    @State var numTwo = 1
    var body: some View {
        
        if(numOne < songs.count-1){
            VStack{
                Text("You are now ranking \(albumName)")
                Spacer()
                HStack{
                    
                    Button(action: {
                        if(numTwo < songs.count-1){
                            songs.insert(Song(name: songs[numOne].name, score: songs[numOne].score + 1), at: numOne)
                            songs.remove(at: numOne + 1)
                            numTwo += 1
                        } else{
                            
                            songs.insert(Song(name: songs[numOne].name, score: songs[numOne].score + 1), at: numOne)
                            songs.remove(at: numOne + 1)
                            numOne += 1
                            numTwo = numOne+1
                            
                        }
                    }, label: {Text(songs[numOne].name)})
                    
                    Text("or")
                        .padding(.horizontal)
                    
                    Button(action: {
                        if(numTwo < songs.count-1){
                            songs.insert(Song(name: songs[numTwo].name, score: songs[numTwo].score + 1), at: numTwo)
                            songs.remove(at: numTwo + 1)
                            numTwo += 1
                        } else{
                            songs.insert(Song(name: songs[numTwo].name, score: songs[numTwo].score + 1), at: numTwo)
                            songs.remove(at: numTwo + 1)
                            numOne += 1
                            numTwo = numOne+1
                        }
                    }, label: {Text(songs[numTwo].name)})
                }
                Spacer()
            }
        }
        else{
            afterRank(songs: songs)
        }
    }
}



struct startRank_Previews: PreviewProvider {
    static var previews: some View {
        startRank(songs: [Song(name: "Hello", score: 0), Song(name: "Hello2", score: 0), Song(name: "Hello3", score: 0)], albumName: "test")
    }
}
