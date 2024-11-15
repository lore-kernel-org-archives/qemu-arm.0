Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1070877njc;
        Fri, 15 Nov 2024 08:05:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWztTBViIpp+5Bv7ST4KEwLu8Dd+tep4az3cMeW1hmsJK/7lEqw9H7C20MdG2e2HVdpKd+9BxxxApZ94Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHPcTUlnRvSDVMZHIJWLBEYo1t53JK2EikVTTz0UMhwoLNfnd1AR7r0C6mXy32gH1rJi41G
X-Received: by 2002:a5d:47a2:0:b0:37d:4ab2:9cdc with SMTP id ffacd0b85a97d-38225a06c76mr2816104f8f.13.1731686711187;
        Fri, 15 Nov 2024 08:05:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731686711; cv=none;
        d=google.com; s=arc-20240605;
        b=YXCI9d6vuUN7rTHIJ+/xBEg+eA742YGKuYiZA1Z5BbrmNuOMwRSTGjiEwLrDg5UXNK
         7FWG28QsaVTr79pn6wgpfS5FlbTGJ8BXsKkaEx9hU00CT/YbLqS6BXo/7C00ijJ2d5P1
         hJTtLFIoWblymeoqbpDAdCDaS3cL3i2yzJGWVd0veE2lLik4rU3t/8ptbbH9tkQDO7aS
         5lgypc9RPaEuY9Tz6iCDACEeuB7b1Lrx7US1KOH5AalZR4nsrT/KQFkMHvjyg8TpwmEt
         iQ4wLSNIzW0hGQcvhhExvofxKzFtQi6580ziDEmVVKSaK29ze2H9MK1Iby8YggzIK0WV
         BCHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=KMdD3J+9D4ZN1ebH5rou1PahRsOUkA7m1mxuWqZBhU0=;
        fh=ffnN9zI22QF9Ck+qrzwzRVxQEjbeHIVvq/vIClHZsyg=;
        b=BG7lflUHFUcwIN6qKbbY2RjgXSbQ4Gubj2bdTPGK11m1RqTzgWxtFX9ftmEMgNPrVe
         92jRGwMHYbVndH2LcjE0Pw1cMc033gYpM7OJUO6U70k+ebWw+ADsK+gR/cKYjOlkv81x
         pehIs/vwsLJIjBX2D7Hj8RzfbPPoJ83/40DqJn1hz254aGPEC9nnLUF8pU3vxclB1wM9
         /yF9w97bhlAXqBW9izZdF11T4VayeIb4Y2Eg3AVs3yyf0ID17IuoUHfFM1HNUWNCpXpY
         dOR3lzWfvp+a4VPkYHPRYnNWuHdPvnLclP/GCH/QtGbhAa976XLgspWiLoKfRBS221xB
         8Stw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=nsa1J6JW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3821ae4f3casi2411209f8f.756.2024.11.15.08.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 08:05:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=nsa1J6JW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tByni-0004Eg-TH; Fri, 15 Nov 2024 11:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <353A3ZwYKCOYZWYcMPOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--roqueh.bounces.google.com>)
 id 1tBynb-0004DP-9N
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 11:03:56 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <353A3ZwYKCOYZWYcMPOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--roqueh.bounces.google.com>)
 id 1tBynZ-00043v-3e
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 11:03:54 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6ea8a5e862eso23767127b3.0
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 08:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731686631; x=1732291431; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KMdD3J+9D4ZN1ebH5rou1PahRsOUkA7m1mxuWqZBhU0=;
 b=nsa1J6JW7LzQEU/F6ibyPMV9xEhXSo1rt471vDibPfYBDraWlWb5zalAA8BYyaToSJ
 NB3e43nFH/pK1M8yNW0DEEwOOVl2/2tsd9smK/ZZgNPaUc6iBETEP6rFy4rMip4g4zfD
 n3qR5l9z4ML0GsiOLDJSU7fT1AW/44uqrZtZjUXw6Sx7Jsw1AxZZzsZH3XASuNK4FoXX
 pt7nZRT75O1xYRGGSGCz2tsi0WMjmvtb20QOZtE9cEsZPAMpdaBfYw8J9AUnQRVGXGde
 cMZcqFP/S2kwUX9EOfAaVrjY/Dix6zX8xekqOaiPX7o526bkKsbXDOUU+orhJoU78Ywu
 tLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731686631; x=1732291431;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KMdD3J+9D4ZN1ebH5rou1PahRsOUkA7m1mxuWqZBhU0=;
 b=eLofbx/7Z5ZzvvkZBdMbmzTjnf3Op0EHiFOIYxr3dlDKre0Up0CDAak3z8/TJ1dCQT
 iE4PvBehpqIvacKSWBoNbgImlxZqkLYNvXVW7/RIBdM3hzK1mM4+PB/gDYUnUWxSOvmX
 aozf+YTxgZ/mga+GoTE6Jbn+mQXG4CTb59VUoaE687eqyeyj8QJgTgWuKwmpa0liGF3Q
 DiLeS/X6FdBgG2s+ARZUVsZZP5KcUMOCabVB1/VUSqr3cTha9/LDpnLehPMpe2ouVfm7
 NVdHI5GPBIBriLoLvTESQ8FOJSewdWiIGLeYGBjGu0RLppi+swqIV5Bb0M7CIdpdQqH+
 TDIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgivWzgp2rVC1Qn6yBEuyGPgjOiefh8FL/ryqh1QulF4vOderEMPK6zWFh9XuIKSrMbRPriWnRDA==@nongnu.org
