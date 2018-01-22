Received: by 10.28.71.27 with SMTP id u27csp3200889wma;
        Mon, 22 Jan 2018 11:52:58 -0800 (PST)
X-Google-Smtp-Source: AH8x225CFniTQPCIDKkgcIMolxOC6QTsE7YR7M6Y5aYQ/O3COsfwPc7kFwoQlLx0juDzbQgZ9PFj
X-Received: by 10.37.87.131 with SMTP id l125mr29509ybb.16.1516650778745;
        Mon, 22 Jan 2018 11:52:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516650778; cv=none;
        d=google.com; s=arc-20160816;
        b=yeznvLz2MZ1G2ffkxaoJqyiJbcABS338GFxlyKz9pTxnkSPLHIQRE3uHf2iElBUlip
         iPqij+FCINK2v/5bvxywOn3snZR5/riSBs40CPudsvhzkr8J7MYIzzQV0kHiRGYT1RCq
         CBMBCSylxqHrfMpG76pB4lR1DN+MiyfVLcT7DWFTaRgmS2vvmpcyOxLt212efsFCN37v
         NAsJBXY1Z65V6JlN/ju6DwL+usPUEjvw8vaU529Rgf6NgWaO4mj/h53BoC/P533ArA/K
         1UUk3BsYBrL4HX9A35aKO8LB1lQmjouckwu0wfqlS0M/iHHSD/lqdVKnJEtlD5wgLjL4
         tl8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=LZExAnHuD9UO91hl3+GRfjj4KVoiJmGUzRQw18SqirQ=;
        b=ilVGav2xo2fSKjrDf3cKz/qLw0SX/aROZPTeli+dRHuvB/XjwGTULAar0cPiJoaPkU
         ECDG7fC1TCXRPg80P0+ySJHfHkx7HqNHRtvn5zOiOLYN4lkGk4l5bMDE99tXkzb6YYxq
         0be6z+0OxJMNxzv59y1C2xdL2W+flwXuD3cqkzkk+COWSd9BlyjTqLt+y1IuAAMB9lpC
         szuQSDhRI/NwPvcwVoFRtD0vK+L0X65udcfYz2aOWmz1xg8yvAnwwN2V1VkQn/eXyflD
         qbsdEQAW3kQPHSjR0X/HBlvwz/dXpZE1ScTvcsaT/XBHH3I0FnLx07x5VxI8WEGxhLA8
         4bgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QdMd/lvl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2si291402ywm.537.2018.01.22.11.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 11:52:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QdMd/lvl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edi9K-0002Jc-29
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 14:52:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4m-0007Ch-Ki
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 14:48:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4k-00069h-IB
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 14:48:16 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:43874)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1edi4f-00066o-Iw; Mon, 22 Jan 2018 14:48:09 -0500
Received: by mail-pg0-x244.google.com with SMTP id n17so7871289pgf.10;
	Mon, 22 Jan 2018 11:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LZExAnHuD9UO91hl3+GRfjj4KVoiJmGUzRQw18SqirQ=;
	b=QdMd/lvlesNsvxcQzh8YiVVuqAxV8G8Nm+K5f3yicduD1KcQMY1TmfCkr3uCY5gJ2j
	6ZUInPMzW1j9moG+DIeLE1sVljp6pOqw+AMxX952KXwA42U46ZuxvPKgYSIbg+bDxC1E
	x5CfJgEg7WmudraXXgLGHyEHHWQXUjBuP+aKWXWkCKlc6KgxRUHjaaLoWMFjTG66ltc6
	rQ5FxlK1HD7LwIBaAYVPcL8jcgjXYFbZXKJgulJaP5CGNI7haK/GEW+fpjWnxHL75Y7k
	9y15F4AhaUXdrpQXJFiOV3wMTxE1rp/RujCjMwe4+/q0ne5Ok0dNGLcal6EQiFe3pej2
	mHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=LZExAnHuD9UO91hl3+GRfjj4KVoiJmGUzRQw18SqirQ=;
	b=aFFKcXVYsaa5r5Ao+RRz/mtFXVi9NVdkrAoihU0MGt9ao+FsfoPkL6DxKd5x8r7kjP
	ZX+vtzJOG0RL+FSUaBfqKTZ+mE1G76og40mjBxjdMni0iUwfSycFplq/IRgXBM+ekZV/
	nzzFVb/LsWVQ7iMZT8KNeUru7seCAxJMFIJQZjo2XVELt61nuW96Ie7YmswAOasFkozS
	Epe1sbdxm9JKltJBO0vLEPYaE2+Fv0DV3OIe3wD4RZ50k2Zv3fvaE+6id2QQzwy4C4RS
	1E9z7jEjmtrXmIy39NRD6xi6yxpt2wX7UIX+ldPAeGBwVNDtZ/V0Imr+hNQWBMZatidu
	vzHw==
