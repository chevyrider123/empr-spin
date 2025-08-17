import "./globals.css";
import { ReactNode } from "react";

export const metadata = {
  title: "EMPR Token Spin",
  description: "Take a turn with the EMPR Token Spin Today!",
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
