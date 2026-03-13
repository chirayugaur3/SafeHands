import SwiftUI

// MARK: - Tab Definition

enum SHTab: String, CaseIterable {
    case home
    case discover
    case community
    case ai
    case profile
}

// MARK: - Content View

struct ContentView: View {
    @State private var selectedTab: SHTab = .home
    @AppStorage("onboardingComplete") private var onboardingComplete = false
    @State private var aiFromLogging = false

    var body: some View {
        Group {
            if onboardingComplete {
                mainTabView
            } else {
                OnboardingView()
            }
        }
        .onReceive(
            NotificationCenter.default.publisher(
                for: Notification.Name("onboardingCompleted")
            )
        ) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                onboardingComplete = true
            }
        }
    }

    // MARK: - Main Tab View

    private var mainTabView: some View {
        TabView(selection: $selectedTab) {
            Tab("home", systemImage: "house.fill", value: .home) {
                HomeView(switchToAI: {
                    aiFromLogging = true
                    selectedTab = .ai
                })
            }

            Tab("discover", systemImage: "magnifyingglass", value: .discover) {
                DiscoverView()
            }

            Tab("community", systemImage: "person.3.fill", value: .community) {
                Text("Community")
                    .font(SHFont.serifHeadline(22))
                    .foregroundStyle(Color.deepIndigo)
                    .safeHandsBackground()
            }

            Tab("ai", systemImage: "sparkles", value: .ai) {
                AIView(fromLogging: aiFromLogging)
            }

            Tab("profile", systemImage: "person.fill", value: .profile) {
                ProfileView()
            }
        }
        .tint(Color.deepIndigo)
        .onChange(of: selectedTab) { oldTab, newTab in
            if newTab == .ai && oldTab != .home {
                aiFromLogging = false
            }
            if oldTab == .ai && newTab != .ai {
                aiFromLogging = false
            }
        }
        .onChange(of: onboardingComplete) { _, newValue in
            if !newValue {
                selectedTab = .home
            }
        }
    }
}

#Preview {
    ContentView()
}
