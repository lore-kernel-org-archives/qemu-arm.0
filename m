Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp664309wrp;
        Wed, 4 Sep 2019 05:49:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlfhT78+TtmE4YRCU0uTf8ZNVjGyZ92TSnz1LEyyIN93rRC+IX6nzoIvUzGMgvoat2/AY9
X-Received: by 2002:ac8:748c:: with SMTP id v12mr14896984qtq.23.1567601397008;
        Wed, 04 Sep 2019 05:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567601397; cv=none;
        d=google.com; s=arc-20160816;
        b=XwL68hmOlfG/T6xdKyy//KzryRLU/fVyGVzqT6vkXqikGqZFAbqW9881mYVVkJEUwn
         Ek2Obttao9vzfIIl2K25EAXUYhCrw1ZgZ/k4oPD7GqYAvo2N042TP2nTuG4BSoKN38ZE
         jICoFwVdRVJaKUKoYLvXw/WUPE22QRumcRjWISnaKHh9/98b5amsQMUjnxyAJO5s0fnO
         0Jlmj991bADLIPNd9LUWry/A7pI9dwPvl89+zwu3UL7glOJ5zk5IEoc4JURhZr1ITHXt
         /suJD/w3cTPuEwgGU2sU+7ij+KU3f5T4C+6lt0S/8voahOc6JPex9VBCFb9CeYxg+IF4
         tqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=nZUyZ1ezSWx4vZZVhJjNdDexBvTbYswecZgBGs33vYQ=;
        b=mqYXz85k/d0/n+82bEmM0tKjgFHhfpV1Lpqn1ltt3ft6KGKxSCPrx9irpXDjerC8WR
         46S01pbW5HSJvizQLaMMsyq0KgJKEcT1KeJD5863Z3Z9aCcQ4V17ZKsHGtTffdj8kiyI
         ZJ7Jz1vG6NQ3MLSlVUWf3EyeCIxW3BsLuWPdG6qV/M31NbMHLskaL0cgU9BvOIWzfBUB
         m6iLVQr/CuoMyTNValxJbyxQ31RjbRSstIcJIUvu+GeKywTk1LvW4SrDYe9dfUN346j4
         FHDx7i4e+2DVk8bnyYXBjh17TQiXX65ZvVZqEYxOAew6EfSQWARyWVkl56K4BB3cDiFV
         KXQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si10958473qtb.170.2019.09.04.05.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 05:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5UjT-0008Id-Qh
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 08:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47808)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqq-0004qM-BP
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqn-0008RP-Fl
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:20 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40566)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.con>)
 id 1i5Rqm-0008Po-VN; Wed, 04 Sep 2019 05:45:17 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id C467A96F5D;
 Wed,  4 Sep 2019 09:38:54 +0000 (UTC)
From: damien.hedde@greensocs.con
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 11:38:41 +0200
Message-Id: <20190904093843.8765-8-damien.hedde@greensocs.con>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904093843.8765-1-damien.hedde@greensocs.con>
References: <20190904093843.8765-1-damien.hedde@greensocs.con>
MIME-Version: 1.0
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
X-Mailman-Approved-At: Wed, 04 Sep 2019 08:47:15 -0400
Subject: [Qemu-arm] [PATCH v6 7/9] hw/misc/zynq_slcr: add clock generation
 for uarts
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sHJlin8MCbFI

From: Damien Hedde <damien.hedde@greensocs.com>

Switch the slcr to multi-phase reset and add some clocks:
+ the main input clock (ps_clk)
+ the reference clock outputs for each uart (uart0 & 1)

The clock frequencies are computed using the internal pll & uart configur=
ation
registers and the ps_clk frequency.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/misc/zynq_slcr.c | 145 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 142 insertions(+), 3 deletions(-)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index b9a38272d9..fa2ac608eb 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -22,6 +22,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/registerfields.h"
+#include "hw/qdev-clock.h"
=20
 #ifndef ZYNQ_SLCR_ERR_DEBUG
 #define ZYNQ_SLCR_ERR_DEBUG 0
