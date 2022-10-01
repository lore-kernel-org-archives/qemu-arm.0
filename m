Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp468453ocs;
        Sat, 1 Oct 2022 09:48:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cW05mliEIdI3X1GQX+O21VcvFTTp+0S9jdoihu7YIcOjDHZOi2x9FGdNlT10i3bFnkg6G
X-Received: by 2002:a05:622a:138c:b0:35c:e9d2:8d76 with SMTP id o12-20020a05622a138c00b0035ce9d28d76mr11110067qtk.463.1664642921210;
        Sat, 01 Oct 2022 09:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664642921; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5Xb7003W5vHT1IxtQzoPpwdkCp8iO3PcjuH9/cnc1dkJFzqefYH6m5i2jAJOuQ+r7
         PygRhaZcA1PsVTymYgzourQIqDtVTv1PfsVm7fPHum4b58r2ub4M3s2Y2kQfdrgCW9L+
         mgttRhCmKcyAzHaUZuNqKh2AjGBUcLwXn77cSrLXN/GHd64KIAAuCbG6tEr59YLvFsL8
         /u+jAJ6VIgi5i+Iq4KqEn7ivFUwRKXj/uQwdsdOHJRkL13KnipPtX2v8hlkM/1GlMiwz
         M/1U4tdLV8YSraYXU6JqVD1dcYB+Eluf76xYCrJtH6OW6msB9ZsC1k/GwzCXCvYYVgp3
         DTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oFbrxWVVhP20S+fjmMivVlKkgtDc/8Dpni4vZ5iFbtA=;
        b=IKw5kZqkRVo6TzIEh7LWInrF54lmnwoLH+60fR0zYTzQWCWrDH17D2o/fd1h9TYbS7
         VciEo9WrujoDV5PxmGWUGblN0mvssm/Ei4ESV5RWeQUqoqw48/5n/I38mLFlYUCTCXre
         A2tefrG52ZEpgrxcDjPDlr8DO1jzFcc480/OpDgivwAFffXtuu6V7Ewd86Rjlt9U8leP
         JCoccp8dEGEukhcOOTCqv0Ty9Q7HwF2E3NBC0uSqqax2eZJSuxieSBF8Ajjgt4/prch/
         J8YnO7cJPraXrmt8D7P/mRy5RcshZJIAN2s+AuxhxTJjj6/gOFFinvgehqL24sYnx0lP
         o/Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vU6wYrs1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n64-20020a37bd43000000b006cf2a95a11bsi2565394qkf.125.2022.10.01.09.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vU6wYrs1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeffM-0000zg-P2
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIP-0000iH-8R
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:57 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:43797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIN-0006Tc-Fr
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:56 -0400
Received: by mail-qt1-x829.google.com with SMTP id a20so4336866qtw.10
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oFbrxWVVhP20S+fjmMivVlKkgtDc/8Dpni4vZ5iFbtA=;
 b=vU6wYrs17obk+VOuEmRB21oaSwR9txXT/QMl6b74uvukqjgfMUbO6G1TTiOBx0DskI
 vv4C9+MClcLhODLJvWo4zKm+/QYFkix2zlKvndv9gfX8kDDm3vZZOYISfCbf3MUrZb/B
 6vcrjf2QezPOBafCTssBp8OI0+ePYO7QYp6N2ojcEJrVXBzgBgrhoaFKJOvTJn0D4ghM
 idiwF2jTnEnpMEA0YIgwCtTPGsgcgIaX+Mr84qzLBNguHveXuTOU9G75Fr0TZ7BGL5Zj
 ez/sMI/9uSFzcgvXHnZahBcYwVDptqvb9lAoXHXT8+TD/F/jMEROex5Sbov3ajTaZmlA
 S/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oFbrxWVVhP20S+fjmMivVlKkgtDc/8Dpni4vZ5iFbtA=;
 b=OzWCENNwRY9H4/+ngEgeF09xR3Ajn2HZPGcV0CKFQp+ijZiIXZ8iG/OfgloYxPeGiy
 bgniSnie94kYFdE3qeeAiZpW+awoJn0EsjClY22x975wfFJUsvpDErxmIdsKPMDXh1MN
 sxTRWflLskQQunj6c8K52HYNESTbLTxHwrryy0rYANeDkq8wcnaVTy2I4vSoISPLM2sn
 CKhVFkScbXU/CiH9bpPkaKwsFk1LfO+CiV+RAOE6IhF4xGx9xLEzkoG+ZSbr49cBOBpm
 7rrwwEMx3g+rjuK19XpcMzVAV4Dbj2e0noJ/eKmM1q/HpV0RoLpAhWIqjkGysgSwzb6D
 W7sA==
