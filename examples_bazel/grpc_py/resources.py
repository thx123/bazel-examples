# Copyright 2015 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Common resources used in the gRPC route guide example."""

import json
import os

from examples_bazel.protos import routeguide_pb2

def read_route_guide_database():
    """Reads the route guide database.

    Returns:
      The full contents of the route guide database as a sequence of
        route_guide_pb2.Features.
    """
    feature_list = []
    db_path = 'examples_bazel/protos/routeguide_features.json'
    if 'DATABASE_FILE' in os.environ:
        db_path = os.environ['DATABASE_FILE']
    with open(db_path) as route_guide_db_file:
        for item in json.load(route_guide_db_file):
            feature = routeguide_pb2.Feature(
                name=item["name"],
                location=routeguide_pb2.Point(
                    latitude=item["location"]["latitude"],
                    longitude=item["location"]["longitude"]))
            feature_list.append(feature)
    return feature_list
