Received: by 10.25.0.144 with SMTP id 138csp485028lfa;
        Sun, 9 Apr 2017 04:21:39 -0700 (PDT)
X-Received: by 10.55.46.71 with SMTP id u68mr45671688qkh.115.1491736899060;
        Sun, 09 Apr 2017 04:21:39 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u46si10980631qtu.318.2017.04.09.04.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Apr 2017 04:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxAuY-00059M-F5
	for alex.bennee@linaro.org; Sun, 09 Apr 2017 07:21:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1cxAsr-0004Cv-Tf
	for qemu-devel@nongnu.org; Sun, 09 Apr 2017 07:19:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1cxAso-00010A-AM
	for qemu-devel@nongnu.org; Sun, 09 Apr 2017 07:19:53 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:34842)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1cxAso-0000zf-1w; Sun, 09 Apr 2017 07:19:50 -0400
Received: by mail-pf0-x242.google.com with SMTP id n11so5864134pfg.2;
	Sun, 09 Apr 2017 04:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NJSagYw/aseHu+HqyOPJNCi92ayY3jClPDrehb+ckT0=;
	b=hzsUF8N3h0/W3CXxWfzOdd+6xLa7CJJkt2s3Uxe2gYTvXNIv5hd0hew6OpNUOPwwRu
	aVhP/FPkd72+sH4FG9JSTVIetVwiRDyIyfbTKPHi4O2//nGfq+jx1FeN4FZ/kNPNPHfn
	mWVI4MbrJ6yQLsvBeOx3YRbEPhVcL9g+hmAhrH7sa1w3EfWGBfNZjvwvUfML1tRWjO7Z
	BUi5Al22FNtCUngx8ftCU5QoPg5nUinKUexjA+5YxYT7dbS+yjnhKb6cv63MibvnIMFh
	nfOeh+P2XwUEyiKVEF59K6UBeVOTSVh0frjdECImAqfkeXaU6Dd0wXL9WtjqY8mmBk3s
	rh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NJSagYw/aseHu+HqyOPJNCi92ayY3jClPDrehb+ckT0=;
	b=meSlh3nawIzIdVG6FDht2y00/qG/bEPHDa7w2PeYbBz9cxYuLtBWjNUBRLqXxJPehK
	WtNvTZPDIkq99OFPNIUCTBrED8WR0mWdRrgToHBPEWPKx25HLofaVYXMJyh5ExQBIug6
	BNKO0oPyhLJfTHIq6Ffn1+KawFn583gQsxPgpe48QUYr5dI7gJhRvfL3VKFjiBXwUVf3
	QP1iUtH+RsdvxIm5e8/c2lfbv3CZs9t2FecgT3iWPScaYuBLk1uolb4NUKMlZNG2S4+e
	fplJXo9Jv5LvMCJ0af2wEkyJ4G+mhuwuM3XubHt/G2jzmYU6GNpEeYF7rc5tE0/HAOWx
	+sGw==
X-Gm-Message-State: AFeK/H3C5WiAENP767sdZY9C8zWnJknwHxE9E1ISRqidKK572HEuAHIsdtbyY9StVgMBEA==
X-Received: by 10.98.137.68 with SMTP id v65mr35386730pfd.125.1491736789031;
	Sun, 09 Apr 2017 04:19:49 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	g5sm18914139pgn.38.2017.04.09.04.19.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Apr 2017 04:19:48 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun,  9 Apr 2017 16:49:17 +0530
Message-Id: <1491736758-19540-4-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [Qemu-devel RFC v2 3/4] msf2: Add Smartfusion2 SPI
 controller
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
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lxetz9tIkwO8

Modelled Microsemi's Smartfusion2 SPI controller.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/ssi/Makefile.objs |   1 +
 hw/ssi/msf2_spi.c    | 449 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 450 insertions(+)
 create mode 100644 hw/ssi/msf2_spi.c

diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
index 487add2..86445d7 100644
--- a/hw/ssi/Makefile.objs
+++ b/hw/ssi/Makefile.objs
@@ -4,6 +4,7 @@ common-obj-$(CONFIG_XILINX_SPI) += xilinx_spi.o
 common-obj-$(CONFIG_XILINX_SPIPS) += xilinx_spips.o
 common-obj-$(CONFIG_ASPEED_SOC) += aspeed_smc.o
 common-obj-$(CONFIG_STM32F2XX_SPI) += stm32f2xx_spi.o
+common-obj-$(CONFIG_MSF2) += msf2_spi.o
 
 obj-$(CONFIG_OMAP) += omap_spi.o
 obj-$(CONFIG_IMX) += imx_spi.o
