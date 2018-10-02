Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5142980wrt;
        Tue, 2 Oct 2018 07:47:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61Ie7IjdUYgSssOdWimzePpEs+OK/vlIHNUV4f7BdcXYvLKpXqLmRcCSuxJgXdZO1ZnBQSW
X-Received: by 2002:a0c:a99a:: with SMTP id a26-v6mr11110969qvb.171.1538491625486;
        Tue, 02 Oct 2018 07:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538491625; cv=none;
        d=google.com; s=arc-20160816;
        b=o87dLC0LjtCP01xwKRRP8j3HrA4iUrCDVAPFW7i/VHQoxqSnme8GD1ETYeT1iTCD0U
         x+hAEEo2/c5vcYOGyrHyd4rLqTaE/K/e764xlCJuaLAgHcq3TaTss+ZNy4pnVUSdqBSB
         8a0TCZCsaxjcjn7CUzrkE4gScZguYa+Kd9RMCXx9m7875tNGjwpJahxWX22647Q2Zezt
         oFjtpe8ektIQDVnVvciRG/GQ3vYV7gzBrp3yz71uPxkK/ASWdu19Gp6Idi1p4BQZxnQg
         8+sQrcP1gdxS/7U3jQrfE6wcoFNgv4QXxO8B+Rfboq5FMnZJkelb5jjXQLvXvb4f1hvi
         bQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=ObE4wxU9E4H1NA7mzeIncThZMbShZp3xJK/j9Jhy8N4=;
        b=ueR0uLUilgPGeWUoPcOdgsOvJC1KHAsq7Kt4VZMQ9OSIyUCn0MS0qa4tJEwrY+CQug
         vGydFeDf7gBSTdduxhSphgrfZLJ6XcVv2AUoYZBXrY7SwpTfJxdbgfDJkIbeZSF+8Gql
         /+/d+slp529Sb+i+AGz/ExSiAf4gQpodJYo0gQNlPMPskkzHRCpTKTb9Z8vFHEpsbV57
         g0AB/3pw2S5dFYs1PzowOkuBmA60oVUnPqUcgXjF7VrXbayDzHwsnYwegwTpWF/KWD5Q
         AQiW1lu0G4LcYN03hHmEujuJOzeKjswNh2QHGp/neCZbQl5b3Wq7Xa9VjkzIfNgIBVtx
         HSVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fQRT3732;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=AOZMrePj;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=AOZMrePj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2-v6si734521qth.11.2018.10.02.07.47.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 07:47:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fQRT3732;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=AOZMrePj;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=AOZMrePj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Lx2-0005je-Ux
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 10:47:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7Lmw-0005M2-6a
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:36:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7LdC-0004QG-Jl
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:26:36 -0400
Received: from greensocs.com ([193.104.36.180]:53911)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g7Ld9-0004NQ-BH; Tue, 02 Oct 2018 10:26:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 20EF8442AFE;
	Tue,  2 Oct 2018 16:26:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490369;
	bh=VvrCjrQ6nDV4DTsIfLOBQX1PCDnPhRmn/LhGmHMbJEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fQRT3732GoxBZYYZh/R8xpjWmB7Nz/bHhvtMYq+4LD8mQvHcGrqlmDt/J0WBXOgzU
	mnC5YrdVglK7unRoIJJC0t6PIo/wi68J+KlzXjNec7vN+YFg/flbHT4RkNrlAcPuGc
	c0Poq9MQkHZp7OSe6PgPcB8gh2ze4tCHThDZCRUQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=AOZMrePj;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=AOZMrePj
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HsvnHnJSm217; Tue,  2 Oct 2018 16:26:08 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id E5632442AFB; Tue,  2 Oct 2018 16:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490366;
	bh=VvrCjrQ6nDV4DTsIfLOBQX1PCDnPhRmn/LhGmHMbJEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AOZMrePjCy+fQAKA5ITOt0Kh7+3q1hToOMY/DAk9GKphRzh0FmgyULzJaH0u1KiUi
	TW6Bot2R0DVOEHdTS8iUrnTM1QUVXeZen2q6Q00oIpkdMqhAPTP9bdB7lyBfk9vC2R
	gflDx28yETYluTylnaUHwO8K8NlRHeXuYK7Hjz9s=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 84E28442AF5;
	Tue,  2 Oct 2018 16:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490366;
	bh=VvrCjrQ6nDV4DTsIfLOBQX1PCDnPhRmn/LhGmHMbJEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AOZMrePjCy+fQAKA5ITOt0Kh7+3q1hToOMY/DAk9GKphRzh0FmgyULzJaH0u1KiUi
	TW6Bot2R0DVOEHdTS8iUrnTM1QUVXeZen2q6Q00oIpkdMqhAPTP9bdB7lyBfk9vC2R
	gflDx28yETYluTylnaUHwO8K8NlRHeXuYK7Hjz9s=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 16:24:41 +0200
