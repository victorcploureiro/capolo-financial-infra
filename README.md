# Financial SaaS Infrastructure

![Version](https://img.shields.io/badge/version-1.0.0--alpha-blue.svg)
![Status](https://img.shields.io/badge/status-active-success.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

Infraestrutura enxuta e modular para orquestração de serviços com **n8n**, **PostgreSQL** e **Caddy Gateway** otimizada para implantação em servidor Linux local e preparada para migração em nuvem (Fase 1 do Roadmap SaaS).

---

## Stack Tecnológica

| Serviço | Tecnologia | Função | Portas Internas |
| :--- | :--- | :--- | :--- |
| **Gateway / Proxy** | Caddy 2 | Reverse Proxy & SSL | 80 / 443 |
| **Orquestrador** | n8n Engine | Automações e Fluxos | 5678 |
| **Banco de Dados** | PostgreSQL 16 | Relacional (Multi-tenant) | 5432 |
| **Frontend** | PWA (Lovable / React) | Interface Web Estática | Local |

---

## Como Executar

### 1. Copie o arquivo de variáveis de ambiente e configure suas credenciais:
```bash
cp .env.example .env
```

### 2. Crie as pastas necessárias para persistência de dados local:
```bash
mkdir -p postgres_data n8n_data caddy_data caddy_config pwa_web
```

### 3. Inicie os contêineres:
```bash
docker compose up -d
```

---

## Roadmap Técnico

- [x] v1.0.0-alpha (Fase 1): Deploy local com Docker Compose, PostgreSQL e Caddy Gateway.
- [ ] v1.1.0-beta (Fase 2): Autenticação JWT, Cloudfare Tunnel (SSL) e suporte multi-tenant no PostgreSQL.
- [ ] v2.0.0 (Fase 3): Migração para VPS Nuvem, suporte a Webhooks de Pagamento e Alta Disponibilidade.

---

## Assinatura e Autoria

- Desenvolvido por Victor Carrara
- Projeto: Capolo Financial Advisor
- Versão atual: v1.0.0-alpha
