"use client";
import { useState, useEffect } from "react";

interface WheelProps {
  participants: string[];
  winnerIndex: number;
  muted: boolean;
}

export default function Wheel({ participants, winnerIndex, muted }: WheelProps) {
  const [spinning, setSpinning] = useState(false);
  const [rotation, setRotation] = useState(0);
  const [finalIndex, setFinalIndex] = useState<number | null>(null);

  const sliceAngle = 360 / participants.length;

  useEffect(() => {
    if (spinning) {
      // Calculate spin to land on winner
      const winnerCenter = winnerIndex * sliceAngle + sliceAngle / 2;
      const rawTarget = 360 - winnerCenter;
      const base = 6 * 360; // 6 full spins
      const delta = ((rawTarget - (rotation % 360)) + 360) % 360;
      const target = rotation + base + delta;

      setTimeout(() => {
        setRotation(target);
        setTimeout(() => {
          setSpinning(false);
          setFinalIndex(winnerIndex);

          if (!muted) {
            const audio = new Audio("/ding.mp3");
            audio.play();
          }

          // Confetti
          import("canvas-confetti").then((confetti) => {
            confetti.default({ particleCount: 100, spread: 70, origin: { y: 0.6 } });
          });
        }, 4200);
      }, 100);
    }
  }, [spinning]);

  return (
    <div className="relative flex flex-col items-center">
      {/* Pointer */}
      <div
        className="absolute -top-6 w-0 h-0 border-l-[15px] border-r-[15px] border-b-[30px] border-transparent border-b-red-600"
      />

      {/* Wheel */}
      <div
        className="rounded-full border-4 border-green-700"
        style={{
          width: "400px",
          height: "400px",
          background: `conic-gradient(${participants
            .map(
              (p, i) =>
                `${finalIndex === i ? "lightgreen" : i % 2 === 0 ? "#FFD700" : "#FF4500"} ${
                  (i * sliceAngle).toFixed(2)
                }deg ${(i + 1) * sliceAngle}deg`
            )
            .join(", ")})`,
          transform: `rotate(${rotation}deg)`,
          transition: spinning ? "transform 4.2s ease-out" : "none",
        }}
      >
        {/* Labels */}
        {participants.map((p, i) => {
          const angle = (i + 0.5) * sliceAngle;
          return (
            <div
              key={i}
              className="absolute text-xs font-bold text-black"
              style={{
                top: "50%",
                left: "50%",
                transform: `rotate(${angle}deg) translate(140px) rotate(-${angle}deg)`,
                transformOrigin: "center",
              }}
            >
              {p}
            </div>
          );
        })}
      </div>

      {/* Spin button */}
      <button
        onClick={() => {
          setSpinning(true);
          setFinalIndex(null);
        }}
        className="mt-6 px-6 py-2 bg-green-600 text-white font-bold rounded-lg shadow"
        disabled={spinning}
      >
        {spinning ? "Spinning..." : "Spin the Wheel"}
      </button>

      {/* Blinking light */}
      {finalIndex !== null && (
        <div className="absolute right-[-80px] top-1/2 animate-pulse w-8 h-8 bg-green-500 rounded-full shadow-lg border-2 border-white" />
      )}
    </div>
  );
}
