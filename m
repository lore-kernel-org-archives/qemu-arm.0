Received: by 10.25.159.19 with SMTP id i19csp823354lfe;
        Sun, 7 Feb 2016 03:35:39 -0800 (PST)
X-Received: by 10.140.233.85 with SMTP id e82mr28049814qhc.86.1454844939035;
        Sun, 07 Feb 2016 03:35:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v192si26001882qka.4.2016.02.07.03.35.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 Feb 2016 03:35:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSNcw-0002Xk-Fm
	for alex.bennee@linaro.org; Sun, 07 Feb 2016 06:35:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1aSHbN-0004lg-IE
	for qemu-arm@nongnu.org; Sun, 07 Feb 2016 00:09:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1aSHbG-0008Eu-Ly
	for qemu-arm@nongnu.org; Sun, 07 Feb 2016 00:09:33 -0500
Received: from avon.wwwdotorg.org ([70.85.31.133]:47703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1aSHbG-0008Eq-ER
	for qemu-arm@nongnu.org; Sun, 07 Feb 2016 00:09:30 -0500
Received: from severn.wwwdotorg.org (unknown [192.168.65.5])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by avon.wwwdotorg.org (Postfix) with ESMTPS id 51C561E37C;
	Sat,  6 Feb 2016 22:09:11 -0700 (MST)
Received: from dart.wwwdotorg.org (localhost [127.0.0.1])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by severn.wwwdotorg.org (Postfix) with ESMTPSA id DB099E461D;
	Sat,  6 Feb 2016 22:10:23 -0700 (MST)
From: Stephen Warren <swarren@wwwdotorg.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  6 Feb 2016 22:09:17 -0700
Message-Id: <1454821757-27964-1-git-send-email-swarren@wwwdotorg.org>
X-Mailer: git-send-email 1.9.1
X-NVConfidentiality: public
X-Virus-Scanned: clamav-milter 0.98.6 at avon.wwwdotorg.org
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 70.85.31.133
X-Mailman-Approved-At: Sun, 07 Feb 2016 06:35:36 -0500
Cc: qemu-arm@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Stephen Warren <swarren@wwwdotorg.org>
Subject: [Qemu-arm] [PATCH] bcm2835_property: implement "get board revision"
	query
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gxwtG/+TreH4

Return a valid value from the BCM2835 property mailbox query "get board
revision". This query is used by U-Boot. Implementing it fixes the first
obvious difference between qemu and real HW.

The value returned is currently hard-coded to match the RPi2 I own. Other
values are legal, e.g. different board manufacturer field values are
likely to exist in the wild. When support for other RPi models is added,
the value can be made dynamic.

Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
---
This looks like the only non-video-related mailbox request used by U-Boot
that wasn't implemented by qemu.

The only other feature required for U-Boot to get to its command prompt
is the BCM2835 timer.

Andrew, I assume you're actively working on mainlining all the features
in your github branch? I look forward to U-Boot working on qemu:-)
---
 hw/arm/bcm2835_peripherals.c       | 9 +++++++++
 hw/misc/bcm2835_property.c         | 4 ++--
 include/hw/misc/bcm2835_property.h | 1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 18b72ecb696c..5fed6c90b048 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -148,6 +148,15 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* When multiple Pi revisions are supported, this hard-coded number should
+     * be selected by the various raspi*_machine_init().
+     */
+    object_property_set_int(OBJECT(&s->property), 0xa21041, "board-rev", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     object_property_set_bool(OBJECT(&s->property), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index e42b43e72d56..45bd6c18ce90 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -43,8 +43,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 4;
             break;
         case 0x00010002: /* Get board revision */
-            qemu_log_mask(LOG_UNIMP,
-                          "bcm2835_property: %x get board revision NYI\n", tag);
+            stl_phys(&s->dma_as, value + 12, s->board_rev);
             resplen = 4;
             break;
         case 0x00010003: /* Get board MAC address */
@@ -258,6 +257,7 @@ static void bcm2835_property_realize(DeviceState *dev, Error **errp)
 }
 
 static Property bcm2835_property_props[] = {
+    DEFINE_PROP_UINT32("board-rev", BCM2835PropertyState, board_rev, 0),
     DEFINE_PROP_UINT32("ram-size", BCM2835PropertyState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
index fcf5f3decafc..df889eaa08b5 100644
--- a/include/hw/misc/bcm2835_property.h
+++ b/include/hw/misc/bcm2835_property.h
@@ -23,6 +23,7 @@ typedef struct {
     MemoryRegion iomem;
     qemu_irq mbox_irq;
     MACAddr macaddr;
+    uint32_t board_rev;
     uint32_t ram_size;
     uint32_t addr;
     bool pending;
-- 
1.9.1

