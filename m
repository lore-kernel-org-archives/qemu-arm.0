Received: by 10.182.158.201 with SMTP id ww9csp177740obb;
        Fri, 11 Dec 2015 08:50:41 -0800 (PST)
X-Received: by 10.140.238.137 with SMTP id j131mr16288067qhc.88.1449852641497;
        Fri, 11 Dec 2015 08:50:41 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si20816006qhx.98.2015.12.11.08.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Dec 2015 08:50:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7Qu1-0007wc-6l
	for alex.bennee@linaro.org; Fri, 11 Dec 2015 11:50:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7QrH-0003BO-SS
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 11:47:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7QrG-0000oJ-S0
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 11:47:51 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59114)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7QrG-0000oF-L6; Fri, 11 Dec 2015 11:47:50 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7Qgx-0001Il-CO; Fri, 11 Dec 2015 16:37:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 11 Dec 2015 16:37:04 +0000
Message-Id: <1449851831-4966-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Kevin O'Connor <kevin@koconnor.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	patches@linaro.org, Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [Qemu-devel] [PATCH 03/10] hw/sd/sd.c: Convert sd_reset() function
	into Device reset method
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
X-TUID: 3dtFzPW1gyuU

Convert the sd_reset() function into a proper Device reset method.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/sd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 7c79217..b4a5a62 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -393,8 +393,9 @@ static inline uint64_t sd_addr_to_wpnum(uint64_t addr)
     return addr >> (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT);
 }
 
-static void sd_reset(SDState *sd)
+static void sd_reset(DeviceState *dev)
 {
+    SDState *sd = SD(dev);
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
@@ -1783,8 +1784,6 @@ static void sd_realize(DeviceState *dev, Error ** errp)
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

