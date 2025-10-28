Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F96ACCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:55:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcfb-00051Z-GM; Tue, 28 Oct 2025 01:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcfX-0004xx-7e
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:54:57 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcfQ-0004mP-Br
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:54:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so3591922f8f.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630886; x=1762235686; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xgErgOnMx4s5YU2iFG4R59NbVSZsMjKyT1ZEI6z6Tkc=;
 b=TCX2ykbEzBYXkrCztjA4AGIcD5nDfRSlZ6ykjZ8hWAhZ/u5H3Cxlayv/KbwM9fe2tW
 DEyG/NXtnGek9L8KxOzzqFQGY5aKdVnoUGEfTaDK6Ow4g1i+n6uf+4aQfmpRjxdWQUfa
 vZN3X09MD1GR5Z4EormVWyMfYlbek2txT4KebWTUk0Y7kCGX5SmsoDxat1eK4e6w+lOe
 K4ORCrUJL8Wm1fGUuhrTnxbfDNPymOjj9dNbi3emMTf7I8zE8pWbJcdlmdJVzFaqpkIH
 0CEmrC2Th8iFGuzjCpC4HLNyq7A4KjSwaKZE36NxAE/50r8F2RLjTrJhAQiMObbc/dYK
 noFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630886; x=1762235686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xgErgOnMx4s5YU2iFG4R59NbVSZsMjKyT1ZEI6z6Tkc=;
 b=MxhA/4KZQUBEjyTDLqpo046XIDnFAtERSJr36w5VFjY42t48Eghy0heJmjX/oPTp6f
 imIswvBa2m0ub9c0ErVMGYTjQx+89Xe/zcjS+3uzMMvzze+EWEcS/iJ0T1CG2CdD1ge7
 U2ZnB1utGIqZ+O4YvhqqDlwSl8LuZlspdDNaZlVjiaM2YFlgkuwVxE0iDMo390KrIrmn
 w4figM0hlxNSsqF8V5WdM/Y+Z46qFQrR/YsWOjY+pArKk6kkqYaenE8Hzb6KpIQ8jVgM
 5J5C2J/GvNFvhrTgM4hHstOYm9yFg7hCweKdbyCOq3crFgdXzsFSmoRKvEpwB62/39CY
 7g3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTre0N8a2SpslbTtAuAKZlqp/XKsdCdnYN2cGaSoNdMOhsi//dOBOrU+zgs3O6e/oBZGc7t/bjXA==@nongnu.org
X-Gm-Message-State: AOJu0Yybst5Rngc847tMIWZuIuE4phuLsRwjFzF/7PaWRzW6zX6zgJnY
 wvS83a2doamgxzLa3JwsRqxR+xTQtqEP3v4Dx/mp8/zpP66inV6HnITUmFAZGcuqwt74BqMZzwb
 h6M7gtvY=
X-Gm-Gg: ASbGncvs2voJKMK2HOJJivK2W9gciBI0SNXRzNvAD+jJI32o95W6b4zyLTzPXWcNh/l
 neEoPXAxXfAd1f6CEFr09HjzRZH9ATFacm3KVb4wdonfzNfHrNo9j9pJ/m7zzJM+bMSxBkvpm4e
 LkD2cCkWA+c2P01LTd5++b4AKZqjEg671xEC5iMRAigcP8O3Go4D/vCXsCvggJi1NxJzhQp/ViW
 PvATWCSSKK/E8v0/AuEgtppVqJRjBPpGg1ulY0oYNhte0wf1w9kVxPjRmNTdeoBB9LaFrsQqUvv
 2qed+6Q2hLawZ/U2NWG5VrqgnEuu+3P0OJiG8gTjQ2DKDTet+nZ7GOnrU/0Vr4J4jqvqB+1K9t+
 qMH1gZBhLj8c/RcUnTFr3Uzqntry62Cg2UhBqCVkP7Ix0uG3Q38oHMfeWinGikgAQ2j9xt9mML8
 Wq7atZi9eLBvgNzEAbvNJyEw0vNZECMhHOSZw5B6Y2b3J5Q9d2BhU74Rc=
X-Google-Smtp-Source: AGHT+IGzBGy05Zcv06PnfWqF1AhDUOBK3UdmfcBjlaEEG/+P6DR8Rs6DGGGil50UqgBV8V2XABg9gQ==
X-Received: by 2002:a05:6000:4025:b0:427:9e6:3a76 with SMTP id
 ffacd0b85a97d-429a7e75ef1mr1582279f8f.36.1761630886377; 
 Mon, 27 Oct 2025 22:54:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df62dsm19760870f8f.45.2025.10.27.22.54.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:54:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 17/59] target/arm/hvf: Factor hvf_handle_exception() out
Date: Tue, 28 Oct 2025 06:41:53 +0100
Message-ID: <20251028054238.14949-18-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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


