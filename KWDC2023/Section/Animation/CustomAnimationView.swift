//
//  CustomAnimationView.swift
//  KWDC2023
//
//  Created by GREEN on 2023/06/17.
//

import SwiftUI

struct CustomAnimationView: View {
  @State private var selectedTab: String = "ShouldMerge (True)"
  
  var body: some View {
    VStack {
      Text("Custom animation")
        .font(.system(size: 15))
        .bold()
      
      Text(selectedTab)
      
      Spacer()
      
      TabView(selection: $selectedTab) {
        // shouldMerge (True)
        ShouldMergeView(shouldMerge: true)
          .tabItem {
            Image(systemName: "1.circle")
            Text("shouldMerge (True)")
          }.tag("ShouldMerge (True)")
        
        // shouldMerge (False)
        ShouldMergeView(shouldMerge: false)
          .tabItem {
            Image(systemName: "2.circle")
            Text("shouldMerge (False)")
          }.tag("ShouldMerge (False)")
      }
    }
  }
}

// MARK: - shouldMerge
private struct ShouldMergeView: View {
  @State private var selected: Bool = false
  @State private var rotation: Double = 0
  private var shouldMerge: Bool
  private var rotationAnimation: Animation {
    Animation.linear.repeatForever(autoreverses: false)
  }
  
  fileprivate init(
    selected: Bool = false,
    rotation: Double = 0,
    shouldMerge: Bool
  ) {
    self.selected = selected
    self.rotation = rotation
    self.shouldMerge = shouldMerge
  }
  
  fileprivate var body: some View {
    Image("basicMashong")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .rotationEffect(Angle(degrees: rotation))
      .animation(
        .init(GreenAnimation(duration: 2.0, shouldMerge: shouldMerge)),
        value: selected
      )
      .gesture(
        TapGesture().onEnded { _ in
          selected.toggle()
          if selected {
            rotation += 360
          } else {
            rotation = 0
          }
        }
      )
  }
}

// MARK: - CustomAnimation
private struct GreenAnimation: CustomAnimation {
  fileprivate var duration: CGFloat
  fileprivate var shouldMerge: Bool
  
  fileprivate func animate<V>(
    value: V,
    time: TimeInterval,
    context: inout AnimationContext<V>
  ) -> V? where V : VectorArithmetic {
    if time <= duration {
      return value.scaled(by: time / duration)
    } else {
      return nil
    }
  }
  
  fileprivate func shouldMerge<V>(previous: Animation, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic {
    return shouldMerge
  }
  
  fileprivate func velocity<V>(
    value: V,
    time: TimeInterval,
    context: AnimationContext<V>
  ) -> V? where V : VectorArithmetic {
    value.scaled(by: 1.0 / duration)
  }
}

#Preview {
  CustomAnimationView()
}
