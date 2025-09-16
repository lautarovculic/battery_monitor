I use cronie that check the battery level every 1 minutes.

```bash
sudo pacman -S cronie
```
```bash
chmod +x battery_monitor.sh
```
Remember change your display with `echo $DISPLAY` and modify in the script.
Also please check the BUS with `echo $DBUS_SESSION_BUS_ADDRESS` and `id -u`

Then, with `crontab -e` add:
```bash
*/1 * * * * /home/user/battery_monitor.sh
```
