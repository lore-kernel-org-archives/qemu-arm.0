Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1EE606A31F
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PDT5zhEh
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKFoA-0000sd-4T; Fri, 23 Oct 2026 09:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFo0-0000la-8g
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:36 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFnv-0004ob-S0
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:35 -0400
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-93f079a63b8so79958785a.3
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792763971; x=1793368771; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jvbpzHlx3PhD0w74lwv+VGvPz7R/D0s1maih6e/LH1c=;
 b=PDT5zhEhw2ASVv9gNtJyflArXDDiMV2M+NYTDDkWYwiGDHuH25BADDmNY23Hv0wvhM
 Wm+xd+igHncoxyhGPi2KUsbVnms+PzM7PcK/v9BKgab6qz/wXFJLcvk4WxxvH4ADyfux
 AauLhSnLKGporFeh5DF05xslf3uU6aKiy7xe1/j1/QTkPi9l9TEJbQfpcYg8CmZHkiHv
 WRtKiJLko4z1C8crHmUKGvBmuc4yQMdahA5vfiHFf4j4g7O3fQImVgoQg5H/l25a5rRj
 SNlySgpS7MPGKi7BS35QgInf8zykMNpj9X5rpDm8e67LbLBnG29TLifQBF4K1UiKF9Km
 PHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792763971; x=1793368771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jvbpzHlx3PhD0w74lwv+VGvPz7R/D0s1maih6e/LH1c=;
 b=PCC0bzcVZGdY8x/4myfDgIUajuSHETVdKKWqkeHgrODhEGoxA7SplnbTK+q+6eiuDC
 Nnzp89HLYrAY4te6WMTAfFHywynyeI4SVE5qfejXE69eZcnGsQrwuZee754ST3waAe71
 pvZ89tr/DzucSXW2WPXF5WBlXm+yUVpHg+2KmR/s+/M9HJecSieoZpCRzL2IvpU33DcB
 WmQgJU7uNw7owsooVCNsDNvlyy7nXiF4SfPmDCUWIW3xc28gWLFVJHL+SltV2AfQJR5Q
 pSW0+wx5kebIORELsC4UIs6oWGT2v11kuSDmbT5HW3fa51T9K0C64PKt582R86DX7O+l
 iMLg==
X-Gm-Message-State: AFq9FYKaNRsJeqYHPiDsYhsT8mEiceEm/HFIZSsBYub3PgG7uCFRNgK2
 2evBemHNcQ84S4dSHuRO2R1O4PVE5Ng5GNkhrwFc/MkrxQhglywtQhD4
X-Gm-Gg: AYBFou3GqAG+OYsb5KiblcD7hED1AoLBF5c7WNaNXHHTyoT3jaIoTEoVe8iUT49pEIt
 vPPfRxPr97l7o33+HKe3n12D8As4L0VOEjZ8ZwVt3Y/Ffeuw1m6OwM4zscvjwy2ZcVEIJyQIngM
 lEaFdgAK5oP8BLZigk3WessJy8Rk+IfPSPRdj6BCrCc0U4WjW6pyHswXBoSxFh0lbebKX7irM0S
 uup9B83WkzdIXyRRllJSCyhDH7+f60T3/X0zx69TvMvlVM8ypjSF+vZe5f4b2UUG5pwObYsCome
 4CtV50lK3JYswI6HDHZj+lxDGdLUVbYA6M9ON1WKTFBaKN8emvgy+eOEsczMass7K4KIPhfAVCJ
 UpP7yM+9PKqZJHEaaNOXcmulEcrlVo35YFwTUJcjJiHoWqGGEUR2MMtt3dEPhWaOr9/aNWBMe0C
 x+nq1Www+axTYWZRS9vejtuox/hokOyeyyT6aOyY+aTGeHF7Swz07dk6re0vUoG9rljU4tY9r9b
 Elk9B4ivAD9xh3o/VKoNhD2uj5LN0esyYCrwO6z0cPtZMcgrg/BF44Y8/0vBnI1a8pKuZaOTNAo
 cVZhOyTGcOjAA4/qup3HRYajxNYna4NkbWLhhw6xw2rCmznewtEK
X-Received: by 2002:a05:620a:2607:b0:93f:2bca:2cd8 with SMTP id
 af79cd13be357-93f6f8790b6mr389508485a.57.1792763970721; 
 Fri, 23 Oct 2026 06:59:30 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:450e:e72b:156b:33d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94047811552sm23741285a.18.2026.10.23.06.59.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Oct 2026 06:59:30 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Marcelo Manzo <marcelomanzo@gmail.com>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v5 04/16] hw/net/bcm2838_genet: add GENET stub device
