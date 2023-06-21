//
//  SpringAnimationView.swift
//  KWDC2023
//
//  Created by GREEN on 2023/06/16.
//

import SwiftUI

struct SpringAnimationView: View {
  @State private var selectedTab: String = "Smooth"
  
  var body: some View {
    VStack {
      Text("Spring animation")
        .font(.headline)
        .bold()
      
      Text(selectedTab)
      
      Spacer()
      
      TabView(selection: $selectedTab) {
        // smooth
        SmoothView()
          .tabItem {
            Image(systemName: "1.circle")
            Text("smooth")
          }.tag("Smooth")
        
        // snappy
        SnappyView()
          .tabItem {
            Image(systemName: "2.circle")
            Text("snappy")
          }.tag("Snappy")
        
        // bouncy
        BouncyView()
          .tabItem {
            Image(systemName: "3.circle")
            Text("bouncy")
          }.tag("Bouncy")
        
        // custom
        CustomView()
          .tabItem {
            Image(systemName: "4.circle")
            Text("custom")
          }.tag("Custom")
        
        // custom
        CustomRepeatView()
          .tabItem {
            Image(systemName: "5.circle")
            Text("custom2")
          }.tag("Custom2")
      }
    }
  }
}

// MARK: - smooth
private struct SmoothView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .scaleEffect(selected ? 1.5 : 1)
      .onTapGesture {
        withAnimation(.smooth(extraBounce: 0.7)) {
          selected.toggle()
        }
      }
  }
}

// MARK: - snappy
private struct SnappyView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .scaleEffect(selected ? 1.5 : 1)
      .onTapGesture {
        withAnimation(.snappy(extraBounce: 0.7)) {
          selected.toggle()
        }
      }
  }
}

// MARK: - bouncy
private struct BouncyView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .scaleEffect(selected ? 1.5 : 1)
      .onTapGesture {
        withAnimation(.bouncy(extraBounce: 0.6)) {
          selected.toggle()
        }
      }
  }
}

// MARK: - custom
private struct CustomView: View {
  @State private var selected: Bool = false
  private var customSpring: Spring = .init(duration: 1.0, bounce: 0.8)
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .scaleEffect(selected ? 1.5 : 1)
      .onTapGesture {
        withAnimation(.spring(customSpring)) {
          selected.toggle()
        }
      }
  }
}

// MARK: - custom (repeat)
private struct CustomRepeatView: View {
  @State private var selected: Bool = false
  private var customSpring: Spring = .init(duration: 1.0, bounce: 1)
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .scaleEffect(selected ? 1.5 : 1)
      .onTapGesture {
        withAnimation(.spring(customSpring)) {
          selected.toggle()
        }
      }
  }
}

#Preview {
  SpringAnimationView()
}
