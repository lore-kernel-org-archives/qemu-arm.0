Received: by 10.80.163.71 with SMTP id 65csp201397edn;
        Fri, 9 Sep 2016 09:37:50 -0700 (PDT)
X-Received: by 10.200.41.243 with SMTP id 48mr5134015qtt.20.1473439069945;
        Fri, 09 Sep 2016 09:37:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q63si2585384qki.33.2016.09.09.09.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 09:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biOoH-0006qR-9j
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 12:37:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biObY-0003Ui-Pu
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biObS-00065r-OI
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:39 -0400
Received: from 4.mo178.mail-out.ovh.net ([46.105.49.171]:39601)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1biObS-00065e-Dy
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:34 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id EEAEDFFC8F7
	for <qemu-arm@nongnu.org>; Fri,  9 Sep 2016 18:24:33 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 8E2363C0073;
	Fri,  9 Sep 2016 18:24:28 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Sep 2016 18:22:56 +0200
Message-Id: <1473438177-26079-14-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473438177-26079-1-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16303312127828265745
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutddvucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.49.171
Subject: [Qemu-arm] [PATCH v5 13/14] aspeed: add a ram_size property to the
 memory controller
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cSz8edIcaEt4

Configure the size of the RAM of the SOC using a property to propagate
the value down to the memory controller from the board level.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c               |  2 ++
 hw/arm/aspeed_soc.c           |  2 ++
 hw/misc/aspeed_sdmc.c         | 23 +++++++++++++----------
 include/hw/misc/aspeed_sdmc.h |  1 +
 4 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9013d35a674c..562bbb253391 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -113,6 +113,8 @@ static void aspeed_board_init(MachineState *machine,
                                 &bmc->ram);
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
                                    &error_abort);
+    object_property_set_int(OBJECT(&bmc->soc), ram_size, "ram-size",
+                           &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap1, "hw-strap=
1",
                             &error_abort);
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 93bc7bb66e4b..c0a310205842 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -113,6 +113,8 @@ static void aspeed_soc_init(Object *obj)
     qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
     qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
                          sc->info->silicon_rev);
+    object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
+                              "ram-size", &error_abort);
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 20bcdb52c4df..8830dc084c38 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -140,9 +140,9 @@ static const MemoryRegionOps aspeed_sdmc_ops =3D {
     .valid.max_access_size =3D 4,
 };
=20
-static int ast2400_rambits(void)
+static int ast2400_rambits(AspeedSDMCState *s)
 {
-    switch (ram_size >> 20) {
+    switch (s->ram_size >> 20) {
     case 64:
         return ASPEED_SDMC_DRAM_64MB;
     case 128:
@@ -156,14 +156,15 @@ static int ast2400_rambits(void)
     }
=20
     /* use a common default */
-    error_report("warning: Invalid RAM size 0x" RAM_ADDR_FMT
-                 ". Using default 256M", ram_size);
+    error_report("warning: Invalid RAM size 0x%" PRIx64
+                 ". Using default 256M", s->ram_size);
+    s->ram_size =3D 256 << 20;
     return ASPEED_SDMC_DRAM_256MB;
 }
=20
-static int ast2500_rambits(void)
+static int ast2500_rambits(AspeedSDMCState *s)
 {
-    switch (ram_size >> 20) {
+    switch (s->ram_size >> 20) {
     case 128:
         return ASPEED_SDMC_AST2500_128MB;
     case 256:
@@ -177,8 +178,9 @@ static int ast2500_rambits(void)
     }
=20
     /* use a common default */
-    error_report("warning: Invalid RAM size 0x" RAM_ADDR_FMT
-                 ". Using default 512M", ram_size);
+    error_report("warning: Invalid RAM size 0x%" PRIx64
+                 ". Using default 512M", s->ram_size);
+    s->ram_size =3D 512 << 20;
     return ASPEED_SDMC_AST2500_512MB;
 }
=20
@@ -222,11 +224,11 @@ static void aspeed_sdmc_realize(DeviceState *dev, E=
rror **errp)
=20
     switch (s->silicon_rev) {
     case AST2400_A0_SILICON_REV:
-        s->ram_bits =3D ast2400_rambits();
+        s->ram_bits =3D ast2400_rambits(s);
         break;
     case AST2500_A0_SILICON_REV:
     case AST2500_A1_SILICON_REV:
-        s->ram_bits =3D ast2500_rambits();
+        s->ram_bits =3D ast2500_rambits(s);
         break;
     default:
         g_assert_not_reached();
@@ -249,6 +251,7 @@ static const VMStateDescription vmstate_aspeed_sdmc =3D=
 {
=20
 static Property aspeed_sdmc_properties[] =3D {
     DEFINE_PROP_UINT32("silicon-rev", AspeedSDMCState, silicon_rev, 0),
+    DEFINE_PROP_UINT64("ram-size", AspeedSDMCState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.=
h
index df7dce0edddf..551c8afdf4be 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -26,6 +26,7 @@ typedef struct AspeedSDMCState {
     uint32_t regs[ASPEED_SDMC_NR_REGS];
     uint32_t silicon_rev;
     uint32_t ram_bits;
+    uint64_t ram_size;
=20
 } AspeedSDMCState;
=20
--=20
2.7.4

