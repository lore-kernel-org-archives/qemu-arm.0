Received: by 10.25.30.65 with SMTP id e62csp534116lfe;
        Thu, 26 May 2016 07:57:06 -0700 (PDT)
X-Received: by 10.200.51.60 with SMTP id t57mr9517857qta.26.1464274626376;
        Thu, 26 May 2016 07:57:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y12si13316667qtb.24.2016.05.26.07.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 07:57:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5wif-00009c-Qd
	for alex.bennee@linaro.org; Thu, 26 May 2016 10:57:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5whS-0007Od-EW
	for qemu-arm@nongnu.org; Thu, 26 May 2016 10:55:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5whR-00056k-Km
	for qemu-arm@nongnu.org; Thu, 26 May 2016 10:55:50 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whR-00056d-D4; Thu, 26 May 2016 10:55:49 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whQ-00048W-O4; Thu, 26 May 2016 15:55:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:31 +0100
Message-Id: <1464274540-19693-14-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 13/22] hw/intc/arm_gicv3: Wire up distributor
 and redistributor MMIO regions
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1yGfzrMe82Dj

Wire up the MMIO functions exposed by the distributor and the
redistributor into MMIO regions exposed by the GICv3 device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 7c4bee6..e8f6766 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -324,6 +324,19 @@ static void arm_gicv3_post_load(GICv3State *s)
     gicv3_cache_all_target_cpustates(s);
 }
 
+static const MemoryRegionOps gic_ops[] = {
+    {
+        .read_with_attrs = gicv3_dist_read,
+        .write_with_attrs = gicv3_dist_write,
+        .endianness = DEVICE_NATIVE_ENDIAN,
+    },
+    {
+        .read_with_attrs = gicv3_redist_read,
+        .write_with_attrs = gicv3_redist_write,
+        .endianness = DEVICE_NATIVE_ENDIAN,
+    }
+};
+
 static void arm_gic_realize(DeviceState *dev, Error **errp)
 {
     /* Device instance realize function for the GIC sysbus device */
@@ -337,7 +350,7 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, NULL);
+    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
 }
 
 static void arm_gicv3_class_init(ObjectClass *klass, void *data)
-- 
1.9.1

