Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3655707wrd;
        Mon, 17 Sep 2018 01:42:46 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbvYPQR7wraA/65cvLBOGJ+mC53rBvl+n4SMBgN5cB/21WSfmtw5qOABbxlw3heGXoxHuEd
X-Received: by 2002:a0c:f752:: with SMTP id e18-v6mr17215929qvo.105.1537173766446;
        Mon, 17 Sep 2018 01:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537173766; cv=none;
        d=google.com; s=arc-20160816;
        b=Loq4TdUVO3CLSFt+MW/08Xm54dsSLRbfLVnUmfisjPfgDghw/Dh+qbU6YBKNl8SIyf
         95wlEV4+/n6Os4dy1fdZjC5qnNVUhrkkxpRzPEPJkWFxfgu6RyaPAEuULM3GPTZrByKt
         XLe3+5sACY+0hEwyjaqKD6jdsrBgQfWJNtqR1KblQD9Dy3tm63VjWYbkFtV8My/M/++E
         qIwwvKnflqO3VVhPeq48y3L2dTqhymP7dA45RvFlZnyu2Lt27RukfOkTH6tZzh9jxNpA
         8i/IWe0zp1wL4DEgwBA7yyDeC882TJEj0xeXyufbchlqjqtKTrWWTgV50PC+C76M+wXG
         6O1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=5Q7B+08ZbjLgHJojhdgAAWbDDLFIGaN6lWTRenk3JmE=;
        b=ddLuVG/e8+mgfm6RTyYjycQtNayewRU9R6zby/MHNKHScVNJn5ybGVrd8bH/HsiDYK
         1R86SC+wRL/zZ4T7UVh0gnvk8PoAYOnFtbGcQWffQClRk1ZFTAHgIpeolpdjWLxIe0cg
         Zl6IEmMwTJrh5kSeEUNqLc0CEnB7aU8TvORm9WNa3nQdC7yi94VlL75Dx25kxE+pHn+d
         f72ixrhLL63oPveG2bcKvIOFRTSLtVt8YsRb6Pr+5r3qFEEltQvpE9o6myzJ9J9EBLq6
         gBgUmBMWF75C/f+ZMb4gHHLEDZmo5h0WVSkL2617wP+n+zvCJGedRRvAyfGme/Kls3EB
         Preg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=aenRATUB;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Ke8oV7+2;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Ke8oV7+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r26-v6si7577659qtf.242.2018.09.17.01.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 01:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=aenRATUB;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Ke8oV7+2;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Ke8oV7+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1p7F-0007Ab-UW
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 04:42:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5u-00069M-TA
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5q-0005WY-OD
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:22 -0400
Received: from greensocs.com ([193.104.36.180]:51749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g1p5q-0005VT-7T; Mon, 17 Sep 2018 04:41:18 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id B4514521ABC;
	Mon, 17 Sep 2018 10:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173672;
	bh=Mu8KiNTn9ZoRcYYBcP3Ma8/KD+OuRXk+9TZscwr0LmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aenRATUBWZp1EevJ3/PU9nMUExc9qkqif2Wi9T+c85LuT20AoPwRlX5et/4lIiCQF
	cFau6WijguqVVzFRjV7iGp1bm6OZniSoFvTL8/IrcuxMCxYep58FRqqvzlgn+1BZLr
	ISfIKWbCe5XxQqdPQ5O5aO8pFzYCjkz1G8Lq5Q9A=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Ke8oV7+2;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Ke8oV7+2
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YTdHKuO8Lf3F; Mon, 17 Sep 2018 10:41:11 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id C5FD7443480; Mon, 17 Sep 2018 10:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173671;
	bh=Mu8KiNTn9ZoRcYYBcP3Ma8/KD+OuRXk+9TZscwr0LmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ke8oV7+2b4zpMRHXW/JXJ2XooWR5ib+B9xZQGHq2HyXYpPHcNeYBLz53TYIvytdyD
	f2hZn3iG1JuBgeO2HogBTp2wo8uj2N4tunlrg4neBILnh/MURIDX1dWGpPcUvt9+T6
	aS2NtO+WUGW0OoQjM0VIbcyz8F5hbDzCzutus8IU=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 38C262386FB;
	Mon, 17 Sep 2018 10:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173671;
	bh=Mu8KiNTn9ZoRcYYBcP3Ma8/KD+OuRXk+9TZscwr0LmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ke8oV7+2b4zpMRHXW/JXJ2XooWR5ib+B9xZQGHq2HyXYpPHcNeYBLz53TYIvytdyD
	f2hZn3iG1JuBgeO2HogBTp2wo8uj2N4tunlrg4neBILnh/MURIDX1dWGpPcUvt9+T6
	aS2NtO+WUGW0OoQjM0VIbcyz8F5hbDzCzutus8IU=
From: damien.hedde@greensocs.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 10:40:14 +0200
Message-Id: <20180917084016.12750-9-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180917084016.12750-1-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 08/10] hw/misc/zynq_slcr: add clock generation
 for uarts
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com, fred.konrad@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ICxxbhjFVurt

