Received: by 10.28.71.27 with SMTP id u27csp1372337wma;
        Tue, 20 Feb 2018 10:04:17 -0800 (PST)
X-Google-Smtp-Source: AH8x227sHs/1unKvx++Iva9JVFJhqx3kdBPs+L78PRfEYZbvNCN8T0dN6EPVNgNaebKu+2jjutsK
X-Received: by 2002:a25:2351:: with SMTP id j78-v6mr457669ybj.174.1519149857167;
        Tue, 20 Feb 2018 10:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519149857; cv=none;
        d=google.com; s=arc-20160816;
        b=MxTBRfLeRNHbGBCUjv+QXj+wWestRFFW3Y/Ai6tc/PHEXEmjbwa8kwW1AKtqtJKinj
         xMYUbvOZPG7Rgc1Eb0rkmlAh6rskenPRd5tk+ZK7QZVMu4vwcnHxh8QQzo+tiKBVatk8
         Bebqhfp2//Pxn9kVYkbP35D7JQCbpER9S0bYcqGjA/RJzlysN1QJudMFjn2I1kAOJYXD
         7zBdYiGeI0D8cbyY3lAd52a4eufATQe/zi3HUimpV+bbIwuRMD+t/K1jvQgn5rj2j5rU
         BwqS0u5cf48G0ZEAH+U/K8MzdgCsTwczQoN7RW6gQ7dtUHfCAN84dhXgIMTNitEIfyc2
         WTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bHkWFdAV3M9krxv9Lj3j/nAZf/ClE8Bcqe3SXXFRGOo=;
        b=c0Gcv3FUvldHUFuLHZTkszjX/3hxx2yl+l87Bm4hN1m8s4JpGUfip8bT1SFnN4Q9bD
         ufTDOq5DyBhi2zJznxoA4vsvHPOs9u59U7R2aPOugdQk8EYXiDIZMvyqn9XCW/wjLRx+
         2tF40g/fB2oic/f1S1/afuwTGGMeMSKZtHllNZhjaYUftc+Je+AoA+S6hIW0+7xMmXE+
         haJIn+2PrKbKCJmKp2cGKL2eEzo5c63IoCJ+kgaZQYq6cBQVva+Uf34Ui+k81V+bfHz6
         QlNlR95gZdmX9EM3TtdHQjat6qehTjejMuPJ0VVm8hh9Lzsd+3o1zR0AL+8TpIx4WLeu
         BLjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o64si1661361ybo.42.2018.02.20.10.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:04:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCH2-0008Vo-Fs
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:04:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGT-000895-9d
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGQ-0001bM-TV
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:41 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGQ-0001ae-Gr; Tue, 20 Feb 2018 13:03:38 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGP-0008Tf-9w; Tue, 20 Feb 2018 18:03:37 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:21 +0000
Message-Id: <20180220180325.29818-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 15/19] hw/misc/iotkit-secctl: Arm IoT Kit
 security controller initial skeleton
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ryZVf57aADY0

The Arm IoT Kit includes a "security controller" which is largely a
collection of registers for controlling the PPCs and other bits of
glue in the system.  This commit provides the initial skeleton of the
device, implementing just the ID registers, and a couple of read-only
read-as-zero registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/Makefile.objs           |   1 +
 include/hw/misc/iotkit-secctl.h |  39 ++++
 hw/misc/iotkit-secctl.c         | 450 ++++++++++++++++++++++++++++++++++++++++
 default-configs/arm-softmmu.mak |   1 +
 hw/misc/trace-events            |   7 +
 5 files changed, 498 insertions(+)
 create mode 100644 include/hw/misc/iotkit-secctl.h
 create mode 100644 hw/misc/iotkit-secctl.c

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index dcf413d730..00e834d0f0 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -62,6 +62,7 @@ obj-$(CONFIG_MPS2_FPGAIO) += mps2-fpgaio.o
 obj-$(CONFIG_MPS2_SCC) += mps2-scc.o
 
 obj-$(CONFIG_TZ_PPC) += tz-ppc.o
+obj-$(CONFIG_IOTKIT_SECCTL) += iotkit-secctl.o
 
 obj-$(CONFIG_PVPANIC) += pvpanic.o
 obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
