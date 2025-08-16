//
//  SettingView.swift
//  TUTSchoolBus
//
//  Created by Rin Ichikawa on 2024/07/13.
//

import SwiftUI
struct SettingView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:0){
            List{
                Section{
                    NavigationLink(HomePath.myinfo.toString, value: HomePath.myinfo)
                    //NavigationLink(HomePath.positioninfo.toString, value: HomePath.positioninfo)

                } header: {
                    Text("詳細設定")
                }
            }
            .navigationTitle("設定")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: HomePath.self, destination: { appended in
                appended.Destination()
                    .navigationTitle(appended.toString)
                    .navigationBarTitleDisplayMode(.inline)
            })
        }
        .background(Color.backGray)
        .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(
                            action: {
                                dismiss()
                            }, label: {
                                Image(systemName: "arrow.backward")
                            }
                        ).tint(Color.tutGray)
                    }
                }
    }
}

#Preview {
    SettingView()
}

