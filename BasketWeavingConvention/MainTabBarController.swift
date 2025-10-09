import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // TODO: Create three view controllers for the tabs:
        // - GeneralInfoViewController (for Info tab)
        // - TalksPageViewController (for Talks tab)
        // - NameCardDisplayViewController (for Name Card tab)

        // TODO: Configure tab bar items for each view controller
        // Use UITabBarItem(title:, image:, tag:)
        // Suggested icons: "info.circle", "speaker", "person.crop.rectangle"

        // TODO: Wrap each view controller in a navigation controller
        // Use the createNavigationController(for:) helper method below

        // TODO: Set self.viewControllers to an array of the navigation controllers
    }

    // MARK: - Helper Methods

    /// Creates a navigation controller with large titles enabled
    /// - Parameter rootViewController: The view controller to wrap in navigation
    /// - Returns: Navigation controller containing the root view controller
    private func createNavigationController(for rootViewController: UIViewController) -> UINavigationController {
        // Enable large titles for this view controller
        rootViewController.navigationItem.largeTitleDisplayMode = .always

        // Create navigation controller with this view controller as root
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true

        return navigationController
    }
}
