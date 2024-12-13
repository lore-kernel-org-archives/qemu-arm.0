Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp107462njb;
        Thu, 12 Dec 2024 16:26:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUc25OxbzoDHg1wuvYKxgj4zuSgJ3N8ITEcCQtFdfzwOWx13X6/0oygF6ld40oG3s9II0ob2NFA9yxWbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHu9vqrqBhJr9OswgTXB/axZtf8TiVBaNc4JsINCq+1ys6Rw/mbgVHpjcwvpNFjjUatxqca
X-Received: by 2002:a05:620a:720b:b0:7b6:ea22:3069 with SMTP id af79cd13be357-7b6fbf088cemr73850785a.26.1734049610427;
        Thu, 12 Dec 2024 16:26:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734049610; cv=none;
        d=google.com; s=arc-20240605;
        b=K3W7vGp9T43TM2Y62rX1C1kuY9E7zD4oK6Fryij1ZKYMj5Vhc9BXfrGPzE0mjy6rrl
         IkSpzuXKm+YKKFdEl7mXQHsoqgEUdjjhc+42nuLt2w/BgtSpM8rvloDpJ2vRi7dMvfFB
         zuAbRlhjEAlmbMOr0vOohsZ7+ZSEQCbLTgIhXcteE6E5tyJAIhaT64pdD0WVDnMMIkTr
         QImzgVXcTY5ErBEr/WHtA3PNjTczBQ0ZLVbkE0stVV9tfX5wcaHMunsWFNwV8I9XHemU
         fshatLNNoJ+2yg+8jW2mzb7h2CwAaa2aKtyRi2EV42yDyTr3pAHcKHrklp+qCWoKDxF9
         r8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=OnTkKmI98HLqjCoEGGsWWLjffxSTToPbCN+awUwxOzs=;
        fh=sOnQlUIzoJtp3KLJipivWBBp8cRlacKY5WhinWmAJRY=;
        b=BxE1Afxayf9DIWxxjjoFNzZ2YxtCzljNjaVrPHKsZm+jkR45odEk6FGG2UPPbOyqpf
         Jk7ofF9BRITdPvwhSi5NlkVwlx1E8UxYwklKwZ3v8ABX6YIr390ZtE22HgGxOgcrFmS6
         8PoIt/wVQym2jOsmHsIqpxcsKkKwkU+LWTn9Wf93q//FCi+EP/44qtJvXlrE6bGtFCe8
         jUjf86LCPl1cyueqiWC5UYiD3fufOvAejyd6gWmeKoxQcnHARSKyRu3T4IOx3vTbxkQG
         46cou5Ff9EAKC390DFDSTIw92L/zyLRB9r0rjhodN9VxvMuubin2oo+H3IOmRYvntFKU
         8PoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SB3hc7Jo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a8ff93si2031788485a.218.2024.12.12.16.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2024 16:26:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SB3hc7Jo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLtVn-0007Fd-6I; Thu, 12 Dec 2024 19:26:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LX9bZwwKCNoJ67EDAOPAB6JCKKCHA.8KIMAIQ-6NIJKJCJQ.KNC@flex--nabihestefan.bounces.google.com>)
 id 1tLtVl-0007FE-1G
 for qemu-arm@nongnu.org; Thu, 12 Dec 2024 19:26:29 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LX9bZwwKCNoJ67EDAOPAB6JCKKCHA.8KIMAIQ-6NIJKJCJQ.KNC@flex--nabihestefan.bounces.google.com>)
 id 1tLtVj-0003tr-7q
 for qemu-arm@nongnu.org; Thu, 12 Dec 2024 19:26:28 -0500
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2efa0eb9dacso1165732a91.1
 for <qemu-arm@nongnu.org>; Thu, 12 Dec 2024 16:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1734049581; x=1734654381; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OnTkKmI98HLqjCoEGGsWWLjffxSTToPbCN+awUwxOzs=;
 b=SB3hc7JogvkXnoICARTEV250nSBA7intKbisWHnGSfXbpMYUaVdcYIBjqWxSvKjfeb
 ixScYbVRxgYgetjlq0sblDh4tAPjLPr1bzaj3OHHuW8Ap1p0UnajU9iDzXFAM9Otolb0
 zQ2gy3NCba52HBWYVk2w5svQnidoDDSdtrFecSUfZCRxoIAq9pYQf8PH/cL3P1T+gQ++
 sOGnEm/aYskTsYkknYQet/U2lcIOXLuEO2Y0KFJTnMS6hMLoL4OGqB+YkpbXS3aOH3Af
 YQvPZ5X/oZKav6J8n5+od4I+H4pqgbWPgUZlGkKsMPYnAfZuJIZGe8UjhdWYwjxAAa8M
 Gobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734049581; x=1734654381;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OnTkKmI98HLqjCoEGGsWWLjffxSTToPbCN+awUwxOzs=;
 b=D/TfyRyX3srfbBBuq6mtUiC4Hoahrl6xXTGCJJccGEx4fwMmQONfj4ELELOG8z9Hkn
 /6Z/yOjAC7MFDKyzjDmbODilWhZJbxuswziouCXAI7CK6JB9gdWTBmKgHkDiVtNgFkTx
 s3cZJ3E+8bmlDCtnUF5oaI6o3AwFx8K1ZwaAphfr7v36+jQ89YiIKNDG3rgxrwAlFrtw
 dDW4aYkQn6OOLyA2rtZatf8vMPx17kzf84s7+2v31Tz0wzwyoMizQtIYfL3M9r923osl
 zGJWUcUbU2rWjnU12QnPhzIFksOaLFe+p0RY7InMmaYSAwGTulcZqHf01cosNA0wCv/S
 ZrEQ==
