Received: by 10.28.71.27 with SMTP id u27csp240191wma;
        Tue, 6 Feb 2018 20:28:46 -0800 (PST)
X-Google-Smtp-Source: AH8x224ebIuPSEwlXPmaP2ZhuKhMwbovX5+e2TBEhtbssyKELookggK4eI2NeKlNoXdbRV//wxqy
X-Received: by 10.129.53.19 with SMTP id c19mr3009513ywa.404.1517977726377;
        Tue, 06 Feb 2018 20:28:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517977726; cv=none;
        d=google.com; s=arc-20160816;
        b=RmHzYgh3LBrMIx5NLTVd3VXwmtk596nGhXN04rYPRONHkRLG4KpUGNjiymL9688OTH
         QpX1lnZNByJ0VLFyOcW2W21Mwf+q4jHGsUjVSSRLKg63AgnIVo7KYrCUyaOR2mXC91i3
         +/CyLGcuCfBf/Prkig82oOFhyoVJl+DX+9tiOzLXeJqLxsyQxvKNz3Tk+eAFyfbpoLdK
         kZmr0q1rqpsSRZjR1XhnQVBTlPIutU0qOvY9d+re6b5EbnJfdZZE4Z8k/1XJk7PneX8K
         FtNNEUZlOwv4KasHJzwB3fXKF6xDH0HukQd/Z8u2KTI8lsStpleiGsavWuBuPanEGw64
         u89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=p3DbWtdaJQqRqXFbCkOYIlCvGXGO93IpRVgjd15DVUw=;
        b=yCmVpRsqI5G61T5QmU5ZBEsMkO1DrQN66HHtKsIxCGLafESV68F7LzhghTY5HcPtLf
         hVH4Ilyou8iL+OGW43t1cgEtWeF/Q2XXDJ9c04OQ6LUfFj1vLuNutkpHYZtWyGpJrCqt
         BzHAWhJymy0Gd5gcDwzOD/ldPw1D7o7nttU/yvIZQLMGJrMXlW+l9ZUuK3cl49PIM59J
         RBwIMWpKzLPSm1BryBM3e5PnDTy+rLGinhc6zhJqbCd/qmiLOdlzKJmBMSO8ByT6F1fs
         0OW1htvatypYVRpK9Kwf5srK7PWaPB7V/Gd2Nwbqwr52lVYLdipurNGuIeEgOARnJJ1P
         fDMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UHv78tTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c127si106743ywh.763.2018.02.06.20.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:28:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UHv78tTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejHLh-0003Ie-O0
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:28:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIM-0000Il-Fz
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIL-0003F8-0g
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:18 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:42091)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejHIK-0003Di-Oe; Tue, 06 Feb 2018 23:25:16 -0500
Received: by mail-pl0-x242.google.com with SMTP id 11so2738967plc.9;
	Tue, 06 Feb 2018 20:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=p3DbWtdaJQqRqXFbCkOYIlCvGXGO93IpRVgjd15DVUw=;
	b=UHv78tTkw6W806+fYSk96TCRcGBRIR/A3wtoe2X5ce8RlwmRREWeyJyDBPcnTgCTDD
	r64AksjOQycMShspE+LBdWbK+n0Lr6MWw14BDuHQz8O++k32w2WVMXqil1HkvLeZ9xKs
	2eerMaQB6BMCoYOQOpLjacuHwpHrU+yloHLYMMYl/EOf471VMq/UG7DMrzu7+zL+JgAC
	8eM3v7rqdI3Z9IWprgwBS5OP+uuUS5LNrGEMps76QHV+CfCl8I+MNkgAyHXey/UddqHg
	TTcs3+FsHAuE8AifHNXXKqnKGz1nW+mzNjcyIIMhx5l7nOwwdAGF14e/4Yf6Crnt18mi
	Cz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=p3DbWtdaJQqRqXFbCkOYIlCvGXGO93IpRVgjd15DVUw=;
	b=G2R4Doyi7Qz3VkEiXG+lrUZaKof9YAlgWtTVfKRSHcSeK6YCpbkgrGjgU6lVjWpau1
	8CDeta9SnydV781x1LSRbt/IRDmqcYkzMpejPRcgnsY8T7KoABPXtmt65AINt5DzXU9I
	pyuIraLt7AUKfnkStgTN2ArClwTxMFP2HgoW9fKUED91pynHxtLmLGIEL8A45zbPSA/d
	6z0WQ4cMu4nI1QCoOCHayRdk+2o2LGJfc+edGCCMqcIVGBUN/Tz2b0N8+7+aXRCJHgni
	YNvvR2s1UfU2emaBcrUWfDFdeXgrb7lY8nwiHldpyLZLmKyhkOoDfQlkx6qv1GZDLqxK
	BpyA==
X-Gm-Message-State: APf1xPCTp75YM9tffH3Y4z7Lj5GSo+TnR8IYtb0H8RJ5iac++jvXRfn3
	KDsWmxLYpGjdShjdDChx7r429w3v
X-Received: by 2002:a17:902:720b:: with SMTP id
	ba11-v6mr4605678plb.371.1517977515554; 
	Tue, 06 Feb 2018 20:25:15 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x8sm1076095pfk.123.2018.02.06.20.25.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 20:25:14 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  6 Feb 2018 20:24:32 -0800
Message-Id: <20180207042438.15422-9-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180207042438.15422-1-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v5 08/14] i.MX: Add implementation of i.MX7 GPR
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SVZrGprK8KUQ

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs      |   1 +
 hw/misc/imx7_gpr.c         | 124 +++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/trace-events       |   4 ++
 include/hw/misc/imx7_gpr.h |  28 ++++++++++
 4 files changed, 157 insertions(+)
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
index 0000000000..c2a9df29c6
--- /dev/null
+++ b/hw/misc/imx7_gpr.c
@@ -0,0 +1,124 @@
+/*
+ * Copyright (c) 2018, Impinj, Inc.
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
+#include "trace.h"
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
+    trace_imx7_gpr_read(offset);
+
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
+    trace_imx7_gpr_write(offset, v);
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
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 616579a403..e6070f280d 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -66,3 +66,7 @@ mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value) "MPS2 SCC
 msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev) "msf2-sysreg write: addr 0x%08" HWADDR_PRIx " data 0x%" PRIx32 " prev 0x%" PRIx32
 msf2_sysreg_read(uint64_t offset, uint32_t val) "msf2-sysreg read: addr 0x%08" HWADDR_PRIx " data 0x%08" PRIx32
 msf2_sysreg_write_pll_status(void) "Invalid write to read only PLL status register"
+
+#hw/misc/imx7_gpr.c
+imx7_gpr_read(uint64_t offset) "addr 0x%08" HWADDR_PRIx
+imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" HWADDR_PRIx "value 0x%08" HWADDR_PRIx
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

