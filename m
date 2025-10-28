Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FEFCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:14:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcyA-0004Hv-Kk; Tue, 28 Oct 2025 02:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcy9-0004Fw-DI
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:14:09 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcy7-0006pa-Eg
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:14:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso3203921f8f.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761632046; x=1762236846; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCrpbvmA6dW8jE5sx5kPv1Y+FBzb2FgKrxpHf13tOXw=;
 b=Y+33lXMpbNpFNrSrZHN1IqeirHKnmGaU2denmU2mPKBCqpukM05L6J2GHznlhqTaYy
 N7ZWYOmo7qWhWa7oKMicWjevnQ3z/++4L8ojYWp/jgOhcfjvmWuBEXWCPIeot05Tl/FP
 wL12AARHSise0qa1Khk8aGMZyGpYhWOS2hID+MhOs+VMx0z/iGe+1O5ErT/10DB5KFBj
 sXKtf8OY3zmA8Q+Gm4RMOX+DWvnmVQN45lAsY3yl9rXo6rp67Cp9LjSaUckSKrqE+5vK
 JEsm2CGrMr8X03k/v1cUIb/RAnTx41wXw443I+NgCrEVLuB/yAGB+6gxcEdZOZpdBYKs
 HwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761632046; x=1762236846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCrpbvmA6dW8jE5sx5kPv1Y+FBzb2FgKrxpHf13tOXw=;
 b=XXY0dMKteLN+1af8kbh3o9TzZeT9KZ0xrMO37DG1FghpPYKz0KX+C6rpNYbsYVsfTY
 FrTuY49KsOlswsL+4B4MNnHtNiUejQFqSPHsO3oS8iK7uKJzx3J8F142hQRQNwXs7f7t
 Tlp4UQC5GMlQ8Pq872NypfMarxG98uzp9Q5wHbOQQiOxTnMKyUzK1+QRfpQeq3NygU79
 Q07d572zUpSQNo/fyUXOxAqB6KvHvkCEkBTsm0gCLug/RPIH/y5nLhyYGJiiGb0kXdnZ
 ROTzPy9oECVHRiYDVqEyftfT7Bxo6NIj4rkf2p7gD/Ejpmm++qit7dJiAj7HtnV0IEr/
 2J9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVFgRMTpgFTbyBx3ccFV/0qBf+0a5soZQyMhvj7O6LWxdkosCGrh0SiSN6kQc44qNFvdE60oTMCg==@nongnu.org
X-Gm-Message-State: AOJu0YwflWp16CNSLClla0BOFfqGEs5V9SeUb/DaPM50MLd+6TB3Nnu3
 K8dsgnqZclyRBTOO7TpWhCOgJ5T5coVZb1h7rzG+ZRCITWPSznvCxyq2XDkKRIQy5u8=
X-Gm-Gg: ASbGncuQ8KIb6orroM4MKuL9Yz7/t5qFv1nUJyG32Z6ArOe3TRYprsKk6pkaaNJzWG4
 sl501MUIAsa/vjfLnI4AIpioikIukQGwRbFZqqhFWcSA+3S2lXH+nwun2FGHhKHriStuX9mxg9q
 7QYUl9r8rZ6WPrau6X4BYN5XGJ7IVlttnoU+uxbsAu26CjD9MSvZmzjg/IVh9GX5Ht0I6e+E4qK
 HMIDQAhEwpUSsMy5YGGtV9MlEqqUbqDmKVdwSUnggf5f5YIWALAtXqhKeYLWopW4wXyeeRuob19
 ChP+StnwpvkFrfKGY73p9xz+075ns5i3bn9umA8etRuhO4AybInxgdvu/BWcYPZVNi7zhH9s9VD
 hH/glbXnv3l97CdXsCzVID+o8CqZwqkHY+SqzXR3QehAfDsPrtUWAyn3hF8X4iCMM9fEPXAVnPU
 UzaUn7lzt4O2slAjMnooZT1u4lAjUIMI/MsvzwXzpItxTfhkSy8nKrwbE=
X-Google-Smtp-Source: AGHT+IGHyiy6BhdqPtoG0hs3zNXL9bksnPzkDfSLoNnXKjqYnZLURUXFTffL1IvUqjVbu9YaEaFi9w==
X-Received: by 2002:a05:6000:40d9:b0:428:55c3:ced4 with SMTP id
 ffacd0b85a97d-429a7e59e2amr1668859f8f.18.1761632045766; 
 Mon, 27 Oct 2025 23:14:05 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b2dsm17994140f8f.2.2025.10.27.23.14.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:14:05 -0700 (PDT)
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
Subject: [PATCH v3 44/59] accel/hvf: Have PSCI CPU_SUSPEND halt the vCPU
Date: Tue, 28 Oct 2025 06:42:20 +0100
Message-ID: <20251028054238.14949-45-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Return EXCP_HLT to the main loop.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5fc9b217a11..f9d983fa123 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -301,8 +301,6 @@ void hvf_arm_init_debug(void)
 #define TMR_CTL_IMASK   (1 << 1)
 #define TMR_CTL_ISTATUS (1 << 2)
 
-static int hvf_wfi(CPUState *cpu);
-
 static uint32_t chosen_ipa_bit_size;
 
 typedef struct HVFVTimer {
@@ -1008,7 +1006,7 @@ static void hvf_psci_cpu_off(ARMCPU *arm_cpu)
  * Returns 0 on success
  *         -1 when the PSCI call is unknown,
  */
-static bool hvf_handle_psci_call(CPUState *cpu)
+static bool hvf_handle_psci_call(CPUState *cpu, int *excp_ret)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
@@ -1091,9 +1089,8 @@ static bool hvf_handle_psci_call(CPUState *cpu)
             ret = QEMU_PSCI_RET_INVALID_PARAMS;
             break;
         }
-        /* Powerdown is not supported, we always go into WFI */
         env->xregs[0] = 0;
-        hvf_wfi(cpu);
+        *excp_ret = EXCP_HLT;
         break;
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
@@ -1910,7 +1907,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         cpu_synchronize_state(cpu);
         if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
             /* Do NOT advance $pc for HVC */
-            if (!hvf_handle_psci_call(cpu)) {
+            if (!hvf_handle_psci_call(cpu, &ret)) {
                 trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
                 env->xregs[0] = -1;
@@ -1926,7 +1923,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
             /* Secure Monitor Call exception, we need to advance $pc */
             advance_pc = true;
 
-            if (!hvf_handle_psci_call(cpu)) {
+            if (!hvf_handle_psci_call(cpu, &ret)) {
                 trace_hvf_unknown_smc(env->xregs[0]);
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
                 env->xregs[0] = -1;
-- 
2.51.0