Date: Fri, 23 Oct 2026 09:59:12 -0400
Message-ID: <20261023135924.64990-6-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023135924.64990-1-marcelomanzo@gmail.com>
References: <20261023135924.64990-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a bare-bones BCM2838 GENET (Gigabit Ethernet) sysbus device:
MMIO region registration, an out-of-range read/write handler that
just logs, and a reset callback. No register-level behavior yet;
that comes in the following patches.

Adapted from patch 19/41 of Sergey Kambalin's Raspberry Pi 4B
series (patchwork series 829638) against current QEMU master. The
reset callback and class_init() use the current Resettable-phases
API (ResettableClass / resettable_class_set_parent_phases()) rather
than the plain DeviceClass::reset hook the original patch used, and
headers moved under hw/core/, both API changes since the series was
originally posted.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/bcm2838_genet.c               | 103 +++++++++++++++++++++++++++
 hw/net/meson.build                   |   2 +
 hw/net/trace-events                  |  16 +++++
 include/hw/arm/bcm2838_peripherals.h |   2 +
 include/hw/net/bcm2838_genet.h       |  40 +++++++++++
 5 files changed, 163 insertions(+)
 create mode 100644 hw/net/bcm2838_genet.c
 create mode 100644 include/hw/net/bcm2838_genet.h

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
new file mode 100644
index 0000000000..a20a9e7c72
--- /dev/null
+++ b/hw/net/bcm2838_genet.c
@@ -0,0 +1,103 @@
+/*
+ * BCM2838 Gigabit Ethernet emulation
+ *
+ * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "net/eth.h"
+#include "qapi/error.h"
+#include "hw/core/irq.h"
+#include "net/checksum.h"
+#include "system/dma.h"
+#include "hw/core/resettable.h"
+#include "hw/net/bcm2838_genet.h"
+#include "trace.h"
+
+
+static uint64_t bcm2838_genet_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t value = ~0;
+
+    qemu_log_mask(
+        LOG_GUEST_ERROR,
+        "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
+        __func__, size, offset);
+
+    trace_bcm2838_genet_read(size, offset, value);
+    return value;
+}
+
+static void bcm2838_genet_write(void *opaque, hwaddr offset, uint64_t value,
+                                unsigned size) {
+    qemu_log_mask(
+        LOG_GUEST_ERROR,
+        "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
+        __func__, size, offset);
+}
+
+static const MemoryRegionOps bcm2838_genet_ops = {
+    .read = bcm2838_genet_read,
+    .write = bcm2838_genet_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {.min_access_size = 4, .max_access_size = 4},
+    .valid = {.min_access_size = 4, .max_access_size = 4},
+};
+
+
+static void bcm2838_genet_realize(DeviceState *dev, Error **errp)
+{
+    BCM2838GenetState *s = BCM2838_GENET(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    /* Controller registers */
+    memory_region_init_io(&s->regs_mr, OBJECT(s), &bcm2838_genet_ops, s,
+                          "bcm2838_genet_regs", sizeof(s->regs));
+    sysbus_init_mmio(sbd, &s->regs_mr);
+}
+
+static void bcm2838_genet_phy_reset(BCM2838GenetState *s)
+{
+    trace_bcm2838_genet_phy_reset("done");
+}
+
+static void bcm2838_genet_reset(Object *obj, ResetType type)
+{
+    BCM2838GenetState *s = BCM2838_GENET(obj);
+
+    memset(&s->regs, 0x00, sizeof(s->regs));
+
+    trace_bcm2838_genet_reset("done");
+
+    bcm2838_genet_phy_reset(s);
+}
+
+static void bcm2838_genet_class_init(ObjectClass *class, const void *data)
+{
+    static ResettablePhases unused_parent_phases;
+    DeviceClass *dc = DEVICE_CLASS(class);
+    ResettableClass *rc = RESETTABLE_CLASS(class);
+
+    dc->realize = bcm2838_genet_realize;
+    resettable_class_set_parent_phases(rc, NULL, bcm2838_genet_reset, NULL,
+                                       &unused_parent_phases);
+}
+
+static const TypeInfo bcm2838_genet_info = {
+    .name       = TYPE_BCM2838_GENET,
+    .parent     = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2838GenetState),
+    .class_init = bcm2838_genet_class_init,
+};
+
+static void bcm2838_genet_register(void)
+{
+    type_register_static(&bcm2838_genet_info);
+}
+
+type_init(bcm2838_genet_register)
diff --git a/hw/net/meson.build b/hw/net/meson.build
index 63b0e96245..ef85b85adf 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -70,4 +70,6 @@ if have_hmp
   system_ss.add(files('rocker/rocker-hmp-cmds.c'))
 endif
 
