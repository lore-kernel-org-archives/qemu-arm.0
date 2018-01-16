Received: by 10.28.173.206 with SMTP id w197csp3378822wme;
        Mon, 15 Jan 2018 17:40:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBosFf/7jD+wXdl16vEvi/Qc5Dy9f6vipJaKIj2tIva69V1VxRiZKoNcCiD5510+wXI1/3rjP
X-Received: by 10.129.138.197 with SMTP id a188mr4872241ywg.88.1516066855075;
        Mon, 15 Jan 2018 17:40:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516066855; cv=none;
        d=google.com; s=arc-20160816;
        b=dEifK6zQWb1nUtyOYzIHFTeblyNRtT5prAMjNHGy47Pl8kE1MZGADoOi2xm0xCDrH0
         cJDC/ZWIsEMaKSdZ67GjnEOYtZ49pcSSyCpaEF4M0fmCZgyN2g8DJekU7sX+ppXjqwrI
         PoIUHuhkMvhh1Z8hkGgT4aTJUdZ7fBZuNrkDOpF5EALiY4R8CR8OXAgBlk6VIxX7oi11
         YpdQkKNg0F+1zNpe/Rzm6EeUnHj61AdCqgQlZX+LiFE9LPeL8qfmMSHQIQ+gxcRMcfGg
         KPO87IqPNtKNCY2Zlr4udaklqzcOOv4BcWkOArO/jtLj4aSJ+iI+sR6VODegvbJVXsE+
         lEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=1N3LunBrcPww4HeQTZQR8nlbvVdg4PehJSRwx3W+YsA=;
        b=mhcM/ov/enbgBjQgkzV3psn31ODuLfUfX9vb0fFZHaOtNt9mCGBPQ5Hac2CMA6tRbs
         /lSaK9cB5HmUQSkJGNVk0D57qgrnExSKHUG3jPRO2Hj/ptchp4R/0o/6XqhXjldRkhqA
         XhlI6NRvw0FKU28r9Aul8/gL58bkLyxa3vZCT3S3M/FefQe8XfTdItvNtNMqtgJSOWTD
         sFtgixB3amuDqrZhOksV3AZt8r+xEMwkjEUrHkCGTsyJmXqtoPIfVw4LzJDTv9EH3MXb
         zok0/Sq26iuUkLux6ulJgMQWl+NlVr81WXXZ3jzUB9Znnh0qVWWw31lx+N6J0vDVjbgY
         7N1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PessSaHZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3si236362ywl.534.2018.01.15.17.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:40:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PessSaHZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGFC-0008Hr-GH
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:40:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGCA-00069N-AR
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 20:37:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGC8-0005NO-VU
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 20:37:46 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:32769)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGC6-0005Ir-0M; Mon, 15 Jan 2018 20:37:42 -0500
Received: by mail-pl0-x243.google.com with SMTP id t4so2143741plo.0;
	Mon, 15 Jan 2018 17:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1N3LunBrcPww4HeQTZQR8nlbvVdg4PehJSRwx3W+YsA=;
	b=PessSaHZn3+vM7evWsyf+pZl3MVi2SaIcSlPOUiRHoQTCi6Eo56A6FVcBUIX4pqYhi
	pyCzn/ToTo0iCcAOWNDIvwjP0jaqt846cOOuRQTR61uEyhhbJX+E5f4ScDlLgYqtSsi/
	KjS5gPZ3o6zwTscfVGbNs78Lkrup9d1NLYT1jlo4em/Tox3PKvPZdobV9EnCnV48u8O+
	kloZdM1Z5i6P7s3AQkk+d8XTQiJOFQd8JRabNSmR2kCK3NxgxAzzu1NTWM/2YsZ6h2rp
	k/03lbBI6i898WsNFnjANOwezueYGYmQN6FyIHrexHpks9IIf1dnWbVLry/yW/03gXmK
	DK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1N3LunBrcPww4HeQTZQR8nlbvVdg4PehJSRwx3W+YsA=;
	b=KFL7yrnDHuwf7JNhTPPgDoYA2Slu4xsjeXHPkIf4C9lMehtSblV7VTE2adoYWOYjdC
	jn1Jy+D4Swj+aVgc6mddpjHZksuYnlwLe12v2YiQ3ur7mjEpKMYd/9Cvyj8MyIiVsclJ
	CMlDh+e1jRp7SIGLid8cpPDjYHsDCsmpo8p80R3LY8625Eq7okI1fgIKb5pJcsQHMESl
	dAZxTAsqYg7tcQuzcEv7vo7XyzrneK0ScSUBU5kJ3GuM3xrKHPW9YybQrH3tFLV5bla7
	vxQThvBOEXqA+Xm84ns7B/Of8z1L4paHv8ELUeO2FXUn8GK9RsMtHtZSCJQbXvdfa0KF
	H99Q==
X-Gm-Message-State: AKGB3mJbjZ2AEEpTUXniG2axSCBBSoufW3nGY6DeirkuaaLtMrAshxmk
	/whX94TEDQ/FF69VaVjUTiCTBfAO
X-Received: by 10.159.247.138 with SMTP id e10mr31824491pls.279.1516066660814; 
	Mon, 15 Jan 2018 17:37:40 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id s65sm1023795pfk.7.2018.01.15.17.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 17:37:40 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 17:37:03 -0800
