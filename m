Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp4189721njb;
        Mon, 19 May 2025 08:22:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0oMlsoEDSr4RQ1iP4rm5bSUBGtmkU/txLQg8DWkdu13d7DXzmyBs09rKwp7POCMfJzyJtwDxViqNcCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFuxS+0idTHJUbih0Bq+WmSjWAxsClr9GT4RGjNQaJ+YYUtslMf2QfsPk7X4bcxC15hn/hC
X-Received: by 2002:a05:622a:1147:b0:476:6f90:395e with SMTP id d75a77b69052e-494b07cecb5mr244336571cf.21.1747668132959;
        Mon, 19 May 2025 08:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747668132; cv=none;
        d=google.com; s=arc-20240605;
        b=aFrKO7RNC2Fx1Se/GxVjLBF/j9BoRV2kQEE6U+IPHAhGcWr8nCH7zXVAKCct2TJPiV
         /B12UtP0TQTeT08FSccYuDwoNfbSPWRbFLPDWUjZnTDB5Zd2ObQy9vPvWVHhSoNUoaQ3
         Da9w+orUPwtvSvFRDfLD8mWfw8ugXR0BNdxEG0ypnWMO8TCpu1dMK+eLKbJSQ0oMtQmc
         CqXek4o35vsRUQxddwVLkJT2Cdf/Tsk1K2h1hqfnLIreUOs/5+ocLQT3lB0IJiHPvo0Y
         yrWnUtZOqTnOEDnMo2eSH5ECcnmzRf7dHI4fBcT2XSNBPibPB974uml+3qgKe0xrv8jp
         euIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:dkim-signature
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=QLgLE0ZA/brDzSvdMKYG6n/wKEqkydhjkG9vOFhWNP0=;
        fh=imbpCNWr0c9cGotT0S0gK2Ku0NTEEh1/OS2/SvdfCmI=;
        b=kSoky8X23EeFmhu1o0vEwcg2lzDHudmZEe/HtWg8A1hk4z4LGscnuwK96k9sVF6pzC
         cD1Qo9flY7yKUvVWmLYh1hCPljXBSY8ATEKFxh0a5MeG5Yz3oKufDcD+R+WkgU5/K6qx
         Hew0Hq0a0jaMSM382zK5C5Z7eareQtv7QJF8TdmU/YvnbW5veGpWwQNfMh71JOLmn79m
         Daee5ovbcsX0EaAWD7dlu/la2jyzPTqGzJlr9ruPtNIVJk3b7RBwEufAUfve4PyTxbMP
         eXV+mSkwmQX5nhNlDLmv+F3JQWPtwcywuponM8YcmD6/rfE1usXu8w1eHDazLb3qLpiD
         Kmbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nut.email header.s=uberspace header.b=SDHW1W4X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae40c572si89692041cf.20.2025.05.19.08.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 08:22:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nut.email header.s=uberspace header.b=SDHW1W4X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uH2IC-0006tP-Ar; Mon, 19 May 2025 11:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <neither@nut.email>) id 1uH2I9-0006sU-CK
 for qemu-arm@nongnu.org; Mon, 19 May 2025 11:20:37 -0400
Received: from mailgate02.uberspace.is ([185.26.156.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <neither@nut.email>) id 1uH2I6-0005T8-Qo
 for qemu-arm@nongnu.org; Mon, 19 May 2025 11:20:36 -0400
Received: from skiff.uberspace.de (skiff.uberspace.de [185.26.156.131])
 by mailgate02.uberspace.is (Postfix) with ESMTPS id ED2A7180E93
 for <qemu-arm@nongnu.org>; Mon, 19 May 2025 17:20:23 +0200 (CEST)
Received: (qmail 1422 invoked by uid 990); 19 May 2025 15:20:23 -0000
Authentication-Results: skiff.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by skiff.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Mon, 19 May 2025 17:20:23 +0200
From: Julian Ganz <neither@nut.email>
To: qemu-devel@nongnu.org
Cc: Julian Ganz <neither@nut.email>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v5 06/25] target/arm: call plugin trap callbacks
Date: Mon, 19 May 2025 17:19:46 +0200
Message-ID: <e90a289ac289d98ebf9982de302d2655f96b22d3.1747666625.git.neither@nut.email>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747666625.git.neither@nut.email>
References: <cover.1747666625.git.neither@nut.email>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -----
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-2.999635) MID_CONTAINS_FROM(1)
 MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -5.599635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nut.email; s=uberspace;
 h=from:to:cc:subject:date;
 bh=6EPHJrxC3MYFqp3FW+kc56Uyv/wE7rHT4/YdFGMzvNc=;
 b=SDHW1W4XgHTidjjC4jAYj6gMV5VckHVrtoMWVn9aGgoSi0KxYUcoQbZ2KBDPbHIbOhvTaxcZr3
 odEIJYwpZ4nCLJQ0SqPeUlOJLdSYkVk1Yl+uv/86V8R4uuV/Rqul/yXXRPhoQ5ag+HNELC4jARZM
 aqHHRZTcC5PBEmVWhf+2pNp7E/EGxA9hETo/szXz25buCKPJKtw7ppgUVzYvmFwqRdDytNFPc5ct
 jK/vbyWfOujqUUGLa+odrn4v56Glzfg87jPZrz3v89ZpQoOYqCeOPN9dVImtzf8Dii9idrrZoDj7
 Ekx30gZB50nqDNBpayqAw25zZ9lD7h1uJv3UYGWlyeEeXk4ONCnWI3hp2lFQKd+d3ynuNyAYDpO3
 O3DxLtzy6BFW0U6zZF/hZCOGFKtacKAxBtodCEvEW8SUM38VzVJWmteJnOVv0jT3rBgpZDp4GxYy
 9wBtUv+21nyc695668SpW5VtPbFHBW2pHOrxG5MfBUhZwPTWNWqYFTv5gP3juQU+pS8303KdUQAX
 pjHUS4952vPEXBe+KvuKNEGPEQHTKS9c94OyQeUwEIF3outtR4WHttOtPTHB1+AB5kPAOd7eQIsU
 kM7zd6Gli4a7vC42eb2mZIDcQhELRvY36Ns1Dq90GRBGF7aRBzDnDwmEg/vyPI31i3JtlXDZabbY
 g=
