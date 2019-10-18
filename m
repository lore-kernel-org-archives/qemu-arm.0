Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp996758wrm;
        Fri, 18 Oct 2019 07:32:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwfp3xQn9HUk0q6FG7x0BFVY8dJH/R53Y7pFeklUqNIltKV1Ilh72VB6a9OokcgOxv6cSAm
X-Received: by 2002:aa7:d756:: with SMTP id a22mr9993437eds.198.1571409140601;
        Fri, 18 Oct 2019 07:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571409140; cv=none;
        d=google.com; s=arc-20160816;
        b=PLTAZk8q1/06W0hIoRq7a1CN1/oHsAatZf/D56cB9pVMD0iQwJgiBwwmUg9REZt5tq
         Nf3bG0G2vVPus8jakVMby/h+b2E7XDkkeVyr7Ad8/pSXR9WXiWB3biriVt6L8ktygrin
         /RSbVJXmXtMgb6Hx5M5XVEXtFtvWOgZvhMkJOsPB+OEauJ7WJbXSaFXwOQxrECTJGao0
         XOviFdPQEEa/YaB4htRl7FaZIENmDY085h2JySXJUWf8ewmoBkvqpZwHNerlZuMboH9I
         Sr7US6PvzfHnYLB+61UayaZDUPoJeX6GedM1GYlMEn31zM4iDe84KrLFfsF64wpjo9xg
         5ynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=M/re3SutNLZ5EZ1/qaqbg2V+z7g6WDXA7WOt1KwyO2M=;
        b=DO+SzBxDg4l1CTYt58SBI6UJvBiqUvNpefax3YJ4h+lRlHykcAv0Y0MKwldyY0yo+7
         fUI5u06/ym6H+LJScWzQ01H/o0ywvqtaulnLK5+XKcI6QYIslbrKNtMpm2u4EeQl7w+X
         5DaS/r29HRDhprINIOXxORnJNX2PPj8/krH8g35qt3rK1V4UvIJW0Cm6/f7KMa+FE0+q
         YMqSg/bKRG9nLrtBi2G7LxUkwO7emkrQVKfPnSNTpSdo28LMrAT67YRf2Dp2Zpqa8Z1m
         27FlJvxExQ8RVQrDUSZtWj5NlSVgg3BhRqWBQca5wfgh8BXyZ1yuujoKvXLjTY8/YnpB
         ZZGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E3evIrKV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si3612690ejb.54.2019.10.18.07.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 07:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E3evIrKV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLTIg-0000C2-SN
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 10:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33432)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLTIJ-0000BC-36
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:31:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLTIH-0002iO-Ql
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:31:55 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39636)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLTIH-0002gm-Jm
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:31:53 -0400
Received: by mail-wr1-x442.google.com with SMTP id r3so6528529wrj.6
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M/re3SutNLZ5EZ1/qaqbg2V+z7g6WDXA7WOt1KwyO2M=;
 b=E3evIrKVfb6VrDkAdbWiUVhX3s2jIKvEViOPVwEssmNHw6sfxVOFYEpVasdjy+Br0X
 itZen4j1ZzInbcWg1zkoO6gdOaiO918AXKi4bBC4YCFA/ooPd3hLsoTdtRDttKdSA+aj
 O3HzOfiOEfHdrbzqiTwfS2WxEgIc7FWZjFnvjI5HSyfHl05x+D8cO/sntPG/Hkc2CQQE
 hUiyS73w/YTLENmo3hz0zDZ+KSUvYXA6JMcT28UONktKbAnErs+v6QHUmNiclznDlLSc
 2TxhjIgUROg7cNdwKTJcgUpbETg686qFvuTtzGyKILibtc9t7zC8OPm/rs3tbzxV6IpD
 NowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M/re3SutNLZ5EZ1/qaqbg2V+z7g6WDXA7WOt1KwyO2M=;
 b=FN8ubVub5XUbb2lhrOG5J+eWgI+fwcmChKReqIj9cCN2ZBZxkUOHRWkfG+vyUFvksN
 hRh9P6xcOFgXn5lVOe0RNDS7onrSOTpIj3a0pw6gdWuIaX3LWgv766jMBGzcOX7bTvEc
 6sLYkCWX9u8TqqoE9uzBT+JutI8EYN0FLP+9s+ngnW/1aTH/uZWUKRo3Lofw0NiVzZ12
 BS4kZzj2prLPvkYXo34ZDjmm0eDBOzm56QJJsgJEHQjShRewzhy9eoqdxLu0RetyGq0T
 ea+cgL49oBrz1iuaLGC6uhcWaMpq+Gm09D++T9j+oxHwHGJFJbcoMG1smn4BAaOdgjcE
 SyKg==
