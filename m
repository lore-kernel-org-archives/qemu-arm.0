Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77BDCCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:14:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBw59-0005xG-Qj; Thu, 23 Oct 2025 10:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw58-0005w5-3f
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:14:22 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw54-0007QO-KL
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:14:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4298b865f84so399472f8f.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761228857; x=1761833657; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xgErgOnMx4s5YU2iFG4R59NbVSZsMjKyT1ZEI6z6Tkc=;
 b=bNpr4qYAay/9DubdRd0YTDUo6DOeeCX8781bzLcc00U/cm6WatD/Ru8jeg/mRXwHqd
 L49iVrc4+LbamnOLajQKaLOjrTCQ4JxQ1BI6IBYvvvpXdZg7HEMZSIPU3ETt19S41Rcd
 SVOYzZv55DYWnW2SHY5xhedoTAeuYze9TN0Ja87D+1dtjuKN6kZ3Cbfmbo+hhs3nUwqv
 QyWhaOd/LEjjF1u3/ZJGbIK7Uvxbm4cSrTZ1bbBMEHtwuQlVmYXPn1ggp9GRyIf6IKYf
 SmL4NDxOp2ygvU/8y52nbU/PRR7xo/a28WChPH/jj41MiqkT8i76sTydFWzyUENSvNuq
 agVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228857; x=1761833657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xgErgOnMx4s5YU2iFG4R59NbVSZsMjKyT1ZEI6z6Tkc=;
 b=bycQtyeRM7LO8ncQLPQRoYI1MDTcxX/YgTWApV7cwtITyhWri29nElCTPobIKIwyrP
 eWCMolm/RaoBnKX8YzSOzTQCKL9aS1K8Bpbknmbwvs08ci8UZObLEY5QuNoGyGUGk6a+
 YTIR0BXVcSDDQ5BmBgd6+fGydJN2LZxc2havN2SDMEe5ExogNiTMEK9wASasXJ4qwQqs
 yNQg8VM2NIVKNqc+iWM12uN7LYeL+WmiXrtybj/lCG2/kTuHCMHut2mQ1aId//f00JsQ
 udZSG/xG+gsc3tZlkQuGPPro9PMoia34TRRkrPQZk62Yt03tsATArNPrGepjEb+QT/pE
 H68g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4SD3Fs9tK8O4xUVXnevqHWL8IVW338Pa36yQo1nHskHDgK3PH5WEjdGwbW3FEmuaRHvrbHs4fJg==@nongnu.org
X-Gm-Message-State: AOJu0YxPaeGriQ4owQVN6rP7JHf7cYIZScnbHubSKXGwkRnbq2E1f/0n
 tyDYjHWz9sMimySQX1hLxz9UNY6tut91tLFytH4ajP2QylcO4vOvcMAAD1irXXj+CxQ=
X-Gm-Gg: ASbGncvLTfQ8yR6Gs4aaXdc7anlcwC46BfDAt3SOPiAv6F3GZhvNH1e5v7UkQmNlsf/
 AucD6daRm+q0pfjwwupkCOBmK+MEFaeSx0R0UA50YZKYzQwUxw0BLLyzAz/4H4BstMkdqfHfXBt
 oEJp4/fM9bhfyYa9lkNw2L7uDh28H6umlPeYXQrGhYYf7P8mDBrOpgOalZToy/Kg7FaVfiH90GW
 QY1yaybZy20nyq6dIN2svjoWaiUeAMFxKLck2HieB7GSRBhJfBDhlNauquaNksRavD3Gyi7zYpB
 eIywmhh6pHels/vjBWyj7hzeUwclOrPWowPyQebedSRuqIC62uALtH8T33uk1CsGHYFNpvrKGuK
 LfCcsNyyPwjgmanjUanpJzNfRF4s8tgLBaRaYWVE0h2IjPxesRfuveZKBSsRKvVTiyfkdgNCBB7
 rVorJM+TU+F3IdLF4RLIPDLJUsIEflihYnzVGNNq/YCcT8A5GcoQ==
X-Google-Smtp-Source: AGHT+IFYkyq1X8eXbyXkDCQdNSLrDoS4J4Uoi4L4ULVb0t4OtBAflKybfpOydN2uOI4v0/1ko63L5Q==
X-Received: by 2002:a05:6000:428a:b0:425:8559:5d17 with SMTP id
 ffacd0b85a97d-42704d9457amr15218026f8f.30.1761228856561; 
 Thu, 23 Oct 2025 07:14:16 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f53bcsm4272553f8f.11.2025.10.23.07.14.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:14:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v2 17/58] target/arm/hvf: Factor hvf_handle_exception() out
Date: Thu, 23 Oct 2025 16:13:36 +0200
Message-ID: <20251023141339.10143-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

Factor hvf_handle_exception() out of hvf_vcpu_exec().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 123 +++++++++++++++++++++++--------------------
 1 file changed, 65 insertions(+), 58 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index fcb6950692b..8553ce6adc2 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1802,61 +1802,15 @@ static void hvf_sync_vtimer(CPUState *cpu)
     }
 }
 
