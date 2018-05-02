Received: by 10.28.4.212 with SMTP id 203csp1219383wme;
        Wed, 2 May 2018 15:16:09 -0700 (PDT)
X-Received: by 2002:a17:902:31a4:: with SMTP id x33-v6mr21787394plb.355.1525299369634;
        Wed, 02 May 2018 15:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299369; cv=none;
        d=google.com; s=arc-20160816;
        b=FppkZPZAIqNd/KESdo+wf8oA7u9rI4owNnMWTcajNhNXXjzOfbxzWcHN+WR46fhxnq
         9ro2ii4NTwk62jXYdVX3sBGd4u1fcv0neGO2jPs2f67PTYx9Hf0P7hW+nKGqxNVHe54Y
         Ja9lz0maz3HwXq3amXNWEGggF3suboTz5hRM0B7IQC5CyZLEvmad77X596/03Y1gn4mJ
         ich/etjQxi4vE8x9vbHipmjhVMNp9Y4/bAzlc+5MYY+tkbRsSA+VXZS1QFWWH1T8G4lU
         zEbs1dknNAnu/buhp9tLqJzBYeTHRA/Hq4of6juUvyi1iJHgmIWgbOYLtb4Bd27g452+
         TPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :arc-authentication-results;
        bh=DqVFNk569BoPF3fOx2mc2LarcCeWFIvVhbVzAZxftS4=;
        b=zdYYn4SO95z04SSioqkcvStZegdJtxae2nQQyP8mBKYJ9y9pzCgSD+NFuMQV6o/KJJ
         P8qIbVm5DHn3SO/Oumq7JHkmBsquXCacPpw5W01ZZ8ap6rzQnrBxLAQklOE/kz2sE/Ki
         peH6/wbiEkDZXuyd6FBCTr5IAFHcEzNxdpEJ93G8/p+4qzPHY0jHPfXeTlxgqXyrbLY8
         kB4GmQliiSUUUHTpbCRzw8mu06ZjNjm511pHXGCF9ZZh5g5DfE/r6ObcYasn+CmOh+V8
         pD3cDD9/ScIemBbwjTRCu7G69Y/xYl2NJmPx7WIWvcyHYJWFrXeLkjek2oTVwVYZMvr/
         XlAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkKb4Arx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j65-v6sor2679500pge.232.2018.05.02.15.16.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 May 2018 15:16:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkKb4Arx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DqVFNk569BoPF3fOx2mc2LarcCeWFIvVhbVzAZxftS4=;
        b=NkKb4ArxC7sBnHkcVVY56ry3fdjcBHyXHdGcA9hWABmu9PZ3gI8A4ZwTKhAOYo9pXm
         XWPbm3qzPXpkqEriqtFqIN+6cjn8HQFfO05mDJFX+z7D1TvoZ/LdKZ+FoAAi7hhIo97B
         UeqQm7TPeceZquQ1oem1wMW4LkD2ePS/m4aqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DqVFNk569BoPF3fOx2mc2LarcCeWFIvVhbVzAZxftS4=;
        b=W1zEdAYLG4p+y4j8ipVlyizDpAwSqa4OgIhlK9DSScxzIE9Zso4n/qIvDxTpIvaHGI
         bmngNKgQZmjwPhpbsfnz2q81nt6giZ8vShLdZWY/wyCngwTlSpgxOOUPHBd9WjPeKRdi
         rZmPvFgk7QVElqz86a4l3Em6li7dyljGPkGid9aPrDs4VQlPRswPU2zsYmwQSZktt6jg
         lOnRD6nnn/MNkTM1MCUVPZ1kUnrL1qPS6RVSuvOsH7CAObahpECoi/9vadNq+XE/pEuU
         u5fR4YzR8iZz5B5ayWy41VBcwWrVV6wVDDV9wrq14g3HQMHTc+8BbWjaJ5sjmS6xEbz2
         aLWw==
