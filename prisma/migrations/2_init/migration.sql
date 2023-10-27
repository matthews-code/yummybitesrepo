-- CreateTable
CREATE TABLE "item_order" (
    "order_uid" UUID NOT NULL,
    "item_uid" UUID NOT NULL,
    "quantity" BIGINT NOT NULL,

    CONSTRAINT "item_order_pkey" PRIMARY KEY ("order_uid","item_uid")
);

-- CreateTable
CREATE TABLE "items" (
    "item_uid" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "name" TEXT NOT NULL,
    "price" DECIMAL(15,3) NOT NULL,
    "inventory" DECIMAL(15,0) NOT NULL,

    CONSTRAINT "items_pkey" PRIMARY KEY ("item_uid")
);

-- CreateTable
CREATE TABLE "orders" (
    "order_uid" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "date" TIMESTAMP(6) NOT NULL,
    "amount_due" DECIMAL(15,3) NOT NULL,
    "payment_status" TEXT,
    "payment_mode" TEXT,
    "payment_amount" DECIMAL(15,3),
    "payment_recipient" TEXT,
    "note" TEXT,
    "user_uid" UUID,

    CONSTRAINT "orders_pkey" PRIMARY KEY ("order_uid")
);

-- CreateTable
CREATE TABLE "users" (
    "user_uid" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "contact_num" CHAR(11) NOT NULL,
    "address" TEXT,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_uid")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_contact_num_key" ON "users"("contact_num");

-- AddForeignKey
ALTER TABLE "item_order" ADD CONSTRAINT "item_order_item_uid_fkey" FOREIGN KEY ("item_uid") REFERENCES "items"("item_uid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "item_order" ADD CONSTRAINT "item_order_order_uid_fkey" FOREIGN KEY ("order_uid") REFERENCES "orders"("order_uid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_user_uid_fkey" FOREIGN KEY ("user_uid") REFERENCES "users"("user_uid") ON DELETE NO ACTION ON UPDATE NO ACTION;

