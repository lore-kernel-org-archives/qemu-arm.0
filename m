Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp978392njg;
        Wed, 18 Sep 2024 12:24:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgYyku6fGgdwyyfzNqkNjpZy/eI6eHa4r1tFa1paPih7smpQgVzdWo70s9gJbMV+7E363GWhRs4jdOuA==@linaro.org
X-Google-Smtp-Source: AGHT+IF21Jqk2EhEwDC2xwZjYr/ybTPd/F8qastHzq2HnGQsxvZ/B7PZJha/lztEafdgqH25rkzG
X-Received: by 2002:a05:6830:710a:b0:710:fe4b:521c with SMTP id 46e09a7af769-71109470390mr17803308a34.10.1726687481037;
        Wed, 18 Sep 2024 12:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687481; cv=none;
        d=google.com; s=arc-20240605;
        b=eZA5jHfGYxIY3BnttvXeI8JLSiOiAqXjUImjW0ck/jFeNJE8jX4aJM2WPZk+rOaSQL
         Nf6P4gFawxg06/XQvWUDMeoHiR6thsXkzTruaBBM5SoMvnealtiD7WEG0aT2s0NfBrFb
         /3ZpDUsoPUaIivCEaxUlVtKpzyouf+Eg9Wn8DlqVf88KFVbuERx7hjt9vyDDx3jjFW0i
         0+LtDT3dhRUaNOb7ergi6bLd9HxRtGDuX7rVQ11FGbrBv/w67mlXJPpNcG7lCk8uQeas
         XJZO5vJJFklt8TfEBQM/5JdBkuxWbAOfS0pfreSfTFkdedWkhjSrtn82geyfwLe5sXVx
         3UWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=Gdr/8f8sshXupQWm/G/RvTijKtdDW7RFn/Icv2CMyog=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=ivbOPtZeUJ3HcmcmXQxX5Zf28v19RhEJKWdNLuCq7FepL1t2GWx5EmEGDw56s6DBqe
         xUaseEHPbwYrbzC8Sf574ObvnwiCrKHEthaK8xaFocajH7oYv3WJV9Zk6IiVp5gftwZt
         f1Mik1HzKMHtPmAUH53jpH63rjRfdurpWsrQsYWwX59TIP9ipxzIAnpPfdlegNy6v52O
         2zUA9TCbeTKfJdbhPXkAZUrcQJ4a6MadPjCQP6hbCx+Wv65I2JHUpuGolMGRERgCcgqE
         /1xpIctFPC+3lqdanTfVp9Ohp9URz9qQr9+0g+CNLCVvUw+h6pu/7A5AR9uJV9esDRGn
         ZhyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=24MRqNA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b1792f185si907031cf.582.2024.09.18.12.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=24MRqNA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr0HE-0006cs-40; Wed, 18 Sep 2024 15:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vyjrZgUKCPovcxkriqqing.eqosgow-ctopqpipw.qti@flex--tavip.bounces.google.com>)
 id 1sr0HC-0006Wu-R0
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:46 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vyjrZgUKCPovcxkriqqing.eqosgow-ctopqpipw.qti@flex--tavip.bounces.google.com>)
 id 1sr0HA-0007Ro-Ic
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:46 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6ddd980af81so877607b3.2
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687423; x=1727292223; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gdr/8f8sshXupQWm/G/RvTijKtdDW7RFn/Icv2CMyog=;
 b=24MRqNA7KH7YpXj3ihxAdmlq3fGOqoh7L0hScpm4tN5bP1qKrU8DqAPAzMC2cdgJEt
 yteiQbXPVICs3N0kZlr356xew+7oDSz8ISg+lQUzmRVz3p2ca8q5aBMufCEkRwc+sG25
 TiGVg5wdaVktFEngXVsqjYFWaQoKrYm8MVQyQDqk04IFWePGKVv09DZe1lZCmTSl2wgl
 bn+N+F4dqvPQb8YvRdtMXfKx6/Uf/hqAIYkUXeJ8vPIa0jpnQR+TTs1Qn9TNnEZmwvcB
 RT8DzAbdBKyrxjxxU9GIRJVZ4GodvI4qa9YdCyETutbPZ3oyDdrYu8Rx/rthAgJsO+jQ
 H1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687423; x=1727292223;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gdr/8f8sshXupQWm/G/RvTijKtdDW7RFn/Icv2CMyog=;
 b=L5l/ou7mpWttEV4nyV63nx4/kshNHrA7Dw4pvFdQEWO2sTkxj1ztpJgG0ytAhqy2/n
 uCbeKUTfnY/eS32FHRx1f3Li5cIXy0TxmEqFeIqQHVrzoJnDsne5CrAvgo8Wbd8456R6
 58Y/09/JssLkCqMZXx08gAwd1LSAeSipYXSlLnDRY42zlJm4H8DazXDuqZUzVfATgeCy
 uNqRXKwlG6GLSJ2McR6hu+J9YeNiprJAt4j+jamigWQ2FGHAWv7cDqV70+qMRlxLmozn
 PFsD6JMzP6xq9aWajvnZ13B/ks9eQmVu20VUJPb6ZmlJT6c3AZzjSG8u8XZAOrFJXzs5
 tfog==
