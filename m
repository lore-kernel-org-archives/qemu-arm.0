Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp158852lfb;
        Thu, 21 Jan 2021 11:07:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpZxlMyAOPkDi0Wm9qqWZDi4OU3pzcbhdn8LHO7P1tC862WrxMEYXapFx8WduHFMnJOXZx
X-Received: by 2002:a25:d704:: with SMTP id o4mr1159002ybg.151.1611256037757;
        Thu, 21 Jan 2021 11:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611256037; cv=none;
        d=google.com; s=arc-20160816;
        b=XEVIFMOB+BiD9f2STR6pvYOfRRru1fstWSpvz/Y9DZKgUEKUZjSDMXMDjFhSk+7/39
         3ziRRQd+n2GDNdmt8siflVcFnaUxaa5sZNVHcZopwTOmEnnxnW4LbOmJOZ7AAhJbQWsM
         /FbM4M/iwBOiBetwjRpWPX3rNOJLfvm8Oegq/9wONIASXvNg+rUtB/2oohufYaYgNGK0
         VH2p79wCIRetRKEHh0RMV5sek8tJJ8S5HQDTBeMlU62tmv6tVyNTtjT/qmndGaZccKY0
         k+VECJKhVle7A2uZygdqDNc0Lmtiq1ni1CM8jaL9kh6mJ/iJoehEDIiDhQnr/IGCuX9o
         wytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lAXftL8tozQWWTPvWf+4JDafcrxm0XnUCLn5NpEaPkY=;
        b=j4hNT8oanQ85ACRnXA8cxw8EdHk3a9HtfGWO5HWpAqYP16oRwS1qYb1W+gGpFyksfL
         FP+qIIZsD7diz+PemMzNYiBSQ//XTwS95hujbXwsiUk5hZIRCcjQ72HAPrA1ZzYM33i5
         FlwSGh6hmVpqxXfxoh/FGF26Wm+lN9Sd2X6ffifK+vIGJtVW9lW8d/BwWvfIOAvJ0oMW
         i689upJGxMT1AfzAWy6fok2kkzzbWb9UE7nRE6IREzvoC0WxfGDMyq5AUpSjUOBj036u
         uK8nAFqMTYp4omXd8hFa1Bf9YhmnigdpCWaK/PlV76Yc700M5nzKHKpq/7LYoNoYnJ+e
         1fZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pCE1bNoz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si5506976ybk.9.2021.01.21.11.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 11:07:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pCE1bNoz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2fIb-0002DV-0p
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 14:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI1-0002Aj-VL
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:41 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHr-0005lc-TA
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:41 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d16so2144579wro.11
 for <qemu-arm@nongnu.org>; Thu, 21 Jan 2021 11:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lAXftL8tozQWWTPvWf+4JDafcrxm0XnUCLn5NpEaPkY=;
 b=pCE1bNozYjUvvwp5pd2YvLY+xKm67VBFoeN3W0PYb1xbEwS/n7ofQalSvv3g/RpH9j
 nUSk2+2FQLNxZhgc4ZKLSDABf0La9RaNZ8iKF3b05jEfzA4cEr4Cbl577AoNocaQ9wav
 MqNYDAOoIo3K7gni2kjWiaYbUFUdqT0XX98vhGHNvkrLvJTLBeF85QQyPuBY8jCFuZZg
 R7OovvRgxe3haCiRmFBCJg+n+x4yYgO8Qae67mXGKcYzqMjVDweWDTmyFt5LeuWIp1N0
 V5vJZVUmGH/l98hfMa+l4IMcJsAOgshNzImGF7NG+ygo6vL9asgv75/XkfMElWoF04h5
 H1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lAXftL8tozQWWTPvWf+4JDafcrxm0XnUCLn5NpEaPkY=;
 b=Aw3Xv0Q7rFXZeDfgueFGwwgguW23NVTUKEZgzU2Q/SOoJPFbDDdzxtYqocAweUFfJ3
 NgVKoT3cQfJoXzVpGnLdIhX6VBNdeJvYoS7wGG+NzCNumcoRBESuBbL7NSRtVnyPJjGs
 nzABAPrOnRGg3ZFsxFqaeucNfUA8VZs0wBwqpANHkqTkcBCnzZMO/OBFSagGlvstjooE
 fVFhwg5byHIuOjAvmF+Q0yryEmqFzLsTy7mf27EvswV0oobZFc+/ZyP+oDoXZoq1Evdb
 Sm1jxLv6QTHSV8e37oGBUDIuG8iZaEVGkCGQjWtpkedtpaHRDNs8r6MYaOyiMiTHV76O
 +tyQ==
X-Gm-Message-State: AOAM5301K137lFd9xm98hYbneTTaAg6qzLMHM/pbjVbSA/Z6UbM9EKEX
 9T3QNmLeEjSvMDtvQV5wjP3aC1BVcTcXCQ==
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr912237wrn.208.1611255988353; 
 Thu, 21 Jan 2021 11:06:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/25] tests: Add a simple test of the CMSDK APB timer
Date: Thu, 21 Jan 2021 19:06:00 +0000
Message-Id: <20210121190622.22000-4-peter.maydell@linaro.org>
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
X-TUID: pxmNh2VMVxEM

Add a simple test of the CMSDK APB timer, since we're about to do
some refactoring of how it is clocked.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/cmsdk-apb-timer-test.c | 76 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 tests/qtest/meson.build            |  1 +
 3 files changed, 78 insertions(+)
 create mode 100644 tests/qtest/cmsdk-apb-timer-test.c

diff --git a/tests/qtest/cmsdk-apb-timer-test.c b/tests/qtest/cmsdk-apb-timer-test.c
new file mode 100644
index 00000000000..085005cce99
--- /dev/null
+++ b/tests/qtest/cmsdk-apb-timer-test.c
@@ -0,0 +1,76 @@
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
+    /* Start timer: will fire after 40000 ns */
+    writel(TIMER_BASE + RELOAD, 1000);
+    writel(TIMER_BASE + CTRL, 9);
+
+    /* Step to just past the 500th tick and check VALUE */
+    clock_step(20001);
+    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + VALUE), ==, 500);
+
+    /* Just past the 1000th tick: timer should have fired */
+    clock_step(20000);
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
+    QTestState *s;
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    s = qtest_start("-machine mps2-an385");
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
index 3216387521d..010405b0884 100644
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

