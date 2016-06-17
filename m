Received: by 10.25.21.96 with SMTP id l93csp234182lfi;
        Fri, 17 Jun 2016 05:18:14 -0700 (PDT)
X-Received: by 10.140.29.247 with SMTP id b110mr1734808qgb.2.1466165894282;
        Fri, 17 Jun 2016 05:18:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g188si23692998qkd.16.2016.06.17.05.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 05:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDsiz-00048A-I6
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 08:18:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDsgq-0001ty-Qs
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 08:16:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDsgl-00035j-Md
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 08:15:59 -0400
Received: from 8.mo53.mail-out.ovh.net ([87.98.185.57]:45466)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bDsgl-00035I-BI
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 08:15:55 -0400
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id 8D80AFF93D2
	for <qemu-arm@nongnu.org>; Fri, 17 Jun 2016 14:15:54 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 1D28E6200A3;
	Fri, 17 Jun 2016 14:15:45 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 17 Jun 2016 14:15:20 +0200
Message-Id: <1466165724-7620-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466165724-7620-1-git-send-email-clg@kaod.org>
References: <1466165724-7620-1-git-send-email-clg@kaod.org>
X-Ovh-Tracer-Id: 16859788157040429841
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrledtgdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.185.57
Subject: [Qemu-arm] [PATCH v2 1/5] m25p80: qdev-ify drive property
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cz2Oa1GxJjkQ

From: Paolo Bonzini <pbonzini@redhat.com>

This allows specifying the property via -drive if=none and creating
the flash device with -device.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/xilinx_zynq.c                |  8 +++++++-
 hw/arm/xlnx-ep108.c                 |  9 ++++++++-
 hw/block/m25p80.c                   | 10 ++--------
 hw/microblaze/petalogix_ml605_mmu.c |  9 ++++++++-
 4 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index aefebcfa6d8f..b0cabe2e4a67 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -138,7 +138,13 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
         spi = (SSIBus *)qdev_get_child_bus(dev, bus_name);
 
         for (j = 0; j < num_ss; ++j) {
-            flash_dev = ssi_create_slave(spi, "n25q128");
+            DriveInfo *dinfo = drive_get_next(IF_MTD);
+            flash_dev = ssi_create_slave_no_init(spi, "n25q128");
+            if (dinfo) {
+                qdev_prop_set_drive(flash_dev, "drive",
+                                    blk_by_legacy_dinfo(dinfo), &error_fatal);
+            }
+            qdev_init_nofail(flash_dev);
 
             cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
             sysbus_connect_irq(busdev, i * num_ss + j + 1, cs_line);
diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
index 34b464171266..4ec590a25db5 100644
--- a/hw/arm/xlnx-ep108.c
+++ b/hw/arm/xlnx-ep108.c
@@ -88,12 +88,19 @@ static void xlnx_ep108_init(MachineState *machine)
         SSIBus *spi_bus;
         DeviceState *flash_dev;
         qemu_irq cs_line;
+        DriveInfo *dinfo = drive_get_next(IF_MTD);
         gchar *bus_name = g_strdup_printf("spi%d", i);
 
         spi_bus = (SSIBus *)qdev_get_child_bus(DEVICE(&s->soc), bus_name);
         g_free(bus_name);
 
-        flash_dev = ssi_create_slave(spi_bus, "sst25wf080");
+        flash_dev = ssi_create_slave_no_init(spi_bus, "sst25wf080");
+        if (dinfo) {
+            qdev_prop_set_drive(flash_dev, "drive", blk_by_legacy_dinfo(dinfo),
+                                &error_fatal);
+        }
+        qdev_init_nofail(flash_dev);
+
         cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi[i]), 1, cs_line);
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index e6f6e23fb71d..7d1c34a1a2d1 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -881,7 +881,6 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
 
 static void m25p80_realize(SSISlave *ss, Error **errp)
 {
-    DriveInfo *dinfo;
     Flash *s = M25P80(ss);
     M25P80Class *mc = M25P80_GET_CLASS(s);
 
@@ -890,14 +889,8 @@ static void m25p80_realize(SSISlave *ss, Error **errp)
     s->size = s->pi->sector_size * s->pi->n_sectors;
     s->dirty_page = -1;
 
-    /* FIXME use a qdev drive property instead of drive_get_next() */
-    dinfo = drive_get_next(IF_MTD);
-
-    if (dinfo) {
+    if (s->blk) {
         DB_PRINT_L(0, "Binding to IF_MTD drive\n");
-        s->blk = blk_by_legacy_dinfo(dinfo);
-        blk_attach_dev_nofail(s->blk, s);
-
         s->storage = blk_blockalign(s->blk, s->size);
 
         if (blk_pread(s->blk, 0, s->storage, s->size) != s->size) {
@@ -925,6 +918,7 @@ static void m25p80_pre_save(void *opaque)
 
 static Property m25p80_properties[] = {
     DEFINE_PROP_UINT32("nonvolatile-cfg", Flash, nonvolatile_cfg, 0x8FFF),
+    DEFINE_PROP_DRIVE("drive", Flash, blk),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 07527b677b37..4968bdbb2821 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -191,9 +191,16 @@ petalogix_ml605_init(MachineState *machine)
         spi = (SSIBus *)qdev_get_child_bus(dev, "spi");
 
         for (i = 0; i < NUM_SPI_FLASHES; i++) {
+            DriveInfo *dinfo = drive_get_next(IF_MTD);
             qemu_irq cs_line;
 
-            dev = ssi_create_slave(spi, "n25q128");
+            dev = ssi_create_slave_no_init(spi, "n25q128");
+            if (dinfo) {
+                qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo),
+                                    &error_fatal);
+            }
+            qdev_init_nofail(dev);
+
             cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
             sysbus_connect_irq(busdev, i+1, cs_line);
         }
-- 
2.1.4