-int hvf_arch_vcpu_exec(CPUState *cpu)
+static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
 {
-    ARMCPU *arm_cpu = ARM_CPU(cpu);
-    CPUARMState *env = &arm_cpu->env;
-    int ret;
-    hv_vcpu_exit_t *hvf_exit = cpu->accel->exit;
-    hv_return_t r;
-    bool advance_pc = false;
-
-    if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
-        hvf_inject_interrupts(cpu)) {
-        return EXCP_INTERRUPT;
-    }
-
-    if (cpu->halted) {
-        return EXCP_HLT;
-    }
-
-    flush_cpu_state(cpu);
-
-    bql_unlock();
-    r = hv_vcpu_run(cpu->accel->fd);
-    bql_lock();
-    switch (r) {
-    case HV_SUCCESS:
-        break;
-    case HV_ILLEGAL_GUEST_STATE:
-        trace_hvf_illegal_guest_state();
-        /* fall through */
-    default:
-        g_assert_not_reached();
-    }
-
-    /* handle VMEXIT */
-    uint64_t exit_reason = hvf_exit->reason;
-    uint64_t syndrome = hvf_exit->exception.syndrome;
+    CPUARMState *env = cpu_env(cpu);
+    ARMCPU *arm_cpu = env_archcpu(env);
+    uint64_t syndrome = excp->syndrome;
     uint32_t ec = syn_get_ec(syndrome);
-
-    ret = 0;
-    switch (exit_reason) {
-    case HV_EXIT_REASON_EXCEPTION:
-        /* This is the main one, handle below. */
-        break;
-    case HV_EXIT_REASON_VTIMER_ACTIVATED:
-        qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
-        cpu->accel->vtimer_masked = true;
-        return 0;
-    case HV_EXIT_REASON_CANCELED:
-        /* we got kicked, no exit to process */
-        return 0;
-    default:
-        g_assert_not_reached();
-    }
-
-    hvf_sync_vtimer(cpu);
+    bool advance_pc = false;
+    hv_return_t r;
+    int ret = 0;
 
     switch (ec) {
     case EC_SOFTWARESTEP: {
@@ -1895,7 +1849,7 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         cpu_synchronize_state(cpu);
 
         CPUWatchpoint *wp =
-            find_hw_watchpoint(cpu, hvf_exit->exception.virtual_address);
+            find_hw_watchpoint(cpu, excp->virtual_address);
         if (!wp) {
             error_report("EXCP_DEBUG but unknown hw watchpoint");
         }
@@ -1913,8 +1867,8 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         uint32_t cm = (syndrome >> 8) & 0x1;
         uint64_t val = 0;
 
-        trace_hvf_data_abort(hvf_exit->exception.virtual_address,
-                             hvf_exit->exception.physical_address, isv,
+        trace_hvf_data_abort(excp->virtual_address,
+                             excp->physical_address, isv,
                              iswrite, s1ptw, len, srt);
 
         if (cm) {
@@ -1928,11 +1882,11 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         if (iswrite) {
             val = hvf_get_reg(cpu, srt);
             address_space_write(&address_space_memory,
-                                hvf_exit->exception.physical_address,
+                                excp->physical_address,
                                 MEMTXATTRS_UNSPECIFIED, &val, len);
         } else {
             address_space_read(&address_space_memory,
-                               hvf_exit->exception.physical_address,
+                               excp->physical_address,
                                MEMTXATTRS_UNSPECIFIED, &val, len);
             if (sse) {
                 val = sextract64(val, 0, len * 8);
@@ -2030,6 +1984,59 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
     return ret;
 }
 
+int hvf_arch_vcpu_exec(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    hv_vcpu_exit_t *hvf_exit = cpu->accel->exit;
+    hv_return_t r;
+
+    if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
+        hvf_inject_interrupts(cpu)) {
+        return EXCP_INTERRUPT;
+    }
+
+    if (cpu->halted) {
+        return EXCP_HLT;
+    }
+
+    flush_cpu_state(cpu);
+
+    bql_unlock();
+    r = hv_vcpu_run(cpu->accel->fd);
+    bql_lock();
+    switch (r) {
+    case HV_SUCCESS:
+        break;
+    case HV_ILLEGAL_GUEST_STATE:
+        trace_hvf_illegal_guest_state();
+        /* fall through */
+    default:
+        g_assert_not_reached();
+    }
+
+    /* handle VMEXIT */
+    uint64_t exit_reason = hvf_exit->reason;
+
+    switch (exit_reason) {
+    case HV_EXIT_REASON_EXCEPTION:
+        /* This is the main one, handle below. */
+        break;
+    case HV_EXIT_REASON_VTIMER_ACTIVATED:
+        qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
+        cpu->accel->vtimer_masked = true;
+        return 0;
+    case HV_EXIT_REASON_CANCELED:
+        /* we got kicked, no exit to process */
+        return 0;
+    default:
+        g_assert_not_reached();
+    }
+
+    hvf_sync_vtimer(cpu);
+
+    return hvf_handle_exception(cpu, &hvf_exit->exception);
+}
+
 static const VMStateDescription vmstate_hvf_vtimer = {
     .name = "hvf-vtimer",
     .version_id = 1,
-- 
2.51.0


