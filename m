Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2706662ejb;
        Mon, 20 Feb 2023 15:27:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9bEcEpC685Fu6opk7g4IOv2CBzFm2sp4Kd28xVuuwDR2YHNcQ3QgxXHD+pja4y7zZO98nL
X-Received: by 2002:ad4:5bc2:0:b0:56b:f061:c3c6 with SMTP id t2-20020ad45bc2000000b0056bf061c3c6mr8145204qvt.33.1676935649518;
        Mon, 20 Feb 2023 15:27:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935649; cv=none;
        d=google.com; s=arc-20160816;
        b=ufxUkyXFhNpNF64jyYlNAFCV+COk1lprq40hNhusOas3IPW6MZdjsGeFXPmKynnUtX
         Y/6As60EtIFTBXnXXRItSYQfStmqsRkFxFv6tvmCGo8T3CUm+nIsiCRV6tMJoJF8/L3H
         FzIEwKRd1L5X7zXqljxb77KfBY6itO9mg8reNz081GBa9u6qnq6NdFHZ/pY+eGT3va9u
         9kVzqPwbfqRH8nzlXFXieKA7aDgfhGzqn+r/LB60C3/Ltwp7ew8Difgw00ZitmpAqfGH
         gDIdpRYABXWabo5WBdPyO/2LYeafZE+2nTZBQ8M6oNJcDv99iWw+jNEwzGU4fT1fWZw8
         biHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CB7v28W7W1Dv5HV9sB7O4wNr8EzlcB/4NWcFaAYvGQM=;
        b=mRLg0bVrh+a9X+1h1I4ZgcX7IqgmfiOoIgr56GWE9LR0FKRo3VcwSDNs4rnuJ6IkcL
         4P9vfwxSiEZVB1qZFseCSPLFpkwQYI6eFH+TwQpX4+8ecbxPhCzEGMB+iVsdRRQVinWV
         4P20HDuQR0maCHNhKmDzy7MfldAGCxxvnvaTER/pBSYQU0cX6rgDZrh503dH7YzrNuXb
         P8Xrp16caNxRlr6M6js+h25H9jshS83q9aHi1/SFTFPJukbk9AgYIA1BGH+0evS6t+rL
         DX5FGsg8zaPIgrP3IAY4008yuK6EwFBlWW2IKy3vmJy2Rsce25TXOuELGJO408+A53hD
         GoBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CnnaTUXh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn33-20020a05620a2ae100b0073b20486da6si10328419qkb.561.2023.02.20.15.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:27:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CnnaTUXh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYr-0004k9-I2; Mon, 20 Feb 2023 18:27:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYl-0004Wa-91
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:27:03 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYj-0000St-2W
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:27:03 -0500
Received: by mail-pj1-x1042.google.com with SMTP id 99so2896047pjz.4
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CB7v28W7W1Dv5HV9sB7O4wNr8EzlcB/4NWcFaAYvGQM=;
 b=CnnaTUXhBcptOtQXod9rLLmTGyY7/tB7jN6obmasYkKL/qxH6/YGXuf0D+8yk0Fco0
 AyYgNKgKFIdjqFTvCOz2lSv/EWwGBpw/aUIaIo7FQEPifutOZDgZfkltDdUSbg1Z/jIW
 itb/Zg/QFCDKYiOmYHghTi3lkDPsfu8BsdE3tpCkIn8Nwzyao1vQt5AqMGYXgI8e2GEs
 yJV6KIS+RUXfoGNzv0mAHZact4gbK0UEQDE6h2WuyYutO4KCYfJ5WdSl0ya5jkw+B5FN
 NmAzpRgXMyvXFxYD2EXqu96OK2ZeKGthc/OU+SYag/GED3zQtdLKa1ZxcBxKY016wWxQ
 VXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CB7v28W7W1Dv5HV9sB7O4wNr8EzlcB/4NWcFaAYvGQM=;
 b=ygu4KmbJxPQmO2IEwtC36A3dgC0XH5oI7tCnVcqSGZhRCxAGi7Sdv8xzwncXnuAtwR
 Sb/IWCNrtYcJP4lW+nP7BGxGa/cg1QpQE0a/lvjTb2KspRUEfc0sUspPM04Pmd11bVcx
 fQKg/ej4pPVaseDYWk8+tjSqh/diCygQCsG/32kBeTNt8Kue6zD4YmYJTEA76/ypS528
 LO+8D5sTuIEBz8F2Iy0CIN29uGLadlDjEwl9O2Q5NwHNxd+QQi3ZwdCgS0DLTeQJ9Pcr
 TqYmAtQ/bJiyQnYZbFU82j6nJMGI8cKpkIzShc61o8JEnO/nsWWcZvw8qf/ZT3nUHVEG
 qnmw==
