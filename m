Received: by 10.25.150.194 with SMTP id y185csp1785641lfd;
        Mon, 21 Nov 2016 17:23:08 -0800 (PST)
X-Received: by 10.55.186.70 with SMTP id k67mr22134645qkf.265.1479777788277;
        Mon, 21 Nov 2016 17:23:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5si7062998qkd.55.2016.11.21.17.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Nov 2016 17:23:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c8znf-0005p7-MB
	for alex.bennee@linaro.org; Mon, 21 Nov 2016 20:23:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c8zeF-0005ub-M9
	for qemu-arm@nongnu.org; Mon, 21 Nov 2016 20:13:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c8zeD-00052I-Kk
	for qemu-arm@nongnu.org; Mon, 21 Nov 2016 20:13:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1c8zeD-00051s-BE; Mon, 21 Nov 2016 20:13:21 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1767180F8D;
	Tue, 22 Nov 2016 01:13:20 +0000 (UTC)
Received: from localhost (ovpn-116-207.phx2.redhat.com [10.3.116.207])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAM1DIUL009120; Mon, 21 Nov 2016 20:13:18 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Date: Mon, 21 Nov 2016 23:12:10 -0200
Message-Id: <1479777133-23567-13-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1479777133-23567-1-git-send-email-ehabkost@redhat.com>
References: <1479777133-23567-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 22 Nov 2016 01:13:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 12/15] arm: Initialize default bus lists
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>, Jan Kiszka <jan.kiszka@web.de>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vB69KvRn+fEr

Populate default_bus_types for some machines. Work in progress, I
didn't check if all machines were converted (so we could enable
strict mode for arm in qmp-machine-info.py).

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Jan Kiszka <jan.kiszka@web.de>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: qemu-arm@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/arm/aspeed.c         |  2 ++
 hw/arm/collie.c         |  1 +
 hw/arm/cubieboard.c     |  1 +
 hw/arm/exynos4_boards.c |  5 +++++
 hw/arm/gumstix.c        |  7 +++++++
 hw/arm/highbank.c       |  4 ++++
 hw/arm/imx25_pdk.c      |  1 +
 hw/arm/kzm.c            |  1 +
 hw/arm/musicpal.c       |  1 +
 hw/arm/nseries.c        |  2 ++
 hw/arm/palm.c           |  1 +
 hw/arm/realview.c       |  1 +
 hw/arm/spitz.c          | 10 ++++++++++
 hw/arm/stellaris.c      |  4 ++++
 14 files changed, 41 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c7206fd..042f2d0 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -180,6 +180,8 @@ static void ast2500_evb_class_init(ObjectClass *oc, void *data)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->no_parallel = 1;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
