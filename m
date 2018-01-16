Received: by 10.28.173.206 with SMTP id w197csp3379558wme;
        Mon, 15 Jan 2018 17:41:59 -0800 (PST)
X-Google-Smtp-Source: ACJfBovmGwbgDrpckXUQQtFD/PrtRxOnA+DfaokPOxut/hznyQada+2ZaaW9RcaNzFuKuGvRnXjy
X-Received: by 10.129.124.215 with SMTP id x206mr22802869ywc.292.1516066919220;
        Mon, 15 Jan 2018 17:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516066919; cv=none;
        d=google.com; s=arc-20160816;
        b=zPlH+uU5cByuievSGmIFsBzb4OPb+ewZhnSTlbGEoln/KHvrXmaoQDxIJsmJthSYy+
         etgz+xeB64hMaRuzeGCma+2FiTtABHG4PCKIcb9EdK2sNMn/JULtXYnBygrnNtaSXugY
         EBWLetxcEw46lbAEd1oExXlAbxdavFb/YkqsQiHrsZfJiCEJVOBE0xZDxRPprmIA4e+y
         io21Tm8JS8azzzO+wfYGHG2cZMrY+u6NusyUjZQtJA7dQ0T1Zr3DY3OR5Wzwnc2pNCGq
         dZt2lwM0FzgYEPEu80yMsMB22zpuoSpYckyUMdyttszFmhsrEoGlEv5Jynkxza6a7/Wd
         gFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=1ryFcByvOOvZxFlYZJf/vFDLOWlIFRW4aYZ8H/CxRPs=;
        b=Mfr4idFH5FS6lKG4cRc+ic9FTXsTe8G9TfZyHHLwuKUyG4VivCxaF3cmi425RJm0KI
         fXMG9n9rYanvtnKDx+kHAboTRh8QHgAydPPGhAvLW5mVGOOkwW9pzt2/qzMTdhkpxiss
         v3Fk/Tp4iD45VyQ62EBpqjcRsoO/Q4YY/DLZUXTb1qrMysFGnsEUqbcHP8WX6u98fN+A
         4xWfODGCb4M1iKTItLHWxSlvLpa2R1LrH621lyEBU4vdDPhlAdyPW2rSpr3EAP7vrysW
         xS7sDk+Wdo2iKN0Vnewc2f4eqhAY1e9CqiKCgNAnj7k2ZPhiNeOy8/D69OGbinbDgXV2
         FDRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=En8EZm9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l16si232523ywm.219.2018.01.15.17.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:41:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=En8EZm9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGGE-0001RV-LE
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:41:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGCB-0006Aq-C2
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGCA-0005QP-9n
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:47 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:46324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGCA-0005Og-1m; Mon, 15 Jan 2018 20:37:46 -0500
Received: by mail-pl0-x244.google.com with SMTP id 66so4925691plc.13;
	Mon, 15 Jan 2018 17:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1ryFcByvOOvZxFlYZJf/vFDLOWlIFRW4aYZ8H/CxRPs=;
	b=En8EZm9OkvZeKGN7H3562xdO82UsmTKufMOS+v4OCXXGNyfzii5APjdJBC5NUYX15n
	rLz76BVm34iazaOAU9VeouarwGAybtsjqFy1RnnevMETIgJ+sQhYnjLib/HPUjFBmvY8
	bOmNgnki9rAYKuNYt77v+PczwSzxSwuRDaeqNDQKvdwneon+HrMNbqClHJk7Kod8QjP4
	MXlBH7hjEk5kQrx4x9e3tzuIjN7SJf651e88IirbCTjBu5CsMG7a3zJGS3cFRiutHJ3p
	Ypi1elfJl3t5cdXhrefjakBOiWF5oeXzkArB6xPr656VV54Fzvxf/aDzflY/vHWZSyiL
	geIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1ryFcByvOOvZxFlYZJf/vFDLOWlIFRW4aYZ8H/CxRPs=;
	b=gZSy5TVM8jlHtM0bDKYZmQ8RbtEWikQG/v+4z6WZU4JWYrfYslD+/cDE6ehsj0y4Ar
	dnpKejALIRlLDXcTwqsL2bvTB3G/kVKruJwda9RWqkKlOXXceGH/zGF4m3LENUZndhGX
	QaazSEmbMjl58UuLAQqvssLkstAJGLzXhEIORlEVx/VL6mRaU8g/kLgybxHA+Mg7iBDX
	b440XS0zs+W/vIgZVh9v4vjNvXd3Zq8H8L8Nilf/quw8XN0koS3LZmrSvcme4rEl9XNQ
	Iyk1+LElBuPJ1hZvVbkvqFhF/Ommamv3/kxTdl12yPEKSVql7CoB3gWLtu+8nboWdLXk
	K+ow==
X-Gm-Message-State: AKwxytcBXtaZ/g+E9a0Na5VZZbVAxsJSNwNJZph9kWX6mzyoJdnoG1o0
	VmYEfLIfVOiBRC4aM5P90xjJVKBV
X-Received: by 10.84.218.194 with SMTP id g2mr21947758plm.147.1516066664827;
	Mon, 15 Jan 2018 17:37:44 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id s65sm1023795pfk.7.2018.01.15.17.37.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 17:37:44 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 17:37:06 -0800
Message-Id: <20180116013709.13830-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v4 11/14] ARM: Add basic code to emulate A7MPCore
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
X-TUID: Ko/kJreXOi33

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
index 2794e086d6..692216e0cf 100644
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
2.14.3

