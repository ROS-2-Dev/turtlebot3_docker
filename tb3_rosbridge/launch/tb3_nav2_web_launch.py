from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from ament_index_python.packages import get_package_share_path
from launch_ros.actions import Node


def generate_launch_description():
    return LaunchDescription([
        IncludeLaunchDescription(str(get_package_share_path('nav2_bringup')/ 'launch'/ 'tb3_simulation_launch.py'),
                                launch_arguments={'headless': 'False'}.items()),

        IncludeLaunchDescription(str(get_package_share_path('rosbridge_server')/ 'launch'/ 'rosbridge_websocket_launch.xml'),
                                launch_arguments={'port': '9090', 'send_action_goals_in_new_thread': 'True'}.items()),
    ])
