Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201093wrv;
        Sat, 3 Aug 2019 11:48:29 -0700 (PDT)
X-Received: by 2002:a62:3543:: with SMTP id c64mr64221109pfa.242.1564858109493;
        Sat, 03 Aug 2019 11:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858109; cv=none;
        d=google.com; s=arc-20160816;
        b=QA/kGpv7V6A9FL+NWfG6vnKDnLkzbgkiZLFy1o6gtYVRDiZpIQ1cn7NKDEqf0K9uLG
         mkfULK6US6HgSnVL9MifSUG+2TZgIb9Rs9MWDhvBDaqP2HNOh78tpWVew9IJHbXBe4gu
         +x10reXympWa5l7Rsl5H3yzreYKBVumThskGntpwrKbkRb6NtatV3Zvh0Ka8Wak35U+/
         8uX6IX6JDGTT1bsg9ILYo8I7iaz3KMx9b0xPoMDQWzQA2BreQpnk0r7r5W2+cc10FHFY
         MVQxRVsiK8Xl8KB9UzSroKksCGyAaWUD+256lda+P7wieinhyQd7esyRt2SuF//u11uU
         zkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=F8zJJPz0HoAAcPGItYsG98fn3EhRGHL9/KSAWCPhxyQ=;
        b=r/2VSBA5gZWxl2p6zaGmMFEwBOWDCmh1SqYfi7ji1GLZi/XbLo4OdNJaBESW0QW2A8
         HvB6hYNL5uZIzazQIZmMP68FaEd+oT1vnH1m1Q4ZTDOc0wNP/8ZOez6BZlovJXsXv8Tg
         fxqKq5hfuf4Mr2aeSi0xpf6GNl+jLH277FVi5kGhlWFpUbCA5dSefjgjodLYqLzuaIBQ
         98qAoiGaUkJoASlng31L9uNjM5l8UiqiWmVZ7EpHDFF3Ux9sMCRKGyFXZVps3n0i9IsF
         QFqNcUieU/jYSLYYdbwq2Zf6oU5gLQsOE0GH7OOnh6S+2aEdorTTE5A56B4JDkIWneoM
         FzDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nyYDZlSW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q6sor9683898pgc.85.2019.08.03.11.48.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nyYDZlSW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=F8zJJPz0HoAAcPGItYsG98fn3EhRGHL9/KSAWCPhxyQ=;
        b=nyYDZlSWyWGgw+mPVtlmhwfzB+jmeYrS0DerBgWFeqgL+G4q5VWZOZ8SvW5yOrpQZt
         OHDluovFZg0lfnnBNbYnupFrR153G38gNkqA67gqexIqco+RYNjPDDClWR8fgOPjk5BQ
         qnpqCzjqxWSrxhSjZ5eOopQU/pnZtFYggk0+wyZSClNmfhdb17isKnb+g1TbzwJMVhtk
         Gl+rsPp3ix+4j/Aw5+T6ATffS5ACO04ZxhbIp5pfMjzVEN1p4GImzqxntaCIfY/+qj4T
         mffVDkVALM4tRvVLgN2k3kDSiu2BT7swflBjyPLmIt0k8m82/9y5KlfaqFVLSQOHQ1zm
         TfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=F8zJJPz0HoAAcPGItYsG98fn3EhRGHL9/KSAWCPhxyQ=;
        b=r+XbkcVe07GqbymUm3B3C4VdmPSBv0rneUr0EdZMTR4fgpOX43ZYwPp55iHQ5x1hMh
         3SaZQuzoYywBc5DndUieeZTle1eGU0tHyti3/gsAMnMrDoOQqKI4ZWqwWOxf1065BrWD
         F5rdLC4PlIYnAaEGE1nhAhaVqHWcYnHrMDN2E+sRTuRh9CxTIex5Mu9WS6pNZRpDvjiy
         IMH8kqoF2o5RLeBxzpoeTbqn9XT+oX2/jWCjZyEiGObO7dvsqC6o9vHTXZT5cBMftxbT
         wDW8/1eSLPIqqAPnNlDTFUBI1tAcf+jiq+0IxXyTusM4t8MEw2IBtT3iddTj5ptdR1Qp
         v2hA==
