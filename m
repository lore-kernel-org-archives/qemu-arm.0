Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp145056lfo;
        Thu, 28 Jan 2021 03:43:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNfjDXYEGoHXQTJH3GbDj/sN/v0pXkWYeyotyGCQjXzrTrIWtYyP03O+5DpuNlk26AjSPl
X-Received: by 2002:a25:3858:: with SMTP id f85mr23101217yba.125.1611834208349;
        Thu, 28 Jan 2021 03:43:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834208; cv=none;
        d=google.com; s=arc-20160816;
        b=WiCOKQ8j94LXhhrT1Pg4zYjdykp/ivNOgDWFp7ybo9WBAzVNRum6BGvPAjPDhwNOL2
         7vJmEt9iV/ZRKn5V3vaQyCnuGHsCI+i/0N4JhhgDa3K//aLRnnuDkI/iBbeoKIooH2cd
         EalujpHO7KOEbjX2XSAwZdIHwdjOgdxUqa/QZ7hdN/Koa3qZi+zoqpNQOlYrsuF1b7Vh
         INeRC7346Ae3UrOvr6srfUfqY0YpC6hGArcUo/QWXxTMlaMMkFiE7ACdU/Il1+fTDbKM
         0yWP3gsAD5EpvQ1qSihMwL0dCX+KqyaIkn/6xsDoA9oiZEjjscsVX/GvLv41yGi0c1e9
         hTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mIaFFwYWu88wzMmbyHFa8Xtc/F0W8Il5bCeA2Q8j4zA=;
        b=md3MqIcPyyIHCY3boPVCgf3Dy2vmRUUUD/PckLvkXBKAcDzjCOUhkbvKTORc3d7sR4
         d7/3hhkj5nfdMFOvuS5QvvJjl8NbHPige7GHdcA2jQWzfyc4ZduSHWh0zIA/i5bBLgIt
         y6FqA4Ei16g8z2x9CaKxeuKe8LROPwfdxMixz08ApFMWCa7Ez1OoiUn9FgCG7LkYN+BW
         wLPHqAiFhXBr1Y8T9OvymzEw0wJi9Ayonfh0GF/X5exAvxlbFZn97y8Dmqcl0PUB6QhB
         9wpXCtoZdRNNbKMCWuPlnyAefPq93aSNpoCyL6kPT7OdesapgAX8kfBCyvyO+PE6HRlU
         7J9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXW+7aer;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j126si4973514ybb.41.2021.01.28.03.43.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:43:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXW+7aer;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55hu-00035F-BN
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gW-0001B6-KC
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gQ-00066d-V7
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:00 -0500
Received: by mail-wr1-x436.google.com with SMTP id v15so5075698wrx.4
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 03:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mIaFFwYWu88wzMmbyHFa8Xtc/F0W8Il5bCeA2Q8j4zA=;
 b=wXW+7aeri3aliDQPdm1oH5+nD5oSuJ8Jko6uCIgTwcWOBNbtTlFoqvhqqTWsmNqC54
 VU5ev76NieFgExEH0RlANm1GB4vFWbXq15FDlTTIuR8q7KY0iRCP4ip4KkyN0Ydp52lz
 a4jtxJDaNN0brS7Hd6peamz+hMwSEOxLO/iPSOBLGA+R1M7xL3l62vovC42NGH13h7Hj
 7DBSoz8JFPIz6uPEHtrKOSRr+aybabPNLP3M68++L9aUGs1ZkLTxLojXLpSRTD/M9mPg
 JxkYusianzvW30mHX6vIxfUzA9kuuVwa9+RsxMlOy1X1lqw0rYu3Hm1cngPY/gwxPQEo
 p3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mIaFFwYWu88wzMmbyHFa8Xtc/F0W8Il5bCeA2Q8j4zA=;
 b=AYFu+mX+bkpBxvIC7p3yWBBCPlJEbEwToAU50+q/9B1CpdkivqJhTiZ0ocVd0pXPsT
 ejJBwd4u8V2LZd/093Ao5AOycofb0PDVHmDKQdSjbh5rgGF6zb1DIsFr3kPtthsiD5Kc
 +o4wm11kgYPhQbI10F9lMnnn4Rxzt3IlxODGt8ZMefPQso9iyuo62BnI6iFKveSbE+0j
 s5DE1BS1rE3biUFOFtiTCh3P9YxznCsv6i55Pc7BNLqyr37KdN0z+Wh4ELEkM/4zlws9
 YL7dDuGTmhz/z7wGxKe1L3qn/UXoO1t/9N7HbuBK16wndPCOZSzDNtyx0prPb3PJbpfC
 T6yg==
X-Gm-Message-State: AOAM533n146I4mrLwowRXs4aYZcz+byH/qP0dLCFjHS+LTV92/1AegkG
 c5ZXGWpzVIS6HMfA6zywsXU0Y4vURLzffg==
X-Received: by 2002:a5d:4391:: with SMTP id i17mr15810545wrq.57.1611834113288; 
 Thu, 28 Jan 2021 03:41:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/25] tests: Add a simple test of the CMSDK APB dual timer
Date: Thu, 28 Jan 2021 11:41:25 +0000
Message-Id: <20210128114145.20536-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xBSxYyZ/WXDb

Add a simple test of the CMSDK dual timer, since we're about to do
some refactoring of how it is clocked.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210121190622.22000-6-peter.maydell@linaro.org
---
v1->v2 changes:
 - phrase various clock_step() arguments as calculations
   based on tick counts and the ns-per-tick value rather
   than just the final numbers
 - remove set-but-not-used QTestState *s variable
   that gcc warns about but clang does not
 - use 40 * 256 in test_prescale() as suggested by Luc
