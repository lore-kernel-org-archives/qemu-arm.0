Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6398722wrt;
        Mon, 21 Jan 2019 11:17:01 -0800 (PST)
X-Google-Smtp-Source: ALg8bN578263S0HhKN90whKQE1bWdpFyYXQVbfaWWldgTTFyfrcpC8gD+m7uFJPVGqo/YP9vOUu7
X-Received: by 2002:a1c:a913:: with SMTP id s19mr641448wme.4.1548098221878;
        Mon, 21 Jan 2019 11:17:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548098221; cv=none;
        d=google.com; s=arc-20160816;
        b=PKggQ7sYU0xTZ5Sd//UCaM5hjoctnuZtqrMp7Ttlu/DIvPS71euUm30tBPbi6gccpw
         Ji3k23CRfXuE/bSRelP5NcHcHa4rBOd9mxvSU8z8AG9xuEq8H4b+Lq74FQE0X9DnASMy
         e/XLYvEppAp3ppIZ9HoYVA6kEPfk26iMwLWMRj8y/Mc4xuPFgj8Ri0lgJ0huV/JW5TzZ
         QzJt2HetXJyafFX3hK/NI76tuBnCu5/f5paomafM68WefiCwnIJLal0621tWWR9sntk0
         8EO6mpDucZvjF/1XaVfvmAbSt1Ia8R5vhNKUUfZ5+SpVjXxCisXx6mXrwbO4m9UiH69Q
         BtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ptElJAOC24V6aCwdEwgL13NkItv2g2+5CEz3KW95t8w=;
        b=k/DWQqteWjhnT+qlY/GPp2ZR82EDRass3mtW3DwhHo4KE2a8oPE/tYfZmqfXQSDdt2
         9YWnKkpkdjAI7rYN7V1B2TYcuYBuGYMz/+mGUJQI3/0STojCZWzHrvLXAtwx/Rj17dAN
         tRcjJP9nX+NgBDmbKukIX9V5aAGZ4H+kpuc6e5ETwtE1fWTGDCf5mRF8bGKDykYLwy9U
         5fCIXkEVG7Z//n70Z+Mk4Br183ruTv9/K0vhvfsR+KKfrFMtveUsVNkGugao4HY6qXTP
         LRW4CJ36pCgEIzZBE1H30kY/TfUy8U2dSoLWdqdqM5l9NP7OdoCtJAhHHUdcU8karhEZ
         8/rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WFIkmDzw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b66si22246210wmc.136.2019.01.21.11.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:17:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WFIkmDzw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glf48-0007UJ-OZ
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:17:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevP-000888-IE
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 14:08:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefg-0002uy-5O
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:48 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33446)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gleff-0002sg-PN
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:44 -0500
Received: by mail-wm1-x343.google.com with SMTP id r24so6819221wmh.0
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ptElJAOC24V6aCwdEwgL13NkItv2g2+5CEz3KW95t8w=;
	b=WFIkmDzwGTUR/d4XtIBue0PmRyHGfjn/zBABzmHq8uB3lM2vPa/5lSypbCInheqrGu
	P5oC9v+vF1oTX7Xe9HVHLsCiz7vZT4pho36KQp9ihgLNbnbKD5fPcDrXhUSWIs/GDd3Y
	kVh8nXca6cKp//P4B+PCZBdQF6Sekflec1OOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ptElJAOC24V6aCwdEwgL13NkItv2g2+5CEz3KW95t8w=;
	b=sqZ5kHw7sAVlTC1jSKtdHOGmstRKKuv2pTnhKYdnGhG+7DJyQFJ4mlSKZwqCLSigaT
	S8SOlGoNq1PiOlXftHhdsjpzB37KfE7PF84LBmTGQfNPRybpFKTpXeydG6GoqDFDsO/7
	7GRZnKnBkdeEg69zUrttP+BI66H2Oime0wKCXwxcKtVVm5UWf+UeIhxrOJswPJb3hBKg
	/Vkdhvjhq7Dnk6Jb0fCbidWWdkCSiDfvfnbKSlnyNqRmuYZn1ZDNNKhRi4GEAl/bbOcb
	D/ywssNykNwgd8VMriQp0iDlLRCt+F1z3EJQuCBnPa/qPD6k4uPeWa9TeE6YuCSyVJWN
	N6pg==