X-Gm-Message-State: APjAAAXKSYvsY7WjWD3cB7slpC6n16xC6BAFqzu3VCvIZQQw9kUPOSzx
	7NtMIrHCKjlyorkZwv2GAXsgVB2TBIHozg==
X-Google-Smtp-Source: APXvYqy3xTj9oqSIYbTPypv1AsJSv14cGHMyy2JQWWk3EshdshfwPQgU9GhGjz63ufBmQnI88Z3QJw==
X-Received: by 2002:a63:f926:: with SMTP id h38mr40174630pgi.80.1564858108975;
        Sat, 03 Aug 2019 11:48:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 22/34] target/arm: Add regime_has_2_ranges
Date: Sat,  3 Aug 2019 11:47:48 -0700
Message-Id: <20190803184800.8221-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: rRPw95zGEF2E

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 16 ++++++++++++++++
 target/arm/helper.c        | 22 +++++-----------------
 target/arm/translate-a64.c |  3 +--
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index dd0bc4377f..1b64ceeda6 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -824,6 +824,22 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
+/* Return true if this address translation regime has two ranges.  */
+static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_EL10_0:
+    case ARMMMUIdx_EL10_1:
+    case ARMMMUIdx_EL20_0:
+    case ARMMMUIdx_EL20_2:
+        return true;
+    default:
+        return false;
+    }
+}
+
 /* Return true if this address translation regime is secure */
 static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9c2c81c434..5472424179 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9006,15 +9006,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     }
 
     if (is_aa64) {
-        switch (regime_el(env, mmu_idx)) {
-        case 1:
-            if (!is_user) {
-                xn = pxn || (user_rw & PAGE_WRITE);
-            }
-            break;
-        case 2:
-        case 3:
-            break;
+        if (regime_has_2_ranges(mmu_idx) && !is_user) {
+            xn = pxn || (user_rw & PAGE_WRITE);
         }
     } else if (arm_feature(env, ARM_FEATURE_V7)) {
         switch (regime_el(env, mmu_idx)) {
@@ -9548,7 +9541,6 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
                                         ARMMMUIdx mmu_idx)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    uint32_t el = regime_el(env, mmu_idx);
     bool tbi, tbid, epd, hpd, using16k, using64k;
     int select, tsz;
 
@@ -9558,7 +9550,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
      */
     select = extract64(va, 55, 1);
 
-    if (el > 1) {
+    if (!regime_has_2_ranges(mmu_idx)) {
         tsz = extract32(tcr, 0, 6);
         using64k = extract32(tcr, 14, 1);
         using16k = extract32(tcr, 15, 1);
@@ -9714,10 +9706,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
-        /* If we are in 64-bit EL2 or EL3 then there is no TTBR1, so mark it
-         * invalid.
-         */
-        ttbr1_valid = (el < 2);
+        ttbr1_valid = regime_has_2_ranges(mmu_idx);
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
     } else {
@@ -11368,8 +11357,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
             int tbii, tbid;
 
-            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
-            if (regime_el(env, stage1) < 2) {
+            if (regime_has_2_ranges(mmu_idx)) {
                 ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
                 tbid = (p1.tbi << 1) | p0.tbi;
                 tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index dbe2189e51..06ff3a7f2e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -175,8 +175,7 @@ static void gen_top_byte_ignore(DisasContext *s, TCGv_i64 dst,
     if (tbi == 0) {
         /* Load unmodified address */
         tcg_gen_mov_i64(dst, src);
-    } else if (s->current_el >= 2) {
-        /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+    } else if (!regime_has_2_ranges(s->mmu_idx)) {
         /* Force tag byte to all zero */
         tcg_gen_extract_i64(dst, src, 0, 56);
     } else {
-- 
2.17.1
