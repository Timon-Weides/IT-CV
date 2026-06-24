# Timon Weides — Cloud CV Portfolio

> Persönliche CV-Website als produktives DevOps-Projekt — vollständig automatisiert deployed auf AWS mit Infrastructure as Code, CI/CD Pipeline und Security-Scanning.

🌐 **[timonweides.de](https://timonweides.de)**

---

## Projektübersicht

Dieses Projekt ist kein einfacher Lebenslauf — die Website selbst ist das Projekt. Jede Änderung am Code wird automatisch über eine CI/CD-Pipeline validiert, geprüft und auf AWS deployed. Ziel ist die praktische Demonstration moderner Cloud- und DevOps-Konzepte in einer produktiven Umgebung.

---

## Architektur

```
GitHub Repository
       │
       ▼
GitHub Actions (CI/CD)
       │
       ├── Trivy Security Scan
       ├── Terraform Init → Validate → Plan → Apply
       └── AWS S3 Sync + CloudFront Invalidierung
                          │
                          ▼
                    AWS S3 (Static Hosting)
                          │
                          ▼
                  Amazon CloudFront (CDN)
                          │
                          ▼
              AWS Certificate Manager (HTTPS)
                          │
                          ▼
                 Amazon Route 53 (DNS)
                          │
                          ▼
                  https://timonweides.de
```

---

## Stack

| Kategorie | Technologie |
|---|---|
| **Cloud** | AWS S3, CloudFront, Route 53, ACM |
| **IaC** | Terraform |
| **CI/CD** | GitHub Actions |
| **Security** | Trivy Security Scanner |
| **State** | Terraform Remote State (S3 + Lock) |

---

## Pipeline

Bei jedem Push auf `main` wird automatisch folgende Pipeline ausgeführt:

```
1. Checkout Repository
2. Trivy Security Scan         → scannt auf HIGH/CRITICAL Vulnerabilities
3. Terraform Init              → lädt Remote State aus S3
4. Terraform Validate          → prüft Syntax der .tf Dateien
5. Terraform Plan              → zeigt geplante Infrastrukturänderungen
6. Terraform Apply             → führt Änderungen durch (nur auf main)
7. Generate deploy-info.json   → Timestamp + Commit Hash
8. Upload nach S3              → synct Website-Dateien
9. CloudFront Invalidierung    → leert CDN Cache
```

---

## Terraform

Terraform verwaltet die AWS-Infrastruktur als Code und wird vollständig in der CI/CD-Pipeline ausgeführt.

**Verwaltete Ressourcen:**
- AWS S3 Bucket (Static Website Hosting)
- Amazon CloudFront Distribution

**Remote State:**

Der Terraform State wird nicht lokal gespeichert, sondern in einem dedizierten S3 Bucket mit aktiviertem Versioning und State Locking:

```hcl
backend "s3" {
  bucket       = "timon-weides-tfstate"
  key          = "cv-website/terraform.tfstate"
  region       = "eu-central-1"
  encrypt      = true
  use_lockfile = true
}
```

---

## Live Status

Die Website zeigt einen Live-Status-Block mit:
- Zeitpunkt des letzten Deployments
- Zeit seit letztem Deploy
- Pipeline-Status

Diese Daten werden von GitHub Actions bei jedem Deploy in eine `deploy-info.json` geschrieben und von der Website geladen.

---

## Lokale Entwicklung

```bash
# Repository klonen
git clone https://github.com/Timon-Weides/IT-CV.git
cd IT-CV

# Website lokal öffnen
open website/index.html

# Terraform lokal ausführen
cd terraform
terraform init
terraform plan
```

**Voraussetzungen:** AWS CLI konfiguriert, Terraform installiert

---

## Geplante Erweiterungen

- [ ] Pull Request Workflow (plan auf PR, apply auf merge)
- [ ] Route 53 und ACM in Terraform verwalten
- [ ] Serverless Backend (AWS Lambda + API Gateway)

---

## Ziel

Praktische Erfahrungen mit Cloud- und DevOps-Technologien sammeln und Enterprise-Konzepte in einer produktiven Umgebung umsetzen — nicht nur theoretisch kennen, sondern aktiv betreiben.
