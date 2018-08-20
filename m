Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp737969wrd;
        Mon, 20 Aug 2018 07:15:43 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdb+v8OHQm5vbmOvuO7DZwIEKUFOOtUSOtAUF0kK1dGvcZWV6zZHlDLmbmPb2fsWSEy0uNh+
X-Received: by 2002:ac8:fe7:: with SMTP id f36-v6mr1853093qtk.63.1534774543520;
        Mon, 20 Aug 2018 07:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774543; cv=none;
        d=google.com; s=arc-20160816;
        b=YanMOlp/6/SD07DTKEzViJRTyTih40fjzhVJhGXkVeom9f4EVuFj6NlKhwmRb1NEkh
         3DibbLUV8Ocl4n3Ns8Wq0VYV+t7B2V5XU/8JYvGbO00+znZmQNMgv/GYs+FurFjZqgNb
         29pBOJXM/ePq1IixKrr3jlxNmRagnb0VAAqlJXFq4EZPoYY/7y7oW9knpXirKOVLr5Z8
         P9pPg8/ALkmyCo6eFK4LhhiV1Kr9LAWQXkMo8GBjKCe9ZRJSQRUHmihblBn23YD6u/Ni
         8NfSPtJpU9+rpFouiT0t69S6LhFGr11XikfoHjkMfdLPZ81gfpXGbj708Iu8pdGESpda
         gqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3LttRrzSSXIGKmEC3CYoTFvzxVgfeHu0tlcLo1KOgHE=;
        b=qerq0QldNpQ7DXMv04PoA3yFk+GSAVZYOdEUGL3PSVeyOUJP02lRY1tc72nsDaQqMY
         gb0orQPh5uBYoxnGbKXkzTwAwx3C1bQMTMFlO2+mqLIuWWF1DlNt2SprZANbwWV0HxzH
         XpNe52/1CD3ZYrcPfJTPsvSPHIAKcDsQeEP1n1g5zvsuvDOK1U+m+3+XkqBLJWkAz/W/
         ofhjLD0BiF+nWrsSwRi1NR9VLP6M7IHs1cTWMhrc+NxgCRsigFRw8GGVOH+uWw68mjf1
         Wozdh89pWPegKc9VoWUCmtyRzq9Bc3Tcny0Doh87/fvQpkwc0ULvjruKqzRkPFm4Hbza
         rvEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e13-v6si2289034qto.311.2018.08.20.07.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:15:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frky7-0007C3-0z
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:15:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frku6-0003VT-BH
	for qemu-devel@nongnu.org; Mon, 20 Aug 2018 10:11:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frku5-0007HE-4V
	for qemu-devel@nongnu.org; Mon, 20 Aug 2018 10:11:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44630)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frku1-0007Du-Lw; Mon, 20 Aug 2018 10:11:29 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frku0-0003PN-Kx; Mon, 20 Aug 2018 15:11:28 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:03 +0100
Message-Id: <20180820141116.9118-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 09/22] hw/misc/iotkit-sysinfo: Implement IoTKit
 system information block
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y+nxKHShow6J

Implement the IoTKit system control element's system information
block; this is just a pair of read-only version/config registers,
plus the usual PID/CID ID registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/Makefile.objs            |   1 +
 include/hw/misc/iotkit-sysinfo.h |  37 +++++++++
 hw/misc/iotkit-sysinfo.c         | 128 +++++++++++++++++++++++++++++++
 MAINTAINERS                      |   2 +
 default-configs/arm-softmmu.mak  |   1 +
 5 files changed, 169 insertions(+)
 create mode 100644 include/hw/misc/iotkit-sysinfo.h
 create mode 100644 hw/misc/iotkit-sysinfo.c

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index ac1f3bc030c..af2b503824e 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -67,6 +67,7 @@ obj-$(CONFIG_TZ_MPC) += tz-mpc.o
 obj-$(CONFIG_TZ_PPC) += tz-ppc.o
 obj-$(CONFIG_IOTKIT_SECCTL) += iotkit-secctl.o
 obj-$(CONFIG_IOTKIT_SYSCTL) += iotkit-sysctl.o
+obj-$(CONFIG_IOTKIT_SYSINFO) += iotkit-sysinfo.o
 
 obj-$(CONFIG_PVPANIC) += pvpanic.o
 obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
