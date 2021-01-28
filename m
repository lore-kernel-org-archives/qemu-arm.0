Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp144483lfo;
        Thu, 28 Jan 2021 03:42:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzZKUwvbrzGoSw8kNe7rMGOeS8OCqctP6scy99u4ig687uHmfDqRMbmOu3BFaxY896I29M
X-Received: by 2002:a25:c401:: with SMTP id u1mr21486801ybf.340.1611834147971;
        Thu, 28 Jan 2021 03:42:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834147; cv=none;
        d=google.com; s=arc-20160816;
        b=wIw4X/nmFiSGoyCP2hJxuaNgd768M0UXIF4p8Vm47FxR32uf7bbM5NyNQyrFEUcnw2
         I3t1nqMGr6gVwsVl/JF6lLB8397GC0pmICwwpp7aWTI4uL3T+syNWikTDWCtH+9w1eMB
         saP86H/rxjAuY3JadB1eLhSgP6jBgxYNNQIq04PDN+/+v1J84Nx/5Q5p9+zBi+2acXw5
         KsAvQEgOBwfKOLxpWRQkcuU9H3Pjw2hPOW6hxCfLVghG8f5Oa+KM6ZbUHXcaKuYJmO1P
         Iz1rLO/p8AJIdZJiprJutapOtN2zSQQ9lwbXkr6/eWt9qP6HSbCNON7HxPrq8kbYFC6U
         mHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5Rp4YOjE1gcv04Ecoqqv1uDwHaV4/xeO6+AU9Z5cIK8=;
        b=CGpPwuFfWnVpFEJlTMMIKjEVbe5TxmfTMUG8mUZreIRbo8gVTQNbmolyCtDTILNCCE
         BPdjvpI5CmJffvMes0sHd2691SkP4HMEt5jVZxt+GifSFa9CP7aXzyZTJ4YZpVDVximO
         z2em9kR2dfveFmo5Lm6bBmpsTUR6ynNGx0hNDSMA+ulsJ0ff/wEMBR7c2bDLFHywiyqo
         Q/uDVEuMRl3f9YrzhwcSnRcHiEXqcJI8rmrp0nqqH8Sqoo3KQ8rq5R8Ap9i5/iFEsM56
         WXJxka6iTUA58G8AWYg0rB07UXF63hJon1MNDciAcglwODvtGFncCwZpZoB4hi1eONo+
         eNJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgGwCvDy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si5868964ybs.252.2021.01.28.03.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:42:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgGwCvDy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55gx-0001Ja-AN
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gV-00019S-Ku
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:41:59 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gO-000664-Ki
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:41:59 -0500
Received: by mail-wr1-x432.google.com with SMTP id m13so5043205wro.12
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 03:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Rp4YOjE1gcv04Ecoqqv1uDwHaV4/xeO6+AU9Z5cIK8=;
 b=qgGwCvDyOBuBYSwXrb0TpopTCYOR8WonUDAj5iLrHy49Tk9m6yB+rbYPrmCsemxJWR
 eITAFuxGsGn1/IYlcWGhUBMBLEBqz0Hak0ser/l/hpeiTZZcCy6e+NIOfTUqABp7VUBV
 MzQeuVokkm5zkGSV7KuV47WpvGaKo/LT+7y44gCzAE2ICZKYpx4LSjuUCBg3hRtV/rhL
 fwBkbehmty+RTOH41eVyjOi9BMOcdOizedaLbqfSDuE2rfmVbReVPqUmMu8W8WQTHEcI
 RRES/f2HeIjZv8plY0rtrjG6ChI1Exz/xdSRRTarHrSiZ+4hZXDux46iOvUfDjl7/ca9
 UhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Rp4YOjE1gcv04Ecoqqv1uDwHaV4/xeO6+AU9Z5cIK8=;
 b=QYUI0H1hKF72bNMUPWd896by0xrcXZY6gOL5aLtFBEyueWNTONweAfRvj5kcnjytmm
 Eiuey/CKYIVjVc8RuG04qnuitdsFs12cEqtNP+AZ/CSP3QXQ7vcTqfyBTeXaeUNCZAE8
 CLOLZ7xnJjACP07UHHddc2DXylINWcJaQVi3+U93pKgUiuut73eDA2ctS5xEGdCkVGpo
 Quh0jqT9WSv3u3Ti4yJpGN7sb39KK5+t7E2HmdGFE8X/FoixMbaUnRY+FdOgdw/a77Ku
 7CYpjmQ8Sn47NH+Wct01RmqAwXnmEDmLyvUvSCZ1vKHFIedXJQFEzX0l205gdBq22iKp
 GcUg==
