Received: by 10.223.150.237 with SMTP id u100csp2796047wrb;
        Mon, 6 Nov 2017 08:02:06 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TrMu7KT8tTEr6Lnh2y1e5DHHjJ4tQvtFFNyP5QiA+MiUuaWn5lwFXSTRlTUgQGsiQ0i0xP
X-Received: by 10.129.159.73 with SMTP id w70mr9899548ywg.160.1509984126114;
        Mon, 06 Nov 2017 08:02:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509984126; cv=none;
        d=google.com; s=arc-20160816;
        b=HhZa5Djqu2NO6DH/OdnoyGmzsqAfp6f8l/K5OHuCUzWstqh00eCzS6as8e5Uxzmwx0
         STj5inpbjqEjU5trnWH1AVcoHlKOahORgaQGAdZFajCb7IEqeE9qYB4XvvdDzPPxc19h
         wzPASpSc84wcdDXjQmlfJrtRzTNJjgtfIdktGS2keEVDl0mScsIcFSZb2NAw+9ScOlBf
         VWkCgGhAuTnfczteaiYMj3iKo6R0iGqIKpRUY5vM661BlycvDDWC5G7cG9ZXMGwYLAb6
         KJO7xu7ALAy6KRM4sR9TMHbzCKR7zNHHWxSnGvptBgsaaeXd4UVQdY3240e+N1qqPgT0
         SGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=xlD2PeJyWW9u4/f7j6XmrlU4rj+/bIA4M1QCkUyESuA=;
        b=rDGIqICdr+d8NzKLiII165oL3YIKE63reGHjFk4octPz64kLoPTIn5h0ijOjUcpIs1
         A2vUkAnmb8eyB9UHPIBRGb1QMZvE4crVVCnZnmQ8jMbRG8dM5+C4UPl+y9eiEVap2+GF
         f/Hg1iUOMF9tLO0mpjTIybGrl+CjrD8Z2HVn0vqKE10eQFkQhxP9nsBxcmifKHtV2kHM
         hlB2HNKYXQkGbZDLiziqe5KMVcpuUz9buHf3viTr1DmmRiBMTii7ACwf+KViaUDXLWhz
         IHdN8vMz0dhRDHwhaP+K80HVr+AFEuYv4BiQ0xua9epJhQXPOjPkBkqiIC80rnvSj2+7
         XjPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XCWUbwtV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k9si2637471ybb.254.2017.11.06.08.02.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 08:02:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XCWUbwtV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjqf-0002Bt-6M
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 11:02:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdu-0007Mi-PS
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdt-0000dN-Jp
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:54 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:44619)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdt-0000d0-Bc; Mon, 06 Nov 2017 10:48:53 -0500
Received: by mail-pf0-x243.google.com with SMTP id x7so8029044pfa.1;
	Mon, 06 Nov 2017 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xlD2PeJyWW9u4/f7j6XmrlU4rj+/bIA4M1QCkUyESuA=;
	b=XCWUbwtV+22CY75r6Fa/zP24YyApjdIXAVirPK+rcw/dLO40bAp+kGKHKwCuxdowU6
	PYsNck+H5GYIgOVwgMqGquJgc0MhRIhIw1s8X9gmdJyulak4p9pbcZWcXvHfInRgq+fR
	QqSME/6uMGeWvJMgOirpSz93R3Ykzm0Yy3MF2dZPfUQFtE4UrFsEIiAuZGbPgYHxaK83
	rzU++RBimQQ64+E6I+7Xr0uBAtHvh+sXmSzRmpUs5mpNff07DsMjkPOfAX6HNavr0eVa
	OCWfURXKDBtBBBImkBwDLLbXdxfq/d0f4/P0rVQbea822tX5Zavh3eMUSqgs5Z5kBmtd
	kBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xlD2PeJyWW9u4/f7j6XmrlU4rj+/bIA4M1QCkUyESuA=;
	b=ffMb6CIMtbY/F06d3wmheOtMnAtOhGusdJzJhceVi8S3/cknfowPksxnI28WW9HEaL
	qWOlrZP/F5f9y7SKJndpNat9gmfAWSePNdh+L2c6Eq9E1jrnBE3iH7pMIeZ8QyzLOtsz
	2JgFiesQjLcg09mh+Pb2RU4UFcvMhGf6wYEgPHJ7C+pbuUJTSeYMDByvIRrldmItaCCO
	YmhpHpaDkiSWvqaMjXmRcHGkDelA9SkHfN6fNoDJWdiEA0OuODBN7SYOnQXHa7++L4BN
	ViOs5bfX8JsQO4qT/5d11rKr53bOYS7m1YrdfXrEAlvUt6VOh9KSgd9xWVZXFDi56E4+
	K/BA==
X-Gm-Message-State: AMCzsaW3EBXoLBFesyAj88wfEidsrv12JCCqO9l0zUKP+KymS9PJtVsi
	kepVgnbZhggYJiAtibuU7sy/nj/mF9o=
X-Received: by 10.99.119.79 with SMTP id s76mr15557875pgc.3.1509983332077;
	Mon, 06 Nov 2017 07:48:52 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:51 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:04 -0800
Message-Id: <20171106154813.19936-22-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v3 21/30] i.MX: Add implementation of i.MX7 GPR
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
X-TUID: c9ZRW2Wmg44f

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
2.13.6

