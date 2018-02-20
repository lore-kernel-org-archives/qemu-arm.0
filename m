Received: by 10.28.71.27 with SMTP id u27csp1381699wma;
        Tue, 20 Feb 2018 10:11:46 -0800 (PST)
X-Google-Smtp-Source: AH8x225rD+MU5D/nNlf5jAekV8UVGFbsYkB+CJhj/x18C9woVx/60PN6paxm918rCnC2G6wJhzlJ
X-Received: by 10.13.244.1 with SMTP id d1mr447175ywf.317.1519150306903;
        Tue, 20 Feb 2018 10:11:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519150306; cv=none;
        d=google.com; s=arc-20160816;
        b=j5oK+gr3sIP3+K1vED1Hr7e+hjbgOX38Ageymb1B9XYxFKN9e47Hf7uAhz6BFT1hhW
         pduA4bEqbQ9ZAg3WLPRO9fkxej1ofmfvoYprX8cKpvfNT6T9d1uAm/9ololdINGgMYX9
         fsEWS9sRJ/sjNKkZNPi70sGoWxtuUHcQqH5Kbxs9r+z2vFN/mw4Vkv7Ii4AiA5mmsJfW
         6N3FDKHveSKOHfWjIo6FsQkbD9Yyxl9eNJ4V/EXwUNz7QsGCiSBT/cknV8B+eXGVAAzN
         P4D3o8pu7lSDhYIiY2B1/xxIQwktG9b/aXw7Ss3S8k+JqzJcrcub6X657vq0/cs/SZgQ
         pPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ULO2vekmERFjep3BEXFcz5GPnunMUXER2Q3KLM/vLno=;
        b=BNCcGbHz6I//d31fNAR+J+Jh/hYZV9PUUYLL0hOEhY3M23d7aOW2/VYAIF1SZa1FL/
         gkF3+RdThtz07RbDRX+vbcowLbOOMuSH1NSfczeN4JR79f97BVyvWCWnlysL7IDqwLKA
         E03I0VnZTXSLwuYdIY/bgvrJSk0f/o9xKs7X2KkqMuGG6jfw1JHYiRLUTEG/MzWKxjy5
         WK2evPnIllIEWTqdcVNi0MoVn9W5fdCiP2DnE5YIDdhIhcollinIJG8Lq0RWcL6PI81G
         r4+FHnRVCcvF5oruj0+Vk9MYpTRKAQaCsTrPBGNbnGR5+J9o56B0igpg/xHOI+KSVjDf
         6xYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u7si820526ybc.570.2018.02.20.10.11.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:11:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCOI-0007jt-AW
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:11:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGY-0008By-4A
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGV-0001gR-L5
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:46 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46524)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGV-0001WQ-7y; Tue, 20 Feb 2018 13:03:43 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGH-0008Qx-AI; Tue, 20 Feb 2018 18:03:29 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:10 +0000
Message-Id: <20180220180325.29818-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 04/19] target/arm: Define an IDAU interface
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xUBmvtN4iwdO

In v8M, the Implementation Defined Attribution Unit (IDAU) is
a small piece of hardware typically implemented in the SoC
which provides board or SoC specific security attribution
information for each address that the CPU performs MPU/SAU
checks on. For QEMU, we model this with a QOM interface which
is implemented by the board or SoC object and connected to
the CPU using a link property.