X-Gm-Message-State: AOAM533Drjw2nsH1ch8Cy6bTY27n0PlSSemsv8ButvX7PrFcOZQU1SNA
 zpF/7By9deDwfFJbxBlfkJtpWlYIIkqxDQ==
X-Received: by 2002:adf:f452:: with SMTP id f18mr15394336wrp.11.1611834111278; 
 Thu, 28 Jan 2021 03:41:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/25] tests: Add a simple test of the CMSDK APB timer
Date: Thu, 28 Jan 2021 11:41:23 +0000
Message-Id: <20210128114145.20536-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: eHKUVTATpL7+

Add a simple test of the CMSDK APB timer, since we're about to do
some refactoring of how it is clocked.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-4-peter.maydell@linaro.org
---
v1->v2 changes:
 - phrase various clock_step() arguments as calculations
   based on tick counts and the ns-per-tick value rather
   than just the final numbers
 - remove set-but-not-used QTestState *s variable
   that gcc warns about but clang does not
---
 tests/qtest/cmsdk-apb-timer-test.c | 75 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 tests/qtest/meson.build            |  1 +
 3 files changed, 77 insertions(+)
 create mode 100644 tests/qtest/cmsdk-apb-timer-test.c

diff --git a/tests/qtest/cmsdk-apb-timer-test.c b/tests/qtest/cmsdk-apb-timer-test.c
new file mode 100644
index 00000000000..e85e1f7448e
--- /dev/null
+++ b/tests/qtest/cmsdk-apb-timer-test.c
@@ -0,0 +1,75 @@
+/*
+ * QTest testcase for the CMSDK APB timer device
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
+/* IoTKit/ARMSSE-200 timer0; driven at 25MHz in mps2-an385, so 40ns per tick */
+#define TIMER_BASE 0x40000000
+
+#define CTRL 0
+#define VALUE 4
+#define RELOAD 8
+#define INTSTATUS 0xc
+
+static void test_timer(void)
+{
+    g_assert_true(readl(TIMER_BASE + INTSTATUS) == 0);
+
+    /* Start timer: will fire after 40 * 1000 == 40000 ns */
+    writel(TIMER_BASE + RELOAD, 1000);
+    writel(TIMER_BASE + CTRL, 9);
+
+    /* Step to just past the 500th tick and check VALUE */
+    clock_step(40 * 500 + 1);
+    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + VALUE), ==, 500);
+
+    /* Just past the 1000th tick: timer should have fired */
+    clock_step(40 * 500);
+    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + VALUE), ==, 0);
+
+    /* VALUE reloads at the following tick */
+    clock_step(40);
+    g_assert_cmpuint(readl(TIMER_BASE + VALUE), ==, 1000);
+
+    /* Check write-1-to-clear behaviour of INTSTATUS */
+    writel(TIMER_BASE + INTSTATUS, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 1);
+    writel(TIMER_BASE + INTSTATUS, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 0);
+
+    /* Turn off the timer */
+    writel(TIMER_BASE + CTRL, 0);
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
+    qtest_add_func("/cmsdk-apb-timer/timer", test_timer);
+
+    r = g_test_run();
+
+    qtest_end();
+
+    return r;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 34359a99b8e..6c15f7db317 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -581,6 +581,7 @@ F: include/hw/rtc/pl031.h
 F: include/hw/arm/primecell.h
 F: hw/timer/cmsdk-apb-timer.c
 F: include/hw/timer/cmsdk-apb-timer.h
+F: tests/qtest/cmsdk-apb-timer-test.c
 F: hw/timer/cmsdk-apb-dualtimer.c
 F: include/hw/timer/cmsdk-apb-dualtimer.h
 F: hw/char/cmsdk-apb-uart.c
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 16d04625b8b..74addd74868 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -141,6 +141,7 @@ qtests_npcm7xx = \
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test']
 qtests_arm = \
+  (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   ['arm-cpu-features',
-- 
2.20.1

