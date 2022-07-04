import { atom } from "recoil";

export const quickcash = atom({
  key: 'quickcash',
  default: {
    refresh: {},
  }
});