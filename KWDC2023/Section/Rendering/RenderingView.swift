//
//  RenderingView.swift
//  KWDC2023
//
//  Created by GREEN on 2023/06/15.
//

import SwiftUI

struct RenderingView: View {
  @State private var selected: Bool = false
  
  var body: some View {
    ZStack {
      VStack {
        Text("View Rendering Update in SwiftUI")
          .font(.headline)
          .bold()
        
        Spacer()
      }
      
      Image("basicMashong")
        .resizable()
        .scaledToFit()
        .frame(width: 250)
        .scaleEffect(selected ? 1.5 : 1)
        .onTapGesture {
          selected.toggle()
        }
    }
  }
}

#Preview {
  RenderingView()
}
