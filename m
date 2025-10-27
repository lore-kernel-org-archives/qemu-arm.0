Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0855CCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:12:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL2E-0001Ng-Ff; Mon, 27 Oct 2025 07:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1t-0000rX-3R
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:04:49 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1R-0005fI-Ur
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:04:48 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so1052816066b.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563035; x=1762167835; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D1dBqMEfBlqSUG7PelnGPIkGv75RoYZ1ZvCkqq8IgNo=;
 b=glzuNhfefPlRvwbG2yFjU6hUpmd014VOSa0ArrXDbYRCCLRxUw6kavgfMR1+etQk3k
 ex7Ke3cOLDPDkuNEUXxh+8MR0RZnDvuM2CdlalJESHMZHNSh6o8o6gJwLlfXlgZxLKqD
 tW1yoViMfnmDLmR37V4XkRQw+da0SrT3gIGBgmZ2EIOPILq3cTJgepGuW7m9hDDsq4B7
 ls42jitiFxm2Op/7BfpwxskX1NuxQ0wrQlwa79iDKy79oiLscwT6EyvLekojvdh6TDl1
 DYoPD7Y5B5yOcUlO/d0ukJ752dj39JnJYCjCDdyyrgooJ3ZqdMlZmlyWa9RjEpjbVMvv
 Bc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563035; x=1762167835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1dBqMEfBlqSUG7PelnGPIkGv75RoYZ1ZvCkqq8IgNo=;
 b=cwjM/Av2xMk0KvuU8HvEWcwyAlx34bobKh3Wpz1PhdC2xIex6Il6CLKEKVakODm143
 uhqYVagglqC+ATwagEmrUWFsozCSgI9OhUSRk5LIHzY+fWeuiqesRCrwBakiDz5svdCs
 jsPt2gFyhIq83L/AscPbILSfG1mHz35INOtmCEAg2hE7eVRHIfm8b1hYsMWVmSmLCxnf
 Yq4aCJFZmah9oODhTvyIeT46CSGDFcnDc9+e6MZH4mVFOqV+HqR6+WwcoGZitlAamkCr
 H/kXo9zM2s3LCmcsApOLZyGGsNrfLYEAgRoA30rRZqP19gX+Xd6Q2Hcnz9UQa8oR2/9K
 rrdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzq7guuxbirevWM4E4EsYTUV25jyw6s75zwZmZtn1QtFB7yf9Vu8p18ujjwQY3up/Tu9mzBI48+w==@nongnu.org
X-Gm-Message-State: AOJu0YzhasWg1014Lkb8ppf7rQxz88ze13OKj3nXgtIYPgSC67AgA9f7
 y+3oObxBKAlNELD62zUtxB6VoDwwFowTAdjC1GU2keV1fOx0SkSOcdL61DyXTku8feI=
X-Gm-Gg: ASbGncve08ysKlo53HzrzqHTYFfijV8vEGvJuLlVpCD8tDFEk3hFpibWEQxPzV/ZOlF
 g/jdU507U31exO9ndsbx8TLcyLSmAOscBUOpXYUaVO9GKp2KxrC7S6quX35tvivwg2+eTXOSuKI
 +bEvf2mFlC3y3xAl1JYrEeCA81ui677i20jrFdgfzZ8n8HsFp7N9qdiu8ZnEc9Lr5gTM3q7x+uT
 hNZz84tNTErCU+O63DylGg024Z13jYIZQ84+ozxFs6hggBGkUMNzw6LzMr7jolL4mEddUgj5S5t
 pZAgKW67m7qZPs5Tu2TPT+rDDHTVsNc1ZD86nQULg0AUcXNC8rfJYrx4G6/uCJt4naX4to88KKM
 6uCAmZDRAxNT4YUcMLK49MdbXOcuymtD251NBko7/bXApdaezl0MD1VY91smIGrtMB9xQFwLtkc
 r2LGoLhw/jgXk=
X-Google-Smtp-Source: AGHT+IF5kYTpImflkBbD2clRHQr+gdOVKdNdq8AWjSa+ytlNl34JftCGYvwU6boz7oiv8UPvMHvJ7g==
X-Received: by 2002:a17:907:3e0d:b0:b6d:5ef8:4bf1 with SMTP id
 a640c23a62f3a-b6d6fe42fe9mr1097430066b.19.1761563034748; 
 Mon, 27 Oct 2025 04:03:54 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7efd116asm6178995a12.33.2025.10.27.04.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:53 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3F828609D9;
 Mon, 27 Oct 2025 11:03:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Julian Ganz <neither@nut.email>
