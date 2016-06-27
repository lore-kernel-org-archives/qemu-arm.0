Received: by 10.25.21.96 with SMTP id l93csp1209845lfi;
        Mon, 27 Jun 2016 09:45:55 -0700 (PDT)
X-Received: by 10.55.161.141 with SMTP id k135mr10487982qke.189.1467045955788;
        Mon, 27 Jun 2016 09:45:55 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o34si17976329qtd.10.2016.06.27.09.45.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 09:45:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHZfX-0003BY-5S
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 12:45:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHZdl-00022P-2W
	for qemu-devel@nongnu.org; Mon, 27 Jun 2016 12:44:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHZdg-0008Cr-0H
	for qemu-devel@nongnu.org; Mon, 27 Jun 2016 12:44:04 -0400
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:40075)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHZdf-0008Cc-N2
	for qemu-devel@nongnu.org; Mon, 27 Jun 2016 12:43:59 -0400
Received: from player728.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id BEEDC10101F8
	for <qemu-devel@nongnu.org>; Mon, 27 Jun 2016 18:43:56 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player728.ha.ovh.net (Postfix) with ESMTPSA id 4065F540076;
	Mon, 27 Jun 2016 18:43:47 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 27 Jun 2016 18:43:29 +0200
Message-Id: <1467045813-18144-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467045813-18144-1-git-send-email-clg@kaod.org>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6326431577551899409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddruddugdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.48.182
Subject: [Qemu-devel] [PATCH v4 1/5] m25p80: qdev-ify drive property
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XLbEH6MWYLle

From: Paolo Bonzini <pbonzini@redhat.com>

