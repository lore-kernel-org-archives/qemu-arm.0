Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CBA606A333
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjtttEa4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNpG9-0003Za-Dk; Mon, 02 Nov 2026 05:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNpG5-0003Ys-VK
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:27:22 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNpG4-0006jY-1l
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:27:21 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so22390345e9.2
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793615238; x=1794220038; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lazOyce7RHVbWkwdFCVuG2iG+AC86pgxd0if11bb8Is=;
 b=QjtttEa4boucV80ZIxLOGJnqySJWrFMAIH6FqsWm9I4qv8AOstedoMSQFXr6GLf85j
 EwUplsVnqY3X5Gy2DWVThqXrkxHGl/aRlJy1OXi/JCKMi7kzSto0QT0IdtoiVu4ad9oQ
 87J1aqhA2ULn+XgoJr9dlDKW8mgt8VMXO0wcpCuMCL1Eqi+oWX0IxRMSREdigEpgWMn4
 gWB08NRw6txJ/CrlGt6s+yQHrdgLjlBASCVzvu5hzieInBGcPrWD3tT2f1ntFpSCoV1u
 JqCXthZ7ObWvbTIXq1EbUZgFdf2Oel7X4jLyakve7VqIUWV81mItOeyBZkR/x0oj87HJ
 3Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793615238; x=1794220038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lazOyce7RHVbWkwdFCVuG2iG+AC86pgxd0if11bb8Is=;
 b=yie32UMYOYZN3OsummEGSe5yfPB3LelWCZUNC0dzXWx1663Hmy4GSodeottFREmPGJ
 IgWUz1mb/JSJUcsmUvAIxkm37j+mukIx0wwKDsE5qsynZ7H5f+to884nQCdgxnU1a/vO
 L3Tj+1LVSyMl9ZVyodMnsXld77/LPmzODCvUfr2kxUazEoEgTo9jR/huNL7KoCDeXCfW
 UXVjyqrbxBjx7HV3qmjPr1bOAhv5Kskq3gU6RznkTg1ONrj1zDMdApGMk4FrtVpKS1+6
 M8jPNw4tXlixdjS+kOEeqTh7N0OH3BFYKZrtJaw5wDXTH+DBTNVUOWOw/LQIoVo5QQJB
 uq3g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxaujZjH19hVcqCJAdRr3QYeW88B+6yMRIcANm7XM5mExkvOQXKJdHw7nNOmQTOTE3tt3o1H8AN6w==@nongnu.org
X-Gm-Message-State: AFq9FYJrULChjgd9OA4R6B3W2hw1YYsb3FUhr2vVuz1JrXRh7QdE/Avy
 6uuAukDvUNfKh3Tnk/yw04HJ3m4wsNDLFVYfP0YefXxx/bZATBpVPp+o
X-Gm-Gg: AYBFou2DtatBFQMQ7ereh7PbZqkKFjIYdIPbJFhbaQP3d2LIBYfuoXl5RVUT2oON+zc
 opWPTe0JR/F8HCFtmIdtapVlUZ9gm27xkWgxY8u2LEz7sIXahQ0m+KTlOuw5X+4SON2XvwhdqMy
 AugIZ/AX4oknrwSzCA2/afaZmsfRkGcxSyRsaFwzMDr0fZ+U0yR2h0qnoHC+SKW/+yyuhkS6Nk4
 ideaDv6kZfwf4GrMnFl/XEEZF3Y0t+7hUa9DX32pscg03rNMmJCfgnfcsTObEZy9JntNmIOS74F
 qskQ5NXbOygBJ9oDOSxgcU1NXJRGs7tBi6sbZ11+or2MzoSJW6tFOao9CH2vMnnLXpL+WajM8ub
 hnXNRAY0EaOH7hniDbZxH1f3U5XuQ/IYV6NhHUGIZKi3NzkP2zh3PNlCxnm5thP6ubX5tCEPjy1
 fLhikyq1irFeg+SnDgR/NvFBjHq7tEN/omu/PcR2QmY3b6sCVj8tTbw3+4CerdMfriI4BsCK2HP
 8BVZrkVkDBXsYbt/4rjVd47VTSTIyzZaSNEaarLlTCBSAimn/a0tUlIzigR/97M+zwOWxTLolZk
 HA2RgA3leTVUBGMvCtCEcz7rcpYAIVG2pdbyOumAlHWoPtEe28Nb28iadhbndS0Fif1d0JZs0gt
 kzrDj7NarsgdFB50EdnHX2wI=
X-Received: by 2002:a05:600c:8b55:b0:4a1:ddca:8b66 with SMTP id
 5b1f17b1804b1-4ac19234a06mr213422935e9.31.1793615238341; 
 Mon, 02 Nov 2026 02:27:18 -0800 (PST)
