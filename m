Received: by 10.182.158.201 with SMTP id ww9csp2039423obb;
        Sat, 19 Dec 2015 21:44:55 -0800 (PST)
X-Received: by 10.140.159.131 with SMTP id f125mr16831240qhf.72.1450590295328;
        Sat, 19 Dec 2015 21:44:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n93si24259780qgd.60.2015.12.19.21.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 21:44:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAWnf-0008B1-0i
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 00:44:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWmy-0007Av-O0
	for qemu-devel@nongnu.org; Sun, 20 Dec 2015 00:44:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWmx-0000d7-Am
	for qemu-devel@nongnu.org; Sun, 20 Dec 2015 00:44:12 -0500
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c]:33840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAWmx-0000cq-2h; Sun, 20 Dec 2015 00:44:11 -0500
Received: by mail-pf0-x22c.google.com with SMTP id u7so24295740pfb.1;
	Sat, 19 Dec 2015 21:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=IuMtZZs2mjQ8sfj6fpwDcWaPeIdSj64mnhNQzfh16QI=;
	b=cZ3d49YlYvTRE7MFPQ5x+ix5cemJG4YpWjkt6ZkXbWoIB0Fg3M1rsei4spUD4Bh/hZ
	PMdDBIG4+qhBjUFMNcJ14VQn9ZVhUAyDLXFkf2qoLk/X4nrmYO5K5CIt1BwLzPU9aCnw
	W7dHTxw5ffID+RTs1VWWBLEpnczdqM+qCtlSSE4u2rgEguIRIxPbRAJ0yRkm37x3d7Me
	JKvn00q2nrkJwoaHYJCqKBxOYCvSdTK4+JdyLZgaQ59Lb7g8pyCF3BZLZrlGXB3pkBPz
	2Gq2N/maTPy3oT8slgEOD+QJoN5qJHLbvl2fu++C/JBmyTpo4bbQu39ujZIJUl6ls9Yv
	FVcA==
X-Received: by 10.98.16.204 with SMTP id 73mr17950292pfq.136.1450590250575;
	Sat, 19 Dec 2015 21:44:10 -0800 (PST)
Received: from localhost.localdomain
	(c211-31-14-155.rochd5.qld.optusnet.com.au. [211.31.14.155])
	by smtp.gmail.com with ESMTPSA id c27sm894550pfd.50.2015.12.19.21.44.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 21:44:09 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 19 Dec 2015 21:43:36 -0800
Message-Id: <e78f5c7af68da51568a4e43b99575235cc5200c4.1450570397.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22c
Cc: peter.maydell@linaro.org, crosthwaite.peter@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, alistair.francis@xilinx.com
Subject: [Qemu-devel] [PATCH v6 4/6] xilinx_spips: Separate the state struct
	into a header
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: etRPipkjcp9E

From: Alistair Francis <alistair.francis@xilinx.com>

Separate out the XilinxSPIPS struct into a separate header
file.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 hw/ssi/xilinx_spips.c         | 46 +++------------------------
 include/hw/ssi/xilinx_spips.h | 72 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 42 deletions(-)
 create mode 100644 include/hw/ssi/xilinx_spips.h

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index e9471ff..2111719 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -29,6 +29,7 @@
 #include "qemu/fifo8.h"
 #include "hw/ssi/ssi.h"
 #include "qemu/bitops.h"
+#include "hw/ssi/xilinx_spips.h"
 
 #ifndef XILINX_SPIPS_ERR_DEBUG
 #define XILINX_SPIPS_ERR_DEBUG 0
@@ -103,8 +104,6 @@
 
 #define R_MOD_ID            (0xFC / 4)
 
-#define R_MAX (R_MOD_ID+1)
-
 /* size of TXRX FIFOs */
 #define RXFF_A          32
 #define TXFF_A          32
