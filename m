Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1689873lfr;
        Tue, 6 Apr 2021 10:45:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSTFPA+WFeG6gnjxbJdHBlYAE16Eh58XIYmS9XEFsXTOR9HeL0kXjxQUjW6R+nGuklcFuc
X-Received: by 2002:a05:6638:144e:: with SMTP id l14mr29539433jad.76.1617731102739;
        Tue, 06 Apr 2021 10:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617731102; cv=none;
        d=google.com; s=arc-20160816;
        b=sHhsowFGFSrrQ2edPD/aJmxXILVoV4v47upGty5InhR9JRE83lCM9frMNv/1U/Q/FL
         pRydLrWFIYs10M1ca3real312/ig8aJWCG66mV732oubpAawPVaH2LVhClySwi8Tzxot
         X8hditddKlZsvHpM/J2yHI3BkHBV06xgzKMuYnXCfADKnptC0P1TCPFoTgqfs2gQ/ImL
         NAnFrmAO0iYoH7YtTuF7XXplW9bhzb2/4tcjaHkQG53Km5trqLmG8LCNCAYkUWjbtf/g
         1ntwCLqEmABP3OHC/tJVcHcpHB9wvUBaWHzafTXjKchcjqgWarci6odJrgV1s+mlQ8Hs
         E8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bmRgp+hz0GAy8sBEmRvnPYPMAtwbiJML48v1bJslbg4=;
        b=bmJYADhVzWRCDL146D1QLmXvVKYAcln7N/P6mEJl1dyTjmZwQ2fanO0WjR4Gu9yAiR
         YLoVAdXv2wvroymZJwGVM77iWN89C5VEAIia+5yfEQ0CnExkKHCEJIEjVLSHTvXdt3JJ
         9gw+90IupkzhchDLHu4r3GG5PpQ6lm3/b8Ypq/kLFBEhgGSNisKEKuW7pFBYP7TXEGcs
         sx+anUQgB2FvoI+owSCKjh+vTIKo5fYcQKw4xhYbLOJ/idlIYe99jt24tojyr9CAPwDO
         EvUU4A0jU/Rrha3oLp2Rf0Yt3L2PS6nyVVk+q9EF7P53JGW7wUOahaQXelApuxyljFKh
         56mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O9BipY2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si18333128jap.68.2021.04.06.10.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 10:45:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O9BipY2W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTpl7-0007OE-VL
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 13:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgx-0001ig-45
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:43 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgt-0006L5-JT
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:42 -0400
Received: by mail-pl1-x636.google.com with SMTP id ay2so7915589plb.3
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 10:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bmRgp+hz0GAy8sBEmRvnPYPMAtwbiJML48v1bJslbg4=;
 b=O9BipY2WU4pSGlOlhX/14k5F3S8mHtQQ7IXOFREecGcmHEoViXZCQNOueXwQH9FGWs
 MQF4gBLIYXgoWsM+BKYf1KGcpmewgOIQB74fn9dwh5sEo9ipr+mejKzzNqE2W2KJ3Yze
 sOA9swCnbSZIX/sk1VgGIAeQkdFLtMXi9h+7Nwr7RJDMGUO8KsK3jrLmU/qV70qlk/Nj
 RZCqvg55wrbXAKT2+5WXEYMuIyY6diFG07jpTklBpT+P3/M3iYyQehoWHLWhxhm1kR/L
 kek7dVAnbuLjkzdRa2xaSMWcDv0HdQdbKPOTn64cEAViuu8gtS3MKcb06ZoLpZG1mUPy
 vp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bmRgp+hz0GAy8sBEmRvnPYPMAtwbiJML48v1bJslbg4=;
 b=AZiPaeNPoMp5I9ZEVyQE+QwIaJAsLOY2ZWxU32WyL2TWkLs/W8Cja3Ar7fhdxjxn+4
 u/chBK5MFFN2LDiPTJFPWdlsrqHyjYYGigIQb943jsnUaVBNHmEzQnRhpSbYjmzPah7v
 cA55NMfQKWqHZKRfDBiZ0LvqmJvy1AxtTi5S28ymhZTX3cfc+FIbpb3qcI/hJld6pc4A
 9HIziG6dj2v3yeW9DpMMC9tco1Uv/Kp3RZdLcd6T7iNZs6ttkogQ/NoMNu/7hsS3X+qk
 BDZB9X/wu8mlRssTjykf0A+HD6/gqZSAbOvRyT3huoJgxyXxNG12LRmmpa3SKdWogJ4R
 ASSw==
X-Gm-Message-State: AOAM532wHrF5+JcWXbrvKA9Qmdsy7KQ62/dEOuZLOeBhrdz5W07XruUL
 DVpUf7Fw2p5bknZK3i7ZmVaztkjYxE/UZw==
X-Received: by 2002:a17:90b:e18:: with SMTP id
 ge24mr5479320pjb.199.1617730838218; 
 Tue, 06 Apr 2021 10:40:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/12] target/arm: Fix unaligned checks for mte_check1,
 mte_probe1
Date: Tue,  6 Apr 2021 10:40:24 -0700
Message-Id: <20210406174031.64299-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0h1LgFOhRhXP

We were incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

We cannot tell a priori whether or not a given scalar access is aligned,
therefore we must at least check.  Use mte_probe_int, which is already
set up for checking multiple granules.

Buglink: https://bugs.launchpad.net/bugs/1921948
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 109 +++++++++++++---------------------------
 1 file changed, 35 insertions(+), 74 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 144bfa4a51..619c4b9351 100644
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

