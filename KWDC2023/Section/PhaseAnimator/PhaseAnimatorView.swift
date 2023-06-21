//
//  PhaseAnimatorView.swift
//  KWDC2023
//
//  Created by GREEN on 2023/06/19.
//

import SwiftUI

struct PhaseAnimatorView: View {
  @State private var selectedTab: String = "Basic"
  
  var body: some View {
    VStack {
      Text("PhaseAnimator")
        .font(.system(size: 15))
        .bold()
      
      Text(selectedTab)
      
      Spacer()
      
      TabView(selection: $selectedTab) {
        BasicPhaseAnimatorView()
          .tabItem {
            Image(systemName: "1.circle")
            Text("basic")
          }.tag("Basic")
        
        TriggerPhaseAnimatorView()
          .tabItem {
            Image(systemName: "2.circle")
            Text("trigger")
          }.tag("Trigger")
        
        MultiplePhaseAnimatorView()
          .tabItem {
            Image(systemName: "3.circle")
            Text("multiple")
          }.tag("Mutilple")
      }
    }
  }
}

// MARK: - Basic Phase Animator
private struct BasicPhaseAnimatorView: View {
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .phaseAnimator([false, true]) { content, phase in
        content
          .scaleEffect(phase ? 1.5 : 1)
      } animation: { phase in
          .easeIn(duration: 2.0)
      }
  }
}

// MARK: - Trigger Phase Animator
private struct TriggerPhaseAnimatorView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .onTapGesture {
        selected.toggle()
      }
      .phaseAnimator(
        [false, true],
        trigger: selected
      ) { content, phase in
        content
          .scaleEffect(phase ? 1.5 : 1)
      } animation: { phase in
          .easeIn(duration: 2.0)
      }
  }
}

// MARK: - Multiple Phase Animator
private struct MultiplePhaseAnimatorView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("momo")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .onTapGesture {
        selected.toggle()
      }
      .phaseAnimator(
        CustomPhase.allCases,
        trigger: selected
      ) { content, phase in
        content
          .scaleEffect(phase.scale)
          .offset(y: phase.verticalOffset)
      } animation: { phase in
        switch phase {
        case .initial: .smooth
        case .move: .easeInOut(duration: 0.3)
        case .scale: .spring(
          duration: 0.3,
          bounce: 0.7
        )
        }
      }
  }
}

// MARK: - Custom Phase
private enum CustomPhase: CaseIterable {
  case initial, move, scale
  
  var verticalOffset: Double {
    switch self {
    case .initial:
      return 0
    case .move:
      return -100
    case .scale:
      return -100
    }
  }
  
  var scale: Double {
    switch self {
    case .initial:
      return 1.0
    case .move:
      return 1.0
    case .scale:
      return 1.5
    }
  }
}

#Preview {
  PhaseAnimatorView()
}
