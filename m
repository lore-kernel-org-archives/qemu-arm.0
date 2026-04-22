Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7447AF9B608
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:18:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUep-0007Ie-VP; Wed, 22 Apr 2026 06:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUeM-0006ys-6n
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:17:43 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUeD-0002MV-Qd
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:17:41 -0400
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso41270575e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776853045; x=1777457845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v9TGxTsXQ4q7KQiokEaw8AGBMMJRUq1ldJ+z5GAXPms=;
 b=TzAuik/PUnqDFYwFHFKKGIETYkLHGw1i072RRMtsvIBNcZLzdJ1gG6Tn/nQl1OR7o0
 1K6jebO9egLjsQBpq0Iu4pV7XnVyEPqOoQ/S4tYzC9V9iH/bIe+ajeXhEMbuLY8BL/FL
 G87EQgK6Q0TKC6X8MpMC4FNlaWaA+OAJW9ewMQOAn6k1piIP5sYLjjsu9yg8saQc5FvE
 J8VgStHzfS9MvYnhQJydMsXzY5UM4fD/OM/hjNqHwuyed4JACPOnoPHb/OPi8M92vAz/
 NxnCdstKjdsgiWPxE+byHsR0VHy1ept2IarBYteygDE7HLe7iRjsxi6TeIXet1rzEz+W
 PHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776853045; x=1777457845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v9TGxTsXQ4q7KQiokEaw8AGBMMJRUq1ldJ+z5GAXPms=;
 b=Y377MrwjTGAbdS9LB+3F9WbRr6AV+WpPJ7o86DR4iFLba6EXlDLIQmemyH26fy09oD
 mtzGv7FkEJp2dYkdK0e8ZEv2g4akGF3HYspYzBu6cdv1Q3I9UXSr1+ndjoZ/lva/c6Hy
 wPFt6A8fxnAQTdJB6eZJv5mCKnIbtHcMd4MBNiaHVgaJ9JxogGV7bgsoZ1u4nwuyvie0
 9tsoglh7AgvCIIq9HoxR15r6YVoyr3kdmX0LUgnJmdeMvdmtYu32iWDjxprkDP0bvlF2
 tSpZ5P5GIjNaoiHrnEVhku3ha26er38DbJbAJNgfDqEu1fIpq31gYc4ukjdOyiQyhq83
 10nA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+X3jqr900Jlrllwq/CqdLQZCa6OLglfViuDqajBt7iIlci4GQIr209bhZr0gD5MY1ZiSnO8eWcog==@nongnu.org
X-Gm-Message-State: AOJu0YxD450SoyNLtjFE+m01/VyhUU1ZWmmYMt8GmA62aZXlRJ9id1Pl
 rP4jmAcQYx2VV8xZCclq1VIUm3Zw1sa57j7v90gv2Hqt9F7puZwaLa9JaX+4XGYCCxQ=
X-Gm-Gg: AeBDieuF0qdZ5PplvDJVoYc9LhTfxzOOHxT60oQLSSuKgoVm9dYAkDj3QoQMUwqbZVf
 5b8np/RaxJXVLB8YXd/0LzIX3Z1xjG37sQ6Lptz0HSmg8Nym6nwuyNh++iBUpHbig7PzZ9Uv+NS
 q+Zmbp/MM6HBbpJHAaNh+AhW1HJfWlZAuuuDZVNN5ZcXgqJQEOq20RT8tvLQkPYCGrNyNDC7VVd
 bOAtmMra0IQyR6EfM7S/eawnSDRnyMRZ1wMMY4oEO7Cez+VZyCtwOgY8faCNkfpwnXKteSpUxTP
 FKRkIytxGBvfra03KJxVrZ2eQg6+M3lXNR9jdR8FcluYJ183Us7eEcM1c6K7D/PnvoYKDE46niy
 X26UF54vFiAN6OSr49KevMM2v4o5bx/HP6g+4VonJvHNpfIAOcAuEZFXoRCiaZAPbbpQZuQn1WB
 tEjji5mZAD7uapqgxx6OePsfIviH0IGDT5rA==
X-Received: by 2002:a05:600c:a31a:b0:488:b239:77ec with SMTP id
 5b1f17b1804b1-488fb778db4mr234699655e9.17.1776853045332; 
 Wed, 22 Apr 2026 03:17:25 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a55dc9f58sm266229045e9.6.2026.04.22.03.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:17:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 06F3C617D8;
 Wed, 22 Apr 2026 11:10:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 31/31] target/arm: implement WFET
Date: Wed, 22 Apr 2026 11:10:42 +0100
Message-ID: <20260422101043.1234229-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
v2
  - fix exception syndrome by using enum value
  - use env->halt_reason
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
index 030209360e8..0c7f069a369 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -607,6 +607,86 @@ void HELPER(wfe)(CPUARMState *env)
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
+    if (env->event_register) {
+        env->event_register = false;
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
+        raise_exception(env, excp, syn_wfx(1, 0xe, rd, true, WFET, false), target_el);
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
+        timer_mod(cpu->wfxt_timer, next_event);
+    } else {
+        if (nexttick == INT64_MAX) {
+            timer_mod_ns(cpu->wfxt_timer, INT64_MAX);
+        } else {
+            timer_mod(cpu->wfxt_timer, nexttick);
+        }
+    }
+
+    env->halt_reason = HALT_WFE;
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
index a1b0cc9508e..19e00573979 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2093,14 +2093,15 @@ static bool trans_WFET(DisasContext *s, arg_WFET *a)
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


