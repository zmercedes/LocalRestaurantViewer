Zoilo Mercedes
Local Restaurant Viewer App


- How long did you spend working on the problem? What did you find to be the most
difficult part? 
	- Excluding the time it took me to plan,research and gather useful code from past projects, it took me close to 4 hours to complete this assignment. There was no part that was particularly challenging, but getting the GPS portion to work in the simulator is/has always been a sore point. 
- What trade-offs did you make? What did you choose to spend time on, and what did you
choose to ignore or do quickly for the sake of completing the project? 
	- I spent more time testing and making sure the GPS portion was working properly, as well as making sure the API calls were correct. The time tradeoff came in spending less time working on the user interface. I did not implement a card stack, and instead implemented a sliding card view. I normally separate UIViewController from the UITableViewDataSource as well, but decided to implement them together this time in order to save on time. I also did not add an image cache, which would reduce the app download during the UITableView lifecycle. Thankfully, scalable architecture was easy enough to implement on this project without having to spend too much time on it.
- If you finished with extra time, what improvements did you make that go above and
beyond the requirements?
	- I spent the last bit of time I had making sure that the sliding card view was viewable as a card in both landscape and portrait mode. I had planned to implement favoriting of restaurants with a selectable star icon on the card itself, but ran out of time.