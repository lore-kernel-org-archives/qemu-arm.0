Received: by 10.25.0.6 with SMTP id 6csp1935092lfa;
        Tue, 16 May 2017 08:42:31 -0700 (PDT)
X-Received: by 10.55.130.130 with SMTP id e124mr10325781qkd.27.1494949351622;
        Tue, 16 May 2017 08:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494949351; cv=none;
        d=google.com; s=arc-20160816;
        b=amk9Y1rTinc/x6CyIZoqInjbw33ZVETgQ0z6aX+nwfi/dLhQQQI6EssN6UqY/JYk7q
         wbQB+FEGqob14lFjwybGsyk3mGXOoMS4hXGA11qdkcoIweN+Ktzy7GN4PeLvuEzZIlKI
         LOoR/vte4t3+MAWPGWdGdnBhJ7sq65GzU6A/OjC7Q8GD8WDVOL31QZJ1iSC+FuNOdW5K
         T8fC0gLlUa/26u/CmByVowZyJ8+B8x5tQnX/GLm0ZL4ZtS9vVFxFnp0SUBfqoXF3EL6o
         7Y2m5+B3QJrolCL7fnQTLW5yBZw+k5sLK6I6KBWz4jyvF6C9tBl03rx2+YCOlEoTGyj3
         6iNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=t9FCvCns8yhFbFyNsCLXQw03HcRRoEgmfPGNPbbk1Xo=;
        b=W3XEQ2dIJ5Yq76MBjXD2hn6EYBLAICd66F3qTkr6X/Q5EoCCC8CAE5SP6G972VfLu+
         SaSG+/0Hbe4LWJoHqyEXZIHjuliEnHQ/czB4VrQqkko4yJE6V0NTa24YGzCaqi3twWjl
         /Y3leGBgKdaGYEKQZps6wXNoYpsLhY4t5nVDRZg4Iff+1zzcLULr7he5SrTT+TG+otm4
         4ItW68MfsycGCs0Q43i07nNAbFfOcuADU0qoU9+ZWuDJBWs8gHKx/yC5J7cFpyah5+Cv
         lckG/b1FqM/GeN/70y3SfGEpLGwHBBj3/DjN49ILdq4bFyi/7xZZxx4Po1EvkRHbXWMX
         Y7Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j39si237112qtb.164.2017.05.16.08.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 08:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAecJ-0005Ji-1R
	for alex.bennee@linaro.org; Tue, 16 May 2017 11:42:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAeZZ-0002ci-Ap
	for qemu-arm@nongnu.org; Tue, 16 May 2017 11:39:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAeZV-0001au-85
	for qemu-arm@nongnu.org; Tue, 16 May 2017 11:39:41 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:34849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dAeZQ-0001XI-OW; Tue, 16 May 2017 11:39:32 -0400
Received: by mail-pf0-x242.google.com with SMTP id u26so20334860pfd.2;
	Tue, 16 May 2017 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t9FCvCns8yhFbFyNsCLXQw03HcRRoEgmfPGNPbbk1Xo=;
	b=ZqaIHWI4HMxStVXXOGsCsHqA5l7H17LT5V0AuXxJuocTbZ6anGtUQ1PH/MhjpZvNrK
	S27sFRbOUkQB0PI8gZ8N3X/BmR23oM5l7DI0/4UIEc/ueOoAzyEAdtM+FVd9ZtrP7IKN
	MxmVyb1OrdWNaA09UMy/62PaWN49wDC0oqemHiBvWqk0qw0MWIi01HVxjAVtXL3h5pdC
	A2MQ7bIYS+5O9lsAOIhjkI4Wm0dO+RMaLFgvSMh15HTnbAuauACOXq0ky6Bs7alyB4nS
	bm2JNRqlma7t2I1kPznIZCP3InzrDcpltHzfH0pe8Ehnd2l/itoL2MxtEUKdRNCJ7xIp
	DEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t9FCvCns8yhFbFyNsCLXQw03HcRRoEgmfPGNPbbk1Xo=;
	b=depRReHgLxZOqMy7apOqN9Y1tkFouqEE/jTVcmp64GhBINliAzM44fgc/x0ExqDLyL
	orcthSB0OPKr7TIMMBWbBkOQwfYmGR5zjapikDW4tp/URs3it6KsbGy1RMuKooyT90fA
	RolXiq39yVeephSVXhFj/RuKF+aHPJaHhx4PB2YQlg130EbAFj9T9VvfcR1OKGP7O7hj
	FbgLqIoHnV4q/CB2vLLskqrVxgJN/+5DfG1MEAGAZ1ZZwcws6If7ZS9cTWtTYvp1VQld
	r9YT1L9QWCHDLUVxs8Tl2w50oaXfxC/L5uYFbvBu5mq79zq06BxuVxVOFaqcqp7kbdM7
	7qrA==
