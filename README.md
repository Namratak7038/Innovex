# SmartOPD — Innovex (Backend Scaffold)

This workspace now includes a lightweight backend scaffold (Express + MongoDB) alongside the existing frontend.

Tech stack (recommended for hackathon):
- Frontend: current HTML/CSS/JS, upgrade to React (MERN) for production UX.
- Backend: Node.js + Express
- Database: MongoDB (Atlas or local)
- Auth: bcrypt (password hashing)

Files added:
- `server.js` — Express server and route wiring
- `package.json` — Node dependencies and scripts
- `models/` — Mongoose models (`User`, `Appointment`)
- `routes/` — API routes (`auth`, `doctors`, `appointments`)
- `data/sampleDoctors.json` — sample doctors list
- `.env.example` — env vars example

Quick start (local):

1. Install Node.js (v16+)
2. Ensure MongoDB is running locally or create an Atlas cluster
3. Copy `.env.example` to `.env` and adjust `MONGODB_URI`

Commands:
```bash
npm install
npm run dev      # starts server with nodemon
```

API endpoints (examples):
- `POST /api/auth/register` — { name,email,password,role,phone }
- `POST /api/auth/login` — { email,password }
- `GET /api/doctors` — list doctors
- `GET /api/appointments?patientId=...` — list appointments
- `POST /api/appointments` — create appointment

Next recommended steps:
- Build a React frontend (`client/`) to consume these APIs and implement full MERN UX.
- Add JWT authentication and protected routes.
- Implement advanced scheduling logic (reschedule missed appointments, 45-minute slots per patient) in backend.
- Add unit tests and a Dockerfile + `docker-compose.yml` for easy deployment.

If you'd like, I can now scaffold a `client/` React app, wire API calls from the current UI to the new backend, and implement server-side rescheduling logic.
# Innovex
Smart digital OPD system that automates token allocation, manages doctor availability, and sends real-time patient notifications to reduce waiting time and improve clinic efficiency.
