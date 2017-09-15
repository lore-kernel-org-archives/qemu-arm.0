Received: by 10.223.172.38 with SMTP id v35csp954358wrc;
        Fri, 15 Sep 2017 10:06:36 -0700 (PDT)
X-Received: by 10.200.24.203 with SMTP id o11mr37844620qtk.35.1505495196044;
        Fri, 15 Sep 2017 10:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505495196; cv=none;
        d=google.com; s=arc-20160816;
        b=My06Hy2Lg7+O0T/rGuFdZJ1jZagPfkFDP5YnR8sL1qKO6DJO3Fw9NE9UoQ5mKIDsVN
         RLssGaSUFKbzM9bwx+UwMNTKj5wch4euePjX8O+aD8LTlOK9srJ1r+Sy0QSY0D6bwKlR
         jWFC1pzxVG656hp+QpfvppzGa5C+7kHHu3HCcGmbfNgMxdGoN3eyz//YR25Og3Wp9lHV
         890sRn/DXL6GkyE+5kn8qRkqfnYPlsSIMPDm3cbF1o3M1EEA4zH2gYx0jMmEicn61Cwm
         J5h9F9lKyTgq4gLMQzw+U9FfQ0s/eyzLgekGkx4WDDq9pJwa4jHfbImTnly9EX/AleQv
         Hhgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=tm10aCIkGW+uG5Vj16uLl/SCD27VG/4Bq7qyBEcyY9Q=;
        b=rk9Oto7jxS6rwFRmRsZsdz5nGbhpfAnodMEmS+6BS3Nx31VyXlcT4ICPoVHI3Fg2ou
         g9SHoNJt0u76jtQuZ7lIXstl3tFf1OpHGxPKODiswF+MZcVc226P69U75yYIGxIo7tRm
         RZHW4vHBAJtiLbmwZYQsckl+Rdxfpa2AMgacZXYlnfkMAKojdz00T/nfNUz4EpI1kQu5
         eeCnweATQ6xSQkzVvyEzriC4htRUdo5UHnQ29PMhLv99r1qlL0PEo4kefZ0dOTC9Fre0
         eALVqBs5DyoL8I/VfyUwZLm0kgDZw7mBw7Gb6iA/2NF0TB7kWdSK4NFYWs9JNJjnOH47
         /bKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ra16pPeW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l23si1409551qtc.185.2017.09.15.10.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Sep 2017 10:06:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ra16pPeW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsu4X-00033l-JC
	for alex.bennee@linaro.org; Fri, 15 Sep 2017 13:06:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dstxr-0005O3-1K
	for qemu-devel@nongnu.org; Fri, 15 Sep 2017 12:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dstxp-00042h-5L
	for qemu-devel@nongnu.org; Fri, 15 Sep 2017 12:59:39 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:36829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dstxo-00042K-S7; Fri, 15 Sep 2017 12:59:37 -0400
Received: by mail-pg0-x244.google.com with SMTP id d8so1602584pgt.3;
	Fri, 15 Sep 2017 09:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tm10aCIkGW+uG5Vj16uLl/SCD27VG/4Bq7qyBEcyY9Q=;
	b=ra16pPeWNAHjDoQpzTrbyfZdEqAAo7BqhtfUSYXimAwG3xxOFSHXsH7+AddsSa8dnm
	7ceMiCNstfkSgcLVwKHS9pc0F0Ejw8vobgebRtNQFMVCqdt7cCayUuzsxK/TJVK06InU
	HijE3aAc+Bo41x+A88jtzLYya6hqwkPLeOcQ0I5dcXvSqgw6vwK3SGE7JUByNT9dn2cf
	dBj1zRaBC07GP2Q9CY+6ifJPbqh2BW+xnaAyFWN+Fw572VpnQRhTBKi64bttrQs7Vi4u
	nnW2bvSTf8UtHXai0UiIl7yQlGA5PNtW/+r7FKNRhXSEq7BRIynCkrbVTqgNQhqfNq81
	zImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tm10aCIkGW+uG5Vj16uLl/SCD27VG/4Bq7qyBEcyY9Q=;
	b=pt02E9ikIq2JcWqLhg0xY8llEkCT7tUMPYvBgxXJYqLQl6BcBLJBKZZPEm4kkiKlOt
	A3qEXNjWemtaJkUF1Duep8J+Ic44jdi1uVJagsVyuedSfCLKYv1CkHBLybxp6pjHiDAg
	1OaZbNQdN4xBouMImNmHzwdgnpAPqKs4jEf/SmzGE+lY6KjCop3Ryy8HGonZuKAZ9HmR
	QXGuuZF7rzr4ZHYiqp0GQJnkZpRvuoj2W2pXt9fzytTM+1NAfCUWBAgBKray3oNMv0oN
	ZuoDzSrPg6yvK4actyYhwILiefBkYkD1s4BWacb/Kkh3FBpHnTUaaiel9VRjAaeq7ixM
	6k2w==
X-Gm-Message-State: AHPjjUhsWdcskk8eNHkKQHuRgYpTq7Qr9oZ0SlNAfd3HTQXGjHbN368p
	HzaqNKnXPTiA6aNM
X-Google-Smtp-Source: ADKCNb7tBf4EierF8Hrx9kG/rV15dqaxWr0QPYYFnMNYIl1U6Jj+g5dH2gyODjh54NzI+3NHi7nz4Q==
X-Received: by 10.101.64.139 with SMTP id t11mr15430004pgp.299.1505494775538; 
	Fri, 15 Sep 2017 09:59:35 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	s17sm3111350pgq.25.2017.09.15.09.59.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 09:59:35 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 15 Sep 2017 22:29:11 +0530
Message-Id: <1505494753-10837-4-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [Qemu devel v9 PATCH 3/5] msf2: Add Smartfusion2 SPI
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
X-TUID: FG18dB22j78T

Modelled Microsemi's Smartfusion2 SPI controller.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/ssi/Makefile.objs     |   1 +
 hw/ssi/mss-spi.c         | 404 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/ssi/mss-spi.h |  58 +++++++
 3 files changed, 463 insertions(+)
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
index 0000000..5a8e308
--- /dev/null
+++ b/hw/ssi/mss-spi.c
@@ -0,0 +1,404 @@
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
+    MSSSpiState *s = MSS_SPI(d);
+
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
+            return ret;
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
+        deassert_cs(s);
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
+            mss_spi_reset(DEVICE(s));
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

