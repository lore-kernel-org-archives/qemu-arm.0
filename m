Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp154697lfo;
        Thu, 28 Jan 2021 03:57:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwx7l2tTcDykRtW+Rkvwy+E/muxkt3/BdrhuaWsHSiaF+stDBtMKHEqhHZ7KIbTQJEpl6xt
X-Received: by 2002:a25:c401:: with SMTP id u1mr21552598ybf.340.1611835036259;
        Thu, 28 Jan 2021 03:57:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611835036; cv=none;
        d=google.com; s=arc-20160816;
        b=XHdNpNHB25/+tu35HHy9JojKomFrsNqF13PGPFXFGmFGmlCgLP9idQvEGlgbpapfDD
         zuqz9tmugcA1i3pFIdt4UAR9W57R9TBoBpaBDJNggP99pin3eUfjNigEwockJF1/b/1f
         L/bchira83MLD5uLPS8rmJ2hgQI+vqXwbETOs3FdzN4renNGgumM4GmFIzk5N/LTvs26
         3Q8+leAGbg4WxUH0kBQezR8mG8MXaRN1b65CESsy/PKZCq4l6oTCV8OUzd8jbRzrdkkP
         XUW+v8k9Hr89cJFF1ChX1N4qWFhEz50TMH5Ga6vixm3LaQTiksFk2CVATIA3gUVDTD7U
         JIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iLfQwzRXcvknxpkyMmoH4p1ex2pddLgB3eHdSm55wjg=;
        b=lIkTw1/c0g7tM1nXD3ggsBetSHBHIn51dUcdciLsG/P9rgNAe5ApvWugrTvTk+cPZS
         FlOhuWbYD1+kqXhaFDKcojghofP43fu8dLVtwAMa/MhzRLj8EmXtVgsqQ7F2xFlKASoL
         HQwZo2V+1A5k6bBuyKisZxCrz2pDnp630uocAZDQ1cWAnoFWWCr3NEpSwiQXzH+zSc21
         BSjzpaPaVxyUEM8uqTQXwdBKheUxEIvWwLxH9ajMcxx6MU8ILeve5wE9rDTyayEl9m/I
         B03a2YuvtyvF1mUlvDtbhtP6mzXdYbETwi7AeWGR/bQLyhRKvfDBALnozG8uIm/Dh/wp
         DbhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bwwv7KEm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13si5089227ybm.152.2021.01.28.03.57.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:57:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bwwv7KEm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55vH-00046V-KB
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gr-0001hn-Po
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:21 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gg-0006Do-E1
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id z6so5009044wrq.10
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iLfQwzRXcvknxpkyMmoH4p1ex2pddLgB3eHdSm55wjg=;
 b=bwwv7KEmATInReiDbCBFcHGyBcUZ53s8dsPWBufV3bWMQiRK96Rof6CB4H9cZZE3Ic
 M1/mdkrDVgiXxuOZSzAYebUOmo+vsEXWZI3q/GP1sLzeE2YdCiyRqhsWRfM3odUmuGRA
 YmIFZ2uBbyVgcQxfNacgALYcIhq9UK8pFCD1XucWBBHtbtmoE3cQ7t0PxKMYrU1GofBG
 AIzAXVkkiSLQanRSAfkgFPWzIXi7hIqXgIYon/TWPDHqE4h3mRvDmWB++otkEHoaeXEu
 5t/DE9LCWlDftlTNSf7cBRjNg0TqmxZenqnyW4X1AoNngG625hfUPYTaccT9ItsRK2tG
 khUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iLfQwzRXcvknxpkyMmoH4p1ex2pddLgB3eHdSm55wjg=;
 b=T/DQJPK1iA8G4opF+vzppf+AVtikmWC7040+1B1wHW94Eih3tpM201pV3gUfHnieDS
 iRl+h8qhIE44Br7QLkfMQtVjTeFfB5PjBOiY5VKnuQQ4Q+iBYI9HBrJw95uztLsuH1oi
 XWqN2EPyRYJiZlVcnJP51RbSOHIhhfVVVT9h59NR6a3SU73MKimWbmEjYgVg/yYhpN8a
 EYGpUu1OjfyPgmeNgVmQj6gg+hQ1F2GLN6qJw8W2zuTT7oUlA7mqLbB4/noJaGG5DYZn
 aNtl6UxhP4mucdT6xaeydm7Ht/VJq+4vsh0g33b3bUSsdgqRGnZKy0BEfNxFsLFOrZ5P
 ZLng==
