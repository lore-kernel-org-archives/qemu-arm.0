Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200864wrv;
        Sat, 3 Aug 2019 11:48:07 -0700 (PDT)
X-Received: by 2002:aa7:8ad0:: with SMTP id b16mr63731790pfd.45.1564858086897;
        Sat, 03 Aug 2019 11:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858086; cv=none;
        d=google.com; s=arc-20160816;
        b=fK7WshT/i//Jtk/It+7IEPqeay1fOGQHv0C0oRBDyTyJFZokeiXYC08GCSMhvUD7Ol
         MAKfrKa9frdEr14PEq8w/Igbd34ibUFieV4TcfwPZEyT+ElqF878BaNccE39Gqh2V6QU
         UOep4Bcmm7+hqNty15pztd804Qcx5cOwJv8yf9rCCx49Fa0rgSgw6PnJJleJQINmRQr0
         4ZZfkvubbH+yVbCwpDX8qifiOEsCOorXfP4U5whMCuHRBvOPQ5yCef8B777EgR8Kvxn+
         Oi9bp+Jz9KyVNUnos+RXBCov+aLvQf/uHCbcKnF7IEeg5cwU5uwyRvXU0xOUOZyO+TLa
         o8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZRDl/Ha+kclTizhs/nHDa+7096PsBT003cOS/ic3LTY=;
        b=nXznx+Gn5Kl81OeZFuFeE5ZJ54xmRYI54RJD3DC9xGwBxfOcEK5Qtl+/XMA9bYeNwt
         DZ3YXqKNdkzkBMWKY8twoUS+FgiEn+FJZsx6PG0fWRTJud4AoXW20XB9tuqA2L+pC+u5
         +l2ppUHcHvJ3YZ9+lbldu3BQIhwWOuId+jRoVSpcDyacInW4y/9JJUBIBXIg6cDbTBRD
         EZDViDXCOa9QTCXrna+QEE9BTOu3g/0xQ/MHMhb6LMhSlyo3v++P9HEuK+XrhgsOqXms
         A5xiARDs44RpxEhPEhkcGkqkNSuivcY7ZBbQptzMP+noXic6oP4DV1f+0hEhZmXY/ZiC
         Exig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gO1RyuEd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id bc5sor95124559plb.36.2019.08.03.11.48.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gO1RyuEd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZRDl/Ha+kclTizhs/nHDa+7096PsBT003cOS/ic3LTY=;
        b=gO1RyuEd4amyO2ZioV4wbCAXOswiL3HZaFPh3uZiBfDdBs1Hxj4qjpDVT1qE0w/Y/2
         TCd2HoUEIsZPPem9Sz4MGxM/lb1njDYhPyBetZ/OwHnPIEzVBjbKvUEgzkOgoR7OROsX
         6ZpH958pzmLMtWIKbj5Y4qSTIb//ClcMqUwrWF171EWHWOApxSfxo3aGH5/NWGz9Mkcf
         7tGdzP7xNMG3EGKmDxY9z/BV/WmykaIb3Ly0LCXkcQ69cDzoIi3wfnUrz/9eFRauToxG
         4zQ6QIJUBVIpNf21r0pUdtcFJya++VW7hA8RaVngSFKC9duw8Agsy07xLAL5UiIw99KD
         xv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZRDl/Ha+kclTizhs/nHDa+7096PsBT003cOS/ic3LTY=;
        b=ntg7zOjIZT9zpL6gQ1DOdZTPwgux3Z6IGnYiYWDYJs9gNhcCihd7l+2vI44zAWs94a
         C/RUxjCjCqrhOvDjtKcEzIx8YmfgDl8c0j72MECPz4sGqQWdG4iTdGHZz5YdmeEjnlkv
         cvshlR32vu10HECSVy8AEP41NZb6PCJLfeaCydLj8IO7h2wbShTjlGfntNTqHlv6AViq
         fHTjF9/S4kEGK+PWgrnCxix06EF/IrN1fNQJdMtuYSDtEBfgXq+75fX5VwVaCa0UjFx8
         aFXy805IjgVQZNV8psa8clmX66gIyXyjLlTtO56XpJkw93qkXDbbo/zd7mel2J3QypVd
         J4KA==
X-Gm-Message-State: APjAAAUu2kHavT4uXGdRZ5dIVzWSB6oCvctuhw2GAKjHn/nMsh8a7j3H
	5boFaSOUFzAtqSMVrqmxsFuMmnoA
X-Google-Smtp-Source: APXvYqyQADm81TOq7pTG3uu8C1tSxFfVRBTYH3eUA/V0wxpc15KUvnS2t3SKs/oEQ28Fzd7eP77Ppw==
X-Received: by 2002:a17:902:8a8a:: with SMTP id p10mr139797676plo.88.1564858086446;
        Sat, 03 Aug 2019 11:48:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 03/34] target/arm: Install ASIDs for long-form from EL1
Date: Sat,  3 Aug 2019 11:47:29 -0700
Message-Id: <20190803184800.8221-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /JZi+duoEviq

In addition to providing the core with the current ASID, this minimizes
both the number of flushes due to non-changing ASID as well as the set
of mmu_idx that are affected by each flush.

