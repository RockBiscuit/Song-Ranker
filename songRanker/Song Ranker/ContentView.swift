//
//  ContentView.swift
//  songRanker
//
//  Created by 90308616 on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    @State public var songs = ["song1", "song2", "song3", "song4", "song5"]
    @State var numOne = 0
    @State var numTwo = 1
    @State var scores = Array(repeating: 0, count: 5)

    var body: some View {
        
        if(numOne < songs.count-1){
        HStack{
            
            Button(action: {
                if(numTwo < scores.count-1){
                    scores[numOne] =  scores[numOne] + 1
                    numTwo += 1
                } else{
                    numOne += 1
                    scores[numOne] =  scores[numOne] + 1
                    numTwo = numOne+1
                    
                }
            }, label: {Text(songs[numOne])})
            
            Text("or")
                .padding(.horizontal)
            
            Button(action: {
//               scores[numTwo]+=1
                if(numTwo < scores.count-1){
                    scores[numTwo] =  scores[numTwo] + 1
                    numTwo += 1
                } else{
                    numOne += 1
                    scores[numTwo] =  scores[numTwo] + 1
                    numTwo = numOne+1
                }
            }, label: {Text(songs[numTwo])})
        }
        } else{
            afterRank(scores: scores, songs: songs)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
