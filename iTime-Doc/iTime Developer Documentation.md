

## **iTime Developer Documentation**

### **Introduction**

This documentation is written by Yuming Shen (Ethan Shin). The objective of writing this documentation is to provide a basic architecture, API and models that are used in the iOS application "**iTime**". 

The whole documentation consists of three parts: Architecture, Views and API(models).  
### **Tools used in the development** 

+ **Swift**
  
  + Swift is the programming language used in this project.
+ **Realm** 
  
  + The Object-Oriented Database (OODB) used for our local database.
+ **Lean cloud**
  
  + The mobile backend as a service (BaaS) provider, which manages all functionalities of the notification.
  
+ **Google/Firebase**
  
  + Several Google APIs have been used in the project
+ **Apple developer account/Testflight**
  + Responsible for testing the application 
  
  + other configurations
  
    
  

<center>1</center>
<div style="page-break-after: always;"></div>
### **Architecture**

<img src="/Users/Ethan/Desktop/iTime-Doc/itime-doc-pic/file-s.png" style="zoom:30%">

<center>Figure 1: Project Architecture in Xcode</center>
The project architecture in Xcode has been shown in Figure 1. The whole project comprised of six main parts. The Views part includes all view controller files. All utility functions are in Utilities folder and models used in the application are in Models folder. Files in Extensions folder extends some classes with some convenient functions. BaseClasses and Resources contains other important resources for instance, icon images.

---

#### Views

##### Tabbar ViewController

<div align=center><img width = '400' height ='50' src ="/Users/Ethan/Desktop/iTime-Doc/itime-doc-pic/tabbar.png"></div>
  <center>Figure 2 Tabbar</center>
  + There are five main components in the tabbar
  
    + <u>**Meetings, Activities, Functional Button, Calendar and Contacts.**</u>

<center>2</center>
<div style="page-break-after: always;"></div>
+ In this project, the tabbar is simply created by using storyboard (**Main.storyboard**)

  <div align=center><img src ="/Users/Ethan/Desktop/iTime-Doc/itime-doc-pic/MainStoryboard.png" style=“zoom:10%” height="400px"></div>

<center>Figure 2: Main Storyboard</center>
+ Tabbar-related codes are written in **BaseTabBarViewController.swift**

```swift
     class BaseTabBarViewController: UITabBarController {
       override func viewDidLoad(){
         //Notification setting
         if UserUtility.isLoggedin(){
           // Utility initiation
           // setup socket
         }
         // UI part
       }
       func syncFunctions{
         // sync functions
       }
       @objc func longPressed(){
         // long-press
       }
```

  <center>3</center>
<div style="page-break-after: always;"></div>
##### Meetings ViewController

+ The Meeting module is one of the most important parts of the iTime. The Meeting module comprises of three independent components: **Invitations module, Hosting module and Coming module.** 
+ The Invitation part displays all events that the current user has been invited. And all meetings that are created by the user will be shown in the Hosting module. In addition, if the user has voted for a certain meeting, and the event has not outdated, those events will be moved into the Coming module. 
+ In order to provide the convenience for hosting events, the information about how many people have <u>**voted/refused/no reply**</u> will be shown in the event cell.
+ In addition, outdated events will be presented after the “out of date” line so that users can manage them quickly. 
+ If the user confirmed to attend an event, the left part of the event cell will change from <b>```Vote```</b> to <b>```Going```</b>, as you can see in the left screen of the figure 3.1.



<img src="/Users/Ethan/Desktop/iTime-Doc/itime-doc-pic/meeting.jpg" style="zoom:50%">

<center>Figure 3.1 . Meeting Module</center>
<p></p>
<br>
<br>
<br>
<center>4</center>
<div style="page-break-after: always;"></div>
+ **Code structure**

  + XLPagerTabStrip is a Container View Controller that allows us to switch easily among a collection of view controllers. 

  + In this case, the BaseMeetingViewController is the container view and Invitation VC, Hosting VC and ComingVC are subVCs of the MeetingVC.
  
  + ```swift
    let subViewController1 = MeetingInvitationViewController()
    
    let subViewController2 = MeetingHostingViewController()
    
    let subViewController3 = MeetingComingViewController()
    ```
  