new file mode 100644
index 0000000000..872f652f8d
--- /dev/null
+++ b/include/hw/misc/iotkit-secctl.h
@@ -0,0 +1,39 @@
+/*
+ * ARM IoT Kit security controller
+ *
+ * Copyright (c) 2018 Linaro Limited
+ * Written by Peter Maydell
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * (at your option) any later version.
+ */
+
+/* This is a model of the security controller which is part of the
+ * Arm IoT Kit and documented in
+ * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ *
+ * QEMU interface:
+ *  + sysbus MMIO region 0 is the "secure privilege control block" registers
+ *  + sysbus MMIO region 1 is the "non-secure privilege control block" registers
+ */
+
+#ifndef IOTKIT_SECCTL_H
+#define IOTKIT_SECCTL_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_IOTKIT_SECCTL "iotkit-secctl"
+#define IOTKIT_SECCTL(obj) OBJECT_CHECK(IoTKitSecCtl, (obj), TYPE_IOTKIT_SECCTL)
+
+typedef struct IoTKitSecCtl {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+
+    MemoryRegion s_regs;
+    MemoryRegion ns_regs;
+} IoTKitSecCtl;
+
+#endif
diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
new file mode 100644
index 0000000000..5da52e4706
--- /dev/null
+++ b/hw/misc/iotkit-secctl.c
@@ -0,0 +1,450 @@
+/*
+ * Arm IoT Kit security controller
+ *
+ * Copyright (c) 2018 Linaro Limited
+ * Written by Peter Maydell
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "trace.h"
+#include "hw/sysbus.h"
+#include "hw/registerfields.h"
+#include "hw/misc/iotkit-secctl.h"
+
+/* Registers in the secure privilege control block */
+REG32(SECRESPCFG, 0x10)
+REG32(NSCCFG, 0x14)
+REG32(SECMPCINTSTATUS, 0x1c)
+REG32(SECPPCINTSTAT, 0x20)
+REG32(SECPPCINTCLR, 0x24)
+REG32(SECPPCINTEN, 0x28)
+REG32(SECMSCINTSTAT, 0x30)
+REG32(SECMSCINTCLR, 0x34)
+REG32(SECMSCINTEN, 0x38)
+REG32(BRGINTSTAT, 0x40)
+REG32(BRGINTCLR, 0x44)
+REG32(BRGINTEN, 0x48)
+REG32(AHBNSPPC0, 0x50)
+REG32(AHBNSPPCEXP0, 0x60)
+REG32(AHBNSPPCEXP1, 0x64)
+REG32(AHBNSPPCEXP2, 0x68)
+REG32(AHBNSPPCEXP3, 0x6c)
+REG32(APBNSPPC0, 0x70)
+REG32(APBNSPPC1, 0x74)
+REG32(APBNSPPCEXP0, 0x80)
+REG32(APBNSPPCEXP1, 0x84)
+REG32(APBNSPPCEXP2, 0x88)
+REG32(APBNSPPCEXP3, 0x8c)
+REG32(AHBSPPPC0, 0x90)
+REG32(AHBSPPPCEXP0, 0xa0)
+REG32(AHBSPPPCEXP1, 0xa4)
+REG32(AHBSPPPCEXP2, 0xa8)
+REG32(AHBSPPPCEXP3, 0xac)
+REG32(APBSPPPC0, 0xb0)
+REG32(APBSPPPC1, 0xb4)
+REG32(APBSPPPCEXP0, 0xc0)
+REG32(APBSPPPCEXP1, 0xc4)
+REG32(APBSPPPCEXP2, 0xc8)
+REG32(APBSPPPCEXP3, 0xcc)
+REG32(NSMSCEXP, 0xd0)
+REG32(PID4, 0xfd0)
+REG32(PID5, 0xfd4)
+REG32(PID6, 0xfd8)
+REG32(PID7, 0xfdc)
+REG32(PID0, 0xfe0)
+REG32(PID1, 0xfe4)
+REG32(PID2, 0xfe8)
+REG32(PID3, 0xfec)
+REG32(CID0, 0xff0)
+REG32(CID1, 0xff4)
+REG32(CID2, 0xff8)
+REG32(CID3, 0xffc)
+
+/* Registers in the non-secure privilege control block */
+REG32(AHBNSPPPC0, 0x90)
+REG32(AHBNSPPPCEXP0, 0xa0)
+REG32(AHBNSPPPCEXP1, 0xa4)
+REG32(AHBNSPPPCEXP2, 0xa8)
+REG32(AHBNSPPPCEXP3, 0xac)
+REG32(APBNSPPPC0, 0xb0)
+REG32(APBNSPPPC1, 0xb4)
+REG32(APBNSPPPCEXP0, 0xc0)
+REG32(APBNSPPPCEXP1, 0xc4)
+REG32(APBNSPPPCEXP2, 0xc8)
+REG32(APBNSPPPCEXP3, 0xcc)
+/* PID and CID registers are also present in the NS block */
+
+static const uint8_t iotkit_secctl_s_idregs[] = {
+    0x04, 0x00, 0x00, 0x00,
+    0x52, 0xb8, 0x0b, 0x00,
+    0x0d, 0xf0, 0x05, 0xb1,
+};
+
+static const uint8_t iotkit_secctl_ns_idregs[] = {
+    0x04, 0x00, 0x00, 0x00,
+    0x53, 0xb8, 0x0b, 0x00,
+    0x0d, 0xf0, 0x05, 0xb1,
+};
+
+static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
+                                        uint64_t *pdata,
+                                        unsigned size, MemTxAttrs attrs)
+{
+    uint64_t r;
+    uint32_t offset = addr & ~0x3;
+
+    switch (offset) {
+    case A_AHBNSPPC0:
+    case A_AHBSPPPC0:
+        r = 0;
+        break;
+    case A_SECRESPCFG:
+    case A_NSCCFG:
+    case A_SECMPCINTSTATUS:
+    case A_SECPPCINTSTAT:
+    case A_SECPPCINTEN:
+    case A_SECMSCINTSTAT:
+    case A_SECMSCINTEN:
+    case A_BRGINTSTAT:
+    case A_BRGINTEN:
+    case A_AHBNSPPCEXP0:
+    case A_AHBNSPPCEXP1:
+    case A_AHBNSPPCEXP2:
+    case A_AHBNSPPCEXP3:
+    case A_APBNSPPC0:
+    case A_APBNSPPC1:
+    case A_APBNSPPCEXP0:
+    case A_APBNSPPCEXP1:
+    case A_APBNSPPCEXP2:
+    case A_APBNSPPCEXP3:
+    case A_AHBSPPPCEXP0:
+    case A_AHBSPPPCEXP1:
+    case A_AHBSPPPCEXP2:
+    case A_AHBSPPPCEXP3:
+    case A_APBSPPPC0:
+    case A_APBSPPPC1:
+    case A_APBSPPPCEXP0:
+    case A_APBSPPPCEXP1:
+    case A_APBSPPPCEXP2:
+    case A_APBSPPPCEXP3:
+    case A_NSMSCEXP:
+        qemu_log_mask(LOG_UNIMP,
+                      "IoTKit SecCtl S block read: "
+                      "unimplemented offset 0x%x\n", offset);
+        r = 0;
+        break;
+    case A_PID4:
+    case A_PID5:
+    case A_PID6:
+    case A_PID7:
+    case A_PID0:
+    case A_PID1:
+    case A_PID2:
+    case A_PID3:
+    case A_CID0:
+    case A_CID1:
+    case A_CID2:
+    case A_CID3:
+        r = iotkit_secctl_s_idregs[(offset - A_PID4) / 4];
+        break;
+    case A_SECPPCINTCLR:
+    case A_SECMSCINTCLR:
+    case A_BRGINTCLR:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "IotKit SecCtl S block read: write-only offset 0x%x\n",
+                      offset);
+        r = 0;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "IotKit SecCtl S block read: bad offset 0x%x\n", offset);
+        r = 0;
+        break;
+    }
+
+    if (size != 4) {
+        /* None of our registers are access-sensitive, so just pull the right
+         * byte out of the word read result.
+         */
+        r >>= 8 * (addr & 3);
+        r &= (1 << (size * 8)) - 1;
+    }
+
+    trace_iotkit_secctl_s_read(offset, r, size);
+    *pdata = r;
+    return MEMTX_OK;
+}
+
+static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
+                                         uint64_t value,
+                                         unsigned size, MemTxAttrs attrs)
+{
+    uint32_t offset = addr;
+
+    trace_iotkit_secctl_s_write(offset, value, size);
+
+    if (size != 4) {
+        /* Byte and halfword writes are ignored */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "IotKit SecCtl S block write: bad size, ignored\n");
+        return MEMTX_OK;
+    }
+
+    switch (offset) {
+    case A_SECRESPCFG:
+    case A_NSCCFG:
+    case A_SECPPCINTCLR:
+    case A_SECPPCINTEN:
+    case A_SECMSCINTCLR:
+    case A_SECMSCINTEN:
+    case A_BRGINTCLR:
+    case A_BRGINTEN:
+    case A_AHBNSPPCEXP0:
+    case A_AHBNSPPCEXP1:
+    case A_AHBNSPPCEXP2:
+    case A_AHBNSPPCEXP3:
+    case A_APBNSPPC0:
+    case A_APBNSPPC1:
+    case A_APBNSPPCEXP0:
+    case A_APBNSPPCEXP1:
+    case A_APBNSPPCEXP2:
+    case A_APBNSPPCEXP3:
+    case A_AHBSPPPCEXP0:
+    case A_AHBSPPPCEXP1:
+    case A_AHBSPPPCEXP2:
+    case A_AHBSPPPCEXP3:
+    case A_APBSPPPC0:
+    case A_APBSPPPC1:
+    case A_APBSPPPCEXP0:
+    case A_APBSPPPCEXP1:
+    case A_APBSPPPCEXP2:
+    case A_APBSPPPCEXP3:
+        qemu_log_mask(LOG_UNIMP,
+                      "IoTKit SecCtl S block write: "
+                      "unimplemented offset 0x%x\n", offset);
+        break;
+    case A_SECMPCINTSTATUS:
+    case A_SECPPCINTSTAT:
+    case A_SECMSCINTSTAT:
+    case A_BRGINTSTAT:
+    case A_AHBNSPPC0:
+    case A_AHBSPPPC0:
+    case A_NSMSCEXP:
+    case A_PID4:
+    case A_PID5:
+    case A_PID6:
+    case A_PID7:
+    case A_PID0:
+    case A_PID1:
+    case A_PID2:
+    case A_PID3:
+    case A_CID0:
+    case A_CID1:
+    case A_CID2:
+    case A_CID3:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "IoTKit SecCtl S block write: "
+                      "read-only offset 0x%x\n", offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "IotKit SecCtl S block write: bad offset 0x%x\n",
+                      offset);
+        break;
+    }
+
+    return MEMTX_OK;
+}
+
+static MemTxResult iotkit_secctl_ns_read(void *opaque, hwaddr addr,
+                                         uint64_t *pdata,
+                                         unsigned size, MemTxAttrs attrs)
+{
+    uint64_t r;
+    uint32_t offset = addr & ~0x3;
+
+    switch (offset) {
+    case A_AHBNSPPPC0:
+        r = 0;
+        break;
+    case A_AHBNSPPPCEXP0:
+    case A_AHBNSPPPCEXP1:
+    case A_AHBNSPPPCEXP2:
+    case A_AHBNSPPPCEXP3:
+    case A_APBNSPPPC0:
+    case A_APBNSPPPC1:
+    case A_APBNSPPPCEXP0:
+    case A_APBNSPPPCEXP1:
+    case A_APBNSPPPCEXP2:
+    case A_APBNSPPPCEXP3:
+        qemu_log_mask(LOG_UNIMP,
+                      "IoTKit SecCtl NS block read: "
+                      "unimplemented offset 0x%x\n", offset);
+        break;
+    case A_PID4:
+    case A_PID5:
+    case A_PID6:
+    case A_PID7:
+    case A_PID0:
+    case A_PID1:
+    case A_PID2:
+    case A_PID3:
+    case A_CID0:
+    case A_CID1:
+    case A_CID2:
+    case A_CID3:
+        r = iotkit_secctl_ns_idregs[(offset - A_PID4) / 4];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "IotKit SecCtl NS block write: bad offset 0x%x\n",
+                      offset);
+        r = 0;
+        break;
+    }
+
+    if (size != 4) {
+        /* None of our registers are access-sensitive, so just pull the right
+         * byte out of the word read result.
+         */
+        r >>= 8 * (addr & 3);
+        r &= (1 << (size * 8)) - 1;
+    }
+
+    trace_iotkit_secctl_ns_read(offset, r, size);
+    *pdata = r;
+    return MEMTX_OK;
+}
+
+static MemTxResult iotkit_secctl_ns_write(void *opaque, hwaddr addr,
+                                          uint64_t value,
+                                          unsigned size, MemTxAttrs attrs)
+{
+    uint32_t offset = addr;
+
+    trace_iotkit_secctl_ns_write(offset, value, size);
+
+    if (size != 4) {
+        /* Byte and halfword writes are ignored */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "IotKit SecCtl NS block write: bad size, ignored\n");
+        return MEMTX_OK;
+    }
+
+    switch (offset) {
+    case A_AHBNSPPPCEXP0:
+    case A_AHBNSPPPCEXP1:
+    case A_AHBNSPPPCEXP2:
+    case A_AHBNSPPPCEXP3:
+    case A_APBNSPPPC0:
+    case A_APBNSPPPC1:
+    case A_APBNSPPPCEXP0:
+    case A_APBNSPPPCEXP1:
+    case A_APBNSPPPCEXP2:
+    case A_APBNSPPPCEXP3:
+        qemu_log_mask(LOG_UNIMP,
+                      "IoTKit SecCtl NS block write: "
+                      "unimplemented offset 0x%x\n", offset);
+        break;
+    case A_AHBNSPPPC0:
+    case A_PID4:
+    case A_PID5:
+    case A_PID6:
+    case A_PID7:
+    case A_PID0:
+    case A_PID1:
+    case A_PID2:
+    case A_PID3:
+    case A_CID0:
+    case A_CID1:
+    case A_CID2:
+    case A_CID3:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "IoTKit SecCtl NS block write: "
+                      "read-only offset 0x%x\n", offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "IotKit SecCtl NS block write: bad offset 0x%x\n",
+                      offset);
+        break;
+    }
+
+    return MEMTX_OK;
+}
+
+static const MemoryRegionOps iotkit_secctl_s_ops = {
+    .read_with_attrs = iotkit_secctl_s_read,
+    .write_with_attrs = iotkit_secctl_s_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
+    .impl.min_access_size = 1,
+    .impl.max_access_size = 4,
+};
+
+static const MemoryRegionOps iotkit_secctl_ns_ops = {
+    .read_with_attrs = iotkit_secctl_ns_read,
+    .write_with_attrs = iotkit_secctl_ns_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
+    .impl.min_access_size = 1,
+    .impl.max_access_size = 4,
+};
+
+static void iotkit_secctl_reset(DeviceState *dev)
+{
+
+}
+
+static void iotkit_secctl_init(Object *obj)
+{
+    IoTKitSecCtl *s = IOTKIT_SECCTL(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    memory_region_init_io(&s->s_regs, obj, &iotkit_secctl_s_ops,
+                          s, "iotkit-secctl-s-regs", 0x1000);
+    memory_region_init_io(&s->ns_regs, obj, &iotkit_secctl_ns_ops,
+                          s, "iotkit-secctl-ns-regs", 0x1000);
+    sysbus_init_mmio(sbd, &s->s_regs);
+    sysbus_init_mmio(sbd, &s->ns_regs);
+}
+
+static const VMStateDescription iotkit_secctl_vmstate = {
+    .name = "iotkit-secctl",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void iotkit_secctl_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &iotkit_secctl_vmstate;
+    dc->reset = iotkit_secctl_reset;
+}
+
+static const TypeInfo iotkit_secctl_info = {
+    .name = TYPE_IOTKIT_SECCTL,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IoTKitSecCtl),
+    .instance_init = iotkit_secctl_init,
+    .class_init = iotkit_secctl_class_init,
+};
+
+static void iotkit_secctl_register_types(void)
+{
+    type_register_static(&iotkit_secctl_info);
+}
+
+type_init(iotkit_secctl_register_types);
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 6aa564b754..a2057908f0 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -104,6 +104,7 @@ CONFIG_MPS2_FPGAIO=y
 CONFIG_MPS2_SCC=y
 
 CONFIG_TZ_PPC=y
