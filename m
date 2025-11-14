Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A71FCEACC1
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:08:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK05X-0001WW-Md; Fri, 14 Nov 2025 15:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03e-0008Cv-27
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:12 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03a-00056Z-69
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:09 -0500
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-42bb288c1bfso195127f8f.2
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150763; x=1763755563; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IY/AWePOB5/TQB9gFgQVE02SV6QkLcKm2Qc6htWo9Ro=;
 b=a+/Qrpkbzaz09M22aFdh6qoOX1iVrohJrsyOAuomjpK6By0x8Gt8SsUbRzLNgxLwGe
 ki1ffxboEViB4VhdjMpyS3QBJQlRw2PSS1L6zXAbEOm4JQETA39m9DfV2dlUdJdKg3Ux
 fRKsXDXuVpYGh25NTnXOCAijqlEyvFgdINlqXfOICmEG4YU+7pFV2EpFA6glh+NV8Pz5
 NFp4aY5JwZZutGoAcyDncHrJzPdWDegOyY2b1Wmr+1NUYk5X3B1lhM6hlm43n+g3Px6l
 hJuQlCBCda3c0bs/mXhwOnLiLXm2ZNtCI+wd6HWtI09VzmvVVU8k3qVSlrS6Vx98yUL7
 0tLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150763; x=1763755563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IY/AWePOB5/TQB9gFgQVE02SV6QkLcKm2Qc6htWo9Ro=;
 b=j2h5EvUjHUSgSQsaDACIvV1QwwlhG8dw5rp9Juwvo4AMUy92gCWrVXaNN6O7AyEW/B
 /jGSBfYYUN2H4X4Y4zanGa2z4Rr3GEg5+rc3YSloovSEs+GyOGDLjRKiXz9jFnAplI1z
 MuNssgMg0fpvspNirrZFUrwZgB9B+sDKbd2KcLlPMuSg+IKQPLPd4dTeAPgtIAlSq78D
 HD5Vwycb9zeov/+mSr4e9wU/mxJ+s8PcJElhyNlRSpOQKCK3mi+C4inwoHxJFgCgj4lo
 NTJFbrFmHc4PKryfRFuZ2cgD9PbGuaHn5gNda9Sfr1PhvEc0dJxj/Ovr6kSNc2QMZemW
 FPqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBPt5wCoekGJ50diaQiHhBGFJoY4H6zNtkQQ6MMJB/JSP8x17WbVqQccIZpEY/wdxF/IJEAJHkcg==@nongnu.org
X-Gm-Message-State: AOJu0YyfWa2HcpSiS3yYY5tos/BEgtdxjHRLDfp6Bmb27EH7oPFKKlcQ
 QoZXXYeITcK5bMBSnNxWKPykSyVKvkgsrD51Qvqz1Enzh1rj/2sEGPqYt3CrJ0MtxUQ=
X-Gm-Gg: ASbGncsT3RyJU6ntYPOPh2AB/wGMmnEka/r00J+2i5yNZD7v221d50jZUK66K3bOPE4
 ZCGH6iWKRnwTkxh6Bm0mW2lCbnjB54H6zcmiMf3J8LREtbQ04b0/IcH26xnp4sYWDw9/OCyUa83
 FgohBJbCebVh7AlW6ayqwy0pifBjt+7AXmRn0rLSbLF6qx8mHh3b65pYC3pJEZpqx90IB7QL/0e
 InJpno6bvJMa1+gxnobAWVfA0idpOTiAxLYeAYjiB3aWOdobFVElrx8JrRKDxnZe5qEfxYJ0bKQ
 HHyphaGLHtEwFBGbCKxXwB25Ur0V08+XFd/oAAuPrJYsfy+KPNRvmyWBYc96PCWSc5Wjcg4X3n7
 xWjosVgqi6iVG7nzjNbzlKxiyWetHE71/ikE9bo7iroSNdIMg4kJQ0VI10R1vTkFqg21Pl4rjF6
 4hlDX2ZNBudmtessKLnZUpRSBUPIgwvFwzwyKQm04Jx9Ni16W+AQ==
X-Google-Smtp-Source: AGHT+IFT5PGUptmLIY9IgfFayBAnmujBe+7Zc1JMgmTrTJvvDKyla+0+BwjhutAWbkXAjQQ6RrL59w==
X-Received: by 2002:a05:6000:144c:b0:42b:389a:b49 with SMTP id
 ffacd0b85a97d-42b5935a894mr4214573f8f.28.1763150763374; 
 Fri, 14 Nov 2025 12:06:03 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b60csm11769883f8f.22.2025.11.14.12.06.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:06:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH v5 13/19] accel/hvf: Implement WFI without using pselect()
Date: Fri, 14 Nov 2025 21:04:15 +0100
Message-ID: <20251114200422.4280-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x442.google.com
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
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 include/system/hvf_int.h  |  1 -
 accel/hvf/hvf-accel-ops.c |  3 --
 target/arm/hvf/hvf.c      | 74 +++------------------------------------
 3 files changed, 5 insertions(+), 73 deletions(-)

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
index bbb0b385fe9..5922eb02e70 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -134,9 +134,6 @@ static int hvf_init_vcpu(CPUState *cpu)
     sigact.sa_handler = dummy_signal;
     sigaction(SIG_IPI, &sigact, NULL);
 
-    pthread_sigmask(SIG_BLOCK, NULL, &cpu->accel->unblock_ipi_mask);
-    sigdelset(&cpu->accel->unblock_ipi_mask, SIG_IPI);
-
 #ifdef __aarch64__
     r = hv_vcpu_create(&cpu->accel->fd,
                        (hv_vcpu_exit_t **)&cpu->accel->exit, NULL);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5e46e8bf4dd..51fd8c7175b 100644
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
2.51.0


