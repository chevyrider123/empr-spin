"use client";
import Wheel from "./components/Wheel";
import { useState } from "react";

export default function HomePage() {
  const [muted, setMuted] = useState(false);

  return (
    <main className="min-h-screen bg-gradient-to-br from-green-200 via-yellow-100 to-green-400 flex flex-col">
      {/* Header */}
      <header className="flex justify-between items-center p-6 shadow-md bg-white/70 backdrop-blur">
        <h1 className="text-2xl font-extrabold text-green-800">
          EMPR Token Spin
        </h1>

        <div className="flex items-center gap-4">
          {/* Fake connect/disconnect buttons for now */}
          <button className="px-4 py-2 rounded-lg bg-green-600 text-white font-bold">
            Connect Wallet
          </button>
          <button className="px-4 py-2 rounded-lg bg-gray-400 text-white font-bold">
            Disconnect
          </button>

          {/* Mute toggle */}
          <button
            onClick={() => setMuted(!muted)}
            className="px-3 py-2 rounded-lg bg-yellow-400 font-bold"
          >
            {muted ? "Unmute" : "Mute"}
          </button>
        </div>
      </header>

      {/* Hero Section */}
      <section className="flex flex-col items-center mt-10">
        <h2 className="text-3xl font-bold text-gray-800 mb-2">
          Take a turn with the EMPR Token Spin Today 🎉
        </h2>
        <p className="text-lg text-gray-600 mb-8">
          Join the fun, spin the wheel, and win EMPR with fair on-chain
          randomness.
        </p>
      </section>

      {/* Wheel in Center */}
      <div className="flex justify-center">
        <Wheel
          participants={[
            "7XhP..91aL",
            "9KfJ..2kPp",
            "3Tgh..8XwQ",
            "5MmN..7LpZ",
            "2AaB..9QwE",
          ]}
          winnerIndex={2}
          muted={muted}
        />
      </div>

      {/* Rules Section */}
      <section className="mt-12 px-8 grid md:grid-cols-3 gap-6">
        <div className="p-6 bg-white rounded-2xl shadow-md">
          <h3 className="font-bold text-green-700">Entry Cost</h3>
          <p>
            Rounds alternate between <b>50,000</b> and <b>100,000</b> EMPR
            tokens.
          </p>
        </div>
        <div className="p-6 bg-white rounded-2xl shadow-md">
          <h3 className="font-bold text-green-700">Stop Now</h3>
          <p>
            Any enrolled user may pay <b>10,000</b> EMPR to finalize early — odds
            never change.
          </p>
        </div>
        <div className="p-6 bg-white rounded-2xl shadow-md">
          <h3 className="font-bold text-green-700">Payout Split</h3>
          <p>
            <b>75%</b> Winner • <b>10%</b> Company • <b>15%</b> Burned
          </p>
        </div>
      </section>

      {/* Footer */}
      <footer className="mt-auto p-6 bg-white/80 text-center text-sm text-gray-700">
        © 2025 rights of Creating Empowerment Solutions LLC
      </footer>
    </main>
  );
}
