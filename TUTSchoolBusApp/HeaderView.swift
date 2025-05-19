//
//  header.swift
//  TUTSchoolBusApp
//
//  Created by Rin Ichikawa on 2025-05-20.
//

import SwiftUI

struct HeaderView: View
{
    var body: some View {
        VStack( spacing:0 ) {
            HStack {
                Image(.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40 ,height: 40)
                    .padding(.leading,20)
                
                Spacer()
                
                Text("スクールバスアプリ(研究版)")
                    .padding(.top)
                    .padding(.trailing,20)
                    .foregroundStyle(Color.textBlack)
            }
            .padding( .bottom,5)
            .background(Color.white)
            
            VStack(spacing: 0) {
                Rectangle()
                    .frame(width:.infinity,height: 3)
                    .foregroundColor(.tutBlue)
                Rectangle()
                    .frame(width:.infinity,height: 3)
                    .foregroundColor(.white)
                Rectangle()
                    .frame(width:.infinity,height: 3)
                    .foregroundColor(.tutGray)
            }
            .background(Color.white)
        }
    }
}

#Preview {
    HeaderView()
}
