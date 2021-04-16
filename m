Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp629236lfr;
        Fri, 16 Apr 2021 11:31:12 -0700 (PDT)
X-Received: by 2002:a17:90a:9312:: with SMTP id p18mr10909139pjo.171.1618597872060;
        Fri, 16 Apr 2021 11:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618597872; cv=none;
        d=google.com; s=arc-20160816;
        b=CYY2grQBCyhsEKh8ANff+HeyICEbHFifkf10Ss40q7nu/VkXJUu7ytTMATIztw06x7
         jEv2Hrk41lxjnl1ARTXVs0YaYEoKoG+eJStv4ze90VGO9YtjphnS9R6Znn+dEPFAEMTx
         lxD/S2Y/GgatXdwTrsBWwLirPNIfHi34I8VPzHUYF+IVZj3aOpcYtZ2SM4WWp8N9vgmv
         4D+lRekRQU5wCGcRqobJT3q1Rb9oyf7j/eUkADbn8t0ikBVXL+khm7xrEFQ/d/OajVoY
         Pt0zPCttQd/RwfbvJVhYTMJBu9+j8XnlK9A6kQr9TKQ7vy2pXFCKVbtfosIf5qf0nQae
         dBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mj41jJYbzXyq3sTGhn9kq1lWasC3eBaeJTYTSWNGsWo=;
        b=iEDkANh0aSwg9GeQfTh0C7iWDBZCiM+jFkvfXIYrLqi9YqEMML5BUVzYVOdC6grep7
         bNUeuQ/z+94Wn6bRob63s2fMD3CmjX6d8+Meynuw4b1tTbo2ureHhFwZHjywVwu4Bitg
         GvqgU5ekfn3xM7tPrT2KF5IdEJ4F0WJUzYTxLiM/BowzKqZiUqMSt2IWXOw3ZZH60tKb
         qlpW+jOhQMk7UxQn7zdQSjlNQ6I2zD/a8n0susffioWCbFKnuXnUn8YucarWtaBNkPCn
         9MtSIM3ACvwxLzZZWvhCCAIoQ+mZWZIK6vUBzx0JfhIl56sf2kLzuK9QwkAGCEs/xPnx
         64rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PnPOaFbQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u7sor4283321plr.30.2021.04.16.11.31.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Apr 2021 11:31:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PnPOaFbQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mj41jJYbzXyq3sTGhn9kq1lWasC3eBaeJTYTSWNGsWo=;
        b=PnPOaFbQ1GwMyiTEdY6DRcsJOtmIKO4+PTcnmEJ85mhAQBTMNTBaAL6o5I2oT6Dz8j
         6UJ0R+n2D/9yl21OcgyDASWSKvW7dQA1wD6iWsZ1rdwuaHD7x91jQL9RKeeDap6zHE5j
         1DK5nhVRZAB24oT0aMTG6mKS33nR+oEFAFohnzfiCqBcrN+0SkPyD/PJwvYkk37nqc8W
         MjEzik394fURvi/PjTsm85AT9eBP9zCRcxmsm3n4BT4FGhtdNsn/EEwqv0ckZlkiODrx
         KSjW9l8keGbWU0oHfLG6NynM0KAysc45c/5/1mvPWyRBaLaZiFkY4mzUBvX0bLBpR7fJ
         3kXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mj41jJYbzXyq3sTGhn9kq1lWasC3eBaeJTYTSWNGsWo=;
        b=aHW/OfqzFFy0cozseb7BnPWYMUxRvuU/zG0rubm8RM6Ghs7DgS8NEK+Ywdc+Tx4w5G
         bIdF8H05ciW8iytdBqUmYgzMYqofhCC+6VeceRhdV8hJdkvs25GtzCdPMID/KQmVcN8M
         ycTMvNwfkp1dtRAlV3+feNr7rZwTfEiwtpdxTva/lcfya0jCTZV0lMsz11E5gTvgPws1
         QBn5CjjH0so6Y9XZdo/+7LDiICHzKYgwq+W9mOcnNDuec6dG/Cuq1IDcBaVxk2gZcBtf
         sSqjuv+JEBPyq5b/QpPUhdiQrp/D0aMgupYzZN5ot2cEH68E83WeZTMk/rLmk4OIhiFf
         cXwQ==
X-Gm-Message-State: AOAM533OTR5V79f8XtIBka86V28wXsYabiEg3tZEg5I/gj/rTluBRjXV
	69eox4hj1Tzwlnh4Hh/vgYabfBQkCxApgS1i
