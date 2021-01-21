Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp158834lfb;
        Thu, 21 Jan 2021 11:07:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZtGfKFuO+zw1TNS70R3/CC4vGmam1o61IV3mSk/a4Z6o8FlTuAdMkeGPonolio1Gr0eKW
X-Received: by 2002:a25:3249:: with SMTP id y70mr1080487yby.281.1611256036595;
        Thu, 21 Jan 2021 11:07:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611256036; cv=none;
        d=google.com; s=arc-20160816;
        b=h4Ywml7Y1xF4Z3FM6VeEuIhFIesRRg4eoUzgMOdZk5kK1iEY0jV8GpIDPLoTIZkbWx
         gW0J/Buw+A2W/WnNhIJngqClKB9FVW0yVbNu1XTX9dM6UY75feEm6bMSUTsYVcHTed5I
         6dykpfHkvq+6eBcK3qhfVCylQNtEDDOV/L2uUwt8424V2/VUmrEjQb82sO9PmHr0tDN8
         BMDpoZc3KjllWp3bdxgOzqD6LCeIBXGewgSs2msI81t95JL7h0fQvc1i94Fm5U/2O019
         VseowuCfmjTg4Yd3wb/EFDR0mfoMJ++3tKUenFWFOQKngXtSMUQLR5zXjsu9vA1zgprP
         vVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TB7wjfajbIvKGvglJefMlToUTk7cmyyxw+srKxsN0iM=;
        b=aOeVs1vfDkQVLUDfAbLKcjZTIdZJuI+4K1AofLhGSk1zjWhFMIeTFrkpIzxGuw5UqC
         EevzMwlYUPnFQB+VE7TceRLxJAjNK08nXzzW0W7ccQVzzWwugKKzaxCYrJHBzd/XpF42
         n0ugzQ5rxdX4KkHw7e8mi7AL/d1JzEccoBPuLAkle7VPLEEGBH+kjzaUVNiT4eewVMiK
         5MwKdgFoqjLpzfB+plvbImnz1BAZ3PoUt5Ei2+8q5pBDp4LnWDhC0yxsjHsM300te+ha
         HaFtv0/LhsBaf/p/ieBC5U9me4AMtNKE+nFBO4qAoB4MFb6pAHS/lw7OvbaVIalFKl7a
         UswQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tG46E8L4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si5938874ybp.477.2021.01.21.11.07.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 11:07:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tG46E8L4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2fIZ-0002Ao-QI
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 14:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHz-0002A1-SC
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:40 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHr-0005mm-Rt
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id q7so2797154wre.13
 for <qemu-arm@nongnu.org>; Thu, 21 Jan 2021 11:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TB7wjfajbIvKGvglJefMlToUTk7cmyyxw+srKxsN0iM=;
 b=tG46E8L4NhWAz79VmzTFQli25+44SF+SEEPyDCObVfykbsivI3dQzc+yyaK5dkpgpX
 1QiPeanvfPTyI1K0E5v57PSSIbxhvEwb09Z1aSTjnwIyhfhOYSCSb2QZDorfq3YsCjGw
 zojMo4+fQF88bx72fZMLfCJ+9OgGPBVJwjCT1jU9GOFum0yj0TNsz42oY7ghRM83+vvB
 yPpISmsPO2DF9aXpB4aUbOuIhvf6pH8m+UdtG2rSI+8uXeQs613FTTa0Xb96Unxnlm2o
 vOfr4yR3MNchPQiBeO8+tHil4nYEq4fjnCBIOCEL8ZzRW5agHddZ4UJBapIM0Jx0H5Xe
 UAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TB7wjfajbIvKGvglJefMlToUTk7cmyyxw+srKxsN0iM=;
 b=NQOolxsW+nUGTOxnX6wSqec17lVFvTGOsxn/nd99fs6kynvELmBakAFFfNfKqx39Sq
 VqJnF9WnjgIp1Nbi7idvrO/LhBkdIzT3bOhBCmKzzq6eq0+Gsxzjy4SycKwXyuAlZpfE
 YSYKpuQdNumekjn2YPxrSVSovvqqyS7NfhrhrlhshbACKBkWd8CQ2IoeflO6wWS6eJ/A
 NAdR7Kf/9Ccaiahx07s2Ot1ssZBs8lXMfOTSiUOcOLAOzvn0QL4PBYHBsmsP7Yc0vMMh
 GtUsNj4Eo6pW8lg1WrUN1sjfvu5cYBEhiKTIfCFKW7i1LLFydqPA2Bt4o4P6MaftWn4x
 MlgA==
X-Gm-Message-State: AOAM532/QKaabLOOS5XMyny5VJ+u3sFovxIZTxbG6Fkw+s0ovU6F4tgD
 8UuYfJB4HGC2hHIz9lojEG+FEwbjQk2QNQ==
X-Received: by 2002:adf:dc89:: with SMTP id r9mr932065wrj.52.1611255989324;
 Thu, 21 Jan 2021 11:06:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/25] tests: Add a simple test of the CMSDK APB watchdog
Date: Thu, 21 Jan 2021 19:06:01 +0000
Message-Id: <20210121190622.22000-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U+sJdeiKTDtb

Add a simple test of the CMSDK watchdog, since we're about to do some
refactoring of how it is clocked.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/cmsdk-apb-watchdog-test.c | 80 +++++++++++++++++++++++++++
 MAINTAINERS                           |  1 +
 tests/qtest/meson.build               |  1 +
 3 files changed, 82 insertions(+)
 create mode 100644 tests/qtest/cmsdk-apb-watchdog-test.c

diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-apb-watchdog-test.c
new file mode 100644
index 00000000000..c6add1fee85
--- /dev/null
+++ b/tests/qtest/cmsdk-apb-watchdog-test.c
@@ -0,0 +1,80 @@
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
+    QTestState *s;
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    s = qtest_start("-machine lm3s811evb");
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
index 010405b0884..58956497888 100644
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

