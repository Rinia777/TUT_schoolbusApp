//
//  HomeView.swift
//  TUTSchoolBusApp
//
//  Created by Rin Ichikawa on 2025-05-19.
//
import SwiftUI

struct HomeView: View {
        @State private var currentTab = 0
        @Namespace private var namespace
        var tabItems: [String] = ["大学行き", "駅行き"]
        
        var body: some View {
            VStack {
                HStack(spacing:0) {
                    Spacer()
                    tabBarView
                        .background(.white)
                    Spacer()
                }
                    TabView(selection: $currentTab) {
                        ToSchoolView()
                        .ignoresSafeArea()
                        .tag(0)
                        ToStationView()
                        .ignoresSafeArea()
                        .tag(1)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                
            }
        }
        var tabBarView: some View {
            HStack(spacing:0) {
                ForEach(Array(zip(self.tabItems.indices, self.tabItems)), id: \.0, content: {
                    index, name in
                    tabItemView(string: name, tab: index)
                })
            }
            
            .background(.white)
            .frame(height: 48)
        }

        
        func tabItemView(string: String, tab: Int) -> some View {
            Button {
                self.currentTab = tab
            } label: {
                VStack(spacing:0){
                    Spacer()
                    Text(string)
                        .frame(height: 50)
                        .foregroundColor(.black)
                    if self.currentTab == tab {
                        Color.tutBlue.frame(height: 3)
                            .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                            .padding(.horizontal, 0)
                    } else {
                        Color.clear.frame(height: 3).padding(.horizontal, 0)
                    }
                }
                
                .animation(.spring(), value: currentTab)
            }
            .buttonStyle(.plain)
        }
    }


#Preview {
    HomeView()
}

