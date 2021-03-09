Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2930646lfg;
        Tue, 9 Mar 2021 07:53:14 -0800 (PST)
X-Received: by 2002:a4a:a223:: with SMTP id m35mr6811948ool.39.1615305194842;
        Tue, 09 Mar 2021 07:53:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615305194; cv=none;
        d=google.com; s=arc-20160816;
        b=pjcwxr/yJ7GCP1jgNJK5GVsJ6Q6Eybf4Pn1WaQsWQLq4Fh5YuHxvqJ0KxZBgYHaPJy
         LccnqdMMmfNnT/TNx3dtVM+nSllu9AEadMS8jFvcbnl8cTZ8NnHrGjU7F16ygTfpn9//
         cgF/jEWrJCotpXWeccPMXnWIjVyh43uwltSVLDuRWTaR4zxGmW7V/uumpVAFTOPqUW7O
         7c282UnbIYq4o75P971eG6dWnqWIR7HkA2LIKG5rCg7Cjs066gMfHC0++fyX+cinLaaL
         lW/p3Z4CjBkd6ItetRyUQjfCXEOuKpum2U5SxNgPOMR/HB3DFH5M/tZ8qoaGs0fRptaY
         sR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IUswOVHmPjwO24MveU3hkPJismX650bXSG+gRkRnCa0=;
        b=AyLXP+ZDX8ZgFO2OlYasCJ6WbVNtFCSNF9bjm6jILEkoHkmJBG/GdWl3DOUaWQ6PTj
         SS+pXRBDCBvd3GwmsKo783r0QqO5Ke5sJvfkXj7B2zAGBUUuNgTl/s8FRXtfL6pkEtbn
         5jXxc+f4lPeeE2hVeE7dEljdiCiNTFQOXHbHQ9mUQFGZXHrOqU8M0XtSwCxN2P/LVJOT
         ZriW58UJoalaY88t7fkaGy/li7diqhQCUEJnMIxq3scNcyV5cw/OKfxhVbpgefrTRvWG
         x+6W6e02KWhpxa2SGXSv5tOZVqt1OVAzMk0c2US1wqpkS0ci6gTkw+BmewJrkpuhW5KL
         dXZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OyUjvzFU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j25sor1245761otk.55.2021.03.09.07.53.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 07:53:13 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OyUjvzFU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IUswOVHmPjwO24MveU3hkPJismX650bXSG+gRkRnCa0=;
        b=OyUjvzFU9zJ6OB/wTdFdcfACo8xGqg7O8WqTG1x4O/06XPlKKRShU0jqpmfk7TAz+S
         LwNqUgAm8mO+9xz6eAQyOCvxwjZX6xlX4jFBqR3WK78RV+S5Mez5xahEsQ+ch2BVb5Tj
         JxEBqqHxH+vA+50vzFFuPEgBb+A4Qu8cbKW+GB7iOeSJxhRv3S6Ib6qiN7rSZEmLsmrB
         PAUD80yJNM9g4+LEGpCADx9f37q8A/w0Yzb4GP5JVT6tjhBT05jr2YmbZ+5Bj9qBV/dp
         WHTkcjRlmMuYp+GQZsyBgfyB47zcGzXY/rk40+t634SCBepKolSJOFWnRIg8/tOI3/Qn
         co0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IUswOVHmPjwO24MveU3hkPJismX650bXSG+gRkRnCa0=;
        b=jpYefGjjpcmKPXPb2oPxBkVg6cr/rG2gM3DBKc31Pq4zhR4FQ7l1x5qBha39gMGFED
         86V85lX8YLq3ynEX/6SAtq8s4s75JXZccCjeT3DWvljOoN4qdhm7HKjTN/0kuWfOUTP6
         FwtmDTQxddiDvIUsn7W6xXZGLe5PkxuxMD9eDg62gFfZ1Ixwd4wnhwuR1uWiN8JKtTrL
         v4NKXsJQi2ktTnpE/mGy8Eh3zPrpG0pz91Zz27aOwxkJx20EmDdSDozMhHjY8Oi427Lu
         ShIKRuvR0MRnwzsxbaHTbXciggU4G9/SWQf6mE4MTcc88KIlm8P0lUgzSpC2Z63ybLfj
         Bu+g==
