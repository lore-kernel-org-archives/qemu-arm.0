Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3360563njc;
        Wed, 24 Jul 2024 15:07:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcnE3BVAVDN3n5HMZOhAo9/PmuNEYMv0Bn1digKDEfPnpQ0Ym0DwZIElEoojPt3Z53STjGWJVxoWeeo+fvbuUzOi6OmRwi
X-Google-Smtp-Source: AGHT+IEd39fVLcFujrS+WZcOCMj2wRLFlRAxz5eR15JZlzy4tcZA4emQi/fgqKlTnyuR5hVqRCOU
X-Received: by 2002:a05:622a:1885:b0:445:e9:e67b with SMTP id d75a77b69052e-44fe32a01edmr20637471cf.23.1721858823910;
        Wed, 24 Jul 2024 15:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721858823; cv=none;
        d=google.com; s=arc-20160816;
        b=SHYF5X5n7WyHjlTqDQP6k9KR2y0/cq9rqvO3LcMuAJSxfPFzolLzx/03BmGoouoHRv
         GHcNI35OEechy8dOkRug/JKcFkqP+povdO4Zh0ZqjfEuxGKATBofm5LksXIPaUatbezl
         TzNMDuDCfrp6+WLA7jNjDnuS5k29FWCnD/aGJH0m1nJ4p86SXmEzNh+twtO6l+fstDzC
         z6295iEYL8VCtEmg2SxaXDCqGdiCJPNhqaNBrksiTQsTL5UJVOQqT0fhmXJt9qthk4MA
         nGzESr9Cffq1/Jnrhg9W17Q106Qn3z3pj29fTpkp5GWpXgZWZzeUGMgTiAqdy64QhKmh
         4AVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Fc1iffmEOa89zbsiVdbsLtEsb0Kc5g9RfeOgTm7uMho=;
        fh=FcSRbNuBfYK6CJcbg+J/WX0MwKl6sHaB8J4Tc2s1T6Q=;
        b=Gkzm8oeGoPEg4XjH+HT+Vm59dGlvp901LRMPeqZsnI/l4SZSxEcuuvPq7VMT9dLMXV
         k1yLaSCCqStUpkS5mWpF0ECkF3WKoeEryFzg5KneYstzWIZqgINYYsi3qAjLyZos5M29
         yt+cwv0F6L2M+0wR5yFOKZbyZ7MF/dz9Jc7ybhBd5QxX+mKSNtt+t/Cq1VpNU2tylpbS
         vy80QN9p1uSAzt/ZnH4Cc96pDkiuvFBmZIhm+bVcCzieQrf0KBmudPiQjR1PeDmuPdRM
         Z6MrBpEYHX3+MOHJxticnCErXQ4iPFIxhEliFETQTpEe9gPBbOM2pJfE4wMzJqkVEXZ6
         86Lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=Eah7PvgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe840851bsi1142111cf.491.2024.07.24.15.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 15:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=Eah7PvgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWk89-0001AA-BE; Wed, 24 Jul 2024 18:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk81-0000dp-Ca
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:34 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7y-0006cy-OT
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:32 -0400
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-39a14247eddso4492855ab.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 15:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721858789; x=1722463589;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fc1iffmEOa89zbsiVdbsLtEsb0Kc5g9RfeOgTm7uMho=;
 b=Eah7PvgJ9L5+MbPzgxGgfSChOJ1sAeZuYPsHl3ReguNbhkxAlJ4ElwsV2oPM5Ep+vH
 gPCTHsH1hW0XqDbE4JDf1UVls/oKNtr2f6RgJgo6Ruuw5egKWtBeI3Eu5TvwnsAS+b1S
 hMXyWY86toqg27zozf7f02O8kWmMH7FYrkohzC7ghnIcQJm3Qm0lWl1Gvr4gbvEtFGbe
 gbjN414ZHo4B17BSjFM223RYaQVHeCv/F2o8EQW6MfP/z+njPEhIjt9XHm2IYSMaedSp
 uPxMuOIM8R6VU70rNUg7FzCKoGETfeF6Mjl/ONmwhAQ8aDa1W2txBONihqa1baDGxmTv
 M+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721858789; x=1722463589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fc1iffmEOa89zbsiVdbsLtEsb0Kc5g9RfeOgTm7uMho=;
 b=HVo2aPPsL/B2xKCnry8QiuwREnwgYfcjF3IcunHLquEeNccLiLUx4iiwSBMBiQd+Fz
 uB6+n9K+o+KkAnWEiMv7pK6/q368OXJFwl+8q18kT4j1Jg6+jTc3FKiA2ANURqA+cp6a
 WuvNP5fl23Hm7Le2BCzjxZsUuhBYLPEdlWxVOefg59Mc4/pXck3PaYwjL8LsSpVfrYVb
 k4Jo/5oJAuAgm239g1/V000PmJaQ3lExapOTDt6RibqY07iUg5zS/vtaQfLPhfwSehAS
 HepXe2JltIkkY328zjXUkcNhbzbZEHG/XAj9JW1KyqQLQvmL+ktQuEnaIgHY0WF+otgK
 9Tug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWh38sM0iKsY6Q0xhVhEm72A2ciYXATrJfHeDnpwu47CA6d1jpwbNs7mXfPxVcXtAiaK8qZM+vB4KQ49bC2bAkAG1i
