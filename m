Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F14DC9EC63
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:33:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFDW-0003TG-OJ; Mon, 12 Jan 2026 05:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDV-0003J2-B1
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:09 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDT-0001qB-If
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:09 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47d3ffa5f33so27985335e9.2
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213926; x=1768818726; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ql1PuMmPLOZ2kGLsYrxz6xjnEWz6/m3NR7n6L0jhmzI=;
 b=C2djm3wTKhep0bzmC3sh8uReFN4ev0ynOURdQQtJSmi1kTAOAZuyTIc4Vfdjt6lYfv
 UkAGUy+lp9Ybyk03VaiZ13eb2YkFA8BGVtYRnZARn4LXmvpUuc/1jI6rkeb4ZU7wFQ+j
 8Hg4+3fFzOlow/aOp/7zLST020kYGmJcMW1SaEZPBdQil7DOJ+mzGsrSL5XQ++yGT/ek
 Z8i3julwhYVwez5Ss3/WYks9Gt71tN6rwOc+2cK1TQTMWJS0PUIPSJr3o0BxgNgzFKTA
 pu2uWKSj5Q7GAj7+kyOJpguao4hxuxbuT20Y9FrX/VX6PkBmiXHSWzoMD4Pdc6uCJnFh
 9c1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213926; x=1768818726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ql1PuMmPLOZ2kGLsYrxz6xjnEWz6/m3NR7n6L0jhmzI=;
 b=UUgywX2JGFzsqOQMea69MNdwjf56lmAdCDO/A0k69yt6ZpJ662TD2jt/lEGNIvesqm
 MKVK46lXBLdFR+IdIhpMDKP0do6Vy1RZAFup+J2/wb531a3VPdxRNMeKSjTo4/bpRueh
 q56+KUHwAft5P3PEbWitCPJC5gu5aDRwMcTFeIzYz96vVnmoIpzK4IXd+8dVgklBCjqy
 5X8ca4o8sq8adnhRZQ7YcyMq0bRGs2j/lmSJU+USzt+47GROszn9x6B+hJXS+DNJpKOZ
 4M93eSbCf8WHxsK3nKu9PZ+kKfM7z3j8FJDT7agolS62hMAjwhpEW+2z5Mb84cQnoJ+H
 vTqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSGdidwdC6o1osQHlmrpjDt/HMrm+iPmxPKUXId9/Z1FNNhd0DAbmm2chKUnq2nugzDQEZkcOXVA==@nongnu.org
X-Gm-Message-State: AOJu0YxWZix9OVbMvy75q3NlqaoFyZuN6Sx8sgJ7/lYpaKV/+5Obi7LD
 6scOTuag/wk0qjw9IUzlJ+DXQ76pMJNtH+c94W1VnUvKP3y1uN9FMT13neaoloh1gPc=
X-Gm-Gg: AY/fxX7w/Syv3gMUUIl/bNK9DMeI3peCoc4RrT5Ap0dg72FYIjd+BFOiZpryN46us+p
 8Lc/f5WtkZzpm8LZctsmudncO5g1tMO2GlAU+z6+IruRce2dFJkgEdtgmcj6gwzBOxthLD3kwzR
 d8coQsks/pck2f5adMZbWVBF8OpuFAkj0ypRNJqOldJFVpgGY69/3JfXeGxRr/ExIDreK4BtpSu
 hTUzyh5sgchu3CUpG6HpzSlXfVUBlcQDAYZEx3pCPaGHitPfdYTzE3U51N1/zA6kkvFiMsW5YzF
 psllnhXskvUmOsg1D2X/av01cQPhkMlzucNZhCyxm7FMr4L+PyTAm0OC8msZK/iimf1gedoPH0W
 z6/S/9h6l+4okSA/qL5BY1a0YU00xVfcPzSvs+yjtcuMkf+er7LRYAP2j0ah60aYwEesoFePewe
 hgwrA5QqLPujZnjMZSylP2c1oxO8NBNGAe0ID1MvGD8/YApNkReHGDQu29QWGg
X-Google-Smtp-Source: AGHT+IGr/ALfC+F/tIF1ShEzZoVdxM8gChV5FVpBxUkWfmb6ftyZiWHpg/DvqmnwzrfDBTAxn475QA==
X-Received: by 2002:a05:600c:8506:b0:477:9fcf:3ff9 with SMTP id
 5b1f17b1804b1-47d84b5b4a5mr161131205e9.27.1768213926031; 
 Mon, 12 Jan 2026 02:32:06 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f418538sm347922405e9.5.2026.01.12.02.32.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:32:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 13/19] accel/hvf: Implement WFI without using pselect()
