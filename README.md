I use cronie that check the battery level every 1 minutes.

```bash
sudo pacman -S cronie
```
```bash
chmod +x battery_monitor.sh
```
Remember change your display with `echo $DISPLAY` and modify in the script.
Also please check the BUS with `echo $DBUS_SESSION_BUS_ADDRESS` and `id -u`

You need verify also if BAT id is the correct, it can be BAT1 or BAT0
Check it with
```bash
ls /sys/class/power_supply/ | grep BAT
```
In the output you will get the correct ID, then, modify the script if corresponds.

Then, with `crontab -e` add:
```bash
*/1 * * * * /home/user/battery_monitor.sh
```
Remember *enable* the cronie service:
```bash
systemctl status cronie
```
```bash
systemctl enable --now cronie
```
