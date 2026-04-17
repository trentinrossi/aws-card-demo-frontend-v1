import type { Metadata } from 'next';
import './globals.css';

export const metadata: Metadata = {
  title: 'GFT - Mainframe Modernization',
  description: 'GFT Demo Application - User Management and Authentication',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className="antialiased">
        {children}
      </body>
    </html>
  );
}
