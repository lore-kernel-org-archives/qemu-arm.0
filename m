Received: by 10.223.150.237 with SMTP id u100csp2792360wrb;
        Mon, 6 Nov 2017 07:58:52 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RFpZEtWt5nn0Rl0MakiGTlggcV6O2MTCPOMMqy9ByHHpgCRB3H2VMXv0wqKGdchfl0aDHn
X-Received: by 10.13.231.131 with SMTP id q125mr10297189ywe.324.1509983932193;
        Mon, 06 Nov 2017 07:58:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983932; cv=none;
        d=google.com; s=arc-20160816;
        b=YCPws1ilT/UKsBqyuRTV11NuI4WqWeIJz4wqlO09cG1xnAgytZ0qNKfD0Wly7ETyxJ
         OBIsZsm+UThw7C1Tffl2xXmuYvJ9O6dr7nU/+J87+nj9ayafZaN90MsyYSoPKbvEXKjr
         5qrwcCwlk7lVtjn7cbivKFn5Q9Wd3ZcMRRK6cexUbm4toyBBntzqGfQ+dY6khGKytGa1
         1YwoUOw1Wr1JVl0vrqFGEFEDEIQd9FEt21dJY0eQf+4XqCp4pg5ngS8qsulR8sewiAtm
         OxQbh2E9HVc81AVcxuN3w419INfAsfjgVnGMvg4WWl0Ua8YIZ/Tj4VJryyXFKB8I4x06
         AeGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ALiofTeAZdTQgrHCWWzYZ7/2LwpsaAZ4gMmLwY5PJXk=;
        b=ygFibfqy5jf39cXShSo9ElsamOq2GApJWox8OXney4eO0EJ8RVLdBxQyL7ZZ1nJ+FT
         hDnjt+vvylXWuXGb9MMyQVeoA1LcHj9+d41uHGEvcX9VGOKeZ/EiBJ0HNjUuF1BtLs4u
         stmU4V506b4a2A1WBfjSE09r332IfuLdzvRGa2P1WWQcFxfQQNl7mgPZJmUS99YCyTfX
         sqR0SFmgPlhKpxWxqkvG1FT5imrJdS8E4fOZW0s+xBbbX36jaKEQvtZvcmFt8bY1TVXX
         2kEpAepwgOT+6rcMsUE7AYbsKLw+/UegHVLTlMYD/XEDRpIxWxTeYokfJALYORWM6RKR
         Fn8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hjoNdBVu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y18si2624244ybj.72.2017.11.06.07.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:58:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hjoNdBVu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjnX-0007aF-J1
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:58:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjds-0007K7-Bz
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdr-0000bT-9a
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:52 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:45815)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdr-0000bH-1Y; Mon, 06 Nov 2017 10:48:51 -0500
Received: by mail-pf0-x242.google.com with SMTP id d28so8018703pfe.2;
	Mon, 06 Nov 2017 07:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ALiofTeAZdTQgrHCWWzYZ7/2LwpsaAZ4gMmLwY5PJXk=;
	b=hjoNdBVuwQzzm7P9GsiBatncd5MQYz+kUDNZ1aFYWxfqWAtZ9JFI983RXkKEB9ojaV
	dfpCcuqeKfEV5V4qrkoJVIVR4+/UQYZIh+BDfm65tZGIhB2XEqndir5zB/NDvPeEiq2b
	mVfgg4GIzOdxiGTEMdCsIJQoZoFTUpG9EzHQ0JfvFBmNryInTFL2grULLffUML09028G
	3SCnUsu5DNKx7d12667YZFtvWvFWwxKE7vVqQs8D695iSHu3hCHILSePmuwhocaFhKYW
	Jo/kQizR/Rkd8k3upmEWjBX7nuQ/pfvlmdPGT30Woajaz68uAG4CAt+qdfxyJtrkD4SR
	5uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ALiofTeAZdTQgrHCWWzYZ7/2LwpsaAZ4gMmLwY5PJXk=;
	b=E/fvfksSDPAHrz/Jm2RsG+ZiiXH54ctKmCMYPXX4MWs1kaMdYKs6FnrpykTYDQn+tt
	0YGXrLbgiYQUaDkXA8RJWBfwx2BNLfQxrFVBmaGDzTBRZvB9IiPqVuHPpBc5oZlXAg8f
	Zz79H8xVvBdHP3KNQimPswx0QgyaoKc0St1eT/nZTijyMY6n+40TXNlBcm66SRL5E2Gs
	1fzQWicMWYOPL52ybfxiTKaPUBLTS+3mg/RfbrG651xYh7PlZNHg/ypXQKBBO0HtHSB6
	wFX6z0Z2Of6W8vXN2lgsu0Nj/UB/TQA6ZSt9qw5O+B3YtZArFyCZnuKcKuw0WCpGepfH
	sOAA==