X-Gm-Message-State: ACrzQf1unqm+HWVy+L/SJ69TL8wfNgkKuRMs+vFnL+p2cQv1SvfybWVG
 XVPjzof2nATPqxPbwJQgW69nGF4jYHXaoA==
X-Received: by 2002:ac8:4e48:0:b0:35d:5831:af31 with SMTP id
 e8-20020ac84e48000000b0035d5831af31mr11206288qtw.188.1664641494564; 
 Sat, 01 Oct 2022 09:24:54 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 38/42] target/arm: Fix fault reporting in get_phys_addr_lpae
Date: Sat,  1 Oct 2022 09:23:14 -0700
Message-Id: <20221001162318.153420-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iXl2Zwg7r7iK

Always overriding fi->type was incorrect, as we would not properly
propagate the fault type from S1_ptw_translate, or arm_ldq_ptw.
Simplify things by providing a new label for a translation fault.
For other faults, store into fi directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e6b385a8b1..01a27b30fb 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1065,8 +1065,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
-    /* Read an LPAE long-descriptor translation table. */
-    ARMFaultType fault_type = ARMFault_Translation;
     uint32_t level;
     ARMVAParameters param;
     uint64_t ttbr;
@@ -1104,8 +1102,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * so our choice is to always raise the fault.
          */
         if (param.tsz_oob) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
 
         addrsize = 64 - 8 * param.tbi;
@@ -1142,8 +1139,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
     }
 
@@ -1175,7 +1171,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * Translation table walk disabled => Translation fault on TLB miss
          * Note: This is always 0 on 64-bit EL2 and EL3.
          */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
@@ -1206,8 +1202,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         if (param.ds && stride == 9 && sl2) {
             if (sl0 != 0) {
                 level = 0;
-                fault_type = ARMFault_Translation;
-                goto do_fault;
+                goto do_translation_fault;
             }
             startlevel = -1;
         } else if (!aarch64 || stride == 9) {
@@ -1226,8 +1221,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
                                 inputsize, stride, outputsize);
         if (!ok) {
-            fault_type = ARMFault_Translation;
-            goto do_fault;
+            goto do_translation_fault;
         }
         level = startlevel;
     }
@@ -1249,7 +1243,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= extract64(ttbr, 2, 4) << 48;
     } else if (descaddr >> outputsize) {
         level = 0;
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1299,7 +1293,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
-        goto do_fault;
+        goto do_translation_fault;
     }
 
     descaddr = descriptor & descaddrmask;
@@ -1317,7 +1311,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             descaddr |= extract64(descriptor, 12, 4) << 48;
         }
     } else if (descaddr >> outputsize) {
-        fault_type = ARMFault_AddressSize;
+        fi->type = ARMFault_AddressSize;
         goto do_fault;
     }
 
@@ -1374,9 +1368,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    fault_type = ARMFault_AccessFlag;
     if ((attrs & (1 << 8)) == 0) {
         /* Access flag */
+        fi->type = ARMFault_AccessFlag;
         goto do_fault;
     }
 
@@ -1393,8 +1387,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
-    fault_type = ARMFault_Permission;
     if (!(result->f.prot & (1 << access_type))) {
+        fi->type = ARMFault_Permission;
         goto do_fault;
     }
 
@@ -1439,8 +1433,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     result->f.lg_page_size = ctz64(page_size);
     return false;
 
-do_fault:
-    fi->type = fault_type;
+ do_translation_fault:
+    fi->type = ARMFault_Translation;
+ do_fault:
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
     fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
-- 
2.34.1

