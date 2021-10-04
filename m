Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l2sm15890463wmi.1.2021.10.04.06.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 06:47:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8AFBE1FF9D;
	Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: [PATCH  v1 6/7] hw/arm/bcm2838: Map the PCIe memory space
Date: Mon,  4 Oct 2021 14:47:40 +0100
Message-Id: <20211004134742.2044280-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004134742.2044280-1-alex.bennee@linaro.org>
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rF4mQD0OPcR+

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The BCM2711 has a BCM54213 Gigabit Ethernet block mapped in the PCIe
range.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
FIXME: create the bcm54213-geth in raspi.c?
vAJB:
  - fix for move of gic_base to bc
---
 hw/arm/bcm2836.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 99dc15e6e4..ff62e741ce 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -15,6 +15,7 @@
 #include "hw/arm/bcm2836.h"
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
+#include "hw/misc/unimp.h"
 
 typedef struct BCM283XClass {
     /*< private >*/
@@ -46,6 +47,8 @@ static Property bcm2836_enabled_cores_property =
 #define GIC_VIFACE_OTHER_OFS(cpu)  (0x5000 + (cpu) * 0x200)
 #define GIC_VCPU_OFS                0x6000
 
+#define PCIE_BASE                   0x7d500000
+
 static void bcm2836_init(Object *obj)
 {
     BCM283XState *s = BCM283X(obj);
@@ -227,6 +230,13 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_SEC,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", n));
     }
+
+    /* bcm2838 kludge to easily create PCIe */
+    if (bc->gic_base) {
+        create_unimplemented_device("bcm2838-pcie", PCIE_BASE, 0x100000);
+        create_unimplemented_device("bcm54213-geth",
+                                    PCIE_BASE + 0x80000, 0x10000);
+    }
 }
 
 static void bcm283x_class_init(ObjectClass *oc, void *data)
-- 
2.30.2
