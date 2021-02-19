Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9076221lfc;
        Fri, 19 Feb 2021 06:46:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRVW1U1glSJLm3ib79VSBZpxbiwtQqTxgHcLxagsUBtFVcOSe5y0TWKaCnbYqpO0QB23n7
X-Received: by 2002:a25:cbcb:: with SMTP id b194mr14694879ybg.174.1613746014473;
        Fri, 19 Feb 2021 06:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613746014; cv=none;
        d=google.com; s=arc-20160816;
        b=SQoqPt5VtH6uggXI8YgJKgqRmOXEOdI12qB59v4NS+FoS0DRXgV7+0idZNsOYVRFvL
         UJGj6WWnb/EVmJ2KMXLVapcBBGipxFvath1TYZTail5pLDUTTSL9z5Jnlsa8fNyQu2bH
         1PnE9MMVBCKGgdv28KNIoZHxjAj0hABtNkijh41NsxGTc3AsuzQOrmyx9YNux5BIHtQ1
         +xqA4CqQBD0/0myhs/4YUQGi3z/qEz3BtmtXHrR2+rfzAJyftObWVVrz5whttKbLTT+0
         NGFmlazezkZzW+K0BfjNH5icmSb6L9uSRnlPNc9Qezf0noqPpMf/bBhtjJgqHTsjh6kg
         R0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=X3f+n7+0c+b3Y+gX92OT7kIrAKPQDQz8ayoCWLv3PMg=;
        b=c0SZfmuESGg5hsQ+9YbWEEmT1dPCh1wJd036Xx4HYK2I1MG+ZgUFqRz5eTbqTMImIs
         iX0G/GH/8/SNza3146jI/oX3oQ6eFhLcAWnsBzzf7cTxUvJtx4c2Hi/FqYfh2gyIqm0R
         lNpFY93HOt4y92NQGOp2XMDv+ZuySJFqRHN9W9XLc+qqdnUgOSUGjVTqZqN4Wc90Niok
         xm5AkbrSczNpF5PZYnujP8HHqpsEncN+RpDZZImPk0St9e8X7G33rCS4WBf35osrhep6
         ObL2UvrgPE0aFWwUYTNRlZB8MviGaNrfORWVeLmF9X2RKC3UgUob94jR+iCHYBB2Sx9A
         hDhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VWB/DUuy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 69si8732129ybc.31.2021.02.19.06.46.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 06:46:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VWB/DUuy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD73V-0001wy-Qs
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 09:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD739-0001vr-R2
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:46:31 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD731-0003M5-SE
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:46:31 -0500
Received: by mail-wm1-x32d.google.com with SMTP id x16so7274657wmk.3
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X3f+n7+0c+b3Y+gX92OT7kIrAKPQDQz8ayoCWLv3PMg=;
 b=VWB/DUuyb0tBp9brES9dBytt3JuUlkTTvflMsghe8zbXYK/KDWXG/5dcW9ZLni+d6J
 p1+7liCbj+lUPfEYHczHGfDPeEUydDqzjtBd4Ysmdaj/hkeaVR5eZSbyuBWMeqsd9OMA
 Wu8HT4/8xfejbdong1R7gmLS/crm8EsjQwwYwulI2akcdZdQ/bFh+UtygqV2vt8CrKjP
 9R1zoCOpuavFzGrCxwNEz2vDLJuwnJnrekTE/pyOrBjQ2AxiTxwOSvq9xVP9I/cqjXcq
 IIKYgYm3MezguXA90cLT1Dxbps0tbAQMh3621omaiFtQJX1MHb1jukkNKvEfvrkWEJdQ
 DEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X3f+n7+0c+b3Y+gX92OT7kIrAKPQDQz8ayoCWLv3PMg=;
 b=AapppNiopyi+Wil7oxL9fnsQU/bDiOpOr8bv5a5F1M62hWg4AwJcUfUNTTo7rDT4za
 uQDn1RUCp4PsVJABd2FsjkRppDa6OWlQN5ipOs4NzpwjYK0uz7C3865O+obZ8raFnZZv
 X7nJC6h9n2C4oYUDDDxK/7e92METUtWCQSE5Pu/8c414KcOGVyk9mkSNT3/obWk/WyTP
 s0AFSoE37+fPmD9ihIa0L6NG5yCIFwQZwo0fhTW3uSRKD/4W4yWi7oGnDwruuZAnHguU
 7VKa3dIEtfRO2B5WTOo+WNytgr6YqedXyCuyzul6QXk65lSGFR55/xCf1+5+R9ub0gWX
 CH0A==
X-Gm-Message-State: AOAM532I7NYn2wGzjIQtZkT1zQavMWdIXx+EB3D1KSTRfs7dzDlMciB8
 nyeN0C7VtZPesppE+rA94xbLh3rCVBrueA==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr8582384wml.100.1613745982137; 
 Fri, 19 Feb 2021 06:46:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/44] clock: Add ClockPreUpdate callback event type
Date: Fri, 19 Feb 2021 14:45:35 +0000
Message-Id: <20210219144617.4782-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IiWDpapLnXNZ

Add a new callback event type ClockPreUpdate, which is called on
period changes before the period is updated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/devel/clocks.rst | 9 ++++++++-
 include/hw/clock.h    | 1 +
 hw/core/clock.c       | 3 +++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index cd344e3fe5d..f0391e76b4f 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -181,7 +181,14 @@ events.
 
 The events currently supported are:
 
- * ``ClockUpdate`` : called after the input clock's period has changed
+ * ``ClockPreUpdate`` : called when the input clock's period is about to
+   update. This is useful if the device needs to do some action for
+   which it needs to know the old value of the clock period. During
+   this callback, Clock API functions like ``clock_get()`` or
+   ``clock_ticks_to_ns()`` will use the old period.
+ * ``ClockUpdate`` : called after the input clock's period has changed.
+   During this callback, Clock API functions like ``clock_ticks_to_ns()``
+   will use the new period.
 
 Note that a clock only has one callback: it is not possible to register
 different functions for different events. You must register a single
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 282a37f7c5a..2ba44e14424 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -30,6 +30,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
  */
 typedef enum ClockEvent {
     ClockUpdate = 1, /* Clock period has just updated */
+    ClockPreUpdate = 2, /* Clock period is about to update */
 } ClockEvent;
 
 typedef void ClockCallback(void *opaque, ClockEvent event);
diff --git a/hw/core/clock.c b/hw/core/clock.c
index 4479eff145b..fc5a99683f8 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -81,6 +81,9 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
 
     QLIST_FOREACH(child, &clk->children, sibling) {
         if (child->period != clk->period) {
+            if (call_callbacks) {
+                clock_call_callback(child, ClockPreUpdate);
+            }
             child->period = clk->period;
             trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
                                CLOCK_PERIOD_TO_HZ(clk->period),
-- 
2.20.1

