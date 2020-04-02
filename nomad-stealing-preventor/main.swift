//
//  main.swift
//  nomad-stealing-preventor
//
//  Created by Rungsikorn Rungsikavanich on 4/2/20.
//  MIT License
//

import Foundation
import AppKit
print("""
    
    This application hate NoMAD who disrupt your productivity
    🤖 if NoMAD is activate I will bring your frontmost application back!
    
    MIT by Rungsikorn Rungsikavanich ( considered to buy me an Icecream🍦 if you like it )

""")


var latestActiveApplication: NSRunningApplication?
NSWorkspace.shared.notificationCenter.addObserver(forName: NSWorkspace.didActivateApplicationNotification, object: nil, queue: nil) { (Notification) in
    
    let activeApplication = NSWorkspace.shared.frontmostApplication
    let now = Date();
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "HH:mm:ss"
    
    let strDate = dateFormatterPrint.string(from: now)
    print("[\(strDate)] current frontmost application change to \"\(activeApplication?.localizedName ?? "empty")\"")
    
    // if the application is NoMAD or SystemUIServer
    // bring the frontmost application back to the latest application
    if (activeApplication?.localizedName == "NoMAD" || activeApplication?.localizedName == "SystemUIServer") {
    
        print("[\(strDate)]NoMAD try to steal our frontmost!!, 🤖 take \"\(latestActiveApplication?.localizedName ?? "empty")\" back to frontmost!!\n")
        latestActiveApplication?.activate(options: NSApplication.ActivationOptions.activateIgnoringOtherApps)
        return
    }
    
    latestActiveApplication = (NSWorkspace.shared.frontmostApplication)
    
}

RunLoop.main.run()
