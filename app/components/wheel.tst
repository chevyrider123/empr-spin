"use client";
import { useEffect, useState } from "react";

type WheelProps = {
  participants: string[];
  winnerIndex: number | null;
  muted: boolean;
};

export default function Wheel({ participants, winnerIndex, muted }: WheelProps) {
  const [angle, setAngle] = useState(0);

  // Spin when we have a winner
  useEffect(() => {
    if (winnerIndex !== null && participants.length > 0) {
      const slice = 360 / participants.length;
      const winnerCenterDeg = winnerIndex * slice + slice / 2;
      const rawTarget = 360 - winnerCenterDeg;

      const base = 6 * 360; // 6 full spins
      const delta = ((rawTarget - (angle % 360)) + 360) % 360;
      const targetAngle = angle + base + delta;

      setAngle(targetAngle);

      if (!muted) {
        const audio = new Audio("/click.mp3");
        audio.play().catch(() => {});
      }
    }
  }, [winnerIndex]);

  return (
    <div className="relative">
      {/* Pointer Triangle (faces down) */}
      <div className="absolute top-[-20px] left-1/2 -translate-x-1/2 w-0 h-0 border-l-[12px] border-r-[12px] border-b-[20px] border-l-transparent border-r-transparent border-b-red-600 z-10"></div>

      {/* Wheel */}
      <div
        className="w-72 h-72 rounded-full border-4 border-gray-800 flex items-center justify-center transition-transform duration-[4200ms] ease-out"
        style={{ transform: `rotate(${angle}deg)` }}
      >
        {participants.map((p, i) => {
          const slice = 360 / participants.length;
          return (
            <div
              key={i}
              className={`absolute w-1/2 h-1/2 origin-bottom-left flex items-center justify-end pr-2 text-xs font-bold ${
                winnerIndex === i ? "bg-green-400 text-white" : "bg-yellow-200"
              }`}
              style={{ transform: `rotate(${i * slice}deg) skewY(-${90 - slice}deg)` }}
            >
              <span className="transform skewY(${90 - slice}deg) rotate(${slice / 2}deg)">
                {p}
              </span>
            </div>
          );
        })}
      </div>
    </div>
  );
}
