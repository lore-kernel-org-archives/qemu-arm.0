Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3348406wrd;
        Fri, 21 Sep 2018 09:40:49 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdayjtWe50HFHfzZAw0Libk1tIvl92/p8uHtCCsx3IRdqAxcfIJY2UX5dYxGWx3tSO81NPpD
X-Received: by 2002:a37:9bd2:: with SMTP id d201-v6mr23829819qke.89.1537548049036;
        Fri, 21 Sep 2018 09:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537548049; cv=none;
        d=google.com; s=arc-20160816;
        b=qwcRjfP2V1NaN2LQjdTyBZJuj+10g7ZdqJMKXhD0TWmCGV8NOv5zrGd8usS7la4Yo8
         l9NXx4DXCKjtmPhNCl2Zy5Yw+o9pJYRm/brP2QV4lCQAJofQsTwWuyzu/ilaSo986jpM
         yN0WmI55WmpKtlOMsBvE6PJ1dT8ZHawnr9GsT+xEAjsmpXYhjpigrVPi4ZXwj223J5oY
         wHZKEgJWA34jzn76ezKC5DuBxQma+0A0os2C4tZmBzFLEnhKTe/f4/t0hYqClsA/nnlH
         bBayixSWRBf42SJX2bl1qo9ZXSwK6YTMpdVN9rZXuWZqrN8a9hFrs6YJ0+RLObepE40c
         bfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=wUIU0z1Z4wDQrJsZdf/zZi5DDia3B3n6GzQDuzMgBhU=;
        b=dFzDCtwS0DUKs8RMCFHaqgKHkAMbHq8n4QvxT4k1mWGpeWvBo4+Vz/w/d35Hk2iXCP
         OhIiWlwbc4TDkpbjRWVsHfoutLdiig1yd3VHsrquQdyhf4b/rkz0VA5VInYDn+ETfhUm
         qDfN521Qj5P9V+Udkb1GoR/lekdsg5PBItvwuj07PSUdpDMroIkcaR/Py5jEM9LpA/oM
         HFl7HfR9ULCGWZtf0HK88PTckBNpU+IcgBYoEmZoC57G5aIDrIt24vKAJxecMyfD/efn
         hY3YyOuUMhAntSraQPMpspjBWT/rxqJKLCoLQloY3CZbPnu6DIw8TLi0ydeBnZw2XfqE
         qNjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c126-v6si9356870qke.99.2018.09.21.09.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:40:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OU4-0005HY-I4
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:40:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OQn-0002dN-St
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OBA-0004Vs-Gy
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:21:19 -0400
Received: from 3.mo173.mail-out.ovh.net ([46.105.34.1]:60827)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OB9-0004Sg-F1
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 12:21:16 -0400
Received: from player799.ha.ovh.net (unknown [10.109.143.109])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id 5903EDA7C6
	for <qemu-devel@nongnu.org>; Fri, 21 Sep 2018 18:21:12 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 036D3520093;
	Fri, 21 Sep 2018 18:21:02 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:36 +0200
Message-Id: <20180921161939.822-9-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1907274444585929536
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.34.1
Subject: [Qemu-devel] [PATCH v2 08/11] aspeed/smc: add support for DMAs
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
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gtYhUdLeKqLj

The FMC controller on the Aspeed SoCs support DMA to access the flash
modules. It can operate in a normal mode, to copy to or from the flash
module mapping window, or in a checksum calculation mode, to evaluate
the best clock settings for reads.

The model introduces a custom address space for DMAs populated with
the required regions : an alias region on the AHB window for the flash
devices and another alias on the SDRAM.

Our primary need is to support the checksum calculation mode and the
model only implements synchronous DMA accesses. Something to improve
in the future.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |   2 +
 hw/ssi/aspeed_smc.c         | 227 +++++++++++++++++++++++++++++++++++-
 2 files changed, 223 insertions(+), 6 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index d7090bb5e9b7..b8b2dfbec280 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -100,6 +100,8 @@ typedef struct AspeedSMCState {
     /* for DMA support */
     uint64_t sdram_base;
     uint64_t max_ram_size;
+    MemoryRegion dma_mr;
+    AddressSpace dma_as;
=20
     AspeedSMCFlash *flashes;
 } AspeedSMCState;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 500de6d16d09..625c29ba4ad2 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -23,10 +23,12 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
+#include "exec/address-spaces.h"
=20
 #include "hw/ssi/aspeed_smc.h"
=20
@@ -109,8 +111,8 @@
 #define   DMA_CTRL_FREQ_SHIFT   4
 #define   DMA_CTRL_MODE         (1 << 3)
 #define   DMA_CTRL_CKSUM        (1 << 2)
-#define   DMA_CTRL_DIR          (1 << 1)
-#define   DMA_CTRL_EN           (1 << 0)
+#define   DMA_CTRL_WRITE        (1 << 1)
+#define   DMA_CTRL_ENABLE       (1 << 0)
=20
 /* DMA Flash Side Address */
 #define R_DMA_FLASH_ADDR  (0x84 / 4)
@@ -142,6 +144,21 @@
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
@@ -625,9 +642,6 @@ static void aspeed_smc_reset(DeviceState *d)
=20
     memset(s->regs, 0, sizeof s->regs);