+system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2838_genet.c'))
+
 subdir('can')
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 001a20b0e2..2dde33e892 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -528,3 +528,19 @@ xen_netdev_rx(int dev, int idx, int status, int flags) "vif%u idx %d status %d f
 ethlite_pkt_lost(uint32_t rx_ctrl) "rx_ctrl:0x%" PRIx32
 ethlite_pkt_size_too_big(uint64_t size) "size:0x%" PRIx64
 ethlite_pkt_tx_size_too_big(uint64_t size) "size:0x%" PRIx64
+# bcm2838_genet.c
+bcm2838_genet_read(unsigned int size, uint64_t offset, uint64_t value) "%u bytes @ 0x%04" PRIx64 ": 0x%016" PRIx64
+bcm2838_genet_write(unsigned int size, uint64_t offset, uint64_t value) "%u bytes @ 0x%04" PRIx64 ": 0x%016" PRIx64
+bcm2838_genet_can_receive(const char *state) "receive is %s"
+bcm2838_genet_receive(ssize_t bytes_received) "%zd bytes received"
+bcm2838_genet_phy_update_link(const char *link_state) "link is %s"
+bcm2838_genet_phy_reset(const char *status) "PHY reset %s"
+bcm2838_genet_reset(const char *status) "MAC reset %s"
+bcm2838_genet_mac_address(const char *info) "%s"
+bcm2838_genet_tx_dma(const char *dma_state) "TX DMA %s"
+bcm2838_genet_tx_dma_ring(uint32_t ring_en) "TX DMA enabled rings: 0x%05x"
+bcm2838_genet_tx_dma_ring_buf(uint32_t ring_buf_en) "TX DMA enabled ring buffers: 0x%05x"
+bcm2838_genet_tx_dma_ring_active(unsigned int ring, const char *ring_state) "ring %u is %s"
+bcm2838_genet_tx_request(unsigned int ring_idx, uint32_t prod_idx, uint32_t cons_idx) "ring %u, PROD_INDEX %u, CONS_INDEX %u"
+bcm2838_genet_tx(unsigned int ring_idx, uint64_t desc_idx, uint32_t desc_status, uint64_t data_addr) "ring %u, descriptor %" PRIu64 ": 0x%08x, data @ 0x%08" PRIx64
+bcm2838_genet_rx_dma_ring_active(unsigned int ring, const char *ring_state) "ring %u is %s"
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 7fe92789e8..2a4307bed7 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -52,6 +52,8 @@
 #define BCM2838_MPHI_OFFSET     0xb200
 #define BCM2838_MPHI_SIZE       0x200
 
+#define GENET_OFFSET            0x1580000
+
 #define TYPE_BCM2838_PERIPHERALS "bcm2838-peripherals"
 OBJECT_DECLARE_TYPE(BCM2838PeripheralState, BCM2838PeripheralClass,
                     BCM2838_PERIPHERALS)
diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
new file mode 100644
index 0000000000..91cf1773d5
--- /dev/null
+++ b/include/hw/net/bcm2838_genet.h
@@ -0,0 +1,40 @@
+/*
+ * BCM2838 Gigabit Ethernet emulation
+ *
+ * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef BCM2838_GENET_H
+#define BCM2838_GENET_H
+
+#include "net/net.h"
+#include "hw/core/sysbus.h"
+
+#define TYPE_BCM2838_GENET "bcm2838-genet"
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
+
+#define BCM2838_GENET_REV_MAJOR         6
+#define BCM2838_GENET_REV_MINOR         0
+
+typedef struct {
+    uint8_t stub_area[0x10000]; /* temporary stub */
+} BCM2838GenetRegs;
+
+struct BCM2838GenetState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+
+    MemoryRegion regs_mr;
+    AddressSpace dma_as;
+
+    BCM2838GenetRegs regs;
+
+    qemu_irq irq_default;
+    qemu_irq irq_prio;
+};
+
+#endif /* BCM2838_GENET_H */
-- 
2.55.0


