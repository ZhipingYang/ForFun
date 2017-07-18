## How To Change Your App Icon at Build Time

[link](https://www.raywenderlich.com/105641/change-app-icon-build-time)

```bash
convert -background '#ffffff80' -font verdana -size 360 -fill black label:"Hello World" hw1.png
composite hw1.png -gravity south test.png 123.png
```
