//
//  NewAchievmentView.swift
//  AwordsCollectionApp
//
//  Created by Maxim Mitin on 26.09.21.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct HeartBeatView: View {
    @State private var animation: Double = 0.0
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: width + 2, height: height + 2, alignment: .center)
            
            Circle()
                .stroke(Color.red, lineWidth: 3)
                .frame(width: width, height: height, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(systemName: "heart.circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.red)
                .frame(width: width, height: height, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}

struct NewAchievmentView_Previews: PreviewProvider {
    static var previews: some View {
        HeartBeatView(width: 200, height: 200)
    }
}
