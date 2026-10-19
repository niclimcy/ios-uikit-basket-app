import MapKit
import UIKit

// UITableViewDelegate: handles user interactions with table rows
// UITableViewDataSource: provides data to populate the table view
class GeneralInfoViewController: UIViewController, UITableViewDelegate,
    UITableViewDataSource
{

    // MARK: - Properties

    private let tableView = UITableView()
    private let mapView = MKMapView()

    // Array of (label, value) tuples for event details
    private let eventInfo = [
        ("Date", "1st - 3rd December 2025"),
        ("Time", "9:00 AM - 5:00 PM"),
        ("Venue", "Ngee Ann Polytechnic Convention Centre"),
        ("Address", "535 Clementi Rd, Singapore 599489"),
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
            mapView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.3
            ),
        ])

        // NP Coordinates: latitude: 1.332, longitude: 103.774
        let coordinate2D = CLLocationCoordinate2D(
            latitude: 1.332,
            longitude: 103.774
        )

        // Use 1000m for both latitudinalMeters and longitudinalMeters
        let coordinateRegion = MKCoordinateRegion(
            center: coordinate2D,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000
        )

        mapView.setRegion(coordinateRegion, animated: true)

        // Set coordinate and title, e.g. "Ngee Ann Polytechnic"
        // Add annotation to mapView using addAnnotation(_:)
        let annotation = MKPointAnnotation(
            coordinate: coordinate2D,
            title: "Ngee Ann Polytechnic",
            subtitle: nil
        )
        mapView.addAnnotation(annotation)
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        // Table view fills remaining space below the map
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
        ])

        tableView.delegate = self
        tableView.dataSource = self

        // Register "cell" for event info rows
        // Register "moreInfoCell" for the "More info" row
        // Use tableView.register(UITableViewCell.self, forCellReuseIdentifier:)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "moreInfoCell"
        )

        // Empty footer view removes separator lines below last row
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemBackground
    }

    // MARK: - UITableViewDataSource

    // Return eventInfo.count + 1 (4 event rows + 1 "More info" row)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return eventInfo.count + 1
    }

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
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let isEventRow = indexPath.row < eventInfo.count
        let identifier = isEventRow ? "cell" : "moreInfoCell"

        let cell = tableView.dequeueReusableCell(
            withIdentifier: identifier,
            for: indexPath
        )

        var content = cell.defaultContentConfiguration()

        if isEventRow {
            let info = eventInfo[indexPath.row]
            content.text = info.0
            content.secondaryText = info.1

            cell.selectionStyle = .none
            cell.accessoryType = .none
        } else {
            content.text = "More info"
            content.textProperties.color = view.tintColor

            cell.selectionStyle = .default
            cell.accessoryType = .disclosureIndicator
        }

        cell.contentConfiguration = content
        return cell
    }

    // MARK: - UITableViewDelegate

    // Check if indexPath.row == eventInfo.count (the "More info" row)
    // Deselect the row with tableView.deselectRow(at:animated:)
    // Push MoreInfoViewController using navigationController?.pushViewController
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        guard indexPath.row == eventInfo.count else { return }
        let vc = MoreInfoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