From: Damien Hedde <damien.hedde@greensocs.com>

Add 2 clock outputs for each uart (uart0 & 1):
+ the reference clock
+ the bus interface clock

The clock frequencies, and their respective resets, are computed using the
internal pll & uart configuration registers.

All clocks depend on the main input clock (ps_clk), which is hard-coded
to 33.33MHz (zcu102 evaluation board frequency and frequency specified
in Xilinx's device tree file)

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/misc/zynq_slcr.c | 155 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index baa13d1316..bdc52035c8 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -33,6 +33,8 @@
         } \
     } while (0)
 
+#define INPUT_PS_REF_CLK_FREQUENCY (33333333)
+
 #define XILINX_LOCK_KEY 0x767b
 #define XILINX_UNLOCK_KEY 0xdf0d
 
@@ -44,15 +46,27 @@ REG32(LOCKSTA, 0x00c)
 REG32(ARM_PLL_CTRL, 0x100)
 REG32(DDR_PLL_CTRL, 0x104)
 REG32(IO_PLL_CTRL, 0x108)
+/* fields for [ARM|DDR|IO_PLL]_CTRL registers */
+    FIELD(xxx_PLL_CTRL, PLL_RESET, 0, 1)
+    FIELD(xxx_PLL_CTRL, PLL_PWRDWN, 1, 1)
+    FIELD(xxx_PLL_CTRL, PLL_BYPASS_QUAL, 3, 1)
+    FIELD(xxx_PLL_CTRL, PLL_BYPASS_FORCE, 4, 1)
+    FIELD(xxx_PLL_CTRL, PLL_FPDIV, 12, 7)
 REG32(PLL_STATUS, 0x10c)
 REG32(ARM_PLL_CFG, 0x110)
 REG32(DDR_PLL_CFG, 0x114)
 REG32(IO_PLL_CFG, 0x118)
 
 REG32(ARM_CLK_CTRL, 0x120)
+    FIELD(ARM_CLK_CTRL, SRCSEL,  4, 2)
+    FIELD(ARM_CLK_CTRL, DIVISOR, 8, 6)
+    FIELD(ARM_CLK_CTRL, CPU_1XCLKACT, 27, 1)
+    FIELD(ARM_CLK_CTRL, CPU_PERI_CLKACT, 28, 1)
 REG32(DDR_CLK_CTRL, 0x124)
 REG32(DCI_CLK_CTRL, 0x128)
 REG32(APER_CLK_CTRL, 0x12c)
+    FIELD(APER_CLK_CTRL, UART0_CPU1XCLKACT, 20, 1)
+    FIELD(APER_CLK_CTRL, UART1_CPU1XCLKACT, 21, 1)
 REG32(USB0_CLK_CTRL, 0x130)
 REG32(USB1_CLK_CTRL, 0x134)
 REG32(GEM0_RCLK_CTRL, 0x138)
@@ -63,12 +77,19 @@ REG32(SMC_CLK_CTRL, 0x148)
 REG32(LQSPI_CLK_CTRL, 0x14c)
 REG32(SDIO_CLK_CTRL, 0x150)
 REG32(UART_CLK_CTRL, 0x154)
+    FIELD(UART_CLK_CTRL, CLKACT0, 0, 1)
+    FIELD(UART_CLK_CTRL, CLKACT1, 1, 1)
+    FIELD(UART_CLK_CTRL, SRCSEL,  4, 2)
+    FIELD(UART_CLK_CTRL, DIVISOR, 8, 6)
 REG32(SPI_CLK_CTRL, 0x158)
 REG32(CAN_CLK_CTRL, 0x15c)
 REG32(CAN_MIOCLK_CTRL, 0x160)
 REG32(DBG_CLK_CTRL, 0x164)
 REG32(PCAP_CLK_CTRL, 0x168)
 REG32(TOPSW_CLK_CTRL, 0x16c)
