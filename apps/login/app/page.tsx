'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { userService } from '@/services/userService';

export default function HomePage() {
  const router = useRouter();

  useEffect(() => {
    if (userService.isAuthenticated()) {
      // Redirect to dashboard (outside login app basePath)
      window.location.href = '/dashboard';
    } else {
      router.push('/login');
    }
  }, [router]);

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center">
      <div className="text-lg">Loading...</div>
    </div>
  );
}
