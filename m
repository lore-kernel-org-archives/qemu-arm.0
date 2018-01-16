Received: by 10.28.173.206 with SMTP id w197csp3378750wme;
        Mon, 15 Jan 2018 17:40:50 -0800 (PST)
X-Google-Smtp-Source: ACJfBouOihj5i4gBqkqD+4/AgVZptb6m+pG0HWm6STfTuak2lS7h0dc82Ng7jRgBYFheQuEhq2r/
X-Received: by 10.37.61.194 with SMTP id k185mr10677533yba.301.1516066850280;
        Mon, 15 Jan 2018 17:40:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516066850; cv=none;
        d=google.com; s=arc-20160816;
        b=P3eqIBgnDSMDyFpxiSWe/zpp62TItFoCA6jblo36ifQonQq3+NCkgBApczD7D0Zofh
         Ke7EpMHqQtasTtDLrBxr8ZV6bPs9faeYmh0X4FmIj4Qw9eOA2+7kbb60FxDyD2L4M9w4
         3UxaTwfcJnRXuMC94oc1vlgVRX+ABoyn00KysHsL0I3l9V/55lEE308UvmUmNLkhE2fQ
         D8jjPltoKRSgI0WEqtxP2Pz3aFj/59NZ81GLDDSZGg6GXkmo4V2NI2BCu2b986xaoToj
         uBXSVR66/zOGIGlXk9QFLWBalOMVhpkWZT2uKC8qV2okgEmiEfkM70yu1BAOJarUaZMP
         AHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BmLi/VjzQJLUFwe9nfYaFxzC6/3Khd/n0uG5wWACSRk=;
        b=JAavTnldyFYRpP5qMjgmETFj5IzBZ1g2Twgo2YnRsvYnrBC1gnoh8Ml40j09uqifjy
         YoN5gAW3uAW5TT1/3YTdXn1SBu3Mxl2aGGpYZS0yuR3GIr9qpKQRG1rGF3ZjD7Ie5Dv5
         xXGsVesXkmYj7zeawG6GdxyeFKvzYHZsWvtR50uthMMPg4NAFNJq8n1rJf6rIws0eCyv
         Je5RpuoCsBRJsGVbIf2JVjeQ+VrmyxYHGoQu1mJcJb1F+Sa5600HEUfLJNqnYlVOK1a6
         ElTjpdiSMrtAmVCl3thvmvgMrrjc8cOHhbgmUDx7sT+1m9m3/UB92rG1elZObvDz7EkV
         wfsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CMOp11It;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y12si234709ybh.155.2018.01.15.17.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:40:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CMOp11It;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGF7-0000Qn-LM
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:40:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGC6-00065A-R1
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGC3-0005H4-LQ
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:42 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:46322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGC3-0005Gb-CE; Mon, 15 Jan 2018 20:37:39 -0500
Received: by mail-pl0-x243.google.com with SMTP id 66so4925490plc.13;
	Mon, 15 Jan 2018 17:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BmLi/VjzQJLUFwe9nfYaFxzC6/3Khd/n0uG5wWACSRk=;
	b=CMOp11ItRxWodZpzZIcPy6bz0JutpQns52SuzwnFgq98IbJBG/3HnziUz6wkd8ycls
	MwKdv9h8o79CHNAar/YffYD+33Tpm2Z+yot04paqxMQe+7O1MPV0Wk4atz2YgNWRzOn7
	zm/myFLJrfTOVB9wRc90qgezw/BVlmOdK9T0mEfySfiRy9iyajNKWzMJua+GYcc+kx2y
	26TXoMqFIlEkjyVTn4ljueGs84K8kdC8YGRxy49JY5jFjwNuvaF3xyXQLqBNhz4YaSP8
	D2Ci+U8PiIGQGs5P9/tzRFu1RwqVxdrzXiCeRNef+8ER2d4F1SjKx0Sn3isRCUs4t8RD
	NGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BmLi/VjzQJLUFwe9nfYaFxzC6/3Khd/n0uG5wWACSRk=;
	b=KO+Mo3QscHJS2TIo6GlA2R5hIuMHR7G5Zp1iS/6TXbTOlcc0w62apucO/M8lB9jF/D
	+AlVnQIkYoy2SGruu7kGuDjDtQ9QrVEKEA+X+EFJ/6+zzksH3t3JbbhOYrrQ062O9pqE
	YTuPcZ9DBIm5NVLPUqXHEP1/kAjI/IledPHJpyhhDn1o5k6GI1/WIN1e7CLrqS5ZGXpu
	920S+uStTj9XKo00ej7LG+8NnFbNgulowaVvHqXfaxTqzukAv8UCEpRWTj84QyzmEGJy
	zoSolMOcw/rK9AIGjzwX1RRcc2L+LCqajWTc3YnfhgdaW25kunrXpkxx0FYQ6hxbNxeW
	zGCw==
X-Gm-Message-State: AKwxytehiWDK3duuLkbwN0PeYGBY3Rw0PInMbAXmF35GPHRNtBr9lEB1
	KorUIaal46HD5d0E6bn6dtE0QHGj
X-Received: by 10.159.204.129 with SMTP id t1mr558604plo.363.1516066658184;
	Mon, 15 Jan 2018 17:37:38 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id s65sm1023795pfk.7.2018.01.15.17.37.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 17:37:37 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 17:37:01 -0800