+  BaseMeetingViewController is the VC holds the whole structure of the meeting views.

  ```swift
  class BaseMeetingViewController: ButtonBarPagerTabStripViewController {
        override func viewDidLoad() {
          // setupButtonBar should be called before super.viewDidLoad()
          setupButtonBar()
          super.viewDidLoad()
          setupBasicUI()
          setupNavigationBar()
          setupNotification()   
      }
    
    	// UI functions
  	func setButtonBar {
        
      }
    	func setNavigationBar{
        
      }
    	//@objc func functions
    	@objc func searchBarTapped() {
        
      }
  }
  ```
  
  <center>5</center>
  <div style="page-break-after: always;"></div>
  ##### Activities ViewController
  
  + All event-related notification messages will be presented in the ActivityModule. 
  + It can be seen from Figure 3.2 that there are two main parts: the  last cell is for official messages (from the iTime) and others are for recording event-related messages. When the user taps the event, three cells containing information of changes will appear and tap any of them will jump to the event detail page. The iTime messages view contains all other changes such as share calendar creation and permission setting changes.
<div align=center><img src="/Users/Ethan/Desktop/iTime-Doc/itime-doc-pic/activity.png" style="zoom:60%" height="600px"></div>
<center>Figure 3.2 Activity Module</center>
  + Code Structure
    ```swift
    class ActivityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
      override func viewDidLoad() {
        // add notification observer
        // reloadActivities
        // set UI
      }
    }
    ```
<center>6</center>
<div style="page-break-after: always;"></div>
+ ```swift
    // Second part is about right corner ... button
    var rightConnerBtnVC : ActivityShowMoreViewController?
    // The Third part is about cell
  }
  
  extension ActivityViewController: UIPopoverPresentationControllerDelegate{
    // pop over effect
  }
  ```

  ##### Main Functional Button ViewController

  + The orange button in the middle of the tabbar is the main function button (addBtn). 

  + When the user taps the button just once, the event creation buttons appear, and the user can not only create public events, but also group meetings and personal event. which shows in Figure 3.3. 
  
    <div align=center><img src="/Users/Ethan/Desktop/iTime-Doc/itime-doc-pic/normalTapAddBtn.png" style="zoom:35%"></div>

<center>Figure 3.3 CreateEventViewController</center>
<p></p>
<center>7</center>
<div style="page-break-after: always;"></div>	
+ code for Main Functional Button ViewController
```swift
// Add Button 
let selfBar = self.tabBar as! CustomTabBar
        addButton = selfBar.addButton
        addButton.addTarget(self, action: #selector(self.addBtnTapped(_:)), for: .touchUpInside)
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        addButton.addGestureRecognizer(longGesture)
```

```swift
// Create Event VC
class CreateEventViewController: UIViewController { 	
  	// did load 	 
		private func setupBasic(){
        self.view.backgroundColor = UIColor.clear
    		
      	// solo event button
        let soloView = UIView(frame: CGRect())
        let soloImageView = UIImageView(frame: CGRect())
        soloImageView.image = #imageLiteral(resourceName: "icon_event_onlyme")
        let soloLabel = UILabel(frame: CGRect())
				// UI setup part
        createSoloBtn.addSubview(soloView)
        
      	// group event button
        let groupView = UIView(frame: CGRect())
        let groupImageView = UIImageView(frame: CGRect())
        groupImageView.image = #imageLiteral(resourceName: "icon_event_inviteothers")
        let groupLabel = UILabel(frame: CGRect())
				// UI setup part
        createGroupBtn.addSubview(groupView)
```
<br>
<br>
<br>
<br>

<center>8</center>
<div style="page-break-after: always;"></div>	
```swift
        //The public event button
        let publicView = UIView(frame: CGRect())
        let publicImageView = UIImageView(frame: CGRect())

        publicImageView.image = #imageLiteral(resourceName: "icon_popover_publicevent")
        let publicLabel = UILabel(frame: CGRect())

				// UI setup part
    }
}
```
+ When the user taps the button longer than 0.5 seconds, a new pop menu appears with some other hotkeys (Figure 3.4).

+ ![longPress](/Users/Ethan/Desktop/iTime-Doc/itime-doc-pic/longPress.png)

  <center>Figure 3.4: LongPress Effect</center>

```swift
@objc func longPressed(action:UILongPressGestureRecognizer){
        let actions: [PopMenuDefaultAction] = [
            // PopMenuDefaultActions
        ]
        if action.state == .began {
						// when the action begins
        } else if action.state == .ended{
            // when the action ends
        }
    }
```
  <center>9</center>
  <div style="page-break-after: always;"></div>
##### Calendar ViewController

+ In the calendar view, all events will be presented in the corresponding cells in the view. User is able to see the calendar in day, week or agenda type. It can be seen from the figure 3.5 that the left screenshot is the calendar in day type, the middle one shows the calendar in week type and the right one is in agenda type.

+ ![calendar](/Users/Ethan/Desktop/iTime-Doc/itime-doc-pic/calendar.png)

  <center> Figure 3.5: Calendar Module</center>
