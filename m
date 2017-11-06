Received: by 10.223.150.237 with SMTP id u100csp2788992wrb;
        Mon, 6 Nov 2017 07:55:09 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Q4FkYGOrThRgxhlpW75AQMoSd5dgCx46l0sLwneWrRrXrpqZg2NgcUp0BRBW9PXi0Ld7Y3
X-Received: by 10.37.173.224 with SMTP id d32mr9735243ybe.102.1509983708963;
        Mon, 06 Nov 2017 07:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983708; cv=none;
        d=google.com; s=arc-20160816;
        b=LMMnMmeYacfvDWQem3nqiUNT1EhC0xYxm7q8+WAU+uH+n6GRLzZXwhQGJskEuizg3e
         N00rTibbLQiEgWZsjk8y8ZSOp97Hl5KyZPSeST3mfch1aHeuPTbR2/Av7uxOsgGq8YeL
         j5okqK0FWVJh8FyhWpccphdf86/iddGwSx7zcONK3+wiv5iiQS7qQiQk8GXFfMyow/+f
         ksj/TweSSPLaPmRoXaJqH+DpzAjXWGSwU0sN0fBpvAB5u/U+uZZS7ScbUyC5ZkJ7Tq+Q
         MgqWb+mNxFqGYpDAkSDEk0b3f0sjo1/h8biPcZ1yzweL9l/BVOzdEEc3uWSEMLW+gcTX
         U+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=7wopH1XHxfq0ba7AitW6knYSREqYUo3t2Q0tG2kDGkA=;
        b=JnzKlZyxbv1ouaA76/HD0h6HQRjtmOkT2JlmBbqVGiRCm94452ranSo5ZQEi3Du3BU
         eflyPWV8GVkLqhXpS+jNZFeOvfY9jdJ+FMRlC4kitPNZT2pB4pETxEcbbKsQl+gPdtsh
         Ga20MP7YXpS569yE+u3Ba65pwBO/WFaseE3TT4mGyWYmy3Ll2Doo63AYoo7Zbr2BvuDO
         RiGZCtXqNIfRfZJrI7xuNMTtHhDtTHnSw3qW+Z9wNH1AW9Wy67j1mGLfMjyAJehOt2St
         MuDjtl2c1qO6Rp2Yzc7LSmVVWNPCOxKUdkeiMYBX3gGbpQTAFHrXgAqma9hdrt98GT0g
         fjsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H5Xaxc6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a65si1747218ybi.347.2017.11.06.07.55.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:55:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H5Xaxc6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjjw-00048a-9B
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:55:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdo-0007Fy-V0
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdn-0000Yu-Nv
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:49 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:49712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdn-0000Yb-GE; Mon, 06 Nov 2017 10:48:47 -0500
Received: by mail-pf0-x241.google.com with SMTP id i5so8011562pfe.6;
	Mon, 06 Nov 2017 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7wopH1XHxfq0ba7AitW6knYSREqYUo3t2Q0tG2kDGkA=;
	b=H5Xaxc6WeiOeinv7maaXkn8n4+QbDckKezB5i3FIBI9c6UVY263/Qb3IUqd+cd1nf4
	omnKAVkpz0IkPLUazOz7mv1+B4sV2EHxslzBRX+XpSFq+25QIuUCMXrFMp11cDJh/JeA
	muDVMirrdyDay38O6OQyYhb/mYAt0MFn5lfOd0Fmi8eEFCEKUw+V4f6Ae2GRCWcFqR33
	WfII2W3pq2nis81zPuQZjPnNq4WZojs4oSUnaCifUBxlZnzHoHAc4E2XGWCuw2arpdtx
	iad7XEfT8By073btge/LnBn4Fbe0bnwxrNKznKjUPuh6TAtSI/hBs7DlMjQTeWryjVAS
	wOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7wopH1XHxfq0ba7AitW6knYSREqYUo3t2Q0tG2kDGkA=;
	b=eUOOjvg46efYemVNXe3e0OEmwqZwamTiHMypILQTg3kZh91eeDUXeWEBzbNNfmTk/l
	yLhwxtUEO89ofPIIyMwJgDnjbHcMG7xzCJTjHYBGSGskheZ/dLdvXQJQB0GV+2dd+NIn
	FBcZzYwfQQh6RGdJLYApHE5NGujthCDR8tmG4y6BPuZxOBHB+k1yfgtIBnTeYb3sSmFp
	g5HKmRgsiEVKdMhPfQXJ9hob6k7PvBkwYOrPgGTDjoME8/CaiSOegMKzpe4Mj+qGFQsF
	2vgmJJFGtDXF5LRT+9+LNJ1Nl4W0KWJEdJuXTHQRkj6f9QPBDVqLS/Ll2weLz6uiVaGP
	l9NQ==
X-Gm-Message-State: AMCzsaU+V4CAQsXQKw/oOauxVBKxvdq5I7XSiKRQG9XYpr1Ndm8kpQCH
	F5h9+m2NrzLxVWmCFNJZ9+x3E8WRVrc=
X-Received: by 10.159.214.140 with SMTP id n12mr14720374plp.4.1509983326191;
	Mon, 06 Nov 2017 07:48:46 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:45 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:59 -0800
Message-Id: <20171106154813.19936-17-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v3 16/30] i.MX: Add code to emulate GPCv2 IP block
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
X-TUID: EMwx9QnV6ULm

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/intc/Makefile.objs       |   2 +-
 hw/intc/imx_gpcv2.c         | 125 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/intc/imx_gpcv2.h |  22 ++++++++
 3 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 hw/intc/imx_gpcv2.c
 create mode 100644 include/hw/intc/imx_gpcv2.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 78426a7daf..db234901aa 100644
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
2.13.6

