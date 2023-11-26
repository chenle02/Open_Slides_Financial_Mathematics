#!/usr/bin/env python3
# Import the Canvas class
# from ../API/canvasapi import Canvas
# import ./API/canvasapi/*
from canvasapi import Canvas
import subprocess
import sys

# Canvas API URL
API_URL = "https://auburn.instructure.com"
# Canvas API key
API_KEY = subprocess.check_output(["pass", "Canvas-Auburn"]).strip().decode("utf-8")
# Initialize a new Canvas object
canvas = Canvas(API_URL, API_KEY)
# The following are three courses that I am teaching
# Math221-5, Math221-6, Math221-7.
# 0 refers to my sandbox.
dictCourses = {
  # "0": 66586,  # this is sandbox, no sandbox here
  "1": 1359163,  # this is the main one.
  # "3": 84892,  # this is obsolete since section 3 is combined to section 1
}

# Initialize a new Canvas object
canvas = Canvas(API_URL, API_KEY)
# Test the course setting
if len(sys.argv) <= 3:
    print("Upload_File.py Week_Number Module_Position File_to_Upload [Title]")
    print(" If Title is not given, it will be the filename.")
    print(" If position is 0, then the module page won't be updated.")
    print("Make sure the Homework folder has been created on Canvas File.")
    sys.exit(2)

weeknumber = "Week "+sys.argv[1]  # This appears in the Module name. Week one/ Week 2, etc.
position = sys.argv[2]
filename = sys.argv[3]
if len(sys.argv) == 5:
    title = sys.argv[4]
else:
    title = filename

print("Uploading file: " + filename + "\n"
      + "under " + weeknumber + "\n"
      + "at position " + position + "\n"
      + "title: " + title)
# exit(1)

# Initialize courses
courses = {}
for key, value in dictCourses.items():
    # if key != "0":
    print("Loading Section", key)
    courses[key] = canvas.get_course(value)
    print(courses[key].name)

# Create folders Homework when run this for the first time
# for key, value in dictCourses.items():
#     # if key != "0":
#     print("Creating Homework folder for", courses[key].name)
#     courses[key].create_folder("Homework",parent_folder_path="/")


# Add the file to the Homework folder
for key, value in dictCourses.items():
    print("Uploading files to ", courses[key].name)
    courses[key].upload(filename, parent_folder_path="Homework")

# Include the following one to upload file without update the module pages.
# sys.exit(0)

# Add it to the correct module.
moduleDic = {
        "position": 1,
        "require_sequential_progress": False,
        "publish_final_grade": False,
        "published": True}
moduleDic['name'] = weeknumber


# Step 2: Add page items:
module_item = {
        "type": "File",
        "position": int(position),
        "indent": 0
        }

# First test on Sandbox
# modules = courses['0'].get_modules()
# for module in modules:
#     if weeknumber in module.name:
#         print("Found the module:", module.name)
#         files = courses['0'].get_files(order="asc", per_page=50, sort="title")
#         for file in files:
#             if filename in file.display_name:
#                 print(file.display_name)
#                 module_item["content_id"] = file.id
#                 module_item["page_url"] = file.url
#                 module_item["title"] = file.display_name
#                 print("Create a module items now...")
#                 module.create_module_item(module_item)
# Well done!
# exit(1)

if int(position) == 0:
    print("Position is given by zero hence no update on module page.")
else:
    print("Position parameter is " + position )
    # Now do the rest three
    list = ["1"]
    for i in list:
        print(courses[i].name)
        modules = courses[i].get_modules()
        for module in modules:
            if weeknumber in module.name:
                print("Found the module:", module.name)
                files = courses[i].get_files(order="asc", per_page=50, sort="title")
                for file in files:
                    if filename in file.display_name:
                        print(file.display_name)
                        module_item["content_id"] = file.id
                        module_item["page_url"] = file.url
                        module_item["title"] = title
                        print("Create a module items now...")
                        module.create_module_item(module_item)
# # Well done!
