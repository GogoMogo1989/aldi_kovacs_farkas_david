# Galactic Spacefarer – SAP CAP Technical Assessment

## Overview

This project is a SAP CAP-based full stack technical assessment for managing Galactic Spacefarers.

It includes:

- a CAP domain model for Spacefarers, Departments and Positions
- a CAP service exposing CRUD operations
- validation and enhancement logic before creating a Spacefarer
- welcome email sending after successful Spacefarer creation
- local SQLite persistence for development
- seed data for quick local testing

## Tech Stack

- SAP CAP
- Node.js
- SQLite
- CDS
- Nodemailer

## Project Structure

| Folder / File                | Purpose                              |
| ---------------------------- | ------------------------------------ |
| `app/`                       | UI frontend content                  |
| `db/`                        | CDS domain model and seed data       |
| `srv/`                       | Service definition and service logic |
| `srv/spacefarer-service.cds` | CAP service exposure                 |
| `srv/spacefarer-service.js`  | Event handlers and business logic    |
| `srv/sendMail.js`            | Email sending helper                 |
| `db/schema.cds`              | Domain model                         |
| `db/data/`                   | CSV seed data                        |

## Domain Model

The project contains the following entities:

- `Spacefarers`
- `Departments`
- `Positions`

### Spacefarer fields

- `firstName`
- `lastName`
- `email`
- `originPlanet`
- `stardustCollection`
- `wormholeNavigationSkill`
- `spacesuitColor`
- association to `Departments`
- association to `Positions`

## Service Layer

The `SpacefarerService` exposes the following entities through CAP projections:

- `Spacefarers`
- `Departments`
- `Positions`

Standard CRUD operations are available through the CAP service.

## Event Handlers

### Before CREATE

Before creating a new Spacefarer:

- missing `stardustCollection` is defaulted to `0`
- missing `wormholeNavigationSkill` is defaulted to `1`
- `stardustCollection` must be a non-negative integer
- `wormholeNavigationSkill` must be an integer between `1` and `10`

### After CREATE

After successful creation of a new Spacefarer:

- a welcome email is sent to the new Spacefarer using Nodemailer

## Email Integration

The project uses Nodemailer with Gmail SMTP for sending real welcome emails.

Required environment variables:

- `EMAIL_USER`
- `EMAIL_PASS`

Example `.env` file:

```env
NODEMAILER_SECRET_KEY=xywlsdxprejqaecg
EMAIL_USER=kovacsfarkasdavid@gmail.com
```
