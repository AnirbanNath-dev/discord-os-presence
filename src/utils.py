import psutil
import platform
from time import time
from math import floor

def get_distro():
        distro_info = platform.freedesktop_os_release()
        return distro_info.get("NAME" , None)

def get_system_stats():
        os_name = platform.system()
        battery = psutil.sensors_battery()
        battery_percent = f"{round(battery.percent,1)}%" if battery else "N/A"
        cpu_usage = f"{psutil.cpu_percent()}%" 
        memory = psutil.virtual_memory() 
        memory_usage = f"{memory.percent}%" 
        
        uptime = time() - psutil.boot_time()
        uptime_hours = int(uptime // 3600)
        uptime_minutes = int((uptime % 3600) // 60)
        uptime_seconds = int(uptime % 60)
        uptime_str = f"{floor(uptime_hours)}h {uptime_minutes}m {uptime_seconds}s"


        return os_name, battery_percent, cpu_usage, memory_usage, uptime_str
