Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDD6CCF9E3
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 13:07:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBv1m-0001RD-IK; Thu, 23 Oct 2025 09:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBv1k-0001QU-UR
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 09:06:49 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBv1h-0006Ic-9d
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 09:06:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso634645f8f.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 06:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761224803; x=1761829603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=POy1R+so3EVlSCdkiJjnl33gOSzhKoIaueGiZB1q9Rk=;
 b=o7JlLGFNtwKF9aAqUU75hRp4LgMMAu4epbaiQfDKSivwbxYmZWTlL2gJylknDcyYoT
 mIfwpbL3jcbjvE/6cYAltnyG/nEfwrhtzsJDVCBUX+L0HQNAzuhhfAHwjYpZJREWkpjv
 9V+Mj0ZjpTjMm4oyvD/hzGkFPptL2ngWYFC67vuQOKhktB2hSEnwVIWJZHKWe73RLz0+
 ziuTDBRc12ULmP7cR6xuFuhs0Fw18v1mp9m0/S0YcUv1lvg6wfu9xha+0Uj7xpYqGHg3
 uCyBgQAZwPy3icRgzpxA+dfAjEura8TEfosmBR2YSGQ3lTD4GLpG6JnlnBSrHl+xYqpY
 tffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761224803; x=1761829603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=POy1R+so3EVlSCdkiJjnl33gOSzhKoIaueGiZB1q9Rk=;
 b=rhHkBrHe400hhDBpGO/8+T+CzAbsYcHnITZyXtDq5aDnwvFq9CgG2l5IbYtaToQUZE
 oITx569tkgQcjZ7mVzatKWEFvpp2TXQLFV2LPh3AaWaV2v9b/8qxDxORK4xbeg/Y19N1
 JmKX6IT4DIpsEDCzwhXm+gm4XaLnn4GxdKyCploypagbCEwmhQvtNK/nd5Zc+USIwO68
 njB9W7qJ72vleMCR+uiXDRGzreNPu2SODtuL2vxr5vy9eXiyedSZ6unfFMHgqJVVlPQg
 KBmM0nnSD6De/2wRQshroPTL8zGFMfySScV3seeEYI7xd+uDE3+15zpNGVvW8tzFG9YU
 doiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5EyFiEX3IQM/Zo7fSR7VYRYRg30lkEUrnrW1MasKyHYXGznR+ByjVcmVRyitiGJbW0xfbmko1kg==@nongnu.org
X-Gm-Message-State: AOJu0YwSTdECSPL3lGpn3tD1wOqMlp4b/LPyjgae6RFWOpdBu5iuaMlE
 TSZs3w3Rw+wgHMdcoJb4oXrFY4dgTAUiE9e61yVtGAp61sC5g0HdFmxeCgaeq2LxzJg=
X-Gm-Gg: ASbGnctW6N50+VB5D0sqzjjWJPJ4zmic4GXLLYJt7LThteSv3vA6o38L4X/Ah5SxiAV
 yZwEGofwt3lImXWSHb2uVA67POjEkc481Lh5hZQEMskkj7NlSSu09YnmimNFuOghO88pm2dzEcN
 0dDcmuZ9F7pO5p2ik56zvUDrQuHZViEc+6QrFBHQ1RjV2wTGyi4lU5KEbohcb3kN9iYehhjwg43
 9UC00wLTicJGt7WPDaYU2Vaqjr9hCfsNodf6zzBVI4RS1SescyApbf9LUHh4cBXaJFsAuYJ0zrh
 BCqvAKhumYDE1wnVHiODCPpKjCFvXp4hqu/Lm87Isi1tV9Zyunw/n+fVQcrjGY9sNY8mpH2nMr9
 b0aCmTXv9g14z8AVKoyCWIKHMKp87TOrF6g9or5WCv5ybVXQKsdB72q2O3B3xnfPp+vqCHFBCJK
 I8+t4JlniLggXonCetsochDKEpFbJ54JZSNq6WixaONXYYZA5lpmG4u6FA+H25
X-Google-Smtp-Source: AGHT+IGwcgvDAlOJgBsVjkItwcjVZEn6dZgi4Cx++mTBncBTEJ6K72xgApGncveQ2KKXRQO6+GOShA==
X-Received: by 2002:a05:6000:609:b0:429:8d21:5729 with SMTP id
 ffacd0b85a97d-4298d2157cemr187432f8f.49.1761224803035; 
 Thu, 23 Oct 2025 06:06:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f546asm3854191f8f.15.2025.10.23.06.06.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 06:06:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Collingbourne <pcc@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v2 45/58] accel/hvf: Implement WFI without using pselect()
Date: Thu, 23 Oct 2025 15:06:21 +0200
Message-ID: <20251023130625.9157-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Return to the main loop where we'll be waken again.
This avoid a tricky race with signals introduced in
commit 219c101fa7f ("Add HVF WFI handler").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h  |  1 -
 accel/hvf/hvf-accel-ops.c |  5 +--
 target/arm/hvf/hvf.c      | 76 ++++-----------------------------------
 3 files changed, 9 insertions(+), 73 deletions(-)

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
index bbb0b385fe9..e9dd2d24745 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -128,14 +128,15 @@ static int hvf_init_vcpu(CPUState *cpu)
     cpu->accel = g_new0(AccelCPUState, 1);
 
     /* init cpu signals */
+    sigset_t unblock_ipi_mask;
     struct sigaction sigact;
 
     memset(&sigact, 0, sizeof(sigact));
     sigact.sa_handler = dummy_signal;
     sigaction(SIG_IPI, &sigact, NULL);
 
-    pthread_sigmask(SIG_BLOCK, NULL, &cpu->accel->unblock_ipi_mask);
-    sigdelset(&cpu->accel->unblock_ipi_mask, SIG_IPI);
+    pthread_sigmask(SIG_BLOCK, NULL, &unblock_ipi_mask);
+    sigdelset(&unblock_ipi_mask, SIG_IPI);
 
 #ifdef __aarch64__
     r = hv_vcpu_create(&cpu->accel->fd,
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8c2eac6738f..d3d05b0ccba 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -302,7 +302,7 @@ void hvf_arm_init_debug(void)
 #define TMR_CTL_IMASK   (1 << 1)
 #define TMR_CTL_ISTATUS (1 << 2)
 
-static void hvf_wfi(CPUState *cpu);
+static int hvf_wfi(CPUState *cpu);
 
 static uint32_t chosen_ipa_bit_size;
 
@@ -1715,85 +1715,21 @@ static uint64_t hvf_vtimer_val_raw(void)
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
         /* Don't bother to go into our "low power state" if
          * we would just wake up immediately.
          */
-        return;
+        return 0;
     }
 
     if (cpu_test_interrupt(cpu, CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)) {
         /* Interrupt pending, no need to wait */
-        return;
+        return EXCP_INTERRUPT;
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
@@ -1982,7 +1918,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
     case EC_WFX_TRAP:
         advance_pc = true;
         if (!(syndrome & WFX_IS_WFE)) {
-            hvf_wfi(cpu);
+            ret = hvf_wfi(cpu);
         }
         break;
     case EC_AA64_HVC:
-- 
2.51.0


