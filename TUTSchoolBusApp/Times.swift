//
//  Time.swift
//  TUTSchoolBusApp
//
//  Created by Rin Ichikawa on 2025-08-03.
//

import SwiftUI

struct Times: View {
    var body: some View {
        VStack(){
            HStack(alignment: .center, spacing: 10.0){
                
                HStack(alignment: .bottom, spacing:0){
                    Text("00:00")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundStyle(Color.black)
                    Text(" 発")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundStyle(Color.black)
                        .baselineOffset(5)
                }
                Image(.allow)
                
                HStack(alignment: .bottom, spacing:0){
                    Text("00:00")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundStyle(Color.black)
                    Text(" 着")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundStyle(Color.black)
                        .baselineOffset(5)
                }
            }
            .padding(.top, 5)
            VStack(spacing:0){
            Text("シャトル運行中")
                .foregroundStyle(Color.blue)
            //Text("\(starts_hachioji[num - 1]) 〜 \(starts_hachioji[num + 1])")
            Text("00:00 〜 00:00")
                .font(.title)
                .fontWeight(.light)
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.black)
            }
            .padding(.top, 5)
            VStack(spacing:0){
                Text("本日の最終バス")
                    .foregroundStyle(Color.red)
                HStack(alignment: .center, spacing: 10.0){
                    
                    HStack(alignment: .bottom, spacing:0){
                        Text("00:00")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundStyle(Color.black)
                        Text(" 発")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundStyle(Color.black)
                            .baselineOffset(5)
                    }
                    Image(.allow)
                    
                    HStack(alignment: .bottom, spacing:0){
                        Text("00:00")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundStyle(Color.black)
                        Text(" 着")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundStyle(Color.black)
                            .baselineOffset(5)
                    }
                }
            }
            .padding(.top, 5)
            
        }
    }
}

#Preview {
    onePage()
}
