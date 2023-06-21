//
//  KeyframeAnimatorView.swift
//  KWDC2023
//
//  Created by GREEN on 2023/06/19.
//

import SwiftUI

struct KeyframeAnimatorView: View {
  @State private var selected: Bool = false
  
  var body: some View {
    
    ZStack {
      VStack {
        Text("KeyframeAnimator")
          .font(.headline)
          .bold()
        
        Spacer()
      }
      
      Image("momo")
        .resizable()
        .scaledToFit()
        .frame(width: 250)
        .onTapGesture {
          selected.toggle()
        }
        .keyframeAnimator(
          initialValue: CustomAnimationValues(),
          trigger: selected
        ) { content, value in
          content
            .rotationEffect(value.angle)
            .scaleEffect(value.scale)
            .scaleEffect(y: value.verticalStretch)
            .offset(y: value.verticalTranslation)
        } keyframes: { _ in
          KeyframeTrack(\.scale) {
            LinearKeyframe(1.0, duration: 0.5)
            SpringKeyframe(1.5, duration: 0.8, spring: .bouncy)
            SpringKeyframe(1.0, spring: .bouncy)
          }
          
          KeyframeTrack(\.verticalStretch) {
            LinearKeyframe(1.0, duration: 0.5)
            CubicKeyframe(1.5, duration: 0.8)
            SpringKeyframe(1.0, spring: .bouncy)
          }
          
          KeyframeTrack(\.verticalTranslation) {
            LinearKeyframe(1.0, duration: 0.5)
            SpringKeyframe(1.5, duration: 0.8, spring: .bouncy)
            SpringKeyframe(1.0, spring: .bouncy)
          }
          
          KeyframeTrack(\.angle) {
            LinearKeyframe(.degrees(90), duration: 0.5)
            SpringKeyframe(.degrees(180), duration: 0.8, spring: .bouncy)
            SpringKeyframe(.degrees(0), spring: .bouncy)
          }
        }
    }
  }
}

// MARK: - Custom Animation Values
fileprivate struct CustomAnimationValues {
  fileprivate var scale = 1.0
  fileprivate var verticalStretch = 1.0
  fileprivate var verticalTranslation = 0.0
  fileprivate var angle = Angle.zero
}

#Preview {
  KeyframeAnimatorView()
}
