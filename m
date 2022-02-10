Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287878lfk;
        Wed, 9 Feb 2022 20:05:07 -0800 (PST)
X-Received: by 2002:a17:90a:c598:: with SMTP id l24mr727263pjt.175.1644465906791;
        Wed, 09 Feb 2022 20:05:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465906; cv=none;
        d=google.com; s=arc-20160816;
        b=Jwoz6jtup0RDmIdHy7IPPS935u9gCvMqfZjcwWoyAde4kx7rv5HRgkVAV1VUuvLngI
         uA0jAVPFnBcLNxnid6JDBAtaYd82NxlaJxQuWK1EpUtCj30dl6/eUZkZEJ4SJs4fD9Hs
         UcTsqfeDY8afmBAp9zHAOkK5vgd9fLrqdkIg9Lb3CDERerelMMOmRlg1VdvYlG8PDVja
         83ALN1zEucnCHJt6QlvjQ1qVdfMHInxkmwOcwfMiFNKQCgGlMK6aLDTp8SuM571ogaNz
         dJEq54hGWi80evksFbIhGoQCvkxE4xps9qxo3KVAxojijrArhFTLrAlKCpRmCVGuu5UM
         x5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GtHWBu/qD/0bUllW5Gw8BHbTDtQN4Yofcww2tVSz2tQ=;
        b=B6QQQPzMMrywJKsGn8KBnYZygUNMc5xKpSCazAZUB1KFQFXAWBAmu+MDRPGfsgR7NC
         Uge0q4FhmJyH4ZxMq0lIfanYi0brXpFX7gMMNqKWX41pMgefvkilCap+FM9FiVw3DDtt
         u8mYiBpiqjPvuGdkHLMIeOna8GgNiDXEQhYQAT9nO6O0O0XHu6QR5VRZBpHZqTDDdyKR
         WXaAFcK+vXDErEtqvZZTJdtEntNjuIzJo0Qyos44ZVqEaLrT939GfSx0jnQMdLkUAnOy
         SWCy0iKvxexbY9K5FN9kp6ZGWjg5ZfQpWHARhr4wcZphMau6LxMU+pp+fz62V0994vek
         jlvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kCkF8KGN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s9sor380633plq.160.2022.02.09.20.05.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:05:06 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kCkF8KGN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GtHWBu/qD/0bUllW5Gw8BHbTDtQN4Yofcww2tVSz2tQ=;
        b=kCkF8KGNhRNZoC5qieC/U/Lg9Y1J+IRE1/GYMka6glUR0MKjNGrCBltLzLbuc5XyL4
         CUnknBGzSBwkiLdjW20WXSf1K+2WSwfeYvTGlQHUGZU96Wb6bo/XfonLWPyCGHpnei1g
         3+NBx1RGIgyFI5MNkZI2AE1QdxY91F6ewXtA6Ed/lYtnhC6CNOVsRXl1NW0v8o6kgyJ/
         MPRfsnaJWwoRjLluv2iTzVitr7gC1H/sfkCo1zn6L339XGt6vm8kgXHXeiFmmM561gWm
         gXV/rdd7CNos0pZv5zdS6euyp+Hx4xxUi3pC9/Le2ocGeqIPvw553eOufo2NTfbPQ8or
         CrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GtHWBu/qD/0bUllW5Gw8BHbTDtQN4Yofcww2tVSz2tQ=;
        b=MhjcLnfFDY3icHPn7ubtGbG8nGC8pseZm1Sxq0qj75YbXV6UC2hQE6IKJTR+29W9Jo
         2oneznjhstQ7jckbe3FKUlR/KkQUsBvAmWbv3GaCUhhVyjT/UWy58KvGvHWM2NcofdDf
         bq5cdV/d78kuKKK0pG+HykIzUEDPJgNWW+lykYbUtDynuQd0qe4J9FZvvKsSVbIcx95o
         w4qTbwbxdbbHaFWKLC+L2w0rboDLdNGEJ27pzN4vsFyBcDs8liGgJKn1ff2Bfml1w4Mc
         kl8Z2Hyaea+TICnijYaNqTKN24jwWXXw+KhtqD4WGxRTWnE3roruoaIEaCIgflVysgsP
         kIIg==
