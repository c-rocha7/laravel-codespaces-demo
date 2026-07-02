# Laravel Codespaces Demo

A Laravel application configured to run with **Laravel Sail** (PHP 8.3 + MySQL 8.4) inside **GitHub Codespaces**.

## Stack

- **PHP 8.3** — via Laravel Sail app container
- **Laravel 13** — application framework
- **MySQL 8.4** — database (Sail service)
- **Laravel Sail** — Docker-based development environment

---

## Getting Started in GitHub Codespaces

### 1. Open in Codespaces

Click **Code → Codespaces → Create codespace on main** in the GitHub UI.

The devcontainer will automatically build and start the `laravel.test` and `mysql` services using Docker Compose.

### 2. Install PHP dependencies

```bash
composer install
```

### 3. Set up your environment file

```bash
cp .env.example .env
php artisan key:generate
```

> The `.env.example` is pre-configured for Sail's MySQL service (`DB_HOST=mysql`).

### 4. Run database migrations

```bash
php artisan migrate
```

### 5. Access the application

The app runs on **port 80** inside the container. Codespaces will automatically forward and open it for you. Look for the notification in the **Ports** tab.

---

## Daily Development Workflow

### Artisan commands

Run `php artisan` commands directly in the terminal (you are already inside the `laravel.test` container):

```bash
php artisan make:controller ExampleController
php artisan migrate:fresh --seed
php artisan tinker
```

### Front-end assets (Vite)

```bash
npm install
npm run dev
```

Vite's dev server runs on port **5173** and is forwarded automatically.

### MySQL access

Connect to MySQL from the terminal:

```bash
mysql -h mysql -u sail -ppassword laravel
```

Or use any database client by forwarding port **3306**.

---

## Environment Variables (Sail Defaults)

| Variable | Value |
|---|---|
| `DB_CONNECTION` | `mysql` |
| `DB_HOST` | `mysql` |
| `DB_PORT` | `3306` |
| `DB_DATABASE` | `laravel` |
| `DB_USERNAME` | `sail` |
| `DB_PASSWORD` | `password` |

---

## Running Outside Codespaces (Local with Sail)

If you want to use Sail from your local machine:

```bash
# Install dependencies (requires PHP + Composer locally)
composer install

# Copy environment file
cp .env.example .env

# Start all services
./vendor/bin/sail up -d

# Generate app key
./vendor/bin/sail artisan key:generate

# Run migrations
./vendor/bin/sail artisan migrate

# Visit http://localhost
```

---

## Useful Links

- [Laravel Documentation](https://laravel.com/docs)
- [Laravel Sail Documentation](https://laravel.com/docs/sail)
- [GitHub Codespaces Documentation](https://docs.github.com/en/codespaces)
