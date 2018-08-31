Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp444282wrd;
        Fri, 31 Aug 2018 03:42:50 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYjBuZV//vWRTZshL3yT1hNxhUWJnqTdjTLR/kmNL3xl+WPTCp5/U0nlKeHvsbQ7zUVOBOv
X-Received: by 2002:ae9:e118:: with SMTP id g24-v6mr232025qkm.306.1535712170689;
        Fri, 31 Aug 2018 03:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535712170; cv=none;
        d=google.com; s=arc-20160816;
        b=NBMsWOcpXOktdOAH7HvGWmGt16VZFkZEeT8iFcmrUT6HlCTpeydiwVsxSqCCz938uI
         gURv/F0xqC0UBrqeTxB8Nu2q8nv/VTnnfoBgxQqvjIkjzqZ5GxDUFWtLlkgEMLPc1KG9
         /fmTKYvIhf59x6D/IKLXgmb1Qd8fJA/FHaBC6KfJNnGRqQ2geCSoqJpSMJABqeam9wKF
         n1o2goBfGmgrsiW94Hvpa5D5OH+ESkEQD8Hz1oZgjEjS8dK+cLlrseBHUaFLCAGoces/
         YxIsE4As4dkFv50pZ01FgovvuS0iAzcZ/n5/GI1567LNX/pwZLCPyzY6g3PicBMICaNN
         r7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=fLCzt7+77iI54eV981+SjrutD4nX7lGucoL5ti7ztZM=;
        b=tXUiZiovwBuYnq08Sde7PKbjAvlJ+blgXvdTSQRUgAdZlr8ixW1Pes1H0a3ntesWdi
         8sLYKJouKkzHbW+Y8KGDfjZlk5usvRtua58mXQFbSBbb5SMdfKsaP6tuchTlQPrhYnWp
         PNhcqKrCCoKxneT2WQwxm4h4kLPzULZQw0i3tvQeeA47A3M5J0xDe7pJCDmiiZSRVGbv
         lzQlZ2YefjuKjf20H+hEJNSCpMmK99n9yFS1aJoSaEleOEwJ8yXG8m2MfM7e/JRxdOuP
         tIVGfhw2oxAEacKKsFsmrbmGhyCOPN93YPXV2bLH+IPDx/kmOM3vd1dDUccaZ7XSxpDl
         8Y9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z3-v6si881292qth.129.2018.08.31.03.42.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 03:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvgt8-000696-3V
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 06:42:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgq4-0003Nz-9l
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:39:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgq1-0002OA-1Q
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:39:40 -0400
Received: from 14.mo5.mail-out.ovh.net ([188.165.51.82]:33992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvgq0-0002Mc-O2
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:39:36 -0400
Received: from player168.ha.ovh.net (unknown [10.109.143.72])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 810091E1CC4
	for <qemu-devel@nongnu.org>; Fri, 31 Aug 2018 12:39:35 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id 24CA542008C;
	Fri, 31 Aug 2018 12:39:27 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 Aug 2018 12:38:15 +0200
Message-Id: <20180831103816.13479-9-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831103816.13479-1-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1938518167515073344
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgdeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.51.82
Subject: [Qemu-devel] [PATCH 08/11] aspeed/smc: add support for DMAs
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pjFOh/3TTFXA

The FMC controller on the Aspeed SoCs support DMA to access the flash
modules. It can operate in a normal mode, to copy to or from the flash
module mapping window, or in a checksum calculation mode, to evaluate
the best clock settings for reads.

Our primary need is to support the checksum calculation mode and the
model only implements synchronous DMA accesses. Something to improve
in the future.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 159 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 152 insertions(+), 7 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 500de6d16d09..534faec4c111 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -72,6 +72,10 @@
 #define   CTRL_CMD_MASK            0xff
 #define   CTRL_DUMMY_HIGH_SHIFT    14
 #define   CTRL_AST2400_SPI_4BYTE   (1 << 13)
+#define CE_CTRL_CLOCK_FREQ_SHIFT   8
+#define CE_CTRL_CLOCK_FREQ_MASK    0xf
+#define CE_CTRL_CLOCK_FREQ(div)                                         =
\
+    (((div) & CE_CTRL_CLOCK_FREQ_MASK) << CE_CTRL_CLOCK_FREQ_SHIFT)
 #define   CTRL_DUMMY_LOW_SHIFT     6 /* 2 bits [7:6] */
 #define   CTRL_CE_STOP_ACTIVE      (1 << 2)
 #define   CTRL_CMD_MODE_MASK       0x3
@@ -107,10 +111,10 @@
 #define   DMA_CTRL_DELAY_SHIFT  8
 #define   DMA_CTRL_FREQ_MASK    0xf
 #define   DMA_CTRL_FREQ_SHIFT   4
-#define   DMA_CTRL_MODE         (1 << 3)
+#define   DMA_CTRL_CALIB        (1 << 3)
 #define   DMA_CTRL_CKSUM        (1 << 2)
-#define   DMA_CTRL_DIR          (1 << 1)
-#define   DMA_CTRL_EN           (1 << 0)
+#define   DMA_CTRL_WRITE        (1 << 1)
+#define   DMA_CTRL_ENABLE       (1 << 0)
=20
 /* DMA Flash Side Address */
 #define R_DMA_FLASH_ADDR  (0x84 / 4)
@@ -142,6 +146,21 @@
 #define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
 #define ASPEED_SOC_SPI2_FLASH_BASE  0x38000000
=20
+/*
+ * DMA DRAM addresses should be 4 bytes aligned and the valid address
+ * range is the full address space of the SoC
+ *
+ * DMA flash addresses should be 4 bytes aligned and the valid address
+ * range is 0x20000000 - 0x2FFFFFFF.
+ *
+ * DMA length is from 4 bytes to 32MB
+ *   0: 4 bytes
+ *   0x7FFFFF: 32M bytes
+ */
+#define DMA_DRAM_MASK(s)        ((s)->max_ram_size - 4)
+#define DMA_FLASH_MASK          0x0FFFFFFC
+#define DMA_LENGTH_MASK         0x01FFFFFC
+
 /* Flash opcodes. */
 #define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
=20
@@ -625,9 +644,6 @@ static void aspeed_smc_reset(DeviceState *d)
=20
     memset(s->regs, 0, sizeof s->regs);
=20
-    /* Pretend DMA is done (u-boot initialization) */
-    s->regs[R_INTR_CTRL] =3D INTR_CTRL_DMA_STATUS;
-
     /* Unselect all slaves */
     for (i =3D 0; i < s->num_cs; ++i) {
         s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
@@ -664,6 +680,11 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr=
 addr, unsigned int size)
         addr =3D=3D s->r_timings ||
         addr =3D=3D s->r_ce_ctrl ||
         addr =3D=3D R_INTR_CTRL ||
+        (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) ||
+        (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) ||
+        (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) ||
+        (s->ctrl->has_dma && addr =3D=3D R_DMA_LEN) ||
+        (s->ctrl->has_dma && addr =3D=3D R_DMA_CHECKSUM) ||
         (addr >=3D R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slav=
es) ||
         (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_slaves=
)) {
         return s->regs[addr];
@@ -674,6 +695,115 @@ static uint64_t aspeed_smc_read(void *opaque, hwadd=
r addr, unsigned int size)
     }
 }
