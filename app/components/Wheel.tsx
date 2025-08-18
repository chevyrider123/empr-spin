"use client";
import { useState } from "react";

interface WheelProps {
  participants: string[];
  winnerIndex: number;
  muted: boolean;
}

export default function Wheel({ participants, winnerIndex, muted }: WheelProps) {
  const [spinning, setSpinning] = useState(false);

  const spin = () => {
    if (spinning) return;
    setSpinning(true);
    setTimeout(() => setSpinning(false), 3000);
  };

  return (
    <div className="flex flex-col items-center">
      <div className={`w-64 h-64 rounded-full border-4 border-green-700 flex items-center justify-center ${spinning ? "animate-spin" : ""}`}>
        🎡
      </div>
      <button
        onClick={spin}
        className="mt-4 px-6 py-2 rounded-lg bg-green-600 text-white font-bold"
      >
        Spin the Wheel
      </button>
      {!muted && spinning && <p className="mt-2 text-yellow-700">Spinning...</p>}
      {!spinning && <p className="mt-2">Winner: {participants[winnerIndex]}</p>}
    </div>
  );
}