Date: Mon, 12 Jan 2026 11:30:27 +0100
Message-ID: <20260112103034.65310-14-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Return to the main loop where we'll be waken again.
This avoid a tricky race with signals introduced in
commit 219c101fa7f ("Add HVF WFI handler").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 include/system/hvf_int.h  |  1 -
 accel/hvf/hvf-accel-ops.c |  2 --
 target/arm/hvf/hvf.c      | 74 +++------------------------------------
 3 files changed, 5 insertions(+), 72 deletions(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index d842d4b2b99..c8e407a1463 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -47,7 +47,6 @@ struct AccelCPUState {
 #ifdef __aarch64__
     hv_vcpu_exit_t *exit;
     bool vtimer_masked;
-    sigset_t unblock_ipi_mask;
     bool guest_debug_enabled;
 #endif
 };
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index d931412975c..ffcfe9663b5 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -135,8 +135,6 @@ static int hvf_init_vcpu(CPUState *cpu)
     sigaction(SIG_IPI, &sigact, NULL);
 
 #ifdef __aarch64__
-    pthread_sigmask(SIG_BLOCK, NULL, &cpu->accel->unblock_ipi_mask);
-    sigdelset(&cpu->accel->unblock_ipi_mask, SIG_IPI);
     cpu->accel->guest_debug_enabled = false;
 
     r = hv_vcpu_create(&cpu->accel->fd,
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index d74703a3d55..b936098d257 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -301,7 +301,7 @@ void hvf_arm_init_debug(void)
 #define TMR_CTL_IMASK   (1 << 1)
 #define TMR_CTL_ISTATUS (1 << 2)
 
-static void hvf_wfi(CPUState *cpu);
+static int hvf_wfi(CPUState *cpu);
 
 static uint32_t chosen_ipa_bit_size;
 
@@ -1703,81 +1703,17 @@ static uint64_t hvf_vtimer_val_raw(void)
     return mach_absolute_time() - hvf_state->vtimer_offset;
 }
 
-static uint64_t hvf_vtimer_val(void)
+static int hvf_wfi(CPUState *cpu)
 {
-    if (!runstate_is_running()) {
-        /* VM is paused, the vtimer value is in vtimer.vtimer_val */
-        return vtimer.vtimer_val;
-    }
-
-    return hvf_vtimer_val_raw();
-}
-
-static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
-{
-    /*
-     * Use pselect to sleep so that other threads can IPI us while we're
-     * sleeping.
-     */
-    qatomic_set_mb(&cpu->thread_kicked, false);
-    bql_unlock();
-    pselect(0, 0, 0, 0, ts, &cpu->accel->unblock_ipi_mask);
-    bql_lock();
-}
-
-static void hvf_wfi(CPUState *cpu)
-{
-    ARMCPU *arm_cpu = ARM_CPU(cpu);
-    struct timespec ts;
-    hv_return_t r;
-    uint64_t ctl;
-    uint64_t cval;
-    int64_t ticks_to_sleep;
-    uint64_t seconds;
-    uint64_t nanos;
-    uint32_t cntfrq;
-
     if (cpu_has_work(cpu)) {
         /*
          * Don't bother to go into our "low power state" if
          * we would just wake up immediately.
          */
-        return;
+        return 0;
     }
 
-    r = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
-    assert_hvf_ok(r);
-
-    if (!(ctl & 1) || (ctl & 2)) {
-        /* Timer disabled or masked, just wait for an IPI. */
-        hvf_wait_for_ipi(cpu, NULL);
-        return;
-    }
-
-    r = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
-    assert_hvf_ok(r);
-
-    ticks_to_sleep = cval - hvf_vtimer_val();
-    if (ticks_to_sleep < 0) {
-        return;
-    }
-
-    cntfrq = gt_cntfrq_period_ns(arm_cpu);
-    seconds = muldiv64(ticks_to_sleep, cntfrq, NANOSECONDS_PER_SECOND);
-    ticks_to_sleep -= muldiv64(seconds, NANOSECONDS_PER_SECOND, cntfrq);
-    nanos = ticks_to_sleep * cntfrq;
-
-    /*
-     * Don't sleep for less than the time a context switch would take,
-     * so that we can satisfy fast timer requests on the same CPU.
-     * Measurements on M1 show the sweet spot to be ~2ms.
-     */
-    if (!seconds && nanos < (2 * SCALE_MS)) {
-        return;
-    }
-
-    ts = (struct timespec) { seconds, nanos };
-    hvf_wait_for_ipi(cpu, &ts);
+    return EXCP_HLT;
 }
 
 /* Must be called by the owning thread */
@@ -1967,7 +1903,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
     case EC_WFX_TRAP:
         advance_pc = true;
         if (!(syndrome & WFX_IS_WFE)) {
-            hvf_wfi(cpu);
+            ret = hvf_wfi(cpu);
         }
         break;
     case EC_AA64_HVC:
-- 
2.52.0


