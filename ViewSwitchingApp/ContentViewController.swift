//
//  ContentViewController.swift
//  ViewSwitchingApp
//
//  Created by Chase Allen on 8/6/20.
//  Copyright © 2020 Chase Allen. All rights reserved.
//

import UIKit


final class ContentViewController: UIViewController {
    
    private lazy var label: UILabel = lazyUILabel()
    private lazy var segmentedControl: UISegmentedControl = lazySegmentedControl()
    private lazy var contentView: UIView = lazyUIView()
    
    private lazy var greenTVC: HostTableViewController = GreenTableViewController(style: .plain)
    private lazy var blueTVC: HostTableViewController = BlueTableViewController(style: .plain)
    private lazy var yellowTVC: HostTableViewController = YellowTableViewController(style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Host View Controller Example"
        initializeBaseView()
        
        contentView.addSubview(greenTVC.view)
    }
}

//MARK: - Segemented Control Functions
extension ContentViewController {
    @objc func segmentedControlDidChange(control: UISegmentedControl) {
        switchView(toIndex: control.selectedSegmentIndex)
    }
    
    private func switchView(toIndex index: Int) {
        contentView.removeAllSubviews()
        
        switch TableView(rawValue: index) {
            case .blue:
                contentView.addSubview(blueTVC.view)
                blueTVC.view.frame = contentView.bounds
                blueTVC.hostDelegate = self
            case.yellow:
                contentView.addSubview(yellowTVC.view)
                yellowTVC.view.frame = contentView.bounds
                yellowTVC.hostDelegate = self
            case .green:
                contentView.addSubview(greenTVC.tableView)
                greenTVC.view.frame = contentView.bounds
                greenTVC.hostDelegate = self
            default:
                break
        }
    }
}

extension ContentViewController: HostTableViewControllerDelegate {
    func tableViewRowSelected(withText text: String) {
        label.text = text
    }
    
}

extension ContentViewController {
    func initializeBaseView() {
        self.view = UIView()
        self.view.backgroundColor = .white
        let guide = view.readableContentGuide
        
        view.addSubview(contentView)
        view.addSubview(segmentedControl)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            contentView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30)
        ])
        
    }
}

extension ContentViewController {
    func lazyUIView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func lazySegmentedControl() -> UISegmentedControl {
        let control = UISegmentedControl()
        control.insertSegment(withTitle: "Yellow", at: 0, animated: true)
        control.insertSegment(withTitle: "Blue", at: 0, animated: true)
        control.insertSegment(withTitle: "Green", at: 0, animated: true)
        control.addTarget(self, action: #selector(segmentedControlDidChange(control:)), for: .valueChanged)
        control.selectedSegmentIndex = 0
        switchView(toIndex: 0)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }
    
    func lazyUILabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }
    
    private enum TableView: Int {
        case green = 0
        case blue
        case yellow
    }
}
