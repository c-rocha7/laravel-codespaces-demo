#!/usr/bin/env bash
set -e

cd /var/www/html

echo "📦 Installing PHP dependencies..."
composer install --no-interaction

echo ""
echo "⚙️  Setting up environment..."
if [ ! -f ".env" ]; then
    cp .env.example .env
    echo "✅ .env created from .env.example"
fi

echo ""
echo "🔑 Generating application key..."
php artisan key:generate --ansi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  Run migrations:  php artisan migrate"
echo "  Install npm:     npm install && npm run dev"
echo ""
echo "The app is available on port 80 (check the Ports tab in VS Code)."
