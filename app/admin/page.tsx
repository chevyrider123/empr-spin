"use client";
import { useState } from "react";

interface Round {
  roundNo: number;
  entryCost: number;
  participants: number;
  winner: string;
  payments: number;
}

export default function AdminPage() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [loggedIn, setLoggedIn] = useState(false);

  // Dummy past winners
  const rounds: Round[] = [
    { roundNo: 1, entryCost: 50000, participants: 12, winner: "7XhP..91aL", payments: 620000 },
    { roundNo: 2, entryCost: 100000, participants: 8, winner: "9KfJ..2kPp", payments: 840000 },
  ];

  const handleLogin = () => {
    if (username === "admin123" && password === "zamtank1995!") {
      setLoggedIn(true);
    } else {
      alert("Invalid login");
    }
  };

  if (!loggedIn) {
    return (
      <main className="min-h-screen flex items-center justify-center bg-gray-100">
        <div className="bg-white shadow-md rounded-lg p-6 w-80">
          <h2 className="text-xl font-bold mb-4 text-center">Admin Login</h2>
          <input
            type="text"
            placeholder="Username"
            className="border rounded w-full px-3 py-2 mb-2"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
          <input
            type="password"
            placeholder="Password"
            className="border rounded w-full px-3 py-2 mb-4"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
          <button
            onClick={handleLogin}
            className="w-full bg-green-600 text-white py-2 rounded font-bold"
          >
            Login
          </button>
        </div>
      </main>
    );
  }

  return (
    <main className="min-h-screen bg-gradient-to-br from-yellow-100 to-green-200 p-8">
      <h1 className="text-2xl font-bold mb-6 text-green-800">Admin Panel</h1>

      <h2 className="text-lg font-semibold mb-4">Past Rounds</h2>
      <table className="w-full bg-white shadow-md rounded-lg overflow-hidden">
        <thead className="bg-green-600 text-white">
          <tr>
            <th className="p-2">Round #</th>
            <th className="p-2">Entry Cost</th>
            <th className="p-2">Participants</th>
            <th className="p-2">Winner</th>
            <th className="p-2">Payments</th>
          </tr>
        </thead>
        <tbody>
          {rounds.map((r) => (
            <tr key={r.roundNo} className="text-center border-t">
              <td className="p-2">{r.roundNo}</td>
              <td className="p-2">{r.entryCost.toLocaleString()} EMPR</td>
              <td className="p-2">{r.participants}</td>
              <td className="p-2">{r.winner}</td>
              <td className="p-2">{r.payments.toLocaleString()} EMPR</td>
            </tr>
          ))}
        </tbody>
      </table>
    </main>
  );
}
