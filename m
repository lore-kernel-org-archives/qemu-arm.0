Received: by 10.25.159.19 with SMTP id i19csp271476lfe;
        Fri, 22 Jan 2016 08:21:12 -0800 (PST)
X-Received: by 10.141.6.130 with SMTP id i124mr4954717qhd.90.1453479670664;
        Fri, 22 Jan 2016 08:21:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d126si7781257qkb.84.2016.01.22.08.21.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 08:21:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMeSU-0003zP-6N
	for alex.bennee@linaro.org; Fri, 22 Jan 2016 11:21:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMePU-0006ZZ-Nz
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:18:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMePP-000516-3y
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:18:04 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeP9-0004xO-0g; Fri, 22 Jan 2016 11:17:43 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeOB-0003sV-35; Fri, 22 Jan 2016 16:16:43 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jan 2016 16:16:35 +0000
Message-Id: <1453479402-14870-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
References: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, patches@linaro.org,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v2 03/10] hw/sd/sd.c: Convert sd_reset() function
	into Device reset method
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
X-TUID: AngQuOUdES8r

Convert the sd_reset() function into a proper Device reset method.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/sd/sd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 745e9d6..b62f7f5 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -393,8 +393,9 @@ static inline uint64_t sd_addr_to_wpnum(uint64_t addr)
     return addr >> (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT);
 }
 
-static void sd_reset(SDState *sd)
+static void sd_reset(DeviceState *dev)
 {
+    SDState *sd = SD_CARD(dev);
     uint64_t size;
     uint64_t sect;
 
@@ -435,7 +436,7 @@ static void sd_cardchange(void *opaque, bool load)
 
     qemu_set_irq(sd->inserted_cb, blk_is_inserted(sd->blk));
     if (blk_is_inserted(sd->blk)) {
-        sd_reset(sd);
+        sd_reset(DEVICE(sd));
         qemu_set_irq(sd->readonly_cb, sd->wp_switch);
     }
 }
@@ -677,7 +678,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,
 
         default:
             sd->state = sd_idle_state;
-            sd_reset(sd);
+            sd_reset(DEVICE(sd));
             return sd->spi ? sd_r1 : sd_r0;
         }
         break;
@@ -1783,8 +1784,6 @@ static void sd_realize(DeviceState *dev, Error **errp)
     if (sd->blk) {
         blk_set_dev_ops(sd->blk, &sd_block_ops, sd);
     }
-
-    sd_reset(sd);
 }
 
 static Property sd_properties[] = {
@@ -1804,6 +1803,7 @@ static void sd_class_init(ObjectClass *klass, void *data)
     dc->realize = sd_realize;
     dc->props = sd_properties;
     dc->vmsd = &sd_vmstate;
+    dc->reset = sd_reset;
 }
 
 static const TypeInfo sd_info = {
-- 
1.9.1