X-Gm-Message-State: AO0yUKXWcME5wN0IMg12TcZvugqGicwSDJajv6088r9NDKqbcaPAeJMU
 qcVpEge/Jm3CqED5Xt3itpXgXQ==
X-Received: by 2002:a17:902:d48c:b0:19a:841f:57 with SMTP id
 c12-20020a170902d48c00b0019a841f0057mr5135948plg.27.1676935619715; 
 Mon, 20 Feb 2023 15:26:59 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 19/21] target/arm: Implement the granule protection check
Date: Mon, 20 Feb 2023 13:26:24 -1000
Message-Id: <20230220232626.429947-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0mfiBGcuQHm4

Place the check at the end of get_phys_addr_with_struct,
so that we check all physical results.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 246 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 228 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a797750f9b..b2f55f7f66 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -37,12 +37,11 @@ typedef struct S1Translate {
     void *out_host;
 } S1Translate;
 
-static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
-                                      target_ulong address,
-                                      MMUAccessType access_type,
-                                      GetPhysAddrResult *result,
-                                      ARMMMUFaultInfo *fi)
-    __attribute__((nonnull));
+static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
+                                target_ulong address,
+                                MMUAccessType access_type,
+                                GetPhysAddrResult *result,
+                                ARMMMUFaultInfo *fi);
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
 static const uint8_t pamax_map[] = {
@@ -198,6 +197,197 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
+static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
+                                     ARMSecuritySpace pspace,
+                                     ARMMMUFaultInfo *fi)
+{
+    MemTxAttrs attrs = {
+        .secure = true,
+        .space = ARMSS_Root,
+    };
+    ARMCPU *cpu = env_archcpu(env);
+    uint64_t gpccr = env->cp15.gpccr_el3;
+    unsigned pps, pgs, l0gptsz, level = 0;
+    uint64_t tableaddr, pps_mask, align, entry, index;
+    AddressSpace *as;
+    MemTxResult result;
+    int gpi;
+
+    if (!FIELD_EX64(gpccr, GPCCR, GPC)) {
+        return true;
+    }
+
+    /*
+     * GPC Priority 1 (R_GMGRR):
+     * R_JWCSM: If the configuration of GPCCR_EL3 is invalid,
+     * the access fails as GPT walk fault at level 0.
+     */
+
+    /*
+     * Configuration of PPS to a value exceeding the implemented
+     * physical address size is invalid.
+     */
+    pps = FIELD_EX64(gpccr, GPCCR, PPS);
+    if (pps > FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE)) {
+        goto fault_walk;
+    }
+    pps = pamax_map[pps];
+    pps_mask = MAKE_64BIT_MASK(0, pps);
+
+    switch (FIELD_EX64(gpccr, GPCCR, SH)) {
+    case 0b10: /* outer shareable */
+        break;
+    case 0b00: /* non-shareable */
+    case 0b11: /* inner shareable */
+        /* Inner and Outer non-cacheable requires Outer shareable. */
+        if (FIELD_EX64(gpccr, GPCCR, ORGN) == 0 &&
+            FIELD_EX64(gpccr, GPCCR, IRGN) == 0) {
+            goto fault_walk;
+        }
+        break;
+    default:   /* reserved */
+        goto fault_walk;
+    }
+
+    switch (FIELD_EX64(gpccr, GPCCR, PGS)) {
+    case 0b00: /* 4KB */
+        pgs = 12;
+        break;
+    case 0b01: /* 64KB */
+        pgs = 16;
+        break;
+    case 0b10: /* 16KB */
+        pgs = 14;
+        break;
+    default: /* reserved */
+        goto fault_walk;
+    }
+
+    /* Note this field is read-only and fixed at reset. */
+    l0gptsz = 30 + FIELD_EX64(gpccr, GPCCR, L0GPTSZ);
+
+    /*
+     * GPC Priority 2: Secure, Realm or Root address exceeds PPS.
+     * R_CPDSB: A NonSecure physical address input exceeding PPS
+     * does not experience any fault.
+     */
+    if (paddress & ~pps_mask) {
+        if (pspace == ARMSS_NonSecure) {
+            return true;
+        }
+        goto fault_size;
+    }
+
+    /* GPC Priority 3: the base address of GPTBR_EL3 exceeds PPS. */
+    tableaddr = env->cp15.gptbr_el3 << 12;
+    if (tableaddr & ~pps_mask) {
+        goto fault_size;
+    }
+
+    /*
+     * BADDR is aligned per a function of PPS and L0GPTSZ.
+     * These bits of GPTBR_EL3 are RES0, but are not a configuration error,
+     * unlike the RES0 bits of the GPT entries (R_XNKFZ).
+     */
+    align = MAX(pps - l0gptsz + 3, 12);
+    align = MAKE_64BIT_MASK(0, align);
+    tableaddr &= ~align;
+
+    as = arm_addressspace(env_cpu(env), attrs);
+
+    /* Level 0 lookup. */
+    index = extract64(paddress, l0gptsz, pps - l0gptsz);
+    tableaddr += index * 8;
+    entry = address_space_ldq_le(as, tableaddr, attrs, &result);
+    if (result != MEMTX_OK) {
+        goto fault_eabt;
+    }
+
+    switch (extract32(entry, 0, 4)) {
+    case 1: /* block descriptor */
+        if (entry >> 8) {
+            goto fault_walk; /* RES0 bits not 0 */
+        }
+        gpi = extract32(entry, 4, 4);
+        goto found;
+    case 3: /* table descriptor */
+        tableaddr = entry & ~0xf;
+        align = MAX(l0gptsz - pgs - 1, 12);
+        align = MAKE_64BIT_MASK(0, align);
+        if (tableaddr & (~pps_mask | align)) {
+            goto fault_walk; /* RES0 bits not 0 */
+        }
+        break;
+    default: /* invalid */
+        goto fault_walk;
+    }
+
+    /* Level 1 lookup */
+    level = 1;
+    index = extract64(paddress, pgs + 4, l0gptsz - pgs - 4);
+    tableaddr += index * 8;
+    entry = address_space_ldq_le(as, tableaddr, attrs, &result);
+    if (result != MEMTX_OK) {
+        goto fault_eabt;
+    }
+
+    switch (extract32(entry, 0, 4)) {
+    case 1: /* contiguous descriptor */
+        if (entry >> 10) {
+            goto fault_walk; /* RES0 bits not 0 */
+        }
+        /*
+         * Because the softmmu tlb only works on units of TARGET_PAGE_SIZE,
+         * and because we cannot invalidate by pa, and thus will always
+         * flush entire tlbs, we don't actually care about the range here
+         * and can simply extract the GPI as the result.
+         */
+        if (extract32(entry, 8, 2) == 0) {
+            goto fault_walk; /* reserved contig */
+        }
+        gpi = extract32(entry, 4, 4);
+        break;
+    default:
+        index = extract64(paddress, pgs, 4);
+        gpi = extract64(entry, index * 4, 4);
+        break;
+    }
+
+ found:
+    switch (gpi) {
+    case 0b0000: /* no access */
+        break;
+    case 0b1111: /* all access */
+        return true;
+    case 0b1000:
+    case 0b1001:
+    case 0b1010:
+    case 0b1011:
+        if (pspace == (gpi & 3)) {
+            return true;
+        }
+        break;
+    default:
+        goto fault_walk; /* reserved */
+    }
+
+    fi->gpcf = GPCF_Fail;
+    goto fault_common;
+ fault_eabt:
+    fi->gpcf = GPCF_EABT;
+    goto fault_common;
+ fault_size:
+    fi->gpcf = GPCF_AddressSize;
+    goto fault_common;
+ fault_walk:
+    fi->gpcf = GPCF_Walk;
+ fault_common:
+    fi->level = level;
+    fi->paddr = paddress;
+    fi->paddr_space = pspace;
+    return false;
+}
+
 static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 {
     /*
@@ -243,10 +433,15 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         };
         GetPhysAddrResult s2 = { };
 
-        if (get_phys_addr_with_struct(env, &s2ptw, addr,
-                                      MMU_DATA_LOAD, &s2, fi)) {
+        if (get_phys_addr_nogpc(env, &s2ptw, addr, MMU_DATA_LOAD, &s2, fi)) {
             goto fail;
         }
+        if (!granule_protection_check(env, s2.f.phys_addr,
+                                      s2.f.attrs.space, fi)) {
+            fi->type = ARMFault_GPCFOnWalk;
+            goto fail;
+        }
+
         ptw->out_phys = s2.f.phys_addr;
         pte_attrs = s2.cacheattrs.attrs;
         pte_secure = s2.f.attrs.secure;
@@ -2732,7 +2927,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
                                    ARMMMUFaultInfo *fi)
 {
     uint8_t memattr = 0x00;    /* Device nGnRnE */
-    uint8_t shareability = 0;  /* non-sharable */
+    uint8_t shareability = 0;  /* non-shareable */
     int r_el;
 
     switch (mmu_idx) {
@@ -2791,7 +2986,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
             } else {
                 memattr = 0x44;  /* Normal, NC, No */
             }
-            shareability = 2; /* outer sharable */
+            shareability = 2; /* outer shareable */
         }
         result->cacheattrs.is_s2_format = false;
         break;
