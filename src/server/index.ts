import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  // ... you will write your Prisma Client queries here
  // await prisma.users.create({
  //   data: {
  //     first_name: "Matthew",
  //     last_name: "Buensalida",
  //     contact_num: "09177951793",
  //     address: "864 Acacia Ext., Ayala Alabang Village",
  //   },
  // });
  const allUsers = await prisma.users.findMany();
  console.log(allUsers);

  // await prisma.users.delete({
  //   where: {
  //     contact_num: "09177951793",
  //   },
  // });
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
