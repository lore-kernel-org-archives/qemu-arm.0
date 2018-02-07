Received: by 10.28.71.27 with SMTP id u27csp238552wma;
        Tue, 6 Feb 2018 20:26:01 -0800 (PST)
X-Google-Smtp-Source: AH8x224SzwI0TV+YfRTHiwZE37d5D9zuzOcGXMTFN5dGEx/xupR235StEqvLpfxPVWLibku/m7Sj
X-Received: by 10.13.224.65 with SMTP id j62mr2832246ywe.185.1517977561541;
        Tue, 06 Feb 2018 20:26:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517977561; cv=none;
        d=google.com; s=arc-20160816;
        b=VRlzEtxXmhZ4MMPfTp1IYberdZuJ2WU1KTgaZfqLmHQf6Z1nkkmI6aP2zIaTmgfu3O
         EjXR4yY4dQcPi6/nZ8qLY9fL/kE8NschdTxp5Wp4I80Cj2HR93ISre2MEd3aY+vBOxFW
         AsWashwcPAOzoeour29ajbRzuKWREtXGrhaWoIEFOCP2Oa7jfky/7fObcjocKkWzwf/W
         C6w76oLO2twRwnXsmT17pygMsRJBarTSKZByg3+/Ybj57wNZVfJt5PAIYngOednwV1fk
         MHcdIld2eNEp65181tKg/k8sl3CpTZPWfEitCx4vrTzFfupEZejzKGl8a3PMZo0RDuF+
         7lRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6IIXhLnAJyjkby0Z0zaC8b3krJ0hahWteikavDfNII8=;
        b=y7+B9bJCSr2CBzqF1x+yBFc++fnQcW6RSklvs1MdKm6p/CW1FQekxtC3N2D2s75RpS
         We4xx9nKmWuGCJc/M0UIuxWDwrArsB7+zsc8DgoStz01KFR1vgg0a3bV0QobmIloauJv
         clc/xkzPvfElyFDo/0ZJD3baZjUyltaCKo8nP1O45ERPFlsI3uCt2qfrpSQXw3Qo87GH
         cQOsvD0fgRkiAcQBDbgQIKJy5Re6hRKDmks8/gpElaPlNE/tsvh7xy3QFMqCRnRIHvhj
         7qAfDSNqN0bPulcZ7iYOQWykq5yDvm/7R5CvT0Dt23XRyuARCCwj30ijswzfnreEpzK/
         mfyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GOZGKFey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u189si105700ywd.753.2018.02.06.20.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:26:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GOZGKFey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejHJ2-0000qG-UI
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:26:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIH-0000Ao-NT
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIG-00039W-G3
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:13 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:43072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejHIG-00038x-7x; Tue, 06 Feb 2018 23:25:12 -0500
Received: by mail-pl0-x241.google.com with SMTP id f4so2727326plr.10;
	Tue, 06 Feb 2018 20:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6IIXhLnAJyjkby0Z0zaC8b3krJ0hahWteikavDfNII8=;
	b=GOZGKFeyUoEir+tewwwXID0TL4kIiWzV6cn8DOEDjvCCD2fKw9CLdNdzKQAmunqjtS
	PsjjGKe/yIkRLmRiOG3/sY11ZdIS/Q2J1pCxLcHcv0Qcdaek50jtihxjOtLPKP5bdck/
	CWKFRWWKmXpssy1dVLVV3eAXcG4Oj+EwVLbHoHB/xzTAJ/Ca824W7UvejYUAQ3RGiFmG
	Hd5CF7oiuIXU+wu+Nyii4tSrzARJJ0/ygmwx4WCpnhvjHgFycbC5CYSuzgOotViPoM2j
	j3o1MafEJFiEYWFgRDRlr+rYrGxZ6CYAEdSfjt0SAwTm/Hqh06eP0jMHhYYISjkHyIdB
	T0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6IIXhLnAJyjkby0Z0zaC8b3krJ0hahWteikavDfNII8=;
	b=maHz07uC3Mw7ukl17JKLSrlg/qRUrsD4H0zD81WUI6KH377Wqb/JQaBxEKB8FuyQhZ
	MI3JRT1JkhnYaVaf9FqOnxZDM5kjA5uu3ZrRbGRxZgXe0gPDtspDhPcdspTs/+tCPiRB
	a8VK1R5A7Zq9g3i6SVxbYFI/cJ6eFvzfM06leKCGLqXD1RkIDsyGsKk2gnaPaY5PWQG3
	uumyzKNF75KXOsbdZTtauG+9twuiP19QQMvTSZ/3gvpiNYs9DFVxn+SLYbMJANtZPjVX
	kAUa4kkqSrQYQj/jMQ+Yw/LX/LlYXqPJ/tTmQ67lFWWdDpukx/4gaJSEdOqhVpIVzhSl
	hk9Q==
