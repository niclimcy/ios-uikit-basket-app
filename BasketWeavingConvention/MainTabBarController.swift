import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // - GeneralInfoViewController (for Info tab)
        // - TalksPageViewController (for Talks tab)
        // - NameCardDisplayViewController (for Name Card tab)
        let generalView = GeneralInfoViewController()
        let talksView = TalksPageViewController()
        let nameCardView = NameCardDisplayViewController()

        // Use UITabBarItem(title:, image:, tag:)
        // Suggested icons: "info.circle", "speaker", "person.crop.rectangle"
        generalView.tabBarItem = UITabBarItem(
            title: "General Info",
            image: UIImage(systemName: "info.circle"),
            tag: 0
        )
        talksView.tabBarItem = UITabBarItem(
            title: "Talks",
            image: UIImage(systemName: "speaker"),
            tag: 1
        )
        nameCardView.tabBarItem = UITabBarItem(
            title: "Name Card",
            image: UIImage(systemName: "person.crop.rectangle"),
            tag: 2
        )

        // Use the createNavigationController(for:) helper method below
        let infoNavController = createNavigationController(for: generalView)
        let talksNavController = createNavigationController(for: talksView)
        let nameCardNavController = createNavigationController(for: nameCardView)

        self.viewControllers = [infoNavController, talksNavController, nameCardNavController]
    }

    // MARK: - Helper Methods

    /// Creates a navigation controller with large titles enabled
    /// - Parameter rootViewController: The view controller to wrap in navigation
    /// - Returns: Navigation controller containing the root view controller
    private func createNavigationController(
        for rootViewController: UIViewController
    ) -> UINavigationController {
        // Enable large titles for this view controller
        rootViewController.navigationItem.largeTitleDisplayMode = .always

        // Create navigation controller with this view controller as root
        let navigationController = UINavigationController(
            rootViewController: rootViewController
        )
        navigationController.navigationBar.prefersLargeTitles = true

        return navigationController
    }
}

#Preview {
    MainTabBarController()
}