Message-Id: <20181002142443.30976-8-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002142443.30976-1-damien.hedde@greensocs.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v5 7/9] hw/misc/zynq_slcr: add clock generation
 for uarts
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, konrad@adacore.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7RiecVGiNp0E

Add 2 clock outputs for each uart (uart0 & 1):
+ the reference clock
+ the bus interface clock

The clock frequencies are computed using the internal pll & uart configur=
ation
registers.

All clocks depend on the main input clock (ps_clk), which is hard-coded
to 33.33MHz (zcu102 evaluation board frequency and frequency specified
in Xilinx's device tree file)

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/misc/zynq_slcr.c | 125 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index baa13d1316..0b599ebd97 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -33,6 +33,8 @@
         } \
     } while (0)
=20
+#define INPUT_PS_REF_CLK_FREQUENCY (33333333)
+
 #define XILINX_LOCK_KEY 0x767b
 #define XILINX_UNLOCK_KEY 0xdf0d
=20
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
=20
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
=20
 #define FPGA_CTRL_REGS(n, start) \
     REG32(FPGA ## n ## _CLK_CTRL, (start)) \
@@ -178,8 +199,92 @@ typedef struct ZynqSLCRState {
     MemoryRegion iomem;
=20
     uint32_t regs[ZYNQ_SLCR_NUM_REGS];
+
+    ClockOut *uart0_amba_clk;
+    ClockOut *uart1_amba_clk;
+    ClockOut *uart0_ref_clk;
+    ClockOut *uart1_ref_clk;
 } ZynqSLCRState;
=20
+/*
+ * return the output frequency of ARM/DDR/IO pll
+ * using input frequency and PLL_CTRL register
+ */
+static uint64_t zynq_slcr_compute_pll(uint64_t input, uint32_t ctrl_reg)
+{
+    uint32_t mult =3D ((ctrl_reg & R_xxx_PLL_CTRL_PLL_FPDIV_MASK) >>
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
+ * This function make the assumption that ctrl_reg value is organized as=
 follow:
+ * + bits[13:8] clock divisor
+ * + bits[5:4]  clock mux selector (index in array)
+ * + bits[index] clock enable
+ */
+static uint64_t zynq_slcr_compute_clock(const uint64_t plls[],
+                                        uint32_t ctrl_reg,
+                                        unsigned index)
+{
+    uint32_t divisor =3D FIELD_EX32(ctrl_reg, xxx_CLK_CTRL, DIVISOR);
+    uint32_t srcsel =3D FIELD_EX32(ctrl_reg, xxx_CLK_CTRL, SRCSEL);
+
+    if ((ctrl_reg & (1u << index)) =3D=3D 0) {
+        return 0;
+    }
+
+    return plls[srcsel] / (divisor ? divisor : 1u);
+}
+
+#define ZYNQ_CLOCK(_state, _plls, _reg, _enable_field) \
+    zynq_slcr_compute_clock((_plls), (_state)->regs[R_ ## _reg], \
+            R_ ## _reg ## _ ## _enable_field ## _SHIFT)
+#define ZYNQ_GATE(_state, _clk, _reg, _field) \
+    (ARRAY_FIELD_EX32((_state)->regs, _reg, _field) ? (_clk) : 0)
+
+static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
+{
+    uint64_t ps_clk =3D INPUT_PS_REF_CLK_FREQUENCY;
+    uint64_t io_pll =3D zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_C=
TRL]);
+    uint64_t arm_pll =3D zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL=
_CTRL]);
+    uint64_t ddr_pll =3D zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL=
_CTRL]);
+    uint64_t cpu_mux[4] =3D {arm_pll, arm_pll, ddr_pll, io_pll};
+    uint64_t uart_mux[4] =3D {io_pll, io_pll, arm_pll, ddr_pll};
+    uint64_t cpu1x_clk;
+
+    /* compute uartX amba clocks */
+    cpu1x_clk =3D ZYNQ_CLOCK(s, cpu_mux, ARM_CLK_CTRL, CPU_PERI_CLKACT);
+    cpu1x_clk =3D ZYNQ_GATE(s, cpu1x_clk, ARM_CLK_CTRL, CPU_1XCLKACT);
+    clock_set_frequency(s->uart0_amba_clk,
+            ZYNQ_GATE(s, cpu1x_clk, APER_CLK_CTRL, UART0_CPU1XCLKACT));
+    clock_set_frequency(s->uart1_amba_clk,
+            ZYNQ_GATE(s, cpu1x_clk, APER_CLK_CTRL, UART1_CPU1XCLKACT));
+
+    /* compute uartX ref clocks */
+    clock_set_frequency(s->uart0_ref_clk,
+            ZYNQ_CLOCK(s, uart_mux, UART_CLK_CTRL, CLKACT0));
+    clock_set_frequency(s->uart1_ref_clk,
+            ZYNQ_CLOCK(s, uart_mux, UART_CLK_CTRL, CLKACT1));
+}
+
 static void zynq_slcr_reset(DeviceState *d)
 {
     ZynqSLCRState *s =3D ZYNQ_SLCR(d);
@@ -274,6 +379,8 @@ static void zynq_slcr_reset(DeviceState *d)
     s->regs[R_DDRIOB + 4] =3D s->regs[R_DDRIOB + 5] =3D s->regs[R_DDRIOB=
 + 6]
                           =3D 0x00000e00;
     s->regs[R_DDRIOB + 12] =3D 0x00000021;
+
+    zynq_slcr_compute_clocks(s);
 }
