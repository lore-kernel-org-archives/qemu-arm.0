Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209888lfo;
        Tue, 1 Mar 2022 14:00:22 -0800 (PST)
X-Received: by 2002:a62:8895:0:b0:4e1:78b:5ab7 with SMTP id l143-20020a628895000000b004e1078b5ab7mr29964894pfd.67.1646172022177;
        Tue, 01 Mar 2022 14:00:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172022; cv=none;
        d=google.com; s=arc-20160816;
        b=D+BJpHRhTIkAEMOEgS+B4NhL2DZkYa0auCIlYIuvFz1Ij4DkSUQYklcvzYCuRdQe3D
         K5xR8McZ70tN8Mlw7mz+jlvyVJIFQkmhOP4jVPXWNNiygLW6mwWvDLY/phsZLlzYCZqS
         kvn9sd3S2Y8YgWJZGQ8ZzTZIvbAkLARTAMe+Bxb/+WFj4Bs9MWim0swV600VX+mZzN+S
         uJxiBYPOf3h3K19sS9jCuLEh/cVxqPkFbVXNh5dDtMeUXBb0+CAXuyWuVk3uVyPBmYoa
         zP2Idy3HACIWR1UFAVUxfFmzlfwe1QCCwVASE2m3dLTapCNyUPuSZqzvqIt4456SB4E2
         3I8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Uavi3yQmU7TEij7jJpcySVBC3+TVvlm3sHX3b1s1W6c=;
        b=C9GKUkrlKxKaMYqiTQ01S4z5JRdbbEKF+5GwJ/lnWM28CmAjINX4NUggPZ6XtHG/A1
         1ws+6ftzG9Y6fyfmF489OJwK+07u4OcNYBiVCHRTmDXMCSuTyYZpgA1fzXH10ZIgvLz3
         MwtkaDoGLefZgj0/uWQLHEDSlL1qEfSXmJf3wkl6Hh0IUtTIgtSod8HcQR3Uo1Cl0d4+
         ljtWDxjIGpcHkpXyTEMYhyiiPk7Kn1uoYcV26YY2xY+TUHbZTcRW1y2IGH0SJdj8dk6u
         nQTuwBYvQo0qmYWwGkpkWeKvbRdOeW6lPqM0SGBssY3KXl4aXjtH3xdBBs3YqD+ttsNv
         cn2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9Hpxm+y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lw5-20020a17090b180500b001bc8432d69bsor6669191pjb.7.2022.03.01.14.00.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9Hpxm+y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uavi3yQmU7TEij7jJpcySVBC3+TVvlm3sHX3b1s1W6c=;
        b=x9Hpxm+yOZ3n2zpMptbltLZJ/Fj3t8u0ktCJjHkh1yz48YGRmn+IzwbD+One+J9O1n
         ifkP8awY/S0F8l4MIIMPZjMkI5pBI9ms4qsAeh53k6p5iyv4ESSMv3BB7AHwb1bVokzU
         0pm6UKg/qHQubrQJes8VV5Qrn6V9StWJTbaKoZzZDqQhei/xjyjjxOTJRMoolwqWjBCj
         te2oV5UEbJ0LuQ1a5hq9k6j4mJttybImuAvHH3jUvZLLRdjy/7su454Yz/oztvNkr7R2
         ggEUhCUUIgqARkIiiN0KQlPULLnP06B7POqONcLzRfkHRB5wbZVB1Tecr59KOQpb+3V/
         DvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uavi3yQmU7TEij7jJpcySVBC3+TVvlm3sHX3b1s1W6c=;
        b=laMvOuEwhZipeeyJk7eNVmvq4LYhbP8m+o+mSehQ6Y81iPVhvUjkaKip5M7Gd9XviF
         8w1sw0sCx9ZmDVNmjTgOVrEhpAyyEmzjEKqyXxJuYijnNidRY0Rdp+qYo3xCCI6k9p0D
         W+Ek3QuvBU4BklrcOxAxvUzpZZwP6esYOWDLvfCtNWYP9RO5/DqQ0qYdAQJEW7iSrx1d
         Zt9LlZ1pWtfwxnYDx6AsamMmjpi+UkK+Qp8+tV5t1l6Ne+OwfxBMz7NvUr9s0pvmcyG+
         SjTssrpHVnz+pmJCQnxmX4mesX+qJxDcnwgef8XvaEs+T71c/e/ko+2n0dSTuPTOjKo2
         IBkA==
X-Gm-Message-State: AOAM5337dPd32ffJuSxsv9K0NXF381/24T4fQDyefCAwNbbLwo0i13UP
	jJwDmlm2FWEqgg9CUSZpSCfE4QjJ
X-Google-Smtp-Source: ABdhPJzD5lxtdEJWSt10NkmYV/WVY44tL7ywINneeaWrGxaGsEq1GveFXMfWvzLVvxPMWf+79OcIjA==
X-Received: by 2002:a17:90a:cb95:b0:1be:f05c:d7a5 with SMTP id a21-20020a17090acb9500b001bef05cd7a5mr1491061pju.140.1646172021666;
        Tue, 01 Mar 2022 14:00:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 12/18] target/arm: Introduce tlbi_aa64_get_range
Date: Tue,  1 Mar 2022 11:59:52 -1000
Message-Id: <20220301215958.157011-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /d+jgcQAdPfB

Merge tlbi_aa64_range_get_length and tlbi_aa64_range_get_base,
returning a structure containing both results.  Pass in the
ARMMMUIdx, rather than the digested two_ranges boolean.

This is in preparation for FEAT_LPA2, where the interpretation
of 'value' depends on the effective value of DS for the regime.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 58 +++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 950f56599e..31c2a716f2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4511,70 +4511,60 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