In particular, updates to the secure mode registers flushes only the
relevant secure mode mmu_idx's, and similarly non-secure updates only
affect non-secure mmu_idx's.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 73 +++++++++++++++++++++++++++++----------------
 1 file changed, 48 insertions(+), 25 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b74c23a9bc..2a65f4127e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3327,6 +3327,36 @@ static const ARMCPRegInfo pmsav5_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+/* Called after a change to any of TTBR*_EL1 or TTBCR_EL1.  */
+static void update_lpae_el1_asid(CPUARMState *env, int secure)
+{
+    CPUState *cs = env_cpu(env);
+    uint64_t ttbr0, ttbr1, ttcr;
+    int asid, idxmask;
+
+    switch (secure) {
+    case ARM_CP_SECSTATE_S:
+        ttbr0 = env->cp15.ttbr0_s;
+        ttbr1 = env->cp15.ttbr1_s;
+        ttcr = env->cp15.tcr_el[3].raw_tcr;
+        /* Note that cp15.ttbr0_s == cp15.ttbr0_el[3], so S1E3 is affected.  */
+        /* ??? Secure EL3 really using the ASID field?  Doesn't make sense.  */
+        idxmask = ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0 | ARMMMUIdxBit_S1E3;
+        break;
+    case ARM_CP_SECSTATE_NS:
+        ttbr0 = env->cp15.ttbr0_ns;
+        ttbr1 = env->cp15.ttbr1_ns;
+        ttcr = env->cp15.tcr_el[1].raw_tcr;
+        idxmask = ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    asid = extract64(ttcr & TTBCR_A1 ? ttbr1 : ttbr0, 48, 16);
+
+    tlb_set_asid_for_mmuidx(cs, asid, idxmask, 0);
+}
+
 static void vmsa_ttbcr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
@@ -3363,18 +3393,16 @@ static void vmsa_ttbcr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void vmsa_ttbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
     TCR *tcr = raw_ptr(env, ri);
 
-    if (arm_feature(env, ARM_FEATURE_LPAE)) {
-        /* With LPAE the TTBCR could result in a change of ASID
-         * via the TTBCR.A1 bit, so do a TLB flush.
-         */
-        tlb_flush(CPU(cpu));
-    }
     /* Preserve the high half of TCR_EL1, set via TTBCR2.  */
     value = deposit64(tcr->raw_tcr, 0, 32, value);
     vmsa_ttbcr_raw_write(env, ri, value);
+
+    if (arm_feature(env, ARM_FEATURE_LPAE)) {
+        /* The A1 bit controls which ASID is active.  */
+        update_lpae_el1_asid(env, ri->secure);
+    }
 }
 
 static void vmsa_ttbcr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -3392,24 +3420,19 @@ static void vmsa_ttbcr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 static void vmsa_tcr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    TCR *tcr = raw_ptr(env, ri);
-
-    /* For AArch64 the A1 bit could result in a change of ASID, so TLB flush. */
-    tlb_flush(CPU(cpu));
-    tcr->raw_tcr = value;
+    raw_write(env, ri, value);
+    /* The A1 bit controls which ASID is active.  */
+    update_lpae_el1_asid(env, ri->secure);
 }
 
-static void vmsa_ttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                            uint64_t value)
+static void vmsa_ttbr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
 {
-    /* If the ASID changes (with a 64-bit write), we must flush the TLB.  */
-    if (cpreg_field_is_64bit(ri) &&
-        extract64(raw_read(env, ri) ^ value, 48, 16) != 0) {
-        ARMCPU *cpu = env_archcpu(env);
-        tlb_flush(CPU(cpu));
-    }
     raw_write(env, ri, value);
+    if (cpreg_field_is_64bit(ri)) {
+        /* The LPAE format (64-bit write) contains an ASID field.  */
+        update_lpae_el1_asid(env, ri->secure);
+    }
 }
 
 static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3455,12 +3478,12 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.esr_el[1]), .resetvalue = 0, },
     { .name = "TTBR0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
-      .access = PL1_RW, .writefn = vmsa_ttbr_write, .resetvalue = 0,
+      .access = PL1_RW, .writefn = vmsa_ttbr_el1_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
                              offsetof(CPUARMState, cp15.ttbr0_ns) } },
     { .name = "TTBR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 1,
-      .access = PL1_RW, .writefn = vmsa_ttbr_write, .resetvalue = 0,
+      .access = PL1_RW, .writefn = vmsa_ttbr_el1_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) } },
     { .name = "TCR_EL1", .state = ARM_CP_STATE_AA64,
@@ -3715,12 +3738,12 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
                              offsetof(CPUARMState, cp15.ttbr0_ns) },
-      .writefn = vmsa_ttbr_write, },
+      .writefn = vmsa_ttbr_el1_write, },
     { .name = "TTBR1", .cp = 15, .crm = 2, .opc1 = 1,
       .access = PL1_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) },
-      .writefn = vmsa_ttbr_write, },
+      .writefn = vmsa_ttbr_el1_write, },
     REGINFO_SENTINEL
 };
 
-- 
2.17.1
