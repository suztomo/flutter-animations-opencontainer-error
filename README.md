# Project to Reproduce OpenContainer Bug

Run the project for iOS simulator. I used iOS Simulator Version 11.4 (921.9).

When the app opens, tap the last item in the list and tap 'Delete' button.
You'll see the error:

```
════════ (7) Exception caught by widgets library ═══════════════════════════════════════════════════
The getter 'isInTree' was called on null.
Receiver: null
Tried calling: isInTree
The relevant error-causing widget was: 
  MaterialApp file:///Users/suztomo/Documents/opencontainer_deletion/lib/main.dart:10:12
════════════════════════════════════════════════════════════════════════════════════════════════════

════════ (8) Exception caught by animation library ═════════════════════════════════════════════════
The setter 'placeholderSize=' was called on null.
Receiver: null
Tried calling: placeholderSize=null
════════════════════════════════════════════════════════════════════════════════════════════════════
```

Interestingly the error does not occur when deleting non-last elements.