This commit defines the new interface class, adds the link
property to the CPU object, and makes the SAU checking
code call the IDAU interface if one is present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
An example of an object that implements the IDAU can be
found in the later patch "hw/arm/iotkit: Model Arm IOT Kit".
---
 target/arm/cpu.h    |  3 +++
 target/arm/idau.h   | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.c    | 15 +++++++++++++
 target/arm/helper.c | 28 +++++++++++++++++++++---
 4 files changed, 104 insertions(+), 3 deletions(-)
 create mode 100644 target/arm/idau.h

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index de62df091c..dc45b740c5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -685,6 +685,9 @@ struct ARMCPU {
     /* MemoryRegion to use for secure physical accesses */
     MemoryRegion *secure_memory;
 
+    /* For v8M, pointer to the IDAU interface provided by board/SoC */
+    Object *idau;
+
     /* 'compatible' string for this CPU for Linux device trees */
     const char *dtb_compatible;
 
diff --git a/target/arm/idau.h b/target/arm/idau.h
new file mode 100644
index 0000000000..cac27b95fa
--- /dev/null
+++ b/target/arm/idau.h
@@ -0,0 +1,61 @@
+/*
+ * QEMU ARM CPU -- interface for the Arm v8M IDAU
+ *
+ * Copyright (c) 2018 Linaro Ltd
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ *
+ * In the v8M architecture, the IDAU is a small piece of hardware
+ * typically implemented in the SoC which provides board or SoC
+ * specific security attribution information for each address that
+ * the CPU performs MPU/SAU checks on. For QEMU, we model this with a
+ * QOM interface which is implemented by the board or SoC object and
+ * connected to the CPU using a link property.
+ */
+
+#ifndef TARGET_ARM_IDAU_H
+#define TARGET_ARM_IDAU_H
+
+#include "qom/object.h"
+
+#define TYPE_IDAU_INTERFACE "idau-interface"
+#define IDAU_INTERFACE(obj) \
+    INTERFACE_CHECK(IDAUInterface, (obj), TYPE_IDAU_INTERFACE)
+#define IDAU_INTERFACE_CLASS(class) \
+    OBJECT_CLASS_CHECK(IDAUInterfaceClass, (class), TYPE_IDAU_INTERFACE)
+#define IDAU_INTERFACE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(IDAUInterfaceClass, (obj), TYPE_IDAU_INTERFACE)
+
+typedef struct IDAUInterface {
+    Object parent;
+} IDAUInterface;
+
+#define IREGION_NOTVALID -1
+
+typedef struct IDAUInterfaceClass {
+    InterfaceClass parent;
+
+    /* Check the specified address and return the IDAU security information
+     * for it by filling in iregion, exempt, ns and nsc:
+     *  iregion: IDAU region number, or IREGION_NOTVALID if not valid
+     *  exempt: true if address is exempt from security attribution
+     *  ns: true if the address is NonSecure
+     *  nsc: true if the address is NonSecure-callable
+     */
+    void (*check)(IDAUInterface *ii, uint32_t address, int *iregion,
+                  bool *exempt, bool *ns, bool *nsc);
+} IDAUInterfaceClass;
+
+#endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d796085be9..99d00c3ac9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "target/arm/idau.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "cpu.h"
@@ -687,6 +688,13 @@ static void arm_cpu_post_init(Object *obj)
         }
     }
 
+    if (arm_feature(&cpu->env, ARM_FEATURE_M_SECURITY)) {
+        object_property_add_link(obj, "idau", TYPE_IDAU_INTERFACE, &cpu->idau,
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_UNREF_ON_RELEASE,
+                                 &error_abort);
+    }
+
     qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property,
                              &error_abort);
 }
@@ -1820,11 +1828,18 @@ static const TypeInfo arm_cpu_type_info = {
     .class_init = arm_cpu_class_init,
 };
 
+static const TypeInfo idau_interface_type_info = {
+    .name = TYPE_IDAU_INTERFACE,
+    .parent = TYPE_INTERFACE,
+    .class_size = sizeof(IDAUInterfaceClass),
+};
+
 static void arm_cpu_register_types(void)
 {
     const ARMCPUInfo *info = arm_cpus;
 
     type_register_static(&arm_cpu_type_info);
+    type_register_static(&idau_interface_type_info);
 
     while (info->name) {
         cpu_register(info);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e7586fcf6c..3acbcb2a1a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+#include "target/arm/idau.h"
 #include "trace.h"
 #include "cpu.h"
 #include "internals.h"
@@ -9740,19 +9741,32 @@ static void v8m_security_lookup(CPUARMState *env, uint32_t address,
      */
     ARMCPU *cpu = arm_env_get_cpu(env);
     int r;
+    bool idau_exempt = false, idau_ns = true, idau_nsc = true;
+    int idau_region = IREGION_NOTVALID;
 
-    /* TODO: implement IDAU */
+    if (cpu->idau) {
+        IDAUInterfaceClass *iic = IDAU_INTERFACE_GET_CLASS(cpu->idau);
+        IDAUInterface *ii = IDAU_INTERFACE(cpu->idau);
+
+        iic->check(ii, address, &idau_region, &idau_exempt, &idau_ns,
+                   &idau_nsc);
+    }
 
     if (access_type == MMU_INST_FETCH && extract32(address, 28, 4) == 0xf) {
         /* 0xf0000000..0xffffffff is always S for insn fetches */
         return;
     }
 
-    if (v8m_is_sau_exempt(env, address, access_type)) {
+    if (idau_exempt || v8m_is_sau_exempt(env, address, access_type)) {
         sattrs->ns = !regime_is_secure(env, mmu_idx);
         return;
     }
 
+    if (idau_region != IREGION_NOTVALID) {
+        sattrs->irvalid = true;
+        sattrs->iregion = idau_region;
+    }
+
     switch (env->sau.ctrl & 3) {
     case 0: /* SAU.ENABLE == 0, SAU.ALLNS == 0 */
         break;
@@ -9789,7 +9803,15 @@ static void v8m_security_lookup(CPUARMState *env, uint32_t address,
             }
         }
 
-        /* TODO when we support the IDAU then it may override the result here */
+        /* The IDAU will override the SAU lookup results if it specifies
+         * higher security than the SAU does.
+         */
+        if (!idau_ns) {
+            if (sattrs->ns || (!idau_nsc && sattrs->nsc)) {
+                sattrs->ns = false;
+                sattrs->nsc = idau_nsc;
+            }
+        }
         break;
     }
 }
-- 
2.16.1

