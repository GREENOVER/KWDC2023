//
//  RenderingWithAnimationView.swift
//  KWDC2023
//
//  Created by GREEN on 2023/06/15.
//

import SwiftUI

struct RenderingWithAnimationView: View {
  @State private var selected: Bool = false
  
  var body: some View {
    ZStack {
      VStack {
        Text("View Rendering Update With Animation in SwiftUI")
          .font(.system(size: 15))
          .bold()
        
        Spacer()
      }
      
      Image("momo")
        .resizable()
        .scaledToFit()
        .frame(width: 250)
        .scaleEffect(selected ? 1.5 : 1)
        .onTapGesture {
          withAnimation(.bouncy) {
            selected.toggle()
          }
        }
    }
  }
}

#Preview {
  RenderingWithAnimationView()
}

