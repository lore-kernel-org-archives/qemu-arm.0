Received: by 10.25.208.211 with SMTP id h202csp3355442lfg;
        Fri, 26 Feb 2016 05:25:15 -0800 (PST)
X-Received: by 10.140.44.5 with SMTP id f5mr1838615qga.37.1456493113758;
        Fri, 26 Feb 2016 05:25:13 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e204si13109962qkb.127.2016.02.26.05.25.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 05:25:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZIOP-0005Ss-1r
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 08:25:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aZINU-0003yL-C7
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 08:24:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aZINT-0006xb-Ds
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 08:24:16 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:55982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aZINT-0006wk-6B; Fri, 26 Feb 2016 08:24:15 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aZINJ-0003Fm-PJ; Fri, 26 Feb 2016 13:24:05 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 26 Feb 2016 13:24:04 +0000
Message-Id: <1456493044-10025-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456493044-10025-1-git-send-email-peter.maydell@linaro.org>
References: <1456493044-10025-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, patches@linaro.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [Qemu-devel] [PATCH 2/2] sdhci: Implement DeviceClass reset
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 65fmHkgI/QcM

The sdhci device was missing a DeviceClass reset method;
implement it. Poweron reset looks the same as reset commanded
by the guest via the device registers, apart from modelling of
the rpi 'pending insert interrupt on powerup' quirk.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/sdhci.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index e087c17..d28b587 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -207,6 +207,21 @@ static void sdhci_reset(SDHCIState *s)
     s->pending_insert_state = false;
 }
 
+static void sdhci_poweron_reset(DeviceState *dev)
+{
+    /* QOM (ie power-on) reset. This is identical to reset
+     * commanded via device register apart from handling of the
+     * 'pending insert on powerup' quirk.
+     */
+    SDHCIState *s = (SDHCIState *)dev;
+
+    sdhci_reset(s);
+
+    if (s->pending_insert_quirk) {
+        s->pending_insert_state = true;
+    }
+}
+
 static void sdhci_data_transfer(void *opaque);
 
 static void sdhci_send_command(SDHCIState *s)
@@ -1290,6 +1305,7 @@ static void sdhci_pci_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->vmsd = &sdhci_vmstate;
     dc->props = sdhci_pci_properties;
+    dc->reset = sdhci_poweron_reset;
 }
 
 static const TypeInfo sdhci_pci_info = {
@@ -1332,10 +1348,6 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
     memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
             SDHC_REGISTERS_MAP_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
-
-    if (s->pending_insert_quirk) {
-        s->pending_insert_state = true;
-    }
 }
 
 static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
@@ -1345,6 +1357,7 @@ static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &sdhci_vmstate;
     dc->props = sdhci_sysbus_properties;
     dc->realize = sdhci_sysbus_realize;
+    dc->reset = sdhci_poweron_reset;
 }
 
 static const TypeInfo sdhci_sysbus_info = {
-- 
1.9.1

