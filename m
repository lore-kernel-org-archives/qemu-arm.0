Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956091lfg;
        Tue, 9 Mar 2021 08:22:18 -0800 (PST)
X-Received: by 2002:aca:f389:: with SMTP id r131mr3422773oih.22.1615306938037;
        Tue, 09 Mar 2021 08:22:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306938; cv=none;
        d=google.com; s=arc-20160816;
        b=kt+nzOoyxa6TcXGguDLZQke8lNHqLazZ8KJj6SMMHHiXXOYX60ZybBX/8C8b6vJiSa
         GyJBf72tPb3WyMx7yfG664B+xz4HBvGKDXQ+Ix6qr+JsZL5c1T6GGWadYSmwmuLjq3Vt
         7MqsOeT7Qw2XoR0bhHAHvY2ZFhpiu+TEXct/T4TOKQqqtTm53Y/MXCOj+DRk3TdnrqfY
         1xblHjzAStBrJ9tV54ksEE4vKCk6yv6DXJ2Cq2iO4VbzJ1PJK3HT7VqRJHEdjaog9AVU
         wYL9bwGa2tThNsC9VDJJN1Cbgm9epT0oCfv/L+iUEJXHZAOaRi+fXCnbwN6m7WvUWKb+
         /Vqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gAITA8fVumfgJ7BWNimYNqBynCeOl0cQ9txvmPBZezA=;
        b=x1rq+IBqnK97sX1FgRp6I3MHamia+dwuXOajOclfMbX9d9IrRySPY6oOpYpABv1Ipb
         ywUiV9KhQwAOAMnRx4Q2JUAuk2ppCcFsHFQEmXaugJl25/egNKuNJ2D0B6cMf88je5/I
         ugxNgH/gS48R/qCjVQAUrDuL7VxkkBE5OSXZJxl1aSHLwuAeR2139ev4oCiLxvMkdNMh
         CT5VSsm3W9oqfvoW9rUI74PlD8eG97xaEWKpgy1UnSupAjJvWDflCMqTAjy1lU7V/Xyj
         Bi0UeK/auhVIo3ZJ2rvUtn6gj1LztwHhEfxoomjwa9QmdBUJIfaFagEOD3efm31wSIqt
         aEvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y9D4dGUj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c14sor4042523oiw.67.2021.03.09.08.22.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:18 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y9D4dGUj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gAITA8fVumfgJ7BWNimYNqBynCeOl0cQ9txvmPBZezA=;
        b=Y9D4dGUjAu1wb98gLhfsbm1/jkqbWR2PIVsHfHeOs2hREjuZqpjqrATb+PS8aDu7oI
         53uOgm9jETIlm578QCwp8oW8l1LjhR5J8axvykjMpWjfKawFR+wS8mpr9tRiiTBBf83Z
         FYAENDYDd3jAYVxc9v6vS9C+5FxzZe//qkB/nLriMkMyeoWT0P8FUfkkAa4MS7MwKDc8
         9l7XnXslOPr31+WRGVauqGSs8gFQ/eWuHk6q5wrhJGac/dCSnvsY6+si1Xwi4Bxw97qU
         22W5bsk0D8yXFesxHruum9qqA9SoEWhdvLO+BfD6gfjOAj1oKbTr8r5o6Q+ZQwp2r1q1
         WSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gAITA8fVumfgJ7BWNimYNqBynCeOl0cQ9txvmPBZezA=;
        b=C87AzS49NnxciQFd7SSytDZV5yBo2Op+RMP6uhojzMR1n4PkYfk+6/u2YS4Y9cjLcn
         4HIfoA+DT/G/ZvIu6hFos6Ue8M5xd1IiJkqFvaZT5OiR4eYs+jZOMKVldB5UAc0z8986
         cJo5mT/KAunydWnY1CiS/z3zmukHAKiW387sUTSsbqLHuAFCY9m2uJAeePPKxaE98FNL
         gCCF7VLq48fOLa/faEnahavpwMZ86gefjfYVc6zuiOr5KfQ2FA0dNQUcRepy2i7JdGTN
         APzj0WdudYLgA5sjLUhfcNUjCrN0kg0/T8wu8N8THaj0T8aK9dFRo28CvBwdK2ycSDbh
         bpNA==
X-Gm-Message-State: AOAM533uPqXaPQSUAsYq4jeODs6X9ei3PPnGXh9sOakIPMdjX8LRIPqh
	34MxlmOKyALKPpqkSDlAzcrefBVG
X-Google-Smtp-Source: ABdhPJwj2uKemrPl1uorT8yUOhER+Yhn0v6BB82E1Y3Rw33JmF2Twt8kJYN5CnRoYm8gcl3Melwh4w==
X-Received: by 2002:aca:c2d7:: with SMTP id s206mr3317786oif.95.1615306937661;
        Tue, 09 Mar 2021 08:22:17 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 56/78] target/arm: Implement SVE2 integer multiply long (indexed)
Date: Tue,  9 Mar 2021 08:20:19 -0800
Message-Id: <20210309162041.23124-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FzWQw1gRE92J

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      | 16 ++++++++++++++++
 target/arm/sve_helper.c    | 23 +++++++++++++++++++++++
 target/arm/translate-sve.c | 24 ++++++++++++++++++++----
 4 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 08398800bd..a3690082af 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2688,3 +2688,8 @@ DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_smull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6900e79492..ebb892748b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -257,6 +257,12 @@
 @rrx_d          ........ 11 . index:1 rm:4 ...... rn:5 rd:5 \
                 &rrx_esz esz=3
 
