Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5171218lfc;
        Wed, 28 Jul 2021 17:47:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygc0IDh1/ISh4ue+KB2kRzJGh4e/cSIAjnDdjuFJmtkye7Jec0h8iNUmnC+OMn9RJi7J6t
X-Received: by 2002:a05:6602:446:: with SMTP id e6mr1798919iov.85.1627519647919;
        Wed, 28 Jul 2021 17:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627519647; cv=none;
        d=google.com; s=arc-20160816;
        b=h7dQ3CqHI5t85uBNp0PfYdGY44NFyAyCtyfIOUptj7Mb8HLGVx5169XB4KEOc23EPu
         fuEjRQlRw1fdnTGv3AGHHHoBfDrbaoZHVS2J2lEGGt2FkDxXAzrEP830y05ZmHHxILzR
         5PVGz9hXqK8c8aR8Q/do+kKJQWM7QyWL1CV2P5jY26MiXiZefS6iwrSJ52yR3HMh+A2Y
         mQBH2HMyiiZE5dvEQMY7NuCMYYFUtFMn9JpmEXMq2c3LX0Wy9WcL9hGTQD+xClmy+FfZ
         f5SO6uR8+cc7KogJbicEuOCC6aJ7GqdLC50DJsqTYZxworXuoRDDrfTUs6agc1I5nmHE
         uung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VJ8uTcke4SajDVt7FCT6EHsU3nGyX1rmSUpR3pKNo+M=;
        b=Xl3VA72LCPlED/2Fc9NMGJlwdDb6lSTb/JHNcN76CfNcBfdsUb5PdCLmeWjDvUWRBM
         c/7imC9zyA2fIXXqBWUgfsMKY9tlalYCwrNtzLeyOU4QEM/jJXvLTVvhwGncGsYRLwdX
         gze5opHKNkIeIxDYMjBxxDw/nq7UOAtvijXDTC9rrwAgA/9Z2B1govndny3UvYCPDKz1
         P8QteeoOX0i687DIRmihKkgfvgNFakt3aH9OX1FEHyxFv34CdXxf2jD4Sy5moGH3IgYR
         2vlxACBGel+8KtKaa2qAvn2xvDepSvjY8HJgN5sxZGTuNlJzYPpZoyqFnDoLOj8U1im+
         X8dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j97tfnX2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si1528285ioj.88.2021.07.28.17.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jul 2021 17:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j97tfnX2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m8uCs-0003wN-Us
	for alex.bennee@linaro.org; Wed, 28 Jul 2021 20:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCP-0003tT-IW
 for qemu-arm@nongnu.org; Wed, 28 Jul 2021 20:46:57 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCN-0002N3-OI
 for qemu-arm@nongnu.org; Wed, 28 Jul 2021 20:46:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f13so4892877plj.2
 for <qemu-arm@nongnu.org>; Wed, 28 Jul 2021 17:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJ8uTcke4SajDVt7FCT6EHsU3nGyX1rmSUpR3pKNo+M=;
 b=j97tfnX2DMRd2yfl8JDHejGj12hTbtP66V834UnBC6lL1tG25Czxrdsv4s8ksvtfb1
 s4U8njnFlq9isXWnznjG7yWwm5u9yn4ZpKSau2w4u20dqeJOlXFdrFbx/xEz85d6BDBp
 n7HTeS3cCYwD7S+sIQB5MnZUultCHvuXryo89QDKy9uSE/pqeQUFPyU51iQq68cTf+Nq
 ZoSpOVcToOY1vSZqKvGQxEdFkTrQ84y83zipCNXYp2RyZFb13Aa8FVR3USZvMKrpO0Y3
 j4suyAf/ytgEELcGVGwcPxoQ4dTidAFF0v4cc/hLBAYOb/honYrP2vwrG7eIHG/GLt0F
 y+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJ8uTcke4SajDVt7FCT6EHsU3nGyX1rmSUpR3pKNo+M=;
 b=KxuOakS634cd87KEamBvq9WbfpYZINjKUF2W7OM5C8ZkY9g1D9x5NX5woIyBSFbKC1
 3zGKcZlyuw4WC44Wum0hGZUsy0IPhVu8VFkzB1Hn/CW4RD/anWlEikI0Ly0pvsIzeFMA
 V2mXI0Cbyj/AGdYiZ+Nq0g1fnN2kL81xjXpFVRVMbCrsQQfRh7AHFh1N5fvDPayICTKU
 dKkv0nUs5p7uN2Cf/57suP4vVV92wWiZvmDu4sZ46QeLk8ulMo7abFItpdrGljCOdRds
 fFT0tnkLZ6lS+VpRQZI0t8biqPBLirwdKRj+oSRX+j0GeXJ0yMGnJh5tUGlrjfnxbloC
 86Kw==
