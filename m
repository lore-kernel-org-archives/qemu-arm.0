Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087778lfc;
        Thu, 12 Mar 2020 12:42:55 -0700 (PDT)
X-Received: by 2002:a17:902:9890:: with SMTP id s16mr8876973plp.77.1584042175247;
        Thu, 12 Mar 2020 12:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042175; cv=none;
        d=google.com; s=arc-20160816;
        b=L0J7y784nD7L0jTF2vuNYf5rJvkDgsdfbKtOVTxiuWgkM8GpkxpHgeizzoAn/vLzFZ
         oRjXM35F5la2yggZ3z+rLOUeRBBroODPZSbcjAyGrgLIrPEjK15osTLdGStGhyHAMZXJ
         n4Ws8gYUUbSlSjXhKMi1vDKttGfMwwquVVpi2o4jAXh4rlH0BPKG5d5cKETC0m95/i9+
         MgxO7Nex7hw65rTOOieziGjs3kk7ZZX4KLeoSOMzFbjw0A5/vqwScLqoe6n9I+ql8UpP
         nojGu98H+J/Ez6NBKL9vtdsXY6x+cU5KM+juAOy0vsy9ZbpZEEoc6Su5hIE/zqsE4tJm
         GuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IBVWDMhA5xeJ1t7FkiUhAVEPTJaDqFXyx+BzGGFHx9I=;
        b=ej2GGF+f22CxlGxzjQ6ykF4iKs4On5cgjswGSDQiRufK1fZVnNqkBjxWkxs70mHy1x
         J78ji7P4/5UYD+6bptLCfSSAoENMeF96SRIOyeD34T7KdzzidOkZLhriPaGEzcSQNhI1
         BkgkAppn2aWGRlTFmqmPOqd2cLLHBuf1POqHpdfgkSs37wOkfFjQEPkpOUdhOvfv2aI2
         JZoFqgug4F3Sz6qP74EmTsc8u/hx4mIT2VmvridYxI1lWwZmpvO3B7utvA1un6ZdPlAS
         Mpq8KmkRxZ0kg9RV1w7VNdZ7ykDeXVrLlFeMY2dI3samh0V3W2ffBVzy/SZYXJCC4LTK
         qoow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=olQOyDIE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r13sor7473506pgs.32.2020.03.12.12.42.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=olQOyDIE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IBVWDMhA5xeJ1t7FkiUhAVEPTJaDqFXyx+BzGGFHx9I=;
        b=olQOyDIEpo8WpX+r6UIJkPkICFM81UI0Af/iwDADKEXhFQAB0qPQ8yQLLgpnrvd0SP
         p9F9UmICF/fH+5rjoTcMjMYf5W8kulrmCuUeB6fVsBMyWa6e/rCsHiMyxfisVaxxW6kO
         LhSrWqeVjCMtuPt4lnPZxHbIPbW2RPMP5KGatX2K8dM8g0LCmIL/varkKvUA38wI6flf
         DwSpHOtAg/uLeecTCFmN9bNdpTQ8HIMQRRVc7WY59SI1NzGfFPk5PiZSuMBxtuF2vfAd
         MaTDabYjJX1FOio0CfUoTIpWu0oVPxzDpo+ZB4fscjMKMgG/1QIqSPKZkBeExBuCZ1k1
         jOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IBVWDMhA5xeJ1t7FkiUhAVEPTJaDqFXyx+BzGGFHx9I=;
        b=jS3IXuOJcPHcaTd6HFEWoXNXOIYCUb4fBM+dnPIIRt91bvgrP7qdt9iz2f6FJJ5NtH
         PLPfl3jDjihlCd6dHFE4w+zPbeoj9oVaLB4RlSLriEz74iq3fvBDpwzM+tKoQ+nB3R2w
         soUDh1Ap5PECMyd77z7UyJxiXdpGTpmZzM77KOwU1CwyEH26OWfyDWDzWczas3lDqRBE
         MXmI375pEqzCYgoiPJtr22NjD9mFZjdbIUyxzupC63LrOUPJbk1HM+8Y4V12mPtpIdGU
         jSZ7XAZ6AWVaAggDkPDuubQpbu+mRJ2yy6ZEv9JzdxepdbZjWDDo5I9N3wsiRqt17mx4
         3uPA==