X-Gm-Message-State: ALQs6tC9r4SeOyciZ//6Jx9qJ4tpie+0QUqaumqgIQ3z8qZuW5uwdo+A
	fqffL8Qn9aNrgdv66zTCI+Eciq/P
X-Google-Smtp-Source: AB8JxZox9DF3Cd+0JG84fj2+sN7pECnOn0t72JH3MWpHM2A7GPKR+38flPsp6A11tI3Dv2hXI066Qw==
X-Received: by 2002:a63:545:: with SMTP id 66-v6mr17368110pgf.446.1525299369123;
        Wed, 02 May 2018 15:16:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id 65sm26170145pft.74.2018.05.02.15.16.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 May 2018 15:16:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH v2 11/14] target/arm: Implement FCMP for fp16
Date: Wed,  2 May 2018 15:15:49 -0700
Message-Id: <20180502221552.3873-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PF6QD3NFiWlQ

From: Alex Bennée <alex.bennee@linaro.org>

These where missed out from the rest of the half-precision work.

Cc: qemu-stable@nongnu.org
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[rth: Diagnose lack of FP16 before fp_access_check]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  2 ++
 target/arm/helper-a64.c    | 10 ++++++
 target/arm/translate-a64.c | 88 +++++++++++++++++++++++++++++++++++++---------
 3 files changed, 83 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index ef4ddfe9d8..5c0b9bd799 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -19,6 +19,8 @@
 DEF_HELPER_FLAGS_2(udiv64, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(sdiv64, TCG_CALL_NO_RWG_SE, s64, s64, s64)
 DEF_HELPER_FLAGS_1(rbit64, TCG_CALL_NO_RWG_SE, i64, i64)
+DEF_HELPER_3(vfp_cmph_a64, i64, f16, f16, ptr)
+DEF_HELPER_3(vfp_cmpeh_a64, i64, f16, f16, ptr)
 DEF_HELPER_3(vfp_cmps_a64, i64, f32, f32, ptr)
 DEF_HELPER_3(vfp_cmpes_a64, i64, f32, f32, ptr)
 DEF_HELPER_3(vfp_cmpd_a64, i64, f64, f64, ptr)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index afb25ad20c..35df07adb9 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -85,6 +85,16 @@ static inline uint32_t float_rel_to_flags(int res)
     return flags;
 }
 
+uint64_t HELPER(vfp_cmph_a64)(float16 x, float16 y, void *fp_status)
+{
+    return float_rel_to_flags(float16_compare_quiet(x, y, fp_status));
+}
+
+uint64_t HELPER(vfp_cmpeh_a64)(float16 x, float16 y, void *fp_status)
+{
+    return float_rel_to_flags(float16_compare(x, y, fp_status));
+}
+
 uint64_t HELPER(vfp_cmps_a64)(float32 x, float32 y, void *fp_status)
 {
     return float_rel_to_flags(float32_compare_quiet(x, y, fp_status));
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9322b0d896..f0aca20771 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4475,14 +4475,14 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
     }
 }
 