Message-Id: <20180116013709.13830-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v4 06/14] i.MX: Add code to emulate GPCv2 IP block
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
X-TUID: yGxVKeF34kyx

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/intc/Makefile.objs       |   2 +-
 hw/intc/imx_gpcv2.c         | 125 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/intc/imx_gpcv2.h |  22 ++++++++
 3 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 hw/intc/imx_gpcv2.c
 create mode 100644 include/hw/intc/imx_gpcv2.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index ae358569a1..2252181ac9 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -4,7 +4,7 @@ common-obj-$(CONFIG_PL190) += pl190.o
 common-obj-$(CONFIG_PUV3) += puv3_intc.o
 common-obj-$(CONFIG_XILINX) += xilinx_intc.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_pic.o
-common-obj-$(CONFIG_IMX) += imx_avic.o
+common-obj-$(CONFIG_IMX) += imx_avic.o imx_gpcv2.o
 common-obj-$(CONFIG_LM32) += lm32_pic.o
 common-obj-$(CONFIG_REALVIEW) += realview_gic.o
 common-obj-$(CONFIG_SLAVIO) += slavio_intctl.o
diff --git a/hw/intc/imx_gpcv2.c b/hw/intc/imx_gpcv2.c
new file mode 100644
index 0000000000..496ed31b78
--- /dev/null
+++ b/hw/intc/imx_gpcv2.c
@@ -0,0 +1,125 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 GPCv2 block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/intc/imx_gpcv2.h"
+#include "qemu/log.h"
+
+#define GPC_PU_PGC_SW_PUP_REQ       0x0f8
+#define GPC_PU_PGC_SW_PDN_REQ       0x104
+
+#define USB_HSIC_PHY_SW_Pxx_REQ     BIT(4)
+#define USB_OTG2_PHY_SW_Pxx_REQ     BIT(3)
+#define USB_OTG1_PHY_SW_Pxx_REQ     BIT(2)
+#define PCIE_PHY_SW_Pxx_REQ         BIT(1)
+#define MIPI_PHY_SW_Pxx_REQ         BIT(0)
+
+
+static void imx_gpcv2_reset(DeviceState *dev)
+{
+    IMXGPCv2State *s = IMX_GPCV2(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static uint64_t imx_gpcv2_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    IMXGPCv2State *s = opaque;
+
+    return s->regs[offset / sizeof(uint32_t)];
+}
+
+static void imx_gpcv2_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+    IMXGPCv2State *s = opaque;
+    const size_t idx = offset / sizeof(uint32_t);
+
+    s->regs[idx] = value;
+
+    /*
+     * Real HW will clear those bits once as a way to indicate that
+     * power up request is complete
+     */
+    if (offset == GPC_PU_PGC_SW_PUP_REQ ||
+        offset == GPC_PU_PGC_SW_PDN_REQ) {
+        s->regs[idx] &= ~(USB_HSIC_PHY_SW_Pxx_REQ |
+                          USB_OTG2_PHY_SW_Pxx_REQ |
+                          USB_OTG1_PHY_SW_Pxx_REQ |
+                          PCIE_PHY_SW_Pxx_REQ     |
+                          MIPI_PHY_SW_Pxx_REQ);
+    }
+}
+
+static const struct MemoryRegionOps imx_gpcv2_ops = {
+    .read = imx_gpcv2_read,
+    .write = imx_gpcv2_write,
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
+static void imx_gpcv2_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMXGPCv2State *s = IMX_GPCV2(obj);
+
+    memory_region_init_io(&s->iomem,
+                          obj,
+                          &imx_gpcv2_ops,
+                          s,
+                          TYPE_IMX_GPCV2 ".iomem",
+                          sizeof(s->regs));
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_imx_gpcv2 = {
+    .name = TYPE_IMX_GPCV2,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, IMXGPCv2State, GPC_NUM),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx_gpcv2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = imx_gpcv2_reset;
+    dc->vmsd  = &vmstate_imx_gpcv2;
+    dc->desc  = "i.MX GPCv2 Module";
+}
+
+static const TypeInfo imx_gpcv2_info = {
+    .name          = TYPE_IMX_GPCV2,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMXGPCv2State),
+    .instance_init = imx_gpcv2_init,
+    .class_init    = imx_gpcv2_class_init,
+};
+
+static void imx_gpcv2_register_type(void)
+{
+    type_register_static(&imx_gpcv2_info);
+}
+type_init(imx_gpcv2_register_type)
diff --git a/include/hw/intc/imx_gpcv2.h b/include/hw/intc/imx_gpcv2.h
new file mode 100644
index 0000000000..ed978b24bb
--- /dev/null
+++ b/include/hw/intc/imx_gpcv2.h
@@ -0,0 +1,22 @@
+#ifndef IMX_GPCV2_H
+#define IMX_GPCV2_H
+
+#include "hw/sysbus.h"
+
+enum IMXGPCv2Registers {
+    GPC_NUM        = 0xE00 / sizeof(uint32_t),
+};
+
+typedef struct IMXGPCv2State {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    uint32_t     regs[GPC_NUM];
+} IMXGPCv2State;
+
+#define TYPE_IMX_GPCV2 "imx-gpcv2"
+#define IMX_GPCV2(obj) OBJECT_CHECK(IMXGPCv2State, (obj), TYPE_IMX_GPCV2)
+
+#endif /* IMX_GPCV2_H */
-- 
2.14.3

