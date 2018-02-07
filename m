Received: by 10.28.71.27 with SMTP id u27csp242641wma;
        Tue, 6 Feb 2018 20:32:13 -0800 (PST)
X-Google-Smtp-Source: AH8x225vXczUJHt7+8fT/9ECWfUEBT7R7zUkegPjkVeWNOkjL+AZexPOhRH8XdhTAgxRFWKTQ458
X-Received: by 10.37.171.113 with SMTP id u104mr2975249ybi.349.1517977933485;
        Tue, 06 Feb 2018 20:32:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517977933; cv=none;
        d=google.com; s=arc-20160816;
        b=mm58aQgRpJMpKO2MPjr9qXAgRMkHDQN6oTqegZgT1x3EROfPH0ZA55Yv+Mg5P716zR
         YOO/vkk6ikCi6kFMz6Mk4PAKYFVBoe21HNNtuLD4RrTuxOe7antSS6UGLOiHjLPBRwIp
         ZI2IPm/Ep8WQNw3IEjYzU6jVxN1PZGNoFtMO26bv4eB3L9scN4PBrz9yPnUfe1vWZNfk
         sCVL33JFEOC2HA7w9wAlufInmXx1KR0AarFeF5YjUKYbse8ArY9WQ/tGvT0tH9VZ+ppx
         VULwsColZLPRZ/XEjecbOP0vZmf9YQWOmtgWK6e2fMmTp78JhSEyWcY23u3u/tEyG/vN
         HRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BXX7DZetO5wR1lfqg7sGbAlqM+fJDAOzOPK4CiSvGrI=;
        b=uBTol6yLrrs4SrG0OLEqbZWNnYuMTydcA/OPbnf+V6J0Qj/d2j52SO3Zcii7wZf53C
         xQCcJg3IwFRZB9K9J4iDzBeCjgYwkw9rWWkYw3UBIpFLag2NjRDkHWH7QR0/SiaDmSjt
         9PxkImBns+Xgoaxpj6Lw3QC2H80voB8rNms4kp133GjxV8Pb8CUCExUO+uBOioGR3ao0
         nWyNKuq/Cl58ESvCFTs+avHwyceXANEziIRIlRBPzLygiblDUdEN/Ldl4KwhEOnyKCbi
         XYl3Nm469BRDA5n/xdkfCDH2Iz5vJxtBbWe0uWbREWYqPeSrIBd5FWKhBNWfXjzomq/u
         jH6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gk9LSWAn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a65si116111ybg.170.2018.02.06.20.32.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:32:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gk9LSWAn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejHP2-0006U5-Sr
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:32:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIL-0000H6-B1
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHII-0003AN-2e
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:17 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:35733)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejHIH-00039q-OA; Tue, 06 Feb 2018 23:25:13 -0500
Received: by mail-pl0-x242.google.com with SMTP id j19so2750721pll.2;
	Tue, 06 Feb 2018 20:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BXX7DZetO5wR1lfqg7sGbAlqM+fJDAOzOPK4CiSvGrI=;
	b=gk9LSWAnz14/V0gHWmclOjri4DjZ7fyepSOKWc0DyOQg4qxTLk4P1BAhTUpLpt8dMy
	rzax+Ov2RwkmMNuLyWJXtY1/kzYJzbrtxUCwV553eEqWUgAIY7P13CfTYICQdACfKMe0
	mZBDE7oSb7dq/DIz2CDg1jPL2CX8mTr1NWBijUYu9pJI2GCcdFjz+fMldBcVymLwtXrc
	+D0H9aDSoHiawuHqIdaWS+TrRANX6up+R3kCUNWqsKm5A7ycNDnvBljuc1nSeuBOqlMp
	sq89cmySxJLQ3pGfTOHetabDEnXT7RNNVf7VbTQ5YEvNocvLUBDmHWXyNRrwnyAhl9UU
	Evdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BXX7DZetO5wR1lfqg7sGbAlqM+fJDAOzOPK4CiSvGrI=;
	b=aD2wi9mNpMy3yc58fI4yExjc4kYHgvyYX7lkSLSY7k5zj8mvbrLEWjSq6wvGayJCtE
	sUHY5ydKod+CjYlq+AS7mqOPjpuqdDGB1CoXfOgBxqTwPPUluXS0cthezdb3LILlmAnU
	+MX15KXs7UEMQ02nj44fhS26hA3NUQ7NEAZUuMNYCnuzruGKUOac3eowX/tSiUO3U2zF
	AQaSFgyqABA6a80h1lMRF4C3LybSzZ76wpYBuwk9cq8zMoxPR6HKMVMcowpyh85VmIy+
	D0WFj45IF36m+156mYz1KKK5Gszhh3k9tnhrB9Hr1M7ZfriI5E4fIrumavy4teTf2cpZ
	hfyQ==
X-Gm-Message-State: APf1xPCHxN1XyPB/rNTUpIinyY+bnPZOU/YT+qUmk5UsYUWwVFPKwNXu
	KM4LwaqA396iYngR3DEjJkovhwmj
X-Received: by 2002:a17:902:9897:: with SMTP id
	s23-v6mr4597194plp.238.1517977512512; 
	Tue, 06 Feb 2018 20:25:12 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x8sm1076095pfk.123.2018.02.06.20.25.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 20:25:12 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  6 Feb 2018 20:24:30 -0800
Message-Id: <20180207042438.15422-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180207042438.15422-1-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v5 06/14] i.MX: Add code to emulate GPCv2 IP block
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
X-TUID: bmXZ7Iti+bgH

Add minimal code needed to allow upstream Linux guest to boot.

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
 hw/intc/Makefile.objs       |   2 +-
 hw/intc/imx_gpcv2.c         | 125 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/intc/imx_gpcv2.h |  22 ++++++++
 3 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 hw/intc/imx_gpcv2.c
 create mode 100644 include/hw/intc/imx_gpcv2.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 571e094a14..0e9963f5ee 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -6,7 +6,7 @@ common-obj-$(CONFIG_XILINX) += xilinx_intc.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-pmu-iomod-intc.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp-ipi.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_pic.o
-common-obj-$(CONFIG_IMX) += imx_avic.o
+common-obj-$(CONFIG_IMX) += imx_avic.o imx_gpcv2.o
 common-obj-$(CONFIG_LM32) += lm32_pic.o
 common-obj-$(CONFIG_REALVIEW) += realview_gic.o
 common-obj-$(CONFIG_SLAVIO) += slavio_intctl.o
diff --git a/hw/intc/imx_gpcv2.c b/hw/intc/imx_gpcv2.c
new file mode 100644
index 0000000000..4eb9ce2668
--- /dev/null
+++ b/hw/intc/imx_gpcv2.c
@@ -0,0 +1,125 @@
+/*
+ * Copyright (c) 2018, Impinj, Inc.
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

