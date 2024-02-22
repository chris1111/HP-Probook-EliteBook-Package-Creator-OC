--
--  AppDelegate.applescript
--  HP-ProBook-EliteBook
--
--  Created by chris on 2021-08-31.
--  
--

script AppDelegate
property spinner : missing value -- connected to the progress bar
property animated : false -- keeps track of progress bar animation
property pathToResources : "NSString"

  on Build_(sender) -- toggle animation
    if animated then
      spinner's stopAnimation:me -- one way
      set animated to false
    else
      tell spinner to startAnimation:me -- another way
      set animated to true
    end if
      display alert "Build Start!" buttons ("OK") giving up after 1
      delay 1
      set firstScript to pathToResources & "/Builder/Main.sh"
      do shell script firstScript
      do shell script "sleep 1"
      spinner's stopAnimation:me
      delay 1
      do shell script ("killall HP-ProBook-EliteBook")
    end Build:
    on cancel:sender
                quit
            end cancel:


            on applicationShouldTerminate:sender
                do shell script ("killall HP-ProBook-EliteBook")
                return current application's NSTerminateNow
            end applicationShouldTerminate:
            
            on applicationWillFinishLaunching:aNotification
            set pathToResources to (current application's class "NSBundle"'s mainBundle()'s resourcePath()) as string
            end applicationWillFinishLaunching:

            
            
end script
