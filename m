Received: by 10.28.173.206 with SMTP id w197csp6872366wme;
        Thu, 18 Jan 2018 10:46:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBovv269pjOJbNYQUpUJUqRGZ3vqz8oFF4qM54w4QwOWhp1tXHQDVyJJtz0HDkRrDu4+PQ5mA
X-Received: by 10.37.129.131 with SMTP id p3mr3940643ybk.197.1516301168360;
        Thu, 18 Jan 2018 10:46:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516301168; cv=none;
        d=google.com; s=arc-20160816;
        b=J4/Ny9Y3iaSwB15eRCzg19UgyOezQhDmE0iOsi1MHYoNMTTrUlHSfyNv9fPz+h5JmP
         GPr94rQjh4JbI8/aEhRtgJoCarMkSu0ssh+mumKLUo24OqwAWOZJgL9DQ09xpM+/U2MO
         bH9XHHy4Hdust5nieuX9bvwgOMJoNKbP79bo2ASsy3gUA+bdrk0c5eNWWlQWIAQrRh5F
         liwYMtT2DAbr0b1RKRdcfK4Ub2Ma1IqSRCI1LIg/vaBboY/ubc/yGfc6bm5u8Iu3svlU
         rz8OU9xR++Z4Dpb86M+LKZMwBgfoLpqbc8X3d8dy1/7tVE6eRBgMSG1eKmD2QwlsbvZV
         7C1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=FehujpD9a1t4Zt1sDMdr2/ZV5kNXTI42+z3aCPAUgjY=;
        b=WnWVzw+2LNHA5/CqMFXY9X15v3ePvvKilNbfrwapKSJ5UIwYoOFpwSPBX+q3B4Ha2L
         /NZ7JUEsi6oWqFkP5/l+hIRrPBBPaQBzCqDAUgtQYRW/tuznjQMilVnk+YD+zTCSha2b
         yS6pS0izkkcOC6JtUalfk03t9P/qb4Gv3g2Y8W+LfnMMetVGfcfCgNEVOMz3caU2jhnC
         9Tj8xmeQam48S4wcbVIN55gNhMymS+fT//ONe3eGA7h4SGJuKJpWX5Wfx9YKwoVkSZIT
         f5EFtOJEywRJyAaCdCBr9EcKABnkfJGXS+VLIRHEox6rQntyqXSNYyiO19MiHU7+IRuy
         B4Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OlX82UB3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l67si1896730ywf.739.2018.01.18.10.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:46:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OlX82UB3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecFCR-0002It-Lz
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:46:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF9A-0007t0-DQ
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 13:42:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecF97-0003Du-L3
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 13:42:44 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:40102)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecF8z-00037A-AC; Thu, 18 Jan 2018 13:42:33 -0500
Received: by mail-pg0-x241.google.com with SMTP id g16so8380910pgn.7;
	Thu, 18 Jan 2018 10:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FehujpD9a1t4Zt1sDMdr2/ZV5kNXTI42+z3aCPAUgjY=;
	b=OlX82UB3aI4hqmlYzzL9eunBYpdpWrVTfndlaFI2tRT9bsLruKSZKMP+2EPC1ey/EH
	Eo/qK+7rDSr1Heu3fmqGS4fry/FFTfeVfIQtvAwu/Lnr5hpR5DtKFS9Sxc50XN4rrVht
	WXnAKN1Hgn1dT0rBbQ8A5tC5PvQkypdzt34wvD1E3Rx5erKBnyxacpGMAK7kSuteSjXF
	ZKTt432p/nabeMlfvMMS7Y8B6RbvpGzHVApPT7IItVc4Gu4bQSKg9FLQZLMXNoODgUQv
	0GBemRDGkDueZOu9z1lMCmj+NLWq3eLS4ICtlYtDRnBz/nfujG/F8OA9jKHpaXuXl6YV
	EnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=FehujpD9a1t4Zt1sDMdr2/ZV5kNXTI42+z3aCPAUgjY=;
	b=p5f3YooPQCfB6hJIhZVosGjYItlmmqmw8Z8Qz6P8CB3lu67N7uNp2w9k81CA+Lijgm
	Z4iNKuh0cNVjnAPRc4TJyvmP6Q2aq1se0uHiAxwfaVaXwiVfOYGDXcPdTOx6i1Z1xhIZ
	cikVYpcBoy76zKGHEE6gBHGg8cKRXHaeFTaCabeQQyp27wmBC3Y2MwMVybhpGQGLYYS4
	vPB+DNyD4zRq+3xo9EC8V014lC8OvVbLRddXXJ5eYqYcZLMvE9Ve5zRvEoa9Z80NQO+K
	v5SH8QVvJ5rJBL9jOQEfEtZEXIDzA1lHvKFC82WKxIllU7k+wUVZHT0JHM6lQaNRd7FB
	hfyw==