+# Two registers and a scalar by index, wide
+@rrxl_s         ........ 10 ... rm:3 ...... rn:5 rd:5 \
+                &rrx_esz index=%index3_19_11 esz=2
+@rrxl_d         ........ 11 ..  rm:4 ...... rn:5 rd:5 \
+                &rrx_esz index=%index2_20_11 esz=3
+
 # Three registers and a scalar by index
 @rrxr_h         ........ 0. . ..      rm:3 ...... rn:5 rd:5 \
                 &rrxr_esz ra=%reg_movprfx index=%index3_22_19 esz=1
@@ -819,6 +825,16 @@ SQDMLSLB_zzxw_d 01000100 .. 1 ..... 0011.0 ..... .....          @rrxw_d
 SQDMLSLT_zzxw_s 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_s
 SQDMLSLT_zzxw_d 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_d
 
+# SVE2 integer multiply long (indexed)
+SMULLB_zzx_s    01000100 .. 1 ..... 1100.0 ..... .....          @rrxl_s
+SMULLB_zzx_d    01000100 .. 1 ..... 1100.0 ..... .....          @rrxl_d
+SMULLT_zzx_s    01000100 .. 1 ..... 1100.1 ..... .....          @rrxl_s
+SMULLT_zzx_d    01000100 .. 1 ..... 1100.1 ..... .....          @rrxl_d
+UMULLB_zzx_s    01000100 .. 1 ..... 1101.0 ..... .....          @rrxl_s
+UMULLB_zzx_d    01000100 .. 1 ..... 1101.0 ..... .....          @rrxl_d
+UMULLT_zzx_s    01000100 .. 1 ..... 1101.1 ..... .....          @rrxl_s
+UMULLT_zzx_d    01000100 .. 1 ..... 1101.1 ..... .....          @rrxl_d
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
 MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6ad1158455..b64e1f243d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1560,6 +1560,29 @@ DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
 
 #undef DO_ZZXW
 
+#define DO_ZZX(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)            \
+{                                                                         \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
+    for (i = 0; i < oprsz; i += 16) {                                     \
+        TYPEW mm = *(TYPEN *)(vm + i + idx);                              \
+        for (j = 0; j < 16; j += sizeof(TYPEW)) {                         \
+            TYPEW nn = *(TYPEN *)(vn + HN(i + j + sel));                  \
+            *(TYPEW *)(vd + HW(i + j)) = OP(nn, mm);                      \
+        }                                                                 \
+    }                                                                     \
+}
+
+DO_ZZX(sve2_smull_idx_s, int32_t, int16_t, H1_4, H1_2, DO_MUL)
+DO_ZZX(sve2_smull_idx_d, int64_t, int32_t,     , H1_4, DO_MUL)
+
+DO_ZZX(sve2_umull_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
+DO_ZZX(sve2_umull_idx_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
+
+#undef DO_ZZX
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a3261561c0..6376a21b98 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3840,8 +3840,8 @@ DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
 
 #undef DO_RRXR
 
-static bool do_sve2_zzx_ool(DisasContext *s, arg_rrx_esz *a,
-                            gen_helper_gvec_3 *fn)
+static bool do_sve2_zzx_data(DisasContext *s, arg_rrx_esz *a,
+                             gen_helper_gvec_3 *fn, int data)
 {
     if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
         return false;
@@ -3851,14 +3851,14 @@ static bool do_sve2_zzx_ool(DisasContext *s, arg_rrx_esz *a,
         tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, a->index, fn);
+                           vsz, vsz, data, fn);
     }
     return true;
 }
 
 #define DO_SVE2_RRX(NAME, FUNC) \
     static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
-    { return do_sve2_zzx_ool(s, a, FUNC); }
+    { return do_sve2_zzx_data(s, a, FUNC, a->index); }
 
 DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
 DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
@@ -3866,6 +3866,22 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+#define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
+    static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
+    { return do_sve2_zzx_data(s, a, FUNC, (a->index << 1) | TOP); }
+
+DO_SVE2_RRX_TB(trans_SMULLB_zzx_s, gen_helper_sve2_smull_idx_s, false)
+DO_SVE2_RRX_TB(trans_SMULLB_zzx_d, gen_helper_sve2_smull_idx_d, false)
+DO_SVE2_RRX_TB(trans_SMULLT_zzx_s, gen_helper_sve2_smull_idx_s, true)
+DO_SVE2_RRX_TB(trans_SMULLT_zzx_d, gen_helper_sve2_smull_idx_d, true)
+
+DO_SVE2_RRX_TB(trans_UMULLB_zzx_s, gen_helper_sve2_umull_idx_s, false)
+DO_SVE2_RRX_TB(trans_UMULLB_zzx_d, gen_helper_sve2_umull_idx_d, false)
+DO_SVE2_RRX_TB(trans_UMULLT_zzx_s, gen_helper_sve2_umull_idx_s, true)
+DO_SVE2_RRX_TB(trans_UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
+
+#undef DO_SVE2_RRX_TB
+
 static bool do_sve2_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
                               gen_helper_gvec_4 *fn, int data)
 {
-- 
2.25.1
