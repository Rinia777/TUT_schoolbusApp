//
//  riyoukiyakuView.swift
//  TUTSchoolBus
//
//  Created by Rin Ichikawa on 2024/07/18.
//

import SwiftUI

struct riyoukiyakuView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("riyoukiyakuView")
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
    riyoukiyakuView()
}