+/* common fields to lots of *_CLK_CTRL registers */
+    FIELD(xxx_CLK_CTRL, SRCSEL,  4, 2)
+    FIELD(xxx_CLK_CTRL, DIVISOR, 8, 6)
 
 #define FPGA_CTRL_REGS(n, start) \
     REG32(FPGA ## n ## _CLK_CTRL, (start)) \
@@ -96,6 +117,10 @@ REG32(SPI_RST_CTRL, 0x21c)
 REG32(CAN_RST_CTRL, 0x220)
 REG32(I2C_RST_CTRL, 0x224)
 REG32(UART_RST_CTRL, 0x228)
+    FIELD(UART_RST_CTRL, UART0_CPU1X_RST, 0, 1)
+    FIELD(UART_RST_CTRL, UART1_CPU1X_RST, 1, 1)
+    FIELD(UART_RST_CTRL, UART0_REF_RST, 2, 1)
+    FIELD(UART_RST_CTRL, UART1_REF_RST, 3, 1)
 REG32(GPIO_RST_CTRL, 0x22c)
 REG32(LQSPI_RST_CTRL, 0x230)
 REG32(SMC_RST_CTRL, 0x234)
@@ -178,8 +203,107 @@ typedef struct ZynqSLCRState {
     MemoryRegion iomem;
 
     uint32_t regs[ZYNQ_SLCR_NUM_REGS];
+
+    ClockOut *uart0_amba_clk;
+    ClockOut *uart1_amba_clk;
+    ClockOut *uart0_ref_clk;
+    ClockOut *uart1_ref_clk;
 } ZynqSLCRState;
 
+/*
+ * return the output frequency of ARM/DDR/IO pll
+ * using input frequency and PLL_CTRL register
+ */
+static uint64_t zynq_slcr_compute_pll(uint64_t input, uint32_t ctrl_reg)
+{
+    uint32_t mult = ((ctrl_reg & R_xxx_PLL_CTRL_PLL_FPDIV_MASK) >>
+            R_xxx_PLL_CTRL_PLL_FPDIV_SHIFT);
+
+    /* first, check if pll is bypassed */
+    if (ctrl_reg & R_xxx_PLL_CTRL_PLL_BYPASS_FORCE_MASK) {
+        return input;
+    }
+
+    /* is pll disabled ? */
+    if (ctrl_reg & (R_xxx_PLL_CTRL_PLL_RESET_MASK |
+                    R_xxx_PLL_CTRL_PLL_PWRDWN_MASK)) {
+        return 0;
+    }
+
+    return input * mult;
+}
+
+/*
+ * return the output frequency of a clock given:
+ * + the pll's frequencies in an array corresponding to mux's indexes
+ * + the register xxx_CLK_CTRL value
+ * + enable bit index in ctrl register
+ *
+ * This function make the assumption that ctrl_reg value is organized as follow:
+ * + bits[13:8] clock divisor
+ * + bits[5:4]  clock mux selector (index in array)
+ * + bits[index] clock enable
+ */
+static uint64_t zynq_slcr_compute_clock(const uint64_t plls[],
+                                        uint32_t ctrl_reg,
+                                        unsigned index)
+{
+    uint32_t divisor = FIELD_EX32(ctrl_reg, xxx_CLK_CTRL, DIVISOR);
+    uint32_t srcsel = FIELD_EX32(ctrl_reg, xxx_CLK_CTRL, SRCSEL);
+
+    if ((ctrl_reg & (1u << index)) == 0) {
+        return 0;
+    }
+
+    return plls[srcsel] / (divisor ? divisor : 1u);
+}
+
+#define ZYNQ_CLOCK(_state, _plls, _reg, _enable_field) \
+    zynq_slcr_compute_clock((_plls), (_state)->regs[R_ ## _reg], \
+            R_ ## _reg ## _ ## _enable_field ## _SHIFT)
+#define ZYNQ_CLOCK_GATE(_state, _clk, _reg, _field) \
+    (ARRAY_FIELD_EX32((_state)->regs, _reg, _field) ? (_clk) : 0)
+#define ZYNQ_CLOCK_RESET(_state, _reg, _field) \
+    (ARRAY_FIELD_EX32((_state)->regs, _reg, _field) != 0)
+
+static void zynq_clock_set(ClockOut *clk, uint64_t freq, bool reset)
+{
+    ClockState value = {
+        .frequency = freq,
+        .domain_reset = reset,
+    };
+    clock_set(clk, &value);
+}
+
+static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
+{
+    uint64_t ps_clk = INPUT_PS_REF_CLK_FREQUENCY;
+    uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
+    uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
+    uint64_t ddr_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL_CTRL]);
+    uint64_t cpu_mux[4] = {arm_pll, arm_pll, ddr_pll, io_pll};
+    uint64_t uart_mux[4] = {io_pll, io_pll, arm_pll, ddr_pll};
+    uint64_t cpu1x_clk;
+
+    /* compute uartX amba clocks */
+    cpu1x_clk = ZYNQ_CLOCK(s, cpu_mux, ARM_CLK_CTRL, CPU_PERI_CLKACT);
+    cpu1x_clk = ZYNQ_CLOCK_GATE(s, cpu1x_clk, ARM_CLK_CTRL, CPU_1XCLKACT);
+    zynq_clock_set(s->uart0_amba_clk,
+            ZYNQ_CLOCK_GATE(s, cpu1x_clk, APER_CLK_CTRL, UART0_CPU1XCLKACT),
+            ZYNQ_CLOCK_RESET(s, UART_RST_CTRL, UART0_CPU1X_RST));
+    zynq_clock_set(s->uart1_amba_clk,
+            ZYNQ_CLOCK_GATE(s, cpu1x_clk, APER_CLK_CTRL, UART1_CPU1XCLKACT),
+            ZYNQ_CLOCK_RESET(s, UART_RST_CTRL, UART1_CPU1X_RST));
+
+    /* compute uartX ref clocks */
+    zynq_clock_set(s->uart0_ref_clk,
+            ZYNQ_CLOCK(s, uart_mux, UART_CLK_CTRL, CLKACT0),
+            ZYNQ_CLOCK_RESET(s, UART_RST_CTRL, UART0_REF_RST));
+    zynq_clock_set(s->uart1_ref_clk,
+            ZYNQ_CLOCK(s, uart_mux, UART_CLK_CTRL, CLKACT1),
+            ZYNQ_CLOCK_RESET(s, UART_RST_CTRL, UART1_REF_RST));
+}
+
 static void zynq_slcr_reset(DeviceState *d)
 {
     ZynqSLCRState *s = ZYNQ_SLCR(d);
@@ -274,6 +398,8 @@ static void zynq_slcr_reset(DeviceState *d)
     s->regs[R_DDRIOB + 4] = s->regs[R_DDRIOB + 5] = s->regs[R_DDRIOB + 6]
                           = 0x00000e00;
     s->regs[R_DDRIOB + 12] = 0x00000021;
+
+    zynq_slcr_compute_clocks(s);
 }
 
 
@@ -408,6 +534,15 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
         }
         break;