Message-Id: <20180116013709.13830-9-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v4 08/14] i.MX: Add implementation of i.MX7 GPR
 IP block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jpGH3X7h17mi

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs      |   1 +
 hw/misc/imx7_gpr.c         | 119 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx7_gpr.h |  28 +++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 hw/misc/imx7_gpr.c
 create mode 100644 include/hw/misc/imx7_gpr.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 019886912c..fce426eb75 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -36,6 +36,7 @@ obj-$(CONFIG_IMX) += imx6_src.o
 obj-$(CONFIG_IMX) += imx7_ccm.o
 obj-$(CONFIG_IMX) += imx2_wdt.o
 obj-$(CONFIG_IMX) += imx7_snvs.o
+obj-$(CONFIG_IMX) += imx7_gpr.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx7_gpr.c b/hw/misc/imx7_gpr.c
new file mode 100644
index 0000000000..9e8ccea9e8
--- /dev/null
+++ b/hw/misc/imx7_gpr.c
@@ -0,0 +1,119 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 GPR IP block emulation code
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
+#include "hw/misc/imx7_gpr.h"
+#include "qemu/log.h"
+#include "sysemu/sysemu.h"
+
+enum IMX7GPRRegisters {
+    IOMUXC_GPR0  = 0x00,
+    IOMUXC_GPR1  = 0x04,
+    IOMUXC_GPR2  = 0x08,
+    IOMUXC_GPR3  = 0x0c,
+    IOMUXC_GPR4  = 0x10,
+    IOMUXC_GPR5  = 0x14,
+    IOMUXC_GPR6  = 0x18,
+    IOMUXC_GPR7  = 0x1c,
+    IOMUXC_GPR8  = 0x20,
+    IOMUXC_GPR9  = 0x24,
+    IOMUXC_GPR10 = 0x28,
+    IOMUXC_GPR11 = 0x2c,
+    IOMUXC_GPR12 = 0x30,
+    IOMUXC_GPR13 = 0x34,
+    IOMUXC_GPR14 = 0x38,
+    IOMUXC_GPR15 = 0x3c,
+    IOMUXC_GPR16 = 0x40,
+    IOMUXC_GPR17 = 0x44,
+    IOMUXC_GPR18 = 0x48,
+    IOMUXC_GPR19 = 0x4c,
+    IOMUXC_GPR20 = 0x50,
+    IOMUXC_GPR21 = 0x54,
+    IOMUXC_GPR22 = 0x58,
+};
+
+#define IMX7D_GPR1_IRQ_MASK                 BIT(12)
+#define IMX7D_GPR1_ENET1_TX_CLK_SEL_MASK    BIT(13)
+#define IMX7D_GPR1_ENET2_TX_CLK_SEL_MASK    BIT(14)
+#define IMX7D_GPR1_ENET_TX_CLK_SEL_MASK     (0x3 << 13)
+#define IMX7D_GPR1_ENET1_CLK_DIR_MASK       BIT(17)
+#define IMX7D_GPR1_ENET2_CLK_DIR_MASK       BIT(18)
+#define IMX7D_GPR1_ENET_CLK_DIR_MASK        (0x3 << 17)
+
+#define IMX7D_GPR5_CSI_MUX_CONTROL_MIPI     BIT(4)
+#define IMX7D_GPR12_PCIE_PHY_REFCLK_SEL     BIT(5)
+#define IMX7D_GPR22_PCIE_PHY_PLL_LOCKED     BIT(31)
+
+
+static uint64_t imx7_gpr_read(void *opaque, hwaddr offset, unsigned size)
+{
+    if (offset == IOMUXC_GPR22) {
+        return IMX7D_GPR22_PCIE_PHY_PLL_LOCKED;
+    }
+
+    return 0;
+}
+
+static void imx7_gpr_write(void *opaque, hwaddr offset,
+                           uint64_t v, unsigned size)
+{
+}
+
+static const struct MemoryRegionOps imx7_gpr_ops = {
+    .read = imx7_gpr_read,
+    .write = imx7_gpr_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        /*
+         * Our device would not work correctly if the guest was doing
+         * unaligned access. This might not be a limitation on the
+         * real device but in practice there is no reason for a guest
+         * to access this device unaligned.
+         */
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static void imx7_gpr_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMX7GPRState *s = IMX7_GPR(obj);
+
+    memory_region_init_io(&s->mmio, obj, &imx7_gpr_ops, s,
+                          TYPE_IMX7_GPR, 64 * 1024);
+    sysbus_init_mmio(sd, &s->mmio);
+}
+
+static void imx7_gpr_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc  = "i.MX7 General Purpose Registers Module";
+}
+
+static const TypeInfo imx7_gpr_info = {
+    .name          = TYPE_IMX7_GPR,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMX7GPRState),
+    .instance_init = imx7_gpr_init,
+    .class_init    = imx7_gpr_class_init,
+};
+
+static void imx7_gpr_register_type(void)
+{
+    type_register_static(&imx7_gpr_info);
+}
+type_init(imx7_gpr_register_type)
diff --git a/include/hw/misc/imx7_gpr.h b/include/hw/misc/imx7_gpr.h
new file mode 100644
index 0000000000..e19373d274
--- /dev/null
+++ b/include/hw/misc/imx7_gpr.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 GPR IP block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef IMX7_GPR_H
+#define IMX7_GPR_H
+
+#include "qemu/bitops.h"
+#include "hw/sysbus.h"
+
+#define TYPE_IMX7_GPR "imx7.gpr"
+#define IMX7_GPR(obj) OBJECT_CHECK(IMX7GPRState, (obj), TYPE_IMX7_GPR)
+
+typedef struct IMX7GPRState {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+} IMX7GPRState;
+
+#endif /* IMX7_GPR_H */
-- 
2.14.3

