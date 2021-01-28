Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp144755lfo;
        Thu, 28 Jan 2021 03:42:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrb43Rg3amZ2R0hFCL4ykh6u7Cy55K6PnEFD+yZwTfYroamDC48eSg5O2Dh7MpLZf3uUMN
X-Received: by 2002:a05:6902:706:: with SMTP id k6mr23675879ybt.87.1611834179791;
        Thu, 28 Jan 2021 03:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834179; cv=none;
        d=google.com; s=arc-20160816;
        b=Yl7WKra6creoqJYhuu8mP9HOBa1PULtl72bE3RU0PrN00F3wUjLfX+qCqNVN/audcB
         ztjk+6ckDjh6Hy8ZuR/zjdxeCSrmpjdHslYP4jQ9RP8puMC9AIih8H4AKeMfAe2gAUjt
         942U14qEt+DOc8/HSesh9WZirzIprw+mAJlu/Su2G4ih52qaXhJD41ygzcccZr2poqkJ
         l//gNnekWTMFQWJnb+8WQyOC5/+Zd4uu77AwN0Idnzq1RxrVGuaNZ7CnfLHy/L73OQyL
         fWQph1ZhPS49x0SXzORkjLZH5ym3zf9gbiNtNFTX0eEnuUMEprvb7bDB0FihedNIZHfr
         u6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xHWq9yH9LoFSUmKAgq76pgTL0JY1lWeKpFcupzRjAI4=;
        b=S+0recs4+a+vTYkZbeUOThhfpIMx0rIBhTUnT9OLVpNymSqf1tc26/ihS+WwXsutLT
         1cwvNf7e4zqN76N0N2N5Etpu4JJZ+Eg9WviALr6mEsa9U64outDIOIlsvq20pOJD40F8
         WDJHdjITHeXYEXB09cE+eFRR+hR6UxoVcXxSCTUkoVSUun2H2t2L9cqhhS1LlEuCsiW6
         NSJUlq9DaS39GWovjPIhchkRFqgG+Z0km4d/YbyW0vL3vpZMliAq1VPtYpcA0v8jCIDw
         rdGz7n7GcMhPgO0woCyik4NArDJokFGZB1iYc0Gyc0/kpsw9NnIIaohR9RIJvvyYZ4MG
         jzoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wW3X6Rlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si4634880ybq.348.2021.01.28.03.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:42:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wW3X6Rlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55hT-0002PK-2r
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gW-0001AU-AT
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:00 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gQ-00066M-VN
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:42:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c127so4295934wmf.5
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 03:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xHWq9yH9LoFSUmKAgq76pgTL0JY1lWeKpFcupzRjAI4=;
 b=wW3X6RlvpbSjFvjthZf79H4Yh4JODHixoCCBdBDNa00vko+4W9xDc/ct9G3eV4ffwE
 293ioufXEOSj8uC1k/kWkK8xPW/OoCto7IoiT/tACM8/24NQDP636WajW5FSe2cWl82A
 1He1iPeqOFCirC0C2fn8x/Iy39BWTbfsymdZoCtz9reoEivCryCX/BqJN57EH2qhIZZT
 Z2GkS5yCRIqAJREUrPsEPmVoMhq23ztYURerHBK6eGOFYs5UeqsH2C44dNFZRfZ0QQwC
 uqQoV5GqoE7tjp19Tunj2PYLSq4eA9qCT4A6Ty7vXwdACUJjDcFaPPP5DSlaNe0hgx6c
 OguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xHWq9yH9LoFSUmKAgq76pgTL0JY1lWeKpFcupzRjAI4=;
 b=TfTvDX3Oyl0vSSdHRdV3VHqzh1+D7TTFKhqYIAhjpeNjVYCYVa/dtm03rRfxo/CoYg
 0FD+JkCrEUlaeLs89hfo9yVLiHKa1h4F2T8bwPJ8cJwaDXGHOpyPSTPrJjRFYtsRKg9E
 neyThzZV59jW/0UgLootAymXxMNk6A4cIztJf10uAlA2sqzVB8shF4S0pEkIMnTc+GNf
 SXkkecYAtaPF0STJxRRlMQNLV1WumUx+Kz/+0ErYj50PaohXSwZBdhlBmS727SXCpU4w
 cIOeP/+kQ3fJmIeXhIDu3M/3TKiehdRnmV55RjFXQDq71JYEH48RonnyX5xWN1i+BsTo
 N3bA==