=20
=20
@@ -408,6 +515,14 @@ static void zynq_slcr_write(void *opaque, hwaddr off=
set,
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
         }
         break;
+    case R_IO_PLL_CTRL:
+    case R_ARM_PLL_CTRL:
+    case R_DDR_PLL_CTRL:
+    case R_ARM_CLK_CTRL:
+    case R_APER_CLK_CTRL:
+    case R_UART_CLK_CTRL:
+        zynq_slcr_compute_clocks(s);
+        break;
     }
 }
=20
@@ -417,6 +532,14 @@ static const MemoryRegionOps slcr_ops =3D {
     .endianness =3D DEVICE_NATIVE_ENDIAN,
 };
=20
+static const ClockPortInitArray zynq_slcr_clocks =3D {
+    QDEV_CLOCK_OUT(ZynqSLCRState, uart0_amba_clk),
+    QDEV_CLOCK_OUT(ZynqSLCRState, uart1_amba_clk),
+    QDEV_CLOCK_OUT(ZynqSLCRState, uart0_ref_clk),
+    QDEV_CLOCK_OUT(ZynqSLCRState, uart1_ref_clk),
+    QDEV_CLOCK_END,
+};
+
 static void zynq_slcr_init(Object *obj)
 {
     ZynqSLCRState *s =3D ZYNQ_SLCR(obj);
@@ -424,6 +547,8 @@ static void zynq_slcr_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &slcr_ops, s, "slcr",
                           ZYNQ_SLCR_MMIO_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+
+    qdev_init_clocks(DEVICE(obj), zynq_slcr_clocks);
 }
=20
 static const VMStateDescription vmstate_zynq_slcr =3D {
--=20
2.19.0