X-Gm-Message-State: AJcUukflsYw0qIfykkh96qDBYHurOAA5P0UzO9ByJWtLu3jPT9fMVgGm
	TXKLFsAYuP0YdarnGXlYcLtAJ+G7hMpGMQ==
X-Received: by 2002:a1c:bc82:: with SMTP id m124mr527840wmf.77.1548096702192; 
	Mon, 21 Jan 2019 10:51:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:14 +0000
Message-Id: <20190121185118.18550-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH 19/23] hw/misc/armsse-cpuid: Implement SSE-200
 CPU_IDENTITY register block
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
X-TUID: UycYcVROME1u

The SSE-200 has a CPU_IDENTITY register block, which is a set of
read-only registers. As well as the usual PID/CID registers, there
is a single CPUID register which indicates whether the CPU is CPU 0
or CPU 1. Implement a model of this register block.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/Makefile.objs           |   1 +
 include/hw/misc/armsse-cpuid.h  |  41 ++++++++++
 hw/misc/armsse-cpuid.c          | 134 ++++++++++++++++++++++++++++++++
 MAINTAINERS                     |   2 +
 default-configs/arm-softmmu.mak |   1 +
 hw/misc/trace-events            |   4 +
 6 files changed, 183 insertions(+)
 create mode 100644 include/hw/misc/armsse-cpuid.h
 create mode 100644 hw/misc/armsse-cpuid.c

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 04f3bfa516e..74c91d250c8 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -69,6 +69,7 @@ obj-$(CONFIG_TZ_PPC) += tz-ppc.o
 obj-$(CONFIG_IOTKIT_SECCTL) += iotkit-secctl.o
 obj-$(CONFIG_IOTKIT_SYSCTL) += iotkit-sysctl.o
 obj-$(CONFIG_IOTKIT_SYSINFO) += iotkit-sysinfo.o
+obj-$(CONFIG_ARMSSE_CPUID) += armsse-cpuid.o
 
 obj-$(CONFIG_PVPANIC) += pvpanic.o
 obj-$(CONFIG_AUX) += auxbus.o