X-Google-Smtp-Source: ABdhPJzxpmf+A9U4CBfsbvJZB+e3AavGznwzGiSi0LswYZUMFKMrc/rRFXv8O9CfLIZXyVtEPay1Vg==
X-Received: by 2002:a17:903:189:b029:e5:d7c3:a264 with SMTP id z9-20020a1709030189b02900e5d7c3a264mr10728770plg.6.1618597871559;
        Fri, 16 Apr 2021 11:31:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.131.83])
        by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:31:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 3/9] target/arm: Fix unaligned checks for mte_check1, mte_probe1
Date: Fri, 16 Apr 2021 11:31:00 -0700
Message-Id: <20210416183106.1516563-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nB1y3FM2t+7l

We were incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

We cannot tell a priori whether or not a given scalar access is aligned,
therefore we must at least check.  Use mte_probe_int, which is already
set up for checking multiple granules.

Buglink: https://bugs.launchpad.net/bugs/1921948
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 109 +++++++++++++---------------------------
 1 file changed, 35 insertions(+), 74 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index c7138dfc16..8b95f861e8 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -617,80 +617,6 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
     }
 }
 
-/*
- * Perform an MTE checked access for a single logical or atomic access.
- */
-static bool mte_probe1_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
-                           uintptr_t ra, int bit55)
-{
-    int mem_tag, mmu_idx, ptr_tag, size;
-    MMUAccessType type;
-    uint8_t *mem;
-
-    ptr_tag = allocation_tag_from_addr(ptr);
-
-    if (tcma_check(desc, bit55, ptr_tag)) {
-        return true;
-    }
-
-    mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
-    type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
-    size = FIELD_EX32(desc, MTEDESC, ESIZE);
-
-    mem = allocation_tag_mem(env, mmu_idx, ptr, type, size,
-                             MMU_DATA_LOAD, 1, ra);
-    if (!mem) {
-        return true;
-    }
-
-    mem_tag = load_tag1(ptr, mem);
-    return ptr_tag == mem_tag;
-}
-
-/*
- * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
- * Returns false if the access is Checked and the check failed.  This
- * is only intended to probe the tag -- the validity of the page must
- * be checked beforehand.
- */
-bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
-{
-    int bit55 = extract64(ptr, 55, 1);
-
-    /* If TBI is disabled, the access is unchecked. */
-    if (unlikely(!tbi_check(desc, bit55))) {
-        return true;
-    }
-
-    return mte_probe1_int(env, desc, ptr, 0, bit55);
-}
-
-uint64_t mte_check1(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra)
-{
-    int bit55 = extract64(ptr, 55, 1);
-
-    /* If TBI is disabled, the access is unchecked, and ptr is not dirty. */
-    if (unlikely(!tbi_check(desc, bit55))) {
-        return ptr;
-    }
-
-    if (unlikely(!mte_probe1_int(env, desc, ptr, ra, bit55))) {
-        mte_check_fail(env, desc, ptr, ra);
-    }
-
-    return useronly_clean_ptr(ptr);
-}
-
-uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
-{
-    return mte_check1(env, desc, ptr, GETPC());
-}
-
-/*
- * Perform an MTE checked access for multiple logical accesses.
- */
-
 /**
  * checkN:
  * @tag: tag memory to test
@@ -882,6 +808,41 @@ uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32_t desc, uint64_t ptr)
     return mte_checkN(env, desc, ptr, GETPC());
 }
 
+uint64_t mte_check1(CPUARMState *env, uint32_t desc,
+                    uint64_t ptr, uintptr_t ra)
+{
+    uint64_t fault;
+    uint32_t total = FIELD_EX32(desc, MTEDESC, ESIZE);
+    int ret = mte_probe_int(env, desc, ptr, ra, total, &fault);
+
+    if (unlikely(ret == 0)) {
+        mte_check_fail(env, desc, fault, ra);
+    } else if (ret < 0) {
+        return ptr;
+    }
+    return useronly_clean_ptr(ptr);
+}
+
+uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
+{
+    return mte_check1(env, desc, ptr, GETPC());
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
+    uint64_t fault;
+    uint32_t total = FIELD_EX32(desc, MTEDESC, ESIZE);
+    int ret = mte_probe_int(env, desc, ptr, 0, total, &fault);
+
+    return ret != 0;
+}
+
 /*
  * Perform an MTE checked access for DC_ZVA.
  */
-- 
2.25.1