+    machine_class_add_default_bus(mc, "SSI");//FIXME: use macro
 }
 
 static const TypeInfo ast2500_evb_type = {
diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 2e69531..049be5d 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -64,6 +64,7 @@ static void collie_machine_init(MachineClass *mc)
 {
     mc->desc = "Sharp SL-5500 (Collie) PDA (SA-1110)";
     mc->init = collie_init;
+    machine_class_add_default_bus(mc, "SSI");//FIXME: use macro
 }
 
 DEFINE_MACHINE("collie", collie_machine_init)
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index dd19ba3..7f3841d 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -82,6 +82,7 @@ static void cubieboard_machine_init(MachineClass *mc)
 {
     mc->desc = "cubietech cubieboard";
     mc->init = cubieboard_init;
+    machine_class_add_default_bus(mc, TYPE_IDE_BUS);//FIXME: use macro
 }
 
 DEFINE_MACHINE("cubieboard", cubieboard_machine_init)
diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 0efa194..321895d 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -32,6 +32,7 @@
 #include "exec/address-spaces.h"
 #include "hw/arm/exynos4210.h"
 #include "hw/boards.h"
+#include "hw/usb.h"
 
 #undef DEBUG
 
@@ -154,6 +155,8 @@ static void nuri_class_init(ObjectClass *oc, void *data)
     mc->desc = "Samsung NURI board (Exynos4210)";
     mc->init = nuri_init;
     mc->max_cpus = EXYNOS4210_NCPUS;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
+    machine_class_add_default_bus(mc, TYPE_USB_BUS);
 }
 
 static const TypeInfo nuri_type = {
@@ -169,6 +172,8 @@ static void smdkc210_class_init(ObjectClass *oc, void *data)
     mc->desc = "Samsung SMDKC210 board (Exynos4210)";
     mc->init = smdkc210_init;
     mc->max_cpus = EXYNOS4210_NCPUS;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
+    machine_class_add_default_bus(mc, TYPE_USB_BUS);
 }
 
 static const TypeInfo smdkc210_type = {
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index d59d9ba..9e07d75 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -41,6 +41,7 @@
 #include "hw/block/flash.h"
 #include "hw/devices.h"
 #include "hw/boards.h"
+#include "hw/usb.h"
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
@@ -128,6 +129,9 @@ static void connex_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Gumstix Connex (PXA255)";
     mc->init = connex_init;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
+    machine_class_add_default_bus(mc, TYPE_USB_BUS);
+    machine_class_add_default_bus(mc, "SSI");//FIXME: use macro
 }
 
 static const TypeInfo connex_type = {
@@ -142,6 +146,9 @@ static void verdex_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Gumstix Verdex (PXA270)";
     mc->init = verdex_init;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
+    machine_class_add_default_bus(mc, TYPE_USB_BUS);
+    machine_class_add_default_bus(mc, "SSI");//FIXME: use macro
 }
 
 static const TypeInfo verdex_type = {
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 80e5fd4..30ce089 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -407,6 +407,8 @@ static void highbank_class_init(ObjectClass *oc, void *data)
     mc->init = highbank_init;
     mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
+    machine_class_add_default_bus(mc, "SSI");//FIXME: use macro
+    machine_class_add_default_bus(mc, "IDE");//FIXME: use macro
 }
 
 static const TypeInfo highbank_type = {
@@ -423,6 +425,8 @@ static void midway_class_init(ObjectClass *oc, void *data)
     mc->init = midway_init;
     mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
+    machine_class_add_default_bus(mc, "SSI");//FIXME: use macro
+    machine_class_add_default_bus(mc, "IDE");//FIXME: use macro
 }
 
 static const TypeInfo midway_type = {
diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index 025b608..e29f9d4 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -148,6 +148,7 @@ static void imx25_pdk_machine_init(MachineClass *mc)
 {
     mc->desc = "ARM i.MX25 PDK board (ARM926)";
     mc->init = imx25_pdk_init;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
 }
 
 DEFINE_MACHINE("imx25-pdk", imx25_pdk_machine_init)
diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 2c96ee3..004f303 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -142,6 +142,7 @@ static void kzm_machine_init(MachineClass *mc)
 {
     mc->desc = "ARM KZM Emulation Baseboard (ARM1136)";
     mc->init = kzm_init;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
 }
 
 DEFINE_MACHINE("kzm", kzm_machine_init)
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index cbbca4e..7ff117c 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1719,6 +1719,7 @@ static void musicpal_machine_init(MachineClass *mc)
 {
     mc->desc = "Marvell 88w8618 / MusicPal (ARM926EJ-S)";
     mc->init = musicpal_init;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
 }
 
 DEFINE_MACHINE("musicpal", musicpal_machine_init)
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index c86cf80..0df490f 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1425,6 +1425,7 @@ static void n800_class_init(ObjectClass *oc, void *data)
     mc->desc = "Nokia N800 tablet aka. RX-34 (OMAP2420)";
     mc->init = n800_init;
     mc->default_boot_order = "";
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
 }
 
 static const TypeInfo n800_type = {
@@ -1440,6 +1441,7 @@ static void n810_class_init(ObjectClass *oc, void *data)
     mc->desc = "Nokia N810 tablet aka. RX-44 (OMAP2420)";
     mc->init = n810_init;
     mc->default_boot_order = "";
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
 }
 
 static const TypeInfo n810_type = {
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 7f46073..b49c865 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -275,6 +275,7 @@ static void palmte_machine_init(MachineClass *mc)
 {
     mc->desc = "Palm Tungsten|E aka. Cheetah PDA (OMAP310)";
     mc->init = palmte_init;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
 }
 
 DEFINE_MACHINE("cheetah", palmte_machine_init)
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 8eafcca..a7d8747 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -445,6 +445,7 @@ static void realview_pbx_a9_class_init(ObjectClass *oc, void *data)
     mc->init = realview_pbx_a9_init;
     mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
 }
 
 static const TypeInfo realview_pbx_a9_type = {
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 949a15a..6888dff 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -30,6 +30,7 @@
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
+#include "hw/usb.h"
 
 #undef REG_FMT
 #define REG_FMT			"0x%02lx"
@@ -984,6 +985,9 @@ static void akitapda_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Sharp SL-C1000 (Akita) PDA (PXA270)";
     mc->init = akita_init;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
+    machine_class_add_default_bus(mc, TYPE_USB_BUS);
+    machine_class_add_default_bus(mc, "SSI");//FIXME: use macro
 }
 
 static const TypeInfo akitapda_type = {
@@ -998,6 +1002,9 @@ static void spitzpda_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Sharp SL-C3000 (Spitz) PDA (PXA270)";
     mc->init = spitz_init;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
+    machine_class_add_default_bus(mc, TYPE_USB_BUS);
+    machine_class_add_default_bus(mc, "SSI");//FIXME: use macro
 }
 
 static const TypeInfo spitzpda_type = {
@@ -1012,6 +1019,9 @@ static void borzoipda_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Sharp SL-C3100 (Borzoi) PDA (PXA270)";
     mc->init = borzoi_init;
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
+    machine_class_add_default_bus(mc, TYPE_USB_BUS);
+    machine_class_add_default_bus(mc, "SSI");//FIXME: use macro
 }
 
 static const TypeInfo borzoipda_type = {
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 794a3ad..49b153b 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1393,6 +1393,8 @@ static void lm3s811evb_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Stellaris LM3S811EVB";
     mc->init = lm3s811evb_init;
+    machine_class_add_default_bus(mc, "SSI");//FIXME: use macro
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
 }
 
 static const TypeInfo lm3s811evb_type = {
@@ -1407,6 +1409,8 @@ static void lm3s6965evb_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Stellaris LM3S6965EVB";
     mc->init = lm3s6965evb_init;
+    machine_class_add_default_bus(mc, "SSI");//FIXME: use macro
+    machine_class_add_default_bus(mc, "i2c-bus");//FIXME: use macro
 }
 
 static const TypeInfo lm3s6965evb_type = {
-- 
2.7.4

