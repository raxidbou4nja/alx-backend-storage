#!/usr/bin/env python3
""" MongoDB update with Python using pymongo """


def update_topics(mongo_collection, name, topics):
    """ update topics """
    query = {"name": name}
    new_values = {"$set": {"topics": topics}}

    mongo_collection.update_many(query, new_values)
