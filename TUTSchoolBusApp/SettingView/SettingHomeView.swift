//
//  SettingHomeView.swift
//  TUTSchoolBus
//
//  Created by Rin Ichikawa on 2024/07/18.
//

import SwiftUI
enum HomePath: Int{
    case setting, riyoukiyaku, privacy,myinfo,positioninfo
    var toString: String{
        ["設定", "利用規約", "プライバシーポリシー","所属情報","位置情報"][self.rawValue]
    }
    
    @ViewBuilder
    func Destination() -> some View{
        switch self {
        case .setting: SettingView()
        case .riyoukiyaku: riyoukiyakuView()
        case .privacy: privacyView()
        case .myinfo: MyInfoView()
        case .positioninfo: positionInfoView()
        }
    }
}
struct SettingHomeView: View {
    @State var path = NavigationPath()
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(spacing:0){
            
            NavigationStack(path: $path){
                ZStack {
                    List{
                        Section {
                            NavigationLink(HomePath.setting.toString, value: HomePath.setting)
                        } header: {
                            Text("設定")
                        }
                        Section {
                            Button {
                                openURL(URL(string: "https://docs.google.com/forms/d/e/1FAIpQLScZGj0d7gozjI98sANtK1voolkW0DkcufMnMeJUztjzHNzc3Q/viewform?usp=sf_link")!)
                            } label: {
                                Text("フィードバック(外部フォーム)")
                            }
                            .accentColor(.black)
                        } header: {
                            Text("その他")
                        }
                        /*
                        Section {
                            NavigationLink(HomePath.riyoukiyaku.toString, value: HomePath.riyoukiyaku)
                            NavigationLink(HomePath.privacy.toString, value: HomePath.privacy)
                        } header: {
                            Text("アプリについて")
                        }
                         */
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    
                    .navigationDestination(for: HomePath.self, destination: { appended in
                        appended.Destination()
                            .navigationTitle(appended.toString)
                            .navigationBarTitleDisplayMode(.inline)
                    })
                    Spacer()
                    VStack(){
                        Spacer()
                        HStack(){
                            Button {
                                openURL(URL(string: "https://www.teu.ac.jp/campus/access/006644.html")!)
                            } label: {
                                Text("大学アクセス\nサイト")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 110)
                                    .background(Color.white.opacity(0.8))
                                    .background(
                                        Image("icon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 80)
                                    )
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .foregroundStyle(Color.textBlack)
                            }
                            .padding(.trailing, 5.0)
                            .padding(.leading)
                            Button {
                                openURL(URL(string: "https://service.cloud.teu.ac.jp/")!)
                                
                            } label: {
                                Text("学内サイト")
                                    .font(.body)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 110)
                                    .background(Color.white.opacity(0.8))
                                    .background(
                                        Image("icon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 80)
                                    )
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .foregroundStyle(Color.textBlack)
                            }
                            .padding(.trailing)
                            .padding(.leading, 5.0)
                        }
                        Text("外部サイトが開きます")
                            .font(.callout)
                            .foregroundStyle(Color.gray)
                            .padding(.bottom, 5.0)
                    }
                }
            }
        }
        .background(Color.backGray)
    }
        
}

#Preview {
    SettingHomeView()
}

