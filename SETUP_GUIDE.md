# SmartOPD Backend Setup Guide

## Quick Start Options

### Option 1: Automated Setup (Windows)

**Run Setup Batch File:**
```bash
setup.bat
```
This will automatically:
- Check Node.js installation
- Install npm dependencies
- Create .env file
- Start the dev server

**Or PowerShell:**
```powershell
.\setup.ps1
```

---

### Option 2: Manual Setup (All Platforms)

#### Prerequisites:
- **Node.js** v16+ (Download: https://nodejs.org/)
- **MongoDB** (Local or Atlas cluster)

#### Steps:

1. **Install Node.js** (if not already installed):
   - Download from https://nodejs.org/
   - Choose LTS version (v18 or v20)
   - Run installer and follow prompts

2. **Navigate to project folder:**
   ```bash
   cd c:\Users\khama\OneDrive\Desktop\smartopd\Innovex
   ```

3. **Install dependencies:**
   ```bash
   npm install
   ```

4. **Create `.env` file** (if not exists):
   ```bash
   # Windows (PowerShell)
   echo "PORT=4000`nMONGODB_URI=mongodb://127.0.0.1:27017/smartopd" > .env
   
   # Windows (CMD)
   echo PORT=4000 > .env
   echo MONGODB_URI=mongodb://127.0.0.1:27017/smartopd >> .env
   
   # Mac/Linux
   echo -e "PORT=4000\nMONGODB_URI=mongodb://127.0.0.1:27017/smartopd" > .env
   ```

5. **Start MongoDB** (if local):
   ```bash
   mongod
   ```
   Or use MongoDB Atlas (cloud):
   - Go to https://www.mongodb.com/cloud/atlas
   - Create cluster and get connection string
   - Update MONGODB_URI in .env

6. **Start backend server:**
   ```bash
   npm run dev
   ```

   Server should start on: **http://localhost:4000**

---

### Option 3: Docker Setup (Recommended for Production)

#### Prerequisites:
- **Docker Desktop** (Download: https://www.docker.com/products/docker-desktop)

#### Steps:

1. **Start Docker Desktop**

2. **Build and run with Docker Compose:**
   ```bash
   docker-compose up --build
   ```

   This will:
   - Create MongoDB container
   - Build backend image
   - Start both services
   - Server available at: **http://localhost:4000**

3. **Stop services:**
   ```bash
   docker-compose down
   ```

---

## Verify Installation

Once server is running, test with:

**Check API Health:**
```bash
curl http://localhost:4000
# or open in browser: http://localhost:4000
```

**Expected Response:**
```json
{
  "ok": true,
  "message": "SmartOPD API"
}
```

---

## API Endpoints Reference

### Authentication
```
POST   /api/auth/register       → Register user
POST   /api/auth/login          → Login
```

### Doctors
```
GET    /api/doctors             → List all doctors
```

### Appointments
```
GET    /api/appointments        → List appointments (with query filters)
POST   /api/appointments        → Create appointment
PATCH  /api/appointments/:id/status → Update status
```

### Hospitals
```
GET    /api/hospitals           → List hospitals
POST   /api/hospitals           → Create hospital
```

### Beds
```
GET    /api/beds/hospital/:id   → Get hospital beds
POST   /api/beds/auto-allocate  → Auto-allocate bed (token priority)
PATCH  /api/beds/:id/allocate   → Allocate bed to patient
PATCH  /api/beds/:id/release    → Release bed
GET    /api/beds/report/priority/:id → Get priority report
```

### Payments
```
POST   /api/payments            → Create payment
GET    /api/payments/user/:id   → User payment history
```

### Notifications
```
POST   /api/notifications       → Send SMS/Email
GET    /api/notifications/user/:id → Get notifications
```

### Doctor Availability
```
GET    /api/doctor-availability/doctor/:id → Get availability slots
GET    /api/doctor-availability/calendar/:id → Get 30-day calendar
POST   /api/doctor-availability → Create availability slot
```

---

## Troubleshooting

### "npm: command not found"
- **Solution:** Node.js not in PATH. Reinstall Node.js and restart terminal.

### "MongoDB connection error"
- **Solution:** 
  - Ensure MongoDB is running: `mongod` (local) or create Atlas cluster
  - Update MONGODB_URI in .env

### "Port 4000 already in use"
- **Solution:**
  ```bash
  # Windows
  netstat -ano | findstr :4000
  taskkill /PID <PID> /F
  
  # Mac/Linux
  lsof -i :4000
  kill -9 <PID>
  ```

### "npm install fails"
- **Solution:**
  ```bash
  npm cache clean --force
  rm -rf node_modules package-lock.json
  npm install
  ```

---

## Development Workflow

### Start Dev Server (Auto-reload):
```bash
npm run dev
```

### Check for Lint Errors:
```bash
npm run lint
```

### Run Tests:
```bash
npm test
```

---

## Next Steps

1. **Open frontend:**
   - Navigate to: `file:///c:/Users/khama/OneDrive/Desktop/smartopd/Innovex/index.html`
   - Frontend connects to backend on port 4000

2. **Frontend will:**
   - Use localStorage for demo (works offline)
   - Call APIs when backend is running

3. **Deploy to Production:**
   - Use Docker (included `Dockerfile` & `docker-compose.yml`)
   - Deploy to AWS/Azure/Heroku

---

## Support

For issues:
1. Check terminal output for error messages
2. Ensure all ports are available
3. Verify Node.js version: `node --version` (should be v16+)
4. Verify npm version: `npm --version` (should be v7+)

**Hackathon Ready!** 🚀
