### Summary: Include screen shots or a video of your app highlighting its features

https://github.com/user-attachments/assets/b5cc8cbd-d29f-46f1-8d35-cc83100f727b


### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
I chose to prioritize the separation of concerns. I separated the responsibilities through `NetworkClient`, `RecipeService`, `RecipeViewModel`, and `RecipesList`. I chose to focus on these areas because in the FAQ it said Fetch wants to know what production ready code looks like to me. I wanted to setup a good architecture for extending the app. With my implementation, I think another developer at Fetch for example could easiliy come on to this codebase to easily add more recipe endpoints, more business logic (filtering/searching), or add new models completely given the generic networking. 

Additionally, I also chose to focus on making sure I am throwing errors and propogating them up to the view model where they are handled. I did this so developers would know why any part of the fetching, caching, saving, or decoding was failing. I also did this in hopes it would make writing unit tests clearer, but I am not sure if it accomplished that role With the given architecture, I think any engineer would also be well setup to add whatever UI functionality they want. 

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I spent a little over 5 hours working on this project. The instructions said to use my best judgement, the recruiter e-mail said to take as much time as I wanted, and finally the interview guide said the take home should take 4-5 hours, so I stuck to the time in the interview guide. Even though the UI is simple, 5 hours felt like a very tight time limit for the task at hand.

Most of my time was spent in the architecture of the app's networking, image caching, and testing. I wanted to make sure that it would be easy to add new endpoints, build and send requests with the app. I would say about 2 hours was spent on this. Another part of my time was spent on the image cache which uses `FileManager` to manage a cache directory. That took about 1 hour. Additionally making sure I wrote unit tests for networking, my view model, and image caching took about another hour. 

With my last hour I wanted to make sure that my passing tests also meant I had a working list of recipes.

I am not counting how much time went into this README. Unsure if that is part of the time taken into account.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
* I went with a MVVM approach. I find this works well in SwiftUI due to the `ObservableObject` protocol to have objects that emit value changes.
* I decided to abstract the networking into `RecipeService` which I think is not necessary for an app as small as this, but I wanted to highlight my thinking when it comes to separation of concerns. Eventually as an app grows, I believe you would want an abstraction from your networking layer to use in your view models rather than having your networking directly in your view model files. This abstraction may not have been necessary for the project scope.
* The image cache has no eviction policy. This was due to a time constraint and also because on brief research it seemed non-trivial to calculate the size of my cache and the size of an image I was about to cache. If I had more time, I would invest in implementing some sort of cache eviction policy, like least recently used. I think an even more robust image cache would save images to a `documentsDirectory` instead of a `cachesDirectory`, so subsequent app launches (not just network calls) would be faster, but with no eviction policy, I didn't feel good about doing that.
* I made a very simple UI to satisfy the MVP to make sure I stayed at around 5 hours of development time.

### Weakest Part of the Project: What do you think is the weakest part of your project?
* I think the weakest part of the project is the unit testing. I'm not confident that my tests provide all the coverage that would be expected of production-ready code for this task.
* The second weakest part of the project would be the UI, but that was due to the imposed time limit. I think I could spend forever polishing the UI, so I chose to meet the MVP for this take home. This also means the error messages in alerts aren't very user friendly, but very developer friendly.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
* I think an official time constraint would have been nice actually! I figure part of this assessment is to see how I allocate my time with no deadline, but in reality there will always be a scoped deadline. A scoped deadline would have helped my planning from the beginning so I could roughly allocate my time depending on the size of each task of the assignment.
