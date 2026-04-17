'use client';

import { useEffect, useState } from 'react';
import { authService } from '@/services/authService';
import DashboardPage from './dashboard/page';
import DashboardLayout from './dashboard/layout';

export default function Home() {
  const [checking, setChecking] = useState(true);

  useEffect(() => {
    const token = authService.getToken();
    const user = authService.getUser();

    if (!token || !user) {
      // Not authenticated, redirect to login app
      window.location.href = '/login';
    } else {
      // Authenticated, stay on the dashboard
      setChecking(false);
    }    
  }, []);

  if (checking) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-lg">Loading...</div>
      </div>
    );
  }

  return (
    <DashboardLayout>
      <DashboardPage />
    </DashboardLayout>
  );
}
