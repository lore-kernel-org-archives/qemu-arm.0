Received: by 10.223.150.237 with SMTP id u100csp2794396wrb;
        Mon, 6 Nov 2017 08:00:54 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TmWWpexoH8cxGWSwsN0i+FEfSdxNaY2vXSLEVPouWR2bb5xGvZmEJbwPKuCCyItD89qPZd
X-Received: by 10.37.108.135 with SMTP id h129mr9457924ybc.341.1509984054394;
        Mon, 06 Nov 2017 08:00:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509984054; cv=none;
        d=google.com; s=arc-20160816;
        b=pM+Iu7OWVkXx6ccTMRTyJvjF47BAwBkxEN7z2LpBR4PQpVq5LKIL3JlNkI19ec4hkO
         U3yyjmWRCSfKLS/d+cIBym6bYhjFHSzFTNI/o7a5XnJsFiEtddLDQH5MrT6eLtR1wKh0
         yGUXgqog/MnnRAY6R0lbmt1XB6I3o/S81DFeIaRXNaIRF5OYVx9GgrfIeYemZyXM1As2
         rWiNLvgB9c/bMqcI/FtBZYiBCAuT1Gca8gWy3IWohnvG618Hq6XUEh8EsOkqAxcplKC9
         utFgGBKcYZj33c0Ugy3Gnnhm91nWdfer6n1YJw3R7+qz7AvcFQ7iJ3Cqw2aRfqLj436Z
         HDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RiLjggeRCcOfUciZjmgDU5rvimlAJjeVBARBtVCXyjU=;
        b=ESix/L7CkokKLuBCVTJ482kADt6rqbGRcu5wQ5AVpN9Ml3QonnRGCTceMq9gEXCKYi
         htEE++MA2vQyTKp5ncPR8c/R5eLdP5ag9ajnBCCeELqWdDJH7uXvHBk6hLS5uYeQxHB1
         y7IvC6rDe1AEwTVp7qayW0W+KZa3heh7ZHEwqOjc30gffEZchrXQN+5U9j89iZ0SEdDe
         DLoIYw3HVmArOzij7mzHeYfhUv+BizogfJ41OJjxzpPhvD79vn5e9Iucu6pu+pEuuUsZ
         NtcVEAPMkqLY5zrwaia0NGQzMBAV++u/evW5yGmOYUOFy7Wmifs7mSDfa+k52NZTQit9
         /1pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u0lrC8+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l14si2728379ybe.27.2017.11.06.08.00.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 08:00:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u0lrC8+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjpV-0000xG-PZ
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 11:00:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje2-0007Ve-98
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:49:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBje0-0000ib-T6
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:49:02 -0500
Received: from mail-pg0-x22a.google.com ([2607:f8b0:400e:c05::22a]:51153)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBje0-0000hm-Fm; Mon, 06 Nov 2017 10:49:00 -0500
Received: by mail-pg0-x22a.google.com with SMTP id y5so8506337pgq.7;
	Mon, 06 Nov 2017 07:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RiLjggeRCcOfUciZjmgDU5rvimlAJjeVBARBtVCXyjU=;
	b=u0lrC8+ft5QTttKB00+vQyV/NMMFU4SSbOdN1rXiErhoaHCwx2yGxOu3K+QdAFn1ic
	CxohnlFglPmXA6BaOzdV5Z9EIo3iLJ0PmEZuz3cOPo03MiVEvuwZcOOK5sGHmJh2pVxb
	A8TzQKwfZaoFjfQ9basMLIImrEpkTNkPJ+BvigpqPJI1MwR1saf3+cIt+UfKTNhtmOHc
	Fjqotjzrv9BGvllVJ+TD7s1byPWB5zpEBNrsmSyToAJOVcVZ9qGaEPUwfskj9TW6zCG7
	9JmneP7W86eL5VJZ1qeJCaEWfmM6DUClMk2Fdp8WL6OVjiIM9RQ5o2CdT+vVzP15R4/T
	2BvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RiLjggeRCcOfUciZjmgDU5rvimlAJjeVBARBtVCXyjU=;
	b=XVOlQIL+Z/pqHJU63Ft4hBUhYN0PeZni3nqzdQW4L3MJHfBIy14V4A2qv+VOS5pHDo
	4kCE/zSoL6ZY4r/yc8RGpgZs4io9A7uv42h6lbsDO12h0YWQzy1+UHXcg1ik6Fjv6xja
	pqFHo246gBqOCxOG+DuyRuBB1OEn4jofm8bkbWI8/oXs4juAC3UVDBeCRRjby7Kq0a68
	Nzs4d0Kl7LzMbzb+xU7Wjb2/zIP3PXVxMuYmjzauiURq34lrxW5j10mwwa26vkOnNcWZ
	fX8e3BKnh0oPVZXSvv73JLA8R5aRGxhESzW7/PjC4CiiP4R16+T65it/xGQDbOtFsoov
	2b+A==
X-Gm-Message-State: AMCzsaVXB3HrMX3YPuNsZ/NrtzX0x0T61FZUvWhPNqjz1+LpDDzrXGwt
	YOIbeh2VS0GRwPx9D0uRUKCL3paH1n0=
X-Received: by 10.159.244.18 with SMTP id x18mr15163410plr.338.1509983339116; 
	Mon, 06 Nov 2017 07:48:59 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:58 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:10 -0800