X-Gm-Message-State: AOJu0Yyq+xQ4EyAyddMJGCh3GWQuu7dFtU6mlY8aNYcqMzLEGdt0E34e
 CpcaYYSbaCpXoEvgxMyr3JQf7D3VKK20wkSF8UfMEmsKPlDaP9O05VAWx5TA4RvAvDNQUI1OZw=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a81:b302:0:b0:6dd:b9bb:360a with
 SMTP id
 00721157ae682-6ddb9bb38e2mr4274857b3.1.1726687423152; Wed, 18 Sep 2024
 12:23:43 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:53 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-26-tavip@google.com>
Subject: [PATCH 25/25] tests/qtest: add tests for RT500's clock controller
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3vyjrZgUKCPovcxkriqqing.eqosgow-ctopqpipw.qti@flex--tavip.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nClRKPpnkvAj

Add test to exercise clocks set and clear, system PLL initialization,
audio PLL initialization, systick and ostimer clock source selection.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/qtest/rt500-clkctl-test.c | 195 ++++++++++++++++++++++++++++++++
 tests/qtest/meson.build         |   1 +
 2 files changed, 196 insertions(+)
 create mode 100644 tests/qtest/rt500-clkctl-test.c

diff --git a/tests/qtest/rt500-clkctl-test.c b/tests/qtest/rt500-clkctl-test.c
new file mode 100644
index 0000000000..d5b83d81da
--- /dev/null
+++ b/tests/qtest/rt500-clkctl-test.c
@@ -0,0 +1,195 @@
+/*
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "exec/memory.h"
+#include "hw/clock.h"
+#include "hw/irq.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+
+#include "hw/misc/rt500_clkctl0.h"
+#include "hw/misc/rt500_clkctl1.h"
+#include "hw/misc/rt500_clk_freqs.h"
+#include "hw/arm/svd/rt500.h"
+#include "reg-utils.h"
+
+#define SYSCLK_HZ 200000000
+#define CLKCTL0_NAME "/machine/soc/clkctl0"
+#define CLKCTL1_NAME "/machine/soc/clkctl1"
+
+static void pscctl_test(gconstpointer user_data)
+{
+    /* rom controller clock should be enabled at reset */
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, PSCCTL0, ROM_CTRLR_CLK) == 1);
+
+    /* DSP clk is disabled at reset */
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, PSCCTL0, DSP_CLK) == 0);
+
+    /* check PSCTL_SET functionality */
+    REG32_WRITE_FIELD_NOUPDATE(RT500_CLKCTL0, PSCCTL0_SET, DSP_CLK, 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, PSCCTL0, DSP_CLK) == 1);
+
+    /* check PSCTL_CLR functionality */
+    REG32_WRITE_FIELD_NOUPDATE(RT500_CLKCTL0, PSCCTL0_CLR, DSP_CLK, 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, PSCCTL0, DSP_CLK) == 0);
+
+    /* FLEXIO clk is disabled at reset */
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, PSCCTL0, FlexIO) == 0);
+
+    /* check PSCTL_SET functionality */
+    REG32_WRITE_FIELD_NOUPDATE(RT500_CLKCTL1, PSCCTL0_SET, FlexIO, 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, PSCCTL0, FlexIO) == 1);
+
+    /* check PSCTL_CLR functionality */
+    REG32_WRITE_FIELD_NOUPDATE(RT500_CLKCTL1, PSCCTL0_CLR, FlexIO, 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, PSCCTL0, FlexIO) == 0);
+}
+
+static void audiopll0pfd_test(gconstpointer user_data)
+{
+    /*  audio plls are gated at boot */
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD3_CLKGATE) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD2_CLKGATE) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD1_CLKGATE) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD0_CLKGATE) == 1);
+
+    /*  ,,, and clocks are not ready */
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD3_CLKRDY) == 0);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD2_CLKRDY) == 0);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD1_CLKRDY) == 0);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD0_CLKRDY) == 0);
+
+    /* ungate all plls and check that clocks are ready */
+    REG32_WRITE_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD3_CLKGATE, 0);
+    REG32_WRITE_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD2_CLKGATE, 0);
+    REG32_WRITE_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD1_CLKGATE, 0);
+    REG32_WRITE_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD0_CLKGATE, 0);
+
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD3_CLKRDY) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD2_CLKRDY) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD1_CLKRDY) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL1, AUDIOPLL0PFD, PFD0_CLKRDY) == 1);
+}
+
+static void syspll0pfd_test(gconstpointer user_data)
+{
+    /*  system plls are gated at boot */
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD3_CLKGATE) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD2_CLKGATE) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD1_CLKGATE) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD0_CLKGATE) == 1);
+
+    /*  ,,, and clocks are not ready */
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD3_CLKRDY) == 0);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD2_CLKRDY) == 0);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD1_CLKRDY) == 0);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD0_CLKRDY) == 0);
+
+    /* ungate all plls and check that clocks are ready */
+    REG32_WRITE_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD3_CLKGATE, 0);
+    REG32_WRITE_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD2_CLKGATE, 0);
+    REG32_WRITE_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD1_CLKGATE, 0);
+    REG32_WRITE_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD0_CLKGATE, 0);
+
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD3_CLKRDY) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD2_CLKRDY) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD1_CLKRDY) == 1);
+    g_assert(REG32_READ_FIELD(RT500_CLKCTL0, SYSPLL0PFD, PFD0_CLKRDY) == 1);
+}
+
+static void systick_clk_test(gconstpointer user_data)
+{
+    /* systick is not running at reset */
+    g_assert_cmpuint(dev_clock_out_get_hz(CLKCTL0_NAME, "systick_clk"), ==, 0);
+
+    /* select divout no divisor */
+    REG32_WRITE_FIELD(RT500_CLKCTL0, SYSTICKFCLKSEL, SEL,
+                      SYSTICKFCLKSEL_DIVOUT);
+    g_assert_cmpuint(dev_clock_out_get_hz(CLKCTL0_NAME, "systick_clk"),
+                     ==, SYSCLK_HZ);
+
+    /* change divisor to 2 */
+    REG32_WRITE_FIELD(RT500_CLKCTL0, SYSTICKFCLKDIV, DIV, 1);
+    g_assert_cmpuint(dev_clock_out_get_hz(CLKCTL0_NAME, "systick_clk"),
+                     ==, SYSCLK_HZ / 2);
+
+    /* select lpsoc */
+    REG32_WRITE_FIELD(RT500_CLKCTL0, SYSTICKFCLKSEL, SEL,
+                      SYSTICKFCLKSEL_LPOSC);
+    g_assert_cmpuint(dev_clock_out_get_hz(CLKCTL0_NAME, "systick_clk"),
+                     ==, LPOSC_CLK_HZ);
+
+    /* select lpsoc */
+    REG32_WRITE_FIELD(RT500_CLKCTL0, SYSTICKFCLKSEL, SEL,
+                      SYSTICKFCLKSEL_32KHZRTC);
+    g_assert_cmpuint(dev_clock_out_get_hz(CLKCTL0_NAME, "systick_clk"),
+                     ==, RTC32KHZ_CLK_HZ);
+
+    /* disable clock */
+    REG32_WRITE_FIELD(RT500_CLKCTL0, SYSTICKFCLKSEL, SEL,
+                      SYSTICKFCLKSEL_NONE);
+    g_assert_cmpuint(dev_clock_out_get_hz(CLKCTL0_NAME, "systick_clk"),
+                     ==, 0);
+}
+
+static void ostimer_clk_test(gconstpointer user_data)
+{
+    /* systick is not running at reset */
+    g_assert_cmpuint(dev_clock_out_get_hz(CLKCTL1_NAME, "ostimer_clk"), ==, 0);
+
+    /* select lpsoc */
+    REG32_WRITE_FIELD(RT500_CLKCTL1, OSEVENTTFCLKSEL, SEL,
+                      OSEVENTTFCLKSEL_LPOSC);
+    g_assert_cmpuint(dev_clock_out_get_hz(CLKCTL1_NAME, "ostimer_clk"), ==,
+                     LPOSC_CLK_HZ);
+
+    /* select 32khz RTC */
+    REG32_WRITE_FIELD(RT500_CLKCTL1, OSEVENTTFCLKSEL, SEL,
+                      OSEVENTTFCLKSEL_32KHZRTC);
+    g_assert_cmpuint(dev_clock_out_get_hz(CLKCTL1_NAME, "ostimer_clk"), ==,
+                     RTC32KHZ_CLK_HZ);
+
+    /* select hclk */
+    REG32_WRITE_FIELD(RT500_CLKCTL1, OSEVENTTFCLKSEL, SEL,
+                      OSEVENTTFCLKSEL_HCLK);
+    g_assert_cmpuint(dev_clock_out_get_hz(CLKCTL1_NAME, "ostimer_clk"), ==,
+                     SYSCLK_HZ);
+
+    /* disable clock */
+    REG32_WRITE_FIELD(RT500_CLKCTL1, OSEVENTTFCLKSEL, SEL,
+                      OSEVENTTFCLKSEL_NONE);
+    g_assert_cmpuint(dev_clock_out_get_hz(CLKCTL1_NAME, "ostimer_clk"), ==, 0);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_data_func("/rt500-clkctl/pscctl-test", NULL, pscctl_test);
+    qtest_add_data_func("/rt500-clkctl/syspll0pfd-test", NULL,
+                        syspll0pfd_test);
+    qtest_add_data_func("/rt500-clkctl/audiopll0pfd-test", NULL,
+                        audiopll0pfd_test);
+    g_test_add_data_func("/rt500-clkctl/systick-test", NULL,
+                         systick_clk_test);
+    g_test_add_data_func("/rt500-clkctl/ostimer-clk-test", NULL,
+                         ostimer_clk_test);
+
+    qtest_start("-M rt595-evk");
+    ret = g_test_run();
+    qtest_end();
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 2cb0fa08c0..101f6889f6 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -232,6 +232,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
   (config_all_devices.has_key('CONFIG_FLEXCOMM') ? ['flexcomm-test', 'flexcomm-usart-test', 'flexcomm-i2c-test', 'flexcomm-spi-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_RT500_CLKCTL') ? ['rt500-clkctl-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
-- 
2.46.0.662.g92d0881bb0-goog

