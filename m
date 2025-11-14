Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16199CEACC9
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:12:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK09T-0002Lx-Ki; Fri, 14 Nov 2025 15:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03j-0008Ew-Nz
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:20 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03h-000574-2M
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:14 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso16889285e9.2
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150771; x=1763755571; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=REj67eGgPV90SX9WQX5yE1JHREa2u08WkjMgsUYxfus=;
 b=PvGXjSm43nAxxrY4DXpvZcSG4Ky76NYprWZmhGilI+sx7dtXhgC34IcQFiMliGFKoJ
 CV2xzo0ecnlj8SMOOROY7qPibIZqCAayg0AwYhLRGVd7pg4cp03C93yYAU9mbz1BilCY
 Fkt4VsTiqIjeq4TI5CnR8cMO+57mNL9rR2OMDTy0+AIcpN2w6ZBSa1i5D55DkdroLMHr
 uyKwmNNpbmtJcAnF40QjAMxLz/pKELBEL70vdXHOrTc+VhNH7Vt1oB/aGITbwp0dl9J4
 0OARfdjXXtMX9E1qKfCafGgeSH6bHAxZqLgOyDYknCYYW5UVn2IaSqCnN9IiJNFf6rWf
 Mjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150771; x=1763755571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=REj67eGgPV90SX9WQX5yE1JHREa2u08WkjMgsUYxfus=;
 b=JQGjC7GUPWc7j/4TTXTQQRJt5+mHqn70+UNZVfz1NHyUqxnqRe4hv+a4p/jOJPo00Z
 5hZ2IcQ5E8vheiogNyay69aMRCpFDqZ0+Rz8qCCbJUdSkSbWmpEtxp/zYNQEHo44AgJp
 pZ4oWTj6z586rmzAAkUDpTZSBxhZpW2Ei0nCMkzm8/3GDyo39SDOO0JeTK24wCj2tgsy
 Y1rVidfgilOJ3XAqbDhUMKo64nKMDx4j+lwys9q3fcWgFM0rH+XYSp0O7e2KP8eRp6Jn
 O7N/Td2mHmgcWcR5wU3qpxfJUkmF3sSAE3f4do4V9kS8ZZXHXqM/krwik+LUtBeo8+1Z
 m3pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd6kQ0rIH0dxiZsSsehejduRczOgCIvpUGAdZDydONhlO8OehjNDF0yCL9GwR+9/CawnRDIf5yNQ==@nongnu.org
X-Gm-Message-State: AOJu0YxnqIue9CGNhInCHXyH+Drmde56SQ9rhHnWnXYM3vV9uV3diEhm
 1A88F4+aaCQq+g5IRlqPT8sWE7bk9PI1MD+Zi2ughRO+X2iAK+j0v/03v62gRRSS0uaaO0RUSL6
 2VmjiKRvvYw==
X-Gm-Gg: ASbGncuYv0J3Mj5mspfJTl+TVWGM8ybxZdw2Cqr2QhojULROOTUHqMBrdYfgqn4Ziko
 BwxPk5yRYoW5pCE466nGwCfxnGSkxY9QrR6Yp/fO8+q76/6ntGdpRHyIqpy0r/wjzspKuWlVNBX
 BO1SEnuFzpzbdU+gYqzklls/+y6ISYTEmmW6W+s2OO7bXfKuqtAJ0emn9tyR6KFbvPScOSV0K2W
 hvS+ep20L7MebHYfh+11Krygc9hRYJYoeCVwwBuKASg1Q+Z4nRayVlDWym13GSbC4g2Slwm/XED
 tiNGWA07Gpuw3fjyYJFRo32W1wSC7FzKeKFJB5K0Vsk7NzjUTIlhDCpVBOFkBZaM/WRdLbCHLSm
 FRFgEouj+0Mh37tiT286bg88gEpqEVPEm3MEQMyeiWqa7MBumn/pBLe1IUlc+mk+9ny5JQOvV3z
 umAVZu+bgMQmTfOPHHSXJc3qEU8G57rIiUj8QIwKLLXg51MlCgRg==
X-Google-Smtp-Source: AGHT+IE+TYfp7dAeuLA6geJIJrLBFZFfqeKkK0Wk/io9B4Is7DvysTe2PsGaHdKojJONXXgN0gxg4Q==
X-Received: by 2002:a05:600c:1f87:b0:471:9da:524c with SMTP id
 5b1f17b1804b1-4778fe69a76mr43358605e9.12.1763150770636; 
 Fri, 14 Nov 2025 12:06:10 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e95327sm159212855e9.12.2025.11.14.12.06.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:06:10 -0800 (PST)
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
Subject: [PATCH v5 14/19] accel/hvf: Have PSCI CPU_SUSPEND halt the vCPU
Date: Fri, 14 Nov 2025 21:04:16 +0100
Message-ID: <20251114200422.4280-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
index 51fd8c7175b..59a2ef53629 100644
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


