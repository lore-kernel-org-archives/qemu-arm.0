Received: by 10.25.208.211 with SMTP id h202csp1449001lfg;
        Tue, 16 Feb 2016 10:12:39 -0800 (PST)
X-Received: by 10.140.255.8 with SMTP id a8mr31058346qhd.20.1455646359823;
        Tue, 16 Feb 2016 10:12:39 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l77si22984847qki.80.2016.02.16.10.12.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 10:12:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVk74-0006Bw-SA
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 13:12:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4Y-00025S-FP
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 13:10:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4X-0005ts-GQ
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 13:10:02 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4X-0005sC-Ad; Tue, 16 Feb 2016 13:10:01 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4P-0003SF-6u; Tue, 16 Feb 2016 18:09:53 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 18:09:45 +0000
Message-Id: <1455646193-13238-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
References: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-devel] [PATCH v3 03/10] hw/sd/sd.c: Convert sd_reset()
	function into Device reset method
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
X-TUID: YkXx1KQ0I6We

Convert the sd_reset() function into a proper Device reset method.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/sd/sd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1681728..edd4c82 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -394,8 +394,9 @@ static inline uint64_t sd_addr_to_wpnum(uint64_t addr)
     return addr >> (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT);
 }
 
-static void sd_reset(SDState *sd)
+static void sd_reset(DeviceState *dev)
 {
+    SDState *sd = SD_CARD(dev);
     uint64_t size;
     uint64_t sect;
 
@@ -436,7 +437,7 @@ static void sd_cardchange(void *opaque, bool load)
 
     qemu_set_irq(sd->inserted_cb, blk_is_inserted(sd->blk));
     if (blk_is_inserted(sd->blk)) {
-        sd_reset(sd);
+        sd_reset(DEVICE(sd));
         qemu_set_irq(sd->readonly_cb, sd->wp_switch);
     }
 }
@@ -680,7 +681,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,
 
         default:
             sd->state = sd_idle_state;
-            sd_reset(sd);
+            sd_reset(DEVICE(sd));
             return sd->spi ? sd_r1 : sd_r0;
         }
         break;
@@ -1787,8 +1788,6 @@ static void sd_realize(DeviceState *dev, Error **errp)
     if (sd->blk) {
         blk_set_dev_ops(sd->blk, &sd_block_ops, sd);
     }
-
-    sd_reset(sd);
 }
 
 static Property sd_properties[] = {
@@ -1808,6 +1807,7 @@ static void sd_class_init(ObjectClass *klass, void *data)
     dc->realize = sd_realize;
     dc->props = sd_properties;
     dc->vmsd = &sd_vmstate;
+    dc->reset = sd_reset;
 }
 
 static const TypeInfo sd_info = {
-- 
1.9.1