X-Gm-Message-State: AOAM530V9+GaJ2B+EjW694XpBqfn6xjwiMwp+YpEYH/5kRDxBU0lZhbI
	txyPFaX2Nfvci6NpkBWFfudQf7DmjyuQwicBefU=
X-Google-Smtp-Source: ABdhPJxWPEO53thfISXMnMYS/I7k5W7LAcD2DsY5unofEUdwapNVEJb8WpG0ayUycsKl8L0P+QKzXg==
X-Received: by 2002:a17:903:2306:: with SMTP id d6mr5018868plh.14.1644465906216;
        Wed, 09 Feb 2022 20:05:06 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:05:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 12/15] target/arm: Introduce tlbi_aa64_get_range
Date: Thu, 10 Feb 2022 15:04:20 +1100
Message-Id: <20220210040423.95120-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: R24BfNke4Gp/

Merge tlbi_aa64_range_get_length and tlbi_aa64_range_get_base,
returning a structure containing both results.  Pass in the
ARMMMUIdx, rather than the digested two_ranges boolean.

This is in preparation for FEAT_LPA2, where the interpretation
of 'value' depends on the effective value of DS for the regime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 58 +++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9b1b1b2611..8b1899ceef 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4509,70 +4509,60 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 #ifdef TARGET_AARCH64
-static uint64_t tlbi_aa64_range_get_length(CPUARMState *env,
-                                           uint64_t value)
-{
-    unsigned int page_shift;
-    unsigned int page_size_granule;
-    uint64_t num;
-    uint64_t scale;
-    uint64_t exponent;
+typedef struct {
+    uint64_t base;
     uint64_t length;
+} TLBIRange;
+
+static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
+                                     uint64_t value)
+{
+    unsigned int page_size_granule, page_shift, num, scale, exponent;
+    TLBIRange ret = { };
 
-    num = extract64(value, 39, 5);
-    scale = extract64(value, 44, 2);
     page_size_granule = extract64(value, 46, 2);
 
     if (page_size_granule == 0) {
         qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
                       page_size_granule);
-        return 0;
+        return ret;
     }
 
     page_shift = (page_size_granule - 1) * 2 + 12;
-
+    num = extract64(value, 39, 5);
+    scale = extract64(value, 44, 2);
     exponent = (5 * scale) + 1;
-    length = (num + 1) << (exponent + page_shift);
 
-    return length;
-}
+    ret.length = (num + 1) << (exponent + page_shift);
 
-static uint64_t tlbi_aa64_range_get_base(CPUARMState *env, uint64_t value,
-                                        bool two_ranges)
-{
-    /* TODO: ARMv8.7 FEAT_LPA2 */
-    uint64_t pageaddr;
-
-    if (two_ranges) {
-        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    if (regime_has_2_ranges(mmuidx)) {
+        ret.base = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
     } else {
-        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = extract64(value, 0, 37) << TARGET_PAGE_BITS;
     }
 
-    return pageaddr;
+    return ret;
 }
 
 static void do_rvae_write(CPUARMState *env, uint64_t value,
                           int idxmap, bool synced)
 {
     ARMMMUIdx one_idx = ARM_MMU_IDX_A | ctz32(idxmap);
-    bool two_ranges = regime_has_2_ranges(one_idx);
-    uint64_t baseaddr, length;
+    TLBIRange range;
     int bits;
 
-    baseaddr = tlbi_aa64_range_get_base(env, value, two_ranges);
-    length = tlbi_aa64_range_get_length(env, value);
-    bits = tlbbits_for_regime(env, one_idx, baseaddr);
+    range = tlbi_aa64_get_range(env, one_idx, value);
+    bits = tlbbits_for_regime(env, one_idx, range.base);
 
     if (synced) {
         tlb_flush_range_by_mmuidx_all_cpus_synced(env_cpu(env),
-                                                  baseaddr,
-                                                  length,
+                                                  range.base,
+                                                  range.length,
                                                   idxmap,
                                                   bits);
     } else {
-        tlb_flush_range_by_mmuidx(env_cpu(env), baseaddr,
-                                  length, idxmap, bits);
+        tlb_flush_range_by_mmuidx(env_cpu(env), range.base,
+                                  range.length, idxmap, bits);
     }
 }
 
-- 
2.25.1
