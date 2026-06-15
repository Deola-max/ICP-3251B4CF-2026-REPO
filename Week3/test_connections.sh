#!/bin/bash
# Week 3: Automated Connection & Reliability Testing Script

echo "=================================================="
echo "🚀 Starting DevOps DevOps Internship Project 1 Validation Tests..."
echo "=================================================="

# Check Frontend HTTP Response
echo -n "Testing Frontend Service (Port 80)... "
FRONTEND_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:80 || echo "FAILED")
if [ "$FRONTEND_STATUS" == "200" ] || [ "$FRONTEND_STATUS" == "304" ]; then
    echo "✅ SUCCESS (Status: $FRONTEND_STATUS)"
else
    echo "❌ FAILED (Status: $FRONTEND_STATUS)"
fi

# Check Backend Service Response
echo -n "Testing Backend Service API (Port 5000)... "
BACKEND_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000 || echo "FAILED")
if [ "$BACKEND_STATUS" != "FAILED" ]; then
    echo "✅ SUCCESS"
else
    echo "❌ FAILED"
fi

echo "=================================================="
echo "🎉 Reliability validation testing complete!"
echo "=================================================="