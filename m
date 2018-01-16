Received: by 10.28.173.206 with SMTP id w197csp3377210wme;
        Mon, 15 Jan 2018 17:38:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBovLzMxKIOVkLE6y9wccsghZB5yHLdgB3dwiVuo8UwLDUUCe7xpn+kBYraNwmFaRrfmhVd1Q
X-Received: by 10.13.201.66 with SMTP id l63mr33284486ywd.124.1516066714931;
        Mon, 15 Jan 2018 17:38:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516066714; cv=none;
        d=google.com; s=arc-20160816;
        b=gkv+gzFiJ5XMZlD6/RaBSrYf6NdxBChbXRFpwXDlEOuNONT27jVqKDzkvF0oZ2D9DC
         mizWmhIotiC7yprlEwRErzDwkUfggpXPRp+/8UFZUzwaz2FImn+zDfL5IIkU8AfoOHtC
         AcdkUaig0yU5GYQYGCo2Qp4BY9KXeVREm37T+TJBZTzCod3H/jKLMIy/qZXp+tICfkFx
         2f7wV5OT2jB2Rf2Dy54lbej4FKyx84WUPS+1r0x/SsWDQSGPIMIaihIuUrH7QJynj+Bo
         v4HEDP+nQ/01jqKiRRnuEwait+m0t5qTAiQ6YMt5/wczVO+kfea8z+4koQ6WMe0LO6B/
         tpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=XqOkBUrQilW0D3F2qgmewwsjlOkAbHj39O/o+o2TGDw=;
        b=mOqJQl7sfJ6nmMVjtcxr+bKcVCOPS0V+bc6q2yfkePZaVmdMRiZDJAOPG9yKiszml0
         1TMqMqj0VKvsjjfsvf1Cs1sKyf21tILvxed4W/Lfk+D/hEAO4GCB8O5/DUIfhTcA9FEF
         Gb+iVTX+vluNdH1k5p8GUyWHSMUzQe9gTDMLJxFtDPxdr1f5ErEYJlhZvV1teJxfjon5
         b37HJwkGWPwYqHs6gJG6DdCKPgwxhyvj0VNOQsYZUZLU6UJZGFGTqyRM9PEOj6l8MoZw
         bw1s6EBdrFf1LNnPwyhDiCU/9RAFgTn7D5g6GBUaJGQA6EtJ+sieUC/1aUndIQR85IzB
         eP3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eZWNVnIH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s190si215192ywd.273.2018.01.15.17.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:38:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eZWNVnIH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGCw-0006ks-7L
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:38:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGC3-00061D-Ny
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGC2-0005GL-H5
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:39 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:36327)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGC2-0005FV-9i; Mon, 15 Jan 2018 20:37:38 -0500
Received: by mail-pf0-x241.google.com with SMTP id 23so8866265pfp.3;
	Mon, 15 Jan 2018 17:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XqOkBUrQilW0D3F2qgmewwsjlOkAbHj39O/o+o2TGDw=;
	b=eZWNVnIHmUJryFOK1JofoYgHGPaANj5OEMm9+5IKXcRTxry9B58woZIb+oJEp9sseh
	k24EjiEp104e16F1mePpE1kNBtw2q7SHOCW3oncsDBHatSQALKN4vMi+pE0bcCT41VMp
	Vveb0HSy6WqabRsDR0G6Vc6UE0Ps6TKZsgoUo/z5jfgz9cQaRwgoih1uxv6jyquKAucJ
	HtW8wsPtYIdW42EFczN5vPbYZ9a6+6HN1DmOfwhm1V0QBSQ5aXnDfg+NjxEG2AKFFTTo
	yrhiqpPBg3Wq76iWhg/otj4tgEXSP5g90jBIiO6SbJ8udXvJkFyg/3oELVT2wB7Arp99
	wqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XqOkBUrQilW0D3F2qgmewwsjlOkAbHj39O/o+o2TGDw=;
	b=ZhWmY5AhfXq56UU6qP1FMSgzfybmOEYlUrIJP/iz/b/kBRqODaDcaQOlT61VTZMg0T
	vBKRwi61kbIQ+9x4uuuLFuEspOwEBFdaSh023WoyJRDBK+u/gzyRLiI6FjEnMjqNwyRr
	CH7OHVmkmgu6wM3FnDquMh20YC9U6Umno8Fe/9NPdsQdK37AyQh412rrzupFes8S+F86
	eR7g48pmPvpEkotrU1DVyoxTit3L7AYZsnx/55BsgYXVufQM67In+CQeWiWonCSa6t3l
	nuhDGw/p8M6uKhv6FL7ZQv5qzeLg5Ziyh9JW+4h3WYgvUIv+2YGlZg/rNTD1KgMLcdkO
	8DeA==
X-Gm-Message-State: AKGB3mIN7ulWqoZXZCh2kTaHXrUwmVKmnPbNJw4oXA2kvgCWeXF8KVuN
	cJuFCpoGbabAzOKoaclZzOXQ2a2P
X-Received: by 10.98.245.214 with SMTP id b83mr23304961pfm.85.1516066657071;
	Mon, 15 Jan 2018 17:37:37 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id s65sm1023795pfk.7.2018.01.15.17.37.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 17:37:36 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 17:37:00 -0800
Message-Id: <20180116013709.13830-6-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v4 05/14] i.MX: Add code to emulate i.MX7 SNVS
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
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rM8flPYZb+te

Add code to emulate SNVS IP-block. Currently only the bits needed to
be able to emulate machine shutdown are implemented.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 0000000000..670b9f4639
--- /dev/null
+++ b/hw/misc/imx7_snvs.c
@@ -0,0 +1,83 @@
+/*
+ * IMX7 Secure Non-Volatile Storage
+ *
+ * Copyright (c) 2017, Impinj, Inc.
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

