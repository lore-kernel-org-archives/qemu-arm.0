Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3066527ejn;
        Sun, 23 Oct 2022 23:17:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xeDKxf5U3NDtNvficwINJ/d7uMN3zJlklTpzCa1Q+gMKCJBvxnL076AbHViDNxB6DvyoE
X-Received: by 2002:a05:620a:2807:b0:6cf:cb30:8ff5 with SMTP id f7-20020a05620a280700b006cfcb308ff5mr21535350qkp.206.1666592258283;
        Sun, 23 Oct 2022 23:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666592258; cv=none;
        d=google.com; s=arc-20160816;
        b=UPiLeTCX4pAZ6YJZEdogDARxRtV7HtT0SuvE+ZTrEI/aEgowwKibxLfRtojPA3df7X
         QvSi7SjeE1H8/VIwK7XvpnoE3A5zaEOaxqRJDr0IlKgfR7FcWPH4Ex6a2K6dj+HgY0kx
         rs4KXm1n0eRoQa1z14T1nU2tX24/7LPBZLLM2PlCsd1XsVFu0Knrm8XNvP8LFNRZmWb1
         APG9B7Pg+qrJRW41JZCE6G1NLca9RyBMiRkOmjauAx8hbioA+axNJe0wxYRY2Z2x9cZq
         2yYXcSzqscsv1dcM1OeKL3Sa5BLiORXZjUU0Cqk6SZ9Q0y2vd/W5+ZPBokjEfOMeuV9B
         VfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sdisIrMnl1TYgX+y3Jca2Lvj3mz6slgwmrdpC7jGGrw=;
        b=MYSlOY7ivvRVk91VEFvLLwbx5o0wVbG/rMap2iJMdD9vfTwBPKjam5P7XGywgbUhxF
         OBetwYjDzQYHWMzkJe3JgBC4iahyge0g2w00E8XydUjX+/5Ce9O6k7xabmW5a2D/bXUJ
         +D9wZUwKY2W20a/l5/FRhTsROeec4iMJFXitZZdkcRn1H6t5Li3kCDOLJkYfkgXol7pq
         VBaCnAZPTKXXZAP4mjZxX0UWLrZ1LnDaHiK7qKEbc6dstEG0vCbKe24eIvV9w6ymWcck
         TyxNGGC6IMPIHtpRtiSvJixs5eVKPWt5if8I+H2fOir2iMETABH4uwsqhMSIaVvIefE3
         17RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=og12VUip;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dz9-20020a05620a2b8900b006ee64cfb105si15749537qkb.387.2022.10.23.23.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 23:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=og12VUip;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omptE-000846-21; Mon, 24 Oct 2022 01:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprw-0006fC-Jk
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:26 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompru-0002OR-G9
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:24 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso2948829pjg.5
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdisIrMnl1TYgX+y3Jca2Lvj3mz6slgwmrdpC7jGGrw=;
 b=og12VUipEK1VY49HsgdcCA8e760wa1EattPTpkBogRteWDTlOIF45jSPqVT9Vy9wt8
 dXFaaKD1DN4/4b8QTxh8jsnx2KUsC7epVNBkE/hmDFVBmflO0qk7x0hC8A8NadIFTqeX
 WBd1LqdcswlNz+Wx8Neqs+NMFuvUZjj1pIJ2x+/8i9K9300RxfxWam0UZbAbkPFZNRyH
 CUJyONjkyGUBcDM/Uh4AjAnJHl9O7IIx82X+5UeZfPBLgPMBB5gryvr2Rz9iWgLPykPW
 MCpZAZYX1UrPJ+i4xRVOhwQoZ7ibxubynoap2r1sfruslhvzK9PqiGsuqYtkI3PUX+4A
 Xbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdisIrMnl1TYgX+y3Jca2Lvj3mz6slgwmrdpC7jGGrw=;
 b=BDFaFT4Maq6wAS2HpvBKxDQ6w3B1UUiuJ4Oud1vF3LCZvmfB7zarQ56GzcWs/RzfXS
 0jDtjVx/od9LH8BUB8WBUu1a4ZR8nExhbeldgN415AkU23N8qQnyCLnSNvZ4otcbdKl/
 0YJhZOhw1s5dpBH2Rx2z3gYFkKXF3xs0YebtJwyebWX3+Y4X5oycTtWpvJWAKGB67p7Z
 VU8KjJn7hcqtqQz+O6AKSF+Wx6VOIkVa+IaA8sMI6flCv0ofbGMWmmLrmJ/c9LbPId9j
 PaNXjPUa9ZfzKnKOjlc/8lmRSpkdPxnEvAOwVJBiEvRBMM1RCr+fUQXPej4Cy8i0mmrC
 TKDg==