X-Gm-Message-State: ANhLgQ28lg+3UJ38u4p2rFUfpB9ivzPRX+R+OGz6WT7FamqIJPSCPSww
	JwLuRWY0qTFdkIBWpxMmzzzgZnEjVJlo1A==
X-Google-Smtp-Source: ADFU+vsSW7bbPsLeiXqGzSw/FDnq6/ElQr5bLrccigvzc++Z332ucscmTP6Fn2jnKl20Ml/QMhCakw==
X-Received: by 2002:a65:6416:: with SMTP id a22mr9888215pgv.268.1584042174648;
        Thu, 12 Mar 2020 12:42:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 25/42] target/arm: Implement helper_mte_check1
Date: Thu, 12 Mar 2020 12:42:02 -0700
Message-Id: <20200312194219.24406-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: sozBb2Ysril1

Fill out the stub that was added earlier.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  |  47 +++++++++++++++
 target/arm/mte_helper.c | 126 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a993e8ca0a..8bbaf9b453 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1314,6 +1314,9 @@ FIELD(MTEDESC, WRITE, 8, 1)
 FIELD(MTEDESC, ESIZE, 9, 5)
 FIELD(MTEDESC, TSIZE, 14, 10)  /* mte_checkN only */
 
+bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
+uint64_t mte_check1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
+
 static inline int allocation_tag_from_addr(uint64_t ptr)
 {
     return extract64(ptr, 56, 4);
@@ -1324,4 +1327,48 @@ static inline uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
     return deposit64(ptr, 56, 4, rtag);
 }
 
+/* Return true if tbi bits mean that the access is checked.  */
+static inline bool tbi_check(uint32_t desc, int bit55)
+{
+    return (desc >> (R_MTEDESC_TBI_SHIFT + bit55)) & 1;
+}
+
+/* Return true if tcma bits mean that the access is unchecked.  */
+static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
+{
+    /*
+     * We had extracted bit55 and ptr_tag for other reasons, so fold
+     * (ptr<59:55> == 00000 || ptr<59:55> == 11111) into a single test.
+     */
+    bool match = ((ptr_tag + bit55) & 0xf) == 0;
+    bool tcma = (desc >> (R_MTEDESC_TCMA_SHIFT + bit55)) & 1;
+    return tcma && match;
+}
+
+/*
+ * For TBI, ideally, we would do nothing.  Proper behaviour on fault is
+ * for the tag to be present in the FAR_ELx register.  But for user-only
+ * mode, we do not have a TLB with which to implement this, so we must
+ * remote the top byte.
+ */
+static inline uint64_t useronly_clean_ptr(uint64_t ptr)
+{
+    /* TBI is known to be enabled. */
+#ifdef CONFIG_USER_ONLY
+    ptr = sextract64(ptr, 0, 56);
+#endif
+    return ptr;
+}
+
+static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
+{
+#ifdef CONFIG_USER_ONLY
+    int64_t clean_ptr = sextract64(ptr, 0, 56);
+    if (tbi_check(desc, clean_ptr < 0)) {
+        ptr = clean_ptr;
+    }
+#endif
+    return ptr;
+}
+
 #endif
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 907a12b366..7a87574b35 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -359,12 +359,136 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
     }
 }
 
