Received: by 10.223.188.70 with SMTP id a6csp4715152wrh;
        Mon, 28 Aug 2017 09:40:28 -0700 (PDT)
X-Received: by 10.55.104.207 with SMTP id d198mr1633471qkc.212.1503938427908;
        Mon, 28 Aug 2017 09:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503938427; cv=none;
        d=google.com; s=arc-20160816;
        b=DMeS+6PCll/p4yd2Yc/qa8Z6dD7kFjhxQqp/b6i6za6unai8AOVsV/txfF6x+1GwIS
         utLP0Twf/0m1atm0FtU2Z8WTMRKl3SE/wqsPoEytov7jT6hF7xio1mkjMtAylR3gGp3T
         5QLaZ+WvBO4GaVVzZbu9XAU9xxQFGsmPTa+qutbZrjhTSvNxScc3vAV8owY4NqVSi48F
         OTk6eaODPC3QjSKJyazks74zzsCH75oWOn1Dni+TLO8vs5nv2IUX0wbHEAhrKTMuHQ8D
         +fTQG1krGVJCYEzrteDpfdPbA8NUzDEqsO5Vx2S2H+OZtaJC9ok/g71Y29c0J2hZCSrd
         4LWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=CZt6smooU+cMTU7VsxO7IJ0GNR4+qZuX1H3rZD8U3uo=;
        b=RFeMCbe1PKHtcUB0wJbkpzbUwrKa/jrlU2MzyR1IKCsLAOPQE2LzlzvB1L916PWpSW
         SP1CPS/pWeDAg//gWyAA23zcndqmeKvNKQzZGV9Xvg0YJrIxHTDEkexA9s0T8ByfJ5N5
         D04dmtcxkwCEfk9Xnx6btxlOFnDC/2MtffgQfqFvBxQ9DrPQsWmo0NwZ1YrR8KFMW4rC
         d9idgjEU0anOjuK9bQVsWdK/xzBzIHI31CVxWisYleuq7pB9WFSPzts7Fjb3Hm42kEY0
         W+XW3h4so2Z2mbcPfPhEGTyruXlByC0ppEAdAj/Q0pKow/6it0nEsgM6nfpQsX9vTIzm
         CHhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tTcGsDqL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n87si798465qkh.224.2017.08.28.09.40.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 09:40:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tTcGsDqL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmN5N-0003BI-D9
	for alex.bennee@linaro.org; Mon, 28 Aug 2017 12:40:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dmN3U-00020J-MS
	for qemu-devel@nongnu.org; Mon, 28 Aug 2017 12:38:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dmN3S-0003Lm-BL
	for qemu-devel@nongnu.org; Mon, 28 Aug 2017 12:38:28 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:36114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dmN3S-0003IP-3F; Mon, 28 Aug 2017 12:38:26 -0400
Received: by mail-pf0-x241.google.com with SMTP id k3so635423pfc.3;
	Mon, 28 Aug 2017 09:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CZt6smooU+cMTU7VsxO7IJ0GNR4+qZuX1H3rZD8U3uo=;
	b=tTcGsDqLoRAURyTnbozm+vl6Ab9s59szVSHsssJoU0z3mVt0LWCMhUXD5uzx2AjvUV
	gmB9xMK/aYe8Fb2VDFRRrEomrQJh4AANoACKY4KxdzbCC7vTefbEvn0O+6rPLK5K5Wgl
	14GIvg1lI1BauLTwknqP/MN0MjZ0ytp9/OiWb32s5tVnzKczcIEoS5nxBBH1Kg36GKIs
	+sb6JbyYIBVpwGIcqIaoxt/2oBRvQUI71ggSZ2r48bGPykllNgymvmt7Dg4QlLu09muJ
	uEGFQ9vZ29PO0GGOd8/x7hIojfka9aVP6sMKaxBldQR/GlfnEqxnzR2jStDeFNjnup2l
	qcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CZt6smooU+cMTU7VsxO7IJ0GNR4+qZuX1H3rZD8U3uo=;
	b=Bf8GbdYI/hleSn1K8OPObg5+gYeEfEoac6FZPaCI3ICpwMhTa5oZr/b3gIjB7YyLKT
	O4iE/2/uFqVRk4iPJU/b5wmrfDUb6d2zJ5rJHXu/Ufg37s00MavkesDhHq8fCNfwwwIv
	s22wycxZf9IZjDosvsZzX+naIO4zxZAMmafwRErgtQrWB7xIwgaEwioqWJXe/PhPZULv
	Srg7k7o1xMrnDW3ZvygYqCsmLeISCVUJ6hyFBvqPEPqyq2UrrzKkDmeTy5hj6raTRfLg
	zzjJEB6nHUX0scyij8qFBzXa8jqaX3/RGgyuUQCbaEU2+CMFoz4nyfMM2vRt8VjvvQSW
	kiEQ==
