//
//  MoreDropDownPanelViewController.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 31/05/2021.
//

import UIKit
import FloatingPanel
import FontAwesomeKit

enum TweetMoreActions {
    case notInterested
    case unfollow
    case mute
    case unmute
    case block
    case reportTweet
}

class MoreDropDownPanelViewController: UIViewController {
    
    public var dismissFloatingPanel: (() -> Void)?
    
    public let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.isScrollEnabled = false
        table.backgroundColor = .clear
        return table
    }()
    
    private lazy var buttonFooter: RoundedButton = {
        let view = RoundedButton(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 55))
        return view
    }()
    
    private var items = [PanelTableCellViewModel]()
    
    private var model: HomeFeedTableCellViewModel!
    
    init(with model: HomeFeedTableCellViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.model = model
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        PanelTableCell.register(in: tableView)
        
        tableView.tableFooterView = buttonFooter
        
        buttonFooter.mainButton.addTarget(self, action: #selector(didTapCancel), for: .touchUpInside)
        
        configureItems()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 25, left: 0, bottom: 0, right: 0))
    }
    
    func floatingLayoutHeight() -> CGFloat {
        tableView.layoutIfNeeded()
        return tableView.contentSize.height + 10
    }
    
    @objc
    private func didTapCancel() {
        dismissFloatingPanel?()
    }
    
    private func configureItems() {
        let userNamePerfixed = "@\(model.userName)"
        items = [
            PanelTableCellViewModel(title: "Not interested in this tweet", icon: UIImage(systemName: "xmark.circle")),
            PanelTableCellViewModel(title: "Unfollow \(userNamePerfixed)", icon: UIImage(systemName: "person.badge.minus.fill")),
            PanelTableCellViewModel(title: "Mute \(userNamePerfixed)", icon: UIImage(systemName: "speaker.slash")),
            PanelTableCellViewModel(title: "Block \(userNamePerfixed)", icon: UIImage(systemName: "slash.circle")),
            PanelTableCellViewModel(title: "Report Tweet", icon: UIImage(systemName: "flag")),
        ]
    }
}

extension MoreDropDownPanelViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PanelTableCell.dequeue(from: tableView, forIndexPath: indexPath)
        let model = items[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


//MARK:- Panel Styling -
extension MoreDropDownPanelViewController {
    class MyFloatingPanelLayout: FloatingPanelLayout {
        let position: FloatingPanelPosition = .bottom
        let initialState: FloatingPanelState = .half
        var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
            return [
                .half: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .safeArea)
            ]
        }
        
        func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
            if state == FloatingPanelState.half {
                return 0.3
            }
            return 0.0
        }
    }
    
    static func panelAppearance() -> SurfaceAppearance {
        // Create a new appearance.
        let appearance = SurfaceAppearance()
        
        // Define shadows
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black
        shadow.offset = CGSize(width: 0, height: 16)
        shadow.radius = 16
        shadow.spread = 8
        appearance.shadows = [shadow]
        
        // Define corner radius and background color
        appearance.cornerRadius = 16.0
        appearance.backgroundColor = .accentColor
        
        return appearance
        
    }
}
