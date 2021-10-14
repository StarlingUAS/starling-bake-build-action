import random
import time
import numpy as np
from functools import partial

import rclpy
from rclpy.node import Node
from rclpy.executors import MultiThreadedExecutor
from rclpy.callback_groups import ReentrantCallbackGroup
from rclpy.qos import qos_profile_system_default

# from starling_allocator_msgs.msg import Allocation
# from starling_allocator_msgs.srv import AllocateTrajectories

from simple_offboard_msgs.srv import SubmitTrajectory

from geometry_msgs.msg import PoseStamped
from trajectory_msgs.msg import JointTrajectoryPoint
from trajectory_msgs.msg import JointTrajectory


def main(args=None):
    rclpy.init(args=args)
    try:
        # alloc = Allocator()
        executor = MultiThreadedExecutor()
        # executor.add_node(alloc)
        try:
            executor.spin()
        finally:
            executor.shutdown()
            # alloc.destroy_node()
    finally:
        rclpy.shutdown()
