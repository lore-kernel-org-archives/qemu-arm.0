Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2ECCCFA04
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:18:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrcT-0001Ue-MN; Mon, 03 Nov 2025 05:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrcQ-0001Ke-4I
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:16:58 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrcL-0003ZF-E0
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:16:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so29045295e9.1
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762165006; x=1762769806; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=REj67eGgPV90SX9WQX5yE1JHREa2u08WkjMgsUYxfus=;
 b=PEjclthLw9SJRtvXsVS6RRdiDOtuoAODTrUwAjJ4L3g33IFJEhjLowExIg4iGW3Bd1
 gLzzrj9Yb4HaWuwUQfF49MY9qC6z8zyo8xS+PFzkLQyYWQF3r3kdDlZls0xNkGEP5fOV
 4+VzsH1vK9K3PsK+NpOlBt9uKmS+cppBsQVz6bBnxQyGwIeMgVyN4gRtS0T19NxcwEnE
 wulufDOi1bSCokgfW00XajO+pjOCpAVII7Cu/MA6mJk/Fhfat7MhvL08f++49Hcsfi/d
 j+c6SalF9cIXn34mHN2uWG5wYZflxCreEhLSqR3/xqqaoKexIjooLokTq6TAevJbHeIi
 gFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165006; x=1762769806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=REj67eGgPV90SX9WQX5yE1JHREa2u08WkjMgsUYxfus=;
 b=lyT6uuhCtsaD1EXOWwFao+MZ3mWCOZvCXtzVLAzthvfd6HtLK9JZGxBrVXGR1Qrmm1
 G5AV0xXii5SpBrBCM+tt89GsIFUIfM+MmsS2R8Ol3Mn9wCE0aZoRpOmXGUqHibs2ZE+Z
 0PJDydeh0nHzWYnxULbJeXx17IcxARN4MoGnD+uc6vdU4f3xaxUDSF0aTt76MDrW8MHW
 GUG0LoUrR28cq5XlRfxKs/rxCnELWgulY3Ud2yo1ujgYprTBJE5gplf8g+C0E8PIsgY0
 K0AdhwBhGBIeKxFUfq1gO+Jfb2NEDu8e6ZqVqSUEo1ptDo2zOkkGUxX57f4M/ESe5PW8
 pK/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwUNcq2bzdEXb3z7nVcIkEKPoioCfd6Fdt2zuAOBwL3WK9/TL5YgpUv4c8JnLx8M64t8YEEoE5EA==@nongnu.org
X-Gm-Message-State: AOJu0YwihqKoPbpTrOJscITkmlBulXMP41Y2dBzLKfBOimJ7zf8J0nS9
 3q7wgNTZZTrZ8HPpl2MEwqLcyCOp6jUCJmEUz+DfG9CIxbwUGfKdOtmZewMcNHPllpo=
X-Gm-Gg: ASbGncuQl0CCiJGT7PRcJURkVw/9fJMfGphu/z2oehIXbtarToVnAk8CEHEoUBt3dJy
 65lvAioPrUNhyQqdy+iZ0b6rgjZRGvM7UmPa2l3a1R17OVrLuaZTixjUZO6S8c0+kwx3C1vyYzI
 b6O5T/jHceGnXYDrhh2XdSvC/QoAijLSrbZIVE27dylQseZYMwAckyygbSVNf8KrV1wDc1Erl6S
 +Jy4DBaSdU7HUxv1goqZbbsCgz45nm+wvcxgozPbUuc3yowwI6wQaKZi3cc6/YH38hZKIvY9fr/
 M2MfPMaBHuKaR/9tw8649FNskKBjmOd8DCSYZrSnmLFacnk5+6mTVHRqkSZAod43wrU7+9tdEVv
 MR7CQ/kkesTPCEiqE8HkDCvd+PHbUnGOWRIsKnn16dCBWyVZWsRi8fM9MA/41kRUZiDT10/lpJn
 Vrg2QwEQF45wqTHpcDeS4RHRektvmm2B/qsYv0PK4w8VgoD0tQMJlSW4nR3h8jjlotBEa0NA==
X-Google-Smtp-Source: AGHT+IGRzIrhYQgnZNa1UsjJasERFS3g5yhWVoTj0s36vUq0vHO7BoWVWAI+8mAzPdhsjDz+Utb7Ew==
X-Received: by 2002:a05:600c:420c:b0:477:115b:878d with SMTP id
 5b1f17b1804b1-477262baebfmr87459415e9.15.1762165006253; 
 Mon, 03 Nov 2025 02:16:46 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429cab8575bsm12193533f8f.31.2025.11.03.02.16.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:16:45 -0800 (PST)
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
Subject: [PATCH v4 14/23] accel/hvf: Have PSCI CPU_SUSPEND halt the vCPU
Date: Mon,  3 Nov 2025 11:10:23 +0100
Message-ID: <20251103101034.59039-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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


