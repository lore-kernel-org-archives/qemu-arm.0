Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp51253lfm;
        Thu, 25 Jun 2020 20:38:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq7r4MTXfb3KO8PiSCdEvYimk9uqD+JOKKITzhpbgATFIgsyQTxnNFNQi25bDBiqiEu4xt
X-Received: by 2002:a5b:886:: with SMTP id e6mr1742509ybq.318.1593142733954;
        Thu, 25 Jun 2020 20:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142733; cv=none;
        d=google.com; s=arc-20160816;
        b=iCFYBsSViz94qUyxBcU72X+xDbT1QOhFPn62yIaaih/Ja+uM8MhLC2Gqzp3yDkUK7x
         0kltW1BnPLF6bzRRrDw+zrT3DLaCtxtorADa4MPogp7XR6tuT+qg5ng+Anwl2y+xeOaV
         H4hcLEGFMGwhCOh2ZVIkzsZGFqITAkm/U/0/hL8/CfG+HkLjQi1K6d2aJupFWWQtVC7L
         HUcQ6AAHUa0xo/u5Q4XBuDguP5NU95ZpBiFQlEc6NA2wnh9k09QNMdwkxFeth+IbRdax
         ngDAvAe2MZ5CUPQJeg1Fb69NzXCGibVJTXkHGq8py3/mzDUfxIYlWBi5EyTbXi4Z7dDS
         5nuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nfws/5P0S9Q1FIrkDN1j4FSpqQ0OrWG8P7q66k6TbXI=;
        b=a12neYU5Ntnu3GULoeFWK4H9xL+ewrqR6OKkU929mHX0d/S2gS3teI1Z5yAf+u/0tQ
         uNWvyLOqQhwNDXNQfI9QnoOo4Gfv/uCvIpaDnUh5QnnEs5CmAtSwi1reYxS2bxrLfoWx
         fpNv4XyV+1VbyboRU3Y4vOyStT5nzMYXCQJ+BJ8RvJ0ki5jhmybFHrlDg/VK5j0Hm4UO
         NnbgCq1lS9Qb6dW747tLRPiIHjEHpInPdo3bXOToK1FMIoXYMtVcuERDh+/NO5wJHR6y
         7ijmLPVoKLFJTU7za/qXdICgZPbajlBAa3xV5Eb1yFK5AqxtLaBUZhyPuL/997CQnIQg
         UPFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D4yLNDvw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n202si22866968ybf.48.2020.06.25.20.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D4yLNDvw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofCX-0004P5-3G
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6F-0000S2-8N
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:23 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:41455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6C-0001wO-SO
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:22 -0400
Received: by mail-pl1-x643.google.com with SMTP id f2so3750828plr.8
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nfws/5P0S9Q1FIrkDN1j4FSpqQ0OrWG8P7q66k6TbXI=;
 b=D4yLNDvw96HvdG/y4tlyovdqkdfAqYanparJ0Z/p22PuZC/U51LnvKnrWvtWt9xEme
 PInUDpRWD6/kkb7t9Y2orY+B8mCBSfagJkDCokl7hak4bkOfTcE2vyTKo7np8XS4C4KA
 SuRwNEvDJ1HAuVNfFiMx147Jrrc58Pp28Pr/aljoUVp/aaF3EH7IHKU1e/SIehjDry+f
 +fpnKo7ynPh9C15yi03D3UHlBh1FQt8xBCM94/g/VSOaQRSy9096Vwm0KyF2r+jVew86
 pZjLeURH6XLOAUCQuPl03QhkNw2U7Z3858sjxMEsvYUjcn5bHz7y8srAimsWGgxoXaJZ
 30sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nfws/5P0S9Q1FIrkDN1j4FSpqQ0OrWG8P7q66k6TbXI=;
 b=LdXJle0sPDXGZDIPEDc1H8+pAC8msPJ56FG22ccbyEqSeXtPbcEJNMk1lbyjEKFdxS
 g5nv6E2D+12I9tmMT0ce/XsqXBteIzdPZKAz9v83MCFqLzq11Ignkl69SihrWgbUORGi
 uARpobPaQUJXrBFCGHHN/x11GgyTySEF/l3vhN1cwLblQrjup+DiQ0nNxox6IUQ+2Lcw
 0RpDFoFPdx0SWBf5k0z9fuNnF2oKFUS3FLYYbl0MBAbi8KEIw31P85n4kFBa8k4DdWid
 LjhYXzw5UvYtxl6K9NoRGZNvDBhSgSsy3v8LlVei2CL8IfvKMKPR5Nye5MdG/hkYYU4j
 Zadw==
X-Gm-Message-State: AOAM531YC/sqBxije8yMdpudThSpodJp/8LU5YC2J1N+2Lst9Fufn4w7
 yUTfzAWAKDXBIJnvzE68g57xehsoTvM=
X-Received: by 2002:a17:90a:ce02:: with SMTP id
 f2mr1232225pju.159.1593142339465; 
 Thu, 25 Jun 2020 20:32:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 25/46] target/arm: Implement helper_mte_check1
Date: Thu, 25 Jun 2020 20:31:23 -0700
Message-Id: <20200626033144.790098-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gAtug3tS03kC

Fill out the stub that was added earlier.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v8: Remove ra argument to mte_probe1 (pmm).
---
 target/arm/internals.h  |  48 +++++++++++++++
 target/arm/mte_helper.c | 132 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 179 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index fb92ef6b84..807830cc40 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1318,6 +1318,10 @@ FIELD(MTEDESC, WRITE, 8, 1)
 FIELD(MTEDESC, ESIZE, 9, 5)
 FIELD(MTEDESC, TSIZE, 14, 10)  /* mte_checkN only */
 
+bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
+uint64_t mte_check1(CPUARMState *env, uint32_t desc,
+                    uint64_t ptr, uintptr_t ra);
+
 static inline int allocation_tag_from_addr(uint64_t ptr)
 {
     return extract64(ptr, 56, 4);
@@ -1328,4 +1332,48 @@ static inline uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
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
+ * remove the top byte.
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
index 907a12b366..c8a5e7c0ed 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -359,12 +359,142 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
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
+                        syn_data_abort_no_iss(el != 0, 0, 0, 0, 0, 0, 0x11),
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
+/*
+ * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
+ * Returns false if the access is Checked and the check failed.  This
+ * is only intended to probe the tag -- the validity of the page must
+ * be checked beforehand.
+ */
+bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
+{
+    int bit55 = extract64(ptr, 55, 1);
+
+    /* If TBI is disabled, the access is unchecked. */
+    if (unlikely(!tbi_check(desc, bit55))) {
+        return true;
+    }
+
+    return mte_probe1_int(env, desc, ptr, 0, bit55);
+}
+
+uint64_t mte_check1(CPUARMState *env, uint32_t desc,
+                    uint64_t ptr, uintptr_t ra)
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
2.25.1

