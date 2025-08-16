//
//  SwiftUIView.swift
//  TUTSchoolBus
//
//  Created by Rin Ichikawa on 2024/07/13.
//

import SwiftUI

struct TrainView: View {
    @Environment(\.openURL) var openURL
    var body: some View {
        
        VStack(spacing:0){
            
            Spacer()
            VStack(){
                HStack(){
                    Text("各交通機関の運行情報の公式サイト、\nおよび公式SNSへ飛びます。")
                        .multilineTextAlignment(.leading)
                        .padding()
                        .padding(.leading)
                    Spacer()
                }
                
                HStack(){
                    
                    Button {
                        
                        openURL(URL(string: "https://traininfo.jreast.co.jp/train_info/kanto.aspx")!)
                    } label: {
                        Text("JR遅延情報\n(関東エリア)")
                            .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity)
                            .frame(height: 225)
                            .background(Color.white.opacity(0.7))
                            .background(Color.JR)
                            .background(Color.white)
                            .cornerRadius(20)
                            .foregroundStyle(Color.textBlack)
                    }
                    .padding(.trailing, 1.0)
                    .padding(.leading)
                    
                    VStack(){
                        Button {
                            let username = "JRE_F_Tokaido"
                                    if let url = URL(string: "twitter://user?screen_name=\(username)") {
                                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                    }
                            //openURL(URL(string: "https://x.com/JRE_F_Tokaido")!)
                        } label: {
                            Text("JR東海道方面SNS\n(横浜線)")
                                .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .frame(height: 110)
                                .background(Color.white.opacity(0.8))
                                .background(
                                    Image("x-logo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 60)
                                )
                                .background(Color.white)
                                .cornerRadius(20)
                                .foregroundStyle(Color.textBlack)
                        }
                        Button {
                            let username = "JRE_F_Chuo"
                                    if let url = URL(string: "twitter://user?screen_name=\(username)") {
                                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                    }
                            //openURL(URL(string: "https://x.com/JRE_F_Chuo")!)
                            
                        } label: {
                            Text("JR中央方面SNS\n(中央線・八高線)")
                                .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .frame(height: 110)
                                .background(Color.white.opacity(0.8))
                                .background(
                                    Image("x-logo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 60)
                                )
                                .background(Color.white)
                                .cornerRadius(20)
                                .foregroundStyle(Color.textBlack)
                        }
                        
                        
                    }
                    .padding(.trailing)
                    .padding(.leading, 1.0)
                }
                .padding(.bottom, 20.0)
                .shadow(color: .gray, radius: 2, x: 3, y: 3)
                
                HStack(){
                    Button {
                        openURL(URL(string: "https://www.keio.co.jp/unkou/unkou_pc.html")!)
                    } label: {
                        Text("京王遅延情報")
                            .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity)
                            .frame(height: 220)
                            .background(Color.white.opacity(0.7))
                            .background(
                                LinearGradient(gradient: Gradient(colors: [.KEIORED, .KEIOBRUE]), startPoint: .top, endPoint: .bottom)
                            )
                            .background(Color.white)
                            .cornerRadius(20)
                            .foregroundStyle(Color.textBlack)
                    }
                    .padding(.trailing, 1.0)
                    .padding(.leading)
                    Button {
                        let username = "keiodentetsu"
                                if let url = URL(string: "twitter://user?screen_name=\(username)") {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                }
                        //openURL(URL(string: "https://x.com/keiodentetsu")!)
                        
                    } label: {
                        Text("京王線SNS")
                            .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 220)
                            .background(Color.white.opacity(0.8))
                            .background(
                                Image("x-logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 60)
                            )
                            .background(Color.white)
                            .cornerRadius(20)
                            .foregroundStyle(Color.textBlack)
                    }
                    .padding(.trailing)
                    .padding(.leading, 1.0)
                }
                .shadow(color: .gray, radius: 2, x: 3, y: 3)
                Spacer()
                Text("外部サイトが開きます")
                    .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.gray)
            }
            Spacer()
        }
        .background(Color.backGray)
    }
}

#Preview {
    TrainView()
}