+/* Record a tag check failure.  */
+static void mte_check_fail(CPUARMState *env, int mmu_idx,
+                           uint64_t dirty_ptr, uintptr_t ra)
+{
+    ARMMMUIdx arm_mmu_idx = core_to_aa64_mmu_idx(mmu_idx);
+    int el, reg_el, tcf, select;
+    uint64_t sctlr;
+
+    reg_el = regime_el(env, arm_mmu_idx);
+    sctlr = env->cp15.sctlr_el[reg_el];
+
+    switch (arm_mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E20_0:
+        el = 0;
+        tcf = extract64(sctlr, 38, 2);
+        break;
+    default:
+        el = reg_el;
+        tcf = extract64(sctlr, 40, 2);
+    }
+
+    switch (tcf) {
+    case 1:
+        /*
+         * Tag check fail causes a synchronous exception.
+         *
+         * In restore_state_to_opc, we set the exception syndrome
+         * for the load or store operation.  Unwind first so we
+         * may overwrite that with the syndrome for the tag check.
+         */
+        cpu_restore_state(env_cpu(env), ra, true);
+        env->exception.vaddress = dirty_ptr;
+        raise_exception(env, EXCP_DATA_ABORT,
+                        syn_data_abort_no_iss(el != 0, 0, 0, 0, 0, 0x11),
+                        exception_target_el(env));
+        /* noreturn, but fall through to the assert anyway */
+
+    case 0:
+        /*
+         * Tag check fail does not affect the PE.
+         * We eliminate this case by not setting MTE_ACTIVE
+         * in tb_flags, so that we never make this runtime call.
+         */
+        g_assert_not_reached();
+
+    case 2:
+        /* Tag check fail causes asynchronous flag set.  */
+        mmu_idx = arm_mmu_idx_el(env, el);
+        if (regime_has_2_ranges(mmu_idx)) {
+            select = extract64(dirty_ptr, 55, 1);
+        } else {
+            select = 0;
+        }
+        env->cp15.tfsr_el[el] |= 1 << select;
+        break;
+
+    default:
+        /* Case 3: Reserved. */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Tag check failure with SCTLR_EL%d.TCF%s "
+                      "set to reserved value %d\n",
+                      reg_el, el ? "" : "0", tcf);
+        break;
+    }
+}
+
 /*
  * Perform an MTE checked access for a single logical or atomic access.
  */
+static bool mte_probe1_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
+                           uintptr_t ra, int bit55)
+{
+    int mem_tag, mmu_idx, ptr_tag, size;
+    MMUAccessType type;
+    uint8_t *mem;
+
+    ptr_tag = allocation_tag_from_addr(ptr);
+
+    if (tcma_check(desc, bit55, ptr_tag)) {
+        return true;
+    }
+
+    mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
+    type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
+    size = FIELD_EX32(desc, MTEDESC, ESIZE);
+
+    mem = allocation_tag_mem(env, mmu_idx, ptr, type, size,
+                             MMU_DATA_LOAD, 1, ra);
+    if (!mem) {
+        return true;
+    }
+
+    mem_tag = load_tag1(ptr, mem);
+    return ptr_tag == mem_tag;
+}
+
+/* No-fault version of mte_check1, to be used by SVE for MemSingleNF. */
+bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
+{
+    int bit55 = extract64(ptr, 55, 1);
+
+    /* If TBI is disabled, the access is unchecked. */
+    if (unlikely(!tbi_check(desc, bit55))) {
+        return true;
+    }
+
+    return mte_probe1_int(env, desc, ptr, ra, bit55);
+}
+
+uint64_t mte_check1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
+{
+    int bit55 = extract64(ptr, 55, 1);
+
+    /* If TBI is disabled, the access is unchecked, and ptr is not dirty. */
+    if (unlikely(!tbi_check(desc, bit55))) {
+        return ptr;
+    }
+
+    if (unlikely(!mte_probe1_int(env, desc, ptr, ra, bit55))) {
+        int mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
+        mte_check_fail(env, mmu_idx, ptr, ra);
+    }
+
+    return useronly_clean_ptr(ptr);
+}
+
 uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
-    return ptr;
+    return mte_check1(env, desc, ptr, GETPC());
 }
 
 /*
-- 
2.20.1
