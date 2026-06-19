# DevBoard — Fundamentals (UI only)

The DevBoard front end, running **standalone** with no backend. This is the
`fundamentals` branch: it teaches the React UI in isolation — layout shell,
routing, TanStack Query, the kanban board, the command bar, dark mode — before
any services are introduced.

All data comes from an in-memory mock store (`src/mock/store.js`). Creating
tasks and dragging cards between kanban columns works for the lifetime of the
page (state resets on refresh). The `advanced` branch swaps this mock layer for
a real **Go + Postgres** backend without changing any UI component.

## Run it

```bash
npm install
npm run dev      # http://localhost:5173
```

```bash
npm run build    # production build to dist/
npm test         # Vitest component tests
```

## What's here

```
src/
├── components/
│   ├── layout/     AppShell · Sidebar · Topbar · CommandBar · ProfileMenu · ThemeToggle
│   ├── tasks/      TaskCard · TaskList · KanbanBoard · TaskCreateModal
│   └── ui/         Button · Input · Badge · Avatar · Logo
├── hooks/
│   └── useTasks.js     React Query hooks, backed by the mock store
├── mock/
│   └── store.js        in-memory projects + tasks (the stand-in backend)
├── pages/          DashboardPage · ProjectPage
└── styles/         brand tokens, db-* component classes, dark-mode atmosphere
```

# Aegis-Docker: Advanced Container Hardening & Edge-AI Deployment

A hands-on DevSecOps project focused on modern container security, extreme image optimization, and local AI orchestration using the next-generation Docker ecosystem. 

This project demonstrates how to transition a high-vulnerability, bloated full-stack application (~824MB) into an enterprise-grade, hardened production container (~68MB) with zero critical vulnerabilities, alongside running secure, completely offline LLMs using Docker Model Runner.

## 🚀 Key Features & Architecture

1. **DevSecOps Vulnerability Auditing:** Integrated `Docker Scout` to run automated CVE vulnerability scans directly inside the local pipeline.
2. **Multi-Stage Optimization:** Drastically reduced attack surface and image size by isolating build dependencies from runtime environments.
3. **Enterprise Hardening (`dh.io`):** Utilized Docker Hardened Images and secure non-root user configurations to patch vulnerabilities to production-grade standards.
4. **AI-Assisted Debugging:** Leveraged Docker’s built-in `Gordon AI` assistant to audit and optimize Dockerfile layers.
5. **Edge-AI & Local Models:** Maintained an air-gapped, zero-internet local LLM workspace running Google's Gemma models via `Docker Model Runner`.

## 📈 Optimization Metrics & Results

| Image Version | Base Configuration | Size (MB) | Critical CVEs | High CVEs | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Full Build** | `node:20-alpine` (Single Stage) | ~824 MB | 5 | 44 | 🔴 Rejected |
| **Multi-Stage** | `node:24-alpine` (Split Runner) | ~375 MB | 0 | 0 | 🟡 Warning |
| **Hardened Core**| `dh.io/nginx` (Distro-less style)| **~68 MB** | **0** | **0** | 🎉 **Production Ready** |

## 🛠️ Tech Stack & Tools
* **Containerization:** Docker Desktop, Multi-stage Builds, Distroless/Hardened Images (`dh.io`)
* **Security & Testing:** Docker Scout (CVE scanning), Automated Layer Auditing
* **AI Orchestration:** Gordon AI (Dockerfile refinement), Docker Model Runner (Gemma 3/4)
* **Web Server:** Nginx (Secure reverse proxy for static assets)