X-Gm-Message-State: AKwxytcElLQAQ1121IgFe9lml3wWa3TZrTppdb5PvjgiKvdn08tbl7HV
	lbSwZqOvyPhQ2T/J0Yzv6se6J4Ll
X-Received: by 10.98.237.6 with SMTP id u6mr9060927pfh.190.1516650488079;
	Mon, 22 Jan 2018 11:48:08 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	i128sm1986723pfg.83.2018.01.22.11.48.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Jan 2018 11:48:06 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Mon, 22 Jan 2018 11:43:43 -0800
Message-Id: <ea924123dc9ae1d084fab75930079fe41bf35978.1516650109.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1516650109.git.alistair.francis@xilinx.com>
References: <cover.1516650109.git.alistair.francis@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v7 7/9] xlnx-zynqmp-ipi: Initial version of the
 Xilinx IPI device
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
X-TUID: f10OoJcF2qND

This is the initial version of the Inter Processor Interrupt device.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

 include/hw/intc/xlnx-zynqmp-ipi.h |  57 ++++++
 hw/intc/xlnx-zynqmp-ipi.c         | 377 ++++++++++++++++++++++++++++++++++++++
 hw/intc/Makefile.objs             |   1 +
 3 files changed, 435 insertions(+)
 create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h
 create mode 100644 hw/intc/xlnx-zynqmp-ipi.c

