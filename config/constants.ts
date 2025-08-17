// config/constants.ts

// Network
export const NETWORK = "mainnet-beta"; // or "devnet" if testing

// EMPR Token Mint
export const EMPR_MINT = "DpAKPnU5mabCWb2d85UzycsAPR4t7WYNzby6s6D5PAJ5";

// Entry Costs alternate between 50k and 100k
export const ENTRY_COSTS = [50_000, 100_000] as const;

// Stop fee
export const STOP_FEE = 10_000;

// Participant limits
export const MIN_PARTICIPANTS = 5;
export const MAX_PARTICIPANTS = 100;

// Countdown before spin
export const PRE_SPIN_COUNTDOWN_SEC = 60;

// How long to display winner
export const HOLD_WIN_MS = 60_000;

// Pot split in basis points (out of 10000)
export const POT_SPLIT_BPS = {
  WINNER: 7500,   // 75%
  TREASURY: 1000, // 10%
  BURN: 1500,     // 15%
};

// Treasury wallet (replace with your real address later)
export const TREASURY_WALLET = "YourTreasuryWalletHere";