@@ -45,6 +46,12 @@ REG32(LOCKSTA, 0x00c)
 REG32(ARM_PLL_CTRL, 0x100)
 REG32(DDR_PLL_CTRL, 0x104)
 REG32(IO_PLL_CTRL, 0x108)
+/* fields for [ARM|DDR|IO]_PLL_CTRL registers */
+    FIELD(xxx_PLL_CTRL, PLL_RESET, 0, 1)
+    FIELD(xxx_PLL_CTRL, PLL_PWRDWN, 1, 1)
+    FIELD(xxx_PLL_CTRL, PLL_BYPASS_QUAL, 3, 1)
+    FIELD(xxx_PLL_CTRL, PLL_BYPASS_FORCE, 4, 1)
+    FIELD(xxx_PLL_CTRL, PLL_FPDIV, 12, 7)
 REG32(PLL_STATUS, 0x10c)
 REG32(ARM_PLL_CFG, 0x110)
 REG32(DDR_PLL_CFG, 0x114)
@@ -64,6 +71,10 @@ REG32(SMC_CLK_CTRL, 0x148)
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
@@ -179,11 +190,106 @@ typedef struct ZynqSLCRState {
     MemoryRegion iomem;
=20
     uint32_t regs[ZYNQ_SLCR_NUM_REGS];
+
+    ClockIn *ps_clk;
+    ClockOut *uart0_ref_clk;
+    ClockOut *uart1_ref_clk;
 } ZynqSLCRState;
=20
-static void zynq_slcr_reset(DeviceState *d)
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
+ * + the frequencies in an array corresponding to mux's indexes
+ * + the register xxx_CLK_CTRL value
+ * + enable bit index in ctrl register
+ *
+ * This function make the assumption that ctrl_reg value is organized as=
 follow:
+ * + bits[13:8] clock divisor
+ * + bits[5:4]  clock mux selector (index in array)
+ * + bits[index] clock enable
+ */
+static uint64_t zynq_slcr_compute_clock(const uint64_t mux[],
+                                        uint32_t ctrl_reg,
+                                        unsigned index)
+{
+    uint32_t srcsel =3D extract32(ctrl_reg, 4, 2); /* bits [5:4] */
+    uint32_t divisor =3D extract32(ctrl_reg, 8, 6); /* bits [13:8] */
+
+    /* first, check if clock is enabled */
+    if (((ctrl_reg >> index) & 1u) =3D=3D 0) {
+        return 0;
+    }
+
+    /*
+     * according to the Zynq technical ref. manual UG585 v1.12.2 in
+     * "Clocks" chapter, section 25.10.1 page 705" the range of the divi=
sor
+     * is [1;63].
+     * So divide the source while avoiding division-by-zero.
+     */
+    return mux[srcsel] / (divisor ? divisor : 1u);
+}
+
+/*
+ * macro helper around zynq_slcr_compute_clock to avoid repeating
+ * the register name.
+ */
+#define ZYNQ_COMPUTE_CLOCK(_state, _plls, _reg, _enable_field) \
+    zynq_slcr_compute_clock((_plls), (_state)->regs[R_ ## _reg], \
+            R_ ## _reg ## _ ## _enable_field ## _SHIFT)
+
+static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
+{
+    uint64_t ps_clk =3D clock_get_frequency(s->ps_clk);
+
+    /* consider all output clocks are disabled while in reset */
+    if (device_is_resetting(DEVICE(s))) {
+        ps_clk =3D 0;
+    }
+
+    uint64_t io_pll =3D zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_C=
TRL]);
+    uint64_t arm_pll =3D zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL=
_CTRL]);
+    uint64_t ddr_pll =3D zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL=
_CTRL]);
+
+    uint64_t uart_mux[4] =3D {io_pll, io_pll, arm_pll, ddr_pll};
+
+    /* compute uartX reference clocks */
+    clock_set_frequency(s->uart0_ref_clk,
+            ZYNQ_COMPUTE_CLOCK(s, uart_mux, UART_CLK_CTRL, CLKACT0));
+    clock_set_frequency(s->uart1_ref_clk,
+            ZYNQ_COMPUTE_CLOCK(s, uart_mux, UART_CLK_CTRL, CLKACT1));
+}
+
+static void zynq_slcr_ps_clk_callback(void *opaque)
+{
+    ZynqSLCRState *s =3D (ZynqSLCRState *) opaque;
+    zynq_slcr_compute_clocks(s);
+}
+
+static void zynq_slcr_reset_init(Object *obj, ResetType type)
 {
-    ZynqSLCRState *s =3D ZYNQ_SLCR(d);
+    ZynqSLCRState *s =3D ZYNQ_SLCR(obj);
     int i;
=20
     DB_PRINT("RESET\n");
@@ -277,6 +383,21 @@ static void zynq_slcr_reset(DeviceState *d)
     s->regs[R_DDRIOB + 12] =3D 0x00000021;
 }
