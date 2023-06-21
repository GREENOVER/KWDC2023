//
//  SectionListView.swift
//  KWDC2023
//
//  Created by GREEN on 2023/06/15.
//

import SwiftUI

struct SectionListView: View {
  var body: some View {
    NavigationStack {
      List {
        NavigationLink(Section.rendering.rawValue, value: Section.rendering)
        NavigationLink(Section.renderingWithAnimation.rawValue, value: Section.renderingWithAnimation)
        NavigationLink(Section.animatable.rawValue, value: Section.animatable)
        NavigationLink(Section.timingCurveAnimation.rawValue, value: Section.timingCurveAnimation)
        NavigationLink(Section.springAnimation.rawValue, value: Section.springAnimation)
        NavigationLink(Section.higherOrderAnimation.rawValue, value: Section.higherOrderAnimation)
        NavigationLink(Section.customAnimation.rawValue, value: Section.customAnimation)
        NavigationLink(Section.transaction.rawValue, value: Section.transaction)
        NavigationLink(Section.phaseAnimator.rawValue, value: Section.phaseAnimator)
        NavigationLink(Section.keyframeAnimator.rawValue, value: Section.keyframeAnimator)
      }
      .navigationTitle("Sections")
      .navigationDestination(for: Section.self) { section in
        switch section {
        case .rendering:
          RenderingView()
          
        case .renderingWithAnimation:
          RenderingWithAnimationView()
          
        case .animatable:
          AnimatableView()
          
        case .timingCurveAnimation:
          TimingCurveAnimationView()
          
        case .springAnimation:
          SpringAnimationView()
          
        case .higherOrderAnimation:
          HigherOrderAnimationView()
          
        case .customAnimation:
          CustomAnimationView()
          
        case .transaction:
          TransactionView()
          
        case .phaseAnimator:
          PhaseAnimatorView()
          
        case .keyframeAnimator:
          KeyframeAnimatorView()
        }
      }
    }
  }
}

// MARK: - 섹션 종류
fileprivate enum Section: String {
  case rendering = "Rendering Update"
  case renderingWithAnimation = "Animation Rendering Update"
  case animatable = "Animatable"
  case timingCurveAnimation = "Timing curve animation"
  case springAnimation = "Spring animation"
  case higherOrderAnimation = "Higher order animation"
  case customAnimation = "Custom animation"
  case transaction = "Transaction"
  case phaseAnimator = "PhaseAnimator"
  case keyframeAnimator = "KeyframeAnimator"
}

#Preview {
  SectionListView()
}
