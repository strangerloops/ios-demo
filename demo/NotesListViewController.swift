import UIKit

class NotesListViewController: UITableViewController {

    var notes: [Note] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Notes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("newNote"))
    }

    override func viewWillAppear(animated: Bool) {
        print("view will appear!")
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.text
        return cell
    }

    func newNote() {
        let newNoteController = AddNoteViewController(completion: { (note: Note) -> () in
            self.notes.append(note)
            self.tableView.reloadData()
        })
        let navigation = UINavigationController()
        navigation.setViewControllers([newNoteController], animated: true)
        presentViewController(navigation, animated: true, completion: nil)
        print("new note!")
    }
}

