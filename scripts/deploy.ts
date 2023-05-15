import { ethers, upgrades } from "hardhat";

async function main() {
  const Lock = await ethers.getContractFactory("Lock");
  const lock = await upgrades.deployProxy(Lock, [], { kind: "uups" });
  await lock.deployed();

  const LockV2 = await ethers.getContractFactory("LockV2");
  const lockV2 = await upgrades.upgradeProxy(lock.address, LockV2, {
    kind: "uups",
  });
  await lockV2.deployed();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