X-Gm-Message-State: AOJu0YwNQFltJNY8k/FvE8zxIbuVNg8CB+88vJJcY+jXVHJiisgW8tHk
 cGOk/lglEt9MHvfWK7L02gDD29i9UAeiZxNIG4swt/riBi5r0JnD9jev0DoQ0oXqyEv1tZgTwBF
 G5Q==
X-Received: from roqueh.c.googlers.com ([fda3:e722:ac3:cc00:4e:3bc9:ac1c:1ab])
 (user=roqueh job=sendgmr) by 2002:a05:690c:4b81:b0:620:32ea:e1d4
 with SMTP id
 00721157ae682-6ee54ba2faemr2987037b3.0.1731686631119; Fri, 15 Nov 2024
 08:03:51 -0800 (PST)
Date: Fri, 15 Nov 2024 16:03:28 +0000
In-Reply-To: <20241115160328.1650269-1-roqueh@google.com>
Mime-Version: 1.0
References: <20241115160328.1650269-1-roqueh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241115160328.1650269-6-roqueh@google.com>
Subject: [PATCH 5/5] tests/qtest/cmsdk-apb-watchdog-test: Test INTEN as
 counter enable
From: Roque Arcudia Hernandez <roqueh@google.com>
To: peter.maydell@linaro.org, farosas@suse.de, lvivier@redhat.com, 
 slongfield@google.com, komlodi@google.com, pbonzini@redhat.com, 
 venture@google.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Roque Arcudia Hernandez <roqueh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=353A3ZwYKCOYZWYcMPOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--roqueh.bounces.google.com;
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
X-TUID: ZD7pFKrDQYrZ

The following tests focus on making sure the counter is not running
out of reset and the proper use of INTEN as the counter enable. As
described in:

https://developer.arm.com/documentation/ddi0479/d/apb-components/apb-watchdog/programmers-model

The new tests have to target an MPS2 machine because the original
machine used by the test (stellaris) has a variation of the
cmsdk_apb_watchdog that locks INTEN when it is programmed to 1. The
stellaris machine also does not reproduce the problem of the counter
running out of cold reset due to the way the clocks are initialized.

Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
Reviewed-by: Stephen Longfield <slongfield@google.com>
---
 tests/qtest/cmsdk-apb-watchdog-test.c | 215 ++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-apb-watchdog-test.c
index fe535a553c..53538f98c9 100644
--- a/tests/qtest/cmsdk-apb-watchdog-test.c
+++ b/tests/qtest/cmsdk-apb-watchdog-test.c
@@ -68,6 +68,16 @@ static const CMSDKAPBWatchdogTestArgs machine_info[] = {
     },
 };
 
+static void system_reset(QTestState *qtest)
+{
+    QDict *resp;
+
+    resp = qtest_qmp(qtest, "{'execute': 'system_reset'}");
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+    qtest_qmp_eventwait(qtest, "RESET");
+}
+
 static void test_watchdog(const void *ptr)
 {
     const CMSDKAPBWatchdogTestArgs *args = ptr;
@@ -159,6 +169,199 @@ static void test_clock_change(const void *ptr)
     qtest_end();
 }
 