diff --git a/hw/ssi/msf2_spi.c b/hw/ssi/msf2_spi.c
new file mode 100644
index 0000000..6054cd8
--- /dev/null
+++ b/hw/ssi/msf2_spi.c
@@ -0,0 +1,449 @@
+/*
+ * SPI controller model of Microsemi Smartfusion2.
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
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "sysemu/sysemu.h"
+#include "qemu/log.h"
+#include "qemu/fifo32.h"
+
+#include "hw/ssi/ssi.h"
+
+#ifdef MSF2_SPI_ERR_DEBUG
+#define DB_PRINT(...) do { \
+    fprintf(stderr,  ": %s: ", __func__); \
+    fprintf(stderr, ## __VA_ARGS__); \
+    } while (0);
+#else
+    #define DB_PRINT(...)
+#endif
+
+#define FIFO_CAPACITY     32
+#define FIFO_CAPACITY     32
+
+#define R_CONTROL         0
+#define R_DFSIZE          1
+#define R_STATUS          2
+#define R_INTCLR          3
+#define R_RX              4
+#define R_TX              5
+#define R_CLKGEN          6
+#define R_SS              7
+#define R_MIS             8
+#define R_RIS             9
+#define R_CONTROL2        10
+#define R_COMMAND         11
+#define R_PKTSIZE         12
+#define R_CMDSIZE         13
+#define R_HWSTATUS        14
+#define R_STAT8           15
+#define R_MAX             16
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
+#define TYPE_MSF2_SPI   "msf2-spi"
+#define MSF2_SPI(obj)   OBJECT_CHECK(Msf2SPI, (obj), TYPE_MSF2_SPI)
+
+typedef struct Msf2SPI {
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
+    uint32_t regs[R_MAX];
+} Msf2SPI;
+
+static void txfifo_reset(Msf2SPI *s)
+{
+    fifo32_reset(&s->tx_fifo);
+
+    s->regs[R_STATUS] &= ~S_TXFIFOFUL;
+    s->regs[R_STATUS] |= S_TXFIFOEMP;
+}
+
+static void rxfifo_reset(Msf2SPI *s)
+{
+    fifo32_reset(&s->rx_fifo);
+
+    s->regs[R_STATUS] &= ~S_RXFIFOFUL;
+    s->regs[R_STATUS] |= S_RXFIFOEMP;
+}
+
+static void set_fifodepth(Msf2SPI *s)
+{
+    int size = s->regs[R_DFSIZE] & FRAMESZ_MASK;
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
+static void msf2_spi_do_reset(Msf2SPI *s)
+{
+    memset(s->regs, 0, sizeof s->regs);
+    s->regs[R_CONTROL] = 0x80000102;
+    s->regs[R_DFSIZE] = 0x4;
+    s->regs[R_STATUS] = 0x2440;
+    s->regs[R_CLKGEN] = 0x7;
+    s->regs[R_STAT8] = 0x7;
+    s->regs[R_RIS] = 0x0;
+
+    s->fifo_depth = 4;
+    s->frame_count = 1;
+    s->enabled = false;
+
+    rxfifo_reset(s);
+    txfifo_reset(s);
+}
+
+static void update_mis(Msf2SPI *s)
+{
+    uint32_t reg = s->regs[R_CONTROL];
+    uint32_t tmp;
+
+    /*
+     * form the Control register interrupt enable bits
+     * same as RIS, MIS and Interrupt clear registers for simplicity
+     */
+    tmp = ((reg & C_INTRXOVRFLO) >> 4) | ((reg & C_INTRXDATA) >> 3) |
+           ((reg & C_INTTXDATA) >> 5);
+    s->regs[R_MIS] |= tmp & s->regs[R_RIS];
+}
+
+static void spi_update_irq(Msf2SPI *s)
+{
+    int irq;
+
+    update_mis(s);
+    irq = !!(s->regs[R_MIS]);
+
+    qemu_set_irq(s->irq, irq);
+}
+
+static void msf2_spi_reset(DeviceState *d)
+{
+    msf2_spi_do_reset(MSF2_SPI(d));
+}
+
+static uint64_t
+spi_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    Msf2SPI *s = opaque;
+    uint32_t r = 0;
+
+    addr >>= 2;
+    switch (addr) {
+    case R_RX:
+        s->regs[R_STATUS] &= ~S_RXFIFOFUL;
+        s->regs[R_STATUS] &= ~RXCHOVRF;
+        r = fifo32_pop(&s->rx_fifo);
+        if (fifo32_is_empty(&s->rx_fifo)) {
+            s->regs[R_STATUS] |= S_RXFIFOEMP;
+        }
+        break;
+
+    case R_MIS:
+        update_mis(s);
+        r = s->regs[R_MIS];
+        break;
+
+    default:
+        if (addr < ARRAY_SIZE(s->regs)) {
+            r = s->regs[addr];
+        }
+        break;
+    }
+
+    DB_PRINT("addr=" TARGET_FMT_plx " = %x\n", addr * 4, r);
+    spi_update_irq(s);
+    return r;
+}
+
+static void assert_cs(Msf2SPI *s)
+{
+    qemu_set_irq(s->cs_line, 0);
+}
+
+static void deassert_cs(Msf2SPI *s)
+{
+    qemu_set_irq(s->cs_line, 1);
+}
+
+static void spi_flush_txfifo(Msf2SPI *s)
+{
+    uint32_t tx;
+    uint32_t rx;
+    bool sps = !!(s->regs[R_CONTROL] & C_SPS);
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
+        s->regs[R_STATUS] &= ~TXDONE;
+        s->regs[R_STATUS] &= ~RXRDY;
+
+        tx = fifo32_pop(&s->tx_fifo);
+        DB_PRINT("data tx:%x\n", tx);
+        rx = ssi_transfer(s->spi, tx);
+        DB_PRINT("data rx:%x\n", rx);
+
+        if (fifo32_num_used(&s->rx_fifo) == s->fifo_depth) {
+            s->regs[R_STATUS] |= RXCHOVRF;
+            s->regs[R_RIS] |= RXCHOVRF;
+        } else {
+            fifo32_push(&s->rx_fifo, rx);
+            s->regs[R_STATUS] &= ~S_RXFIFOEMP;
+            if (fifo32_num_used(&s->rx_fifo) == (s->fifo_depth - 1)) {
+                s->regs[R_STATUS] |= S_RXFIFOFULNXT;
+            }
+            if (fifo32_num_used(&s->rx_fifo) == s->fifo_depth) {
+                s->regs[R_STATUS] |= S_RXFIFOFUL;
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
+        s->frame_count = (s->regs[R_CONTROL] & FMCOUNT_MASK) >> FMCOUNT_SHIFT;
+        if (sps) {
+            deassert_cs(s);
+        }
+        s->regs[R_RIS] |= TXDONE;
+        s->regs[R_RIS] |= RXRDY;
+        s->regs[R_STATUS] |= TXDONE;
+        s->regs[R_STATUS] |= RXRDY;
+   }
+}
+
+static void spi_write(void *opaque, hwaddr addr,
+            uint64_t val64, unsigned int size)
+{
+    Msf2SPI *s = opaque;
+    uint32_t value = val64;
+
+    DB_PRINT("addr=" TARGET_FMT_plx " = %x\n", addr, value);
+    addr >>= 2;
+
+    switch (addr) {
+    case R_TX:
+        /* adding to already full FIFO */
+        if (fifo32_num_used(&s->tx_fifo) == s->fifo_depth) {
+            break;
+        }
+        s->regs[R_STATUS] &= ~S_TXFIFOEMP;
+        fifo32_push(&s->tx_fifo, value);
+        if (fifo32_num_used(&s->tx_fifo) == (s->fifo_depth - 1)) {
+            s->regs[R_STATUS] |= S_TXFIFOFULNXT;
+        }
+        if (fifo32_num_used(&s->tx_fifo) == s->fifo_depth) {
+            s->regs[R_STATUS] |= S_TXFIFOFUL;
+        }
+        if (s->enabled) {
+            spi_flush_txfifo(s);
+        }
+        break;
+
+    case R_CONTROL:
+        s->regs[R_CONTROL] = value;
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
+            msf2_spi_do_reset(s);
+        }
+        break;
+
+    case R_DFSIZE:
+        if (s->enabled) {
+            break;
+        }
+        s->regs[R_DFSIZE] = value;
+        break;
+
+    case R_INTCLR:
+        s->regs[R_INTCLR] = value;
+        if (value & TXDONE) {
+            s->regs[R_RIS] &= ~TXDONE;
+        }
+        if (value & RXRDY) {
+            s->regs[R_RIS] &= ~RXRDY;
+        }
+        if (value & RXCHOVRF) {
+            s->regs[R_RIS] &= ~RXCHOVRF;
+        }
+        break;
+
+    case R_MIS:
+    case R_STATUS:
+    case R_RIS:
+        break;
+
+    default:
+        if (addr < ARRAY_SIZE(s->regs)) {
+            s->regs[addr] = value;
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
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static int msf2_spi_init(SysBusDevice *sbd)
+{
+    DeviceState *dev = DEVICE(sbd);
+    Msf2SPI *s = MSF2_SPI(dev);
+
+    DB_PRINT("\n");
+
+    s->spi = ssi_create_bus(dev, "spi");
+
+    sysbus_init_irq(sbd, &s->irq);
+    ssi_auto_connect_slaves(dev, &s->cs_line, s->spi);
+    sysbus_init_irq(sbd, &s->cs_line);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &spi_ops, s,
+                          "msf2-spi", R_MAX * 4);
+    sysbus_init_mmio(sbd, &s->mmio);
+
+    fifo32_create(&s->tx_fifo, FIFO_CAPACITY);
+    fifo32_create(&s->rx_fifo, FIFO_CAPACITY);
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_msf2_spi = {
+    .name = "msf2_spi",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_FIFO32(tx_fifo, Msf2SPI),
+        VMSTATE_FIFO32(rx_fifo, Msf2SPI),
+        VMSTATE_UINT32_ARRAY(regs, Msf2SPI, R_MAX),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void msf2_spi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
+
+    k->init = msf2_spi_init;
+    dc->reset = msf2_spi_reset;
+    dc->vmsd = &vmstate_msf2_spi;
+}
+
+static const TypeInfo msf2_spi_info = {
+    .name           = TYPE_MSF2_SPI,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(Msf2SPI),
+    .class_init     = msf2_spi_class_init,
+};
+
+static void msf2_spi_register_types(void)
+{
+    type_register_static(&msf2_spi_info);
+}
+
+type_init(msf2_spi_register_types)
-- 
2.5.0

