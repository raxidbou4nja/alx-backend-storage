#!/usr/bin/env python3
""" mongoDB operations using pymongo """

def list_all(mongo_collection):
    """ List all doc in Python """
    doc = mongo_collection.find()

    if doc.count() == 0:
        return []

    return doc
