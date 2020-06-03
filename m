Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp42470lfc;
        Tue, 2 Jun 2020 18:31:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMMEUwUNueNZiAV9NBcwZOqjBzLtroNhXpA0Ryjib6hbbW3HSwQY/QoAqYd09mT6DKCWpe
X-Received: by 2002:a25:c245:: with SMTP id s66mr46379819ybf.441.1591147912193;
        Tue, 02 Jun 2020 18:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147912; cv=none;
        d=google.com; s=arc-20160816;
        b=tTHYhoY6u6lgEX/WsYdmtJNkpZ0n8cqlm/ZaKHBn0PrXyTXwaLt6SzCFaSGSWPRUkQ
         QHa1/fhhXsdB7wX2S3K5Q/n5+09qj/V5PoDAsDFAjB8TOcIoVmpfSoxy4Lvbh5C3G6Ne
         vUlcuDH/coWoNo6W33xP+Gn+sKkwRk/XaarJLtnM71f2uivli+ccJeR5toudIWLqzmil
         PJk3JMcfq1SEfzXRxFfZaQAeERxZeCJ9JpLqXggVDpwuPp3qrmIL66QK+AqpgQQr63dX
         WvzPhILwDz0K3f0a7ppNVDkIVMtWn5sbUp/Jo/lkaxyXZUwbDJXcguLqDvfgVT1roK6y
         DQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=665wfLrYyWEoos7hXDIalhn/FRb4JzUf+uVTCWnMdBk=;
        b=EDFY2OCQuuZDNsEdL7d/kiGiMfCN7e0GFXOj9c/eC/xuUUflpslW1rw8RPUJXnuMVK
         ozc1cci8r3QlyxTEXs5CH8m6SsntgyrShswiq6hx1JdaAMOGd80JFW4c9oz0hLSCFGNN
         l39/T/qLJixkV2nPAJjwX8C86G/HbK3WlOUzUqYcDewpjcOsVdRRJVjDH0kT000SKxD9
         okuB3vsaXR/q5uLM3wuyU4430jkargLchYtn5RlI7H6zY1Y7br7bkUHBye4s6yph8BEc
         5x7h19Cxw8Az+h5jHGlv6LqmjnNvHkZxE8AHceEVeoeG5I/c9Fnm+vxqSj3GgG0l7H54
         3M9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RFFLM/rP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z192si295248yba.387.2020.06.02.18.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:31:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RFFLM/rP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgIFz-00069R-Dk
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyv-0005Gn-Hw
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:14:13 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:44473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyu-0003hr-LC
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:14:13 -0400
Received: by mail-pl1-x642.google.com with SMTP id bh7so190134plb.11
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=665wfLrYyWEoos7hXDIalhn/FRb4JzUf+uVTCWnMdBk=;
 b=RFFLM/rPkSHJRM3cLpBsW4J6geKJtqaYvcYaPsKmbGkUSntjNheN2i6CmXaiEZDUZC
 qt5SLmlnwXT2YesWxKx0duZ5XYB1hco2WwNNUz3/GPyzOHhSLAiZov5fAi5Gs9g+8L+M
 mc6t6nmYxdr8mvCz05SOKbGo4FJdWqTYamuh4T+f7HWe9o1y97j6xG+MTPAKdNtc1Dyl
 SUFtnemT3RBwHfGMAAWSvdBmXM/Qtw3pNMM1bKteFL3wJ+j9MUqtUSXXVLXqXr1ObDWQ
 /QWFbz806gw43sw+ZfK6UVlfOHo8+tk02rwXZNjTSQkbaaTRc6DmyGkvbVo7wQk9pQwm
 LlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=665wfLrYyWEoos7hXDIalhn/FRb4JzUf+uVTCWnMdBk=;
 b=EIXWWzvbr6FA1t2Rw1yE/Uv7ax9Z1Ubd/ZVZawrJZtkfOvkbJiD/NaZDDy7IRGWKjH
 j7EqeivQhGgxVm2O/mdoyQHF4eCJ25zX5Wjofm04V93b8YskqTsWkXz/d4QhHjmOH3hX
 1GbV9o/sBBGznYJIG2NdDK7mcyka+cFR//IUiXu0wx7DUHLrxtBgLfjW/8ooJk5hiVXF
 Gt4zWqcLOdpTDNKnWy6y3qi2IaaYz6SrD3BF0fBd4WUcUAJMuwwEu6yC8XJyJuQUyt7U
 pGxXHawTITloMpH2eZwXg3Kjhoo/Eczy20TN882/tIHrJ2T7ymyZvLipf/w5f3B4XwMa
 uRgg==
