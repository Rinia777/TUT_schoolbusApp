//
//  ToStationView.swift
//  TUTSchoolBusApp
//
//  Created by Rin Ichikawa on 2025-08-03.
//
import SwiftUI

struct ToStationView: View {
    @State private var currentIndex = 0
    @GestureState private var dragOffset: CGFloat = -20
    @State private var examples = ["1", "2", "3"]
    @Environment(\.openURL) var openURL
    let itemPadding: CGFloat = 20
    var body: some View {
        GeometryReader { bodyView in
            HStack(spacing: itemPadding) {
                //1つ目
                VStack(spacing:0){
                    HStack {
                        Spacer()
                        Text("八王子みなみ野駅行き")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.vertical , 15)
                        Spacer()
                    }
                    .background(Color.tutBlue)
                    .foregroundColor(Color.white)
                    VStack{
                        Times()
                        HStack{
                            Button{}label: {
                                Text("時刻表の更新")
                                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.tutBlue)
                                    .cornerRadius(10)
                                    .foregroundStyle(Color.white)
                            }
                            Button{}label: {
                                Text("以降の時刻表")
                                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.tutBlue)
                                    .cornerRadius(10)
                                    .foregroundStyle(Color.white)
                            }
                        }
                        Spacer()
                    }
                }
                .foregroundColor(Color.gray)
                .font(.system(size: 50, weight: .bold))
                .frame(width: bodyView.size.width * 0.8)
                .frame(maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(40)
                .padding(.vertical, 20)
                .padding(.leading,  bodyView.size.width * 0.1 )
                //2つ目
                VStack(spacing:0){
                    HStack {
                        Spacer()
                        Text("八王子駅行き")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.vertical , 15)
                        Spacer()
                    }
                    .background(Color.tutBlue)
                    .foregroundColor(Color.white)
                    VStack{
                        Times()
                        HStack{
                            Button{}label: {
                                Text("時刻表の更新")
                                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.tutBlue)
                                    .cornerRadius(10)
                                    .foregroundStyle(Color.white)
                            }
                            Button{}label: {
                                Text("以降の時刻表")
                                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.tutBlue)
                                    .cornerRadius(10)
                                    .foregroundStyle(Color.white)
                            }
                        }
                    }
                    Spacer()
                }
                .foregroundColor(Color.white)
                .font(.system(size: 50, weight: .bold))
                .frame(width: bodyView.size.width * 0.8)
                .frame(maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(40)
                .padding(.vertical, 20)
                .padding(.leading,  0)
                //3つ目
                VStack(spacing:0){
                    HStack {
                        Spacer()
                        Text("学生会館行き")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.vertical , 15)
                        Spacer()
                    }
                    .background(Color.tutBlue)
                    .foregroundColor(Color.white)
                    VStack{
                        Times()
                        HStack{
                            Button{}label: {
                                Text("時刻表の更新")
                                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.tutBlue)
                                    .cornerRadius(10)
                                    .foregroundStyle(Color.white)
                            }
                            Button{}label: {
                                Text("以降の時刻表")
                                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.tutBlue)
                                    .cornerRadius(10)
                                    .foregroundStyle(Color.white)
                            }
                        }
                    }
                    Spacer()
                }
                .foregroundColor(Color.white)
                .font(.system(size: 50, weight: .bold))
                .frame(width: bodyView.size.width * 0.8)
                .frame(maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(40)
                .padding(.vertical, 20)
                .padding(.leading,  0 )
                
            }
            .frame(minHeight: bodyView.size.height)
            
        
            .shadow(color: .gray, radius: 7, x: 0, y: 0)
            .frame(width: bodyView.size.width)
            // ドラッグした分だけoffsetを移動する
            .offset(x: self.dragOffset)
            // currentIndexに応じたoffsetへ移動する
            .offset(x: -CGFloat(self.currentIndex) * (bodyView.size.width * 0.8 + itemPadding))
            .gesture(
                DragGesture()
                    .updating(self.$dragOffset, body: { (value, state, _) in
                        // 移動幅（width）のみ更新する
                        state = value.translation.width
                    })
                    .onEnded({ value in
                        var newIndex = self.currentIndex
                        // ドラッグ幅からページングを判定
                        // 今回は画面幅x0.3としているが、操作感に応じてカスタマイズする必要がある
                        if abs(value.translation.width) > bodyView.size.width * 0.1 {
                            newIndex = value.translation.width > 0 ? self.currentIndex - 1 : self.currentIndex + 1
                        }
                        
                        // 最小ページ、最大ページを超えないようチェック
                        if newIndex < -1 {
                            newIndex = -1
                        } else if newIndex > (self.examples.count - 2) {
                            newIndex = self.examples.count - 2
                        }
                        
                        self.currentIndex = newIndex
                    })
            )
        }
        .background(Color.backGray)
    }
}

#Preview {
    ToStationView()
}


