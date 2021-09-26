//
//  CompassView.swift
//  AwordsCollectionApp
//
//  Created by Maxim Mitin on 26.09.21.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct CompassView: View {
    @State var grow = false
    @State var rotateInfinty = false
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .trim(from: grow ? 1/8 : 1, to: 1)
                    .stroke(Color.yellow, lineWidth: 10)
                    .rotationEffect(.degrees(90), anchor: .center)
                    .foregroundColor(.blue)
            }
            .frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .onAppear {
                withAnimation(Animation.easeIn(duration: 5).repeatForever(autoreverses: false).delay(2)){
                    grow.toggle()
                }
        }

            ZStack {
                Circle()
                    .frame(width: 530, height: 700)
                
                Path { path in
                    path.move(to: CGPoint(x: 200, y: 100))
                    path.addLines([
                        .init(x: 200, y: 100),
                        .init(x: 100, y: 0),
                        .init(x: 0, y: 100),
                        .init(x: 100, y: 200),
                        .init(x: 300, y: 0),
                        .init(x: 400, y: 100),
                        .init(x: 300, y: 200),
                        .init(x: 200, y: 100),
                    ])
                }
                .stroke(Color.yellow, lineWidth: 11)
                .offset(x: 110, y: 350)
            }
            .rotationEffect(.degrees(rotateInfinty ? 0 : -360))
            .scaleEffect(0.3, anchor: .center)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)){
                    rotateInfinty.toggle()
                }
            }
        }
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
