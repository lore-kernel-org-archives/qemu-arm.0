Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4346935lfm;
        Tue, 23 Jun 2020 12:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkaZ3z80/+zL+/hdt9FPAG163+RPxLaebJJo1El90lzk5Tk8ijRIaPtoW94RUaIga9hrLg
X-Received: by 2002:a25:c74b:: with SMTP id w72mr41875655ybe.191.1592941637322;
        Tue, 23 Jun 2020 12:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941637; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2Kd6X3n+qjbo6hwcjgQVtPSSGafHl7vg2zIq6wcfF/nwVq8hfq2NHT9/Pb4smQFUS
         TS89WrNu76L6UvvxGU9451Ae2CAV2M46PU2Durg/Ln41AKN6O1y384OPpiCoNECQlvTc
         kih3Qz27++M9O5qOk5H2glpebfPDnAgms3v2tpoICRCoQmUxY95KAO2EeFGUS9lCMQqS
         y1W0POv5Kb2zStajXIRdPvVFcTJeuJfxq75y275p9Qw++PD4/Or91XJ/vfpNli8XLlcG
         tVcHh2e8qG02c4sxfS16TLqJ/4RzolxtPyuqfgqBhIed7W2zCf+yNLh4d3vCJl/QzBVa
         KeEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=i/c4TiFBXGswGdsE1RQ1XA7vTBF/TaJqHJ3ycBdltpU=;
        b=RhX+J+JwW7NRRj3ZIU0rPlx9CgEOL3zSaHNnjObVIYvDUZI22cvuNUqBpR0PTNzMm2
         JnxgkesgkkhpmKQIk0PoxiMVuSegIijiub+I4/s7kCnCSY7TyKrYhFqKO4n2BiD1TT1O
         +xO0wVxBXeZ90vsk3EQStLmRlgTsMRWTnVpPZhPcCC+t6/ayWQUhB3+iludbBHdSXPvg
         9L2NWhIbKWVoy/CjRtwWCaZqMSBz5+HVN4heDHCKqkrlaNn+3ApbciN824U2Ku3ijBJA
         rp9fk6wGvPU4XhN0gQ7pd3dMo1f9j5Ow/1G4jiflzhnQ8rbFbTYsec1wwFRFnaZ8OH+7
         QZlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oIYa3XAd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j81si16943084ybg.136.2020.06.23.12.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oIYa3XAd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnot2-0005QX-Je
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojj-0004Oh-6N
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:39 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojh-0005n7-62
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:38 -0400
Received: by mail-pl1-x642.google.com with SMTP id g17so357568plq.12
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/c4TiFBXGswGdsE1RQ1XA7vTBF/TaJqHJ3ycBdltpU=;
 b=oIYa3XAdUNOg8arrXvvFzlFCq3PyzgXXyeAP7dof+CyVnImUD9jK47gTir4jg+KC8K
 sCMS+nur4jRL2n1NohDZF775cyU39oVf8Xt6dfjVKbQ/+Yc8pJc75LvVU5n8dRpE6Egy
 TxmFWdpmLxlOVXI1OulBAfITD+Avn/44XkVV5chQAtSI9IMtpvTM//3hDcKpt+/oCk5a
 mla5NaEwQGaA5TwE6l/sjDyKh5EdVP1WQhOJGWZIbz3vBrVd7IQ+Ylsxfke2pMBLPwHu
 nQ5QZxEjl36Nguc3bR0HDpc4jugyvR00IkHh9QycSL+SXso84ns3lrQS0vnr6vwIYZ9I
 4U4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/c4TiFBXGswGdsE1RQ1XA7vTBF/TaJqHJ3ycBdltpU=;
 b=hyrPGWgsx7RsKz3yFTkicmzLeMF0/ca5/x6tOJ+TNRybLDdhSksQzcyg4IXj4NJgb6
 ZMI9GbIn9AOOjH/ccNyIcirt/b/F1QnabIcJ4I4YqTZmEGZ5MtHI+maKYyE9DxTxM6z/
 DeBRKOQAVmGyxr2z2ErQDyhDT3QqeXxKI+TUxIusvkvPSLRNAD/G4F3/P306dGOnv7rO
 59ut5atieG3ekSErDcbL7En6Xpeh+5bQQIdZBFcqQzOqgA+blMOo2jEbmWijxem+e5+J
 4a3YK4CMXHeAJmigucGaUM2WjM0p8zKe15XdBtOwkkgsrTFoQcdYiDCxbwExCzJibWYQ
 S7XA==
X-Gm-Message-State: AOAM5313vDA05QHA2HUd9hkGZXU9CzzrM0KeZT4CMgge1Y88AakSe0v0
 GcQcvJjncS2E+XhaSrdJE5o6yQ==
X-Received: by 2002:a17:902:d902:: with SMTP id
 c2mr26792589plz.194.1592941055713; 
 Tue, 23 Jun 2020 12:37:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 25/45] target/arm: Implement helper_mte_check1
Date: Tue, 23 Jun 2020 12:36:38 -0700
Message-Id: <20200623193658.623279-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
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
X-TUID: 16rQ5raHXnAW

Fill out the stub that was added earlier.

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

