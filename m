Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp499551lfo;
        Wed, 3 Feb 2021 11:29:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcK50vALKNcMCAQqvSWRKY95Dk+a0IC4nobf9PyLIvMB7eCtZA3+iixQmNw+pkxvlKAgtU
X-Received: by 2002:a25:df8b:: with SMTP id w133mr6739534ybg.212.1612380566456;
        Wed, 03 Feb 2021 11:29:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612380566; cv=none;
        d=google.com; s=arc-20160816;
        b=S3esLuRmUkJ0PgEZ0E/SMim/CvD7FMke/VGIqzPxG4jUr+WlbX/YOw3jp6cOe3V7bV
         0nbhiy8065NKO7nN7F0WXbTiH3zJnCQ1d/W4GMh5vyFgV4toU5viuiH59FfWnjK5TW3D
         vIAQTwNh2yD56MHyMJhni4+SKVJBO4GLhu6nlpy1lf/CM71QgGkPBh5q8+8+bCxucjEB
         G6XQkiSBva96FpTKmWbnk38o+vIsiOK8STYmXKOKUpcAV34eVmZ1vgNfRETOi4NArmKc
         2Nyra84Ul6+DOXqUIsXuUAO1WxoRTVQsKTYOMouoFwfE7TmxtXboPppt1mI5M7s1ieku
         JIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+5hZcB3mFjnWG5tCYVBAVH8vDfhhkDYHCqbXJC4msCo=;
        b=V1e8qSkzyKVSdl5ecAE5LzboAAnBf2cS6gQpGVlbQ2M7jVAo30SbkqkL0GA4QKzXIN
         mxOpNDauXbvScFcBQHO2cajzl01T0VNoja9I4JtRZDryvcDGDxs7UUm5/xWXOxVhD4uk
         CA3P7UrYJ5z3Kva3Ga9SVNUDu8Gyy1ZvaW6UVJDotBqc0fIVrcsQu2xdqnwYPtmMsYH1
         BLXFp2aq6tJTGYxDKhYpj+Ufvg0e5TqpyHl5lRKJdH27SMV8e5o01dSNChUm1HQJI+Uy
         mxLGvumYPbxe5u4lzeFz4YWAukPxMN4RqmyrwDnFF4ezriP7wEsf75cj/P0lRR2j5cPd
         /Faw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rSaXeYK0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si2805220ybb.357.2021.02.03.11.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:29:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rSaXeYK0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Nq9-0005x0-Lx
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOu-0007aA-Ov
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:20 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0001pK-CM
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:16 -0500
Received: by mail-pf1-x42b.google.com with SMTP id e19so423061pfh.6
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+5hZcB3mFjnWG5tCYVBAVH8vDfhhkDYHCqbXJC4msCo=;
 b=rSaXeYK0CKweyFIt9SP5Ilx9VcuVeuXC8BLQn7U8cKlqX2+lEPemW/mSSdmHE0ELoK
 HRcmf/rGfGxzVUXn96kBrALc5zC22mhZyyW3aR+JSu1YLZ2nr23ChK/9ZboDZSa9yxil
 AaBY/b5xu6FSw2Sx1+utRo4NZBdUYEpx+YZhyVYkn6ICrw6wHPcmelJ49jSn/QdDbamo
 r8ojg7u8pM6C7NVZiCSZkN/BzIf8iPm7LcBftHt1cK7L/pRKdSowrBBdP9YL97ZZTasH
 OhsXOTApsAcV+tlOr8bW/1Oj0xolRQEa1H/WuK5QC3kHg/oYhSvMpuPxlB4aCkEXhPYl
 pAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+5hZcB3mFjnWG5tCYVBAVH8vDfhhkDYHCqbXJC4msCo=;
 b=APjp9gko4hEnC4M0KXLgfz5pdKuDNLtkpKJMOgibGTBe1/fa+QxVE8QMdXH24G3XyJ
 SnVgaKrgxdYaxosR8MWdQqETgPy3bcCLmmgsQSCU5KFhPkh438C72CZCxQrVWTLrDM2G
 V6sz829KhMSAlkfPryvwkTl+2KeeErfJ5LTeSdhEnoBYoWgXLtbzEtfzSkzPSPVkpIND
 w3LsvkLT9PkIgKvdF5E0QaeWXKPrC/F0Hq1CZaUK9etoyJye+ZYUabVmOefpaeTQYUEA
 X3MwZ/IDjWFsHNHuU/7U0Hs8mPBQdESHqPrztt6NojyWnM0gmA59gVdmduQT2GMUXH/l
 DwOg==
X-Gm-Message-State: AOAM530zOQF92p39jvzcu8p+AdR132iCQFgh+yaT0yODjSnVoo75lLWM
 ky1rGCIgHujRgbNkOmxD/zs6fw==
X-Received: by 2002:a63:b55:: with SMTP id a21mr5134010pgl.409.1612378866677; 
 Wed, 03 Feb 2021 11:01:06 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 26/31] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
Date: Wed,  3 Feb 2021 09:00:05 -1000
Message-Id: <20210203190010.759771-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qtv+sWz4P+ZA

A proper syndrome is required to fill in the proper si_code.
Use page_get_flags to determine permission vs translation for user-only.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 24 +++++++++++++++++++++---
 target/arm/tlb_helper.c       | 15 +++++++++------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 42b9c15f53..4e43906e66 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -23,6 +23,7 @@
 #include "cpu_loop-common.h"
 #include "qemu/guest-random.h"
 #include "hw/semihosting/common-semi.h"
+#include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -76,7 +77,7 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
+    int trapnr, ec, fsc;
     abi_long ret;
     target_siginfo_t info;
 
@@ -117,9 +118,26 @@ void cpu_loop(CPUARMState *env)
         case EXCP_DATA_ABORT:
             info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
-            /* XXX: check env->error_code */
-            info.si_code = TARGET_SEGV_MAPERR;
             info._sifields._sigfault._addr = env->exception.vaddress;
+
+            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
+            ec = syn_get_ec(env->exception.syndrome);
+            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
+
+            /* Both EC have the same format for FSC, or close enough. */
+            fsc = extract32(env->exception.syndrome, 0, 6);
+            switch (fsc) {
+            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
+                info.si_code = TARGET_SEGV_MAPERR;
+                break;
+            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
+            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
+                info.si_code = TARGET_SEGV_ACCERR;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_DEBUG:
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index df85079d9f..9609333cbd 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -154,21 +154,24 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       bool probe, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
 
 #ifdef CONFIG_USER_ONLY
-    cpu->env.exception.vaddress = address;
-    if (access_type == MMU_INST_FETCH) {
-        cs->exception_index = EXCP_PREFETCH_ABORT;
+    int flags = page_get_flags(useronly_clean_ptr(address));
+    if (flags & PAGE_VALID) {
+        fi.type = ARMFault_Permission;
     } else {
-        cs->exception_index = EXCP_DATA_ABORT;
+        fi.type = ARMFault_Translation;
     }
-    cpu_loop_exit_restore(cs, retaddr);
+
+    /* now we have a real cpu fault */
+    cpu_restore_state(cs, retaddr, true);
+    arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
 #else
     hwaddr phys_addr;
     target_ulong page_size;
     int prot, ret;
     MemTxAttrs attrs = {};
-    ARMMMUFaultInfo fi = {};
     ARMCacheAttrs cacheattrs = {};
 
     /*
-- 
2.25.1

