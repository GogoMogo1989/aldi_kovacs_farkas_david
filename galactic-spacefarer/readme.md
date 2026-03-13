Galactic Spacefarer – SAP CAP Technical Assessment
Overview

This project is a SAP CAP-based full stack technical assessment for managing Galactic Spacefarers.

It includes:

a CAP domain model for Spacefarers, Departments and Positions

a CAP service exposing CRUD operations

planet-based authorization using authenticated users

validation and defaulting logic before creating a Spacefarer

welcome email sending after successful Spacefarer creation

a Fiori List Report for browsing Spacefarers

a Fiori Object Page for viewing and editing Spacefarer details

local SQLite persistence for development

seed data for quick local testing

Tech Stack

SAP CAP

Node.js

SQLite

CDS

SAP Fiori elements

Nodemailer

Project Structure
Folder / File Purpose
app/ UI frontend content
db/ CDS domain model and seed data
srv/ Service definition and service logic
srv/spacefarer-service.cds CAP service exposure and authorization
srv/spacefarer-service.js Event handlers and business logic
srv/spacefarer-service-ui.cds UI annotations for List Report and Object Page
srv/sendMail.js Email sending helper
db/schema.cds Domain model
db/data/ CSV seed data
Domain Model

The project contains the following entities:

Spacefarers

Departments

Positions

Spacefarer fields

firstName

lastName

email

originPlanet

stardustCollection

wormholeNavigationSkill

spacesuitColor

association to Departments

association to Positions

Service Layer

The SpacefarerService exposes the Spacefarers entity through a CAP projection.

Standard CRUD operations are available through the CAP service.

The service is protected with authenticated-user access and applies planet-based authorization rules:

users can only read Spacefarers from their own planet

users can only update and delete Spacefarers from their own planet

UI

The application includes:

a Fiori List Report for displaying Spacefarers

filtering, sorting and pagination support

a Fiori Object Page for viewing Spacefarer details

draft-enabled editing support for updating Spacefarer records

Event Handlers
Before CREATE

Before creating a new Spacefarer:

missing stardustCollection is defaulted to 0

missing wormholeNavigationSkill is defaulted to 1

stardustCollection must be a non-negative integer

wormholeNavigationSkill must be an integer between 1 and 10

After CREATE

After successful creation of a new Spacefarer:

a welcome email is sent to the new Spacefarer using Nodemailer

Email Integration

The project uses Nodemailer with Gmail SMTP for sending welcome emails.

Required environment variables:

EMAIL_USER

NODEMAILER_SECRET_KEY

Example .env file:

NODEMAILER_SECRET_KEY=xywlsdxprejqaecg
EMAIL_USER=kovacsfarkasdavid@gmail.com
Local Authentication

For local development, the project uses basic authentication with test users:

planetx / planetx

planety / planety

These users are used to test planet-based data visibility.

Run Locally

Install dependencies and start the CAP server:

npm install
npm start