X-Gm-Message-State: AKGB3mLBi+TiTOckl5t5OXZxMNTTRvnmogjpxPKDTkEck4wTYskqWfoG
	Z9kNYfKPJqDuCwXDFZ4mSsghb0UAcwk=
X-Received: by 10.98.66.67 with SMTP id p64mr36534006pfa.227.1516300951733;
	Thu, 18 Jan 2018 10:42:31 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	d6sm13984417pfc.35.2018.01.18.10.42.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Jan 2018 10:42:30 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Thu, 18 Jan 2018 10:38:06 -0800
Message-Id: <406cec176afe5821bece00c94f1030948373d5c1.1516300623.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516300623.git.alistair.francis@xilinx.com>
References: <cover.1516300623.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v6 5/9] xlnx-pmu-iomod-intc: Add the PMU
 Interrupt controller
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9XJAh+HReYa/

Add the PMU IO Module Interrupt controller device.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

 default-configs/microblaze-softmmu.mak |   1 +
 include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
 hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++++++
 hw/intc/Makefile.objs                  |   1 +
 4 files changed, 614 insertions(+)
 create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h
 create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c

diff --git a/default-configs/microblaze-softmmu.mak b/default-configs/microblaze-softmmu.mak
index ce2630818a..7fca8e4c99 100644
--- a/default-configs/microblaze-softmmu.mak
+++ b/default-configs/microblaze-softmmu.mak
@@ -9,3 +9,4 @@ CONFIG_XILINX_SPI=y
 CONFIG_XILINX_ETHLITE=y
 CONFIG_SSI=y
 CONFIG_SSI_M25P80=y