Subject: [PATCH 12/35] target/arm: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:19 +0000
Message-ID: <20251027110344.2289945-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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

From: Julian Ganz <neither@nut.email>

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places hooks for ARM (and Aarch64) targets. We decided to
treat the (V)IRQ, (VI/VF)NMI, (V)FIQ and VSERR exceptions as interrupts
since they are, presumably, async in nature.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/internals.h    |  1 +
 target/arm/helper.c       | 24 ++++++++++++++++++++++++
 target/arm/tcg/m_helper.c |  5 +++++
 3 files changed, 30 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f86f421a3db..6fbf7e1ca49 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -375,6 +375,7 @@ static inline int r14_bank_number(int mode)
 
 void arm_cpu_register(const ARMCPUInfo *info);
 
+void arm_do_plugin_vcpu_discon_cb(CPUState *cs, uint64_t from);
 void register_cp_regs_for_features(ARMCPU *cpu);
 void init_cpreg_list(ARMCPU *cpu);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2ef9c178147..ef6435c3efb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -34,6 +34,7 @@
 #endif
 #include "cpregs.h"
 #include "target/arm/gtimer.h"
+#include "qemu/plugin.h"
 
 #define HELPER_H "tcg/helper.h"
 #include "exec/helper-proto.h.inc"
@@ -8783,6 +8784,24 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
     }
 }
 
+void arm_do_plugin_vcpu_discon_cb(CPUState *cs, uint64_t from)
+{
+    switch (cs->exception_index) {
+    case EXCP_IRQ:
+    case EXCP_VIRQ:
+    case EXCP_NMI:
+    case EXCP_VINMI:
+    case EXCP_FIQ:
+    case EXCP_VFIQ:
+    case EXCP_VFNMI:
+    case EXCP_VSERR:
+        qemu_plugin_vcpu_interrupt_cb(cs, from);
+        break;
+    default:
+        qemu_plugin_vcpu_exception_cb(cs, from);
+    }
+}
+
 static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
 {
     /*
@@ -9473,6 +9492,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     unsigned int new_el = env->exception.target_el;
+    uint64_t last_pc = cs->cc->get_pc(cs);
 
     assert(!arm_feature(env, ARM_FEATURE_M));
 
@@ -9489,6 +9509,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+        qemu_plugin_vcpu_hostcall_cb(cs, last_pc);
         return;
     }
 
@@ -9500,6 +9521,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
 #ifdef CONFIG_TCG
     if (cs->exception_index == EXCP_SEMIHOST) {
         tcg_handle_semihosting(cs);
+        qemu_plugin_vcpu_hostcall_cb(cs, last_pc);
         return;
     }
 #endif
@@ -9525,6 +9547,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (!kvm_enabled()) {
         cpu_set_interrupt(cs, CPU_INTERRUPT_EXITTB);
     }
+
+    arm_do_plugin_vcpu_discon_cb(cs, last_pc);
 }
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index d856e3bc8e2..3fb24c77900 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -23,6 +23,7 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/intc/armv7m_nvic.h"
 #endif
+#include "qemu/plugin.h"
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
                          uint32_t reg, uint32_t val)
@@ -2194,6 +2195,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     CPUARMState *env = &cpu->env;
     uint32_t lr;
     bool ignore_stackfaults;
+    uint64_t last_pc = env->regs[15];
 
     arm_log_exception(cs);
 
@@ -2361,6 +2363,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         g_assert_not_reached();
 #endif
         env->regs[15] += env->thumb ? 2 : 4;
+        qemu_plugin_vcpu_hostcall_cb(cs, last_pc);
         return;
     case EXCP_BKPT:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG, false);
@@ -2427,6 +2430,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
 
     ignore_stackfaults = v7m_push_stack(cpu);
     v7m_exception_taken(cpu, lr, false, ignore_stackfaults);
+
+    arm_do_plugin_vcpu_discon_cb(cs, last_pc);
 }
 
 uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
-- 
2.47.3


