Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4297760lfv;
        Tue, 2 Nov 2021 21:09:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysWZz61cq0vbfy4+pNW/B5Eboy7M3aR6+0lvql/yVxiQYEq4QQ+BGTscn3dXwqh5JlCqQ2
X-Received: by 2002:a9d:75c2:: with SMTP id c2mr31710545otl.69.1635912579471;
        Tue, 02 Nov 2021 21:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635912579; cv=none;
        d=google.com; s=arc-20160816;
        b=S11UdQ9WJfeRYHQ9is7Mh/G9l79iVEja7MMv2bGVVHRMrYtYs8dlFYOdNCFAHZT5rJ
         DwdGjmJB/w+HyjNXXgTu5ZZn5U1+L66jfQTbwP8TIwW0cwltzD47MMb3Fi90iPGw3wW5
         ZSt2tEmKaBKfn+oEy0GAMrYR85Id8byNbOwL8vokHHDX1YMbr8prvw7WssjKwh9uuepX
         iK6Cz7fcyRRKd7liDIFZf/FlYlCW6X3A1318spMWvudYiyUfXhjXpoMnwu+mILhIq3hg
         L5dDNOEyJUBs6KyFu7Jxb6GiYvZ6jDSY1fybetJwksA7GaAfwlukbRYOaU7aHFpxne3s
         hUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ML6fKNTEkgsDPbAJVxy09+sBxdECZjbfdFlmno/fZac=;
        b=Xr6lKG/TR01kzBVoPLJ94YWfe+ZnCCcHFbltYS02diff1MpsG6xDmxpnC/YAKVWI71
         qSmnmpwpTnzjNZQD+Ua3WbnKLr0f3f9AS7aCduTjrVbpDYm4EsjiQ6TM9wCPbIkA2cu4
         nPL3ApU8Ay5oOrxy4eCye8f8B9m273eNlcBj6AiIntIVtsIOp9SHbX6iJ2VVHMEuzcGa
         w+SOWW4LedZoULQLWm/RC2j588qyoMYnPmE1XbUULQg5bM0uleI8Bv9Pyl519iwCXJ9/
         7pVzR5bJDmKQMC16Vo27JA+Hm5GeSFOqpX160TlNAGsfFrnD/d0MH5SVjeyeIcbAzLPq
         oJ0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xcg/YGsm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si1475122otm.161.2021.11.02.21.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 21:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xcg/YGsm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mi7aj-0008PZ-O1
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 00:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VL-0005FT-Qf
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:04:05 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:35364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VG-0000um-Qc
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:04:02 -0400
Received: by mail-qv1-xf35.google.com with SMTP id u25so1500207qve.2
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 21:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ML6fKNTEkgsDPbAJVxy09+sBxdECZjbfdFlmno/fZac=;
 b=Xcg/YGsm08ZEMuXvNc00sTULLbwxqvhKV38+Fbbr6CM67bzKPqOePfI3jQj17EFE6Q
 6SkbAHsFjMdhaXHlzOjEXJ4MxAgBdSpOwJWsIh3IEl2mR+LF+s3ljeXshn7YX9Yh7yu9
 1CAGjiVaHk/lHBmjwjtgTBJLtc/sm8XrSExZ7HyiNPwHlC2LgT+dM7/q861TGSjW+86O
 MhxE5P7S81Jp0gdAUvYX4eNL8LLRiCzfGSQiD/mioeFbQ9IZ3IumrtaVE0mWMBDqW8Bg
 IXeBIndqPoOQA+bbKB3+liaTuMOjX0sddO0aN/+rS2bI7hK/+6S0hiGx2DgO6S69/AkH
 ynWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ML6fKNTEkgsDPbAJVxy09+sBxdECZjbfdFlmno/fZac=;
 b=hTj0cGyQcfmE60Nqpqmm/rpo3evhROVMxQ+hjX0nlsKlzDRTRgxN7TUBLUG9S0DuWd
 Qt89/Saj3sqPW9BMbHmBlVbqMD03cvWqw9MUhlPpGX8bDOSp4wnKjeH7uYs3WZz0Wc//
 KESSaU79ImDpTXUsrUcMgfHTiVDWBaxPEEbeWcCfJ5+ii1HcqgWOHZedQl7wXafQujoW
 WvYe/yrVCzXIKDNFGoXvQRP/GIUnEV0ZAQBASP6BaNDZafSuWsFIwhgIVBRljGIlv1y4
 UWyEb6w4arrBcSc7Us9xQbGxI7C5nRS0FEYvYLETh8hYUzRg0JA+DPlY+bfvIpRzyCss
 b19Q==
X-Gm-Message-State: AOAM531mrgBROE2lyGW33+MSjqvBy+XCNmYV6hxVihk1PCbyCuhjLgMO
 xJ6KfpjVwq/Ors/QD/FD6a7lGP+EREfoqw==
X-Received: by 2002:a0c:fec7:: with SMTP id z7mr27995512qvs.16.1635912237981; 
 Tue, 02 Nov 2021 21:03:57 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/10] target/arm: Split compute_fsr_fsc out of
 arm_deliver_fault
Date: Wed,  3 Nov 2021 00:03:48 -0400
Message-Id: <20211103040352.373688-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VCFNK33iZSYp

We will reuse this section of arm_deliver_fault for
raising pc alignment faults.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tlb_helper.c | 45 +++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 12a934e924..4cacb9658f 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -49,25 +49,11 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
     return syn;
 }
 
-static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
-                                            MMUAccessType access_type,
-                                            int mmu_idx, ARMMMUFaultInfo *fi)
+static uint32_t compute_fsr_fsc(CPUARMState *env, ARMMMUFaultInfo *fi,
+                                int target_el, int mmu_idx, uint32_t *ret_fsc)
 {
-    CPUARMState *env = &cpu->env;
-    int target_el;
-    bool same_el;
-    uint32_t syn, exc, fsr, fsc;
     ARMMMUIdx arm_mmu_idx = core_to_arm_mmu_idx(env, mmu_idx);
-
-    target_el = exception_target_el(env);
-    if (fi->stage2) {
-        target_el = 2;
-        env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
-        if (arm_is_secure_below_el3(env) && fi->s1ns) {
-            env->cp15.hpfar_el2 |= HPFAR_NS;
-        }
-    }
-    same_el = (arm_current_el(env) == target_el);
+    uint32_t fsr, fsc;
 
     if (target_el == 2 || arm_el_is_aa64(env, target_el) ||
         arm_s1_regime_using_lpae_format(env, arm_mmu_idx)) {
@@ -88,6 +74,31 @@ static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
         fsc = 0x3f;
     }
 
+    *ret_fsc = fsc;
+    return fsr;
+}
+
+static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
+                                            MMUAccessType access_type,
+                                            int mmu_idx, ARMMMUFaultInfo *fi)
+{
+    CPUARMState *env = &cpu->env;
+    int target_el;
+    bool same_el;
+    uint32_t syn, exc, fsr, fsc;
+
+    target_el = exception_target_el(env);
+    if (fi->stage2) {
+        target_el = 2;
+        env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
+        if (arm_is_secure_below_el3(env) && fi->s1ns) {
+            env->cp15.hpfar_el2 |= HPFAR_NS;
+        }
+    }
+    same_el = (arm_current_el(env) == target_el);
+
+    fsr = compute_fsr_fsc(env, fi, target_el, mmu_idx, &fsc);
+
     if (access_type == MMU_INST_FETCH) {
         syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
         exc = EXCP_PREFETCH_ABORT;
-- 
2.25.1

