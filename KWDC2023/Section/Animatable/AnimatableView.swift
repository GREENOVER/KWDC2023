//
//  AnimatableView.swift
//  KWDC2023
//
//  Created by GREEN on 2023/06/15.
//

import SwiftUI

struct AnimatableView: View {
  @State var x: CGFloat = 50
  @State var y: CGFloat = 50
  @State private var fillColor: Color = randomColor()
  @State private var isOn: Bool = false
  
  var body: some View {
    ZStack {
      VStack {
        Text("Animatable")
          .font(.headline)
          .bold()
        
        Spacer()
      }
      
      VStack {
        Spacer()
          .frame(height: 30)
        
        HStack {
          Spacer()
          
          Toggle(
            isOn: $isOn,
            label: {
              HStack {
                Spacer()
                
                Text("Apply Animation")
                  .font(.system(size: 15))
                  .foregroundStyle(.gray)
              }
            }
          )
          
          Spacer()
            .frame(width: 50)
        }
        
        Spacer()
        
        if isOn {
          CustomCircleWithAnimatableData(x: x, y: y)
            .fill(fillColor)
            .frame(width: 100, height: 100)
        } else {
          CustomCircle(x: x, y: y)
            .fill(fillColor)
            .frame(width: 100, height: 100)
        }
        
        Spacer()
        
        Button("Change Circle") {
          withAnimation(.bouncy) {
            self.fillColor = randomColor()
            x = CGFloat.random(in: 15...200)
            y = CGFloat.random(in: 10...100)
          }
        }
      }
    }
  }
}

// MARK: - 커스텀 써클 (animatableData)
fileprivate struct CustomCircleWithAnimatableData: Shape {
  fileprivate var x: CGFloat
  fileprivate var y: CGFloat
  
  fileprivate var animatableData: AnimatablePair<CGFloat, CGFloat> {
    get { AnimatablePair(x, y) }
    set {
      x = newValue.first
      y = newValue.second
    }
  }
  
  fileprivate func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let scaleX = rect.width / (2 * x)
    let scaleY = rect.height / (2 * y)
    path.addEllipse(
      in: CGRect(x: center.x - x, y: center.y - y, width: 2 * x, height: 2 * y)
    )
    return path.applying(CGAffineTransform(scaleX: scaleX, y: scaleY))
  }
}

// MARK: - 커스텀 써클 (no animatableData)
fileprivate struct CustomCircle: Shape {
  fileprivate var x: CGFloat
  fileprivate var y: CGFloat
  
  fileprivate func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let scaleX = rect.width / (2 * x)
    let scaleY = rect.height / (2 * y)
    path.addEllipse(
      in: CGRect(x: center.x - x, y: center.y - y, width: 2 * x, height: 2 * y)
    )
    return path.applying(CGAffineTransform(scaleX: scaleX, y: scaleY))
  }
}

// MARK: - 랜덤 컬러
fileprivate func randomColor() -> Color {
  let red = Double.random(in: 0...1)
  let green = Double.random(in: 0...1)
  let blue = Double.random(in: 0...1)
  return Color(red: red, green: green, blue: blue)
}

#Preview {
  AnimatableView()
}
