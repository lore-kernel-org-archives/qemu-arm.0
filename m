Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE61CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:56:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcgt-0005zN-Jx; Tue, 28 Oct 2025 01:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcgr-0005yd-AS
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:56:17 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcgo-00052c-NH
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:56:16 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-475de184058so12063725e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630972; x=1762235772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LgKVVP81quRHZdasM9p0tFwKU7dqmMROiJUy9ix33mI=;
 b=rkpYm7EZY7zIE6Gn+YqDMGElm2HrgnkWtEo8e/xV2d7UxzEn2y/BvDKBxjtpJ840vW
 +PlKc9ZSddMt3afQyLOi4QOdn+WCvjIvnp/wyJBts9TrPNqroXl13n2dX2N9l+nZPe0O
 KbJpHpG8mEXSpcC47/WCT3zbhLtSNfgzbGZD4+CB6FVEC0UU0upOCVjvEBr5pygNgLsd
 mLLYjz0FHfwhXzMemCV00ugpQXER65duBPwe5Kzva4xURKO7RFMUGhh+aBoc4qmgFh1x
 mpBMIX8jHlFFfqDPHeqFdUsh7niKRPsVVt66EtksCN6I3iPv6e7Ft4GxAM1RMz6KGpiv
 cryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630972; x=1762235772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LgKVVP81quRHZdasM9p0tFwKU7dqmMROiJUy9ix33mI=;
 b=OSrTHtlqfdcO3d9kr9ZK4ogLH91eBWXgsVUwCYGI14rpAA896tR0+0zKGAZXt3ZmVb
 awuJVaK4JiypTq0O7v+BLHQUQfeppUR2PqooA6i2xNskv4wTD0Tr10k8XYtI9T2o9h6D
 wCNo4m8W24+xkleSrVRnc8xHq/R9H3QuGxtg5CwbweIX6Yt9RTLCu8TsmO0O0fSXXHv7
 m400mYUfVMzUNumJK4Kaa7xKHEbHNBdpG+MG4TjtE3r+NQ7qCNOddN9snCSYSBT2W/q2
 LKh/it6PoavRsYAKmC/Q8+VPNs2MfJtTacLGZ44Ww3ot1jNNGXG5Z0YD4HIw2dGu+LYl
 XlsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAjNs1DOZsDDh7eTG/StMW8OtTd/iPRf2S3IJf+GqdljNNBo8AddTEpkRby1Sv/XOYp/96JQmZlw==@nongnu.org
X-Gm-Message-State: AOJu0Yy7OGQnR937UpeqPl8F4mnmBRobb3jOXf/gqOxiSvY1skXJA9Ct
 VOocc0w3wCTm33jUP+enqT81XnuxFbnONJ5fF/PiDvrVECdxKkKDQ1cCVTZ8nkV3kNQ=
X-Gm-Gg: ASbGnctyLFeoSB7+SA5pbWIkNdqYx7LMw2e5h3XRNaaGFizQ8N5YwnRXB9EDKfQLg5L
 7H7BZQEUjZrsbrTllLU7K2yOlMs3KvtWLhZOXWhM3wbC8ErgVgTZQxj2MZ1RBC8PokGg1tI8oO4
 11/2d6DXGcRK9XV6MjF+sulyGScn/YSypddnHHtyeXmpCToPnW0QrtnBwa+/JK7EzONfRnjlICL
 f5dAQl6UTg4N090m8tDlCb4Z9lqdJ8uItzCNLvAaLldq4726/4y+6qUJ+rQvFLPchLHu8+SGHq9
 5iw1XiSTxVWUE+MR67whiVSsZos/x0GNfyFU9LyfI0w7uj8V8vi2EMi02LcZ2vanR6M0/JgVTfr
 B0H5vsd4ig4Mcgb3jejVxqwfOn/9L2UHMB2g+zd1FNgGUxSqHo6dERYaG88DmFxcMt0V1ZBHs28
 z81ANU2Hr5vUpySc3ad2IqqHg9KVGMf4jsAdhycqZOD6EWTv3uCUGJ/V8=
X-Google-Smtp-Source: AGHT+IGcCUPEK8u3pruAAdTelA8S1vHBIeUu8RrLI3OLpMktINw1Xb2fchY6cQLtIBvStQ0Eu/J8tQ==
X-Received: by 2002:a05:600d:8354:b0:471:1717:421 with SMTP id
 5b1f17b1804b1-47717e523e5mr11688265e9.19.1761630972310; 
 Mon, 27 Oct 2025 22:56:12 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4e30f5sm175931745e9.17.2025.10.27.22.56.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:56:11 -0700 (PDT)
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
Subject: [PATCH v3 19/59] target/arm/hvf: Factor hvf_handle_vmexit() out
Date: Tue, 28 Oct 2025 06:41:55 +0100
Message-ID: <20251028054238.14949-20-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Factor hvf_handle_vmexit() out of hvf_vcpu_exec().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 50 ++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8553ce6adc2..27c600148f9 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1984,10 +1984,33 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
     return ret;
 }
 
+static int hvf_handle_vmexit(CPUState *cpu, hv_vcpu_exit_t *exit)
+{
+    ARMCPU *arm_cpu = env_archcpu(cpu_env(cpu));
+    int ret = 0;
+
+    switch (exit->reason) {
+    case HV_EXIT_REASON_EXCEPTION:
+        hvf_sync_vtimer(cpu);
+        ret = hvf_handle_exception(cpu, &exit->exception);
+        break;
+    case HV_EXIT_REASON_VTIMER_ACTIVATED:
+        qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
+        cpu->accel->vtimer_masked = true;
+        break;
+    case HV_EXIT_REASON_CANCELED:
+        /* we got kicked, no exit to process */
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return ret;
+}
+
 int hvf_arch_vcpu_exec(CPUState *cpu)
 {
-    ARMCPU *arm_cpu = ARM_CPU(cpu);
-    hv_vcpu_exit_t *hvf_exit = cpu->accel->exit;
+    int ret;
     hv_return_t r;
 
     if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
@@ -2006,6 +2029,7 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
     bql_lock();
     switch (r) {
     case HV_SUCCESS:
+        ret = hvf_handle_vmexit(cpu, cpu->accel->exit);
         break;
     case HV_ILLEGAL_GUEST_STATE:
         trace_hvf_illegal_guest_state();
@@ -2014,27 +2038,7 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         g_assert_not_reached();
     }
 
-    /* handle VMEXIT */
-    uint64_t exit_reason = hvf_exit->reason;
-
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
-
-    return hvf_handle_exception(cpu, &hvf_exit->exception);
+    return ret;
 }
 
 static const VMStateDescription vmstate_hvf_vtimer = {
-- 
2.51.0