+CONFIG_IOTKIT_SECCTL=y
 
 CONFIG_VERSATILE_PCI=y
 CONFIG_VERSATILE_I2C=y
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 0b638de682..eb5ffcc0a8 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -94,3 +94,10 @@ tz_ppc_irq_clear(int level) "TZ PPC: int_clear = %d"
 tz_ppc_update_irq(int level) "TZ PPC: setting irq line to %d"
 tz_ppc_read_blocked(int n, hwaddr offset, bool secure, bool user) "TZ PPC: port %d offset 0x%" HWADDR_PRIx " read (secure %d user %d) blocked"
 tz_ppc_write_blocked(int n, hwaddr offset, bool secure, bool user) "TZ PPC: port %d offset 0x%" HWADDR_PRIx " write (secure %d user %d) blocked"
+
+# hw/misc/iotkit-secctl.c
+iotkit_secctl_s_read(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl S regs read: offset 0x%x data 0x%" PRIx64 " size %u"
+iotkit_secctl_s_write(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl S regs write: offset 0x%x data 0x%" PRIx64 " size %u"
+iotkit_secctl_ns_read(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl NS regs read: offset 0x%x data 0x%" PRIx64 " size %u"
+iotkit_secctl_ns_write(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl NS regs write: offset 0x%x data 0x%" PRIx64 " size %u"
+iotkit_secctl_reset(void) "IoTKit SecCtl: reset"
-- 
2.16.1

