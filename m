Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F9CC61DD3
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 14:22:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x28Kl-0003rV-NN; Thu, 03 Sep 2026 10:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x28Kb-0003pv-QY
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 10:22:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x28KY-0006MA-3V
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 10:22:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49b392ccaacso36156915e9.2
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788445336; x=1789050136; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NwDxLC/oWMRhdUIEhVG9Gi2RPoeDyYc/cxpG7J021lY=;
 b=ZgfWbj7ddC+zLKSlam88r1WYX27jgaodqd1cdDR1tjG3Nu9NWRrR4/r9L/ExZ4P9ui
 N3JH9xywkG6HOuoyIRodY/q85Siy3cenvb38hQ32PPNZkANSyTz7fMNO/X2jmJhalGXT
 NA0ZKXP8Xbr389wuu3EHPqW8mu7WiJHHy8rN62Z1TAULE2ocIB9UzDV1eZyg3qPdEGjD
 L7NENXMIB8b05yC+xuE2honQfsXpX0p0FxR9l8vI0KBup1bcKAjYRURwTmGSIYtu1tkZ
 0bSSXPuXefI88vqqJKC9k6HscqGm0KtRhriEmu4V8aeI3Dgl++W/pmUxWe3HRXL02Kk3
 HGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788445336; x=1789050136;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NwDxLC/oWMRhdUIEhVG9Gi2RPoeDyYc/cxpG7J021lY=;
 b=XUJKSz1/ZvuTPYqYTLByUY70sRXywdcZ7Jk8rublR0fECcSWunWvnW+5z5ZP7oGPoI
 QIdJhz5X5VrURHez0QL04f11NVB56Y0qWfl/O7gpD0muXAH0kj306OgmpQRqF2j+w6tx
 zEkV7LLRVo7ApJGBvJotKxl8y8ZKF08nQwYa0YdGHteccR84OCRTyP/BM/8Q8w7NlJjt
 s3gTnBagGTcT0djjLqspnnOakbhRsspGsSWtcGzM5y533esmM9cH6LhhBNjQFriSVjV4
 a52A/m1nlOBgFhZC5M/XcHDWmrJPJPJLrtUMGYeMq7k+5O2uZsg1f+HvBTZuSByQUTdy
 o11g==
X-Gm-Message-State: AFuF++lT38N6NjsbJGF+sJ67GtgHE1gxy14690Z5Yil4lo7U7SPWQeiO
 vR1g8X9QdaYJlzWzv9D9VVfWoJ0s54nlOooDsnHAHOC9qmgM6LjObWn2bXtglflTO+M=
X-Gm-Gg: AYBFou3DRNHQZulq+qF4ZSqHFIGylMyPcR/0rtjLDVNeg6TJ4psxPjrXfMmpzCoQrpO
 zhWf6Dq5wtfTlfMfOC4YDHGw3ozdWoqSa2qj5P9MyZ+aVOBl0DkNWLXdAyEpUKjhkrexDeq9wsk
 q9sfmCaOmD5M8qhUFaa6OaSyVHWFzC3hbip59Gn5dL9J0NEqErmg7ZmiJGKZPtvvV56K+YWoN9H
 2HWPjLW7NxgWFzNPhNQok4daFKBsuyyVt7FHi2aRfOk7qASSzdkd4/W+68TkffmHzGrSenqfZ/F
 UC+EyKO32j7js8DT7JRp9Ye0GCVKvhUTZ35nkbQgyklsasCa5Ew5fVxwqxNpWglhnlJzQozKk8E
 Y2n7jlpdB428wJxEN0hTg5zA3RcVhipmCIyN/potK4PTsiFmlq4wphKt6zrZhni2VEzJ+cj5gdJ
 hmZshlkvg2j6lZom9lbxp03jPh1FT7bIi9hZ6U/jjlLecnjj8zmJNVDwsF59uj
X-Received: by 2002:a05:600c:8b88:b0:49c:e1cd:536 with SMTP id
 5b1f17b1804b1-49ce584b899mr224444315e9.12.1788445336451; 
 Thu, 03 Sep 2026 07:22:16 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed3716sm15312142f8f.22.2026.09.03.07.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 07:22:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 982675F9CF;
 Thu, 03 Sep 2026 15:22:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/2] tests/qtest: add gicv2 qtest test case
Date: Thu,  3 Sep 2026 15:22:12 +0100
Message-ID: <20260903142212.1451770-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903142212.1451770-1-alex.bennee@linaro.org>
References: <20260903142212.1451770-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