X-Gm-Message-State: ACrzQf0RxecfwkKEkLaWvKMRclElC0KwDnpTdBHOxF/M2HZE2IrWBq1H
 /Y7EGamwyq/WINkNcMNoKSxOuC5SA52VIdIJ
X-Received: by 2002:a17:90b:4c48:b0:20d:5c55:b8a8 with SMTP id
 np8-20020a17090b4c4800b0020d5c55b8a8mr37161938pjb.207.1666588760266; 
 Sun, 23 Oct 2022 22:19:20 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 08/14] target/arm: Fix fault reporting in get_phys_addr_lpae
Date: Mon, 24 Oct 2022 15:18:45 +1000
Message-Id: <20221024051851.3074715-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HxTnWZi+/4kn

Always overriding fi->type was incorrect, as we would not properly
propagate the fault type from S1_ptw_translate, or arm_ldq_ptw.
Simplify things by providing a new label for a translation fault.
For other faults, store into fi directly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 615471699e..cd16b42c96 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1063,8 +1063,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     bool is_secure = ptw->in_secure;
-    /* Read an LPAE long-descriptor translation table. */
-    ARMFaultType fault_type = ARMFault_Translation;
     uint32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1101,8 +1099,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * so our choice is to always raise the fault.
          */
         if (param.tsz_oob) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
 
         addrsize = 64 - 8 * param.tbi;
@@ -1139,8 +1136,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
     }
 
@@ -1166,7 +1162,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * Translation table walk disabled => Translation fault on TLB miss
          * Note: This is always 0 on 64-bit EL2 and EL3.
          */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     if (!regime_is_stage2(mmu_idx)) {
@@ -1197,8 +1193,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         if (param.ds && stride == 9 && sl2) {
             if (sl0 != 0) {
                 level = 0;
-                fault_type = ARMFault_Translation;
-                goto do_fault;
+                goto do_translation_fault;
             }
             startlevel = -1;
         } else if (!aarch64 || stride == 9) {
@@ -1217,8 +1212,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
                                 inputsize, stride, outputsize);
         if (!ok) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
         level = startlevel;
     }
@@ -1240,7 +1234,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddr |= extract64(ttbr, 2, 4) << 48;
     } else if (descaddr >> outputsize) {
         level = 0;
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1301,7 +1295,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     descaddr = descriptor & descaddrmask;
@@ -1319,7 +1313,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             descaddr |= extract64(descriptor, 12, 4) << 48;
         }
     } else if (descaddr >> outputsize) {
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1376,9 +1370,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    fault_type = ARMFault_AccessFlag;
     if ((attrs & (1 << 8)) == 0) {
         /* Access flag */
+        fi->type = ARMFault_AccessFlag;
         goto do_fault;
     }
 
@@ -1395,8 +1389,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
-    fault_type = ARMFault_Permission;
     if (!(result->f.prot & (1 << access_type))) {
+        fi->type = ARMFault_Permission;
         goto do_fault;
     }
 
@@ -1441,8 +1435,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     result->f.lg_page_size = ctz64(page_size);
     return false;
 
-do_fault:
-    fi->type = fault_type;
+ do_translation_fault:
+    fi->type = ARMFault_Translation;
+ do_fault:
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
     fi->stage2 = fi->s1ptw || regime_is_stage2(mmu_idx);
-- 
2.34.1