-static void handle_fp_compare(DisasContext *s, bool is_double,
+static void handle_fp_compare(DisasContext *s, int size,
                               unsigned int rn, unsigned int rm,
                               bool cmp_with_zero, bool signal_all_nans)
 {
     TCGv_i64 tcg_flags = tcg_temp_new_i64();
-    TCGv_ptr fpst = get_fpstatus_ptr(false);
+    TCGv_ptr fpst = get_fpstatus_ptr(size == MO_16);
 
-    if (is_double) {
+    if (size == MO_64) {
         TCGv_i64 tcg_vn, tcg_vm;
 
         tcg_vn = read_fp_dreg(s, rn);
@@ -4499,19 +4499,35 @@ static void handle_fp_compare(DisasContext *s, bool is_double,
         tcg_temp_free_i64(tcg_vn);
         tcg_temp_free_i64(tcg_vm);
     } else {
-        TCGv_i32 tcg_vn, tcg_vm;
+        TCGv_i32 tcg_vn = tcg_temp_new_i32();
+        TCGv_i32 tcg_vm = tcg_temp_new_i32();
 
-        tcg_vn = read_fp_sreg(s, rn);
+        read_vec_element_i32(s, tcg_vn, rn, 0, size);
         if (cmp_with_zero) {
-            tcg_vm = tcg_const_i32(0);
+            tcg_gen_movi_i32(tcg_vm, 0);
         } else {
-            tcg_vm = read_fp_sreg(s, rm);
+            read_vec_element_i32(s, tcg_vm, rm, 0, size);
         }
-        if (signal_all_nans) {
-            gen_helper_vfp_cmpes_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
-        } else {
-            gen_helper_vfp_cmps_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+
+        switch (size) {
+        case MO_32:
+            if (signal_all_nans) {
+                gen_helper_vfp_cmpes_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+            } else {
+                gen_helper_vfp_cmps_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+            }
+            break;
+        case MO_16:
+            if (signal_all_nans) {
+                gen_helper_vfp_cmpeh_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+            } else {
+                gen_helper_vfp_cmph_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+            }
+            break;
+        default:
+            g_assert_not_reached();
         }
+
         tcg_temp_free_i32(tcg_vn);
         tcg_temp_free_i32(tcg_vm);
     }
@@ -4532,16 +4548,35 @@ static void handle_fp_compare(DisasContext *s, bool is_double,
 static void disas_fp_compare(DisasContext *s, uint32_t insn)
 {
     unsigned int mos, type, rm, op, rn, opc, op2r;
+    int size;
 
     mos = extract32(insn, 29, 3);
-    type = extract32(insn, 22, 2); /* 0 = single, 1 = double */
+    type = extract32(insn, 22, 2);
     rm = extract32(insn, 16, 5);
     op = extract32(insn, 14, 2);
     rn = extract32(insn, 5, 5);
     opc = extract32(insn, 3, 2);
     op2r = extract32(insn, 0, 3);
 
-    if (mos || op || op2r || type > 1) {
+    if (mos || op || op2r) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    switch (type) {
+    case 0:
+        size = MO_32;
+        break;
+    case 1:
+        size = MO_64;
+        break;
+    case 3:
+        size = MO_16;
+        if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+            break;
+        }
+        /* fallthru */
+    default:
         unallocated_encoding(s);
         return;
     }
@@ -4550,7 +4585,7 @@ static void disas_fp_compare(DisasContext *s, uint32_t insn)
         return;
     }
 
-    handle_fp_compare(s, type, rn, rm, opc & 1, opc & 2);
+    handle_fp_compare(s, size, rn, rm, opc & 1, opc & 2);
 }
 
 /* Floating point conditional compare
@@ -4564,16 +4599,35 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
     unsigned int mos, type, rm, cond, rn, op, nzcv;
     TCGv_i64 tcg_flags;
     TCGLabel *label_continue = NULL;
+    int size;
 
     mos = extract32(insn, 29, 3);
-    type = extract32(insn, 22, 2); /* 0 = single, 1 = double */
+    type = extract32(insn, 22, 2);
     rm = extract32(insn, 16, 5);
     cond = extract32(insn, 12, 4);
     rn = extract32(insn, 5, 5);
     op = extract32(insn, 4, 1);
     nzcv = extract32(insn, 0, 4);
 
-    if (mos || type > 1) {
+    if (mos) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    switch (type) {
+    case 0:
+        size = MO_32;
+        break;
+    case 1:
+        size = MO_64;
+        break;
+    case 3:
+        size = MO_16;
+        if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+            break;
+        }
+        /* fallthru */
+    default:
         unallocated_encoding(s);
         return;
     }
@@ -4594,7 +4648,7 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
         gen_set_label(label_match);
     }
 
-    handle_fp_compare(s, type, rn, rm, false, op);
+    handle_fp_compare(s, size, rn, rm, false, op);
 
     if (cond < 0x0e) {
         gen_set_label(label_continue);
-- 
2.14.3
