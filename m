Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1932639wrd;
        Tue, 21 Aug 2018 06:44:32 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzR88wozhrdKAu5Z3DsPOkUIP/R+pTmo6H4zHSWODVfkLQsEpRqbt5VurHGt1bPcnlNiZ3b
X-Received: by 2002:a0c:ab11:: with SMTP id h17-v6mr44461308qvb.114.1534859072556;
        Tue, 21 Aug 2018 06:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534859072; cv=none;
        d=google.com; s=arc-20160816;
        b=HTyi1qfjDooliCSsoGg+nA3BK3BFlprhSBs+VJOGj0n76k9eAjDKc1QWwNVOMRcxrQ
         J1kCbVFAmnwxyfZX5uq4j4PLeVrEFkFwFjhsATwDjTvkdK5bTOEIsKb9SLIP1duDEOKI
         XH9LjNPsRPSPNxw2UL6PBsUN10DXKDb69zkOPwKcYtjnDSID5T7jHY2ZYlfe2By0D5Iu
         ZsWB2PWFh/r1Xc5VaiHpWGGZPD1W0PujTiGzikcYH266xT9NBNj6K9ay7mWZ3r42xJSg
         TOR8bkciXfrRbCpJnS/q/w4ED+pfYsQ5AR+M1+xWjpvSMHZ1jrq1suYaTgmeAC0NYz67
         AiVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ET+Hnx8xI6DI16Pd2oO43YEShohrtVKAwAHzPHG939g=;
        b=kT/cX6dmlw6sYdO5+280gz4g+q7D5tG0Y8jv/hvbgrxAqg4qfnkEs0offC7GSbHaHn
         +SYUgjtS+rBeByBa75aZBt4jiYsKipqfqOnFSrHHBeOzJWFar9vwCcKDUE7woL5EuCU3
         EplAX9HeUlQ5F5HfsRbC0JkV4/dN4qps+Oh5Zc0/ynZxOa+jjSlVIIL/Jdp8p/8lVLlO
         L0PEvgg4K/upzar96p+I6K0kkOGDC8425K8Vp8hrS7T4SXKOQtGmVrKZE42u2Ekxnwql
         wQoBgqBGRamWz4CidnuURaXljUz4R2/JZBzpD8RHd3jCzxicjB7kzXXL/jFLdv2RyDDd
         uMUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21-v6si9667361qts.164.2018.08.21.06.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 06:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs6xU-0004Uk-2I
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 09:44:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6i0-0005wE-NM
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 09:28:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6hz-0003jx-Hr
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 09:28:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs6hw-0003S5-3W; Tue, 21 Aug 2018 09:28:28 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs6hp-0004C3-46; Tue, 21 Aug 2018 14:28:21 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 14:28:09 +0100
Message-Id: <20180821132811.17675-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821132811.17675-1-peter.maydell@linaro.org>
References: <20180821132811.17675-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 7/9] hw/cpu/a15mpcore: If CPU has EL2,
 enable it on the GIC and wire it up
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
Cc: Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: INnmEW/JFF4b

For the A15MPCore internal peripheral object, we handle GIC
security extensions support by checking whether the CPUs
have EL3 enabled; if so then we enable it also on the GIC.
Handle the virtualization extensions in the same way: if the
CPU has EL2 then enable it on the GIC and wire up the
virtualization-specific memory regions and the maintenance
interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/cpu/a15mpcore.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 43c10794938..226ce8900f2 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -53,6 +53,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     int i;
     Error *err = NULL;
     bool has_el3;
+    bool has_el2;
     Object *cpuobj;
 
     gicdev = DEVICE(&s->gic);
@@ -67,6 +68,10 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
         has_el3 = object_property_find(cpuobj, "has_el3", NULL) &&
             object_property_get_bool(cpuobj, "has_el3", &error_abort);
         qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
+        /* Similarly for virtualization support */
+        has_el2 = object_property_find(cpuobj, "has_el2", NULL) &&
+            object_property_get_bool(cpuobj, "has_el2", &error_abort);
+        qdev_prop_set_bit(gicdev, "has-virtualization-extensions", has_el2);
     }
 
     object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
@@ -103,20 +108,40 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
                                   qdev_get_gpio_in(gicdev,
                                                    ppibase + timer_irq[irq]));
         }
+        if (has_el2) {
+            /* Connect the GIC maintenance interrupt to PPI ID 25 */
+            sysbus_connect_irq(SYS_BUS_DEVICE(gicdev), i + 4 * s->num_cpu,
+                               qdev_get_gpio_in(gicdev, ppibase + 25));
+        }
     }
 
     /* Memory map (addresses are offsets from PERIPHBASE):
      *  0x0000-0x0fff -- reserved
      *  0x1000-0x1fff -- GIC Distributor
      *  0x2000-0x3fff -- GIC CPU interface
-     *  0x4000-0x4fff -- GIC virtual interface control (not modelled)
-     *  0x5000-0x5fff -- GIC virtual interface control (not modelled)
-     *  0x6000-0x7fff -- GIC virtual CPU interface (not modelled)
+     *  0x4000-0x4fff -- GIC virtual interface control for this CPU
+     *  0x5000-0x51ff -- GIC virtual interface control for CPU 0
+     *  0x5200-0x53ff -- GIC virtual interface control for CPU 1
+     *  0x5400-0x55ff -- GIC virtual interface control for CPU 2
+     *  0x5600-0x57ff -- GIC virtual interface control for CPU 3
+     *  0x6000-0x7fff -- GIC virtual CPU interface
      */
     memory_region_add_subregion(&s->container, 0x1000,
                                 sysbus_mmio_get_region(busdev, 0));
     memory_region_add_subregion(&s->container, 0x2000,
                                 sysbus_mmio_get_region(busdev, 1));
+    if (has_el2) {
+        memory_region_add_subregion(&s->container, 0x4000,
+                                    sysbus_mmio_get_region(busdev, 2));
+        memory_region_add_subregion(&s->container, 0x6000,
+                                    sysbus_mmio_get_region(busdev, 3));
+        for (i = 0; i < s->num_cpu; i++) {
+            hwaddr base = 0x5000 + i * 0x200;
+            MemoryRegion *mr = sysbus_mmio_get_region(busdev,
+                                                      4 + s->num_cpu + i);
+            memory_region_add_subregion(&s->container, base, mr);
+        }
+    }
 }
 
 static Property a15mp_priv_properties[] = {
-- 
2.18.0

