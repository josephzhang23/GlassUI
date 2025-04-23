//
//  ExamplesApp.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/4/24.
//

import SwiftUI
import GlassUI

@main
struct ExamplesApp: App {
    var body: some Scene {
        WindowGroup {
            GlassUIView()
        }
        .windowResizability(.contentSize)
    }
}
