Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3408D1098783
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:17:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ZiK-0006Qw-2i; Fri, 20 Mar 2026 09:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhp-0005ui-Jr
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:05 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhm-0000LH-Ee
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:01 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b982d56dac4so10787366b.3
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774012556; x=1774617356; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KXkEIWSkkfTa0uGz005fdTwbnhJNC0icQNS5LfaBmDg=;
 b=aI6tFbfUZF+7Jdvpb2zkE0KyAMS7Vji56ePjwMEDqEDPyezLKasQWaB/0a1BHARpKT
 rDnaddlvvokKypbt4roBUcOBMWwnl9uG3hRo7WoisJu6x6AyteCvDZEMLA4AKRxMw9lS
 GOOjBwR5GBJWMWhUlw/gRHEFrYwoifhm/OAm1h4h10dcra+CN/Ib7IG+H/rmaaB6lo97
 pFhDa1JTiYVj0lV1h9pMrf4+1B7bCWm63aHry5CWaOLT9m8dXg3wo09+7dOVH2uT9VhG
 ZKTrL6HXV/+7yo9Gg7ZRLvWQVLjiY0La7z/ExTXGVsuneY+tflN0x0r9cCH+aV2K1jq3
 d/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774012556; x=1774617356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KXkEIWSkkfTa0uGz005fdTwbnhJNC0icQNS5LfaBmDg=;
 b=dwutYHoAFbNlYDFx0f+BgoGJ4mJwvQ1YR7eMWNdVdXicwWS8N6t+yQv+S/81v73VZk
 AtrSXWYeoBkBJDfCBUGzOhO/1UC5Ho9Tqm/qAp32yJBe+nU/WDeB1ZRmAhDOC1W+5bCG
 +aMiGEKSdzkbZ5UC4Ov7j67VqfRZrgtFDmSkK+iB71zyfDyUEciwWzGxTnRE2esIW3sj
 DEQDxWoGtfzwtziGvPLz3+wLi8B5EEfujkZqcjLwO+pLQGqjlKcq3MxmiHrSLI4LASRp
 /aFElQEowgkkSjq2oW3smYaj0EjlphC72Z6lJlschKRMbMbmDKpaorooVe0jYGyGqy5y
 bnDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkjyPpgRxfqxurW0g2x59BYCQKBWZH8hIXkrKqldL0c4OZcyyUwufyI0wi+nBTGYYBBNFn6NeITg==@nongnu.org
X-Gm-Message-State: AOJu0YzV+5e8zP6GULAbQYz2BigrTktdXc99ETEX71TS61JW9nRM9T1l
 6hK99nS191uxPruZaHmgktDnQLk4wTKqww2f7r60khu+OiZFXMliRo2aY+C+cuHoQw0=
X-Gm-Gg: ATEYQzzQqavdWKzXHnCgbNXWa/oYMqymaiXcCH39OQzCm7dX6B0cxVOLiu0DVeG3zSl
 v+nc0MFXWDkpcczbd3UhRBC4J0UWj4ve1Pm+I4utmsv16c1kc7H0Keqh/mTBvj7kHBR2Zt4PBfb
 N/soCTxeR83v32zhB/ayliqOx/hhQ7mOqTubb71ltZhnpMXLjQeIKYl+BizwsrCo1w9cAl+N81K
 XggY6S3dIJ2DLT8cHvcpmUyrq0RiOUqQQsDyZVxEXscRh0aCn+gCfhYCOaZ/l0kzmozABtXxgcs
 VGoBs7srQ2CvJiTDpjzPWVltEpgYNeu4+O0FNEenH5FZ7YZXTX1rDxKbzYhbNzZI0IBOOjrO4k4
 k74z3QOH4j9pD+CLKL9a33nQEpCdGzO6TKYDrEzRfHFPSq2LflArFmMKfVvozQI6rSgZNpmuGWs
 mxqCk+EJ7tckYjFYYuPmweQ1Y=
X-Received: by 2002:a17:907:1805:b0:b98:13a:c92e with SMTP id
 a640c23a62f3a-b982f20c399mr203464366b.2.1774012556337; 
 Fri, 20 Mar 2026 06:15:56 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8db2fsm163039966b.23.2026.03.20.06.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:15:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 887F55FAED;
 Fri, 20 Mar 2026 13:06:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 32/35] target/arm: implement WFET