X-Gm-Message-State: AODbwcByC+fI3GUGQFdZKP8rqVhC4if6bsWwhhJvys3Q/I8kYY79NLEI
	pK14dWVufKTSunhj
X-Received: by 10.99.141.76 with SMTP id z73mr12837427pgd.118.1494949171298;
	Tue, 16 May 2017 08:39:31 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	d86sm27874895pfj.75.2017.05.16.08.39.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 08:39:30 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 16 May 2017 21:08:51 +0530
Message-Id: <1494949133-2202-4-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [Qemu devel v5 PATCH 3/5] msf2: Add Smartfusion2 SPI
 controller
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
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RZ+ze6HKJmV5

Modelled Microsemi's Smartfusion2 SPI controller.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/ssi/Makefile.objs     |   1 +
 hw/ssi/mss-spi.c         | 378 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/ssi/mss-spi.h | 104 +++++++++++++
 3 files changed, 483 insertions(+)
 create mode 100644 hw/ssi/mss-spi.c
 create mode 100644 include/hw/ssi/mss-spi.h

diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
index 487add2..f5bcc65 100644
--- a/hw/ssi/Makefile.objs
+++ b/hw/ssi/Makefile.objs
@@ -4,6 +4,7 @@ common-obj-$(CONFIG_XILINX_SPI) += xilinx_spi.o
 common-obj-$(CONFIG_XILINX_SPIPS) += xilinx_spips.o
 common-obj-$(CONFIG_ASPEED_SOC) += aspeed_smc.o
 common-obj-$(CONFIG_STM32F2XX_SPI) += stm32f2xx_spi.o
+common-obj-$(CONFIG_MSF2) += mss-spi.o
 
 obj-$(CONFIG_OMAP) += omap_spi.o
 obj-$(CONFIG_IMX) += imx_spi.o
diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
new file mode 100644
index 0000000..0b88ec9
--- /dev/null
+++ b/hw/ssi/mss-spi.c
@@ -0,0 +1,378 @@
+/*
+ * Block model of SPI controller present in
+ * Microsemi's SmartFusion2 and SmartFusion SoCs.
+ *
+ * Copyright (C) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
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
+#include "hw/ssi/mss-spi.h"
+
+#ifndef MSS_SPI_ERR_DEBUG
+#define MSS_SPI_ERR_DEBUG   0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do { \
+    if (MSS_SPI_ERR_DEBUG >= lvl) { \
+        qemu_log("%s: " fmt, __func__, ## args); \
+    } \
+} while (0);
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+static void txfifo_reset(MSSSpiState *s)
+{
+    fifo32_reset(&s->tx_fifo);
+
+    s->regs[R_SPI_STATUS] &= ~S_TXFIFOFUL;
+    s->regs[R_SPI_STATUS] |= S_TXFIFOEMP;
+}
+
+static void rxfifo_reset(MSSSpiState *s)
+{
+    fifo32_reset(&s->rx_fifo);
+
+    s->regs[R_SPI_STATUS] &= ~S_RXFIFOFUL;
+    s->regs[R_SPI_STATUS] |= S_RXFIFOEMP;
+}
+
+static void set_fifodepth(MSSSpiState *s)
+{
+    int size = s->regs[R_SPI_DFSIZE] & FRAMESZ_MASK;
+
+    if (0 <= size && size <= 8) {
+        s->fifo_depth = 32;
+    }
+    if (9 <= size && size <= 16) {
+        s->fifo_depth = 16;
+    }
+    if (17 <= size && size <= 32) {
+        s->fifo_depth = 8;
+    }
+}
+
+static void mss_spi_do_reset(MSSSpiState *s)
+{
+    memset(s->regs, 0, sizeof s->regs);
+    s->regs[R_SPI_CONTROL] = 0x80000102;
+    s->regs[R_SPI_DFSIZE] = 0x4;
+    s->regs[R_SPI_STATUS] = 0x2440;
+    s->regs[R_SPI_CLKGEN] = 0x7;
+    s->regs[R_SPI_RIS] = 0x0;
+
+    s->fifo_depth = 4;
+    s->frame_count = 1;
+    s->enabled = false;
+
+    rxfifo_reset(s);
+    txfifo_reset(s);
+}
+
+static void update_mis(MSSSpiState *s)
+{
+    uint32_t reg = s->regs[R_SPI_CONTROL];
+    uint32_t tmp;
+
+    /*
+     * form the Control register interrupt enable bits
+     * same as RIS, MIS and Interrupt clear registers for simplicity
+     */
+    tmp = ((reg & C_INTRXOVRFLO) >> 4) | ((reg & C_INTRXDATA) >> 3) |
+           ((reg & C_INTTXDATA) >> 5);
+    s->regs[R_SPI_MIS] |= tmp & s->regs[R_SPI_RIS];
+}
+
+static void spi_update_irq(MSSSpiState *s)
+{
+    int irq;
+
+    update_mis(s);
+    irq = !!(s->regs[R_SPI_MIS]);
+
+    qemu_set_irq(s->irq, irq);
+}
+
+static void mss_spi_reset(DeviceState *d)
+{
+    mss_spi_do_reset(MSS_SPI(d));
+}
+
+static uint64_t
+spi_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    MSSSpiState *s = opaque;
+    uint32_t ret = 0;
+
+    addr >>= 2;
+    switch (addr) {
+    case R_SPI_RX:
+        s->regs[R_SPI_STATUS] &= ~S_RXFIFOFUL;
+        s->regs[R_SPI_STATUS] &= ~RXCHOVRF;
+        ret = fifo32_pop(&s->rx_fifo);
+        if (fifo32_is_empty(&s->rx_fifo)) {
+            s->regs[R_SPI_STATUS] |= S_RXFIFOEMP;
+        }
+        break;
+
+    case R_SPI_MIS:
+        update_mis(s);
+        ret = s->regs[R_SPI_MIS];
+        break;
+
+    default:
+        if (addr < ARRAY_SIZE(s->regs)) {
+            ret = s->regs[addr];
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__,
+                         addr * 4);
+        }
+        break;
+    }
+
+    DB_PRINT("addr=0x%" HWADDR_PRIx " = 0x%" PRIx32 "\n", addr * 4, ret);
+    spi_update_irq(s);
+    return ret;
+}
+
+static void assert_cs(MSSSpiState *s)
+{
+    qemu_set_irq(s->cs_line, 0);
+}
+
+static void deassert_cs(MSSSpiState *s)
+{
+    qemu_set_irq(s->cs_line, 1);
+}
+
+static void spi_flush_txfifo(MSSSpiState *s)
+{
+    uint32_t tx;
+    uint32_t rx;
+    bool sps = !!(s->regs[R_SPI_CONTROL] & C_SPS);
+
+    /*
+     * Chip Select(CS) is automatically controlled by this controller.
+     * If SPS bit is set in Control register then CS is asserted
+     * until all the frames set in frame count of Control register are
+     * transferred. If SPS is not set then CS pulses between frames.
+     * Note that Slave Select register specifies which of the CS line
+     * has to be controlled automatically by controller. Bits SS[7:1] are for
+     * masters in FPGA fabric since we model only Microcontroller subsystem
+     * of Smartfusion2 we control only one CS(SS[0]) line.
+     */
+    while (!fifo32_is_empty(&s->tx_fifo) && s->frame_count) {
+        assert_cs(s);
+
+        s->regs[R_SPI_STATUS] &= ~TXDONE;
+        s->regs[R_SPI_STATUS] &= ~RXRDY;
+
+        tx = fifo32_pop(&s->tx_fifo);
+        DB_PRINT("data tx:0x%" PRIx32 "\n", tx);
+        rx = ssi_transfer(s->spi, tx);
+        DB_PRINT("data rx:0x%" PRIx32 "\n", rx);
+
+        if (fifo32_num_used(&s->rx_fifo) == s->fifo_depth) {
+            s->regs[R_SPI_STATUS] |= RXCHOVRF;
+            s->regs[R_SPI_RIS] |= RXCHOVRF;
+        } else {
+            fifo32_push(&s->rx_fifo, rx);
+            s->regs[R_SPI_STATUS] &= ~S_RXFIFOEMP;
+            if (fifo32_num_used(&s->rx_fifo) == (s->fifo_depth - 1)) {
+                s->regs[R_SPI_STATUS] |= S_RXFIFOFULNXT;
+            }
+            if (fifo32_num_used(&s->rx_fifo) == s->fifo_depth) {
+                s->regs[R_SPI_STATUS] |= S_RXFIFOFUL;
+            }
+        }
+        s->frame_count--;
+        if (!sps) {
+            deassert_cs(s);
+            assert_cs(s);
+        }
+    }
+
+    if (!sps) {
+        deassert_cs(s);
+    }
+
+    if (!s->frame_count) {
+        s->frame_count = (s->regs[R_SPI_CONTROL] & FMCOUNT_MASK) >>
+                            FMCOUNT_SHIFT;
+        if (sps) {
+            deassert_cs(s);
+        }
+        s->regs[R_SPI_RIS] |= TXDONE;
+        s->regs[R_SPI_RIS] |= RXRDY;
+        s->regs[R_SPI_STATUS] |= TXDONE;
+        s->regs[R_SPI_STATUS] |= RXRDY;
+   }
+}
+
+static void spi_write(void *opaque, hwaddr addr,
+            uint64_t val64, unsigned int size)
+{
+    MSSSpiState *s = opaque;
+    uint32_t value = val64;
+
+    DB_PRINT("addr=0x%" HWADDR_PRIx " =0x%" PRIx32 "\n", addr, value);
+    addr >>= 2;
+
+    switch (addr) {
+    case R_SPI_TX:
+        /* adding to already full FIFO */
+        if (fifo32_num_used(&s->tx_fifo) == s->fifo_depth) {
+            break;
+        }
+        s->regs[R_SPI_STATUS] &= ~S_TXFIFOEMP;
+        fifo32_push(&s->tx_fifo, value);
+        if (fifo32_num_used(&s->tx_fifo) == (s->fifo_depth - 1)) {
+            s->regs[R_SPI_STATUS] |= S_TXFIFOFULNXT;
+        }
+        if (fifo32_num_used(&s->tx_fifo) == s->fifo_depth) {
+            s->regs[R_SPI_STATUS] |= S_TXFIFOFUL;
+        }
+        if (s->enabled) {
+            spi_flush_txfifo(s);
+        }
+        break;
+
+    case R_SPI_CONTROL:
+        s->regs[R_SPI_CONTROL] = value;
+        if (value & C_BIGFIFO) {
+            set_fifodepth(s);
+        } else {
+            s->fifo_depth = 4;
+        }
+        if (value & C_ENABLE) {
+            s->enabled = true;
+        } else {
+            s->enabled = false;
+        }
+        s->frame_count = (value & FMCOUNT_MASK) >> FMCOUNT_SHIFT;
+        if (value & C_RESET) {
+            mss_spi_do_reset(s);
+        }
+        break;
+
+    case R_SPI_DFSIZE:
+        if (s->enabled) {
+            break;
+        }
+        s->regs[R_SPI_DFSIZE] = value;
+        break;
+
+    case R_SPI_INTCLR:
+        s->regs[R_SPI_INTCLR] = value;
+        if (value & TXDONE) {
+            s->regs[R_SPI_RIS] &= ~TXDONE;
+        }
+        if (value & RXRDY) {
+            s->regs[R_SPI_RIS] &= ~RXRDY;
+        }
+        if (value & RXCHOVRF) {
+            s->regs[R_SPI_RIS] &= ~RXCHOVRF;
+        }
+        break;
+
+    case R_SPI_MIS:
+    case R_SPI_STATUS:
+    case R_SPI_RIS:
+        break;
+
+    default:
+        if (addr < ARRAY_SIZE(s->regs)) {
+            s->regs[addr] = value;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__,
+                         addr * 4);
+        }
+        break;
+    }
+
+    spi_update_irq(s);
+}
+
+static const MemoryRegionOps spi_ops = {
+    .read = spi_read,
+    .write = spi_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4
+    }
+};
+
+static void mss_spi_realize(DeviceState *dev, Error **errp)
+{
+    MSSSpiState *s = MSS_SPI(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    DB_PRINT("\n");
+
+    s->spi = ssi_create_bus(dev, "spi0");
+
+    sysbus_init_irq(sbd, &s->irq);
+    ssi_auto_connect_slaves(dev, &s->cs_line, s->spi);
+    sysbus_init_irq(sbd, &s->cs_line);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &spi_ops, s,
+                          TYPE_MSS_SPI, R_SPI_MAX * 4);
+    sysbus_init_mmio(sbd, &s->mmio);
+
+    fifo32_create(&s->tx_fifo, FIFO_CAPACITY);
+    fifo32_create(&s->rx_fifo, FIFO_CAPACITY);
+}
+
+static const VMStateDescription vmstate_mss_spi = {
+    .name = TYPE_MSS_SPI,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_FIFO32(tx_fifo, MSSSpiState),
+        VMSTATE_FIFO32(rx_fifo, MSSSpiState),
+        VMSTATE_UINT32_ARRAY(regs, MSSSpiState, R_SPI_MAX),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void mss_spi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = mss_spi_realize;
+    dc->reset = mss_spi_reset;
+    dc->vmsd = &vmstate_mss_spi;
+}
+
+static const TypeInfo mss_spi_info = {
+    .name           = TYPE_MSS_SPI,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(MSSSpiState),
+    .class_init     = mss_spi_class_init,
+};
+
+static void mss_spi_register_types(void)
+{
+    type_register_static(&mss_spi_info);
+}
+
+type_init(mss_spi_register_types)
diff --git a/include/hw/ssi/mss-spi.h b/include/hw/ssi/mss-spi.h
new file mode 100644
index 0000000..091307a
--- /dev/null
+++ b/include/hw/ssi/mss-spi.h
@@ -0,0 +1,104 @@
+/*
+ * Microsemi SmartFusion2 SPI
+ *
+ * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
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
+#ifndef HW_MSS_SPI_H
+#define HW_MSS_SPI_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/hw.h"
+#include "hw/ssi/ssi.h"
+#include "qemu/fifo32.h"
+#include "sysemu/sysemu.h"
+#include "qemu/log.h"
+
+#define FIFO_CAPACITY     32
+#define FIFO_CAPACITY     32
+
+#define R_SPI_CONTROL         0
+#define R_SPI_DFSIZE          1
+#define R_SPI_STATUS          2
+#define R_SPI_INTCLR          3
+#define R_SPI_RX              4
+#define R_SPI_TX              5
+#define R_SPI_CLKGEN          6
+#define R_SPI_SS              7
+#define R_SPI_MIS             8
+#define R_SPI_RIS             9
+#define R_SPI_MAX             16
+
+#define S_RXFIFOFUL       (1 << 4)
+#define S_RXFIFOFULNXT    (1 << 5)
+#define S_RXFIFOEMP       (1 << 6)
+#define S_RXFIFOEMPNXT    (1 << 7)
+#define S_TXFIFOFUL       (1 << 8)
+#define S_TXFIFOFULNXT    (1 << 9)
+#define S_TXFIFOEMP       (1 << 10)
+#define S_TXFIFOEMPNXT    (1 << 11)
+#define S_FRAMESTART      (1 << 12)
+#define S_SSEL            (1 << 13)
+#define S_ACTIVE          (1 << 14)
+
+#define C_ENABLE          (1 << 0)
+#define C_MODE            (1 << 1)
+#define C_INTRXDATA       (1 << 4)
+#define C_INTTXDATA       (1 << 5)
+#define C_INTRXOVRFLO     (1 << 6)
+#define C_SPS             (1 << 26)
+#define C_BIGFIFO         (1 << 29)
+#define C_RESET           (1 << 31)
+
+#define FRAMESZ_MASK      0x1F
+#define FMCOUNT_MASK      0x00FFFF00
+#define FMCOUNT_SHIFT     8
+
+#define TXDONE            (1 << 0)
+#define RXRDY             (1 << 1)
+#define RXCHOVRF          (1 << 2)
+
+#define TYPE_MSS_SPI   "mss-spi"
+#define MSS_SPI(obj)   OBJECT_CHECK(MSSSpiState, (obj), TYPE_MSS_SPI)
+
+typedef struct MSSSpiState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+
+    qemu_irq irq;
+
+    qemu_irq cs_line;
+
+    SSIBus *spi;
+
+    Fifo32 rx_fifo;
+    Fifo32 tx_fifo;
+
+    int fifo_depth;
+    uint32_t frame_count;
+    bool enabled;
+
+    uint32_t regs[R_SPI_MAX];
+} MSSSpiState;
+
+#endif /* HW_MSS_SPI_H */
-- 
2.5.0