new file mode 100644
index 00000000000..7b2e1a5e48b
--- /dev/null
+++ b/include/hw/misc/iotkit-sysinfo.h
@@ -0,0 +1,37 @@
+/*
+ * ARM IoTKit system information block
+ *
+ * Copyright (c) 2018 Linaro Limited
+ * Written by Peter Maydell
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+/*
+ * This is a model of the "system information block" which is part of the
+ * Arm IoTKit and documented in
+ * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * QEMU interface:
+ *  + sysbus MMIO region 0: the system information register bank
+ */
+
+#ifndef HW_MISC_IOTKIT_SYSINFO_H
+#define HW_MISC_IOTKIT_SYSINFO_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_IOTKIT_SYSINFO "iotkit-sysinfo"
+#define IOTKIT_SYSINFO(obj) OBJECT_CHECK(IoTKitSysInfo, (obj), \
+                                        TYPE_IOTKIT_SYSINFO)
+
+typedef struct IoTKitSysInfo {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+} IoTKitSysInfo;
+
+#endif
diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
new file mode 100644
index 00000000000..78955bc45f5
--- /dev/null
+++ b/hw/misc/iotkit-sysinfo.c
@@ -0,0 +1,128 @@
+/*
+ * ARM IoTKit system information block
+ *
+ * Copyright (c) 2018 Linaro Limited
+ * Written by Peter Maydell
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+/*
+ * This is a model of the "system information block" which is part of the
+ * Arm IoTKit and documented in
+ * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * It consists of 2 read-only version/config registers, plus the
+ * usual ID registers.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "trace.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
+#include "hw/sysbus.h"
+#include "hw/registerfields.h"
+#include "hw/misc/iotkit-sysinfo.h"
+
+REG32(SYS_VERSION, 0x0)
+REG32(SYS_CONFIG, 0x4)
+REG32(PID4, 0xfd0)
+REG32(PID5, 0xfd4)
+REG32(PID6, 0xfd8)
+REG32(PID7, 0xfdc)
+REG32(PID0, 0xfe0)
+REG32(PID1, 0xfe4)
+REG32(PID2, 0xfe8)
+REG32(PID3, 0xfec)
+REG32(CID0, 0xff0)
+REG32(CID1, 0xff4)
+REG32(CID2, 0xff8)
+REG32(CID3, 0xffc)
+
+/* PID/CID values */
+static const int sysinfo_id[] = {
+    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
+    0x58, 0xb8, 0x0b, 0x00, /* PID0..PID3 */
+    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
+};
+
+static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
+                                    unsigned size)
+{
+    uint64_t r;
+
+    switch (offset) {
+    case A_SYS_VERSION:
+        r = 0x41743;
+        break;
+
+    case A_SYS_CONFIG:
+        r = 0x31;
+        break;
+    case A_PID4 ... A_CID3:
+        r = sysinfo_id[(offset - A_PID4) / 4];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "IoTKit SysInfo read: bad offset %x\n", (int)offset);
+        r = 0;
+        break;
+    }
+    trace_iotkit_sysinfo_read(offset, r, size);
+    return r;
+}
+
+static void iotkit_sysinfo_write(void *opaque, hwaddr offset,
+                                 uint64_t value, unsigned size)
+{
+    trace_iotkit_sysinfo_write(offset, value, size);
+
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "IoTKit SysInfo: write to RO offset 0x%x\n", (int)offset);
+}
+
+static const MemoryRegionOps iotkit_sysinfo_ops = {
+    .read = iotkit_sysinfo_read,
+    .write = iotkit_sysinfo_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    /* byte/halfword accesses are just zero-padded on reads and writes */
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
+};
+
+static void iotkit_sysinfo_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    IoTKitSysInfo *s = IOTKIT_SYSINFO(obj);
+
+    memory_region_init_io(&s->iomem, obj, &iotkit_sysinfo_ops,
+                          s, "iotkit-sysinfo", 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void iotkit_sysinfo_class_init(ObjectClass *klass, void *data)
+{
+    /*
+     * This device has no guest-modifiable state and so it
+     * does not need a reset function or VMState.
+     */
+}
+
+static const TypeInfo iotkit_sysinfo_info = {
+    .name = TYPE_IOTKIT_SYSINFO,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IoTKitSysInfo),
+    .instance_init = iotkit_sysinfo_init,
+    .class_init = iotkit_sysinfo_class_init,
+};
+
+static void iotkit_sysinfo_register_types(void)
+{
+    type_register_static(&iotkit_sysinfo_info);
+}
+
+type_init(iotkit_sysinfo_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index ea35aa2cca5..cb780f463cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -541,6 +541,8 @@ F: hw/arm/iotkit.c
 F: include/hw/arm/iotkit.h
 F: hw/misc/iotkit-sysctl.c
 F: include/hw/misc/iotkit-sysctl.h
+F: hw/misc/iotkit-sysinfo.c
+F: include/hw/misc/iotkit-sysinfo.h
 
 Musicpal
 M: Jan Kiszka <jan.kiszka@web.de>
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 79aac7702a9..ebbdcb29f38 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -115,6 +115,7 @@ CONFIG_TZ_PPC=y
 CONFIG_IOTKIT=y
 CONFIG_IOTKIT_SECCTL=y
 CONFIG_IOTKIT_SYSCTL=y
+CONFIG_IOTKIT_SYSINFO=y
 
 CONFIG_VERSATILE=y
 CONFIG_VERSATILE_PCI=y
-- 
2.18.0

