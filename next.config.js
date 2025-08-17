/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  experimental: {
    appDir: true, // make sure App Router is enabled
  },
};

module.exports = nextConfig;