diff --git a/include/hw/misc/armsse-cpuid.h b/include/hw/misc/armsse-cpuid.h
new file mode 100644
index 00000000000..0ef33fcaba2
--- /dev/null
+++ b/include/hw/misc/armsse-cpuid.h
@@ -0,0 +1,41 @@
+/*
+ * ARM SSE-200 CPU_IDENTITY register block
+ *
+ * Copyright (c) 2019 Linaro Limited
+ * Written by Peter Maydell
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+/*
+ * This is a model of the "CPU_IDENTITY" register block which is part of the
+ * Arm SSE-200 and documented in
+ * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ *
+ * QEMU interface:
+ *  + QOM property "CPUID": the value to use for the CPUID register
+ *  + sysbus MMIO region 0: the system information register bank
+ */
+
+#ifndef HW_MISC_ARMSSE_CPUID_H
+#define HW_MISC_ARMSSE_CPUID_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ARMSSE_CPUID "armsse-cpuid"
+#define ARMSSE_CPUID(obj) OBJECT_CHECK(ARMSSECPUID, (obj), TYPE_ARMSSE_CPUID)
+
+typedef struct ARMSSECPUID {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    /* Properties */
+    uint32_t cpuid;
+} ARMSSECPUID;
+
+#endif
diff --git a/hw/misc/armsse-cpuid.c b/hw/misc/armsse-cpuid.c
new file mode 100644
index 00000000000..7788f6ced6a
--- /dev/null
+++ b/hw/misc/armsse-cpuid.c
@@ -0,0 +1,134 @@
+/*
+ * ARM SSE-200 CPU_IDENTITY register block
+ *
+ * Copyright (c) 2019 Linaro Limited
+ * Written by Peter Maydell
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+/*
+ * This is a model of the "CPU_IDENTITY" register block which is part of the
+ * Arm SSE-200 and documented in
+ * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ *
+ * It consists of one read-only CPUID register (set by QOM property), plus the
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
+#include "hw/misc/armsse-cpuid.h"
+
+REG32(CPUID, 0x0)
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
+static uint64_t armsse_cpuid_read(void *opaque, hwaddr offset,
+                                    unsigned size)
+{
+    ARMSSECPUID *s = ARMSSE_CPUID(opaque);
+    uint64_t r;
+
+    switch (offset) {
+    case A_CPUID:
+        r = s->cpuid;
+        break;
+    case A_PID4 ... A_CID3:
+        r = sysinfo_id[(offset - A_PID4) / 4];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE CPU_IDENTITY read: bad offset 0x%x\n", (int)offset);
+        r = 0;
+        break;
+    }
+    trace_armsse_cpuid_read(offset, r, size);
+    return r;
+}
+
+static void armsse_cpuid_write(void *opaque, hwaddr offset,
+                                 uint64_t value, unsigned size)
+{
+    trace_armsse_cpuid_write(offset, value, size);
+
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "SSE CPU_IDENTITY: write to RO offset 0x%x\n", (int)offset);
+}
+
+static const MemoryRegionOps armsse_cpuid_ops = {
+    .read = armsse_cpuid_read,
+    .write = armsse_cpuid_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    /* byte/halfword accesses are just zero-padded on reads and writes */
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
+};
+
+static Property armsse_cpuid_props[] = {
+    DEFINE_PROP_UINT32("CPUID", ARMSSECPUID, cpuid, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void armsse_cpuid_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    ARMSSECPUID *s = ARMSSE_CPUID(obj);
+
+    memory_region_init_io(&s->iomem, obj, &armsse_cpuid_ops,
+                          s, "armsse-cpuid", 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void armsse_cpuid_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    /*
+     * This device has no guest-modifiable state and so it
+     * does not need a reset function or VMState.
+     */
+
+    dc->props = armsse_cpuid_props;
+}
+
+static const TypeInfo armsse_cpuid_info = {
+    .name = TYPE_ARMSSE_CPUID,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(ARMSSECPUID),
+    .instance_init = armsse_cpuid_init,
+    .class_init = armsse_cpuid_class_init,
+};
+
+static void armsse_cpuid_register_types(void)
+{
+    type_register_static(&armsse_cpuid_info);
+}
+
+type_init(armsse_cpuid_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 52222117d77..42719880bad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -633,6 +633,8 @@ F: hw/misc/iotkit-sysctl.c
 F: include/hw/misc/iotkit-sysctl.h
 F: hw/misc/iotkit-sysinfo.c
 F: include/hw/misc/iotkit-sysinfo.h
+F: hw/misc/armsse-cpuid.c
+F: include/hw/misc/armsse-cpuid.h
 
 Musicpal
 M: Jan Kiszka <jan.kiszka@web.de>
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 3f200157879..be88870799c 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -118,6 +118,7 @@ CONFIG_ARMSSE=y
 CONFIG_IOTKIT_SECCTL=y
 CONFIG_IOTKIT_SYSCTL=y
 CONFIG_IOTKIT_SYSINFO=y
+CONFIG_ARMSSE_CPUID=y
 
 CONFIG_VERSATILE=y
 CONFIG_VERSATILE_PCI=y
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 52466c77c4e..b0701bddd3c 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -132,3 +132,7 @@ iotkit_sysinfo_write(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysI
 iotkit_sysctl_read(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysCtl read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_write(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysCtl write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_reset(void) "IoTKit SysCtl: reset"
+
+# hw/misc/armsse-cpuid.c
+armsse_cpuid_read(uint64_t offset, uint64_t data, unsigned size) "SSE-200 CPU_IDENTITY read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+armsse_cpuid_write(uint64_t offset, uint64_t data, unsigned size) "SSE-200 CPU_IDENTITY write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
-- 
2.20.1

