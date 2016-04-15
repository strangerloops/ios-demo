import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    let completion: (Note) -> Void

    init(completion: (Note) -> ()) {
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: Selector("saveNote"))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: Selector("cancel"))
    }

    func cancel(){
        dismissViewControllerAnimated(true, completion: nil)
    }

    func saveNote(){
        let text = textField.text!
        completion(Note(text: text))
        dismissViewControllerAnimated(true, completion: nil)
    }
}
