Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B877CCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:15:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL9b-0006QY-Nq; Mon, 27 Oct 2025 07:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9K-0005iV-MX
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:12:31 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL98-0007b5-HY
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:12:30 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b6d855ca585so471673066b.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563532; x=1762168332; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1b44YiDbKt04f0+TC89kYzcy4R8hkZYmp3ahyMwERI=;
 b=cOR0NhyDC76wMgHiQ89Z/nud3Mk1b+/PN1J2RxxRBBDlSZngH839cQCVVoZRdX/SRR
 B/1cf5EWM5RzfOUztngSxjYGJSfA3xy91jkmqpnv+k3m58pBWafFSyJQC/1DHuQRILIx
 3bv2sQ3TqQBiIinufiim+czLqvZ+puTfoEKvPHcVl2AXnAg7C5VWdCvoXBkQ9Zh2YpGT
 /9Yc5BJd2OZ/c7svzuAxvlRrTY0+khnYeeGZ0tdfLlpS4MX4z/0C2aHc+wqc2Zkzf/gY
 BHlezFcxeA40cRPW5WlsMoYRpJtg2FtPk/RVcWK/fYPzNFqHRFUkHGp6VWnN49i+uatT
 p1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563532; x=1762168332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k1b44YiDbKt04f0+TC89kYzcy4R8hkZYmp3ahyMwERI=;
 b=mNePcJ4STuz5/3lmVQY3XL5/dpXuPHKz4QY1NuHTpHaiJ5neDc8fLkgIG4V3ouNpnK
 a115iLmKT5RqIw10cDNC+wpvl7Ji1kprau3MvwzDhEeoWbUAy/pay57LS4erZ0Mfr4Q2
 FLurZnI+nA4nUHUQCIFbwklHS8HQwRvx90Rh0vnz0P4HoGAVbYGrQlqxxRyNJyNHGmAu
 Uavcryfu6jMQY+5PUSvToqIlKOuJvH/Go+a25Jtv8zT2wzGWkcbYdfYacQ/BiP+4KiRy
 EU8ec55/LpeJWfJ/aTHteLsTiGtaGVEVvqDDZPJKu67v5fzrsk6gZHllFhJ5aTa3ixGz
 K1SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXujXGIYNVbrHq2ZbfsfH/BUdH4wm3B5yLAdShdbPzZaHUSynRFNcofIU04Y452MWQbWvMybVX8tw==@nongnu.org
X-Gm-Message-State: AOJu0YwBJAbvPtbpd9INTAqu2T8bx0oS5lN7yU8jYVZe0py2O4m3tK7d
 FwNT1IIE6BSQyEseEfWJUt8yr3Zy1/CboVbmX3appMxKYdl3CXizaGnLvQBSzPqSKqw=
X-Gm-Gg: ASbGnctJG1S99RLYrFrO5v5dxqEacrJTaUtD58+CfuGRsRVRQ0je9aYHpGHzI58Vo5F
 MVmX9AYSZElG5u7W3GQEVMuBrmd6F04ZMxDokZGK2nDSYQVnbtv2Eb4QJu1LdGKSi7K+kCYfTE1
 Yi2FzAW1+sYev8swadXvpoAu1t5j1jJEYdSHZ9h+CJKlfuEXKmShbtK8EXlUnBXTDKp84iT3IOR
 RVJmLxEfd1VvJgDAS80xU70JXKMd3B+NRwlSvuE6kqwHBwIqlFBetPPSf2wWP3mBdTY6LbqWKou
 C5mKM+ss0T4ENnyeHWsQflBnMLyi8afT2u5X9jVaKZ9TzXuZgLTvmpinh0r9DuGyH7gJMBivejh
 vW90SMAJ0cuBSf0kXB5PNIQPaz6veyvrE3VOVPXupDzJhXnlH7QfI1q6NIg2t9mL25MYbsCRhCu
 S0
X-Google-Smtp-Source: AGHT+IFAV+BoEUvv3MUqiX7rf+U8AhNUN79l2kx30OOeXcgUQBGUQGIdMqmuudNqjd0S8ZvzpH+5Eg==
X-Received: by 2002:a17:907:7e8e:b0:b41:4e72:309f with SMTP id
 a640c23a62f3a-b6473f4543fmr4224357866b.50.1761563531615; 
 Mon, 27 Oct 2025 04:12:11 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853c5c0dsm730859166b.40.2025.10.27.04.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:12:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0F3D060D95;
 Mon, 27 Oct 2025 11:03:46 +0000 (GMT)
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
Subject: [PATCH 21/35] target/ppc: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:28 +0000
Message-ID: <20251027110344.2289945-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

From: Julian Ganz <neither@nut.email>

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places hooks for Power PC targets.

Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/ppc/excp_helper.c | 41 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d8bca19fff5..6d05b865058 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -27,6 +27,7 @@
 #include "internal.h"
 #include "helper_regs.h"
 #include "hw/ppc/ppc.h"
+#include "qemu/plugin.h"
 
 #include "trace.h"
 
@@ -404,11 +405,31 @@ static void powerpc_mcheck_checkstop(CPUPPCState *env)
     powerpc_checkstop(env, "machine check with MSR[ME]=0");
 }
 
