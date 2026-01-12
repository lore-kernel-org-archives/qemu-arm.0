Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC8EC9EC63
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:33:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFDd-0004FI-1s; Mon, 12 Jan 2026 05:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDb-000478-Uk
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:16 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDa-0001rM-9f
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:15 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso43733305e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213933; x=1768818733; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rjaoEA0EYqF5t3dZz3vxcYiQNespCzrnVtF3goBx/A8=;
 b=uN+ERW6f8oFkM9ypruC6ESi3uqTWZ1Dhi2dUOKOShg8SD8Rw009PSVGjEDCfeL6v11
 U1WsxK8Uf18EeSkOzaapLfWRUkeZjTiV9FzfH32bBb5es3kByLtZsYNpwiHAtzYWOOXQ
 Q02x7x/dYbXeuAPLEeC83X8pPSlOy9Vsil9e3OYpNWTDUM/6jAFJAzmEBWLgh86lwouD
 mDTV+hUSXtim34oeTVgVz/tmC+4ixtZ8opeNDIrja5A4hjUlrXms5fbB67MTffYiLmGB
 D2Xr9Vx6ZEPBPHA/qqYkoCjaxzy1mYAjFOZj0ZLWwa2IeVdTPGpkvdYjxjkUfp697IMO
 8O/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213933; x=1768818733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rjaoEA0EYqF5t3dZz3vxcYiQNespCzrnVtF3goBx/A8=;
 b=JrP42rYjyIAN+VZUShX3UuYEESCHJ/7A9Jju39AM3LL4UtvpzMiVJw0oggAzrbLkOK
 cyWReyWw/PzDMc3vu5umQDEdxmrqnXcqJ3WjRd6LWyfGN6mbSQdL2W59L04cH6tX9NfG
 NO3lC1ieRHqR7amfcxxWvSq0gNAUgq/TtTQVKCBK5NNblAvframhiZ8Ttc0ZJXW8qhMD
 Vnabva0oJXigB9nKZH1NBU1+oGFMPkfvuF4igIGD5O+JlQjJRfI1yAP64IKkxXyi+J73
 q4AwAQPFq7ZK0+uyR/5IceKtRIovitmR1KmBbMiEzqsl+R2fWhLMcDT4zex9IqAF8Umb
 4BIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVTPeXOkqWDxO/sSwuhbQxgsfG/h5m5GRfCFcyPK2Pfc2RXZpXT6OqLi06jjN8XLlZr2xDZ03xKQ==@nongnu.org
X-Gm-Message-State: AOJu0YzmTJbQjRKuOSPgPATCeU+ZIdl4sA/av8lnyUOe4yuuQWSrsMie
 IBLgsvQEhHSjxzuo/zon3mwLhPe+wrLJuuKoqmualiCgzjNNq1K+wzrZacUtoFi/nXs=
X-Gm-Gg: AY/fxX7UIF6TJswGBmb8R+6pYh4nLN5TyWJra1LaMNbKfsHy6sffTO4AhRbO4cBbHZN
 9Y+RZsvw7zeuXBHUei7WWIu3vMaYS/cBwtWM1FDTonRQX1AFBQXIJR8C2ZKHahRpTZcOkD+7Pua
 iP37w+tu0rk//k440YnpV7cFNS8pnVJqWU3gmr8G+9n3Z7xLkvXanxxUP85LFloteHUwQu4GHbQ
 cdAVm8LqU94hB6n177kjeq+XuYnf36ttVtxxZqNF7GndEH5AZCxRH7n9Zrq909ifajEvvlZMdzj
 7XxlbRroyvfLYzyuW8faINm57KedWZmBXpJeGeA2dixwABzb9mL+EzViyCZqPy/7zE9Td03J1oR
 G1yHphTJ2Sfd+SoZQGujAKgowZbsi6QztJviObXNVBuXlpQPTKhnutqf57ojigt5BBpZTcCh3Li
 fFZcfaxgnLAwUdUoYnYkc/IUHPTZW3qDjJrs1MDkwNz+SzYB1540XD17WFDdDy
X-Google-Smtp-Source: AGHT+IEMjMzNaieUA9OkBkUtVScBvDnU91mR5fqPmcrycAex2vTHoPUSaj+ydDzqxO7u19mBmRf6fg==
X-Received: by 2002:a05:600c:3b05:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-47d84877e51mr211876665e9.13.1768213932812; 
 Mon, 12 Jan 2026 02:32:12 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f6f0e15sm345226605e9.10.2026.01.12.02.32.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:32:12 -0800 (PST)
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
Subject: [PATCH v6 14/19] accel/hvf: Have PSCI CPU_SUSPEND halt the vCPU
Date: Mon, 12 Jan 2026 11:30:28 +0100
Message-ID: <20260112103034.65310-15-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 target/arm/hvf/hvf.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index b936098d257..718414cc53c 100644
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
         if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_HVC) {
             /* Do NOT advance $pc for HVC */
-            if (!hvf_handle_psci_call(cpu)) {
+            if (!hvf_handle_psci_call(cpu, &ret)) {
                 trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
                 env->xregs[0] = -1;
@@ -1927,7 +1924,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
             /* Secure Monitor Call exception, we need to advance $pc */
             advance_pc = true;
 
-            if (!hvf_handle_psci_call(cpu)) {
+            if (!hvf_handle_psci_call(cpu, &ret)) {
                 trace_hvf_unknown_smc(env->xregs[0]);
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
                 env->xregs[0] = -1;
-- 
2.52.0


