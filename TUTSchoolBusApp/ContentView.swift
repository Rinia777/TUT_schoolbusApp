//
//  ContentView.swift
//  TUTSchoolBusApp
//
//  Created by Rin Ichikawa on 2025-05-13.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            onePage()
                .tabItem {
                    Image(systemName: "house")
                    Text("ホーム")
                }
                .tag(0)
            twoPage()
                .tabItem {
                    Image(systemName: "tram.fill")
                    Text("交通情報")
                }
                .tag(1)
            threePage()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("設定")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