@@ -135,30 +134,6 @@ typedef enum {
 } FlashCMD;
 
 typedef struct {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-    MemoryRegion mmlqspi;
-
-    qemu_irq irq;
-    int irqline;
-
-    uint8_t num_cs;
-    uint8_t num_busses;
-
-    uint8_t snoop_state;
-    qemu_irq *cs_lines;
-    SSIBus **spi;
-
-    Fifo8 rx_fifo;
-    Fifo8 tx_fifo;
-
-    uint8_t num_txrx_bytes;
-
-    uint32_t regs[R_MAX];
-} XilinxSPIPS;
-
-typedef struct {
     XilinxSPIPS parent_obj;
 
     uint8_t lqspi_buf[LQSPI_CACHE_SIZE];
@@ -174,19 +149,6 @@ typedef struct XilinxSPIPSClass {
     uint32_t tx_fifo_size;
 } XilinxSPIPSClass;
 
-#define TYPE_XILINX_SPIPS "xlnx.ps7-spi"
-#define TYPE_XILINX_QSPIPS "xlnx.ps7-qspi"
-
-#define XILINX_SPIPS(obj) \
-     OBJECT_CHECK(XilinxSPIPS, (obj), TYPE_XILINX_SPIPS)
-#define XILINX_SPIPS_CLASS(klass) \
-     OBJECT_CLASS_CHECK(XilinxSPIPSClass, (klass), TYPE_XILINX_SPIPS)
-#define XILINX_SPIPS_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(XilinxSPIPSClass, (obj), TYPE_XILINX_SPIPS)
-
-#define XILINX_QSPIPS(obj) \
-     OBJECT_CHECK(XilinxQSPIPS, (obj), TYPE_XILINX_QSPIPS)
-
 static inline int num_effective_busses(XilinxSPIPS *s)
 {
     return (s->regs[R_LQSPI_CFG] & LQSPI_CFG_SEP_BUS &&
@@ -257,7 +219,7 @@ static void xilinx_spips_reset(DeviceState *d)
     XilinxSPIPS *s = XILINX_SPIPS(d);
 
     int i;
-    for (i = 0; i < R_MAX; i++) {
+    for (i = 0; i < XLNX_SPIPS_R_MAX; i++) {
         s->regs[i] = 0;
     }
 
@@ -664,7 +626,7 @@ static void xilinx_spips_realize(DeviceState *dev, Error **errp)
     }
 
     memory_region_init_io(&s->iomem, OBJECT(s), xsc->reg_ops, s,
-                          "spi", R_MAX*4);
+                          "spi", XLNX_SPIPS_R_MAX*4);
     sysbus_init_mmio(sbd, &s->iomem);
 
     s->irqline = -1;
@@ -708,7 +670,7 @@ static const VMStateDescription vmstate_xilinx_spips = {
     .fields = (VMStateField[]) {
         VMSTATE_FIFO8(tx_fifo, XilinxSPIPS),
         VMSTATE_FIFO8(rx_fifo, XilinxSPIPS),
-        VMSTATE_UINT32_ARRAY(regs, XilinxSPIPS, R_MAX),
+        VMSTATE_UINT32_ARRAY(regs, XilinxSPIPS, XLNX_SPIPS_R_MAX),
         VMSTATE_UINT8(snoop_state, XilinxSPIPS),
         VMSTATE_END_OF_LIST()
     }
diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
new file mode 100644
index 0000000..dbb9eef
--- /dev/null
+++ b/include/hw/ssi/xilinx_spips.h
@@ -0,0 +1,72 @@
+/*
+ * Header file for the Xilinx Zynq SPI controller
+ *
+ * Copyright (C) 2015 Xilinx Inc
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
+#ifndef XLNX_SPIPS_H
+#define XLNX_SPIPS_H
+
+#include "hw/ssi/ssi.h"
+#include "qemu/fifo8.h"
+
+typedef struct XilinxSPIPS XilinxSPIPS;
+
+#define XLNX_SPIPS_R_MAX        (0x100 / 4)
+
+struct XilinxSPIPS {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    MemoryRegion mmlqspi;
+
+    qemu_irq irq;
+    int irqline;
+
+    uint8_t num_cs;
+    uint8_t num_busses;
+
+    uint8_t snoop_state;
+    qemu_irq *cs_lines;
+    SSIBus **spi;
+
+    Fifo8 rx_fifo;
+    Fifo8 tx_fifo;
+
+    uint8_t num_txrx_bytes;
+
+    uint32_t regs[XLNX_SPIPS_R_MAX];
+};
+
+#define TYPE_XILINX_SPIPS "xlnx.ps7-spi"
+#define TYPE_XILINX_QSPIPS "xlnx.ps7-qspi"
+
+#define XILINX_SPIPS(obj) \
+     OBJECT_CHECK(XilinxSPIPS, (obj), TYPE_XILINX_SPIPS)
+#define XILINX_SPIPS_CLASS(klass) \
+     OBJECT_CLASS_CHECK(XilinxSPIPSClass, (klass), TYPE_XILINX_SPIPS)
+#define XILINX_SPIPS_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(XilinxSPIPSClass, (obj), TYPE_XILINX_SPIPS)
+
+#define XILINX_QSPIPS(obj) \
+     OBJECT_CHECK(XilinxQSPIPS, (obj), TYPE_XILINX_QSPIPS)
+
+#endif /* XLNX_SPIPS_H */
-- 
1.9.1

