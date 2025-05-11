Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2197894njb;
        Sun, 11 May 2025 06:19:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjH/sQSF7/CboQz4obtUL9s57fgvk5Iyy9w7/Rvl2xwBR10bybnJWaC2MNw8fQso1CFuAFwtXigUryLg==@linaro.org
X-Google-Smtp-Source: AGHT+IG9KJ2zbZt/ScLK3yvUHJhI5gRdD8RnAl3F5VZNB+MdC3DLtbfTx8rp57Lpa+3hWahL2cHu
X-Received: by 2002:ad4:5fca:0:b0:6d8:a8e1:b57b with SMTP id 6a1803df08f44-6f6e4814d2dmr177413806d6.36.1746969566601;
        Sun, 11 May 2025 06:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746969566; cv=none;
        d=google.com; s=arc-20240605;
        b=fBENacj/oLTjkrCgbSiqLbGvyBYQ8pNUjSX6MtTbtlM4ZdzuZKleJO8XUv9Bjanq49
         zaS3ioHagCGiUu+Azq2nFVTxu05Pak+mPKj+IFQ8q8+7Hrt+p62cQmKv+PdACc4NJ0mZ
         C+ZHxaKT4Xd6ExwLpgeU8Dt9Uj62MAUiTo3lxFMAebtPZS77Ywp9DqBaanbeleqk5yPK
         oT7F9y2EClDj3Gh9LqPi6GbJQ/P9CmBLH/NLgcSp6+fv33FFyA2RFcluQz3q9LdzidC5
         nWQe6IwAzlNhHo60da5BByWkbHNtQNfTEHArG+RiMSl4PE1C5lAOzDdN+rLKoDG4pDAH
         AeYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:dkim-signature
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=HYI+R/XhePBCc4hhIRowIa/32ouxYcJz8NLw9wXskas=;
        fh=imbpCNWr0c9cGotT0S0gK2Ku0NTEEh1/OS2/SvdfCmI=;
        b=XtCbrZJDj3bnYZrc/fx5gi3Sf+b6uVzaOO72qEhGOMst+53W6NMFb1RhPJ5jr5gmLh
         pP3BR21/JyRFlMQ2/MK4oRFXOwNKeLVNVf0C3tEt1p+5wYg5XIDxNL7LpvakbANb9aMp
         e44zXGDQwpbajX7EARFCUpbRE2bpeYu1br9ZHKsvZQwowVYfccVmVydFqFjfXZEfoUT+
         uF2zfy4NgkjvlSqKh9FUOU8DLKG569hSQmH0U083V4w/SGS3tEcxqvM9lKoQZ+RpoiJD
         phNSnUOvw3pNDiesFFglTv+Z8/iFw04UTH3lglMK2+sixSWT97urychyYGpHWQFtHkgf
         e7QQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nut.email header.s=uberspace header.b=dMnl6Wqp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a434e3si69597896d6.225.2025.05.11.06.19.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 May 2025 06:19:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nut.email header.s=uberspace header.b=dMnl6Wqp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uE6WH-0006Ut-MK; Sun, 11 May 2025 09:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <neither@nut.email>) id 1uE6WD-0006QW-EO
 for qemu-devel@nongnu.org; Sun, 11 May 2025 09:15:01 -0400
Received: from mailgate02.uberspace.is ([2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <neither@nut.email>) id 1uE6WB-0006oz-EQ
 for qemu-devel@nongnu.org; Sun, 11 May 2025 09:15:01 -0400
Received: from skiff.uberspace.de (skiff.uberspace.de [185.26.156.131])
 by mailgate02.uberspace.is (Postfix) with ESMTPS id 064A4180043
 for <qemu-devel@nongnu.org>; Sun, 11 May 2025 15:14:48 +0200 (CEST)
Received: (qmail 25986 invoked by uid 990); 11 May 2025 13:14:47 -0000
Authentication-Results: skiff.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by skiff.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Sun, 11 May 2025 15:14:47 +0200
From: Julian Ganz <neither@nut.email>
To: qemu-devel@nongnu.org
Cc: Julian Ganz <neither@nut.email>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v4 06/23] target/arm: call plugin trap callbacks
Date: Sun, 11 May 2025 15:13:58 +0200
Message-ID: <4d70838eca2c28791d70691d170c197678fba212.1746968215.git.neither@nut.email>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746968215.git.neither@nut.email>
References: <cover.1746968215.git.neither@nut.email>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -----
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-2.999664) MID_CONTAINS_FROM(1)
 MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -5.599664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nut.email; s=uberspace;
 h=from:to:cc:subject:date;
 bh=bbEiU1sNfooIpCQomdykENuhynIKYHFUt2scPZzgUOg=;
 b=dMnl6Wqpm5RqrUl95/ezRtIc1I7UNoqQwK8mlXiVVNS3IBYgyXJ0nSWqOaL9amvODuoBEkQTNp
 MAAhH6FV/Obb+BNMU6nNf+8MkfLANSHTdgDhQdH32OfbZEt3HlpIjEAhfk3ruF0w1csUtfHuIDvI
 9b1Mk3YrJ3giAk2qfxBHpFsKndxTy7ta/Z/7NNe2qoW3S5ZuucszXY/rxkdlM8ICF9iI3F3f6FGo
 I0NMNf5eByoVP4c1TUPK9Zx8VmlNNkOpnte26KCHx6j0nn4tFURHHZA/l4/pv6QwSrawBkByQGgi
 HVgUjF6v8Ds6GRhOzGAye05lEntjXgZS0g8vpP8Va6AyphvIK5cQNEIH7CKevWah/TTuB2P8pRma
 ZsNq2Ugy5LQl47Dg44uZPk8C+My9XP7pCKhddRmuNthfmMdGqJtH+vNhHtjNSuy3IcLP0/hcLbiV
 uhIlAuugGJy9r5pFpXrzqBqjxGAdsV4a5EDtvO051MBjOeEnkiGLpalINTHCtBdF4GXqH//guqzt
 tL7Ul5KJDM/ithvdG5j8uhymGDOg2L1vRZKHRX03UTHCfuFQo+M3K55cukmOF3fXbHHy/ZTwGGRg
 7VsVRtO8vxHLOJmbnFH0ptjgMK61CKrzRVEGR7ED07gdSyr3rYZ0xHYzf+itgZWmVd6pH7gHFtcf
 4=
Received-SPF: pass client-ip=2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4;
 envelope-from=neither@nut.email; helo=mailgate02.uberspace.is
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MV/4V+c1OIUY

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
index 4a2d1ecbfe..7416f9c8ac 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -34,6 +34,7 @@
 #endif
 #include "cpregs.h"
 #include "target/arm/gtimer.h"
+#include "qemu/plugin.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -10218,6 +10219,24 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
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
@@ -10886,6 +10905,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     unsigned int new_el = env->exception.target_el;
+    uint64_t last_pc = env->pc;
 
     assert(!arm_feature(env, ARM_FEATURE_M));
 
@@ -10902,6 +10922,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+        qemu_plugin_vcpu_hostcall_cb(cs, last_pc);
         return;
     }
 
@@ -10913,6 +10934,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
 #ifdef CONFIG_TCG
     if (cs->exception_index == EXCP_SEMIHOST) {
         tcg_handle_semihosting(cs);
+        qemu_plugin_vcpu_hostcall_cb(cs, last_pc);
         return;
     }
 #endif
@@ -10938,6 +10960,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
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

