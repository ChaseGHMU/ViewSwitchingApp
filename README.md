# ViewSwitchingApp

This is an example app as a proof of concept for using multiple table views in one controller. 

### Setup
The app includes a single `ContentViewController` that is the "Host" of the screen. This host holds a `UILabel`, a `UISegmentedControl`, and a `UIView` that handles
managing which table's view will currently be showing. 

The sub tableview's all subclass from a `HostTableViewController` that is a generic UITableView with a protocol for passing information around. All of the table's 
subclasses have the ability to access this protocol to return whatever information it feels necessary to pass through. In this example app, whenever a row is selected
in the table view, it will pass a string back saying the index of the string that was chosen and which table it was chosen from. This type of setup is valuable for
many different solutions in app, such as a settings screen, or any screen that may include a table for current things and a table for past things.
