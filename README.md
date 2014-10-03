# User Project Assignment

## Description

This web app allows users to create an open project. Other users who wants to be a part of the project can join the project and select the deliverables that they want to own.

## Techniques used

There are three separate Models: User, Project, and Mentship. Mentship acts as a join model between User and Project. Mentship also contains the `role` column with takes a string. The role column is used to indicate whether the user who is associated with project is either a `"creator"` or a `"participant"`.

## Why the join model is called a Mentship

Originally I had named it Assignment, which would make more sense. However, I made a mistake on my model, so I deleted the model and attempted to create a new Assignment model. However, it failed because Rails still thinks that Assignment model still exists. I couldn't come up with a better name so I chose Mentship.

## Created by

Philip Q Nguyen
