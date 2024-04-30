#!/usr/bin/env python3
""" MongoDB Insert in Document with Python using pymongo """


def insert_school(mongo_collection, **kwargs):
    # insert to school
    insert = mongo_collection.insert(kwargs)
    return insert
