//
//  HigherOrderAnimationView.swift
//  KWDC2023
//
//  Created by GREEN on 2023/06/16.
//

import SwiftUI

struct HigherOrderAnimationView: View {
  @State private var selectedTab: String = "Delay"
  
  var body: some View {
    VStack {
      Text("Higher order animation")
        .font(.headline)
        .bold()
      
      Text(selectedTab)
      
      Spacer()
      
      TabView(selection: $selectedTab) {
        // delay
        DelayView()
          .tabItem {
            Image(systemName: "1.circle")
            Text("delay")
          }.tag("Delay")
        
        // repeat
        RepeatView()
          .tabItem {
            Image(systemName: "2.circle")
            Text("repeat")
          }.tag("Repeat")
        
        // repeatForever
        RepeatForeverView()
          .tabItem {
            Image(systemName: "3.circle")
            Text("repeatForever")
          }.tag("RepeatForever")
        
        // autoreverses
        AutoreversesView()
          .tabItem {
            Image(systemName: "4.circle")
            Text("autoreverses")
          }.tag("Autoreverses")
        
        // stopAnimation
        StopAnimationView()
          .tabItem {
            Image(systemName: "5.circle")
            Text("stopAnimation")
          }.tag("Stop Animation")
      }
    }
  }
}

// MARK: - delay
private struct DelayView: View {
  @State private var rotation: Double = 0
  
  fileprivate var body: some View {
    Image("basicMashong")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .rotationEffect(Angle(degrees: rotation))
      .gesture(
        TapGesture().onEnded { _ in
          withAnimation(.linear.delay(1.0)) {
            rotation += 360
          }
        }
      )
  }
}

// MARK: - repeat
private struct RepeatView: View {
  @State private var rotation: Double = 0
  
  fileprivate var body: some View {
    Image("basicMashong")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .rotationEffect(Angle(degrees: rotation))
      .gesture(
        TapGesture().onEnded { _ in
          withAnimation(.bouncy.repeatCount(3)) {
            rotation += 360
          }
        }
      )
  }
}

// MARK: - repeatForever
private struct RepeatForeverView: View {
  @State private var rotation: Double = 0
  
  fileprivate var body: some View {
    Image("basicMashong")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .rotationEffect(Angle(degrees: rotation))
      .gesture(
        TapGesture().onEnded { _ in
          withAnimation(.linear.repeatForever()) {
            rotation += 360
          }
        }
      )
  }
}

// MARK: - autoreverses
private struct AutoreversesView: View {
  @State private var rotation: Double = 0
  
  fileprivate var body: some View {
    Image("basicMashong")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .rotationEffect(Angle(degrees: rotation))
      .gesture(
        TapGesture().onEnded { _ in
          withAnimation(.linear.repeatCount(3, autoreverses: false)) {
            rotation += 360
          }
        }
      )
  }
}

// MARK: - stopAnimation
private struct StopAnimationView: View {
  @State private var selected: Bool = false
  @State private var rotation: Double = 0
  
  private var rotationAnimation: Animation {
    Animation.linear.repeatForever(autoreverses: false)
  }
  
  fileprivate var body: some View {
    Image("basicMashong")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .rotationEffect(Angle(degrees: rotation))
      .animation(selected ? rotationAnimation : .default, value: selected)
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

#Preview {
  HigherOrderAnimationView()
}
