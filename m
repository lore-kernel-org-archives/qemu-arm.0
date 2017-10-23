Received: by 10.223.161.27 with SMTP id o27csp237562wro;
        Mon, 23 Oct 2017 13:22:04 -0700 (PDT)
X-Received: by 10.37.10.69 with SMTP id 66mr2302931ybk.498.1508790124835;
        Mon, 23 Oct 2017 13:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508790124; cv=none;
        d=google.com; s=arc-20160816;
        b=QRPARn75DKKbCJ5eVapVj0ZdGocztDiFqhPtqzwdC2NPaQje2auf/VkQ1UjD3V4z3m
         aSNfCQRPcpQVvB3btAzIXiqpMjg9EN36R0E+nxqNb9QFrwAMF6I7rVTpKOwd+88hoD1o
         Bv9KOXWfbuQBsRaWWdXRilOjq8IxrfP3xU+L32wCqbiGuRoTEVDU9UgQYGAtjiaijhSw
         EytKo6recE6fC0VE9K3OqaPDEEL+nFHDNbgV30w+sz9GzpHwcLeU4r4QeXlk5TBXTBkt
         xp3uJt+Q8GMouGpwacatMu+JTKZ0fmqJ/D7u20rgRiuVsPLQv3loO0N2+myybsifm9n/
         4pgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Eadtz6G0CkntQ3EI89YxDE09/HF1GvOps2/R8z/KOWE=;
        b=x26cJqg13KdiUXCM/PdVjpzevwqWcyuEMatU+I/PuzzCmGEW9AC+by4JURWSYie8N5
         f6ld3uzOGYKBqJvxrP5n9deLwgdX/CZQH8h73vyurcYpqHRxBbqrTssYyaQCeS+dMcoF
         A+BrdtY/WTbazz7U4UVY4Zyt/CNk5A+sPtTj4klJWxWAj40eOwyBdyvMDRPSAfwFMuas
         LsoHtfHXEl7Jeldi9RzvJ/kps4auXoKfQND9SczRVhG/LmDMQuLzna1p5PQlMYf7eQ/b
         cQu/xr1t0ys0qeiQqZMtOwr1q7HhFWNPK7HvbsOiH+PWZtsa1WYyZeOwudC8//kJcbEx
         L0BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eDrsryMO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2si1297309ybd.122.2017.10.23.13.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eDrsryMO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jEa-0000dD-5N
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:22:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4T-0000S9-Ng
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4S-0002a8-Fd
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:37 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:52497)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4S-0002Zr-75; Mon, 23 Oct 2017 16:11:36 -0400
Received: by mail-pf0-x243.google.com with SMTP id e64so17904117pfk.9;
	Mon, 23 Oct 2017 13:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Eadtz6G0CkntQ3EI89YxDE09/HF1GvOps2/R8z/KOWE=;
	b=eDrsryMOeu6tvwxtcoxFuJOXnQGNjgZY035cmKvhc6Ou+5T6W/fAc9K6Yh9dk5hcNC
	eORgIP41RbiME/hwP/iMZUz2M3+qegrvqaSJr6wEGqdtcv9T/4TYlZrDmLUy7KGAL1RA
	CzSlHka34Hf16ZRFjIIiLywGVJyNUlEOjfswUt7dNqfAyzlFLkSLKsvSHUe/kwj8bMwl
	Og7b57s0T1vIPbW0ieOiPV+JQAsbWVByJ+/jNk/uyn9RtkrGlLN1EmX6/e1OlmeQ53/7
	sssbFlUa0tRv20D1N8Icd1QxAs9sVCB8/jTgiDdnsXNlbyBW2xhuEfRQAsxk2jnOq9AP
	nOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Eadtz6G0CkntQ3EI89YxDE09/HF1GvOps2/R8z/KOWE=;
	b=LZ77IAaqZ9/BcsObrSFgvYH9EgKVTlkPrlpaYqX7Q8tHtlRns90R4cyxLzX9WCECqF
	2Ncip9kzQSAxjBQdiNBd8Xg8yXjYs5RthgkKBiP27X+qzp4D6T2SR8Mh+Lk/X+opO43k
	cDGgG4nMpK6OR3z27vi5bf+/s8w4OJEs1VKWvaIEgOE815MuhwSilekGKfe70sMWt5nc
	x3s82pDPaeO1FStglFzApTbqHHLzopmlnyRh2OsDQ4HGyRD+IA/vzfE7UxP0OWs/+6z8
	6xW+9nd2iu0xSNlzRFNuFD3lE1jcLD3is+a615zN69azq6qoo0d91rP8HlYnHyPRaoDM
	dgyA==
X-Gm-Message-State: AMCzsaWBfZDxPHnxqHnumstK9+EzKeJi6ZHv1ukHv1SzBkMZhERVN1BY
	NWjbzB71BQZJBi2Cr9Gww7M592zG
X-Google-Smtp-Source: ABhQp+QnftbtaxrV4GT0WVYZpiITZkevs9WPNIKtlDPIBN/6hz5IjKEpDuWHJlh2mrl/2+B9GMoMuQ==
X-Received: by 10.99.130.74 with SMTP id w71mr12836552pgd.25.1508789495157;
	Mon, 23 Oct 2017 13:11:35 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:34 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:47 -0700
Message-Id: <20171023201055.21973-20-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v2 19/27] i.MX: Add code to emulate SDMA IP block
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
X-TUID: XEP+dXxkTEET

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
2.13.5