X-Gm-Message-State: AOAM530VYIeS6nx/Ginoqyuiz92WJnVxoFmJWJto9XLa9PL85PEXquU5
	EULud5Ym5njMvgfTmsUn/xoc0Je9nTEX9OwN3qM=
X-Google-Smtp-Source: ABdhPJzfpNLT72v1CjaUU870e9bAN7x8QTC/HjaUr+sBNn6kG7ma8/ikOd+70FWhWk8hFLWt9mHv4w==
X-Received: by 2002:a05:6830:4109:: with SMTP id w9mr24786851ott.176.1615305193475;
        Tue, 09 Mar 2021 07:53:13 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 07:53:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 5/8] target/arm: Update BRKA, BRKB, BRKN for PREDDESC
Date: Tue,  9 Mar 2021 07:53:02 -0800
Message-Id: <20210309155305.11301-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cIneKracW4q3

Since b64ee454a4a0, all predicate operations should be
using these field macros for predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 30 ++++++++++++++----------------
 target/arm/translate-sve.c |  4 ++--
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 224c767944..8e0a5d30a5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2710,7 +2710,7 @@ static uint32_t do_zero(ARMPredicateReg *d, intptr_t oprsz)
 void HELPER(sve_brkpa)(void *vd, void *vn, void *vm, void *vg,
                        uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
         compute_brk_z(vd, vm, vg, oprsz, true);
     } else {
@@ -2721,7 +2721,7 @@ void HELPER(sve_brkpa)(void *vd, void *vn, void *vm, void *vg,
 uint32_t HELPER(sve_brkpas)(void *vd, void *vn, void *vm, void *vg,
                             uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
         return compute_brks_z(vd, vm, vg, oprsz, true);
     } else {
@@ -2732,7 +2732,7 @@ uint32_t HELPER(sve_brkpas)(void *vd, void *vn, void *vm, void *vg,
 void HELPER(sve_brkpb)(void *vd, void *vn, void *vm, void *vg,
                        uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
         compute_brk_z(vd, vm, vg, oprsz, false);
     } else {
@@ -2743,7 +2743,7 @@ void HELPER(sve_brkpb)(void *vd, void *vn, void *vm, void *vg,
 uint32_t HELPER(sve_brkpbs)(void *vd, void *vn, void *vm, void *vg,
                             uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
         return compute_brks_z(vd, vm, vg, oprsz, false);
     } else {
@@ -2753,56 +2753,55 @@ uint32_t HELPER(sve_brkpbs)(void *vd, void *vn, void *vm, void *vg,
 
 void HELPER(sve_brka_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     compute_brk_z(vd, vn, vg, oprsz, true);
 }
 
 uint32_t HELPER(sve_brkas_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     return compute_brks_z(vd, vn, vg, oprsz, true);
 }
 
 void HELPER(sve_brkb_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     compute_brk_z(vd, vn, vg, oprsz, false);
 }
 
 uint32_t HELPER(sve_brkbs_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     return compute_brks_z(vd, vn, vg, oprsz, false);
 }
 
 void HELPER(sve_brka_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     compute_brk_m(vd, vn, vg, oprsz, true);
 }
 
 uint32_t HELPER(sve_brkas_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     return compute_brks_m(vd, vn, vg, oprsz, true);
 }
 
 void HELPER(sve_brkb_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     compute_brk_m(vd, vn, vg, oprsz, false);
 }
 
 uint32_t HELPER(sve_brkbs_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     return compute_brks_m(vd, vn, vg, oprsz, false);
 }
 
 void HELPER(sve_brkn)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (!last_active_pred(vn, vg, oprsz)) {
         do_zero(vd, oprsz);
     }
@@ -2827,8 +2826,7 @@ static uint32_t predtest_ones(ARMPredicateReg *d, intptr_t oprsz,
 
 uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
         return predtest_ones(vd, oprsz, -1);
     } else {
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index cac8082156..c0212e6b08 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2850,7 +2850,7 @@ static bool do_brk3(DisasContext *s, arg_rprr_s *a,
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr m = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(vsz - 2);
+    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
@@ -2884,7 +2884,7 @@ static bool do_brk2(DisasContext *s, arg_rpr_s *a,
     TCGv_ptr d = tcg_temp_new_ptr();
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(vsz - 2);
+    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
-- 
2.25.1