=20
+static void zynq_slcr_reset_hold(Object *obj)
+{
+    ZynqSLCRState *s =3D ZYNQ_SLCR(obj);
+
+    /* will disable all output clocks */
+    zynq_slcr_compute_clocks(s);
+}
+
+static void zynq_slcr_reset_exit(Object *obj)
+{
+    ZynqSLCRState *s =3D ZYNQ_SLCR(obj);
+
+    /* will compute output clocks according to ps_clk and registers */
+    zynq_slcr_compute_clocks(s);
+}
=20
 static bool zynq_slcr_check_offset(hwaddr offset, bool rnw)
 {
@@ -409,6 +530,12 @@ static void zynq_slcr_write(void *opaque, hwaddr off=
set,
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
         }
         break;
+    case R_IO_PLL_CTRL:
+    case R_ARM_PLL_CTRL:
+    case R_DDR_PLL_CTRL:
+    case R_UART_CLK_CTRL:
+        zynq_slcr_compute_clocks(s);
+        break;
     }
 }
=20
@@ -418,6 +545,13 @@ static const MemoryRegionOps slcr_ops =3D {
     .endianness =3D DEVICE_NATIVE_ENDIAN,
 };
=20
+static const ClockPortInitArray zynq_slcr_clocks =3D {
+    QDEV_CLOCK_IN(ZynqSLCRState, ps_clk, zynq_slcr_ps_clk_callback),
+    QDEV_CLOCK_OUT(ZynqSLCRState, uart0_ref_clk),
+    QDEV_CLOCK_OUT(ZynqSLCRState, uart1_ref_clk),
+    QDEV_CLOCK_END
+};
+
 static void zynq_slcr_init(Object *obj)
 {
     ZynqSLCRState *s =3D ZYNQ_SLCR(obj);
@@ -425,6 +559,8 @@ static void zynq_slcr_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &slcr_ops, s, "slcr",
                           ZYNQ_SLCR_MMIO_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+
+    qdev_init_clocks(DEVICE(obj), zynq_slcr_clocks);
 }
=20
 static const VMStateDescription vmstate_zynq_slcr =3D {
@@ -440,9 +576,12 @@ static const VMStateDescription vmstate_zynq_slcr =3D=
 {
 static void zynq_slcr_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
=20
     dc->vmsd =3D &vmstate_zynq_slcr;
-    dc->reset =3D zynq_slcr_reset;
+    rc->phases.init =3D zynq_slcr_reset_init;
+    rc->phases.hold =3D zynq_slcr_reset_hold;
+    rc->phases.exit =3D zynq_slcr_reset_exit;
 }
=20
 static const TypeInfo zynq_slcr_info =3D {
--=20
2.22.0

