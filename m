Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B41CD98C5
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 12:17:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ6Ej-0008Tn-Ad; Mon, 15 Jun 2026 08:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wZ6EU-0008PJ-V2
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 08:16:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wZ6ER-0003VO-Dy
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 08:16:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso24374565e9.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781525758; x=1782130558; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=om2wPSJoMBFdJrFo6td8cu1Ze3/cMKPp/ptdVanujy8=;
 b=D4mef88WBTdzavzhe3fZpHVdkcyVVwNs+zxHtEswPt3L/+E81ZCHjJj/tUCg48KZ1Y
 ifm8Jc9LWSCKR1vlyGbNif/n3n2AkaFkg30F9hlpvu598URic8lXo7MGd8VfXu89lBy4
 fG62OAsYyRJtC7DUNV0U1/wFAte6PHN/cuJaLoAMGIlIhcFU21SnrbAjN6B4wWEc7NFI
 yz5c5QE6BmKITOGiG5T7PZLEkzqiiI9C8wdxzZTUkHbJAwe4hgP1b2PpgKkdQtoiMiWo
 r11INP0AmaUgXLHhxQHkziGhn5usst3RYVvvmBewE20W25/7lqtM3gAgq21xP5DwYUAW
 DtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781525758; x=1782130558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=om2wPSJoMBFdJrFo6td8cu1Ze3/cMKPp/ptdVanujy8=;
 b=RJ78I0/4hsQadaH6REBx08BrHu9mXYiJr9DoAyrhVBwMTTOX4p6ZwtBCD2gOv48Ijc
 KbxC7DpGMHkrVMiy5RwX5kfymw7NYDtTsTCQfUq2soHiA2YCeUCQVNsMAj2snJImwKdh
 ZInvA9lBakMHnHNN7SUcIjsfIG9ZTjjbFuXpzV0BEOhRlAhe9M3By/aDspTAVE3RX4T0
 +5ulTHLnHjjHwIGFdrBe8ckhWreffwIpLNzYfVJVjhY89y/+aIGBiYA313IsBZqphSpi
 5i4+XxubTinsEy1W6zHFCWCfxR/bvXEndTF6OnNMoDfxSXf81jeK/IgokUnaVVzVJlHQ
 cj0g==
X-Gm-Message-State: AOJu0Yxz8r0jFoD3Y5mivFhSE2tyTSgWfjS2/FlEkXP3tVKe2qY/pEEf
 qBYvZfK73s/qcdCDZ0s/ejYFSXG9O7xKADFRrgkK6mkm7scoEdMyujZb
X-Gm-Gg: Acq92OG9XGCy5gB03gpNUdsZ0n+qkmTqwGzYz1oH0RR31WU9Q2cWXart2K2vDBmAdok
 jVtQJhxS98fVmUNny9915MawxFhpG2cUVmjySgXF/GrIdDAAuq7v8DsEl+R+nsLrLBYXvAdjcYK
 xW/CjBPuUFhGK/hW91FfsSKkmosjxwSA8N7fYQki9FkLc+rx1q9LTyOe4SFOCHHleqwyHT1T6vw
 dDfdGL4P1ZFmEJdfxhav9ObvD+8kZUvREzR6UOeflSQ2zrN39F/LCFgeXVL5ij1xv1Qtlb2M87U
 NBOg8MgB8NG6PGb8XRVlEKJgSuDBvIACxcqjLs+ojWfRMbh9LPfcN4d5j9Hiy8Ym0YaqVoTxF9n
 slHEfI9byUEHSN0e1xck6IE7tCSMYg0L1iuB0oUnW8u4Fy83bpNnH2yFniWrwszapzUPXbVIVCM
 CUsGy1oNuh5O86N2eJZPr5T0gr2neHmG5Z/RUhMfnV7Ltc501yyJ1eyn79oTOnCpBw
X-Received: by 2002:a05:600c:218e:b0:490:e913:6562 with SMTP id
 5b1f17b1804b1-490ec4cd29fmr142823255e9.2.1781525757502; 
 Mon, 15 Jun 2026 05:15:57 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4a128csm338491345e9.0.2026.06.15.05.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 05:15:57 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrey Volkov <andrey@volkov.fr>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v5 6/7] tests: Add qtests for FlexCAN
Date: Mon, 15 Jun 2026 14:15:06 +0200
Message-ID: <ba9a29a245b2f69c939d8aecf6300078a190c82f.1781111270.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781111270.git.matyas.bobek@gmail.com>
References: <cover.1781111270.git.matyas.bobek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wm1-x32d.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The tests do not test all of the FlexCAN emulator functionality.

