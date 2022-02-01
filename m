Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp768908lfk;
        Tue, 1 Feb 2022 14:44:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYqFvLzQAOv8ZrCW1U0nYtS462Secj2QNE9FDVc7bYbIfmTg+spJx23IOK8qDeFmzRSzGn
X-Received: by 2002:a25:c285:: with SMTP id s127mr29690417ybf.36.1643755478942;
        Tue, 01 Feb 2022 14:44:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643755478; cv=none;
        d=google.com; s=arc-20160816;
        b=nVNKWyXMnKkjEnQ1yokjfBiTjk1hcU1lQ/JILp9P/f9DuxaDqcZNV0yb7SlM6d8XHv
         DioD+zUIgmZ6XUyaPcE/JCBV/fUCKXbE/q0WWbEB3dQ1Svj9N18aeFcrp543rx1/H+FD
         jh5WScBWtfGJYT1vj6LWAwxa71md0CTOKL9OFZ4KIM3kztUbu/5g9fk8m4ZPOpzprSLG
         Ht0GtIOuaeVrhKVmS06ChfuodB0FhIclTSbGCdTKlGT1vonOAUX8rAgQVokF3ZBoeoxy
         r2+GIuwTvdQny6Zh6sTkEuk5cFllhSImHykLH1zdOB3MJxvzyxPTvdn6KrL3hpzte7aB
         EL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=5pW5hH+xYA8EmMHvu99M6jKraN0jTDjrufkxXyswi6c=;
        b=h4v/1UX/SiPjutV1V86PKRG/7zeDg8VtXMrIoEF5Qtt3XIyiKaVPQ5nKLtkMDanDuG
         u0pfD3gbvIWBVnBSktDR/RzmZPNyh5Yd8omqJDGN46GiA4smolM3wGXjPEt7d8/SM0xb
         2HVZUeCBElQE4a4Ilxuvft+yzmRDurOGYJT0BRf2JAYn3NyHoOaruUXRWck6Ltk8Y3+w
         Mo0mM1WXzgo9JbIPb/rdNybjbtu+0UMOqcaZYwfGkBSoEVtwmH6USYK8x/W1ybecvpPx
         aitOiS4ZPVDWI8DsfG6yRBLvgTefr8XgONANRVA2MecswZ3NLqfJOltKbwoGiEUJVZmc
         uXGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si36955712ybc.691.2022.02.01.14.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Feb 2022 14:44:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nF1t7-0001q4-VF
	for alex.bennee@linaro.org; Tue, 01 Feb 2022 17:44:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@rpls.de>) id 1nEypD-0008Rd-Vg
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:28:23 -0500
Received: from dia.uberspace.de ([185.26.156.221]:43288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@rpls.de>) id 1nEypA-0001r4-I4
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:28:23 -0500
Received: (qmail 21045 invoked by uid 989); 1 Feb 2022 19:28:10 -0000
Authentication-Results: dia.uberspace.de;
	auth=pass (plain)
From: Richard Petri <git@rpls.de>
To: 
Subject: [PATCH] hw/timer/armv7m_systick: Update clock source before enabling
 timer
Date: Tue,  1 Feb 2022 20:26:51 +0100
Message-Id: <20220201192650.289584-1-git@rpls.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: +
X-Rspamd-Report: R_MISSING_CHARSET(0.5) MIME_GOOD(-0.1) MID_CONTAINS_FROM(1)
 BAYES_HAM(-0.038591)
X-Rspamd-Score: 1.361408
Received: from unknown (HELO unkown) (::1)
 by dia.uberspace.de (Haraka/2.8.28) with ESMTPSA;
 Tue, 01 Feb 2022 20:28:10 +0100
Received-SPF: pass client-ip=185.26.156.221; envelope-from=git@rpls.de;
 helo=dia.uberspace.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 01 Feb 2022 17:05:16 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Richard Petri <git@rpls.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M888CHywoPRP

Starting the SysTick timer and changing the clock source a the same time
will result in an error, if the previous clock period was zero. For exmaple,
on the mps2-tz platforms, no refclk is present. Right after reset, the
configured ptimer period is zero, and trying to enabling it will turn it off
right away. E.g., code running on the platform setting

    SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;

should change the clock source and enable the timer on real hardware, but
resulted in an error in qemu.

Signed-off-by: Richard Petri <git@rpls.de>
---
 hw/timer/armv7m_systick.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 3bd951dd04..5dfe39afe3 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -149,6 +149,10 @@ static MemTxResult systick_write(void *opaque, hwaddr addr,
         s->control &= 0xfffffff8;
         s->control |= value & 7;
 
+        if ((oldval ^ value) & SYSTICK_CLKSOURCE) {
+            systick_set_period_from_clock(s);
+        }
+
         if ((oldval ^ value) & SYSTICK_ENABLE) {
             if (value & SYSTICK_ENABLE) {
                 ptimer_run(s->ptimer, 0);
@@ -156,10 +160,6 @@ static MemTxResult systick_write(void *opaque, hwaddr addr,
                 ptimer_stop(s->ptimer);
             }
         }
-
-        if ((oldval ^ value) & SYSTICK_CLKSOURCE) {
-            systick_set_period_from_clock(s);
-        }
         ptimer_transaction_commit(s->ptimer);
         break;
     }
-- 
2.35.1

