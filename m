Received: by 10.223.161.27 with SMTP id o27csp236564wro;
        Mon, 23 Oct 2017 13:20:47 -0700 (PDT)
X-Received: by 10.129.101.87 with SMTP id z84mr9800253ywb.482.1508790047504;
        Mon, 23 Oct 2017 13:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508790047; cv=none;
        d=google.com; s=arc-20160816;
        b=L3kizMoHyASi06uKB1G6PO3KwmHD1iFucjiAOAHzJENhCyYzptmKvBbW43HYalpI0g
         Ipo9S0vufYn3rtJMU3ufAlA0tixtkgrR4M8f0NYfpMfW5aiB32Scvc0vobD5LaOjb5zv
         TvZ3zHxaVRwYeDdM2SqwtpHaPs2qnP/9o9p2N1bgzKP3PXC7njE2XMTkX7QVWPsyrpcS
         I/d5ylBsoUkLJ7z6ur6AlNXQiaVHuTaDixWMOlBUSdykoALEy7F9DyuVRw5nj7fEG5xQ
         eqMcuBKKJr3tMaAnp0o1Hs5jKcSC9V68qnNdhyKS8D4tJATPCz6q7pQ0lPN94BcA7+ww
         c/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=X0A6QUtO7/nUjKdv7Oy2YrbbWKKyydP5j4dSYtyKXWo=;
        b=u3E+wD6y/sUzFDW+y8En2DEoFdvqYhob59OQ0dFAOC1Okd1n1Xqik7/QFyR3Qy0dh4
         XU7yFl/+jTNCuJpoA3lzwMvOF+sFxSwcKXuD4sIurceFdMNBRQHzicugJ0uQWGiMFv91
         LIxDsZRuUI0Z6f2+dZxQYhWo8wXHQEzPLMWr3NCYFYEX1DccSvJBW3xJvo1hDCil8ezn
         io7eerT5s/JTCDN5CsDByJPoV8EFnfaYhW71oh8ffchNl6Oqwc3Ub9kkF/6ZwfM495cc
         7qQlcxGAjHrUp+Um1upsUIrmfuszwfF9/h+zhAN22JqIKJbaWDu0WkN/1TzjnBgY2L7N
         aycQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UTyauepa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s126si1393055yws.176.2017.10.23.13.20.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:20:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UTyauepa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jDK-00080X-Pp
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:20:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4R-0000NN-3h
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4P-0002Yb-MU
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:35 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:55426)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4P-0002YD-Ei; Mon, 23 Oct 2017 16:11:33 -0400
Received: by mail-pg0-x244.google.com with SMTP id 15so7945145pgc.12;
	Mon, 23 Oct 2017 13:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=X0A6QUtO7/nUjKdv7Oy2YrbbWKKyydP5j4dSYtyKXWo=;
	b=UTyauepaNv9gm1xRk4+4nSx6mRI5WuzaalUrutGKLHaECMeYLVfvqCsOQc7azu2M9y
	23jRik5/62I1EwjBmRtLzoztkuj/JwWAHLXvklJarhdAOlY8ccDSbM8tlT0iDWo6jVit
	zbikrNKaaEUnk52D6EomwBLgBCqd5u7DfeoZzxMp1c3iNUBBueHp7em0qoHiOxO9D0+b
	7a8eQx1FJ3YaGO5qZoaFSp/UFH04PSTlbYm1orAMAtSjSVEvo2APFrLv1e0FtdsfPqcZ
	oMLwOTDlmDGObfr3WYuyUcdCI0nwqclYm2+jgCIz2UwyZ9nUGLUXZM/kf7DbwqtK0G+5
	FmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=X0A6QUtO7/nUjKdv7Oy2YrbbWKKyydP5j4dSYtyKXWo=;
	b=We0xXN/WJtIlppZoOIqx55P2zV4/W+KqLImOXZhn2z6YcWk7+zTn3wM9UqflIyau1a
	uVnXbEX+T/RY0pw1FXwULz/k67xXGgpleLdMCHqmlC5+QN3vKOflBYFd7zVqLN4yeyUb
	MNYvQaBBhMljtevyR9QE21Zr8X7fgdlLzSNU7EJtD9Omwc6uW3xNE4dzJJrbLyLpPQYP
	m/IKDxKcnW+06vTpsGzUQZM1BhyR3ysf5LnGoXQ043Hn/Ul/6C68e/TQHNo9FBZifr2I
	WkOguqb1Afplr0Z2Y8mzqFtk5szxfkNoKlWkYXM2JzBL7JTw6XMzM3vpo4g6YgxESnI3
	7jNw==
X-Gm-Message-State: AMCzsaXhir3RPUBOgeqEUof2AiiIjAP7kQhjSkSGbwOLwFORoYPVt20X
	/QIlhwMjtIy5TY4AmwKnOTyVfJDQ
X-Google-Smtp-Source: ABhQp+R6idtO7/HSa9M/0HYC8gpyYvoLYZiwLS8GW+Jf3cnH/l484jbopY2w5wl48DLLIb9aXFZ7ZQ==
X-Received: by 10.98.217.214 with SMTP id b83mr13770690pfl.144.1508789492335; 
	Mon, 23 Oct 2017 13:11:32 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:31 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:44 -0700
Message-Id: <20171023201055.21973-17-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v2 16/27] i.MX: Add code to emulate GPCv2 IP block
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
X-TUID: OqY5mAxtw6oA

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
2.13.5