X-Gm-Message-State: APjAAAW3F9IN26FSwDV1WCWLngc/zTOJBWD/fLGMAaAwBHeoC8gCQXAW
 Ju8gOarNjD0b0ibUEDIGaEUpaspV1Gx6ww==
X-Received: by 2002:adf:e8c6:: with SMTP id k6mr8170164wrn.78.1571409111850;
 Fri, 18 Oct 2019 07:31:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm5537915wma.15.2019.10.18.07.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 07:31:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/timer/exynos4210_mct: Initialize ptimer before starting it
Date: Fri, 18 Oct 2019 15:31:49 +0100
Message-Id: <20191018143149.9216-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C7kEPmv2BWxu

From: Guenter Roeck <linux@roeck-us.net>

When booting a recent Linux kernel, the qemu message "Timer with delta
zero, disabling" is seen, apparently because a ptimer is started before
being initialized.  Fix the problem by initializing the offending ptimer
before starting it.

The bug is effectively harmless in the old QEMUBH setup
because the sequence of events is:
 * the delta zero means the timer expires immediately
 * ptimer_reload() arranges for exynos4210_gfrc_event() to be called
 * ptimer_reload() notices the zero delta and disables the timer
 * later, the QEMUBH runs, and exynos4210_gfrc_event() correctly
   configures the timer and restarts it

In the new transaction based API the bug is still harmless,
but differences of when the callback function runs mean the
message is not printed any more:
 * ptimer_run() does nothing as it's inside a transaction block
 * ptimer_transaction_commit() sees it has work to do and
   calls ptimer_reload()
 * the zero delta means the timer expires immediately
 * ptimer_reload() calls exynos4210_gfrc_event() directly
 * exynos4210_gfrc_event() configures the timer
 * the delta is no longer zero so ptimer_reload() doesn't complain
   (the zero-delta test is after the trigger-callback in
   the ptimer_reload() function)

Regardless, the behaviour here was not intentional, and we should
just program the ptimer correctly to start with.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
[PMM: Expansion/clarification of the commit message:
 the message is about a zero delta, not a zero period;
 added detail to the commit message of the analysis of what
 is happening and why the kernel boots even with the message;
 added note that the message goes away with the new ptimer API]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Philippe pointed me at this bugfix from Guenter. At one point
in my working on the ptimer API changes I thought this bugfix
would be necessary as a prerequisite, but in fact the issue
was in my ptimer changes, and it just happened that fixing
the MCT bug was a workaround for my bug. Even though the
ptimer API changes actually coincidentally now suppress the
annoying message about a zero delta, the behaviour is definitely
not intentional, and since I spent the time working through the
analysis of what was actually going on here I don't want
to waste it :-)
---
 hw/timer/exynos4210_mct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 72257584145..944120aea59 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1254,7 +1254,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         /* Start FRC if transition from disabled to enabled */
         if ((value & G_TCON_TIMER_ENABLE) > (old_val &
                 G_TCON_TIMER_ENABLE)) {
-            exynos4210_gfrc_start(&s->g_timer);
+            exynos4210_gfrc_restart(s);
         }
         if ((value & G_TCON_TIMER_ENABLE) < (old_val &
                 G_TCON_TIMER_ENABLE)) {
-- 
2.20.1