X-Gm-Message-State: AMCzsaU/ERhOwVYSHjCGot8RWlwqGrR9OpfOoR5CwLq2gQde+vSv261A
	BThyaLwiBX5d+eZ+1vcXIDCBMsid/Qk=
X-Received: by 10.159.211.11 with SMTP id bc11mr14954529plb.187.1509983329764; 
	Mon, 06 Nov 2017 07:48:49 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:49 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:02 -0800
Message-Id: <20171106154813.19936-20-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v3 19/30] i.MX: Add code to emulate SDMA IP block
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
X-TUID: +WCVppeTpzPt

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/dma/Makefile.objs      |  1 +
 hw/dma/imx_sdma.c         | 99 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/dma/imx_sdma.h | 22 +++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 hw/dma/imx_sdma.c
 create mode 100644 include/hw/dma/imx_sdma.h

diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 087c8e6855..3cee0b1047 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -14,3 +14,4 @@ obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dpdma.o
 obj-$(CONFIG_OMAP) += omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_dma.o
 obj-$(CONFIG_RASPI) += bcm2835_dma.o
+obj-$(CONFIG_IMX) += imx_sdma.o
diff --git a/hw/dma/imx_sdma.c b/hw/dma/imx_sdma.c
new file mode 100644
index 0000000000..0776e41b9a
--- /dev/null
+++ b/hw/dma/imx_sdma.c
@@ -0,0 +1,99 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 IOMUXC block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/dma/imx_sdma.h"
+#include "qemu/log.h"
+
+static void imx_sdma_reset(DeviceState *dev)
+{
+    IMXSDMAState *s = IMX_SDMA(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static uint64_t imx_sdma_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    IMXSDMAState *s = opaque;
+    return s->regs[offset / sizeof(uint32_t)];
+}
+
+static void imx_sdma_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+    IMXSDMAState *s = opaque;
+    s->regs[offset / sizeof(uint32_t)] = value;
+}
+
+static const struct MemoryRegionOps imx_sdma_ops = {
+    .read = imx_sdma_read,
+    .write = imx_sdma_write,
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
+static void imx_sdma_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMXSDMAState *s = IMX_SDMA(obj);
+
+    memory_region_init_io(&s->iomem,
+                          obj,
+                          &imx_sdma_ops,
+                          s,
+                          TYPE_IMX_SDMA ".iomem",
+                          sizeof(s->regs));
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_imx_sdma = {
+    .name = TYPE_IMX_SDMA,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, IMXSDMAState, SDMA_NUM),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx_sdma_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = imx_sdma_reset;
+    dc->vmsd  = &vmstate_imx_sdma;
+    dc->desc  = "i.MX IOMUXC Module";
+}
+
+static const TypeInfo imx_sdma_info = {
+    .name          = TYPE_IMX_SDMA,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMXSDMAState),
+    .instance_init = imx_sdma_init,
+    .class_init    = imx_sdma_class_init,
+};
+
+static void imx_sdma_register_type(void)
+{
+    type_register_static(&imx_sdma_info);
+}
+type_init(imx_sdma_register_type)
diff --git a/include/hw/dma/imx_sdma.h b/include/hw/dma/imx_sdma.h
new file mode 100644
index 0000000000..13c5be7a00
--- /dev/null
+++ b/include/hw/dma/imx_sdma.h
@@ -0,0 +1,22 @@
+#ifndef IMX_SDMA_H
+#define IMX_SDMA_H
+
+#include "hw/sysbus.h"
+
+enum IMXSDMARegisters {
+    SDMA_NUM = 0x300 / sizeof(uint32_t) + 1,
+};
+
+typedef struct IMXSDMAState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    uint32_t     regs[SDMA_NUM];
+} IMXSDMAState;
+
+#define TYPE_IMX_SDMA "imx-sdma"
+#define IMX_SDMA(obj) OBJECT_CHECK(IMXSDMAState, (obj), TYPE_IMX_SDMA)
+
+#endif /* IMX_SDMA_H */
-- 
2.13.6