X-Gm-Message-State: AOJu0YyMDk8JsEkpadMJlQkDDyOPGvOSQaiWftUvdFgDQjw4pknzoM1m
 AsWmh8Nemd8VH8HkwMSAjwVz4UhDmrHXy6MKv+b07ADEVVYsI5YdUL7wx2aiFv6vWz4QYjUaZCV
 pdclMdeos59SA+FRdwqxWjUG16g==
X-Received: from pjbsc8.prod.google.com ([2002:a17:90b:5108:b0:2ef:85ba:108f])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3e8e:b0:2ea:2a8d:dd2a with SMTP id
 98e67ed59e1d1-2f2900a98b4mr1055155a91.27.1734049581571; 
 Thu, 12 Dec 2024 16:26:21 -0800 (PST)
Date: Fri, 13 Dec 2024 00:26:02 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213002602.4181289-1-nabihestefan@google.com>
Subject: [PATCH] tests/qtest/sse-timer-test: Add watchdog reset to sse-timer
 test
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, farosas@suse.de, 
 lvivier@redhat.com, pbonzini@redhat.com, roqueh@google.com, 
 venture@google.com, Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3LX9bZwwKCNoJ67EDAOPAB6JCKKCHA.8KIMAIQ-6NIJKJCJQ.KNC@flex--nabihestefan.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: Wllxi0IFxSl/

Recent CDMSK Watchdog changes (eff9dc5660fad3a610171c56a5ec3fada245e519)
updated the CDMSK APB Watchdog to not free run out of reset. That led to
this test failing since it never triggers the watchdog to start running.
No watchdog running means that the timer and counter in the test cannot
start, leading to failures in the assert statements throughout the test.
Adding a reset and enable of the watchdog to the reset function solves
this problem by enabling the watchdog and thus letting the timer and
counter run as expected

Also renaming the reset_counter_and_timer function since it now also
affects the watchdog.

To reproduce the failure at HEAD:
./configure --target-list=arm-softmmu
make -j check-report-qtest-arm.junit.xml

Signed-off-by: Nabih Estefan <nabihestefan@google.com>
---
 scripts/meson-buildoptions.sh.tmp |  0
 tests/qtest/sse-timer-test.c      | 19 ++++++++++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)
 create mode 100644 scripts/meson-buildoptions.sh.tmp

diff --git a/scripts/meson-buildoptions.sh.tmp b/scripts/meson-buildoptions.sh.tmp
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/sse-timer-test.c b/tests/qtest/sse-timer-test.c
index fd5635d4c9..d7a53ac23a 100644
--- a/tests/qtest/sse-timer-test.c
+++ b/tests/qtest/sse-timer-test.c
@@ -29,6 +29,13 @@
 /* Base of the System Counter control frame */
 #define COUNTER_BASE 0x58100000
 
+/* Base of the MSSDK APB Watchdog Device */
+#define WDOG_BASE 0x4802e000
+
+/* CMSDK Watchdog offsets */
+#define WDOGLOAD 0
+#define WDOGCONTROL 8
+
 /* SSE counter register offsets in the control frame */
 #define CNTCR 0
 #define CNTSR 0x4
@@ -63,24 +70,26 @@ static void clock_step_ticks(uint64_t ticks)
     clock_step(FOUR_TICKS * (ticks >> 2));
 }
 
-static void reset_counter_and_timer(void)
+static void reset_watchdog_counter_and_timer(void)
 {
     /*
-     * Reset the system counter and the timer between tests. This
+     * Reset the system watchdog, counter and the timer between tests. This
      * isn't a full reset, but it's sufficient for what the tests check.
      */
+    writel(WDOG_BASE + WDOGCONTROL, 0);
     writel(COUNTER_BASE + CNTCR, 0);
     writel(TIMER_BASE + CNTP_CTL, 0);
     writel(TIMER_BASE + CNTP_AIVAL_CTL, 0);
     writel(COUNTER_BASE + CNTCV_LO, 0);
     writel(COUNTER_BASE + CNTCV_HI, 0);
+    writel(WDOG_BASE + WDOGCONTROL, 1);
 }
 
 static void test_counter(void)
 {
     /* Basic counter functionality test */
 
-    reset_counter_and_timer();
+    reset_watchdog_counter_and_timer();
     /* The counter should start disabled: check that it doesn't move */
     clock_step_ticks(100);
     g_assert_cmpuint(readl(COUNTER_BASE + CNTCV_LO), ==, 0);
@@ -103,7 +112,7 @@ static void test_timer(void)
 {
     /* Basic timer functionality test */
 
-    reset_counter_and_timer();
+    reset_watchdog_counter_and_timer();
     /*
      * The timer is behind a Peripheral Protection Controller, and
      * qtest accesses are always non-secure (no memory attributes),
@@ -195,7 +204,7 @@ static void test_timer_scale_change(void)
      * Test that the timer responds correctly to counter
      * scaling changes while it has an active timer.
      */
-    reset_counter_and_timer();
+    reset_watchdog_counter_and_timer();
     /* Give ourselves access to the timer, and enable the counter and timer */
     writel(PERIPHNSPPC0, 1);
     writel(COUNTER_BASE + CNTCR, 1);
-- 
2.47.1.613.gc27f4b7a9f-goog

