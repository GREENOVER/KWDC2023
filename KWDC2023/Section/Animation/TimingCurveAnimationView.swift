//
//  TimingCurveAnimationView.swift
//  KWDC2023
//
//  Created by GREEN on 2023/06/16.
//

import SwiftUI

struct TimingCurveAnimationView: View {
  @State private var selectedTab: String = "Linear"
  
  var body: some View {
    VStack {
      Text("Timing curve animation")
        .font(.headline)
        .bold()
      
      Text(selectedTab)
      
      Spacer()
      
      TabView(selection: $selectedTab) {
        // linear
        LinearView()
          .tabItem {
            Image(systemName: "1.circle")
            Text("linear")
          }.tag("Linear")
        
        // easeIn
        EaseInView()
          .tabItem {
            Image(systemName: "2.circle")
            Text("easeIn")
          }.tag("EaseIn")
        
        // easeOut
        EaseOutView()
          .tabItem {
            Image(systemName: "3.circle")
            Text("easeOut")
          }.tag("EaseOut")
        
        // easeInOut
        EaseInOutView()
          .tabItem {
            Image(systemName: "4.circle")
            Text("easeInOut")
          }.tag("EaseInOut")
        
        // custom
        CustomView()
          .tabItem {
            Image(systemName: "5.circle")
            Text("custom")
          }.tag("Custom")
      }
    }
  }
}

 // MARK: - linear
private struct LinearView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .scaleEffect(selected ? 1.5 : 1)
      .onTapGesture {
        withAnimation(.linear(duration: 3.0)) {
          selected.toggle()
        }
      }
  }
}

// MARK: - easeIn
private struct EaseInView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .scaleEffect(selected ? 1.5 : 1)
      .onTapGesture {
        withAnimation(.easeIn(duration: 3.0)) {
          selected.toggle()
        }
      }
  }
}

// MARK: - easeOut
private struct EaseOutView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .scaleEffect(selected ? 1.5 : 1)
      .onTapGesture {
        withAnimation(.easeOut(duration: 3.0)) {
          selected.toggle()
        }
      }
  }
}

// MARK: - easeInOut
private struct EaseInOutView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .scaleEffect(selected ? 1.5 : 1)
      .onTapGesture {
        withAnimation(.easeInOut(duration: 3.0)) {
          selected.toggle()
        }
      }
  }
}

// MARK: - custom
private struct CustomView: View {
  @State private var selected: Bool = false
  private var customCurve: UnitCurve = .bezier(
    startControlPoint: UnitPoint(x: 0.1, y: 0.9),
    endControlPoint: UnitPoint(x: 1.0, y: 1.0)
  )
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .scaleEffect(selected ? 1.5 : 1)
      .onTapGesture {
        withAnimation(.timingCurve(customCurve, duration: 3.0)) {
          selected.toggle()
        }
      }
  }
}

#Preview {
  TimingCurveAnimationView()
}