Signed-off-by: Matyáš Bobek <matyas.bobek@gmail.com>
Signed-off-by: Pavel Pisa <pisa@fel.cvut.cz>
Tested-by: Pavel Pisa <pisa@fel.cvut.cz>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Pavel Pisa <pisa@fel.cvut.cz>
---
 MAINTAINERS                |   1 +
 tests/qtest/flexcan-test.c | 421 +++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build    |   1 +
 3 files changed, 423 insertions(+)
 create mode 100644 tests/qtest/flexcan-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 648ac78b4d..c7541a597a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2113,6 +2113,7 @@ S: Maintained
 F: hw/net/can/flexcan.c
 F: hw/net/can/flexcan_regs.h
 F: include/hw/net/flexcan.h
+F: tests/qtest/flexcan-test.c
 
 EDU
 M: Jiri Slaby <jslaby@suse.cz>
diff --git a/tests/qtest/flexcan-test.c b/tests/qtest/flexcan-test.c
new file mode 100644
index 0000000000..87d947a806
--- /dev/null
+++ b/tests/qtest/flexcan-test.c
@@ -0,0 +1,421 @@
+/*
+ * QTests for FlexCAN CAN controller device model
+ *
+ * Copyright (c) 2025 Matyas Bobek <matyas.bobek@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+#include "hw/net/flexcan.h"
+#include "hw/net/can/flexcan_regs.h"
+
+#define FSL_IMX6_CAN2_ADDR 0x02094000
+#define FSL_IMX6_CAN2_SIZE 0x4000
+#define FSL_IMX6_CAN1_ADDR 0x02090000
+#define FSL_IMX6_CAN1_SIZE 0x4000
+
+#define FC_QEMU_ARGS "-nographic -M sabrelite " \
+                     "-object can-bus,id=qcan0  " \
+                     "-machine canbus0=qcan0 -machine canbus1=qcan0"
+
+/* used for masking out unused/reserved bits */
+#define FC_MB_CNT_USED_MASK (~0xF080FFFFu)
+
+#define FCREG(BASE_ADDR, REG) ((BASE_ADDR) + offsetof(FlexcanRegs, REG))
+#define FCMB(BASE_ADDR, MB_IDX, WORD_IDX) (FCREG(BASE_ADDR, mbs) + \
+    0x10 * (MB_IDX) + 4 * (WORD_IDX))
+
+typedef struct FcTestFrame {
+    uint32_t id;
+    uint32_t data[2];
+    uint8_t len;
+    bool ide;
+    bool rtr;
+
+    /* rx only */
+    bool expect_overrun;
+} FcTestFrame;
+
+static const FcTestFrame fc_test_frame_1 = {
+    .id = 0x5AF,
+    .len = 8,
+    .data = {
+        0x01020304,
+        0x0A0B0C0D
+    },
+    .ide = false
+};
+
+static const FcTestFrame fc_test_frame_1_ide = {
+    .id = 0x105AF5AF,
+    .len = 8,
+    .data = {
+        0x01020304,
+        0x0A0B0C0D
+    },
+    .ide = true
+};
+
+static void fc_reset(hwaddr ba, uint32_t mcr_flags)
+{
+    /* disable */
+    writel(FCREG(ba, mcr), 0xD890000F);
+
+    /* enable in freeze mode */
+    writel(FCREG(ba, mcr), 0x5980000F);
+
+    /* soft reset */
+    writel(FCREG(ba, mcr), 0x5980000F | FLEXCAN_MCR_SOFTRST);
+
+    g_assert_cmpuint(readl(FCREG(ba, mcr)), ==, 0x5980000F);
+    g_assert_cmpuint(readl(FCREG(ba, ctrl)), ==, 0);
+    g_assert_cmpuint(readl(FCREG(ba, ctrl2)), ==, 0);
+
+    writel(FCREG(ba, mcr), (0x5980000F & ~FLEXCAN_MCR_HALT) | mcr_flags);
+    writel(FCREG(ba, ctrl2), FLEXCAN_CTRL2_RRS);
+
+    /* initialize all mailboxes as rx inactive */
+    for (int i = 0; i < FLEXCAN_MAILBOX_COUNT; i++) {
+        writel(FCMB(ba, i, 0), FLEXCAN_MB_CODE_RX_INACTIVE);
+        writel(FCMB(ba, i, 1), 0);
+        writel(FCMB(ba, i, 2), 0);
+        writel(FCMB(ba, i, 3), 0);
+    }
+}
+
+static uint64_t fc_get_irqs(hwaddr ba)
+{
+    return (uint64_t)readl(FCREG(ba, iflag1)) |
+        ((uint64_t)readl(FCREG(ba, iflag2)) << 32);
+}
+
+static void fc_clear_irq(hwaddr ba, int idx)
+{
+    if (idx >= 32) {
+        writel(FCREG(ba, iflag2), (uint32_t)1 << (idx - 32));
+    } else {
+        writel(FCREG(ba, iflag1), (uint32_t)1 << idx);
+    }
+
+    g_assert_cmpuint(fc_get_irqs(ba) & ((uint64_t)1 << idx), ==, 0);
+}
+
+static void fc_setup_rx_mb(hwaddr ba, int mbidx)
+{
+    writel(FCMB(ba, mbidx, 0), FLEXCAN_MB_CODE_RX_EMPTY);
+    writel(FCMB(ba, mbidx, 1), 0);
+    /* the data value should be ignored for RX mb */
+    writel(FCMB(ba, mbidx, 2), 0);
+    writel(FCMB(ba, mbidx, 3), 0);
+
+    g_assert_cmpuint(readl(FCMB(ba, mbidx, 0)), ==, FLEXCAN_MB_CODE_RX_EMPTY);
+}
+
+static void fc_tx(hwaddr ba, int mbidx, const FcTestFrame *frame)
+{
+    g_assert_cmpuint(frame->len, <=, 8);
+
+    writel(FCMB(ba, mbidx, 0), FLEXCAN_MB_CODE_TX_INACTIVE);
+    uint32_t id = frame->ide ? frame->id : frame->id << 18;
+    writel(FCMB(ba, mbidx, 1), id);
+    writel(FCMB(ba, mbidx, 2), frame->data[0]);
+    writel(FCMB(ba, mbidx, 3), frame->data[1]);
+
+    uint32_t ctrl = FLEXCAN_MB_CODE_TX_DATA | FLEXCAN_MB_CNT_LENGTH(frame->len);
+    if (frame->ide) {
+        ctrl |= FLEXCAN_MB_CNT_IDE | FLEXCAN_MB_CNT_SRR;
+    }
+    if (frame->rtr) {
+        ctrl |= FLEXCAN_MB_CNT_RTR;
+    }
+    writel(FCMB(ba, mbidx, 0), ctrl);
+
+    /* check frame was transmitted */
+    g_assert_cmpuint(fc_get_irqs(ba) & ((uint64_t)1 << mbidx),
+                     !=, 0);
+
+    uint32_t xpectd_ctrl = (ctrl & ~FLEXCAN_MB_CODE_MASK) |
+        FLEXCAN_MB_CODE_TX_INACTIVE;
+    g_assert_cmpuint(readl(FCMB(ba, mbidx, 0)) & FC_MB_CNT_USED_MASK, ==,
+                     xpectd_ctrl);
+    /* other fields should stay unchanged */
+    g_assert_cmpuint(readl(FCMB(ba, mbidx, 1)), ==, id);
+    g_assert_cmpuint(readl(FCMB(ba, mbidx, 2)), ==, frame->data[0]);
+    g_assert_cmpuint(readl(FCMB(ba, mbidx, 3)), ==, frame->data[1]);
+}
+
+static void fc_rx_check(hwaddr ba, int mbidx, const FcTestFrame *frame)
+{
+    uint32_t xpectd_ctrl = frame->expect_overrun ? FLEXCAN_MB_CODE_RX_OVERRUN
+                             : FLEXCAN_MB_CODE_RX_FULL;
+    xpectd_ctrl |= FLEXCAN_MB_CNT_LENGTH(frame->len) | FLEXCAN_MB_CNT_SRR;
+    if (frame->ide) {
+        xpectd_ctrl |= FLEXCAN_MB_CNT_IDE;
+    }
+    if (frame->rtr) {
+        xpectd_ctrl |= FLEXCAN_MB_CNT_RTR;
+    }
+
+    uint32_t xpectd_id = frame->ide ? frame->id : frame->id << 18;
+
+    uint32_t ctrl = readl(FCMB(ba, mbidx, 0)) & FC_MB_CNT_USED_MASK;
+    if ((ctrl & FLEXCAN_MB_CODE_MASK) == FLEXCAN_MB_CODE_RX_EMPTY) {
+        fprintf(stderr, "expected frame (id=0x%X) not received\n", frame->id);
+    }
+
+    g_assert_cmpuint(ctrl, ==, xpectd_ctrl);
+    g_assert_cmpuint(readl(FCMB(ba, mbidx, 1)), ==, xpectd_id);
+    g_assert_cmpuint(readl(FCMB(ba, mbidx, 2)), ==, frame->data[0]);
+    g_assert_cmpuint(readl(FCMB(ba, mbidx, 3)), ==, frame->data[1]);
+}
+
+static void fc_check_empty_multi(hwaddr ba, int idx_count, int mbidxs[])
+{
+    for (int i = 0; i < FLEXCAN_MAILBOX_COUNT; i++) {
+        bool check_empty = true;
+        int ctrl = readl(FCMB(ba, i, 0));
+
+        for (int j = 0; j < idx_count; j++) {
+            if (i == mbidxs[j]) {
+                check_empty = false;
+            }
+        }
+
+        if (check_empty) {
+            if (!(ctrl == FLEXCAN_MB_CODE_RX_EMPTY ||
+                  ctrl == FLEXCAN_MB_CODE_RX_INACTIVE)) {
+                g_assert_cmpuint(ctrl, ==, FLEXCAN_MB_CODE_RX_INACTIVE);
+            }
+            g_assert_cmpuint(readl(FCMB(ba, i, 1)), ==, 0);
+            g_assert_cmpuint(readl(FCMB(ba, i, 2)), ==, 0);
+            g_assert_cmpuint(readl(FCMB(ba, i, 3)), ==, 0);
+        } else {
+            g_assert_cmpuint(
+                ctrl & FLEXCAN_MB_CODE_MASK, !=,
+                FLEXCAN_MB_CODE_RX_INACTIVE
+            );
+        }
+    }
+}
+
+static void fc_check_empty(hwaddr ba, int mbidx)
+{
+    fc_check_empty_multi(ba, 1, &mbidx);
+}
+
+static void flexcan_test_linux_probe_impl(hwaddr fba)
+{
+    /* -- test a Linux driver-like probe sequence -- */
+    /* disable */
+    writel(FCREG(fba, mcr), 0xD890000F);
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0xD890000F);
+    g_assert_cmpuint(readl(FCREG(fba, ctrl)), ==, 0);
+
+    /* set bit in reserved field we do not implement (CTRL_CLK_SRC) */
+    writel(FCREG(fba, ctrl), 0x00002000);
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0xD890000F);
+
+    /* enable in freeze mode */
+    writel(FCREG(fba, mcr), 0x5980000F);
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0x5980000F);
+
+    /* enable Rx-FIFO */
+    writel(FCREG(fba, mcr), 0x7980000F);
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0x7980000F);
+    g_assert_cmpuint(readl(FCREG(fba, ecr)), ==, 0);
+
+    /* disable */
+    writel(FCREG(fba, mcr), 0xF890000F);
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0xF890000F);
+}
+
+static void flexcan_test_freeze_disable_interaction_impl(hwaddr fba)
+{
+    /* -- test normal <=> freeze <=> disable transitions -- */
+
+    /* leave freeze in disabled, FRZ_ACK should stay cleared */
+    writel(FCREG(fba, mcr), 0xF890000F); /* disable */
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0xF890000F);
+    writel(FCREG(fba, mcr), 0xB890000F);  /* by clearing FRZ */
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0xB890000F);
+
+    writel(FCREG(fba, mcr), 0xF890000F); /* disable */
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0xF890000F);
+    writel(FCREG(fba, mcr), 0xE890000F);  /* by clearing HALT */
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0xE890000F);
+
+    writel(FCREG(fba, mcr), 0xF890000F); /* disable */
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0xF890000F);
+    writel(FCREG(fba, mcr), 0xA890000F);  /* by clearing both */
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0xA890000F);
+
+    /* enter and leave freeze */
+    writel(FCREG(fba, mcr), 0x7980000F); /* enable in freeze mode */
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0x7980000F);
+    writel(FCREG(fba, mcr), 0x3980000F); /* leave by clearing FRZ */
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0x3080000F);
+
+    writel(FCREG(fba, mcr), 0x7980000F); /* enable in freeze mode */
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0x7980000F);
+    writel(FCREG(fba, mcr), 0x6980000F); /* leave by clearing HALT */
+    g_assert_cmpuint(readl(FCREG(fba, mcr)), ==, 0x6080000F);
+}
+
+static void flexcan_test_mailbox_io_impl(hwaddr ba_tx, hwaddr ba_rx)
+{
+    /* -- test correct handling of mailbox IO -- */
+    const int test_1_mbidx = 0;
+    fc_reset(ba_tx,
+             FLEXCAN_MCR_SRX_DIS | FLEXCAN_MCR_MAXMB(FLEXCAN_MAILBOX_COUNT));
+    fc_reset(ba_rx,
+             FLEXCAN_MCR_SRX_DIS | FLEXCAN_MCR_MAXMB(FLEXCAN_MAILBOX_COUNT));
+
+    fc_setup_rx_mb(ba_rx, test_1_mbidx);
+    fc_tx(ba_tx, test_1_mbidx, &fc_test_frame_1_ide);
+    g_assert_cmpuint(fc_get_irqs(ba_rx), ==, 1 << test_1_mbidx);
+    fc_rx_check(ba_rx, test_1_mbidx, &fc_test_frame_1_ide);
+    readl(FCREG(ba_rx, timer)); /* reset lock */
+
+    writel(FCMB(ba_rx, test_1_mbidx, 0), 0);
+    g_assert_cmpuint(readl(FCMB(ba_rx, test_1_mbidx, 0)), ==, 0);
+    writel(FCMB(ba_rx, test_1_mbidx, 1), 0x99AABBCC);
+    g_assert_cmpuint(readl(FCMB(ba_rx, test_1_mbidx, 1)), ==, 0x99AABBCC);
+}
+
+static void flexcan_test_dual_transmit_receive_impl(hwaddr ba_tx, hwaddr ba_rx)
+{
+    /* -- test TX and RX between the two FlexCAN instances -- */
+    const int test_1_mbidx = 50;
+    const int test_rounds = 50;
+
+    /* self-receive enabled on tx FC */
+    fc_reset(ba_tx,
+             FLEXCAN_MCR_MAXMB(FLEXCAN_MAILBOX_COUNT));
+    fc_reset(ba_rx,
+             FLEXCAN_MCR_SRX_DIS | FLEXCAN_MCR_MAXMB(FLEXCAN_MAILBOX_COUNT));
+
+    /* tests self-receive on tx and reception on rx */
+    fc_setup_rx_mb(ba_rx, test_1_mbidx);
+    fc_check_empty(ba_rx, test_1_mbidx);
+    fc_setup_rx_mb(ba_tx, test_1_mbidx + 1);
+    fc_check_empty(ba_tx, test_1_mbidx + 1);
+    g_assert_cmpuint(fc_get_irqs(ba_rx), ==, 0);
+    g_assert_cmpuint(fc_get_irqs(ba_tx), ==, 0);
+
+    fc_tx(ba_tx, test_1_mbidx, &fc_test_frame_1);
+    fc_clear_irq(ba_tx, test_1_mbidx);
+
+    fc_rx_check(ba_rx, test_1_mbidx, &fc_test_frame_1);
+    fc_check_empty(ba_rx, test_1_mbidx);
+    fc_rx_check(ba_tx, test_1_mbidx + 1, &fc_test_frame_1);
+    int tx_non_empty_mbidxs[] = {test_1_mbidx, test_1_mbidx + 1};
+
+    fc_check_empty_multi(ba_tx, 2, tx_non_empty_mbidxs);
+    fc_clear_irq(ba_rx, test_1_mbidx);
+    fc_clear_irq(ba_tx, test_1_mbidx + 1);
+    readl(FCREG(ba_rx, timer)); /* reset lock */
+
+    for (int ridx = 0; ridx < test_rounds; ridx++) {
+        /* test extended IDs sent to all mailboxes */
+        for (int i = 0; i < FLEXCAN_MAILBOX_COUNT; i++) {
+            fc_setup_rx_mb(ba_rx, i);
+        }
+        fc_check_empty_multi(ba_rx, 0, NULL);
+        g_assert_cmpuint(fc_get_irqs(ba_rx), ==, 0);
+        g_assert_cmpuint(fc_get_irqs(ba_tx), ==, 0);
+
+        for (int i = 0; i < FLEXCAN_MAILBOX_COUNT; i++) {
+            fc_tx(ba_tx, i, &fc_test_frame_1_ide);
+        }
+        g_assert_cmpuint(fc_get_irqs(ba_rx), ==, UINT64_MAX);
+        g_assert_cmpuint(fc_get_irqs(ba_tx), ==, UINT64_MAX);
+        for (int i = 0; i < FLEXCAN_MAILBOX_COUNT; i++) {
+            fc_rx_check(ba_rx, i, &fc_test_frame_1_ide);
+        }
+
+        /* reset interrupts */
+        writel(FCREG(ba_rx, iflag1), UINT32_MAX);
+        writel(FCREG(ba_rx, iflag2), UINT32_MAX);
+        writel(FCREG(ba_tx, iflag1), UINT32_MAX);
+        writel(FCREG(ba_tx, iflag2), UINT32_MAX);
+        g_assert_cmpuint(fc_get_irqs(ba_rx), ==, 0);
+        g_assert_cmpuint(fc_get_irqs(ba_tx), ==, 0);
+    }
+}
+
+static void flexcan_test_tx_abort_impl(hwaddr ba)
+{
+    /* -- test the TX abort feature -- */
+    fc_reset(ba,
+             FLEXCAN_MCR_SRX_DIS | FLEXCAN_MCR_MAXMB(FLEXCAN_MAILBOX_COUNT));
+
+
+    for (int mbidx = 0; mbidx < FLEXCAN_MAILBOX_COUNT; mbidx++) {
+        fc_tx(ba, mbidx, &fc_test_frame_1);
+
+        writel(FCMB(ba, mbidx, 0), FLEXCAN_MB_CODE_TX_ABORT);
+        g_assert_cmpuint(readl(FCMB(ba, mbidx, 0)), ==,
+                         FLEXCAN_MB_CODE_TX_INACTIVE);
+    }
+}
+
+static void flexcan_test_freeze_disable_interaction(void)
+{
+    qtest_start(FC_QEMU_ARGS);
+    flexcan_test_freeze_disable_interaction_impl(FSL_IMX6_CAN1_ADDR);
+    flexcan_test_freeze_disable_interaction_impl(FSL_IMX6_CAN2_ADDR);
+    qtest_end();
+}
+
+static void flexcan_test_linux_probe(void)
+{
+    qtest_start(FC_QEMU_ARGS);
+    flexcan_test_linux_probe_impl(FSL_IMX6_CAN1_ADDR);
+    flexcan_test_linux_probe_impl(FSL_IMX6_CAN2_ADDR);
+    qtest_end();
+}
+
+static void flexcan_test_dual_transmit_receive(void)
+{
+    qtest_start(FC_QEMU_ARGS);
+    flexcan_test_dual_transmit_receive_impl(FSL_IMX6_CAN1_ADDR,
+                                            FSL_IMX6_CAN2_ADDR);
+    flexcan_test_dual_transmit_receive_impl(FSL_IMX6_CAN2_ADDR,
+                                            FSL_IMX6_CAN1_ADDR);
+    qtest_end();
+}
+
+static void flexcan_test_tx_abort(void)
+{
+    qtest_start(FC_QEMU_ARGS);
+    flexcan_test_tx_abort_impl(FSL_IMX6_CAN1_ADDR);
+    flexcan_test_tx_abort_impl(FSL_IMX6_CAN2_ADDR);
+    qtest_end();
+}
+
+static void flexcan_test_mailbox_io(void)
+{
+    qtest_start(FC_QEMU_ARGS);
+    flexcan_test_mailbox_io_impl(FSL_IMX6_CAN1_ADDR, FSL_IMX6_CAN2_ADDR);
+    flexcan_test_mailbox_io_impl(FSL_IMX6_CAN2_ADDR, FSL_IMX6_CAN1_ADDR);
+    qtest_end();
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/net/flexcan/linux_probe", flexcan_test_linux_probe);
+    qtest_add_func("/net/flexcan/freeze_disable_interaction",
+                   flexcan_test_freeze_disable_interaction);
+    qtest_add_func("/net/flexcan/dual_transmit_receive",
+                   flexcan_test_dual_transmit_receive);
+    qtest_add_func("/net/flexcan/tx_abort",
+                   flexcan_test_tx_abort);
+    qtest_add_func("/net/flexcan/mailbox_io", flexcan_test_mailbox_io);
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 45ea497fa5..0852ec4ce8 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -249,6 +249,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') ? qtests_stm32l4x5 : []) + \
   (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed_fsi-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_CAN_FLEXCAN') ? ['flexcan-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
   ['arm-cpu-features',
-- 
2.54.0


