Galactic Spacefarer – SAP CAP Technical Assessment
Overview

This project is a SAP CAP-based full stack technical assessment for managing Galactic Spacefarers.

It includes:

a CAP domain model for Spacefarers, Departments and Positions

a CAP service exposing CRUD operations

planet-based authorization using authenticated users

validation logic for Spacefarer creation and updates

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

The service is also draft-enabled to support Fiori editing and create flows.

UI

The application includes:

a Fiori List Report for displaying Spacefarers

filtering, sorting and pagination support

a Fiori Object Page for viewing Spacefarer details

draft-enabled editing support for updating Spacefarer records

create support from the List Report page

Event Handlers
Before NEW (Draft Creation)

Before opening a new draft entry:

originPlanet is initialized from the authenticated user's planet

Before CREATE / UPDATE

Before creating or updating a Spacefarer:

stardustCollection must be a positive integer

wormholeNavigationSkill must be a positive integer

After CREATE

After successful creation of a new Spacefarer:

a welcome email is sent to the new Spacefarer using Nodemailer

Email Integration

The project uses Nodemailer with Gmail SMTP for sending welcome emails.

Required environment variables:

EMAIL_USER

NODEMAILER_SECRET_KEY

Example .env file:

EMAIL_USER=your-email@gmail.com
NODEMAILER_SECRET_KEY=your-app-password
Local Authentication

For local development, the project uses basic authentication with test users:

planetx / planetx

planety / planety

These users are used to test planet-based data visibility.

Run Locally

Install dependencies and start the CAP server:

npm install
npm start