diff --git a/include/hw/intc/xlnx-zynqmp-ipi.h b/include/hw/intc/xlnx-zynqmp-ipi.h
new file mode 100644
index 0000000000..4afa4ff313
--- /dev/null
+++ b/include/hw/intc/xlnx-zynqmp-ipi.h
@@ -0,0 +1,57 @@
+/*
+ * QEMU model of the IPI Inter Processor Interrupt block
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
+#ifndef XLNX_ZYNQMP_IPI_H
+#define XLNX_ZYNQMP_IPI_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_XLNX_ZYNQMP_IPI "xlnx.zynqmp_ipi"
+
+#define XLNX_ZYNQMP_IPI(obj) \
+     OBJECT_CHECK(XlnxZynqMPIPI, (obj), TYPE_XLNX_ZYNQMP_IPI)
+
+/* This is R_IPI_IDR + 1 */
+#define R_XLNX_ZYNQMP_IPI_MAX ((0x1c / 4) + 1)
+
+#define NUM_IPIS 11
+
+typedef struct XlnxZynqMPIPI {
+    /* Private */
+    SysBusDevice parent_obj;
+
+    /* Public */
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    qemu_irq irq_trig_out[NUM_IPIS];
+    qemu_irq irq_obs_out[NUM_IPIS];
+
+    uint32_t regs[R_XLNX_ZYNQMP_IPI_MAX];
+    RegisterInfo regs_info[R_XLNX_ZYNQMP_IPI_MAX];
+} XlnxZynqMPIPI;
+
+#endif /* XLNX_ZYNQMP_IPI_H */
diff --git a/hw/intc/xlnx-zynqmp-ipi.c b/hw/intc/xlnx-zynqmp-ipi.c
new file mode 100644
index 0000000000..aa50a8ac08
--- /dev/null
+++ b/hw/intc/xlnx-zynqmp-ipi.c
@@ -0,0 +1,377 @@
+/*
+ * QEMU model of the IPI Inter Processor Interrupt block
+ *
+ * Copyright (c) 2014 Xilinx Inc.
+ *
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
+#include "hw/intc/xlnx-zynqmp-ipi.h"
+
+#ifndef XLNX_ZYNQMP_IPI_ERR_DEBUG
+#define XLNX_ZYNQMP_IPI_ERR_DEBUG 0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do {\
+    if (XLNX_ZYNQMP_IPI_ERR_DEBUG >= lvl) {\
+        qemu_log(TYPE_XLNX_ZYNQMP_IPI ": %s:" fmt, __func__, ## args);\
+    } \
+} while (0)
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+REG32(IPI_TRIG, 0x0)
+    FIELD(IPI_TRIG, PL_3, 27, 1)
+    FIELD(IPI_TRIG, PL_2, 26, 1)
+    FIELD(IPI_TRIG, PL_1, 25, 1)
+    FIELD(IPI_TRIG, PL_0, 24, 1)
+    FIELD(IPI_TRIG, PMU_3, 19, 1)
+    FIELD(IPI_TRIG, PMU_2, 18, 1)
+    FIELD(IPI_TRIG, PMU_1, 17, 1)
+    FIELD(IPI_TRIG, PMU_0, 16, 1)
+    FIELD(IPI_TRIG, RPU_1, 9, 1)
+    FIELD(IPI_TRIG, RPU_0, 8, 1)
+    FIELD(IPI_TRIG, APU, 0, 1)
+REG32(IPI_OBS, 0x4)
+    FIELD(IPI_OBS, PL_3, 27, 1)
+    FIELD(IPI_OBS, PL_2, 26, 1)
+    FIELD(IPI_OBS, PL_1, 25, 1)
+    FIELD(IPI_OBS, PL_0, 24, 1)
+    FIELD(IPI_OBS, PMU_3, 19, 1)
+    FIELD(IPI_OBS, PMU_2, 18, 1)
+    FIELD(IPI_OBS, PMU_1, 17, 1)
+    FIELD(IPI_OBS, PMU_0, 16, 1)
+    FIELD(IPI_OBS, RPU_1, 9, 1)
+    FIELD(IPI_OBS, RPU_0, 8, 1)
+    FIELD(IPI_OBS, APU, 0, 1)
+REG32(IPI_ISR, 0x10)
+    FIELD(IPI_ISR, PL_3, 27, 1)
+    FIELD(IPI_ISR, PL_2, 26, 1)
+    FIELD(IPI_ISR, PL_1, 25, 1)
+    FIELD(IPI_ISR, PL_0, 24, 1)
+    FIELD(IPI_ISR, PMU_3, 19, 1)
+    FIELD(IPI_ISR, PMU_2, 18, 1)
+    FIELD(IPI_ISR, PMU_1, 17, 1)
+    FIELD(IPI_ISR, PMU_0, 16, 1)
+    FIELD(IPI_ISR, RPU_1, 9, 1)
+    FIELD(IPI_ISR, RPU_0, 8, 1)
+    FIELD(IPI_ISR, APU, 0, 1)
+REG32(IPI_IMR, 0x14)
+    FIELD(IPI_IMR, PL_3, 27, 1)
+    FIELD(IPI_IMR, PL_2, 26, 1)
+    FIELD(IPI_IMR, PL_1, 25, 1)
+    FIELD(IPI_IMR, PL_0, 24, 1)
+    FIELD(IPI_IMR, PMU_3, 19, 1)
+    FIELD(IPI_IMR, PMU_2, 18, 1)
+    FIELD(IPI_IMR, PMU_1, 17, 1)
+    FIELD(IPI_IMR, PMU_0, 16, 1)
+    FIELD(IPI_IMR, RPU_1, 9, 1)
+    FIELD(IPI_IMR, RPU_0, 8, 1)
+    FIELD(IPI_IMR, APU, 0, 1)
+REG32(IPI_IER, 0x18)
+    FIELD(IPI_IER, PL_3, 27, 1)
+    FIELD(IPI_IER, PL_2, 26, 1)
+    FIELD(IPI_IER, PL_1, 25, 1)
+    FIELD(IPI_IER, PL_0, 24, 1)
+    FIELD(IPI_IER, PMU_3, 19, 1)
+    FIELD(IPI_IER, PMU_2, 18, 1)
+    FIELD(IPI_IER, PMU_1, 17, 1)
+    FIELD(IPI_IER, PMU_0, 16, 1)
+    FIELD(IPI_IER, RPU_1, 9, 1)
+    FIELD(IPI_IER, RPU_0, 8, 1)
+    FIELD(IPI_IER, APU, 0, 1)
+REG32(IPI_IDR, 0x1c)
+    FIELD(IPI_IDR, PL_3, 27, 1)
+    FIELD(IPI_IDR, PL_2, 26, 1)
+    FIELD(IPI_IDR, PL_1, 25, 1)
+    FIELD(IPI_IDR, PL_0, 24, 1)
+    FIELD(IPI_IDR, PMU_3, 19, 1)
+    FIELD(IPI_IDR, PMU_2, 18, 1)
+    FIELD(IPI_IDR, PMU_1, 17, 1)
+    FIELD(IPI_IDR, PMU_0, 16, 1)
+    FIELD(IPI_IDR, RPU_1, 9, 1)
+    FIELD(IPI_IDR, RPU_0, 8, 1)
+    FIELD(IPI_IDR, APU, 0, 1)
+
+/* APU
+ * RPU_0
+ * RPU_1
+ * PMU_0
+ * PMU_1
+ * PMU_2
+ * PMU_3
+ * PL_0
+ * PL_1
+ * PL_2
+ * PL_3
+ */
+int index_array[NUM_IPIS] = {0, 8, 9, 16, 17, 18, 19, 24, 25, 26, 27};
+static const char *index_array_names[NUM_IPIS] = {"APU", "RPU_0", "RPU_1",
+                                                  "PMU_0", "PMU_1", "PMU_2",
+                                                  "PMU_3", "PL_0", "PL_1",
+                                                  "PL_2", "PL_3"};
+
+static void xlnx_zynqmp_ipi_set_trig(XlnxZynqMPIPI *s, uint32_t val)
+{
+    int i, ipi_index, ipi_mask;
+
+    for (i = 0; i < NUM_IPIS; i++) {
+        ipi_index = index_array[i];
+        ipi_mask = (1 << ipi_index);
+        DB_PRINT("Setting %s=%d\n", index_array_names[i],
+                 !!(val & ipi_mask));
+        qemu_set_irq(s->irq_trig_out[i], !!(val & ipi_mask));
+    }
+}
+
+static void xlnx_zynqmp_ipi_set_obs(XlnxZynqMPIPI *s, uint32_t val)
+{
+    int i, ipi_index, ipi_mask;
+
+    for (i = 0; i < NUM_IPIS; i++) {
+        ipi_index = index_array[i];
+        ipi_mask = (1 << ipi_index);
+        DB_PRINT("Setting %s=%d\n", index_array_names[i],
+                 !!(val & ipi_mask));
+        qemu_set_irq(s->irq_obs_out[i], !!(val & ipi_mask));
+    }
+}
+
+static void xlnx_zynqmp_ipi_update_irq(XlnxZynqMPIPI *s)
+{
+    bool pending = s->regs[R_IPI_ISR] & ~s->regs[R_IPI_IMR];
+
+    DB_PRINT("irq=%d isr=%x mask=%x\n",
+             pending, s->regs[R_IPI_ISR], s->regs[R_IPI_IMR]);
+    qemu_set_irq(s->irq, pending);
+}
+
+static uint64_t xlnx_zynqmp_ipi_trig_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_set_trig(s, val64);
+
+    return val64;
+}
+
+static void xlnx_zynqmp_ipi_trig_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    /* TRIG generates a pulse on the outbound signals. We use the
+     * post-write callback to bring the signal back-down.
+     */
+    s->regs[R_IPI_TRIG] = 0;
+
+    xlnx_zynqmp_ipi_set_trig(s, 0);
+}
+
+static uint64_t xlnx_zynqmp_ipi_isr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_set_obs(s, val64);
+
+    return val64;
+}
+
+static void xlnx_zynqmp_ipi_isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static uint64_t xlnx_zynqmp_ipi_ier_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IPI_IMR] &= ~val;
+    xlnx_zynqmp_ipi_update_irq(s);
+    return 0;
+}
+
+static uint64_t xlnx_zynqmp_ipi_idr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IPI_IMR] |= val;
+    xlnx_zynqmp_ipi_update_irq(s);
+    return 0;
+}
+
+static const RegisterAccessInfo xlnx_zynqmp_ipi_regs_info[] = {
+    {   .name = "IPI_TRIG",  .addr = A_IPI_TRIG,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .pre_write = xlnx_zynqmp_ipi_trig_prew,
+        .post_write = xlnx_zynqmp_ipi_trig_postw,
+    },{ .name = "IPI_OBS",  .addr = A_IPI_OBS,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xffffffff,
+    },{ .name = "IPI_ISR",  .addr = A_IPI_ISR,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .w1c = 0xf0f0301,
+        .pre_write = xlnx_zynqmp_ipi_isr_prew,
+        .post_write = xlnx_zynqmp_ipi_isr_postw,
+    },{ .name = "IPI_IMR",  .addr = A_IPI_IMR,
+        .reset = 0xf0f0301,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xffffffff,
+    },{ .name = "IPI_IER",  .addr = A_IPI_IER,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .pre_write = xlnx_zynqmp_ipi_ier_prew,
+    },{ .name = "IPI_IDR",  .addr = A_IPI_IDR,
+        .rsvd = 0xf0f0fcfe,
+        .ro = 0xf0f0fcfe,
+        .pre_write = xlnx_zynqmp_ipi_idr_prew,
+    }
+};
+
+static void xlnx_zynqmp_ipi_reset(DeviceState *dev)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(dev);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static void xlnx_zynqmp_ipi_handler(void *opaque, int n, int level)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(opaque);
+    uint32_t val = (!!level) << n;
+
+    DB_PRINT("IPI input irq[%d]=%d\n", n, level);
+
+    s->regs[R_IPI_ISR] |= val;
+    xlnx_zynqmp_ipi_set_obs(s, s->regs[R_IPI_ISR]);
+    xlnx_zynqmp_ipi_update_irq(s);
+}
+
+static void xlnx_zynqmp_obs_handler(void *opaque, int n, int level)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(opaque);
+
+    DB_PRINT("OBS input irq[%d]=%d\n", n, level);
+
+    s->regs[R_IPI_OBS] &= ~(1ULL << n);
+    s->regs[R_IPI_OBS] |= (level << n);
+}
+
+static const MemoryRegionOps xlnx_zynqmp_ipi_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void xlnx_zynqmp_ipi_realize(DeviceState *dev, Error **errp)
+{
+    qdev_init_gpio_in_named(dev, xlnx_zynqmp_ipi_handler, "IPI_INPUTS", 32);
+    qdev_init_gpio_in_named(dev, xlnx_zynqmp_obs_handler, "OBS_INPUTS", 32);
+}
+
+static void xlnx_zynqmp_ipi_init(Object *obj)
+{
+    XlnxZynqMPIPI *s = XLNX_ZYNQMP_IPI(obj);
+    DeviceState *dev = DEVICE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+    char *irq_name;
+    int i;
+
+    memory_region_init(&s->iomem, obj, TYPE_XLNX_ZYNQMP_IPI,
+                       R_XLNX_ZYNQMP_IPI_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), xlnx_zynqmp_ipi_regs_info,
+                              ARRAY_SIZE(xlnx_zynqmp_ipi_regs_info),
+                              s->regs_info, s->regs,
+                              &xlnx_zynqmp_ipi_ops,
+                              XLNX_ZYNQMP_IPI_ERR_DEBUG,
+                              R_XLNX_ZYNQMP_IPI_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                0x0,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+
+    for (i = 0; i < NUM_IPIS; i++) {
+        qdev_init_gpio_out_named(dev, &s->irq_trig_out[i],
+                                 index_array_names[i], 1);
+
+        irq_name = g_strdup_printf("OBS_%s", index_array_names[i]);
+        qdev_init_gpio_out_named(dev, &s->irq_obs_out[i],
+                                 irq_name, 1);
+        g_free(irq_name);
+    }
+}
+
+static const VMStateDescription vmstate_zynqmp_pmu_ipi = {
+    .name = TYPE_XLNX_ZYNQMP_IPI,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxZynqMPIPI, R_XLNX_ZYNQMP_IPI_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void xlnx_zynqmp_ipi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = xlnx_zynqmp_ipi_reset;
+    dc->realize = xlnx_zynqmp_ipi_realize;
+    dc->vmsd = &vmstate_zynqmp_pmu_ipi;
+}
+
+static const TypeInfo xlnx_zynqmp_ipi_info = {
+    .name          = TYPE_XLNX_ZYNQMP_IPI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxZynqMPIPI),
+    .class_init    = xlnx_zynqmp_ipi_class_init,
+    .instance_init = xlnx_zynqmp_ipi_init,
+};
+
+static void xlnx_zynqmp_ipi_register_types(void)
+{
+    type_register_static(&xlnx_zynqmp_ipi_info);
+}
+
+type_init(xlnx_zynqmp_ipi_register_types)
diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 211655023e..571e094a14 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -4,6 +4,7 @@ common-obj-$(CONFIG_PL190) += pl190.o
 common-obj-$(CONFIG_PUV3) += puv3_intc.o
 common-obj-$(CONFIG_XILINX) += xilinx_intc.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-pmu-iomod-intc.o
+common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp-ipi.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_pic.o
 common-obj-$(CONFIG_IMX) += imx_avic.o
 common-obj-$(CONFIG_LM32) += lm32_pic.o
-- 
2.14.1