X-Gm-Message-State: APf1xPAza/Bxt8E+1BC8M6u7yUFzTjtLZveMMEmtX4khzLH6+262xrRj
	dhiglIF1IPcp8u/ZBSTiLTGU8KDv
X-Received: by 2002:a17:902:1665:: with SMTP id
	g92-v6mr4656757plg.245.1517977511113; 
	Tue, 06 Feb 2018 20:25:11 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x8sm1076095pfk.123.2018.02.06.20.25.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 20:25:10 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  6 Feb 2018 20:24:29 -0800
Message-Id: <20180207042438.15422-6-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180207042438.15422-1-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-arm] [PATCH v5 05/14] i.MX: Add code to emulate i.MX7 SNVS
 IP-block
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eEOK84SBUnLs

Add code to emulate SNVS IP-block. Currently only the bits needed to
be able to emulate machine shutdown are implemented.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs       |  1 +
 hw/misc/imx7_snvs.c         | 83 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx7_snvs.h | 35 +++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 hw/misc/imx7_snvs.c
 create mode 100644 include/hw/misc/imx7_snvs.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 4b2b705a6c..019886912c 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -35,6 +35,7 @@ obj-$(CONFIG_IMX) += imx6_ccm.o
 obj-$(CONFIG_IMX) += imx6_src.o
 obj-$(CONFIG_IMX) += imx7_ccm.o
 obj-$(CONFIG_IMX) += imx2_wdt.o
+obj-$(CONFIG_IMX) += imx7_snvs.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
new file mode 100644
index 0000000000..4df482b282
--- /dev/null
+++ b/hw/misc/imx7_snvs.c
@@ -0,0 +1,83 @@
+/*
+ * IMX7 Secure Non-Volatile Storage
+ *
+ * Copyright (c) 2018, Impinj, Inc.
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * Bare minimum emulation code needed to support being able to shut
+ * down linux guest gracefully.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/imx7_snvs.h"
+#include "qemu/log.h"
+#include "sysemu/sysemu.h"
+
+static uint64_t imx7_snvs_read(void *opaque, hwaddr offset, unsigned size)
+{
+    return 0;
+}
+
+static void imx7_snvs_write(void *opaque, hwaddr offset,
+                            uint64_t v, unsigned size)
+{
+    const uint32_t value = v;
+    const uint32_t mask  = SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
+
+    if (offset == SNVS_LPCR && ((value & mask) == mask)) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static const struct MemoryRegionOps imx7_snvs_ops = {
+    .read = imx7_snvs_read,
+    .write = imx7_snvs_write,
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
+static void imx7_snvs_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMX7SNVSState *s = IMX7_SNVS(obj);
+
+    memory_region_init_io(&s->mmio, obj, &imx7_snvs_ops, s,
+                          TYPE_IMX7_SNVS, 0x1000);
+
+    sysbus_init_mmio(sd, &s->mmio);
+}
+
+static void imx7_snvs_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc  = "i.MX7 Secure Non-Volatile Storage Module";
+}
+
+static const TypeInfo imx7_snvs_info = {
+    .name          = TYPE_IMX7_SNVS,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMX7SNVSState),
+    .instance_init = imx7_snvs_init,
+    .class_init    = imx7_snvs_class_init,
+};
+
+static void imx7_snvs_register_type(void)
+{
+    type_register_static(&imx7_snvs_info);
+}
+type_init(imx7_snvs_register_type)
diff --git a/include/hw/misc/imx7_snvs.h b/include/hw/misc/imx7_snvs.h
new file mode 100644
index 0000000000..255f8f26f9
--- /dev/null
+++ b/include/hw/misc/imx7_snvs.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 SNVS block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef IMX7_SNVS_H
+#define IMX7_SNVS_H
+
+#include "qemu/bitops.h"
+#include "hw/sysbus.h"
+
+
+enum IMX7SNVSRegisters {
+    SNVS_LPCR = 0x38,
+    SNVS_LPCR_TOP   = BIT(6),
+    SNVS_LPCR_DP_EN = BIT(5)
+};
+
+#define TYPE_IMX7_SNVS "imx7.snvs"
+#define IMX7_SNVS(obj) OBJECT_CHECK(IMX7SNVSState, (obj), TYPE_IMX7_SNVS)
+
+typedef struct IMX7SNVSState {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+} IMX7SNVSState;
+
+#endif /* IMX7_SNVS_H */
-- 
2.14.3

