Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp19805nji;
        Mon, 26 Aug 2024 23:49:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBxxOROPLRcluWJFdFS2RLfzxoDy3rlziRO/KTcOBWorh1kl8fs73K7cUcRf5NsdiOxFe4iF2Wdvi21Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFWkq+PAtFgFmJOjgGJnxeq94llbqopRfSpSp3RbqcAtoYcUhI9Y4awfqRcZS4FvbdCUVW1
X-Received: by 2002:a05:622a:5508:b0:44f:e0cb:e0a6 with SMTP id d75a77b69052e-45660b7e82amr17735271cf.60.1724741345009;
        Mon, 26 Aug 2024 23:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724741344; cv=none;
        d=google.com; s=arc-20160816;
        b=vwxxjSDURxFUoi3F0aiGbARsZ45GN92V7OsLKQRtc1JsIIQ9LITJmw1JfCWeA38+E8
         RyIKswyJGSE+b0Y00PQ1LqArFXEt59kELGEUc+sVSP775x+ek1d9NwxPje1FtT4uXQFs
         H5o5ih7rnC1mXNA6Um6NVCF4zfgQQbaHrWvcy0t2Yf1s/Hf8HRU97dkInCYtGzQsQhBy
         8savMhdnpUedGgGKIgtHIfRdml3XtT4aTMTTZbqA1wHewiOmGXpYqTj61B20I6kkr1PJ
         mNKU3DkOX6yww+O3wH2oHqyQ/lGnuGJYq9AhVI6wJzCjOidjxe0zIdo9CJn9g/23iYfl
         jQRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=6qO6zLPohZodNb04jrZ6wG/pA69IrS5+a5uspGY/fKg=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=sWO1vWW5hn85K6QnWDIPIiCOF7Co13bmzYvEZyJIn5ReDb8wFbH0ANkV2dBXQxmqPN
         LjESKwYSgoTRPXzxyDqrUTTqkIA6dPsAzslKz4XPXl5nCqMbtfCdO+r+tnnldyZ1RZbM
         tViCs+cwz/3YWEhp4p7ivczH9ncg0IiIMr/wCvwPdtEu7cQh5gpIqSdYF4ZNkkLw0E+K
         iJLv+xAYPPi6LBCi/81V7gon962+/2XgwugfvjKWuHn3t68wpWBmgZ+2MyPBmXdcxu60
         cY62OAk//wccJBrVnDegYKO1CvIMY7FIVfaTj67Uz1hm1rpLSuI/ort+Gm9lhqSNZ/9t
         hc4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Mf2OFqhY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe328175si133132891cf.693.2024.08.26.23.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 23:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Mf2OFqhY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sipyU-0005CT-GU; Tue, 27 Aug 2024 02:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3N3bNZgUKCJYJ0L8F6EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--tavip.bounces.google.com>)
 id 1sipyN-0004cM-AS
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 02:46:35 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3N3bNZgUKCJYJ0L8F6EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--tavip.bounces.google.com>)
 id 1sipyH-0006CX-SI
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 02:46:34 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-6c8f99fef10so5205419a12.3
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 23:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724741176; x=1725345976; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6qO6zLPohZodNb04jrZ6wG/pA69IrS5+a5uspGY/fKg=;
 b=Mf2OFqhYO3K8LJOP3tE6RLKBYWROh1orhn5XF7Gd/7KHRU0YqBFQv8gvtiTRn2yD6L
 zGxrJpxmDCRbTv1JScSFF00cyNHni55FpTlEivWYJzrvU+SYxhnDeg3Qhw3D5kblHREv
 zVqU83c4I9y2WjbAjBp+th4/WQP9Og5Zm0UGD+dwFwOAkX7aHjHqi/ROnOS83Gir6NIP
 STU7+TwVLY5W9bAoDQx+7Ydrhs6znGxveK3zOMCq34xmb5Eu8jrIC52xAcdqFItpy3nK
 7AQVmMwyTp7R/HEWjjW4vHP1nHrxzihPSa0FI1ojvW3znSzZTKVSEl8EHUF9tHwpVR5k
 XY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724741176; x=1725345976;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6qO6zLPohZodNb04jrZ6wG/pA69IrS5+a5uspGY/fKg=;
 b=QhNrYXTxZCGxVFbsd/kQzH2pTfnRznNe1hxSDlaKpxwD4Dk9d4JDHMKYf/4ETcfZF6
 71UrZGlOFwkjXEqWtciPdJ3cclZKUlU9j+BoXnCG4KsptEeS20lW9eEgU7ruaL8jTRpo
 XZshj6lx6mD7CmBr0OAXXBwTtt67TnOMp2hIjQKjhWXU/T2HOWQdu/c1uIVTDMKz5q7r
 2nfQ4O2BxYYTa4RjFQCAb7ia6wK01I4fJgpFstc9bX8MZbspcl7H4KgLEHQYOKra4+vH
 JNmP3F8OYiVnWCXV0FxekeDCumpigMPc6RwhP+BdACWkFssHR4DDFkZoUm7EyYO99ske
 U/tA==
X-Gm-Message-State: AOJu0YxWBZxJqvKxRxj4U/S8FK+HIRf6ac8A6YhXOD2NBfC3LSyQsVLE
 Y18wKHKbC56qLL35XftzL4yLv42St04rCNPNQmpiUAV+n6UkmLl7e3HUl662P2YvIjfoUdZ6UQ=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:90b:4f45:b0:2d3:da96:755f
 with SMTP id
 98e67ed59e1d1-2d646cd8d12mr85493a91.3.1724741175753; Mon, 26 Aug 2024
 23:46:15 -0700 (PDT)
Date: Mon, 26 Aug 2024 23:45:28 -0700
In-Reply-To: <20240827064529.1246786-1-tavip@google.com>
Mime-Version: 1.0
References: <20240827064529.1246786-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240827064529.1246786-25-tavip@google.com>
Subject: [RFC PATCH v3 24/24] test/unit: add unit tests for RT500's clock
 controller
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3N3bNZgUKCJYJ0L8F6EE6B4.2ECG4CK-0HCDED6DK.EH6@flex--tavip.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: LGYMlyLQXzdc

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
index 7df88edeab..fa463251d6 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -230,6 +230,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
   (config_all_devices.has_key('CONFIG_FLEXCOMM') ? ['flexcomm-test', 'flexcomm-usart-test', 'flexcomm-i2c-test', 'flexcomm-spi-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_RT500_CLKCTL') ? ['rt500-clkctl-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
-- 
2.46.0.295.g3b9ea8a38a-goog