X-Gm-Message-State: AHYfb5jqMh8bjadugBTS9IwTKf489Xy2Ck2qJ6eMaXLZk+tnuHHlk+8l
	z8kQLZxHTwfXup64
X-Google-Smtp-Source: ADKCNb40pM/Z8COCQ80h27R8BdC9DIgD0hJHQF0sEwBrathU+twmtS/N8vldrtwnemNxr+a88WOaLQ==
X-Received: by 10.99.49.194 with SMTP id x185mr1165763pgx.416.1503938304851;
	Mon, 28 Aug 2017 09:38:24 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	n66sm1935015pfi.44.2017.08.28.09.38.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Aug 2017 09:38:24 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 28 Aug 2017 22:08:01 +0530
Message-Id: <1503938283-12404-4-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [Qemu devel v7 PATCH 3/5] msf2: Add Smartfusion2 SPI
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
	f4bug@amsat.org, alistair23@gmail.com, crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZOMIP4Y4Cyhd

Modelled Microsemi's Smartfusion2 SPI controller.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/ssi/Makefile.objs     |   1 +
 hw/ssi/mss-spi.c         | 409 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/ssi/mss-spi.h |  58 +++++++
 3 files changed, 468 insertions(+)
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
index 0000000..7209363
--- /dev/null
+++ b/hw/ssi/mss-spi.c
@@ -0,0 +1,409 @@
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
+#include "qemu/osdep.h"
+#include "hw/ssi/mss-spi.h"
+#include "qemu/log.h"
+
+#ifndef MSS_SPI_ERR_DEBUG
+#define MSS_SPI_ERR_DEBUG   0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do { \
+    if (MSS_SPI_ERR_DEBUG >= lvl) { \
+        qemu_log("%s: " fmt "\n", __func__, ## args); \
+    } \
+} while (0);
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+#define FIFO_CAPACITY         32
+#define FIFO_CAPACITY         32
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
+
+#define S_TXDONE             (1 << 0)
+#define S_RXRDY              (1 << 1)
+#define S_RXCHOVRF           (1 << 2)
+#define S_RXFIFOFUL          (1 << 4)
+#define S_RXFIFOFULNXT       (1 << 5)
+#define S_RXFIFOEMP          (1 << 6)
+#define S_RXFIFOEMPNXT       (1 << 7)
+#define S_TXFIFOFUL          (1 << 8)
+#define S_TXFIFOFULNXT       (1 << 9)
+#define S_TXFIFOEMP          (1 << 10)
+#define S_TXFIFOEMPNXT       (1 << 11)
+#define S_FRAMESTART         (1 << 12)
+#define S_SSEL               (1 << 13)
+#define S_ACTIVE             (1 << 14)
+
+#define C_ENABLE             (1 << 0)
+#define C_MODE               (1 << 1)
+#define C_INTRXDATA          (1 << 4)
+#define C_INTTXDATA          (1 << 5)
+#define C_INTRXOVRFLO        (1 << 6)
+#define C_SPS                (1 << 26)
+#define C_BIGFIFO            (1 << 29)
+#define C_RESET              (1 << 31)
+
+#define FRAMESZ_MASK         0x1F
+#define FMCOUNT_MASK         0x00FFFF00
+#define FMCOUNT_SHIFT        8
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
+    unsigned int size = s->regs[R_SPI_DFSIZE] & FRAMESZ_MASK;
+
+    if (size <= 8) {
+        s->fifo_depth = 32;
+    } else if (size <= 16) {
+        s->fifo_depth = 16;
+    } else if (size <= 32) {
+        s->fifo_depth = 8;
+    } else {
+        s->fifo_depth = 4;
+    }
+}
+
+static void mss_spi_do_reset(MSSSpiState *s)
+{
+    memset(s->regs, 0, sizeof s->regs);
+    s->regs[R_SPI_CONTROL] = 0x80000102;
+    s->regs[R_SPI_DFSIZE] = 0x4;
+    s->regs[R_SPI_STATUS] = S_SSEL | S_TXFIFOEMP | S_RXFIFOEMP;
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
+        s->regs[R_SPI_STATUS] &= ~S_RXCHOVRF;
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
+    DB_PRINT("addr=0x%" HWADDR_PRIx " = 0x%" PRIx32, addr * 4, ret);
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
+        s->regs[R_SPI_STATUS] &= ~(S_TXDONE | S_RXRDY);
+
+        tx = fifo32_pop(&s->tx_fifo);
+        DB_PRINT("data tx:0x%" PRIx32, tx);
+        rx = ssi_transfer(s->spi, tx);
+        DB_PRINT("data rx:0x%" PRIx32, rx);
+
+        if (fifo32_num_used(&s->rx_fifo) == s->fifo_depth) {
+            s->regs[R_SPI_STATUS] |= S_RXCHOVRF;
+            s->regs[R_SPI_RIS] |= S_RXCHOVRF;
+        } else {
+            fifo32_push(&s->rx_fifo, rx);
+            s->regs[R_SPI_STATUS] &= ~S_RXFIFOEMP;
+            if (fifo32_num_used(&s->rx_fifo) == (s->fifo_depth - 1)) {
+                s->regs[R_SPI_STATUS] |= S_RXFIFOFULNXT;
+            } else if (fifo32_num_used(&s->rx_fifo) == s->fifo_depth) {
+                s->regs[R_SPI_STATUS] |= S_RXFIFOFUL;
+            }
+        }
+        s->frame_count--;
+        if (!sps) {
+            deassert_cs(s);
+        }
+    }
+
+    if (!s->frame_count) {
+        s->frame_count = (s->regs[R_SPI_CONTROL] & FMCOUNT_MASK) >>
+                            FMCOUNT_SHIFT;
+        if (sps) {
+            deassert_cs(s);
+        }
+        s->regs[R_SPI_RIS] |= S_TXDONE | S_RXRDY;
+        s->regs[R_SPI_STATUS] |= S_TXDONE | S_RXRDY;
+   }
+}
+
+static void spi_write(void *opaque, hwaddr addr,
+            uint64_t val64, unsigned int size)
+{
+    MSSSpiState *s = opaque;
+    uint32_t value = val64;
+
+    DB_PRINT("addr=0x%" HWADDR_PRIx " =0x%" PRIx32, addr, value);
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
+        } else if (fifo32_num_used(&s->tx_fifo) == s->fifo_depth) {
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
+        s->enabled = value & C_ENABLE;
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
+        if (value & S_TXDONE) {
+            s->regs[R_SPI_RIS] &= ~S_TXDONE;
+        }
+        if (value & S_RXRDY) {
+            s->regs[R_SPI_RIS] &= ~S_RXRDY;
+        }
+        if (value & S_RXCHOVRF) {
+            s->regs[R_SPI_RIS] &= ~S_RXCHOVRF;
+        }
+        break;
+
+    case R_SPI_MIS:
+    case R_SPI_STATUS:
+    case R_SPI_RIS:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                         "%s: Write to read only register 0x%" HWADDR_PRIx "\n",
+                         __func__, addr * 4);
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
+    s->spi = ssi_create_bus(dev, "spi");
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
index 0000000..f0cf324
--- /dev/null
+++ b/include/hw/ssi/mss-spi.h
@@ -0,0 +1,58 @@
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
+#include "hw/sysbus.h"
+#include "hw/ssi/ssi.h"
+#include "qemu/fifo32.h"
+
+#define TYPE_MSS_SPI   "mss-spi"
+#define MSS_SPI(obj)   OBJECT_CHECK(MSSSpiState, (obj), TYPE_MSS_SPI)
+
+#define R_SPI_MAX             16
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