X-Gm-Message-State: AOAM532LbED5M90xdrwjj3ImHaA5CLiRMWB9rMnk8/I5gQ14OLyK09kE
 1TQyC7PDlcLx6iYKWXgebWgPiQ==
X-Received: by 2002:a5d:4402:: with SMTP id z2mr15797119wrq.265.1611834128404; 
 Thu, 28 Jan 2021 03:42:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/25] tests/qtest/cmsdk-apb-watchdog-test: Test clock
 changes
Date: Thu, 28 Jan 2021 11:41:41 +0000
Message-Id: <20210128114145.20536-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kuv7jzbWSpfH

Now that the CMSDK APB watchdog uses its Clock input, it will
correctly respond when the system clock frequency is changed using
the RCC register on in the Stellaris board system registers.  Test
that when the RCC register is written it causes the watchdog timer to
change speed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-22-peter.maydell@linaro.org
---
 tests/qtest/cmsdk-apb-watchdog-test.c | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-apb-watchdog-test.c
index 950f64c527b..2710cb17b86 100644
--- a/tests/qtest/cmsdk-apb-watchdog-test.c
+++ b/tests/qtest/cmsdk-apb-watchdog-test.c
@@ -15,6 +15,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "libqtest-single.h"
 
 /*
@@ -31,6 +32,11 @@
 #define WDOGMIS 0x14
 #define WDOGLOCK 0xc00
 
+#define SSYS_BASE 0x400fe000
+#define RCC 0x60
+#define SYSDIV_SHIFT 23
+#define SYSDIV_LENGTH 4
+
 static void test_watchdog(void)
 {
     g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
@@ -61,6 +67,50 @@ static void test_watchdog(void)
     g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
 }
 
+static void test_clock_change(void)
+{
+    uint32_t rcc;
+
+    /*
+     * Test that writing to the stellaris board's RCC register to
+     * change the system clock frequency causes the watchdog
+     * to change the speed it counts at.
+     */
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+
+    writel(WDOG_BASE + WDOGCONTROL, 1);
+    writel(WDOG_BASE + WDOGLOAD, 1000);
+
+    /* Step to just past the 500th tick */
+    clock_step(80 * 500 + 1);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
+
+    /* Rewrite RCC.SYSDIV from 16 to 8, so the clock is now 40ns per tick */
+    rcc = readl(SSYS_BASE + RCC);
+    g_assert_cmpuint(extract32(rcc, SYSDIV_SHIFT, SYSDIV_LENGTH), ==, 0xf);
+    rcc = deposit32(rcc, SYSDIV_SHIFT, SYSDIV_LENGTH, 7);
+    writel(SSYS_BASE + RCC, rcc);
+
+    /* Just past the 1000th tick: timer should have fired */
+    clock_step(40 * 500);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
+
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 0);
+
+    /* VALUE reloads at following tick */
+    clock_step(41);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
+
+    /* Writing any value to WDOGINTCLR clears the interrupt and reloads */
+    clock_step(40 * 500);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
+    writel(WDOG_BASE + WDOGINTCLR, 0);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+}
+
 int main(int argc, char **argv)
 {
     int r;
@@ -70,6 +120,8 @@ int main(int argc, char **argv)
     qtest_start("-machine lm3s811evb");
 
     qtest_add_func("/cmsdk-apb-watchdog/watchdog", test_watchdog);
+    qtest_add_func("/cmsdk-apb-watchdog/watchdog_clock_change",
+                   test_clock_change);
 
     r = g_test_run();
 
-- 
2.20.1