X-Gm-Message-State: AOAM533nJJuQJabcuY0t+bW0hp7U+pu92bMrBLkijAyANwgV0VBxkWxk
 3+v/EtZLXSQO7ZeMIzielSGvYA==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id
 d18mr12387310pjw.102.1627519613939; 
 Wed, 28 Jul 2021 17:46:53 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:46:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 03/43] target/arm: Implement do_unaligned_access for
 user-only
Date: Wed, 28 Jul 2021 14:46:07 -1000
Message-Id: <20210729004647.282017-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jWgQCblM6k08

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c |  4 ++++
 linux-user/arm/cpu_loop.c     | 43 +++++++++++++++++++++++++++--------
 target/arm/cpu.c              |  2 +-
 target/arm/cpu_tcg.c          |  2 +-
 4 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index ee72a1c20f..998831f87f 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -137,6 +137,10 @@ void cpu_loop(CPUARMState *env)
             case 0x11: /* Synchronous Tag Check Fault */
                 info.si_code = TARGET_SEGV_MTESERR;
                 break;
+            case 0x21: /* Alignment fault */
+                info.si_signo = TARGET_SIGBUS;
+                info.si_code = TARGET_BUS_ADRALN;
+                break;
             default:
                 g_assert_not_reached();
             }
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 69632d15be..da7da6a0c1 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -23,6 +23,7 @@
 #include "elf.h"
 #include "cpu_loop-common.h"
 #include "semihosting/common-semi.h"
+#include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -286,9 +287,8 @@ void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr;
-    unsigned int n, insn;
+    unsigned int n, insn, ec, fsc;
     target_siginfo_t info;
-    uint32_t addr;
     abi_ulong ret;
 
     for(;;) {
@@ -437,15 +437,40 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            addr = env->exception.vaddress;
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            info._sifields._sigfault._addr = env->exception.vaddress;
+            /*
+             * We should only arrive here with EC in {DATAABORT, INSNABORT},
+             * and short-form FSC, which then tells us to look at the FSR.
+             * ??? arm_cpu_reset never sets TTBCR_EAE, so we always get
+             * short-form FSC.
+             */
+            ec = syn_get_ec(env->exception.syndrome);
+            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
+            fsc = extract32(env->exception.syndrome, 0, 6);
+            assert(fsc == 0x3f);
+            switch (env->exception.fsr & 0x1f) {
+            case 0x1: /* Alignment */
+                info.si_signo = TARGET_SIGBUS;
+                info.si_code = TARGET_BUS_ADRALN;
+                break;
+            case 0x3: /* Access flag fault, level 1 */
+            case 0x6: /* Access flag fault, level 2 */
+            case 0x9: /* Domain fault, level 1 */
+            case 0xb: /* Domain fault, level 2 */
+            case 0xd: /* Permision fault, level 1 */
+            case 0xf: /* Permision fault, level 2 */
+                info.si_code = TARGET_SEGV_ACCERR;
+                break;
+            case 0x5: /* Translation fault, level 1 */
+            case 0x7: /* Translation fault, level 2 */
                 info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = addr;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                break;
+            default:
+                g_assert_not_reached();
             }
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2866dd7658..de0d968d76 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1987,11 +1987,11 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
+    .do_unaligned_access = arm_cpu_do_unaligned_access,
 
 #if !defined(CONFIG_USER_ONLY)
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
-    .do_unaligned_access = arm_cpu_do_unaligned_access,
     .adjust_watchpoint_address = arm_adjust_watchpoint_address,
     .debug_check_watchpoint = arm_debug_check_watchpoint,
     .debug_check_breakpoint = arm_debug_check_breakpoint,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ed444bf436..1b91fdc890 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -904,11 +904,11 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
+    .do_unaligned_access = arm_cpu_do_unaligned_access,
 
 #if !defined(CONFIG_USER_ONLY)
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
-    .do_unaligned_access = arm_cpu_do_unaligned_access,
     .adjust_watchpoint_address = arm_adjust_watchpoint_address,
     .debug_check_watchpoint = arm_debug_check_watchpoint,
     .debug_check_breakpoint = arm_debug_check_breakpoint,
-- 
2.25.1