Date: Fri, 20 Mar 2026 13:06:03 +0000
Message-ID: <20260320130607.2071996-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Now we have the event stream and SEV/SEVL implemented we can finally
enable WFET for Aarch64.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper-defs.h   |  1 +
 target/arm/tcg/op_helper.c     | 80 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c | 15 ++++---
 3 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index a05f2258f29..31ffcbc6448 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -56,6 +56,7 @@ DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
 DEF_HELPER_1(wfe, void, env)
 DEF_HELPER_2(wfit, void, env, i32)
+DEF_HELPER_2(wfet, void, env, i32)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
 DEF_HELPER_2(pre_smc, void, env, i32)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index fbe160ab70a..8b917b344c9 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -521,6 +521,86 @@ void HELPER(wfe)(CPUARMState *env)
 #endif
 }
 
+void HELPER(wfet)(CPUARMState *env, uint32_t rd)
+{
+#ifdef CONFIG_USER_ONLY
+    /*
+     * As for WFIT make it NOP here, because trying to raise EXCP_HLT
+     * would trigger an abort.
+     */
+    return;
+#else
+    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
+    uint32_t excp;
+    int target_el = check_wfx_trap(env, false, &excp);
+    /* The WFET should time out when CNTVCT_EL0 >= the specified value. */
+    uint64_t cntval = gt_get_countervalue(env);
+    uint64_t timeout = env->xregs[rd];
+    /*
+     * We want the value that we would get if we read CNTVCT_EL0 from
+     * the current exception level, so the direct_access offset, not
+     * the indirect_access one. Compare the pseudocode LocalTimeoutEvent(),
+     * which calls VirtualCounterTimer().
+     */
+    uint64_t offset = gt_direct_access_timer_offset(env, GTIMER_VIRT);
+    uint64_t cntvct = cntval - offset;
+    uint64_t nexttick;
+    int64_t next_event;
+
+    /*
+     * As for WFE if the event register is already set we can consume
+     * the event and return immediately.
+     */
+    if (env->event_register.as_bool) {
+        env->event_register.as_bool = false;
+        return;
+    }
+
+
+    if (cpu_has_work(cs) || cntvct >= timeout) {
+        /*
+         * Don't bother to go into our "low power state" if
+         * we would just wake up immediately.
+         */
+        return;
+    }
+
+    /* We might sleep, so now we check to see if we should trap */
+    if (target_el) {
+        env->pc -= 4;
+        raise_exception(env, excp, syn_wfx(1, 0xe, rd, 1, 2, false), target_el);
+    }
+
+    /*
+     * Finally work out if the timeout or event stream will kick in
+     * earlier.
+     */
+    if (uadd64_overflow(timeout, offset, &nexttick)) {
+        nexttick = UINT64_MAX;
+    }
+    if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
+        nexttick = INT64_MAX;
+    }
+
+    next_event = gt_calc_next_event_stream(env);
+    if (next_event > 0 && next_event < nexttick) {
+        cpu->waiting_for_event = true;
+        timer_mod(cpu->wfxt_timer, next_event);
+    } else {
+        if (nexttick == INT64_MAX) {
+            timer_mod_ns(cpu->wfxt_timer, INT64_MAX);
+        } else {
+            timer_mod(cpu->wfxt_timer, nexttick);
+        }
+    }
+
+    cs->exception_index = EXCP_HLT;
+    cs->halted = 1;
+    cpu_loop_exit(cs);
+#endif
+}
+
 void HELPER(yield)(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 38a51eb3600..f7d33ac2310 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2110,14 +2110,15 @@ static bool trans_WFET(DisasContext *s, arg_WFET *a)
         return false;
     }
 
-    /*
-     * We rely here on our WFE implementation being a NOP, so we
-     * don't need to do anything different to handle the WFET timeout
-     * from what trans_WFE does.
-     */
-    if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
-        s->base.is_jmp = DISAS_WFE;
+    if (s->ss_active) {
+        /* Act like a NOP under architectural singlestep */
+        return true;
     }
+
+    gen_a64_update_pc(s, 4);
+    gen_helper_wfet(tcg_env, tcg_constant_i32(a->rd));
+    /* Go back to the main loop to check for interrupts */
+    s->base.is_jmp = DISAS_EXIT;
     return true;
 }
 
-- 
2.47.3


