//
//  SwiftUIComponentsMobileView.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI
import GlassUI

struct GlassUIMobileView: View {
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 0) {
                    hero
                }
            }
            .ignoresSafeArea()
            NavigationMenu("GlassUI") {
                Image(systemName: "square.on.square.intersection.dashed")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            } menu: {} buttons: {}
            .padding(.horizontal, 20)
        }
    }
    
    var hero: some View {
        ZStack {
            BackgroundWeb1()
            content
                .padding(.horizontal, 20)
                .padding(.vertical, 64)
        }
    }
    
    var content: some View {
        VStack(spacing: 40) {
            textBlock
            templateCard
            menu
        }
    }
    
    var textBlock: some View {
        VStack(alignment: .leading, spacing: 20) {
            ButtonPrimary(.small, title: "Buy at 50% off") { Image(systemName: "chevron.right") }
            Text("Build a beautiful, funcitonal app with GlassUI")
                .font(.heading3)
            Text("A vast, dynamic design system with hundreds of customizable UI components and templates, ready for SwiftUI deployment and meticulously organized with parameters, variants and adaptive layouts. Made from decades of pushing pixels.")
                .font(.bodyRegular)
                .foregroundStyle(.foreground(.secondary))
            HStack(spacing: 10) {
                ButtonLogo {
                    Image("Xcode Logo")
                        .resizable()
                        .scaledToFit()
                }
                ButtonLogo {
                    Image(systemName: "swift")
                        .resizable()
                        .scaledToFit()
                        .padding(3)
                }
            }
            ButtonShiny(.large, titleKey: "Preview in Xcode") {
                Image("Xcode Logo")
                    .resizable()
                    .scaledToFit()
            } rightIcon: {}
            ButtonShiny(.large, titleKey: "SwiftUI Template") {
                Image(systemName: "swift")
                    .resizable()
                    .scaledToFit()
                    .padding(2)
            } rightIcon: {}
        }
        .padding(.top, 64)
    }
    
    var templateCard: some View {
        TemplateCard {
            ZStack(alignment: .topLeading) {
                Color.clear
                    .frame(height: 200)
                    .overlay {
                        Image("Image")
                            .resizable()
                            .scaledToFill()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .inset(by: 0.5)
                            .stroke(LinearGradient(stops: [
                                .init(color: .white, location: 0),
                                .init(color: .white.opacity(0), location: 0.48),
                                .init(color: .white, location: 1)
                            ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .stroke(.white.opacity(0.1), lineWidth: 1)
                            .blendMode(.overlay)
                    }
                    .compositingGroup()
                    .shadow(color: .black.opacity(0.1), radius: .point(60), y: .point(30))
                    .shadow(color: .black.opacity(0.5), radius: .point(60), y: .point(30))
                ButtonLogo {
                    Image(systemName: "swift")
                }
                .padding(10)
            }
        } content: {
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 8) {
                    Image(systemName: "circle.dotted")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .fontWeight(.black)
                    Text("New update")
                        .font(.captionRegular)
                        .foregroundStyle(.foreground(.secondary))
                    Spacer()
                    HStack(spacing: 0) {
                        ButtonIcon(.small) {
                            Image(systemName: "arrow.left")
                        }
                        .disabled(true)
                        Separator()
                        ButtonIcon(.small) {
                            Image(systemName: "arrow.right")
                        }
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .overlay {
                        RoundedRectangle(cornerRadius: 30)
                            .inset(by: 0.5)
                            .stroke(.container(.divider), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    }
                }
                DividerLine()
                Text("UI Templates")
                    .font(.footnoteMedium)
                Text("Introducing a collection of fully designed and functional components, tailored to enhance...")
                    .font(.captionRegular)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .width(.full, alignment: .leading)
                DividerLine()
                ButtonGlow(.medium, text: "Browse templates") {
                    Image(systemName: "circle.hexagongrid")
                }
            }
            .padding(10)
        }
        .padding(5)
    }    
    
    var menu: some View {
        VStack(spacing: 30) {
            LayersMenu {
                ButtonTooltip(.medium, text: "Wallpaper") {
                    Image(systemName: "photo")
                } rightIcon: {
                    Image(systemName: "eye")
                }
                DividerLine()
                ButtonTooltip(.medium, text: "Blurs") {
                    Image(systemName: "drop.halffull")
                } rightIcon: {
                    Image(systemName: "eye")
                }
                DividerLine()
                ButtonTooltip(.medium, text: "Overlay") {
                    Image(systemName: "wand.and.stars.inverse")
                } rightIcon: {
                    Image(systemName: "eye")
                }
                DividerLine()
                ButtonTooltip(.medium, text: "UI Components", state: .selected) {
                    Image(systemName: "iphone")
                        .symbolRenderingMode(.monochrome)
                } rightIcon: {
                    Image(systemName: "eye")
                }
                SegmentedControl {
                    ButtonToggle(.small, titleKey: "Glass", state: .selected, showRightIcon: false)
                    ButtonToggle(.small, titleKey: "Outline", showRightIcon: false)
                    ButtonToggle(.small, titleKey: "Flat", showRightIcon: false)
                }
                .padding(10)
                .width(.full)
                HStack(spacing: 10) {
                    GridItem {
                        Image(systemName: "moon")
                            .resizable()
                            .fontWeight(.medium)
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .padding(12)
                    }
                    GridItem {
                        Image(systemName: "sun.max")
                            .resizable()
                            .fontWeight(.medium)
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                    }
                    GridItem {
                        Image(systemName: "wand.and.stars.inverse")
                            .resizable()
                            .fontWeight(.medium)
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                    }
                    GridItem {
                        Image(systemName: "eye")
                            .resizable()
                            .fontWeight(.medium)
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                    }
                }
                .padding(10)
                .width(.full)
                SegmentedControl {
                    ButtonToggle(.small, titleKey: "sm", state: .selected, showRightIcon: false)
                    ButtonToggle(.small, titleKey: "md", showRightIcon: false)
                    ButtonToggle(.small, titleKey: "lg", showRightIcon: false)
                }
                .padding(10)
                .width(.full)
            }
        }
    }
}

#Preview {
    GlassUIMobileView()
}
