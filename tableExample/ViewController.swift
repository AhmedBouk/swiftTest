//
//  ViewController.swift
//  tableExample
//
//  Created by ludivine on 15/03/2022.
//


import UIKit
class Student{
    var name : String
    var user : String
    var pass : String
    var server : String
    init(name : String, user : String, pass : String, server : String){
        self.name = name
        self.pass = pass
        self.user = user
        self.server = server
    }
}

class MyTableController: UITableViewController {
    
    var studentList: [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // peupler les students
        self.studentList.append(Student(name: "ANGOT", user: "user214956", pass: "iru06438seu", server: "FF114"))
        self.studentList.append(Student(name: "AHMED", user: "user214989",pass: "pfk81191rnt",server: "FF115"))
        self.studentList.append(Student(name: "MATHIAS",user: "user215368",pass: "ekh93568dfr",server: "FF200"))
        self.studentList.append(Student(name: "NIELS",user: "user215374",pass: "crv44613skr",server: "FF207"))
        self.studentList.append(Student(name: "PAUL",user: "user214994",pass: "prd96421pis",server: "FF211"))
        self.studentList.append(Student(name: "BOBOT",user: "user214957",pass: "edh62910jii",server: "FF212"))
        self.studentList.append(Student(name: "DORIAN",user: "user214997",pass: "rsc71329hvt",server: "FF213"))
    }
    
    // peupler les cellules de tables
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! MyTableViewCell
        cell.nameLabel?.text = studentList[indexPath.row].name
        cell.user?.text = studentList[indexPath.row].user
        return cell
    }
    // obligatoire à redéfinir
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.studentList.count
    }
    // obligatoire à redéfinir
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // gérer le click sur une cellule
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var studentView : StudentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "studentView")
        studentView.student = studentList[indexPath.row]
       // show(studentView, sender: self)
        present(studentView, animated: false, completion: nil)
        
    }

}

class MyTableViewCell : UITableViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var user: UILabel!
}

class StudentViewController : UIViewController{
    @IBOutlet weak var user: UILabel!
    
    @IBOutlet weak var pass: UILabel!
    @IBOutlet weak var server: UILabel!
    
    var student : Student?
    // quand la vue apparaît, après sa création
    override func viewDidLoad() {
        super.viewDidLoad();
        pass.text = student!.pass
        user.text = student!.user
        server.text = student!.server
    }
}