+static void powerpc_do_plugin_vcpu_interrupt_cb(CPUState *cs, int excp,
+                                                uint64_t from)
+{
+    switch (excp) {
+    case POWERPC_EXCP_NONE:
+        break;
+    case POWERPC_EXCP_FIT:
+    case POWERPC_EXCP_WDT:
+    case POWERPC_EXCP_PIT:
+    case POWERPC_EXCP_SMI:
+    case POWERPC_EXCP_PERFM:
+    case POWERPC_EXCP_THERM:
+        qemu_plugin_vcpu_interrupt_cb(cs, from);
+        break;
+    default:
+        qemu_plugin_vcpu_exception_cb(cs, from);
+    }
+}
+
 static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
 {
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
     int srr0 = SPR_SRR0, srr1 = SPR_SRR1;
+    uint64_t last_pc = env->nip;
 
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
@@ -456,6 +477,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
             if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
+                qemu_plugin_vcpu_exception_cb(env_cpu(env), last_pc);
                 return;
             }
             env->spr[SPR_40x_ESR] = ESR_FP;
@@ -510,12 +532,14 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
     env->spr[srr0] = env->nip;
     env->spr[srr1] = msr;
     powerpc_set_excp_state(cpu, vector, new_msr);
+    powerpc_do_plugin_vcpu_interrupt_cb(env_cpu(env), excp, last_pc);
 }
 
 static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
 {
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
+    uint64_t last_pc = env->nip;
 
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
@@ -567,6 +591,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
             if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
+                qemu_plugin_vcpu_exception_cb(env_cpu(env), last_pc);
                 return;
             }
             /*
@@ -653,12 +678,14 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     env->spr[SPR_SRR0] = env->nip;
     env->spr[SPR_SRR1] = msr;
     powerpc_set_excp_state(cpu, vector, new_msr);
+    powerpc_do_plugin_vcpu_interrupt_cb(env_cpu(env), excp, last_pc);
 }
 
 static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
 {
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
+    uint64_t last_pc = env->nip;
 
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
@@ -708,6 +735,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
             if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
+                qemu_plugin_vcpu_exception_cb(env_cpu(env), last_pc);
                 return;
             }
             /*
@@ -758,6 +786,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
         if (lev == 1 && cpu->vhyp) {
             cpu->vhyp_class->hypercall(cpu->vhyp, cpu);
             powerpc_reset_excp_state(cpu);
+            qemu_plugin_vcpu_hostcall_cb(env_cpu(env), last_pc);
             return;
         }
 
@@ -803,12 +832,14 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     env->spr[SPR_SRR0] = env->nip;
     env->spr[SPR_SRR1] = msr;
     powerpc_set_excp_state(cpu, vector, new_msr);
+    powerpc_do_plugin_vcpu_interrupt_cb(env_cpu(env), excp, last_pc);
 }
 
 static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
 {
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
+    uint64_t last_pc = env->nip;
 
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
@@ -858,6 +889,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
             if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
+                qemu_plugin_vcpu_exception_cb(env_cpu(env), last_pc);
                 return;
             }
             /*
@@ -908,6 +940,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
         if (lev == 1 && cpu->vhyp) {
             cpu->vhyp_class->hypercall(cpu->vhyp, cpu);
             powerpc_reset_excp_state(cpu);
+            qemu_plugin_vcpu_hostcall_cb(env_cpu(env), last_pc);
             return;
         }
 
@@ -947,6 +980,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     env->spr[SPR_SRR0] = env->nip;
     env->spr[SPR_SRR1] = msr;
     powerpc_set_excp_state(cpu, vector, new_msr);
+    powerpc_do_plugin_vcpu_interrupt_cb(env_cpu(env), excp, last_pc);
 }
 
 static void powerpc_excp_ppe42(PowerPCCPU *cpu, int excp)
@@ -1073,6 +1107,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
     int srr0 = SPR_SRR0, srr1 = SPR_SRR1;
+    uint64_t last_pc = env->nip;
 
     /*
      * Book E does not play games with certain bits of xSRR1 being MSR save
@@ -1144,6 +1179,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
             if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
+                qemu_plugin_vcpu_exception_cb(env_cpu(env), last_pc);
                 return;
             }
             /*
@@ -1252,6 +1288,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     env->spr[srr0] = env->nip;
     env->spr[srr1] = msr;
     powerpc_set_excp_state(cpu, vector, new_msr);
+    powerpc_do_plugin_vcpu_interrupt_cb(env_cpu(env), excp, last_pc);
 }
 
 /*
@@ -1373,6 +1410,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
     int srr0 = SPR_SRR0, srr1 = SPR_SRR1, lev = -1;
+    uint64_t last_pc = env->nip;
 
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
@@ -1472,6 +1510,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
             if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
+                qemu_plugin_vcpu_exception_cb(env_cpu(env), last_pc);
                 return;
             }
             /*
@@ -1516,6 +1555,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         if (lev == 1 && books_vhyp_handles_hcall(cpu)) {
             cpu->vhyp_class->hypercall(cpu->vhyp, cpu);
             powerpc_reset_excp_state(cpu);
+            qemu_plugin_vcpu_hostcall_cb(env_cpu(env), last_pc);
             return;
         }
         if (env->insns_flags2 & PPC2_ISA310) {
@@ -1662,6 +1702,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         ppc_excp_apply_ail(cpu, excp, msr, &new_msr, &vector);
         powerpc_set_excp_state(cpu, vector, new_msr);
     }
+    powerpc_do_plugin_vcpu_interrupt_cb(env_cpu(env), excp, last_pc);
 }
 #else
 static inline void powerpc_excp_books(PowerPCCPU *cpu, int excp)
-- 
2.47.3


