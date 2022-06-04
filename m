Received: by 2002:a05:6512:3108:0:0:0:0 with SMTP id n8csp1709901lfb;
        Fri, 3 Jun 2022 21:32:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeMPSi5bI2qXWKuWP/5iezDo9BRaSNRf8nc9xymKgErePGsPQZc6ku7Rv0dTebOWeHwbsE
X-Received: by 2002:a05:620a:2888:b0:6a6:562e:c179 with SMTP id j8-20020a05620a288800b006a6562ec179mr8905441qkp.587.1654317165364;
        Fri, 03 Jun 2022 21:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654317165; cv=none;
        d=google.com; s=arc-20160816;
        b=i3Eszlrtm3CB0U37o2RL870MLHvDNyzWREXlgLORCWdvokYCVeVLH9AMBkjaY2f1iY
         pCZAESD4FRu37+iGMeC+sT55V3Szdqwv1OQqSXoJdUUL1IasQSARvKylFPDvv+kLmoqK
         tXbl9Pc1Tz85GKxgtRWxySYEd8XBghkvEY+dXnr0S8wVEd1gsFsv2Y1v6kfzBELk+Wuq
         iEoIP9kluFAVtN6lhg50UOwetOxgAhvvO6dajsh7Vlc2tCAs48SqpnIXQeSnUtkzF5f4
         HAr9E3ZpzmblwXWYRe21m0Ykjyf4K99lINC71WIyLb1NBCKBsQDoRlkFYLvuTlOaTngI
         7awQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0V/cRerK3utKUgc+h6XMR5lrbyMMtBcUkcTnLi1nxw0=;
        b=CWkJCHStISstbM9oDX+0emMM8jxp2Sc4rE/jmFUNxEeFN9bMlXM9u7Z4YnvUjud9Yc
         P+hU1Xe1mfEMezeyjWqbQED8+k5d/AwXGkG0qFVQvrbuRoM9JIVQXc+Gsdpyec4MY5f0
         E8teKZ4dli8rT6OKywisdwhOwF5Nj4Z6jUO7CWxinEoWkOeN0Rq92YqAqK1cgT4iD5jb
         hkwEYJ7sP3/4k/Uzi79nkbkvtFf60YA8mDbK3i/PWoRU9pZjLPN1SadF10GrWE7bULnJ
         uQHb+Wco4gOaPC8o6q1FwsLUxy6pYkV0xev2aOoGcyA5Qum9J3H9MMzRZSz9I5L9LJL0
         HyAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A/VR0+df";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a37bc02000000b006a461f1745esi4377194qkf.162.2022.06.03.21.32.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:32:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A/VR0+df";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxLSu-0000FK-Mf
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3b-00008B-Gz
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:35 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3Z-00006u-W1
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:35 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so10351951pjm.2
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0V/cRerK3utKUgc+h6XMR5lrbyMMtBcUkcTnLi1nxw0=;
 b=A/VR0+df9og6A9wZN4lCp5JHS2Q5KLYaYEE2/vraJblBWb+KIUD1cfyZxRod7OX59o
 na+zGWaS8vW/ESgKS1c+nVu/bcq5OkGMJuVGhg90m1vOIJsRGIWRIZ6moe6D0Mk7bmGF
 tGr1z+zNfTr2q27QdyXDRugeswfs0GxlKPpG7/u8TXMVPAHvyFe6/UVb6MEbHZ5uGjyY
 u8fhTPmPtwlqSqcG1jXe9NeB7M3pIwdNl8CHMvqzWt32vPxKSfkD4r9Se5t28vLhGTK6
 c0fiEvQExMj9PbW8vJmb9eNyLXUlFk1pGzI6H2QGlAzDTv6NaybMA0AuRLeZ3tk4OGNT
 mu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0V/cRerK3utKUgc+h6XMR5lrbyMMtBcUkcTnLi1nxw0=;
 b=auAcm9xCyjyZvhzWyhDz3WHmzNqnK3gpSRkrWLOQqYt2Jq7AJXhqfgI42SkFK7f7C/
 ns1aQ3A730tMSEu3tvfpKe3/3LR8ShBpU3HmcCLAhtnkHKzTMNsi1tp4usOw9O3HSe/J
 fqiW+TRqJ3HDX8nOAb+1HDrdGlG2bayAiYw/VdPknjuLahbZm3d0T62gxgM6qCUO/8t5
 ZQnPBzRsWcMJUEmPhdzKZx4hO1CNtKG/22V5Zod9COu9EBnZVTDlneOYxdN449oIuSWh
 WLVCbhV60wlJUuD542zq+IhjgFj1gJUDB/zDRHflRNcTOnre6riDqxyeZM9RZf0FQVr4
 2Ndg==
X-Gm-Message-State: AOAM530eQMfMgbW9FF2dAF/h05PRgEjqSPeBnBUCqB62jQnlNzYNWznP
 SKa14vRAJwA4RmdbfUyZnjCuFyQJhUGLww==
X-Received: by 2002:a17:902:e888:b0:163:f3e5:b379 with SMTP id
 w8-20020a170902e88800b00163f3e5b379mr13235944plg.62.1654315593138; 
 Fri, 03 Jun 2022 21:06:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 26/28] target/arm: Move arm_cpu_get_phys_page_attrs_debug to
 ptw.c
Date: Fri,  3 Jun 2022 21:06:05 -0700
Message-Id: <20220604040607.269301-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O+K4lOEwyXRQ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 26 --------------------------
 target/arm/ptw.c    | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7390798463..1c75962a3b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10570,32 +10570,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     };
 }
 
-#ifndef CONFIG_USER_ONLY
-hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
-                                         MemTxAttrs *attrs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot;
-    bool ret;
-    ARMMMUFaultInfo fi = {};
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    ARMCacheAttrs cacheattrs = {};
-
-    *attrs = (MemTxAttrs) {};
-
-    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &phys_addr,
-                        attrs, &prot, &page_size, &fi, &cacheattrs);
-
-    if (ret) {
-        return -1;
-    }
-    return phys_addr;
-}
-#endif
-
 /* Note that signed overflow is undefined in C.  The following routines are
    careful to use unsigned types where modulo arithmetic is required.
    Failure to do so _will_ break on newer gcc.  */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ec60afd9bf..e9f6870d0a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2491,3 +2491,27 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                     phys_ptr, prot, page_size, fi);
     }
 }
+
+hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
+                                         MemTxAttrs *attrs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    hwaddr phys_addr;
+    target_ulong page_size;
+    int prot;
+    bool ret;
+    ARMMMUFaultInfo fi = {};
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    ARMCacheAttrs cacheattrs = {};
+
+    *attrs = (MemTxAttrs) {};
+
+    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &phys_addr,
+                        attrs, &prot, &page_size, &fi, &cacheattrs);
+
+    if (ret) {
+        return -1;
+    }
+    return phys_addr;
+}
-- 
2.34.1