+    case R_IO_PLL_CTRL:
+    case R_ARM_PLL_CTRL:
+    case R_DDR_PLL_CTRL:
+    case R_ARM_CLK_CTRL:
+    case R_APER_CLK_CTRL:
+    case R_UART_CLK_CTRL:
+    case R_UART_RST_CTRL:
+        zynq_slcr_compute_clocks(s);
+        break;
     }
 }
 
@@ -417,6 +552,14 @@ static const MemoryRegionOps slcr_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static const ClockPortInitArray zynq_slcr_clocks = {
+    QDEV_CLOCK_OUT(ZynqSLCRState, uart0_amba_clk),
+    QDEV_CLOCK_OUT(ZynqSLCRState, uart1_amba_clk),
+    QDEV_CLOCK_OUT(ZynqSLCRState, uart0_ref_clk),
+    QDEV_CLOCK_OUT(ZynqSLCRState, uart1_ref_clk),
+    QDEV_CLOCK_END,
+};
+
 static void zynq_slcr_init(Object *obj)
 {
     ZynqSLCRState *s = ZYNQ_SLCR(obj);
@@ -424,12 +567,24 @@ static void zynq_slcr_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &slcr_ops, s, "slcr",
                           ZYNQ_SLCR_MMIO_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+
+    qdev_init_clocks(DEVICE(obj), zynq_slcr_clocks);
+}
+
+static int zynq_slcr_post_load(void *opaque, int version_id)
+{
+    ZynqSLCRState *s = opaque;
+
+    /* we need to setup all clock ports after migration */
+    zynq_slcr_compute_clocks(s);
+    return 0;
 }
 
 static const VMStateDescription vmstate_zynq_slcr = {
     .name = "zynq_slcr",
     .version_id = 2,
     .minimum_version_id = 2,
+    .post_load = zynq_slcr_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, ZynqSLCRState, ZYNQ_SLCR_NUM_REGS),
         VMSTATE_END_OF_LIST()
-- 
2.18.0