X-Gm-Message-State: AOAM530zYAdOcDZrL+eiuihMhNyxa+ixy25VpdShhA1dUxVL6sUfrsYX
 6wIHMku5QsWxd2zBbfeOSOx2mg==
X-Received: by 2002:a17:902:a412:: with SMTP id
 p18mr27270100plq.111.1591146851410; 
 Tue, 02 Jun 2020 18:14:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:14:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 40/42] target/arm: Cache the Tagged bit for a page in
 MemTxAttrs
Date: Tue,  2 Jun 2020 18:13:15 -0700
Message-Id: <20200603011317.473934-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WVy4ueCbILaV

This "bit" is a particular value of the page's MemAttr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Test HCR_EL2.{DC,DCT}; test Stage2 attributes.
---
 target/arm/helper.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 50717afa4a..74925010ea 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10875,6 +10875,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
+    uint8_t memattr;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -11099,17 +11100,32 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         txattrs->target_tlb_bit0 = true;
     }
 
-    if (cacheattrs != NULL) {
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        memattr = convert_stage2_attrs(env, extract32(attrs, 0, 4));
+    } else {
+        /* Index into MAIR registers for cache attributes */
+        uint64_t mair = env->cp15.mair_el[el];
+        memattr = extract64(mair, extract32(attrs, 0, 3) * 8, 8);
+    }
+
+    /* When MTE is enabled, remember Tagged Memory in IOTLB. */
+    if (aarch64 && cpu_isar_feature(aa64_mte, cpu)) {
         if (mmu_idx == ARMMMUIdx_Stage2) {
-            cacheattrs->attrs = convert_stage2_attrs(env,
-                                                     extract32(attrs, 0, 4));
+            /*
+             * Require Normal, I+O Shareable, WB, NT, RA, WA (0xff).
+             * If not, squash stage1 tagged normal setting.
+             */
+            if (memattr != 0xff) {
+                txattrs->target_tlb_bit1 = false;
+            }
         } else {
-            /* Index into MAIR registers for cache attributes */
-            uint8_t attrindx = extract32(attrs, 0, 3);
-            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
-            assert(attrindx <= 7);
-            cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
+            /* Tagged Normal Memory (0xf0).  */
+            txattrs->target_tlb_bit1 = (memattr == 0xf0);
         }
+    }
+
+    if (cacheattrs != NULL) {
+        cacheattrs->attrs = memattr;
         cacheattrs->shareability = extract32(attrs, 6, 2);
     }
 
@@ -12065,6 +12081,17 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         *phys_ptr = address;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         *page_size = TARGET_PAGE_SIZE;
+
+        /* Stage1 translations are Tagged or Untagged based on HCR_DCT. */
+        if (cpu_isar_feature(aa64_mte, env_archcpu(env))
+            && (mmu_idx == ARMMMUIdx_Stage1_E0 ||
+                mmu_idx == ARMMMUIdx_Stage1_E1 ||
+                mmu_idx == ARMMMUIdx_Stage1_E1_PAN)) {
+            uint64_t hcr = arm_hcr_el2_eff(env);
+            if ((hcr & (HCR_DC | HCR_DCT)) == (HCR_DC | HCR_DCT)) {
+                attrs->target_tlb_bit1 = true;
+            }
+        }
         return 0;
     }
 
-- 
2.25.1

