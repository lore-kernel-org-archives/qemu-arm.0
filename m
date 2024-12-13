Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp778871njb;
        Fri, 13 Dec 2024 14:41:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUHO8panYzNTuHpyDgnW+/60mw83yoTllzixpVwE1SJIsmCO4MoLyI48IvgzSX/P/pIn97IYbtuB+Yr0w==@linaro.org
X-Google-Smtp-Source: AGHT+IGJUcRxLgRrrYxJN2PXD4BaZnqnGpXDyM4UfVB72iGptSjgmJ37W0z7ESEc2sF/t37UYGRg
X-Received: by 2002:a05:622a:8ce:b0:467:5734:d094 with SMTP id d75a77b69052e-467a5bdb2b8mr69911151cf.28.1734129665709;
        Fri, 13 Dec 2024 14:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734129665; cv=none;
        d=google.com; s=arc-20240605;
        b=NuZdp8BmVNQOIu4MyqGdpncSMkLDOtStlv3HMM1uARejjph+xK9s7B15+PXCrEu8iZ
         +wqwzB74ZUc0/FCEpbr830QIlnmEp0LF5YE7siZdshGhcvatOjCXhscxPhNcOy/viLj9
         Yju5nEs+Bav1ninA+7AwQVVjMGQ6fs+m7vLA0ULAa7QrZ5pcNEzpdebEeOTF1l8xP1S9
         jq6euHszYAyKGnv5SADcGWmR2pdSkNf27i809Rv4Sp2wPrx4pr1Tlwe1fog/9KuiAUwk
         1BQ8MZ88FXbHXCiUeNAN7pzcSGOMmok3ifR2VrJ8+YSV5mSDALjrOt3m/yFRAKCEqSQP
         jMKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=Y5tnX/+CjFCQneIvFaXnx9LjKWIK0Im3pRzlQnaPJs4=;
        fh=WKhLO2XV48PSBpn2fqvKT3zH5e6PQI5/RDEdSCbNwBc=;
        b=e3F9wJGbpqlHVgyBVafBC+JKztitsxWNqSJgcfSmPKF85BZqoHCyjy25/Iok+8dTXo
         mCfUMqi2UaJv5FTvEc3HGhwQFm0MU0Ue42SmOD9IwPNwBEskS6p+4hipUhqa6FGA26Fp
         zBWqN7KR5AHRQzUMmtJ365ZmuHYZEQvkYwk2X96l6xrX8gNDSNFr/3Oiji/rgmEQCAkA
         D3R1IGTQqzXJIVqLz/jy+4UoTFUb043SoiCFZBkFu+JL7dEiBmopODLdgOTqgduUW2EY
         5ATtSND3+aN8p3OzMWtGp0RGcbAuSL1cXmtPtiVA+higabue4P3iWYF4iYCLd6BM2eY3
         VB4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="wD/QNp+S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2ed2c1fsi7001561cf.467.2024.12.13.14.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 14:41:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="wD/QNp+S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMEKl-0003j6-Ba; Fri, 13 Dec 2024 17:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <32LdcZwwKCPsqdelkhvwhidqjrrjoh.frpthpx-dupqrqjqx.ruj@flex--nabihestefan.bounces.google.com>)
 id 1tMEKj-0003iN-D5
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 17:40:29 -0500
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <32LdcZwwKCPsqdelkhvwhidqjrrjoh.frpthpx-dupqrqjqx.ruj@flex--nabihestefan.bounces.google.com>)
 id 1tMEKh-0006hd-GB
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 17:40:29 -0500
Received: by mail-oa1-x49.google.com with SMTP id
 586e51a60fabf-296bc214420so1949630fac.1
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 14:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1734129624; x=1734734424; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Y5tnX/+CjFCQneIvFaXnx9LjKWIK0Im3pRzlQnaPJs4=;
 b=wD/QNp+SaO+QsGD3OSuqQ9rMQNEH979MNAKZdSO3gkhCmIEj6fahBkAEajVp5EJ/y8
 YjnQ3X4dLaRsmITbQDMiMXBENTrFdqqP9/KLlKf9Kz8XBhNtW6DEIxAOzctBEhmHn4do
 YFFR4VnfaRdv5pyCSV8zAQRS7GREgoyvXWP4w7XIK4PR3lOblRFueFQ7m9uQKEK0p4In
 MrBwcrjam4skkp1AMhdjuj6sdRNZbSFs3hj43vkYHv0ed3KvVcFxlow5XObnKXuvsil1
 OTpuRCvwpTm2VP6tuRvPvz5/hIvs0aswk/26uqtooH/wjC5jzRRxsftMYmkWxAUVy8xA
 CCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734129624; x=1734734424;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y5tnX/+CjFCQneIvFaXnx9LjKWIK0Im3pRzlQnaPJs4=;
 b=qPH9Atl+eJ6aZt4mIaj6NFZ4Hyf95pNyxJWRCjKUOwbD5cCN75u56mBNDaqP6g7E4Z
 CVy+nVcfq3v7do2APjpawI2HHxT1lqWYFgOfeix1rAvfmIw66iugtMOfnQbP4maFGkU8
 Q1jMbAU7KhhHjFxYDD+j41or3IVbCWzw76DrY6FH3bxLmsLW5BuJmxDzlYpHvKh9BUjy
 APzyIxvO37jLNTv8g4k1F43q/r4GvuHTyh7DtZ9pU1S2fSs6KJKMY+zjJr/2XzQXrwtX
 gZsvcM/kJU7K3OaJ8doXDQ1D47nvSQ5lM/ZwZuKZxzMzmEHr5FjwryVUWX3AjI03/Awh
 GhRQ==
X-Gm-Message-State: AOJu0YxvOfLSewfH/u+6xiqDK2Fr9/05GSN5xYThwlD1YAG6ddNoUlzB
 44jEOyLS67o4pZPlfOvJIa3PANGo+ZNAVm5qQ5RsPx0j9LrV72IeY5XM28HV57O1TnzRPSUOZqx
 sG0mIjpTRAv+P4L21ubI8OQW5Bg==
X-Received: from oabrl15.prod.google.com
 ([2002:a05:6871:650f:b0:289:3039:6009])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:8450:b0:29e:18cc:276f with SMTP id
 586e51a60fabf-2a3ac6f2c10mr1995517fac.11.1734129624146; 
 Fri, 13 Dec 2024 14:40:24 -0800 (PST)
Date: Fri, 13 Dec 2024 22:40:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213224020.2982578-1-nabihestefan@google.com>
Subject: [PATCH v2] tests/qtest/sse-timer-test: Add watchdog reset to
 sse-timer test
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, farosas@suse.de, 
 lvivier@redhat.com, pbonzini@redhat.com, roqueh@google.com, 
 Nabih Estefan <nabihestefan@google.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::49;
 envelope-from=32LdcZwwKCPsqdelkhvwhidqjrrjoh.frpthpx-dupqrqjqx.ruj@flex--nabihestefan.bounces.google.com;
 helo=mail-oa1-x49.google.com
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
X-TUID: +pxJhkTKu7FG

V2: Removed scripts/meson-buildoptions.sh.tmp Extra file that slipped
through the cracks and shouldn't be in this patch

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
Tested-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/sse-timer-test.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

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