X-Gm-Message-State: AOAM5314euLVoPREGJe9ys2ipXvOZKDY2zc0UBQSMHFKLbuDdR6oOwWa
 WMuKVij4TcNUeaFGN17p30xN0VWRZX6HPQ==
X-Received: by 2002:a1c:e1d4:: with SMTP id y203mr8375856wmg.50.1611834112248; 
 Thu, 28 Jan 2021 03:41:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/25] tests: Add a simple test of the CMSDK APB watchdog
Date: Thu, 28 Jan 2021 11:41:24 +0000
Message-Id: <20210128114145.20536-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: 4SBQy8wmFCOr

Add a simple test of the CMSDK watchdog, since we're about to do some
refactoring of how it is clocked.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-5-peter.maydell@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v1->v2 changes:
 - remove set-but-not-used QTestState *s variable
---
 tests/qtest/cmsdk-apb-watchdog-test.c | 79 +++++++++++++++++++++++++++
 MAINTAINERS                           |  1 +
 tests/qtest/meson.build               |  1 +
 3 files changed, 81 insertions(+)
 create mode 100644 tests/qtest/cmsdk-apb-watchdog-test.c

diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-apb-watchdog-test.c
new file mode 100644
index 00000000000..950f64c527b
--- /dev/null
+++ b/tests/qtest/cmsdk-apb-watchdog-test.c
@@ -0,0 +1,79 @@
+/*
+ * QTest testcase for the CMSDK APB watchdog device
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
+/*
+ * lm3s811evb watchdog; at board startup this runs at 200MHz / 16 == 12.5MHz,
+ * which is 80ns per tick.
+ */
+#define WDOG_BASE 0x40000000
+
+#define WDOGLOAD 0
+#define WDOGVALUE 4
+#define WDOGCONTROL 8
+#define WDOGINTCLR 0xc
+#define WDOGRIS 0x10
+#define WDOGMIS 0x14
+#define WDOGLOCK 0xc00
+
+static void test_watchdog(void)
+{
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+
+    writel(WDOG_BASE + WDOGCONTROL, 1);
+    writel(WDOG_BASE + WDOGLOAD, 1000);
+
+    /* Step to just past the 500th tick */
+    clock_step(500 * 80 + 1);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
+
+    /* Just past the 1000th tick: timer should have fired */
+    clock_step(500 * 80);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 0);
+
+    /* VALUE reloads at following tick */
+    clock_step(80);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
+
+    /* Writing any value to WDOGINTCLR clears the interrupt and reloads */
+    clock_step(500 * 80);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
+    writel(WDOG_BASE + WDOGINTCLR, 0);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+}
+
+int main(int argc, char **argv)
+{
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_start("-machine lm3s811evb");
+
+    qtest_add_func("/cmsdk-apb-watchdog/watchdog", test_watchdog);
+
+    r = g_test_run();
+
+    qtest_end();
+
+    return r;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 6c15f7db317..3729b89f359 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -588,6 +588,7 @@ F: hw/char/cmsdk-apb-uart.c
 F: include/hw/char/cmsdk-apb-uart.h
 F: hw/watchdog/cmsdk-apb-watchdog.c
 F: include/hw/watchdog/cmsdk-apb-watchdog.h
+F: tests/qtest/cmsdk-apb-watchdog-test.c
 F: hw/misc/tz-ppc.c
 F: include/hw/misc/tz-ppc.h
 F: hw/misc/tz-mpc.c
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 74addd74868..9e2ebc47041 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -142,6 +142,7 @@ qtests_npcm7xx = \
    'npcm7xx_watchdog_timer-test']
 qtests_arm = \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   ['arm-cpu-features',
-- 
2.20.1