We have a bunch of bugs which provide qtest sequences to show faults
in the GIC. Create a qtest to hold these and populate with the first
test case.

Link: https://gitlab.com/qemu-project/qemu/-/work_items/4402
AI-used-for: created qtest boilerplate based on bug report
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/arm-gicv2-test.c | 84 ++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build      |  2 +
 2 files changed, 86 insertions(+)
 create mode 100644 tests/qtest/arm-gicv2-test.c

diff --git a/tests/qtest/arm-gicv2-test.c b/tests/qtest/arm-gicv2-test.c
new file mode 100644
index 00000000000..dbfb2cd801d
--- /dev/null
+++ b/tests/qtest/arm-gicv2-test.c
@@ -0,0 +1,84 @@
+/*
+ * ARM GICv2 Virtual Interface Control and Virtual CPU Interface Tests
+ *
+ * Copyright (c) 2026 Linaro Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+/* Addresses in the virt machine when virtualization=on */
+#define GICH_BASE 0x08030000
+#define GICV_BASE 0x08040000
+
+/* Hypervisor Control Registers */
+#define GICH_HCR        0x0000
+#define GICH_LR0        0x0100
+
+/* Virtual CPU Interface Registers */
+#define GICV_CTLR       0x0000
+#define GICV_PMR        0x0004
+#define GICV_IAR        0x000c
+#define GICV_EOIR       0x0010
+#define GICV_HPPIR      0x0018
+
+/*
+ * Test Highest Priority Pending Interrupt Register (GICV_HPPIR)
+ * and Interrupt Acknowledge Register (GICV_IAR) for a virtual SGI.
+ *
+ * In GICv2, for an SGI, both HPPIR and IAR report:
+ *   Bits [9:0]:   INTID
+ *   Bits [12:10]: CPUID of the requesting processor
+ * (See Issue 4402: GICV_HPPIR dropped the CPUID field and returned only INTID).
+ */
+static void test_virtual_interface_sgi(void)
+{
+    QTestState *qts = qtest_init("-machine virt,virtualization=on,gic-version=2");
+
+    /* Enable virtual CPU interface and allow all interrupt priorities */
+    qtest_writel(qts, GICV_BASE + GICV_CTLR, 0x1);
+    qtest_writel(qts, GICV_BASE + GICV_PMR, 0xff);
+
+    /* Enable virtual interface in hypervisor control */
+    qtest_writel(qts, GICH_BASE + GICH_HCR, 0x1);
+
+    /*
+     * Configure GICH_LR0 with a pending SGI:
+     *   VirtualID = 5 (bits [9:0])
+     *   CPUID = 1     (bits [12:10]) -> 1 << 10 = 0x400
+     *   Priority = 4  (bits [27:23]) -> 4 << 23 = 0x02000000
+     *   State = 1     (bits [29:28]) -> PENDING = 0x10000000
+     * Value: 0x12000405
+     */
+    qtest_writel(qts, GICH_BASE + GICH_LR0, 0x12000405);
+
+    /* Read highest pending interrupt and acknowledge register */
+    uint32_t hppir = qtest_readl(qts, GICV_BASE + GICV_HPPIR);
+    uint32_t iar = qtest_readl(qts, GICV_BASE + GICV_IAR);
+
+    g_test_message("GICV_HPPIR = 0x%08x, GICV_IAR = 0x%08x", hppir, iar);
+
+    /* GICV_IAR must report CPUID 1 and INTID 5 (0x405) */
+    g_assert_cmphex(iar, ==, 0x405);
+
+    /*
+     * GICV_HPPIR must also report CPUID 1 and INTID 5 (0x405).
+     * In buggy QEMU, GICV_HPPIR erroneously returns 0x5.
+     */
+    g_assert_cmphex(hppir, ==, 0x405);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    if (qtest_has_machine("virt")) {
+        qtest_add_func("/arm/gicv2/virtual_interface_sgi", test_virtual_interface_sgi);
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 50a1a5272fa..37c21b8f9fb 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -265,6 +265,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
   ['arm-cpu-features',
+   'arm-gicv2-test',
    'boot-serial-test']
 
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
@@ -284,6 +285,7 @@ qtests_aarch64 = \
    ['iommu-smmuv3-test'] : []) + \
   qtests_cxl +                                                                                  \
   ['arm-cpu-features',
+   'arm-gicv2-test',
    'numa-test',
    'boot-serial-test',
    'migration-test']
-- 
2.47.3