Message-Id: <20171106154813.19936-28-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22a
Subject: [Qemu-arm] [PATCH v3 27/30] ARM: Add basic code to emulate A7MPCore
 DAP block
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 18JV8Hb6BZtc

Add minimal code to emulate A7MPCore DAP block needed to boot Linux
guest.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/arm/Makefile.objs       |   2 +-
 hw/arm/coresight.c         | 120 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/coresight.h |  24 +++++++++
 3 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/coresight.c
 create mode 100644 include/hw/arm/coresight.h

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index a2e56ecaae..459a3fa6be 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -1,4 +1,4 @@
-obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o
+obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o coresight.o
 obj-$(CONFIG_DIGIC) += digic_boards.o
 obj-y += integratorcp.o mainstone.o musicpal.o nseries.o
 obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
diff --git a/hw/arm/coresight.c b/hw/arm/coresight.c
new file mode 100644
index 0000000000..d0a8c1b005
--- /dev/null
+++ b/hw/arm/coresight.c
@@ -0,0 +1,120 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * CoreSight block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/arm/coresight.h"
+#include "qemu/log.h"
+
+static uint64_t coresight_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    return 0;
+}
+
+static void coresight_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+}
+
+static const struct MemoryRegionOps coresight_ops = {
+    .read = coresight_read,
+    .write = coresight_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        /*
+         * Our device would not work correctly if the guest was doing
+         * unaligned access. This might not be a limitation on the real
+         * device but in practice there is no reason for a guest to access
+         * this device unaligned.
+         */
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static void a7mpcore_dap_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    A7MPCoreDAPState *s = A7MPCORE_DAP(obj);
+
+    memory_region_init(&s->container, obj, "a7mpcore-dap-container", 0x100000);
+    sysbus_init_mmio(sd, &s->container);
+
+    memory_region_init_io(&s->ca7_atb_funnel,
+                          obj,
+                          &coresight_ops,
+                          s,
+                          TYPE_A7MPCORE_DAP ".ca7-atb-funnel",
+                          0x1000);
+    memory_region_add_subregion(&s->container, 0x41000, &s->ca7_atb_funnel);
+
+    memory_region_init_io(&s->cpu0_etm,
+                          obj,
+                          &coresight_ops,
+                          s,
+                          TYPE_A7MPCORE_DAP ".cpu0-etm",
+                          0x1000);
+    memory_region_add_subregion(&s->container, 0x7C000, &s->cpu0_etm);
+
+    memory_region_init_io(&s->atb_funnel,
+                          obj,
+                          &coresight_ops,
+                          s,
+                          TYPE_A7MPCORE_DAP ".atb-funnel",
+                          0x1000);
+    memory_region_add_subregion(&s->container, 0x83000, &s->atb_funnel);
+
+    memory_region_init_io(&s->tmc_etb,
+                          obj,
+                          &coresight_ops,
+                          s,
+                          TYPE_A7MPCORE_DAP ".tmc-etb",
+                          0x1000);
+    memory_region_add_subregion(&s->container, 0x84000, &s->tmc_etb);
+
+    memory_region_init_io(&s->tmc_etr,
+                          obj,
+                          &coresight_ops,
+                          s,
+                          TYPE_A7MPCORE_DAP ".tmc-etr",
+                          0x1000);
+    memory_region_add_subregion(&s->container, 0x86000, &s->tmc_etr);
+
+    memory_region_init_io(&s->tpiu,
+                          obj,
+                          &coresight_ops,
+                          s,
+                          TYPE_A7MPCORE_DAP ".tpiu",
+                          0x1000);
+    memory_region_add_subregion(&s->container, 0x87000, &s->tpiu);
+}
+
+static void a7mpcore_dap_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "A7MPCore DAP Module";
+}
+
+static const TypeInfo a7mpcore_dap_info = {
+    .name          = TYPE_A7MPCORE_DAP,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(A7MPCoreDAPState),
+    .instance_init = a7mpcore_dap_init,
+    .class_init    = a7mpcore_dap_class_init,
+};
+
+static void coresight_register_type(void)
+{
+    type_register_static(&a7mpcore_dap_info);
+}
+type_init(coresight_register_type)
diff --git a/include/hw/arm/coresight.h b/include/hw/arm/coresight.h
new file mode 100644
index 0000000000..d1480e825b
--- /dev/null
+++ b/include/hw/arm/coresight.h
@@ -0,0 +1,24 @@
+#ifndef CORESIGHT_H
+#define CORESIGHT_H
+
+#include "hw/sysbus.h"
+
+typedef struct A7MPCoreDAPState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    MemoryRegion container;
+
+    MemoryRegion ca7_atb_funnel;
+    MemoryRegion cpu0_etm;
+    MemoryRegion atb_funnel;
+    MemoryRegion tmc_etb;
+    MemoryRegion tmc_etr;
+    MemoryRegion tpiu;
+
+} A7MPCoreDAPState;
+
+#define TYPE_A7MPCORE_DAP "a7mpcore-dap"
+#define A7MPCORE_DAP(obj) OBJECT_CHECK(A7MPCoreDAPState, (obj), TYPE_A7MPCORE_DAP)
+
+#endif /* CORESIGHT_H */
-- 
2.13.6

