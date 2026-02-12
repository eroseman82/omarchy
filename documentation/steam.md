# PUT IN Steam -> game --> properties --> launch options 
env -u SDL_VIDEODRIVER %command%


# Potential fix 
mkdir -p ~/.local/bin
cat > ~/.local/bin/steam-nosdl <<'EOF'
#!/bin/sh
unset SDL_VIDEODRIVER
exec steam "$@"
EOF
chmod +x ~/.local/bin/steam-nosdl

steam-nosdl


# EXPLANATION

In plain English:

Your system has a global setting:

```
SDL_VIDEODRIVER=wayland
```

That tells SDL-based programs:

> “Use Wayland directly for graphics.”

Some Proton games (via SDL/Xalia) **can’t handle that** and expect the older X11/XWayland path. When forced to use Wayland, they fail instantly — so Steam looks like it “tries” then stops.

---

When you use:

```bash
env -u SDL_VIDEODRIVER %command%
```

You are saying:

> “Launch this game, but remove that Wayland instruction first.”

So the game falls back to its default behavior (usually XWayland), and it works.

---

So conceptually:

* Before: Game forced to use Wayland → crashes
* After: Game not forced → chooses compatible path → runs

You didn’t fix drivers.
You removed a bad constraint.



VIDEO = https://www.youtube.com/watch?v=dO6ELomGNQU&t=30s 