=20
+/*
+ * Accumulate the result of the reads to provide a checksum that will
+ * be used to validate the read timing settings.
+ */
+static void aspeed_smc_dma_checksum(AspeedSMCState *s)
+{
+    uint32_t data;
+
+    if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid direction for DMA checksum\n",  __fun=
c__);
+        return;
+    }
+
+    while (s->regs[R_DMA_LEN]) {
+        cpu_physical_memory_read(s->regs[R_DMA_FLASH_ADDR], &data, 4);
+
+        /*
+         * When the DMA is on-going, the DMA registers are updated
+         * with the current working addresses and length.
+         */
+        s->regs[R_DMA_CHECKSUM] +=3D data;
+        s->regs[R_DMA_FLASH_ADDR] +=3D 4;
+        s->regs[R_DMA_LEN] -=3D 4;
+    }
+}
+
+static void aspeed_smc_dma_rw(AspeedSMCState *s)
+{
+    uint32_t data;
+
+    while (s->regs[R_DMA_LEN]) {
+        if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
+            cpu_physical_memory_read(s->regs[R_DMA_DRAM_ADDR], &data, 4)=
;
+            cpu_physical_memory_write(s->regs[R_DMA_FLASH_ADDR], &data, =
4);
+        } else {
+            cpu_physical_memory_read(s->regs[R_DMA_FLASH_ADDR], &data, 4=
);
+            cpu_physical_memory_write(s->regs[R_DMA_DRAM_ADDR], &data, 4=
);
+        }
+
+        /*
+         * When the DMA is on-going, the DMA registers are updated
+         * with the current working addresses and length.
+         */
+        s->regs[R_DMA_FLASH_ADDR] +=3D 4;
+        s->regs[R_DMA_DRAM_ADDR] +=3D 4;
+        s->regs[R_DMA_LEN] -=3D 4;
+    }
+}
+
+static void aspeed_smc_dma_stop(AspeedSMCState *s)
+{
+    /*
+     * When the DMA is disabled, INTR_CTRL_DMA_STATUS=3D0 means the
+     * engine is idle
+     */
+    s->regs[R_INTR_CTRL] &=3D ~INTR_CTRL_DMA_STATUS;
+    s->regs[R_DMA_CHECKSUM] =3D 0;
+
+    /*
+     * Lower the DMA irq in any case. The IRQ control register could
+     * have been cleared before disabling the DMA.
+     */
+    qemu_irq_lower(s->irq);
+}
+
+/*
+ * When INTR_CTRL_DMA_STATUS=3D1, the DMA has completed and a new DMA
+ * can start even if the result of the previous was not collected.
+ */
+static bool aspeed_smc_dma_in_progress(AspeedSMCState *s)
+{
+    return s->regs[R_DMA_CTRL] & DMA_CTRL_ENABLE &&
+        !(s->regs[R_INTR_CTRL] & INTR_CTRL_DMA_STATUS);
+}
+
+static void aspeed_smc_dma_done(AspeedSMCState *s)
+{
+    s->regs[R_INTR_CTRL] |=3D INTR_CTRL_DMA_STATUS;
+    if (s->regs[R_INTR_CTRL] & INTR_CTRL_DMA_EN) {
+        qemu_irq_raise(s->irq);
+    }
+}
+
+static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint64_t dma_ctrl)
+{
+    if (!(dma_ctrl & DMA_CTRL_ENABLE)) {
+        s->regs[R_DMA_CTRL] =3D dma_ctrl;
+
+        aspeed_smc_dma_stop(s);
+        return;
+    }
+
+    if (aspeed_smc_dma_in_progress(s)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA in progress\n",  __func_=
_);
+        return;
+    }
+
+    s->regs[R_DMA_CTRL] =3D dma_ctrl;
+
+    if (s->regs[R_DMA_CTRL] & DMA_CTRL_CKSUM) {
+        aspeed_smc_dma_checksum(s);
+    } else {
+        aspeed_smc_dma_rw(s);
+    }
+
+    aspeed_smc_dma_done(s);
+}
+
 static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
                              unsigned int size)
 {
@@ -697,6 +827,19 @@ static void aspeed_smc_write(void *opaque, hwaddr ad=
dr, uint64_t data,
         if (value !=3D s->regs[R_SEG_ADDR0 + cs]) {
             aspeed_smc_flash_set_segment(s, cs, value);
         }
+    } else if (addr =3D=3D R_INTR_CTRL) {
+        s->regs[addr] =3D value;
+    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) {
+        aspeed_smc_dma_ctrl(s, value);
+    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) {
+        value &=3D DMA_DRAM_MASK(s);
+        s->regs[addr] =3D s->sdram_base | value;
+    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) {
+        value &=3D DMA_FLASH_MASK;
+        s->regs[addr] =3D ASPEED_SOC_FMC_FLASH_BASE | value;
+    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_LEN) {
+        value &=3D DMA_LENGTH_MASK;
+        s->regs[addr] =3D value;
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
                       __func__, addr);
@@ -729,6 +872,9 @@ static void aspeed_smc_realize(DeviceState *dev, Erro=
r **errp)
     s->r_timings =3D s->ctrl->r_timings;
     s->conf_enable_w0 =3D s->ctrl->conf_enable_w0;
=20
+    /* DMA irq */
+    sysbus_init_irq(sbd, &s->irq);
+
     /* Enforce some real HW limits */
     if (s->num_cs > s->ctrl->max_slaves) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: num_cs cannot exceed: %d\n",
@@ -739,7 +885,6 @@ static void aspeed_smc_realize(DeviceState *dev, Erro=
r **errp)
     s->spi =3D ssi_create_bus(dev, "spi");
=20
     /* Setup cs_lines for slaves */
-    sysbus_init_irq(sbd, &s->irq);
     s->cs_lines =3D g_new0(qemu_irq, s->num_cs);
     ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
=20
--=20
2.17.1