=20
-    /* Pretend DMA is done (u-boot initialization) */
-    s->regs[R_INTR_CTRL] =3D INTR_CTRL_DMA_STATUS;
-
     /* Unselect all slaves */
     for (i =3D 0; i < s->num_cs; ++i) {
         s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
@@ -664,6 +678,11 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr=
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
@@ -674,6 +693,154 @@ static uint64_t aspeed_smc_read(void *opaque, hwadd=
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
+    MemTxResult result;
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
+        result =3D address_space_read(&s->dma_as, s->regs[R_DMA_FLASH_AD=
DR],
+                                    MEMTXATTRS_UNSPECIFIED,
+                                    (uint8_t *)&data, 4);
+        if (result !=3D MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash read failed @%08x\=
n",
+                          __func__, s->regs[R_DMA_FLASH_ADDR]);
+            return;
+        }
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
+    MemTxResult result;
+    uint32_t data;
+
+    while (s->regs[R_DMA_LEN]) {
+        if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
+            result =3D address_space_read(&s->dma_as, s->regs[R_DMA_DRAM=
_ADDR],
+                                        MEMTXATTRS_UNSPECIFIED,
+                                        (uint8_t *)&data, 4);
+            if (result !=3D MEMTX_OK) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM read failed @%0=
8x\n",
+                              __func__, s->regs[R_DMA_DRAM_ADDR]);
+                return;
+            }
+
+            result =3D address_space_write(&s->dma_as, s->regs[R_DMA_FLA=
SH_ADDR],
+                                         MEMTXATTRS_UNSPECIFIED,
+                                         (uint8_t *)&data, 4);
+            if (result !=3D MEMTX_OK) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash write failed @=
%08x\n",
+                              __func__, s->regs[R_DMA_FLASH_ADDR]);
+                return;
+            }
+        } else {
+            result =3D address_space_read(&s->dma_as, s->regs[R_DMA_FLAS=
H_ADDR],
+                                        MEMTXATTRS_UNSPECIFIED,
+                                        (uint8_t *)&data, 4);
+            if (result !=3D MEMTX_OK) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash read failed @%=
08x\n",
+                              __func__, s->regs[R_DMA_FLASH_ADDR]);
+                return;
+            }
+
+            result =3D address_space_write(&s->dma_as, s->regs[R_DMA_DRA=
M_ADDR],
+                                         MEMTXATTRS_UNSPECIFIED,
+                                         (uint8_t *)&data, 4);
+            if (result !=3D MEMTX_OK) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM write failed @%=
08x\n",
+                              __func__, s->regs[R_DMA_DRAM_ADDR]);
+                return;
+            }
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
@@ -697,6 +864,19 @@ static void aspeed_smc_write(void *opaque, hwaddr ad=
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
+        s->regs[addr] =3D s->ctrl->flash_window_base | value;
+    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_LEN) {
+        value &=3D DMA_LENGTH_MASK;
+        s->regs[addr] =3D value;
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
                       __func__, addr);
@@ -711,6 +891,34 @@ static const MemoryRegionOps aspeed_smc_ops =3D {
     .valid.unaligned =3D true,
 };
=20
+
+/*
+ * Populate our custom address space for DMAs with only the regions we
+ * need : the AHB window for the flash devices and the SDRAM.
+ */
+static void aspeed_smc_dma_setup(AspeedSMCState *s)
+{
+    char name[32];
+    MemoryRegion *sysmem =3D get_system_memory();
+    MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
+    MemoryRegion *sdram_alias =3D g_new(MemoryRegion, 1);
+
+    snprintf(name, sizeof(name), "%s-dma", s->ctrl->name);
+    memory_region_init(&s->dma_mr, OBJECT(s), name,
+                       s->sdram_base + s->max_ram_size);
+    address_space_init(&s->dma_as, &s->dma_mr, name);
+
+    snprintf(name, sizeof(name), "%s.flash", s->ctrl->name);
+    memory_region_init_alias(flash_alias, OBJECT(s), name, &s->mmio_flas=
h,
+                             0, s->ctrl->flash_window_size);
+    memory_region_add_subregion(&s->dma_mr, s->ctrl->flash_window_base,
+                                flash_alias);
+
+    memory_region_init_alias(sdram_alias, OBJECT(s), "ram", sysmem,
+                             s->sdram_base, s->max_ram_size);
+    memory_region_add_subregion(&s->dma_mr, s->sdram_base, sdram_alias);
+}
+
 static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
@@ -736,10 +944,12 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
         s->num_cs =3D s->ctrl->max_slaves;
     }
=20
+    /* DMA irq. Keep it first for the initialization in the SoC */
+    sysbus_init_irq(sbd, &s->irq);
+
     s->spi =3D ssi_create_bus(dev, "spi");
=20
     /* Setup cs_lines for slaves */
-    sysbus_init_irq(sbd, &s->irq);
     s->cs_lines =3D g_new0(qemu_irq, s->num_cs);
     ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
=20
@@ -786,6 +996,11 @@ static void aspeed_smc_realize(DeviceState *dev, Err=
or **errp)
         memory_region_add_subregion(&s->mmio_flash, offset, &fl->mmio);
         offset +=3D fl->size;
     }
+
+    /* DMA support */
+    if (s->ctrl->has_dma) {
+        aspeed_smc_dma_setup(s);
+    }
 }
=20
 static const VMStateDescription vmstate_aspeed_smc =3D {
--=20
2.17.1