Received: from localhost.localdomain (email.telematik-zentrum.de.
 [87.138.218.176]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09ad5ff8sm185193425e9.4.2026.11.02.02.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 02:27:18 -0800 (PST)
From: Lorand Marton <lorandmarton.dev@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org,
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com,
 alistair@alistair23.me
Subject: [PATCH 4/5] hw/timer/bcm2835_systmr: cancel the compares and lower
 the IRQs on reset
Date: Mon,  2 Nov 2026 11:27:17 +0100
Message-ID: <c2ea822f9f49674173e5ae3089631838d034aef7.1793613972.git.lorandmarton.dev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
References: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=lorandmarton.dev@gmail.com; helo=mail-wm1-x32a.google.com
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bcm2835_systmr_reset() cleared the match bits and the compare
registers, but a channel whose match had raised its interrupt kept the
line raised, and a compare armed before the reset still fired after
it, setting its match bit and raising the interrupt in a guest that
had not armed it. Both happen when a guest reboots with a system timer
channel in use (the firmware or a bare-metal guest's tick).

Delete the timers and lower the interrupts in the reset, as the
register values now say.

Test that a reset drops a raised channel and that a compare set before
it does not fire.

Fixes: be95dffa326a ("hw/timer/bcm2835: Support the timer COMPARE registers")
Signed-off-by: Lorand Marton <lorandmarton.dev@gmail.com>
---
 hw/timer/bcm2835_systmr.c         |  4 +++
 tests/qtest/bcm2835-systmr-test.c | 54 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build           |  2 +-
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/bcm2835-systmr-test.c

diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
index 06a919b1f8..3c03c98193 100644
--- a/hw/timer/bcm2835_systmr.c
+++ b/hw/timer/bcm2835_systmr.c
@@ -123,6 +123,10 @@ static void bcm2835_systmr_reset(DeviceState *dev)
     BCM2835SystemTimerState *s = BCM2835_SYSTIMER(dev);
 
     memset(&s->reg, 0, sizeof(s->reg));
+    for (size_t i = 0; i < ARRAY_SIZE(s->tmr); i++) {
+        timer_del(&s->tmr[i].timer);
+        qemu_set_irq(s->tmr[i].irq, 0);
+    }
 }
 
 static void bcm2835_systmr_realize(DeviceState *dev, Error **errp)
diff --git a/tests/qtest/bcm2835-systmr-test.c b/tests/qtest/bcm2835-systmr-test.c
new file mode 100644
index 0000000000..a70fc46b92
--- /dev/null
+++ b/tests/qtest/bcm2835-systmr-test.c
@@ -0,0 +1,54 @@
+/*
+ * QTest testcase for the BCM2835 system timer
+ *
+ * A compare match raises the interrupt of its channel; a reset clears the
+ * matches, lowers the interrupts and cancels the pending compares.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "libqtest.h"
+
+#define SYSTMR_BASE     0xfe003000
+#define SYSTMR_PATH     "/machine/soc/peripherals/systimer"
+#define CS              0x00
+#define CLO             0x04
+#define C(n)            (0x0c + (n) * 4)
+
+#define US              1000    /* the timer counts microseconds */
+
+static void test_reset(void)
+{
+    QTestState *qts = qtest_init("-M raspi4b");
+    uint32_t clo;
+
+    qtest_irq_intercept_out_named(qts, SYSTMR_PATH, "sysbus-irq");
+
+    clo = qtest_readl(qts, SYSTMR_BASE + CLO);
+    qtest_writel(qts, SYSTMR_BASE + C(1), clo + 1000);
+    qtest_writel(qts, SYSTMR_BASE + C(3), clo + 100000);
+    qtest_clock_step(qts, 2000 * US);
+    g_assert_cmphex(qtest_readl(qts, SYSTMR_BASE + CS), ==, BIT(1));
+    g_assert_true(qtest_get_irq(qts, 1));
+    g_assert_false(qtest_get_irq(qts, 3));
+
+    qtest_system_reset(qts);
+    g_assert_cmphex(qtest_readl(qts, SYSTMR_BASE + CS), ==, 0);
+    g_assert_false(qtest_get_irq(qts, 1));
+
+    /* the compare of channel 3 was set before the reset */
+    qtest_clock_step(qts, 200000 * US);
+    g_assert_cmphex(qtest_readl(qts, SYSTMR_BASE + CS), ==, 0);
+    g_assert_false(qtest_get_irq(qts, 3));
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/bcm2835-systmr/reset", test_reset);
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index d4a20cd408..76448c5d4f 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -286,7 +286,7 @@ qtests_aarch64 = \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test', 'xlnx-versal-trng-test'] : []) + \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test', 'bcm2835-i2c-test', 'bcm2835-ic-test',
-                                                    'bcm2835-spi-test'] : []) +  \
+                                                    'bcm2835-spi-test', 'bcm2835-systmr-test'] : []) +  \
   (config_all_accel.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test', 'tpm-tis-i2c-swtpm-test'] : []) + \
   (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed64 : []) + \
-- 
2.56.0


