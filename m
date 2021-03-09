Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956137lfg;
        Tue, 9 Mar 2021 08:22:20 -0800 (PST)
X-Received: by 2002:a9d:6081:: with SMTP id m1mr19893328otj.38.1615306940046;
        Tue, 09 Mar 2021 08:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306940; cv=none;
        d=google.com; s=arc-20160816;
        b=a0K+novMBLwQvlH+7nbb2Eo/zHCQ5IevekihgHJpQWg/iHGbhg25fwRXAMXQeuQW8e
         oiZDpq8YCXGXyek66rOC1N9ev/Tx7wKdrm/x78C8qxuLCmaweMGVa35jECdXXcLxDjxb
         G9WlyKBz6/8eUBsnB9+BszXMPB920nfmLMyDpnhVSZ+N9cYKqX63ZR7phTxQyyHUqGwE
         Vq8/GD5jSV7/f76dqtHI1QbHbARRWA0ScV6PKXLNJeMH+n7GWjQRIcWPO/hi+fBOy5ZG
         KeRs2hTevskejdZsPcLhjXbgSnmxm54sdLQefxz42ahOvUZty20RD7r7MOBnlyPS3lZl
         c5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M6NWbJEGQ5xCtqVe/UozKEUpF+Si9GTRje/9jcqBvVA=;
        b=AF0AdlpNGc4pvz1KZiDr5t3xGA3n0/rjbJ9TTMvmk+3a77peKEpW2L0kCUScSybegI
         EyaGOjjMuCS1/KExv8MlBsaGeQxktKGVIoMKDb+KAI/+FNMUUUYTZQK1vmZYF9v2O1/T
         Q9E3LucleXDZECdaMANpLXLeTaQLNAl9+ydUTMrL+eP8cEjeagL7mSbqzVbsA8+1Zm9n
         a8BZK3OXtCO/6xydVRyCELD/kE+//DYLAPC6kI++54xQbHosF5ySf9ZMEuZUX3C5O41n
         SylClYidQSL3j99J3ZyCNpqOHJ3oHiyuOalsq1JoF+alus0xM+A2r/n6LEu4ozyHV0fY
         cM2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=de53WvI+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v4sor4227781oiv.110.2021.03.09.08.22.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=de53WvI+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M6NWbJEGQ5xCtqVe/UozKEUpF+Si9GTRje/9jcqBvVA=;
        b=de53WvI+icZQgxisgwr5fRpDajM6rZZRXxUhpLhWyH27fLvn+SM5F1PJLuvP8CLFVz
         Ajl/hwk21I1Vl5iOzewwCrM+/G8Kmg3uaB4RO1jRlF9q9AugtZ4CIgow4247dnjTTSNX
         XWlbwlBktKaBDZTYL1XLNV6blimeW9eAVdhfxsZbRy7PRlbcsTW7JGzwkbU8KHxA8W/c
         bcMJv+GWKyaiA7iEE8q5t408JxhGGrhYkGuA9ekmYvJTiB3qc9HKTB5HLszZimDJNV0W
         uErCdvrjVx82ZW3skwl4w8XXErbFy1Z2HQ77juhJnAFaBvH4hBSZWt2T1jcUmmnqwTpK
         st7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M6NWbJEGQ5xCtqVe/UozKEUpF+Si9GTRje/9jcqBvVA=;
        b=IsXWhiASky7lCbNgfmAE150I7uST4zWNvAMbPILzIXw0yTvImxN5rQaFfPNvMiKURW
         dLzmwIWeniz3TKMxbBVFY2KyCFEWC1i2jXYQlK16KMKPSaVWqeGD9NFyDB4wQ3s0BqnL
         4Lj1uSU9LKgzh0mhb/1X9al6wKq6EErM9pDyan5/5A/DztZMzro6N515jZLPbR/QMIte
         gkebhr+zEatWi1FFzYd2c+98IWv4y0lWCtSEE7YyhlCNvB0irt/OK4eVjsXKzSZog2ep
         gPWtEq34sAwb10C6193wOJ6lnBuiwQl/gTvzR7AgJVQyx1P4N/aeZPoHhtx0wP/3xBM7
         wbxA==
X-Gm-Message-State: AOAM5316IRgt3v62mvoDqdWrVp86WcDWtkpdaHbC680ZtNF+zt8GkACn
	93jZdBfbFWG8RW1oXJ9aAiRdXSxE
X-Google-Smtp-Source: ABdhPJx08xyVBnyUt2gVJM2J8T9+wRQDMnfYrsGdzI4tTd7sSs8k/Uo7kLBsO9S43sXqS/ogfz2/Ew==
X-Received: by 2002:aca:d6d3:: with SMTP id n202mr3553013oig.175.1615306939693;
        Tue, 09 Mar 2021 08:22:19 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 58/78] target/arm: Implement SVE2 signed saturating doubling multiply high
Date: Tue,  9 Mar 2021 08:20:21 -0800
Message-Id: <20210309162041.23124-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: i8+V+sNQGfN+

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 10 +++++
 target/arm/sve.decode      |  4 ++
 target/arm/translate-sve.c | 18 ++++++++
 target/arm/vec_helper.c    | 84 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 116 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 72c5bf6aca..eb94b6b1e6 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -957,6 +957,16 @@ DEF_HELPER_FLAGS_5(neon_sqrdmulh_h, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(neon_sqrdmulh_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a0c930ed66..8c063e77ae 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1214,6 +1214,10 @@ SMULH_zzz       00000100 .. 1 ..... 0110 10 ..... .....  @rd_rn_rm
 UMULH_zzz       00000100 .. 1 ..... 0110 11 ..... .....  @rd_rn_rm
 PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
 
+# SVE2 signed saturating doubling multiply high (unpredicated)
+SQDMULH_zzz     00000100 .. 1 ..... 0111 00 ..... .....  @rd_rn_rm
+SQRDMULH_zzz    00000100 .. 1 ..... 0111 01 ..... .....  @rd_rn_rm
+
 ### SVE2 Integer - Predicated
 
 SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9b27f32b54..27a10a9759 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6430,6 +6430,24 @@ static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
     return do_sve2_zzz_ool(s, a, gen_helper_gvec_pmul_b);
 }
 
+static bool trans_SQDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
+        gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQRDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqrdmulh_b, gen_helper_sve2_sqrdmulh_h,
+        gen_helper_sve2_sqrdmulh_s, gen_helper_sve2_sqrdmulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
 /*
  * SVE2 Integer - Predicated
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index b19877e0d3..25061c15e1 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -81,6 +81,26 @@ void HELPER(sve2_sqrdmlsh_b)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], 0, false, false);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], 0, false, true);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 16-bit */
 int16_t do_sqrdmlah_h(int16_t src1, int16_t src2, int16_t src3,
                       bool neg, bool round, uint32_t *sat)
@@ -198,6 +218,28 @@ void HELPER(sve2_sqrdmlsh_h)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], 0, false, false, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], 0, false, true, &discard);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
 int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
                       bool neg, bool round, uint32_t *sat)
@@ -309,6 +351,28 @@ void HELPER(sve2_sqrdmlsh_s)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], 0, false, false, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], 0, false, true, &discard);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 64-bit */
 static int64_t do_sat128_d(Int128 r)
 {
@@ -368,6 +432,26 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], 0, false, false);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], 0, false, true);
+    }
+}
+
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
-- 
2.25.1