---
 tests/qtest/cmsdk-apb-dualtimer-test.c | 130 +++++++++++++++++++++++++
 MAINTAINERS                            |   1 +
 tests/qtest/meson.build                |   1 +
 3 files changed, 132 insertions(+)
 create mode 100644 tests/qtest/cmsdk-apb-dualtimer-test.c

diff --git a/tests/qtest/cmsdk-apb-dualtimer-test.c b/tests/qtest/cmsdk-apb-dualtimer-test.c
new file mode 100644
index 00000000000..ad6a758289c
--- /dev/null
+++ b/tests/qtest/cmsdk-apb-dualtimer-test.c
@@ -0,0 +1,130 @@
+/*
+ * QTest testcase for the CMSDK APB dualtimer device
+ *
+ * Copyright (c) 2021 Linaro Limited
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+/* IoTKit/ARMSSE dualtimer; driven at 25MHz in mps2-an385, so 40ns per tick */
+#define TIMER_BASE 0x40002000
+
+#define TIMER1LOAD 0
+#define TIMER1VALUE 4
+#define TIMER1CONTROL 8
+#define TIMER1INTCLR 0xc
+#define TIMER1RIS 0x10
+#define TIMER1MIS 0x14
+#define TIMER1BGLOAD 0x18
+
+#define TIMER2LOAD 0x20
+#define TIMER2VALUE 0x24
+#define TIMER2CONTROL 0x28
+#define TIMER2INTCLR 0x2c
+#define TIMER2RIS 0x30
+#define TIMER2MIS 0x34
+#define TIMER2BGLOAD 0x38
+
+#define CTRL_ENABLE (1 << 7)
+#define CTRL_PERIODIC (1 << 6)
+#define CTRL_INTEN (1 << 5)
+#define CTRL_PRESCALE_1 (0 << 2)
+#define CTRL_PRESCALE_16 (1 << 2)
+#define CTRL_PRESCALE_256 (2 << 2)
+#define CTRL_32BIT (1 << 1)
+#define CTRL_ONESHOT (1 << 0)
+
+static void test_dualtimer(void)
+{
+    g_assert_true(readl(TIMER_BASE + TIMER1RIS) == 0);
+
+    /* Start timer: will fire after 40000 ns */
+    writel(TIMER_BASE + TIMER1LOAD, 1000);
+    /* enable in free-running, wrapping, interrupt mode */
+    writel(TIMER_BASE + TIMER1CONTROL, CTRL_ENABLE | CTRL_INTEN);
+
+    /* Step to just past the 500th tick and check VALUE */
+    clock_step(500 * 40 + 1);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1RIS), ==, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1VALUE), ==, 500);
+
+    /* Just past the 1000th tick: timer should have fired */
+    clock_step(500 * 40);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1RIS), ==, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1VALUE), ==, 0);
+
+    /*
+     * We are in free-running wrapping 16-bit mode, so on the following
+     * tick VALUE should have wrapped round to 0xffff.
+     */
+    clock_step(40);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1VALUE), ==, 0xffff);
+
+    /* Check that any write to INTCLR clears interrupt */
+    writel(TIMER_BASE + TIMER1INTCLR, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1RIS), ==, 0);
+
+    /* Turn off the timer */
+    writel(TIMER_BASE + TIMER1CONTROL, 0);
+}
+
+static void test_prescale(void)
+{
+    g_assert_true(readl(TIMER_BASE + TIMER2RIS) == 0);
+
+    /* Start timer: will fire after 40 * 256 * 1000 == 1024000 ns */
+    writel(TIMER_BASE + TIMER2LOAD, 1000);
+    /* enable in periodic, wrapping, interrupt mode, prescale 256 */
+    writel(TIMER_BASE + TIMER2CONTROL,
+           CTRL_ENABLE | CTRL_INTEN | CTRL_PERIODIC | CTRL_PRESCALE_256);
+
+    /* Step to just past the 500th tick and check VALUE */
+    clock_step(40 * 256 * 501);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2RIS), ==, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2VALUE), ==, 500);
+
+    /* Just past the 1000th tick: timer should have fired */
+    clock_step(40 * 256 * 500);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2RIS), ==, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2VALUE), ==, 0);
+
+    /* In periodic mode the tick VALUE now reloads */
+    clock_step(40 * 256);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2VALUE), ==, 1000);
+
+    /* Check that any write to INTCLR clears interrupt */
+    writel(TIMER_BASE + TIMER2INTCLR, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2RIS), ==, 0);
+
+    /* Turn off the timer */
+    writel(TIMER_BASE + TIMER2CONTROL, 0);
+}
+
+int main(int argc, char **argv)
+{
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_start("-machine mps2-an385");
+
+    qtest_add_func("/cmsdk-apb-dualtimer/dualtimer", test_dualtimer);
+    qtest_add_func("/cmsdk-apb-dualtimer/prescale", test_prescale);
+
+    r = g_test_run();
+
+    qtest_end();
+
+    return r;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 3729b89f359..154a91d12e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -584,6 +584,7 @@ F: include/hw/timer/cmsdk-apb-timer.h
 F: tests/qtest/cmsdk-apb-timer-test.c
 F: hw/timer/cmsdk-apb-dualtimer.c
 F: include/hw/timer/cmsdk-apb-dualtimer.h
+F: tests/qtest/cmsdk-apb-dualtimer-test.c
 F: hw/char/cmsdk-apb-uart.c
 F: include/hw/char/cmsdk-apb-uart.h
 F: hw/watchdog/cmsdk-apb-watchdog.c
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 9e2ebc47041..69dd4a8547c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -141,6 +141,7 @@ qtests_npcm7xx = \
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test']
 qtests_arm = \
+  (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
-- 
2.20.1

