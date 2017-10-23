Received: by 10.223.161.27 with SMTP id o27csp237064wro;
        Mon, 23 Oct 2017 13:21:30 -0700 (PDT)
X-Received: by 10.129.114.10 with SMTP id n10mr9914176ywc.54.1508790090564;
        Mon, 23 Oct 2017 13:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508790090; cv=none;
        d=google.com; s=arc-20160816;
        b=MoFE84V+cr4zfjzGHz/UEEeodWyGNZzqujgu7a6OKc/O0uhU868TAEFTWprRlyT9xk
         Eua84lTC6ZR8BCslRoxFefHtrKQMT+uSRb4I7E4OdRMFW0VPdB554PtSfQCoYsRRRfrz
         3oEG3vYnL9I8lhnsFOP/ZmlLCNiRIHnQI9zPQgiJiw3dpIw2e7h2Ze7xZ4DgcNgA+Igo
         Wrkt8Mom6FyZ2JdMr19DtDfJFQUDb0IiLgMz35kc1DAXJ4dteyUykE+IMFSbBrN1CDLW
         eWfGUmBSd6ZxCPtlM6/cNz3oiJ1nSO9A5POSSE4n8FDtSEjekzjVEQhU4elXj2dwrwpm
         aI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ItnOflH78x370QOtZVosk98MLC/OJTwy4qV/yC/QjjE=;
        b=GinXpAVKyn2BuxcA84cKHicRFxNA6BN6n60Dz2ZoE8jV4+iSumXQW1R/uXGPkVbc/m
         /pPhcj1JHhtdz/W4MLNQ2lX2ndaBmuREskeTxlWZPBv8FOPy/BrJdWy9/siUHjJJD0NT
         uoqcRDY5IxvWFZisbpCy9SjVCUuLC4wOKlaqLTB3FuOzaPsRVB5hf8zNYSfKMiYxPASg
         yu4rV/hPSMlT2HRLB7XDZa1AvUuQOZJ8woSRWCggbSrtpPkCIkHA4kWVGMytYI8Fhvrb
         BoF5z1jfTqcO4hNb+8Q3AsoQ5T4NC5GPebH3kkQQVRlb2n+9kCdqou4GwfCKlOd1Mwlb
         Qdug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vCRz1lFa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s12si1322988ybj.316.2017.10.23.13.21.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:21:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vCRz1lFa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jE1-00008x-U4
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:21:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4V-0000VC-Q3
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4U-0002bC-JF
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:39 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:44554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4U-0002av-6O; Mon, 23 Oct 2017 16:11:38 -0400
Received: by mail-pf0-x242.google.com with SMTP id x7so17923566pfa.1;
	Mon, 23 Oct 2017 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ItnOflH78x370QOtZVosk98MLC/OJTwy4qV/yC/QjjE=;
	b=vCRz1lFaqS/1sPAGstU8W3Yt+u4j5e3zlK2Sp1gY568vz90BaD04LHwSOmZkpdABBh
	v47//9CK3Xi9N/2NBtneKkDv08KgJkE01CVZvoLewjdtTvlpchxrGKcztRBbTR8UTZLQ
	EKRHh0EKK/za+tM+zEFmjNBfe62wSYi8o0QAmqIaNT0jH+5M8hQOhwOAgDSx6GIkNv+J
	/woTTJAXeBd7DtbrVDfhSgoubxElYCx9UgQHWykKh472wV4ReLUXL3iCB7nHN6HyfpEc
	OA6j2xyOzOWMjdRIHhfPD5PyfKyDtPrkE1F+ftRq3/y00kEno3Ff+iUQLyh913AVGbJ1
	2vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ItnOflH78x370QOtZVosk98MLC/OJTwy4qV/yC/QjjE=;
	b=nV9t+quGxR7q7NppVZVl7t61GDNYPmKiPCwkAQBhJf0pVg7ERRbykZMn+JaGDvBmAM
	GE/mdMsu13oETCpiwYyKybApGvw2sq1Syq34cYSJeyWA1Ak9An0gAkFcCohBW1OC7WqC
	nevWmNLVwFTpP2v/QJejFTCoSjPewxlNXMIUW89ypp6iR3XdZp7AUW0e5NBDSI1eFbYM
	RbeNwrqqBC/IeirC6cOjXThuBaqLZRAbUQ8jUPjaB6i5l+2Bl+3wr+A+HMZVsGcB/d1/
	ZjzPPJFK/eLXjHRhLnzIGLdn2vlMxSfTLGb8+R18AEy0iUD8ebfY/4eBF4kj4vDwSW5s
	9O2A==
X-Gm-Message-State: AMCzsaWQH7+RyrMl9iqmpPsRkUt9pW2cCGasUu/y1uvS8+y5kZxIVWh6
	VNqNfvilsfWMo7RgtiFTLcPwUmRt
X-Google-Smtp-Source: ABhQp+S/l0CLZkLoY0Su21Ht1DgG8BnTEbScXwsidaVE67gwpMoNx09j93l6kxm1/Ns7b5EffQsYfw==
X-Received: by 10.99.183.67 with SMTP id w3mr12674307pgt.329.1508789497138;
	Mon, 23 Oct 2017 13:11:37 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:36 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:49 -0700
Message-Id: <20171023201055.21973-22-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v2 21/27] i.MX: Add implementation of i.MX7 GPR
 IP block
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
X-TUID: PAIo9VWRTH3z

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
index 943b22af40..c9944161bd 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -39,6 +39,7 @@ obj-$(CONFIG_IMX) += imx2_wdt.o
 obj-$(CONFIG_IMX) += imx7_snvs.o
 obj-$(CONFIG_IMX) += imx7_iomuxc.o
 obj-$(CONFIG_IMX) += imx_flexcan.o
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
2.13.5

