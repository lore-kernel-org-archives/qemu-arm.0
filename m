Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071153wrv;
        Wed, 31 Jul 2019 13:38:19 -0700 (PDT)
X-Received: by 2002:a17:90a:ba94:: with SMTP id t20mr4801574pjr.8.1564605499608;
        Wed, 31 Jul 2019 13:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605499; cv=none;
        d=google.com; s=arc-20160816;
        b=itnLPE+v9d3+dSLHU1bQ26lOFK/VMXyuX9tqdazyewHr3AWB6VLl0xu6gmbNjZaWiz
         ptnUV87SW2zI1W/sUumLp8/yP1voE4ha9L2hiWq+EZ7gXBALQdqQJ+WXosXYbAaG1fcu
         /hTTNTTXIhlKLek/jAk2E8LI/idU3fli50zR7vqCehOjPjofT3t7KdTS5vha4GdOz0Cg
         0ZdcLb6MEvjtAdVPm55LOez2WEaJCiXh0vsLEc4+MDNDPLXOXX3UTzOjJdU16zkA3UoB
         +I8zfJUVc/58n/Frr/rzW3l1hDMgGyr03gcGVtk6F8/MDwbHb7r2oh6lxDmnZ3ZJ9lmp
         9EBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZRDl/Ha+kclTizhs/nHDa+7096PsBT003cOS/ic3LTY=;
        b=pKnIZ18aETYBSTcaMSfAxqRX06uXRXlo7kB47thogOR0udqj5l+hjhxNkxrLrCB8iN
         1oXldb3RsiATVcSbBoQVBPqTSh5KPteh/mjIGwZKgZlxtVfgMX4I5AXptbyAr4T4H6jn
         jrmzYBei1pi2E4WsM2HcJykXZO14q7Wx+rYVUpQKBAnOf6zLK2fSYwnomf0o2pwLLNvP
         EbQ4zUzakIghYY7xwa1EfPBPiJDt4gb5wOl8yljpsecF9YwD4XXECWmlBa+jUDsfwT3E
         WR7caxSqsizdXsjnJLJYrN+23V8x5uASwEqpqwQPi9AalIiG9LEWgF8jD8yvWnmFCaDv
         oS3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BrNtztSK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id gn6sor83549411plb.66.2019.07.31.13.38.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BrNtztSK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZRDl/Ha+kclTizhs/nHDa+7096PsBT003cOS/ic3LTY=;
        b=BrNtztSKwNJY0w/qMsV8+5wn4WcG6r4UAkotM3F1Fr5GTPMAXcVgrqHjx1FIW66bFr
         voGvXlo+sk+LOwKuxpVJmzUqP6ryvIWJ+RccWHsdrYBIA5zpjgEzLk0S2s7M08DnGhae
         RoxZK0x9byYFKU8QZ7+41B6YLY9eg1o2PafxegkAmZ2hPwr7IjgDGhd6ygh1wkZD58CV
         yjLmRLyQm37yaiDumd+HxvlJqBvPJbKDRDQw6BWfghL1BFsBuDB/vJjWmiHZ8Xot0pjP
         QA2Yg8OIKXIwsasWN/QJkbLmtVffUpmMmVrARxz3QX5wmngBTyscEuAK3HrcevjdsHmS
         5GIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZRDl/Ha+kclTizhs/nHDa+7096PsBT003cOS/ic3LTY=;
        b=Rjm6tEugFgivz9VRNWGD4fGhYjskDWuPHvWEmZLRDWNL/cb50WIP1I461LnFlajWUZ
         14XDKgYvDlFuITXys3RFZvwvIAO2BO8Bic+HQwxvNZQOOLY85CJ73Ifjy3pRTO6COlbR
         77MdmXKNumADqIrz/yfS+O24DFJUL0pDC5bScKHo8/KxLItbADWkim0L7RuVPM3CUuv2
         5p8HYNrofDyxCx9eoHX9OlRsS7fpwPiuTFAW3Pn4TWRUtL41INq80QINDrT/qGcNB+x2
         PGX+wieYV7Iml4FLI+COt0zK3aHBye7KHbwq/M/xNvTPjmNvs2hC6eK9iZUE0wsJV6Fe
         Mxag==
X-Gm-Message-State: APjAAAWjKdYv3v5xN9SCFg3wnG9umJv5WxNldFRAXWZPa9saHkf1YXb8
	/O94rUB7YwAsfDO1v2sRA/1k+x2n
X-Google-Smtp-Source: APXvYqyWEV274dQZVgWi2Wu86iEvI+0HHvGMf3nXZJrLkcxk/IZ06QEj1btzVpyIJhovftlZLcbaGA==
X-Received: by 2002:a17:902:7d8b:: with SMTP id a11mr68507527plm.306.1564605499140;
        Wed, 31 Jul 2019 13:38:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 03/32] target/arm: Install ASIDs for long-form from EL1
Date: Wed, 31 Jul 2019 13:37:44 -0700
Message-Id: <20190731203813.30765-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oS/lySj52Sqx

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
