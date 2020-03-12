Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1088237lfc;
        Thu, 12 Mar 2020 12:43:15 -0700 (PDT)
X-Received: by 2002:a63:6101:: with SMTP id v1mr9130148pgb.318.1584042195148;
        Thu, 12 Mar 2020 12:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042195; cv=none;
        d=google.com; s=arc-20160816;
        b=k+/7sq5kvnnic8cVABhTE1LlOfeeuyFwJRXm/dXro+bzLHk6RVnelDivVnK9FCTLqt
         ZANiH/M19onTZnJZglstCbIHzaI7TejaNPPl/OCcJqENC3cXF5DvArr5itQJJANRlbV2
         saHETUNZC+0gb5UHUMO5zyhGhRLzjOoND3coBS68Yl0XrHxnwoKGNYtofWrkr9N9BKGp
         66MN7wS02sOxQUHSfcAoN2BE+6eQekA7GHP23byhLtOJT+qEbPp50JZgTtWa/NngASQL
         Qsa/Y4ZTNEbmBn+ZCZvWQYtgDNvnNhv4j84W7v8q+P0W5j2Aby/mak7MpKaW1zic9Kya
         Jvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FqxgWRxNaOrIo80/rd7EvP+ZqoigJ+ge9JbM5ILrh50=;
        b=xFJwhT4QuEKFAu2Xv2eCB4hKImyLn10+Rd8+B/v9HL6KFkGoW37EBmD696uqQ2gRE4
         RxR4Dq9eazmM9LNS9uIWJgb63XfLzhQWBKjI8ed/zr/2+r2P+RUxSiZZUhsg7Eozpf3j
         wiltzIkbpWuesfGGKfXoDkh4FTQCfLhnAzXv3atv6iJUO6RRhvh7V/+hpPPXckyGCdzv
         apeDnoGEeH8j3hPFgWLpZIQRSyKwmOWg+CF8WWk1UyRXqLg6hIKmXf0rvTwSMKELsMG5
         1vnJYdBFmnZOy1s64wVv10hsV3/aP0dOneHUqfwDuTnKmlVf7vAmqD2nuf/mMu2AziG3
         8eyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K/7RAi1Q";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m2sor7743329pld.8.2020.03.12.12.43.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K/7RAi1Q";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FqxgWRxNaOrIo80/rd7EvP+ZqoigJ+ge9JbM5ILrh50=;
        b=K/7RAi1QturA2wu+mnUAiJRDSFP6ttUS8ps8kO5kEbQcYbkkfdpiLl/sqCvp1CffMB
         LXFC1b95ipYR3Iq0L7trKv1BI7MZyioDSvX8Y6druJ6mBm5Sq5TEkH1QXM8ORL4b5iZg
         TX6vpF8s4RzuzRA2nYUO3zWV13axJExKtOEKTYqOxrSbOtzwH5lWZTlehNHJ3uJ+WRtr
         h3jEC/pptA3Zo4ME6xJ1gaEKbslG30rDF6Emp3yPr5MOQULRunwUSRyqSacJOR8Og4Tf
         ZMM2Zl6NC16F23k5rhMzU3aWodvdAPgA3Jn9NeC07HhHYo+Tem8iN/WO7+f8u2daSKEE
         mX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FqxgWRxNaOrIo80/rd7EvP+ZqoigJ+ge9JbM5ILrh50=;
        b=DNJduVXT44vzUJ8DUo/i2sPnxNrJxYFfLouSh18Ob4ETG1Bbq5ltJfq//mZ/Qv8pj2
         HK12Did2S6T4mGxF9dne9/Gy9YvI2NE/MUnCSCiXjtKKP/enRH9YkvwVXyj5J213ARCl
         onh0Q9b0rOvqoLNW11xDDAtGfqZhZaCrJgYth7AgloETYhU75C3oPO6NRuNCqDxA2kB4
         op80swb7RUym0V+qck4HHcNjFGHuRYGmJ0ugv1IYLV90yGfliPFdtZlaVoWDamhD2JDT
         i/sMtBrYMMEer5UbBINpAsNzYV6RX/+nBEQ6fH3gDy/cTphps9Yn6Fa7P3sqEGMviA+l
         Vl8w==
X-Gm-Message-State: ANhLgQ0qJ2xl8xDknrzgxIoMRb7xiorTK6U+ew7WJRavIh0JTWh4/NYi
	KYwGxhTKEg86Pj6mtiSw7MQpLgGu
X-Google-Smtp-Source: ADFU+vudl2xEsP4dZjy2/5sVwRI0ebMp0Qk63/29HruLoZaWbdQSyiterXbB8FatlHplsY7/5CcSzw==
X-Received: by 2002:a17:902:7298:: with SMTP id d24mr9600552pll.134.1584042194660;
        Thu, 12 Mar 2020 12:43:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:43:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 40/42] target/arm: Cache the Tagged bit for a page in MemTxAttrs
Date: Thu, 12 Mar 2020 12:42:17 -0700
Message-Id: <20200312194219.24406-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eKLYzSYfUCCz

This "bit" is a particular value of the page's MemAttr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Test HCR_EL2.{DC,DCT}; test Stage2 attributes.
---
 target/arm/helper.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b38dc74733..c272c48467 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10785,6 +10785,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
+    uint8_t memattr;
 
     /* TODO:
      * This code does not handle the different format TCR for VTCR_EL2.
@@ -11013,17 +11014,32 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
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
 
@@ -11978,6 +11994,17 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
2.20.1
