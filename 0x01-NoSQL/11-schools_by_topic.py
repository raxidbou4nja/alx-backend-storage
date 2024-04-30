#!/usr/bin/env python3
""" get topics from mongoDB using python """


def schools_by_topic(mongo_collection, topic):
    """ get school topics """
    document = mongo_collection.find({'topics': topic})
    return document
