//
//  TransactionView.swift
//  KWDC2023
//
//  Created by GREEN on 2023/06/18.
//

import SwiftUI

struct TransactionView: View {
  @State private var selectedTab: String = "Ordinary"
  
  var body: some View {
    VStack {
      Text("Custom animation")
        .font(.system(size: 15))
        .bold()
      
      Text(selectedTab)
      
      Spacer()
      
      TabView(selection: $selectedTab) {
        OrdinaryView()
          .tabItem {
            Image(systemName: "1.circle")
            Text("ordinary")
          }.tag("Ordinary")
        
        TransactionAnimationView()
          .tabItem {
            Image(systemName: "2.circle")
            Text("transaction")
          }.tag("Transaction")
        
        MultipleAnimationView()
          .tabItem {
            Image(systemName: "3.circle")
            Text("multiple")
          }.tag("Multiple")
        
        UnintentionalAnimationView()
          .tabItem {
            Image(systemName: "4.circle")
            Text("unintentional")
          }.tag("Unintentional")
        
        NewAnimationView()
          .tabItem {
            Image(systemName: "5.circle")
            Text("newAnimation")
          }.tag("New Animation")
      }
    }
  }
}

// MARK: - 기존
private struct OrdinaryView: View {
  @State private var selected: Bool = false
  
  private var customCurve: UnitCurve = .bezier(
    startControlPoint: UnitPoint(x: 0.1, y: 0.9),
    endControlPoint: UnitPoint(x: 1.0, y: 1.0)
  )
  
  fileprivate var body: some View {
    VStack {
      Image("iOSMashong")
        .resizable()
        .scaledToFit()
        .frame(width: 250)
        .scaleEffect(selected ? 1.5 : 1)
        .onTapGesture {
          withAnimation(.easeInOut(duration: 3.0)) {
            selected.toggle()
          }
        }
      
      Image("thinkingMashong")
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
}

// MARK: - Transaction
private struct TransactionAnimationView: View {
  @State private var selected: Bool = false
  private var customCurve: UnitCurve = .bezier(
    startControlPoint: UnitPoint(x: 0.1, y: 0.9),
    endControlPoint: UnitPoint(x: 1.0, y: 1.0)
  )
  
  fileprivate var body: some View {
    VStack {
      Image("iOSMashong")
        .resizable()
        .scaledToFit()
        .frame(width: 250)
        .scaleEffect(selected ? 1.5 : 1)
        .transaction {
          $0.animation = .easeInOut(duration: 3.0)
        }
        .onTapGesture {
          withAnimation(.easeInOut(duration: 3.0)) {
            selected.toggle()
          }
        }
      
      Image("thinkingMashong")
        .resizable()
        .scaledToFit()
        .frame(width: 250)
        .scaleEffect(selected ? 1.5 : 1)
        .transaction {
          $0.animation = .timingCurve(customCurve, duration: 3.0)
        }
        .onTapGesture {
          withAnimation(.timingCurve(customCurve, duration: 3.0)) {
            selected.toggle()
          }
        }
    }
  }
}

// MARK: - Mutiple Animation
private struct MultipleAnimationView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("iOSMashong")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .shadow(color: .green.opacity(0.5), radius: selected ? 50 : 0)
      .animation(.linear(duration: 10.0), value: selected)
      .scaleEffect(selected ? 1.5 : 1)
      .animation(.bouncy(duration: 3.0), value: selected)
      .onTapGesture {
        selected.toggle()
      }
  }
}

// MARK: - Unintentional Animation
private struct UnintentionalAnimationView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("iOSMashong")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .shadow(color: .green.opacity(0.5), radius: selected ? 50 : 0)
      .scaleEffect(selected ? 1.5 : 1)
      .animation(.bouncy(duration: 3.0), value: selected)
      .onTapGesture {
        selected.toggle()
      }
  }
}

// MARK: - New animation modifier
private struct NewAnimationView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("iOSMashong")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .animation(.linear(duration: 10.0)) {
        $0.shadow(color: .green.opacity(0.5), radius: selected ? 50 : 0)
      }
      .animation(.bouncy(duration: 3.0)) {
        $0.scaleEffect(selected ? 1.5 : 1)
      }
      .onTapGesture {
        selected.toggle()
      }
  }
}

// MARK: - TransactionKey
private struct TransactionKeyView: View {
  @State private var selected: Bool = false
  
  fileprivate var body: some View {
    Image("iOSMashong")
      .resizable()
      .scaledToFit()
      .frame(width: 250)
      .transaction {
        $0.animation = $0.tapped ? .linear(duration: 10.0) : .bouncy
      } body: {
        $0.scaleEffect(selected ? 1.5 : 1)
      }
      .onTapGesture {
        withTransaction(\.tapped, true) {
          selected.toggle()
        }
      }
  }
}

struct CustomTransactionKey: TransactionKey {
  static let defaultValue: Bool = false
}

extension Transaction {
  var tapped: Bool {
    get { self[CustomTransactionKey.self] }
    set { self[CustomTransactionKey.self] = newValue }
  }
}


#Preview {
  TransactionView()
}