+/* Tests the counter is not running after reset. */
+static void test_watchdog_reset(const void *ptr)
+{
+    const CMSDKAPBWatchdogTestArgs *args = ptr;
+    hwaddr wdog_base = args->wdog_base;
+    int64_t tick = args->tick;
+    g_autofree gchar *cmdline = g_strdup_printf("-machine %s", args->machine);
+    qtest_start(cmdline);
+    g_assert_cmpuint(readl(wdog_base + WDOGRIS), ==, 0);
+
+    g_assert_cmphex(readl(wdog_base + WDOGLOAD), ==, WDOGLOAD_DEFAULT);
+    g_assert_cmphex(readl(wdog_base + WDOGVALUE), ==, WDOGVALUE_DEFAULT);
+
+    g_assert_cmphex(readl(wdog_base + WDOGCONTROL), ==, 0);
+
+    /*
+     * The counter should not be running if WDOGCONTROL.INTEN has not been set,
+     * as it is the case after a cold reset.
+     */
+    clock_step(15 * tick + 1);
+    g_assert_cmphex(readl(wdog_base + WDOGLOAD), ==, WDOGLOAD_DEFAULT);
+    g_assert_cmphex(readl(wdog_base + WDOGVALUE), ==, WDOGVALUE_DEFAULT);
+
+    /* Let the counter run before reset */
+    writel(wdog_base + WDOGLOAD, 3000);
+    writel(wdog_base + WDOGCONTROL, 1);
+
+    /* Verify it is running */
+    clock_step(1000 * tick + 1);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 3000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 2000);
+
+    system_reset(global_qtest);
+
+    /* Check defaults after reset */
+    g_assert_cmphex(readl(wdog_base + WDOGLOAD), ==, WDOGLOAD_DEFAULT);
+    g_assert_cmphex(readl(wdog_base + WDOGVALUE), ==, WDOGVALUE_DEFAULT);
+
+    /* The counter should not be running after reset. */
+    clock_step(1000 * tick + 1);
+    g_assert_cmphex(readl(wdog_base + WDOGLOAD), ==, WDOGLOAD_DEFAULT);
+    g_assert_cmphex(readl(wdog_base + WDOGVALUE), ==, WDOGVALUE_DEFAULT);
+
+    qtest_end();
+}
+
+/*
+ * Tests inten works as the counter enable based on this description:
+ *
+ * Enable the interrupt event, WDOGINT. Set HIGH to enable the counter and the
+ * interrupt, or LOW to disable the counter and interrupt. Reloads the counter
+ * from the value in WDOGLOAD when the interrupt is enabled, after previously
+ * being disabled.
+ */
+static void test_watchdog_inten(const void *ptr)
+{
+    const CMSDKAPBWatchdogTestArgs *args = ptr;
+    hwaddr wdog_base = args->wdog_base;
+    int64_t tick = args->tick;
+    g_autofree gchar *cmdline = g_strdup_printf("-machine %s", args->machine);
+    qtest_start(cmdline);
+    g_assert_cmpuint(readl(wdog_base + WDOGRIS), ==, 0);
+
+    g_assert_cmphex(readl(wdog_base + WDOGLOAD), ==, WDOGLOAD_DEFAULT);
+    g_assert_cmphex(readl(wdog_base + WDOGVALUE), ==, WDOGVALUE_DEFAULT);
+
+    /*
+     * When WDOGLOAD is written to, the count is immediately restarted from the
+     * new value.
+     *
+     * Note: the counter should not be running as long as WDOGCONTROL.INTEN is
+     * not set
+     */
+    writel(wdog_base + WDOGLOAD, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 4000);
+    clock_step(500 * tick + 1);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 4000);
+
+    /* Set HIGH WDOGCONTROL.INTEN to enable the counter and the interrupt */
+    writel(wdog_base + WDOGCONTROL, 1);
+    clock_step(500 * tick + 1);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 3500);
+
+    /* or LOW to disable the counter and interrupt. */
+    writel(wdog_base + WDOGCONTROL, 0);
+    clock_step(100 * tick);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 3500);
+
+    /*
+     * Reloads the counter from the value in WDOGLOAD when the interrupt is
+     * enabled, after previously being disabled.
+     */
+    writel(wdog_base + WDOGCONTROL, 1);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 4000);
+
+    /* Test counter is still on */
+    clock_step(50 * tick + 1);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 3950);
+
+    /*
+     * When WDOGLOAD is written to, the count is immediately restarted from the
+     * new value.
+     *
+     * Note: the counter should be running since WDOGCONTROL.INTEN is set
+     */
+    writel(wdog_base + WDOGLOAD, 5000);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 5000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 5000);
+    clock_step(4999 * tick + 1);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 5000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 1);
+    g_assert_cmpuint(readl(wdog_base + WDOGRIS), ==, 0);
+
+    /* Finally disable and check the conditions don't change */
+    writel(wdog_base + WDOGCONTROL, 0);
+    clock_step(10 * tick);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 5000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 1);
+    g_assert_cmpuint(readl(wdog_base + WDOGRIS), ==, 0);
+
+    qtest_end();
+}
+
+/*
+ * Tests the following custom behavior:
+ *
+ * The Luminary version of this device ignores writes to this register after the
+ * guest has enabled interrupts (so they can only be disabled again via reset).
+ */
+static void test_watchdog_inten_luminary(const void *ptr)
+{
+    const CMSDKAPBWatchdogTestArgs *args = ptr;
+    hwaddr wdog_base = args->wdog_base;
+    int64_t tick = args->tick;
+    g_autofree gchar *cmdline = g_strdup_printf("-machine %s", args->machine);
+    qtest_start(cmdline);
+    g_assert_cmpuint(readl(wdog_base + WDOGRIS), ==, 0);
+
+    g_assert_cmphex(readl(wdog_base + WDOGLOAD), ==, WDOGLOAD_DEFAULT);
+    g_assert_cmphex(readl(wdog_base + WDOGVALUE), ==, WDOGVALUE_DEFAULT);
+
+    /*
+     * When WDOGLOAD is written to, the count is immediately restarted from the
+     * new value.
+     *
+     * Note: the counter should not be running as long as WDOGCONTROL.INTEN is
+     * not set
+     */
+    writel(wdog_base + WDOGLOAD, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 4000);
+    clock_step(500 * tick + 1);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 4000);
+
+    /* Set HIGH WDOGCONTROL.INTEN to enable the counter and the interrupt */
+    writel(wdog_base + WDOGCONTROL, 1);
+    clock_step(500 * tick + 1);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 3500);
+
+    /*
+     * The Luminary version of this device ignores writes to this register after
+     * the guest has enabled interrupts
+     */
+    writel(wdog_base + WDOGCONTROL, 0);
+    clock_step(100 * tick);
+    g_assert_cmpuint(readl(wdog_base + WDOGLOAD), ==, 4000);
+    g_assert_cmpuint(readl(wdog_base + WDOGVALUE), ==, 3400);
+    g_assert_cmphex(readl(wdog_base + WDOGCONTROL), ==, 0x1);
+
+    /* They can only be disabled again via reset */
+    system_reset(global_qtest);
+
+    /* Check defaults after reset */
+    g_assert_cmphex(readl(wdog_base + WDOGLOAD), ==, WDOGLOAD_DEFAULT);
+    g_assert_cmphex(readl(wdog_base + WDOGVALUE), ==, WDOGVALUE_DEFAULT);
+    g_assert_cmphex(readl(wdog_base + WDOGCONTROL), ==, 0);
+
+    /* The counter should not be running after reset. */
+    clock_step(1000 * tick + 1);
+    g_assert_cmphex(readl(wdog_base + WDOGLOAD), ==, WDOGLOAD_DEFAULT);
+    g_assert_cmphex(readl(wdog_base + WDOGVALUE), ==, WDOGVALUE_DEFAULT);
+
+    qtest_end();
+}
+
 int main(int argc, char **argv)
 {
     int r;
@@ -172,10 +375,22 @@ int main(int argc, char **argv)
         qtest_add_data_func("/cmsdk-apb-watchdog/watchdog_clock_change",
                             &machine_info[MACHINE_LM3S811EVB],
                             test_clock_change);
+        qtest_add_data_func("/cmsdk-apb-watchdog/watchdog_reset",
+                            &machine_info[MACHINE_LM3S811EVB],
+                            test_watchdog_reset);
+        qtest_add_data_func("/cmsdk-apb-watchdog/watchdog_inten_luminary",
+                            &machine_info[MACHINE_LM3S811EVB],
+                            test_watchdog_inten_luminary);
     }
     if (qtest_has_machine(machine_info[MACHINE_MPS2_AN385].machine)) {
         qtest_add_data_func("/cmsdk-apb-watchdog/watchdog_mps2",
                             &machine_info[MACHINE_MPS2_AN385], test_watchdog);
+        qtest_add_data_func("/cmsdk-apb-watchdog/watchdog_reset_mps2",
+                            &machine_info[MACHINE_MPS2_AN385],
+                            test_watchdog_reset);
+        qtest_add_data_func("/cmsdk-apb-watchdog/watchdog_inten",
+                            &machine_info[MACHINE_MPS2_AN385],
+                            test_watchdog_inten);
     }
 
     r = g_test_run();
-- 
2.47.0.338.g60cca15819-goog

