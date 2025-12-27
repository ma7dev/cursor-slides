#!/bin/bash

# Cursor Slides Build Script
# This script builds Slidev presentations and exports them as PDFs
#
# Usage:
#   ./build.sh <event-name>     # Build a specific event (e.g., ./build.sh 2025-12-riyadh-meetup)
#   ./build.sh --all            # Build all events
#   ./build.sh --dev <event>    # Start dev server for an event
#   ./build.sh --list           # List all available events

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src"
MDS_DIR="$SCRIPT_DIR/mds"
BUILD_DIR="$SCRIPT_DIR/.build"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# List all available events
list_events() {
    log_info "Available events:"
    for file in "$MDS_DIR"/*.md; do
        if [ -f "$file" ]; then
            basename "$file" .md
        fi
    done
}

# Setup build environment
setup_build() {
    local event_name="$1"
    local need_playwright_install=false
    
    log_info "Setting up build environment for: $event_name"
    
    # Create temporary build directory
    rm -rf "$BUILD_DIR"
    mkdir -p "$BUILD_DIR"
    
    # Copy src directory (theme, components, assets, configs)
    cp -r "$SRC_DIR"/* "$BUILD_DIR/"
    
    # Copy the specific event's slides.md
    cp "$MDS_DIR/$event_name.md" "$BUILD_DIR/slides.md"
    
    # Install dependencies if node_modules doesn't exist
    if [ ! -d "$BUILD_DIR/node_modules" ]; then
        log_info "Installing dependencies..."
        cd "$BUILD_DIR"
        pnpm install
        need_playwright_install=true
    fi
    
    cd "$BUILD_DIR"
    
    # Install Playwright browsers if needed (for PDF export)
    if [ "$need_playwright_install" = true ]; then
        log_info "Installing Playwright browsers for PDF export..."
        pnpm exec playwright install chromium
    fi
}

# Build PDF for an event
build_pdf() {
    local event_name="$1"
    
    if [ ! -f "$MDS_DIR/$event_name.md" ]; then
        log_error "Event not found: $event_name"
        log_info "Use './build.sh --list' to see available events"
        exit 1
    fi
    
    setup_build "$event_name"
    
    log_info "Exporting PDF for: $event_name"
    
    # Export to PDF
    pnpm exec slidev export --dark --output "$SCRIPT_DIR/$event_name.pdf" --timeout 60000
    
    log_info "PDF exported to: $SCRIPT_DIR/$event_name.pdf"
    
    # Cleanup
    rm -rf "$BUILD_DIR"
}

# Build all events
build_all() {
    log_info "Building all events..."
    
    for file in "$MDS_DIR"/*.md; do
        if [ -f "$file" ]; then
            event_name=$(basename "$file" .md)
            log_info "Building: $event_name"
            build_pdf "$event_name"
        fi
    done
    
    log_info "All events built successfully!"
}

# Start dev server for an event
start_dev() {
    local event_name="$1"
    
    if [ ! -f "$MDS_DIR/$event_name.md" ]; then
        log_error "Event not found: $event_name"
        log_info "Use './build.sh --list' to see available events"
        exit 1
    fi
    
    setup_build "$event_name"
    
    log_info "Starting dev server for: $event_name"
    log_info "Visit: http://localhost:3030"
    
    pnpm dev
}

# Main script logic
case "${1:-}" in
    --all)
        build_all
        ;;
    --list)
        list_events
        ;;
    --dev)
        if [ -z "${2:-}" ]; then
            log_error "Please specify an event name"
            log_info "Usage: ./build.sh --dev <event-name>"
            exit 1
        fi
        start_dev "$2"
        ;;
    --help|-h)
        echo "Cursor Slides Build Script"
        echo ""
        echo "Usage:"
        echo "  ./build.sh <event-name>     Build a specific event's PDF"
        echo "  ./build.sh --all            Build PDFs for all events"
        echo "  ./build.sh --dev <event>    Start dev server for an event"
        echo "  ./build.sh --list           List all available events"
        echo "  ./build.sh --help           Show this help message"
        echo ""
        echo "Examples:"
        echo "  ./build.sh 2025-12-riyadh-meetup"
        echo "  ./build.sh --dev 2025-12-riyadh-meetup"
        echo "  ./build.sh --all"
        ;;
    "")
        log_error "Please specify an event name or use --all"
        log_info "Use './build.sh --help' for usage information"
        exit 1
        ;;
    *)
        build_pdf "$1"
        ;;
esac