X-Gm-Message-State: AOJu0YxwJKyzSb8Gfz4jDo1r9/6oqpIl+1XnnFaruNCUaumA+CJmu106
 /46wiFghvJlAfr2MNBu/ZbpBThgrVYXV0Oh2rXld/EBQOlpNZQ5a7dvBDZNTpjo=
X-Received: by 2002:a05:6e02:12e7:b0:396:788:f4ef with SMTP id
 e9e14a558f8ab-39a1a80ef7fmr25654185ab.14.1721858789352; 
 Wed, 24 Jul 2024 15:06:29 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c29fa983f8sm10086173.47.2024.07.24.15.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 15:06:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>,
 Jessica Clarke <jrtc27@jrtc27.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/15] bsd-user: Sync fork_start/fork_end with linux-user
Date: Wed, 24 Jul 2024 16:04:44 -0600
Message-ID: <20240724220449.10398-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240724220449.10398-1-imp@bsdimp.com>
References: <20240724220449.10398-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: BssDC5JPzIrI

From: Jessica Clarke <jrtc27@jrtc27.com>

This reorders some of the calls, deduplicates code between branches and,
most importantly, fixes a double end_exclusive call in the parent that
will cause exclusive_context_count to go negative.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
Pull-Request: https://github.com/qemu-bsd-user/qemu-bsd-user/pull/52
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 82e94a03160..cc980e6f401 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -35,6 +35,7 @@
 #include "qemu/path.h"
 #include "qemu/help_option.h"
 #include "qemu/module.h"
+#include "qemu/plugin.h"
 #include "exec/exec-all.h"
 #include "user/guest-base.h"
 #include "tcg/startup.h"
@@ -103,8 +104,9 @@ unsigned long target_sgrowsiz = TARGET_SGROWSIZ; /* amount to grow stack */
 void fork_start(void)
 {
     start_exclusive();
-    cpu_list_lock();
     mmap_fork_start();
+    cpu_list_lock();
+    qemu_plugin_user_prefork_lock();
     gdbserver_fork_start();
 }
 
@@ -112,31 +114,31 @@ void fork_end(pid_t pid)
 {
     bool child = pid == 0;
 
+    qemu_plugin_user_postfork(child);
+    mmap_fork_end(child);
     if (child) {
         CPUState *cpu, *next_cpu;
         /*
-         * Child processes created by fork() only have a single thread.  Discard
-         * information about the parent threads.
+         * Child processes created by fork() only have a single thread.
+         * Discard information about the parent threads.
          */
         CPU_FOREACH_SAFE(cpu, next_cpu) {
             if (cpu != thread_cpu) {
                 QTAILQ_REMOVE_RCU(&cpus_queue, cpu, node);
             }
         }
-        mmap_fork_end(child);
-        /*
-         * qemu_init_cpu_list() takes care of reinitializing the exclusive
-         * state, so we don't need to end_exclusive() here.
-         */
         qemu_init_cpu_list();
         get_task_state(thread_cpu)->ts_tid = qemu_get_thread_id();
-        gdbserver_fork_end(thread_cpu, pid);
     } else {
-        mmap_fork_end(child);
         cpu_list_unlock();
-        gdbserver_fork_end(thread_cpu, pid);
-        end_exclusive();
     }
+    gdbserver_fork_end(thread_cpu, pid);
+    /*
+     * qemu_init_cpu_list() reinitialized the child exclusive state, but we
+     * also need to keep current_cpu consistent, so call end_exclusive() for
+     * both child and parent.
+     */
+    end_exclusive();
 }
 
 void cpu_loop(CPUArchState *env)
-- 
2.45.1

