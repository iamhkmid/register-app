import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

const main = async () => {
  const admin = await prisma.user.create({
    data: {
      username: "admin",
      password: "admin",
      role: "ADMIN",
    },
  });
  console.log({ admin });
};
main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
