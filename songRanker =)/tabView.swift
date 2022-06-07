//
//  tabView.swift
//  songRanker
//
//  Created by 90308616 on 5/17/22.
//

import SwiftUI

struct tabView: View {
    var body: some View {
        TabView {
            startView()
                .tabItem {
                    Label("Seach", systemImage: "magnifyingglass")
                }
            
            rankedAlbums()
                .tabItem {
                    Label("Ranked & Scored", systemImage: "list.dash")
                }
            accountPage()
                .tabItem{
                    Label("Account", systemImage: "person")
                }
            
        }
    }
}

struct tabView_Previews: PreviewProvider {
    static var previews: some View {
        tabView()
    }
}
