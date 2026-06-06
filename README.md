Timon Weides – Cloud CV Portfolio

Persönliche CV-Website mit automatisiertem Deployment auf AWS, Infrastructure as Code und Security-Scanning.

Projektübersicht

Dieses Projekt dient als praktische Demonstration moderner Cloud- und DevOps-Technologien. Die Website wird nach jeder Änderung automatisch über eine CI/CD-Pipeline veröffentlicht.

Architektur:

GitHub Repo

↓

GitHub Actions

↓

Terraform Validate & Plan

↓

Trivy Security Scan

↓

AWS S3 Static Website Hosting

↓

Amazon CloudFront

↓

Route 53 DNS

↓

https://timonweides.de

Verwendete Technologien:
Cloud
AWS S3
Amazon CloudFront
Amazon Route 53
AWS Certificate Manager (ACM)
Infrastructure as Code
Terraform
CI/CD
GitHub Actions

Sicherheit:
Trivy Security Scanner

Funktionen:
Automatisches Deployment bei jedem Push auf den Main-Branch
Terraform-Validierung innerhalb der CI/CD-Pipeline
Automatisierte Sicherheitsprüfung mittels Trivy
Auslieferung der Website über CloudFront CDN
HTTPS-Verschlüsselung über AWS Certificate Manager
Eigene Domain über Route 53

Bei jedem Push auf den Main-Branch wird automatisch folgende Pipeline ausgeführt:
Repo auschecken
Terraform Initialisierung
Terraform Validierung
Terraform Plan
Trivy Security Scan
AWS Authentifizierung
Deployment der Website nach Amazon S3
CloudFront Cache Invalidierung
Terraform

Terraform wird verwendet, um Infrastruktur als Code abzubilden und Infrastrukturänderungen automatisiert zu prüfen.

Aktuell verwaltete Ressourcen:
AWS S3 Website Bucket
Geplante Erweiterungen
Terraform Remote State Backend in AWS S3
Verwaltung von CloudFront über Terraform
Verwaltung von Route 53 und ACM über Terraform
Automatische Pull-Request-Validierungen

Ziel des Projekts:
Ziel dieses Projekts ist es, praktische Erfahrungen mit Cloud- und DevOps-Technologien zu sammeln und typische Enterprise-Konzepte in einer produktiven Umgebung umzusetzen.