```swift
      enum CalendarViewType{
          case day
          case week
          case agenda
      }
```
```swift
		// monthView appears when the calendar type is day or agenda
    var upperMonthView: BasicCalendarView!		
    var agendaVC: AgendaTableViewController!
    var agendaView: UIView!
		// addChildViewController part -- in viewdidload part
    addChildViewController(agendaVC)
    agendaVC.agendaViewDelegate = self
    agendaVC.didMove(toParentViewController: self)
    agendaView = agendaVC.view
    view.addSubview(agendaView)
```
  <center>10</center>
  <div style="page-break-after: always;"></div>
##### Contact ViewController

+ The Contacts Module displays all contact information, users can add or find users that they want to connect with. If the user click any one of the user cells, the app will jump to this user’s profile detail page. And the user can directly invite that user to the new Event or subscribe this user.
+ ![contact](/Users/Ethan/Desktop/iTime-Doc/itime-doc-pic/contact.png)

  <center>Figure 3.6: Contact Module</center>

```swift

class ContactsViewController: UIViewController{
    
    var tableView = UITableView()
    var viewModel = ContactsViewModel()
    var popoverController:UIPopoverPresentationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBasic()
        setupNaviBar()
        setupTableView()
        reloadContactsViewController()
    }
```

  <center>11</center>
  <div style="page-break-after: always;"></div>
```swift
    func setupBasic(){
      // UI & notification
    }
    
    func setupNaviBar(){
      // search bar and addbtn
    }
    
    func setupTableView(){
			// UI
    }
    
 		// @objc functions
    @objc func searchBarTapped() {
    }
    
    @objc func addFriendsBtnTapped(_ sender: UIBarButtonItem){
    }
    
    @objc func reRenderContactsViewNotification(_ notification: Notification){
    }
}

// Tableview delegate
extension ContactsViewController: UITableViewDelegate, UITableViewDataSource{
}

// popover effect
extension ContactsViewController: UIPopoverPresentationControllerDelegate, ContactsMoreOptionsDelegate{
}

```

<br>
<br>
<br><br><br>

<center>12</center>
<div style="page-break-after: always;"></div>
#### Utilities

+ The Utilities functions contains most of utility functions that can be called in other places
+ Take the <b>```EventUtility```</b> as an example, following are some utility functions in the <b>```EventUtility```</b> class:
  + <b><font color=orange>```class func initContacts()```</font></b>
    + Get all contact information from the local database (realm).
  + <b><font color=orange>```class func initBlockedUser()```</font></b>
    + Get the list of blocked users from the local database.
  + <b><font color=orange>```class func initFriendRequest()```</font></b>
    + Get all friend request information from the local database.
  + <b><font color=orange>```class func postRerenderContactsViewNotification()```</font></b>
    + post notification to tell corresponding views to re-render.
  + <b><font color=orange>```static func getContactsWithAlphabetOrder()```</font></b>
    + used when reload the view model, put the new contact information in alphabetic order.
  + <b><font color=orange>```static func checkIfSubscribed(_ contactUid: String)->Bool```</font></b>
    + returns a boolean value to tell whether the user has subscribed a specific user or not.
  + <b><font color=orange>```class func listBlockedUsersRemote(parameters)```</font></b>
    + This is a HTTP GET request to the server to get all blocked users.
  + <b><font color=orange>```class func listContactsRemote```</font></b>
    + Same as above, a HTTP GET request to get all contact information.
  + <b><font color=orange>```class func sendFriendRequest()```</font></b>
    + A POST request to the server to send a friend request to other users.
  + <b><font color=orange>```class func deleteContact()```</font></b>
    + Delete a specific contact with a user.
  + <b><font color=orange>```class func unSubscribeUser()```</font></b>
    + A corresponding function to the subscribe function.
  + <b><font color=orange>```class func updateContacts```</font></b>
    + When sync an updated contact from the server, update it to the view.

  <center>13</center>
  <div style="page-break-after: always;"></div>

#### API & Model
+ ```baseUrl = ConfigurationManager(environment:.prod).baseUrl()```

+ ```baseApiUrl = "\(baseUrl)/api"```

+ ```baseSocketUrl = "http://socket.timagic.net"```

  + <center><b>API:</b><img src="/Users/Ethan/Desktop/iTime-Doc/itime-doc-pic/API_list.png" style="zoom:25%"></center>

  + <center><b>Models:</b><img src="/Users/Ethan/Desktop/iTime-Doc/itime-doc-pic/Model_list.png" style="zoom:25%"></center>

+ NOTE: The API documentation showing below is not completely same as what was written in the project,  responses used in the project are comprised of only "success" and "fail". The response part in the API doc showing below is just a template.
<center>14</center>