@@ -2819,7 +3014,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     ARMSecuritySpace ipa_space, s2walk_space;
     uint64_t hcr;
 
-    ret = get_phys_addr_with_struct(env, ptw, address, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, address, access_type, result, fi);
 
     /* If S1 fails, return early.  */
     if (ret) {
@@ -2856,7 +3051,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
@@ -2916,7 +3111,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     return false;
 }
 
-static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
+static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
                                       GetPhysAddrResult *result,
@@ -3040,6 +3235,23 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     }
 }
 
+static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
+                              target_ulong address,
+                              MMUAccessType access_type,
+                              GetPhysAddrResult *result,
+                              ARMMMUFaultInfo *fi)
+{
+    if (get_phys_addr_nogpc(env, ptw, address, access_type, result, fi)) {
+        return true;
+    }
+    if (!granule_protection_check(env, result->f.phys_addr,
+                                  result->f.attrs.space, fi)) {
+        fi->type = ARMFault_GPCFOnOutput;
+        return true;
+    }
+    return false;
+}
+
 bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                bool is_secure, GetPhysAddrResult *result,
@@ -3050,8 +3262,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
         .in_secure = is_secure,
         .in_space = arm_secure_to_space(is_secure),
     };
-    return get_phys_addr_with_struct(env, &ptw, address, access_type,
-                                     result, fi);
+    return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
 }
 
 bool get_phys_addr(CPUARMState *env, target_ulong address,
@@ -3121,8 +3332,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     ptw.in_space = ss;
     ptw.in_secure = arm_space_is_secure(ss);
-    return get_phys_addr_with_struct(env, &ptw, address, access_type,
-                                     result, fi);
+    return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
@@ -3141,7 +3351,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     ARMMMUFaultInfo fi = {};
     bool ret;
 
-    ret = get_phys_addr_with_struct(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
+    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.34.1

