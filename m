Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD3CCCFA04
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:18:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrcE-00010b-1f; Mon, 03 Nov 2025 05:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrbx-0000kl-O2
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:16:33 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrbr-0003UQ-GZ
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:16:27 -0500
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so2164681f8f.3
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762164973; x=1762769773; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AHrIsc13n3k3WjZqe8R3WBdhQ7AP5c+oeQndZCxEU10=;
 b=dPnaqBO6d1NsZcuAdNMIyHy5raOQPqokiqEV/+7F3d+9bwJ5OPBrNmZMDAQgbDSAxD
 DxLZODMwfwJjlIWNOj9KjFscD0sASLfceBeZKo0Y2N0lfgsRUKD9PHD7m0ArE9FBlXyr
 kzC2Q4uWznUNG4dASgevGCeaIdYBnqpb2DERgfXj3QOj47RvqRwTCSbnDAdjSzlgx4ZY
 kPXAamA2Rb4NIwqoLD+qPID+4hnWHzrsS+u5vHlr0kH+DdsKcIvvthbVYWWBwfbVTxxN
 TjGfZ963ZmpfmjZ79x08vkJvo43OjMWXAx4ZX+WspoYBnG3JYKvIK6dHy3e8NKVWP5PF
 GMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762164973; x=1762769773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AHrIsc13n3k3WjZqe8R3WBdhQ7AP5c+oeQndZCxEU10=;
 b=lE6TO39TEfMzol5H8A1JUAUuq/d/DPTyIpKXvMqBgwGf2myR6GVvoCQd/zA5lbvChk
 tLnN8ap06idevW6xxyQmVlY5HOOxmUvfC1fciMJvrY0y96y5z9tHNEk5lGGvBpHi08CX
 WI1PiblqJlHUDyLJs/oeiD/1pW9jqYb4NOE0tdW6gUZAl00jkR4iV+S6abehjVGgMkEn
 /Mx9NVBzFDTMGiS2aGgY3OeYKSsVkyQ2/k4jBCPqCCAXABXPf6vkTP1n1QjDPIN9Ar1S
 fZ+sROvdxrDMVkYdGjRiu9PAqfXxnCkweaH6x6m+T6XY3f3gZTHWhLhf1MeCam6FhUxE
 z5/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Vy47ZotL9XcGW8wwLTSL5WvfZoHSzv8GwK6XOUWtG1679sKJla7cQ9TRXfdkbwkv8VNRQXpuHg==@nongnu.org
X-Gm-Message-State: AOJu0YynrJ6OLRq4wfUb2P7FwN+ygzgB4zyhajqWrzUo2qAblzfMl33d
 7ceV8MTlV2t+FqJx5GURd8gficprbeALAB/fyplmYisst8k3bkLb91Upjl6bLkGqEORqsJoHBuV
 bvTW8uJqWsvfE3kA=
X-Gm-Gg: ASbGncuHKgvEeXbwyso+tWpZTIdLY71OT3Um4LJvDq3raeKmgfut43fFDgVkgX6fW3g
 PGX0fCZ4Lp47TXcOaBJQpGgPORX4BnRvyvXVt3lUiLFJFxk0PlV11mIQVndowMDvTlHo72YEtlK
 RljWRoLraaa0jESoMf0KfpEoqRoMQxqHABeopBC9vZBG6uBaycwGZPowZCmPHV5hmATBNFBKaym
 YNBEMN/VHfGhg7Y63udRZ0/G3QPOoSklHS/vs4VCe5KETnjVLDftB4P96HsrJTP9Xnj3f2E+Psm
 /WV/7JHNvibyDCrbwk/Y3VnMH9CEBfCYpYJkrz8LlnTga99vX2fmoyorA53v9pPHQELP6uT1oJh
 FnHSK6/jMi2T3hTxZJfG0ibYA37D9zK7cP9iDQwlCrTEo+V/R1k9HmxrawdgjNZv0REulrLVepP
 U71xjZQq1BS2Y73XHb6oVvAyO4ggWYCSIkawy24a1pvKxuMpYMJ3mKlhWmcX/L+M5+XX1TjA==
X-Google-Smtp-Source: AGHT+IFtYf7L01WGLYzAQgeCtH+nZVWml9gap2cJyPcyAoNXDlq+U0WB7BTAujEU1IDg/6CpIFULlw==
X-Received: by 2002:a05:6000:1846:b0:429:8c3b:c4e2 with SMTP id
 ffacd0b85a97d-429bd672378mr8281847f8f.7.1762164973296; 
 Mon, 03 Nov 2025 02:16:13 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429d28f2d29sm6278844f8f.5.2025.11.03.02.16.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:16:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v4 13/23] accel/hvf: Implement WFI without using pselect()
Date: Mon,  3 Nov 2025 11:10:22 +0100
Message-ID: <20251103101034.59039-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
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


