X-Received: by 2002:a17:90a:5b06:b0:1b8:b705:470b with SMTP id o6-20020a17090a5b0600b001b8b705470bmr1518039pji.168.1645655520502;
        Wed, 23 Feb 2022 14:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655520; cv=none;
        d=google.com; s=arc-20160816;
        b=gBe/B4WeQbmAipZYKLDJLHSYtwHQJnDBbgy8E0xJbq/d7xRU/g4jay/Bb/QaOeeK0w
         /pjqsXb+mlpOBV8u74gsoWeS+mrqmGvVtW15aK5rV6WtGmBFAMNHvdpT8As0N3wllU1g
         F7oEjclDAoa5YxGfCxaceYFgeoEr6ccHoFyZWJccpMr1o2UutS3ryRPY1HFATCuliEFy
         j1GRwWA3O9X4lpcv8jJJBaLzDrplFb2KJoJJP+b7LBW5jzmRewUU4Tw7RGgAaAVtpe8g
         5nKi7JBnjQ+mFQmOF//vW74DtLZslRD1uQW2GYZCCaO+P/jfVzKQg46A2JFlqnkxwhUw
         iG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Uavi3yQmU7TEij7jJpcySVBC3+TVvlm3sHX3b1s1W6c=;
        b=J4pfr+Fv/PcoK11Vf8uuPufEGK976bYIWXv8sKbtmMRYgOegLBNlg0Qdv0lT8W+DAq
         RscbOVR/wjC7XeEM1tHYD+wRp3CoUNHGorN0vuoZUYnI/PGNxdU1TkG9h2hW1gMCtyJS
         xz2F9p6jozBdwkBKFlpTpEmO8sMngOM6GjSEiRx5lys9qHBcd/YSDePvbkSvu/qJ+KyC
         QsbY3NWK4TJ9XZsYtSo2c4QsQed2jlPWUFUddLsqVHVT6Mm5DzrzyiTH3iz1fgOD/mfY
         yOJxFWlFzKWk0NM7HP0WKf/tA6tcMoYd4QcX/3NkfWUcFc1fVxsHarkSzl/t9R4amCuz
         m7yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4feHmkw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mr6-20020a17090b238600b001b899f81802sor1944692pjb.43.2022.02.23.14.32.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:32:00 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4feHmkw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uavi3yQmU7TEij7jJpcySVBC3+TVvlm3sHX3b1s1W6c=;
        b=E4feHmkw/CmFwD/8fElw2/hS3oCNmfdUHVZDn3IWXTB7dIjgwUZi0XJAmOQNRegIrz
         28lSFtVcpbFJhChctH0KvNC6hhURRAY5Y+axEGoOwMJNodSBAsf25ZxjXk81nUgVgeGy
         vB8IvZTfWPkecl0hniL82TztDa6Uhpn1wtVqm8sRb5PVVGnJfDP70d0ewDYpgY0Oalaz
         EDD2JnlE3+OOfSXF5Wsoea459gs7XrxGteBsSFR+WrrcOx5Pcovx23uz3tAFri6Z8I05
         k5kUIvFx7L9vInfJi69uv8Wg1ZdFiqH/jy6zrk3Ht9qmwQkxv2V8nIQ760oIyzeUyDDv
         Vr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uavi3yQmU7TEij7jJpcySVBC3+TVvlm3sHX3b1s1W6c=;
        b=Ds6IRBe56+DMrE0G9DNOyuBx3RK5GyQBkA+AysCu8Q5SeAIgqAv7WNiXonIrQ/x8x7
         n1Kz9W7DpDPs+Sxgg/Scee886ZTW/LydN5n0R/io8KUlRYLZedAW8loF0NCgNM3iq3d1
         wJ2puMTcYjF9KIHHasCyI0RYixLK05V/4MH4MLfkV9KHbIcp3EENFUdjM40MGkQh4ahn
         SjW7xPnSyNwT+M7E4usw43al9fkyXv4sKx4bfRMR4oK1hozEdiRPFZtv/Ktgg2odJVMx
         6gb75O+SK0idxVAkEwM1bGIcZSBpbRsIKR7101Z8FR8ieMPpL1FEPCJR6h6FH32X6BWQ
         6prA==
X-Gm-Message-State: AOAM533filznF48sWRzjyMB1Mo9uvpoWStv3Bydb+eEVBb4gyX7+iDA/
	K9TCaNT0CSVuKX0WDCseDbZKidWF
X-Google-Smtp-Source: ABdhPJxb4tQh/Aqc00UJdkf3ZPWL5HdNfaPw1YifBNDGI05bexFevqqPyY+XrbGa6GviaQhGQvIuog==
X-Received: by 2002:a17:90b:d91:b0:1bc:ade1:54e3 with SMTP id bg17-20020a17090b0d9100b001bcade154e3mr3020272pjb.8.1645655520073;
        Wed, 23 Feb 2022 14:32:00 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 12/17] target/arm: Introduce tlbi_aa64_get_range
Date: Wed, 23 Feb 2022 12:31:32 -1000
Message-Id: <20220223223137.114264-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: sVD3mHUxgSMt

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
