import UIKit
import MapKit

// TODO: Conform to the following protocols
// UITableViewDelegate: handles user interactions with table rows
// UITableViewDataSource: provides data to populate the table view
class GeneralInfoViewController: UIViewController {

    // MARK: - Properties

    private let tableView = UITableView()
    private let mapView = MKMapView()

    // Array of (label, value) tuples for event details
    private let eventInfo = [
        ("Date", "1st - 3rd December 2025"),
        ("Time", "9:00 AM - 5:00 PM"),
        ("Venue", "Ngee Ann Polytechnic Convention Centre"),
        ("Address", "535 Clementi Rd, Singapore 599489")
    ]

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "General Info"
        navigationItem.largeTitleDisplayMode = .always

        setupMapView()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Setup

    private func setupMapView() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false

        // Map takes 30% of screen height at the top
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])

        // TODO: Create CLLocationCoordinate2D for your location
        // NP Coordinates: latitude: 1.332, longitude: 103.774

        // TODO: Create MKCoordinateRegion centered on the coordinate
        // Use 1000m for both latitudinalMeters and longitudinalMeters

        // TODO: Set the region on mapView using setRegion(_:animated:)

        // TODO: Create MKPointAnnotation for the location
        // Set coordinate and title, e.g. "Ngee Ann Polytechnic"
        // Add annotation to mapView using addAnnotation(_:)
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        // Table view fills remaining space below the map
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        // TODO: Set tableView.delegate = self
        // TODO: Set tableView.dataSource = self

        // TODO: Register cell identifiers for reuse
        // Register "cell" for event info rows
        // Register "moreInfoCell" for the "More info" row
        // Use tableView.register(UITableViewCell.self, forCellReuseIdentifier:)

        // Empty footer view removes separator lines below last row
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemBackground
    }

    // MARK: - UITableViewDataSource

    // TODO: Implement numberOfRowsInSection
    // Return eventInfo.count + 1 (4 event rows + 1 "More info" row)

    // TODO: Implement cellForRowAt
    // If indexPath.row < eventInfo.count:
    //   - Dequeue cell with identifier "cell"
    //   - Get info tuple from eventInfo array
    //   - Configure cell with defaultContentConfiguration()
    //   - Set text = info.0, secondaryText = info.1
    //   - Set selectionStyle = .none, accessoryType = .none
    // Else (last row is "More info"):
    //   - Dequeue cell with identifier "moreInfoCell"
    //   - Set text = "More info"
    //   - Set textProperties.color = view.tintColor
    //   - Set accessoryType = .disclosureIndicator
    //   - Set selectionStyle = .default

    // MARK: - UITableViewDelegate

    // TODO: Implement didSelectRowAt
    // Check if indexPath.row == eventInfo.count (the "More info" row)
    // Deselect the row with tableView.deselectRow(at:animated:)
    // Push MoreInfoViewController using navigationController?.pushViewController
}
