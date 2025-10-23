Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85915CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 13:07:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBv1u-0001Yd-DL; Thu, 23 Oct 2025 09:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBv1q-0001SC-33
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 09:06:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBv1m-0006JY-W7
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 09:06:53 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4711f156326so7752835e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761224808; x=1761829608; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvnDiGB/ScoEzWWOO6VF5KOR9EI5aejneEWS4HSU6NA=;
 b=vj30sYqjKlvn7J8J84v2U0E2XuGiqAmt5m+dDmGGmSA2J+2RsDyGZq6XYPocucSz35
 WVc/Wz+3xTmnBw7szoNARLKu/3IM5m+qxYcLWpG1XoSZ67SGthJ1FTVohwz/zTG0iP32
 G07nES6U0tv755j/ftOpbM5Icudqg3SnO89jWotOMhzqES4jrxYO2KChbWt1j1lzNyY+
 IfwbPE+mEywNP9xVSWTsHJ+IWoCWn9yM/8j5pbHU8zMp7wSQxbZtbNLXbbXbQepaa3cf
 KQzzhlvojDyKXomCk7EDEmbe+QjL5yevsbTqpzvn21pvoHMjwkSV0jVKmqoqsjxCHw2x
 hULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761224808; x=1761829608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kvnDiGB/ScoEzWWOO6VF5KOR9EI5aejneEWS4HSU6NA=;
 b=KRgv3/tsLbH5dEAnX5hSBEPt6c1ctM9vilmHjh3n2Z7j0odUwtQOd7nIzOi2q6+K2X
 kp6Qhsw0KAkKNHnIoYMGh7yXpSQGf7fn7id/Ie55KT/G83zYW61feCWwwaf2zzzGoklO
 QFURctd+fTqbWqiUizFTu0L7QdNiM3RI4v9gqFceFFo/zqLubcI6njSiwoglaw0toNXa
 RlZmwDVTlhM4n7dpf60IIuqOX3r1KyEJKMHpuJrV3/KHCCklg1u8JLA/414VE7LeQ0mY
 62J7n5JFQjLVNYxK+1rqKmAPHz+v+mv84BIIW083v8qeSSDZo+EjLHSH09ttE4fuyrS6
 wXVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1bvCTCwauNvdRsLUM82e8/J4zzDc0tOD27MxvpMrlnC+NUZlwZcfc5dijDaDd/w9BrSxvfaevHA==@nongnu.org
X-Gm-Message-State: AOJu0YzETxfYILPhVzOiTeTmrqLfq264v0Vrshyn7ZFL4EzxbwVPNr5H
 Z/V6fMeb34YXTzLswXgMF+L88jlS9hCd8e6njOmWjbVkclDIpO3AFlZ08uLWAGc0bYc=
X-Gm-Gg: ASbGncuIfnoCXv+q0TW9AIQfrjUgqL7iY6DEg5L/AQUNpupa5o6/oU6PQeNXXPdQiZo
 Yf5XZdzYOBpjRLcm4UY334LctHPxrVWdPQV/byE9NF6ppkNICuXBWAb9PpZ1O1gx2VEJO4Sb+bX
 HcQVl/BkzsWKPhKeoOzO+N3JgplWSwZRfQ1w4k0kBY+/R1SAU564GV3yGieF2XDGbuic/e6a6M5
 SskF8fRIayrr5aEqutPelG4chL8ojj8EL4T+3QRykiCEtLcaShGxncqUNzGiUkmU+FK1mreLu/B
 BQ9EYq8YYHvBrBq6MulzM0Hu5znyh0SI5CPWsjoQ/w7QH43DliQDb+B68MFUonY4qNPeAkcOM7C
 SzZPnTlVt3XYeYh9/r8vF88re2uNbjPDpQqX7iQ/619U3/Bd7/l9LpqbhHhgkImrCNGxJcj21Ex
 71doWFSLGG4YCaGrVO4iSMQshXcAA8GdG2+Sdkaed6C/BgYEGsENS+RThesWaljOKxNbkOmmw=
X-Google-Smtp-Source: AGHT+IG2XyxY5paEm73our2Qgpsle8ksGIFwPN9bx48OT2DZ2LZFl5eC3PZdw138qznEak6DQrA7/w==
X-Received: by 2002:a05:600c:3b04:b0:45b:7b54:881 with SMTP id
 5b1f17b1804b1-471178767ffmr161304575e9.1.1761224808519; 
 Thu, 23 Oct 2025 06:06:48 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4369b33sm95619935e9.14.2025.10.23.06.06.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 06:06:48 -0700 (PDT)
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
Subject: [PATCH v2 46/58] accel/hvf: Have PSCI CPU_SUSPEND halt the vCPU
Date: Thu, 23 Oct 2025 15:06:22 +0200
Message-ID: <20251023130625.9157-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Return EXCP_HLT to the main loop.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index d3d05b0ccba..b0918de5f92 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -302,8 +302,6 @@ void hvf_arm_init_debug(void)
 #define TMR_CTL_IMASK   (1 << 1)
 #define TMR_CTL_ISTATUS (1 << 2)
 
-static int hvf_wfi(CPUState *cpu);
-
 static uint32_t chosen_ipa_bit_size;
 
 typedef struct HVFVTimer {
@@ -1009,7 +1007,7 @@ static void hvf_psci_cpu_off(ARMCPU *arm_cpu)
  * Returns 0 on success
  *         -1 when the PSCI call is unknown,
  */
-static bool hvf_handle_psci_call(CPUState *cpu)
+static bool hvf_handle_psci_call(CPUState *cpu, int *excp_ret)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
@@ -1092,9 +1090,8 @@ static bool hvf_handle_psci_call(CPUState *cpu)
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
@@ -1925,7 +1922,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         cpu_synchronize_state(cpu);
         if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
             /* Do NOT advance $pc for HVC */
-            if (!hvf_handle_psci_call(cpu)) {
+            if (!hvf_handle_psci_call(cpu, &ret)) {
                 trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
                 env->xregs[0] = -1;
@@ -1941,7 +1938,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
             /* Secure Monitor Call exception, we need to advance $pc */
             advance_pc = true;
 
-            if (!hvf_handle_psci_call(cpu)) {
+            if (!hvf_handle_psci_call(cpu, &ret)) {
                 trace_hvf_unknown_smc(env->xregs[0]);
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
                 env->xregs[0] = -1;
-- 
2.51.0