+CONFIG_XLNX_ZYNQMP=y
diff --git a/include/hw/intc/xlnx-pmu-iomod-intc.h b/include/hw/intc/xlnx-pmu-iomod-intc.h
new file mode 100644
index 0000000000..3478d8cf6c
--- /dev/null
+++ b/include/hw/intc/xlnx-pmu-iomod-intc.h
@@ -0,0 +1,58 @@
+/*
+ * QEMU model of Xilinx I/O Module Interrupt Controller
+ *
+ * Copyright (c) 2014 Xilinx Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef XLNX_PMU_IO_INTC_H
+#define XLNX_PMU_IO_INTC_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_XLNX_PMU_IO_INTC "xlnx.pmu_io_intc"
+
+#define XLNX_PMU_IO_INTC(obj) \
+     OBJECT_CHECK(XlnxPMUIOIntc, (obj), TYPE_XLNX_PMU_IO_INTC)
+
+/* This is R_PIT3_CONTROL + 1 */
+#define XlnxPMUIOIntc_R_MAX (0x78 + 1)
+
+typedef struct XlnxPMUIOIntc {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+
+    qemu_irq parent_irq;
+
+    struct {
+        uint32_t intr_size;
+        uint32_t level_edge;
+        uint32_t positive;
+    } cfg;
+
+    uint32_t irq_raw;
+
+    uint32_t regs[XlnxPMUIOIntc_R_MAX];
+    RegisterInfo regs_info[XlnxPMUIOIntc_R_MAX];
+} XlnxPMUIOIntc;
+
+#endif /* XLNX_PMU_IO_INTC_H */
diff --git a/hw/intc/xlnx-pmu-iomod-intc.c b/hw/intc/xlnx-pmu-iomod-intc.c
new file mode 100644
index 0000000000..1ce2f4fa6b
--- /dev/null
+++ b/hw/intc/xlnx-pmu-iomod-intc.c
@@ -0,0 +1,554 @@
+/*
+ * QEMU model of Xilinx I/O Module Interrupt Controller
+ *
+ * Copyright (c) 2013 Xilinx Inc
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "hw/intc/xlnx-pmu-iomod-intc.h"
+
+#ifndef XLNX_PMU_IO_INTC_ERR_DEBUG
+#define XLNX_PMU_IO_INTC_ERR_DEBUG 0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do {\
+    if (XLNX_PMU_IO_INTC_ERR_DEBUG >= lvl) {\
+        qemu_log(TYPE_XLNX_PMU_IO_INTC ": %s:" fmt, __func__, ## args);\
+    } \
+} while (0)
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+REG32(IRQ_MODE, 0xc)
+REG32(GPO0, 0x10)
+    FIELD(GPO0, MAGIC_WORD_1, 24, 8)
+    FIELD(GPO0, MAGIC_WORD_2, 16, 8)
+    FIELD(GPO0, FT_INJECT_FAILURE, 13, 3)
+    FIELD(GPO0, DISABLE_RST_FTSM, 12, 1)
+    FIELD(GPO0, RST_FTSM, 11, 1)
+    FIELD(GPO0, CLR_FTSTS, 10, 1)
+    FIELD(GPO0, RST_ON_SLEEP, 9, 1)
+    FIELD(GPO0, DISABLE_TRACE_COMP, 8, 1)
+    FIELD(GPO0, PIT3_PRESCALE, 7, 1)
+    FIELD(GPO0, PIT2_PRESCALE, 5, 2)
+    FIELD(GPO0, PIT1_PRESCALE, 3, 2)
+    FIELD(GPO0, PIT0_PRESCALE, 1, 2)
+    FIELD(GPO0, DEBUG_REMAP, 0, 1)
+REG32(GPO1, 0x14)
+    FIELD(GPO1, MIO_5, 5, 1)
+    FIELD(GPO1, MIO_4, 4, 1)
+    FIELD(GPO1, MIO_3, 3, 1)
+    FIELD(GPO1, MIO_2, 2, 1)
+    FIELD(GPO1, MIO_1, 1, 1)
+    FIELD(GPO1, MIO_0, 0, 1)
+REG32(GPO2, 0x18)
+    FIELD(GPO2, DAP_RPU_WAKE_ACK, 9, 1)
+    FIELD(GPO2, DAP_FP_WAKE_ACK, 8, 1)
+    FIELD(GPO2, PS_STATUS, 7, 1)
+    FIELD(GPO2, PCAP_EN, 6, 1)
+REG32(GPO3, 0x1c)
+    FIELD(GPO3, PL_GPO_31, 31, 1)
+    FIELD(GPO3, PL_GPO_30, 30, 1)
+    FIELD(GPO3, PL_GPO_29, 29, 1)
+    FIELD(GPO3, PL_GPO_28, 28, 1)
+    FIELD(GPO3, PL_GPO_27, 27, 1)
+    FIELD(GPO3, PL_GPO_26, 26, 1)
+    FIELD(GPO3, PL_GPO_25, 25, 1)
+    FIELD(GPO3, PL_GPO_24, 24, 1)
+    FIELD(GPO3, PL_GPO_23, 23, 1)
+    FIELD(GPO3, PL_GPO_22, 22, 1)
+    FIELD(GPO3, PL_GPO_21, 21, 1)
+    FIELD(GPO3, PL_GPO_20, 20, 1)
+    FIELD(GPO3, PL_GPO_19, 19, 1)
+    FIELD(GPO3, PL_GPO_18, 18, 1)
+    FIELD(GPO3, PL_GPO_17, 17, 1)
+    FIELD(GPO3, PL_GPO_16, 16, 1)
+    FIELD(GPO3, PL_GPO_15, 15, 1)
+    FIELD(GPO3, PL_GPO_14, 14, 1)
+    FIELD(GPO3, PL_GPO_13, 13, 1)
+    FIELD(GPO3, PL_GPO_12, 12, 1)
+    FIELD(GPO3, PL_GPO_11, 11, 1)
+    FIELD(GPO3, PL_GPO_10, 10, 1)
+    FIELD(GPO3, PL_GPO_9, 9, 1)
+    FIELD(GPO3, PL_GPO_8, 8, 1)
+    FIELD(GPO3, PL_GPO_7, 7, 1)
+    FIELD(GPO3, PL_GPO_6, 6, 1)
+    FIELD(GPO3, PL_GPO_5, 5, 1)
+    FIELD(GPO3, PL_GPO_4, 4, 1)
+    FIELD(GPO3, PL_GPO_3, 3, 1)
+    FIELD(GPO3, PL_GPO_2, 2, 1)
+    FIELD(GPO3, PL_GPO_1, 1, 1)
+    FIELD(GPO3, PL_GPO_0, 0, 1)
+REG32(GPI0, 0x20)
+    FIELD(GPI0, RFT_ECC_FATAL_ERR, 31, 1)
+    FIELD(GPI0, RFT_VOTER_ERR, 30, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_23, 29, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_13, 28, 1)
+    FIELD(GPI0, RFT_COMPARE_ERR_12, 27, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_23_B, 26, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_13_B, 25, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_12_B, 24, 1)
+    FIELD(GPI0, RFT_MISMATCH_STATE, 23, 1)
+    FIELD(GPI0, RFT_MISMATCH_CPU, 22, 1)
+    FIELD(GPI0, RFT_SLEEP_RESET, 19, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_23_A, 18, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_13_A, 17, 1)
+    FIELD(GPI0, RFT_LS_MISMATCH_12_A, 16, 1)
+    FIELD(GPI0, NFT_ECC_FATAL_ERR, 15, 1)
+    FIELD(GPI0, NFT_VOTER_ERR, 14, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_23, 13, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_13, 12, 1)
+    FIELD(GPI0, NFT_COMPARE_ERR_12, 11, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_23_B, 10, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_13_B, 9, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_12_B, 8, 1)
+    FIELD(GPI0, NFT_MISMATCH_STATE, 7, 1)
+    FIELD(GPI0, NFT_MISMATCH_CPU, 6, 1)
+    FIELD(GPI0, NFT_SLEEP_RESET, 3, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_23_A, 2, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_13_A, 1, 1)
+    FIELD(GPI0, NFT_LS_MISMATCH_12_A, 0, 1)
+REG32(GPI1, 0x24)
+    FIELD(GPI1, APB_AIB_ERROR, 31, 1)
+    FIELD(GPI1, AXI_AIB_ERROR, 30, 1)
+    FIELD(GPI1, ERROR_2, 29, 1)
+    FIELD(GPI1, ERROR_1, 28, 1)
+    FIELD(GPI1, ACPU_3_DBG_PWRUP, 23, 1)
+    FIELD(GPI1, ACPU_2_DBG_PWRUP, 22, 1)
+    FIELD(GPI1, ACPU_1_DBG_PWRUP, 21, 1)
+    FIELD(GPI1, ACPU_0_DBG_PWRUP, 20, 1)
+    FIELD(GPI1, FPD_WAKE_GIC_PROXY, 16, 1)
+    FIELD(GPI1, MIO_WAKE_5, 15, 1)
+    FIELD(GPI1, MIO_WAKE_4, 14, 1)
+    FIELD(GPI1, MIO_WAKE_3, 13, 1)
+    FIELD(GPI1, MIO_WAKE_2, 12, 1)
+    FIELD(GPI1, MIO_WAKE_1, 11, 1)
+    FIELD(GPI1, MIO_WAKE_0, 10, 1)
+    FIELD(GPI1, DAP_RPU_WAKE, 9, 1)
+    FIELD(GPI1, DAP_FPD_WAKE, 8, 1)
+    FIELD(GPI1, USB_1_WAKE, 7, 1)
+    FIELD(GPI1, USB_0_WAKE, 6, 1)
+    FIELD(GPI1, R5_1_WAKE, 5, 1)
+    FIELD(GPI1, R5_0_WAKE, 4, 1)
+    FIELD(GPI1, ACPU_3_WAKE, 3, 1)
+    FIELD(GPI1, ACPU_2_WAKE, 2, 1)
+    FIELD(GPI1, ACPU_1_WAKE, 1, 1)
+    FIELD(GPI1, ACPU_0_WAKE, 0, 1)
+REG32(GPI2, 0x28)
+    FIELD(GPI2, VCC_INT_FP_DISCONNECT, 31, 1)
+    FIELD(GPI2, VCC_INT_DISCONNECT, 30, 1)
+    FIELD(GPI2, VCC_AUX_DISCONNECT, 29, 1)
+    FIELD(GPI2, DBG_ACPU3_RST_REQ, 23, 1)
+    FIELD(GPI2, DBG_ACPU2_RST_REQ, 22, 1)
+    FIELD(GPI2, DBG_ACPU1_RST_REQ, 21, 1)
+    FIELD(GPI2, DBG_ACPU0_RST_REQ, 20, 1)
+    FIELD(GPI2, CP_ACPU3_RST_REQ, 19, 1)
+    FIELD(GPI2, CP_ACPU2_RST_REQ, 18, 1)
+    FIELD(GPI2, CP_ACPU1_RST_REQ, 17, 1)
+    FIELD(GPI2, CP_ACPU0_RST_REQ, 16, 1)
+    FIELD(GPI2, DBG_RCPU1_RST_REQ, 9, 1)
+    FIELD(GPI2, DBG_RCPU0_RST_REQ, 8, 1)
+    FIELD(GPI2, R5_1_SLEEP, 5, 1)
+    FIELD(GPI2, R5_0_SLEEP, 4, 1)
+    FIELD(GPI2, ACPU_3_SLEEP, 3, 1)
+    FIELD(GPI2, ACPU_2_SLEEP, 2, 1)
+    FIELD(GPI2, ACPU_1_SLEEP, 1, 1)
+    FIELD(GPI2, ACPU_0_SLEEP, 0, 1)
+REG32(GPI3, 0x2c)
+    FIELD(GPI3, PL_GPI_31, 31, 1)
+    FIELD(GPI3, PL_GPI_30, 30, 1)
+    FIELD(GPI3, PL_GPI_29, 29, 1)
+    FIELD(GPI3, PL_GPI_28, 28, 1)
+    FIELD(GPI3, PL_GPI_27, 27, 1)
+    FIELD(GPI3, PL_GPI_26, 26, 1)
+    FIELD(GPI3, PL_GPI_25, 25, 1)
+    FIELD(GPI3, PL_GPI_24, 24, 1)
+    FIELD(GPI3, PL_GPI_23, 23, 1)
+    FIELD(GPI3, PL_GPI_22, 22, 1)
+    FIELD(GPI3, PL_GPI_21, 21, 1)
+    FIELD(GPI3, PL_GPI_20, 20, 1)
+    FIELD(GPI3, PL_GPI_19, 19, 1)
+    FIELD(GPI3, PL_GPI_18, 18, 1)
+    FIELD(GPI3, PL_GPI_17, 17, 1)
+    FIELD(GPI3, PL_GPI_16, 16, 1)
+    FIELD(GPI3, PL_GPI_15, 15, 1)
+    FIELD(GPI3, PL_GPI_14, 14, 1)
+    FIELD(GPI3, PL_GPI_13, 13, 1)
+    FIELD(GPI3, PL_GPI_12, 12, 1)
+    FIELD(GPI3, PL_GPI_11, 11, 1)
+    FIELD(GPI3, PL_GPI_10, 10, 1)
+    FIELD(GPI3, PL_GPI_9, 9, 1)
+    FIELD(GPI3, PL_GPI_8, 8, 1)
+    FIELD(GPI3, PL_GPI_7, 7, 1)
+    FIELD(GPI3, PL_GPI_6, 6, 1)
+    FIELD(GPI3, PL_GPI_5, 5, 1)
+    FIELD(GPI3, PL_GPI_4, 4, 1)
+    FIELD(GPI3, PL_GPI_3, 3, 1)
+    FIELD(GPI3, PL_GPI_2, 2, 1)
+    FIELD(GPI3, PL_GPI_1, 1, 1)
+    FIELD(GPI3, PL_GPI_0, 0, 1)
+REG32(IRQ_STATUS, 0x30)
+    FIELD(IRQ_STATUS, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_STATUS, INV_ADDR, 29, 1)
+    FIELD(IRQ_STATUS, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_STATUS, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_STATUS, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_STATUS, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_STATUS, ISO_REQ, 24, 1)
+    FIELD(IRQ_STATUS, FW_REQ, 23, 1)
+    FIELD(IRQ_STATUS, IPI3, 22, 1)
+    FIELD(IRQ_STATUS, IPI2, 21, 1)
+    FIELD(IRQ_STATUS, IPI1, 20, 1)
+    FIELD(IRQ_STATUS, IPI0, 19, 1)
+    FIELD(IRQ_STATUS, RTC_ALARM, 18, 1)
+    FIELD(IRQ_STATUS, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_STATUS, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_STATUS, GPI3, 14, 1)
+    FIELD(IRQ_STATUS, GPI2, 13, 1)
+    FIELD(IRQ_STATUS, GPI1, 12, 1)
+    FIELD(IRQ_STATUS, GPI0, 11, 1)
+    FIELD(IRQ_STATUS, PIT3, 6, 1)
+    FIELD(IRQ_STATUS, PIT2, 5, 1)
+    FIELD(IRQ_STATUS, PIT1, 4, 1)
+    FIELD(IRQ_STATUS, PIT0, 3, 1)
+REG32(IRQ_PENDING, 0x34)
+    FIELD(IRQ_PENDING, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_PENDING, INV_ADDR, 29, 1)
+    FIELD(IRQ_PENDING, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_PENDING, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_PENDING, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_PENDING, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_PENDING, ISO_REQ, 24, 1)
+    FIELD(IRQ_PENDING, FW_REQ, 23, 1)
+    FIELD(IRQ_PENDING, IPI3, 22, 1)
+    FIELD(IRQ_PENDING, IPI2, 21, 1)
+    FIELD(IRQ_PENDING, IPI1, 20, 1)
+    FIELD(IRQ_PENDING, IPI0, 19, 1)
+    FIELD(IRQ_PENDING, RTC_ALARM, 18, 1)
+    FIELD(IRQ_PENDING, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_PENDING, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_PENDING, GPI3, 14, 1)
+    FIELD(IRQ_PENDING, GPI2, 13, 1)
+    FIELD(IRQ_PENDING, GPI1, 12, 1)
+    FIELD(IRQ_PENDING, GPI0, 11, 1)
+    FIELD(IRQ_PENDING, PIT3, 6, 1)
+    FIELD(IRQ_PENDING, PIT2, 5, 1)
+    FIELD(IRQ_PENDING, PIT1, 4, 1)
+    FIELD(IRQ_PENDING, PIT0, 3, 1)
+REG32(IRQ_ENABLE, 0x38)
+    FIELD(IRQ_ENABLE, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_ENABLE, INV_ADDR, 29, 1)
+    FIELD(IRQ_ENABLE, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_ENABLE, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_ENABLE, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_ENABLE, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_ENABLE, ISO_REQ, 24, 1)
+    FIELD(IRQ_ENABLE, FW_REQ, 23, 1)
+    FIELD(IRQ_ENABLE, IPI3, 22, 1)
+    FIELD(IRQ_ENABLE, IPI2, 21, 1)
+    FIELD(IRQ_ENABLE, IPI1, 20, 1)
+    FIELD(IRQ_ENABLE, IPI0, 19, 1)
+    FIELD(IRQ_ENABLE, RTC_ALARM, 18, 1)
+    FIELD(IRQ_ENABLE, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_ENABLE, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_ENABLE, GPI3, 14, 1)
+    FIELD(IRQ_ENABLE, GPI2, 13, 1)
+    FIELD(IRQ_ENABLE, GPI1, 12, 1)
+    FIELD(IRQ_ENABLE, GPI0, 11, 1)
+    FIELD(IRQ_ENABLE, PIT3, 6, 1)
+    FIELD(IRQ_ENABLE, PIT2, 5, 1)
+    FIELD(IRQ_ENABLE, PIT1, 4, 1)
+    FIELD(IRQ_ENABLE, PIT0, 3, 1)
+REG32(IRQ_ACK, 0x3c)
+    FIELD(IRQ_ACK, CSU_PMU_SEC_LOCK, 31, 1)
+    FIELD(IRQ_ACK, INV_ADDR, 29, 1)
+    FIELD(IRQ_ACK, PWR_DN_REQ, 28, 1)
+    FIELD(IRQ_ACK, PWR_UP_REQ, 27, 1)
+    FIELD(IRQ_ACK, SW_RST_REQ, 26, 1)
+    FIELD(IRQ_ACK, HW_RST_REQ, 25, 1)
+    FIELD(IRQ_ACK, ISO_REQ, 24, 1)
+    FIELD(IRQ_ACK, FW_REQ, 23, 1)
+    FIELD(IRQ_ACK, IPI3, 22, 1)
+    FIELD(IRQ_ACK, IPI2, 21, 1)
+    FIELD(IRQ_ACK, IPI1, 20, 1)
+    FIELD(IRQ_ACK, IPI0, 19, 1)
+    FIELD(IRQ_ACK, RTC_ALARM, 18, 1)
+    FIELD(IRQ_ACK, RTC_EVERY_SECOND, 17, 1)
+    FIELD(IRQ_ACK, CORRECTABLE_ECC, 16, 1)
+    FIELD(IRQ_ACK, GPI3, 14, 1)
+    FIELD(IRQ_ACK, GPI2, 13, 1)
+    FIELD(IRQ_ACK, GPI1, 12, 1)
+    FIELD(IRQ_ACK, GPI0, 11, 1)
+    FIELD(IRQ_ACK, PIT3, 6, 1)
+    FIELD(IRQ_ACK, PIT2, 5, 1)
+    FIELD(IRQ_ACK, PIT1, 4, 1)
+    FIELD(IRQ_ACK, PIT0, 3, 1)
+REG32(PIT0_PRELOAD, 0x40)
+REG32(PIT0_COUNTER, 0x44)
+REG32(PIT0_CONTROL, 0x48)
+    FIELD(PIT0_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT0_CONTROL, EN, 0, 1)
+REG32(PIT1_PRELOAD, 0x50)
+REG32(PIT1_COUNTER, 0x54)
+REG32(PIT1_CONTROL, 0x58)
+    FIELD(PIT1_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT1_CONTROL, EN, 0, 1)
+REG32(PIT2_PRELOAD, 0x60)
+REG32(PIT2_COUNTER, 0x64)
+REG32(PIT2_CONTROL, 0x68)
+    FIELD(PIT2_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT2_CONTROL, EN, 0, 1)
+REG32(PIT3_PRELOAD, 0x70)
+REG32(PIT3_COUNTER, 0x74)
+REG32(PIT3_CONTROL, 0x78)
+    FIELD(PIT3_CONTROL, PRELOAD, 1, 1)
+    FIELD(PIT3_CONTROL, EN, 0, 1)
+
+static void xlnx_pmu_io_irq_update(XlnxPMUIOIntc *s)
+{
+    bool irq_out;
+
+    s->regs[R_IRQ_PENDING] = s->regs[R_IRQ_STATUS] & s->regs[R_IRQ_ENABLE];
+    irq_out = !!s->regs[R_IRQ_PENDING];
+
+    DB_PRINT("Setting IRQ output = %d\n", irq_out);
+
+    qemu_set_irq(s->parent_irq, irq_out);
+}
+
+static void xlnx_pmu_io_irq_enable_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(reg->opaque);
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static void xlnx_pmu_io_irq_ack_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(reg->opaque);
+    uint32_t val = val64;
+
+    /* Only clear */
+    val &= s->regs[R_IRQ_STATUS];
+    s->regs[R_IRQ_STATUS] ^= val;
+
+    /* Active level triggered interrupts stay high.  */
+    s->regs[R_IRQ_STATUS] |= s->irq_raw & ~s->cfg.level_edge;
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static const RegisterAccessInfo xlnx_pmu_io_intc_regs_info[] = {
+    {   .name = "IRQ_MODE",  .addr = A_IRQ_MODE,
+        .rsvd = 0xffffffff,
+    },{ .name = "GPO0",  .addr = A_GPO0,
+    },{ .name = "GPO1",  .addr = A_GPO1,
+        .rsvd = 0xffffffc0,
+    },{ .name = "GPO2",  .addr = A_GPO2,
+        .rsvd = 0xfffffc3f,
+    },{ .name = "GPO3",  .addr = A_GPO3,
+    },{ .name = "GPI0",  .addr = A_GPI0,
+        .rsvd = 0x300030,
+        .ro = 0xffcfffcf,
+    },{ .name = "GPI1",  .addr = A_GPI1,
+        .rsvd = 0xf0e0000,
+        .ro = 0xf0f1ffff,
+    },{ .name = "GPI2",  .addr = A_GPI2,
+        .rsvd = 0x1f00fcc0,
+        .ro = 0xe0ff033f,
+    },{ .name = "GPI3",  .addr = A_GPI3,
+        .ro = 0xffffffff,
+    },{ .name = "IRQ_STATUS",  .addr = A_IRQ_STATUS,
+        .rsvd = 0x40008787,
+        .ro = 0xbfff7878,
+    },{ .name = "IRQ_PENDING",  .addr = A_IRQ_PENDING,
+        .rsvd = 0x40008787,
+        .ro = 0xdfff7ff8,
+    },{ .name = "IRQ_ENABLE",  .addr = A_IRQ_ENABLE,
+        .rsvd = 0x40008787,
+        .ro = 0x7800,
+        .post_write = xlnx_pmu_io_irq_enable_postw,
+    },{ .name = "IRQ_ACK",  .addr = A_IRQ_ACK,
+        .rsvd = 0x40008787,
+        .post_write = xlnx_pmu_io_irq_ack_postw,
+    },{ .name = "PIT0_PRELOAD",  .addr = A_PIT0_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT0_COUNTER",  .addr = A_PIT0_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT0_CONTROL",  .addr = A_PIT0_CONTROL,
+        .rsvd = 0xfffffffc,
+    },{ .name = "PIT1_PRELOAD",  .addr = A_PIT1_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT1_COUNTER",  .addr = A_PIT1_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT1_CONTROL",  .addr = A_PIT1_CONTROL,
+        .rsvd = 0xfffffffc,
+    },{ .name = "PIT2_PRELOAD",  .addr = A_PIT2_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT2_COUNTER",  .addr = A_PIT2_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT2_CONTROL",  .addr = A_PIT2_CONTROL,
+        .rsvd = 0xfffffffc,
+    },{ .name = "PIT3_PRELOAD",  .addr = A_PIT3_PRELOAD,
+        .ro = 0xffffffff,
+    },{ .name = "PIT3_COUNTER",  .addr = A_PIT3_COUNTER,
+        .ro = 0xffffffff,
+    },{ .name = "PIT3_CONTROL",  .addr = A_PIT3_CONTROL,
+        .rsvd = 0xfffffffc,
+    }
+};
+
+static void irq_handler(void *opaque, int irq, int level)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(opaque);
+    uint32_t mask = 1 << irq;
+    uint32_t prev = s->irq_raw;
+    uint32_t temp;
+
+    s->irq_raw &= ~mask;
+    s->irq_raw |= (!!level) << irq;
+
+    /* Turn active-low into active-high.  */
+    s->irq_raw ^= (~s->cfg.positive);
+    s->irq_raw &= mask;
+
+    if (s->cfg.level_edge & mask) {
+        /* Edge triggered.  */
+        temp = (prev ^ s->irq_raw) & s->irq_raw;
+    } else {
+        /* Level triggered.  */
+        temp = s->irq_raw;
+    }
+    s->regs[R_IRQ_STATUS] |= temp;
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static void xlnx_pmu_io_intc_reset(DeviceState *dev)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    xlnx_pmu_io_irq_update(s);
+}
+
+static const MemoryRegionOps xlnx_pmu_io_intc_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static Property xlnx_pmu_io_intc_properties[] = {
+    DEFINE_PROP_UINT32("intc-intr-size", XlnxPMUIOIntc, cfg.intr_size, 0),
+    DEFINE_PROP_UINT32("intc-level-edge", XlnxPMUIOIntc, cfg.level_edge, 0),
+    DEFINE_PROP_UINT32("intc-positive", XlnxPMUIOIntc, cfg.positive, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void xlnx_pmu_io_intc_realize(DeviceState *dev, Error **errp)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(dev);
+
+    /* Internal interrupts are edge triggered?  */
+    s->cfg.level_edge <<= 16;
+    s->cfg.level_edge |= 0xffff;
+
+    /* Internal interrupts are postitive.  */
+    s->cfg.positive <<= 16;
+    s->cfg.positive |= 0xffff;
+
+    /* Max 16 external interrupts.  */
+    assert(s->cfg.intr_size <= 16);
+
+    qdev_init_gpio_in(dev, irq_handler, 16 + s->cfg.intr_size);
+}
+
+static void xlnx_pmu_io_intc_init(Object *obj)
+{
+    XlnxPMUIOIntc *s = XLNX_PMU_IO_INTC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init(&s->iomem, obj, TYPE_XLNX_PMU_IO_INTC,
+                       XlnxPMUIOIntc_R_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), xlnx_pmu_io_intc_regs_info,
+                              ARRAY_SIZE(xlnx_pmu_io_intc_regs_info),
+                              s->regs_info, s->regs,
+                              &xlnx_pmu_io_intc_ops,
+                              XLNX_PMU_IO_INTC_ERR_DEBUG,
+                              XlnxPMUIOIntc_R_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                0x0,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+
+    sysbus_init_irq(sbd, &s->parent_irq);
+}
+
+static const VMStateDescription vmstate_xlnx_pmu_io_intc = {
+    .name = TYPE_XLNX_PMU_IO_INTC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxPMUIOIntc, XlnxPMUIOIntc_R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void xlnx_pmu_io_intc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = xlnx_pmu_io_intc_reset;
+    dc->realize = xlnx_pmu_io_intc_realize;
+    dc->vmsd = &vmstate_xlnx_pmu_io_intc;
+    dc->props = xlnx_pmu_io_intc_properties;
+}
+
+static const TypeInfo xlnx_pmu_io_intc_info = {
+    .name          = TYPE_XLNX_PMU_IO_INTC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxPMUIOIntc),
+    .class_init    = xlnx_pmu_io_intc_class_init,
+    .instance_init = xlnx_pmu_io_intc_init,
+};
+
+static void xlnx_pmu_io_intc_register_types(void)
+{
+    type_register_static(&xlnx_pmu_io_intc_info);
+}
+
+type_init(xlnx_pmu_io_intc_register_types)
diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index ae358569a1..211655023e 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -3,6 +3,7 @@ common-obj-$(CONFIG_I8259) += i8259_common.o i8259.o
 common-obj-$(CONFIG_PL190) += pl190.o
 common-obj-$(CONFIG_PUV3) += puv3_intc.o
 common-obj-$(CONFIG_XILINX) += xilinx_intc.o
+common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-pmu-iomod-intc.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_pic.o
 common-obj-$(CONFIG_IMX) += imx_avic.o
 common-obj-$(CONFIG_LM32) += lm32_pic.o
-- 
2.14.1