This allows specifying the property via -drive if=3Dnone and creating
the flash device with -device.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[clg: added an extra fix for sabrelite_init()
      keeping the test on flash_dev did not seem necessary. ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/sabrelite.c                  | 18 ++++++++++++------
 hw/arm/xilinx_zynq.c                |  8 +++++++-
 hw/arm/xlnx-ep108.c                 |  9 ++++++++-
 hw/block/m25p80.c                   | 10 ++--------
 hw/microblaze/petalogix_ml605_mmu.c |  9 ++++++++-
 5 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 776c51e39869..4e7ac8cc4f4b 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -86,13 +86,19 @@ static void sabrelite_init(MachineState *machine)
             spi_bus =3D (SSIBus *)qdev_get_child_bus(DEVICE(spi_dev), "s=
pi");
             if (spi_bus) {
                 DeviceState *flash_dev;
-
-                flash_dev =3D ssi_create_slave(spi_bus, "sst25vf016b");
-                if (flash_dev) {
-                    qemu_irq cs_line =3D qdev_get_gpio_in_named(flash_de=
v,
-                                                              SSI_GPIO_C=
S, 0);
-                    sysbus_connect_irq(SYS_BUS_DEVICE(spi_dev), 1, cs_li=
ne);
+                qemu_irq cs_line;
+                DriveInfo *dinfo =3D drive_get_next(IF_MTD);
+
+                flash_dev =3D ssi_create_slave_no_init(spi_bus, "sst25vf=
016b");
+                if (dinfo) {
+                    qdev_prop_set_drive(flash_dev, "drive",
+                                        blk_by_legacy_dinfo(dinfo),
+                                        &error_fatal);
                 }
+                qdev_init_nofail(flash_dev);
+
+                cs_line =3D qdev_get_gpio_in_named(flash_dev, SSI_GPIO_C=
S, 0);
+                sysbus_connect_irq(SYS_BUS_DEVICE(spi_dev), 1, cs_line);
             }
         }
     }
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index aefebcfa6d8f..b0cabe2e4a67 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -138,7 +138,13 @@ static inline void zynq_init_spi_flashes(uint32_t ba=
se_addr, qemu_irq irq,
         spi =3D (SSIBus *)qdev_get_child_bus(dev, bus_name);
=20
         for (j =3D 0; j < num_ss; ++j) {
-            flash_dev =3D ssi_create_slave(spi, "n25q128");
+            DriveInfo *dinfo =3D drive_get_next(IF_MTD);
+            flash_dev =3D ssi_create_slave_no_init(spi, "n25q128");
+            if (dinfo) {
+                qdev_prop_set_drive(flash_dev, "drive",
+                                    blk_by_legacy_dinfo(dinfo), &error_f=
atal);
+            }
+            qdev_init_nofail(flash_dev);
=20
             cs_line =3D qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0=
);
             sysbus_connect_irq(busdev, i * num_ss + j + 1, cs_line);
diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
index 34b464171266..4ec590a25db5 100644
--- a/hw/arm/xlnx-ep108.c
+++ b/hw/arm/xlnx-ep108.c
@@ -88,12 +88,19 @@ static void xlnx_ep108_init(MachineState *machine)
         SSIBus *spi_bus;
         DeviceState *flash_dev;
         qemu_irq cs_line;
+        DriveInfo *dinfo =3D drive_get_next(IF_MTD);
         gchar *bus_name =3D g_strdup_printf("spi%d", i);
=20
         spi_bus =3D (SSIBus *)qdev_get_child_bus(DEVICE(&s->soc), bus_na=
me);
         g_free(bus_name);
=20
-        flash_dev =3D ssi_create_slave(spi_bus, "sst25wf080");
+        flash_dev =3D ssi_create_slave_no_init(spi_bus, "sst25wf080");
+        if (dinfo) {
+            qdev_prop_set_drive(flash_dev, "drive", blk_by_legacy_dinfo(=
dinfo),
+                                &error_fatal);
+        }
+        qdev_init_nofail(flash_dev);
+
         cs_line =3D qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
=20
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi[i]), 1, cs_line);
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index e6f6e23fb71d..7d1c34a1a2d1 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -881,7 +881,6 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32=
_t tx)
=20
 static void m25p80_realize(SSISlave *ss, Error **errp)
 {
-    DriveInfo *dinfo;
     Flash *s =3D M25P80(ss);
     M25P80Class *mc =3D M25P80_GET_CLASS(s);
=20
@@ -890,14 +889,8 @@ static void m25p80_realize(SSISlave *ss, Error **err=
p)
     s->size =3D s->pi->sector_size * s->pi->n_sectors;
     s->dirty_page =3D -1;
=20
-    /* FIXME use a qdev drive property instead of drive_get_next() */
-    dinfo =3D drive_get_next(IF_MTD);
-
-    if (dinfo) {
+    if (s->blk) {
         DB_PRINT_L(0, "Binding to IF_MTD drive\n");
-        s->blk =3D blk_by_legacy_dinfo(dinfo);
-        blk_attach_dev_nofail(s->blk, s);
-
         s->storage =3D blk_blockalign(s->blk, s->size);
=20
         if (blk_pread(s->blk, 0, s->storage, s->size) !=3D s->size) {
@@ -925,6 +918,7 @@ static void m25p80_pre_save(void *opaque)
=20
 static Property m25p80_properties[] =3D {
     DEFINE_PROP_UINT32("nonvolatile-cfg", Flash, nonvolatile_cfg, 0x8FFF=
),
+    DEFINE_PROP_DRIVE("drive", Flash, blk),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogi=
x_ml605_mmu.c
index 07527b677b37..4968bdbb2821 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -191,9 +191,16 @@ petalogix_ml605_init(MachineState *machine)
         spi =3D (SSIBus *)qdev_get_child_bus(dev, "spi");
=20
         for (i =3D 0; i < NUM_SPI_FLASHES; i++) {
+            DriveInfo *dinfo =3D drive_get_next(IF_MTD);
             qemu_irq cs_line;
=20
-            dev =3D ssi_create_slave(spi, "n25q128");
+            dev =3D ssi_create_slave_no_init(spi, "n25q128");
+            if (dinfo) {
+                qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(di=
nfo),
+                                    &error_fatal);
+            }
+            qdev_init_nofail(dev);
+
             cs_line =3D qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
             sysbus_connect_irq(busdev, i+1, cs_line);
         }
--=20
2.1.4