Received-SPF: pass client-ip=185.26.156.114; envelope-from=neither@nut.email;
 helo=mailgate02.uberspace.is
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CNOTNuXM+2gK

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places hooks for ARM (and Aarch64) targets. We decided to
treat the (V)IRQ, (VI/VF)NMI, (V)FIQ and VSERR exceptions as interrupts
since they are, presumably, async in nature.

Signed-off-by: Julian Ganz <neither@nut.email>
---
 target/arm/helper.c       | 24 ++++++++++++++++++++++++
 target/arm/tcg/m_helper.c | 18 ++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7631210287..06070441a6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -34,6 +34,7 @@
 #endif
 #include "cpregs.h"
 #include "target/arm/gtimer.h"
+#include "qemu/plugin.h"
 
 #define HELPER_H "tcg/helper.h"
 #include "exec/helper-proto.h.inc"
@@ -10214,6 +10215,24 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
     }
 }
 
+static void arm_do_plugin_vcpu_interrupt_cb(CPUState *cs, uint64_t from)
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
@@ -10880,6 +10899,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     unsigned int new_el = env->exception.target_el;
+    uint64_t last_pc = env->pc;
 
     assert(!arm_feature(env, ARM_FEATURE_M));
 
@@ -10896,6 +10916,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+        qemu_plugin_vcpu_hostcall_cb(cs, last_pc);
         return;
     }
 
@@ -10907,6 +10928,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
 #ifdef CONFIG_TCG
     if (cs->exception_index == EXCP_SEMIHOST) {
         tcg_handle_semihosting(cs);
+        qemu_plugin_vcpu_hostcall_cb(cs, last_pc);
         return;
     }
 #endif
@@ -10932,6 +10954,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (!kvm_enabled()) {
         cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
     }
+
+    arm_do_plugin_vcpu_interrupt_cb(cs, last_pc);
 }
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 6614719832..bcb4aae0d5 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -23,6 +23,7 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/intc/armv7m_nvic.h"
 #endif
+#include "qemu/plugin.h"
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
                          uint32_t reg, uint32_t val)
@@ -2185,6 +2186,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     CPUARMState *env = &cpu->env;
     uint32_t lr;
     bool ignore_stackfaults;
+    uint64_t last_pc = env->pc;
 
     arm_log_exception(cs);
 
@@ -2352,6 +2354,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         g_assert_not_reached();
 #endif
         env->regs[15] += env->thumb ? 2 : 4;
+        qemu_plugin_vcpu_hostcall_cb(cs, last_pc);
         return;
     case EXCP_BKPT:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG, false);
@@ -2418,6 +2421,21 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
 
     ignore_stackfaults = v7m_push_stack(cpu);
     v7m_exception_taken(cpu, lr, false, ignore_stackfaults);
+
+    switch (cs->exception_index) {
+    case EXCP_IRQ:
+    case EXCP_VIRQ:
+    case EXCP_NMI:
+    case EXCP_VINMI:
+    case EXCP_FIQ:
+    case EXCP_VFIQ:
+    case EXCP_VFNMI:
+    case EXCP_VSERR:
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
+        break;
+    default:
+        qemu_plugin_vcpu_exception_cb(cs, last_pc);
+    }
 }
 
 uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
-- 
2.49.0

