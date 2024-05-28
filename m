Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp189891ejk;
        Tue, 28 May 2024 13:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhM7y3klC8G9wNdfszQF03SZg0by038Go9MLs3qVzsYCsk0f4nVRY9d+FargV6xCtToeVVhLHUaIdCmupc9lFqD1/gKPkj
X-Google-Smtp-Source: AGHT+IFuPefe+QtmD9Vi3yuX8itqj9G5jfyN49vHIVxA1TIWZuKDjPTEIL4Yy8CC6CeI6J+Rj8Zk
X-Received: by 2002:a05:6214:4409:b0:6ab:9a00:8cb with SMTP id 6a1803df08f44-6abbbc188f5mr153146556d6.12.1716928390336;
        Tue, 28 May 2024 13:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716928390; cv=none;
        d=google.com; s=arc-20160816;
        b=RvLUbKDad0fhkFUYI48ZNT+jhN0H5RPNAxAl13lL46HVvsduewZwTfffkp+vMMPnWQ
         aXdDUx3YRQSzwPvzBxrsENNDlnxlP+2GTJGELEvMRQohXigHkGnNHTQVDGyp8ZSAP5+/
         IBm0DBX0xpxkXVdMwTl3ud+ZUqfRznb9wep53x8NVjpl6pX9aRhB/VxzsRBPg9ne9nCy
         uoOVso/yTdFwa+9oh+YGq8N0dty/ZTdgfbUDuLv/ZdfQQRmVWxGaFCLTKtUf8TZvDCN9
         PbXW9LGmUuCw+YZ76jYQxvZmdFi5Eeqe1drDkNVBvBxabI2XPz+cI7t8CU9WJV8HnQTB
         suLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XqzSCMsfptnvlD39ckpVKWyNk31U6Z555g0h0Nw1Xsk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=stHAkuis7AEFlUz2xb348qJaWAY8HE4pH/gqLNhAl++YRrI7dGMgc9p4AJegV0C9zv
         +kC3DfZlg5AaLNht2GhGuKkhQ8Hr9ZiU+VRICblPEjP2LE0Abi0oJsebTt9/XNO6Ydrz
         Ap9PM0rCyTDPL39QD9uWVmkJUbQxdiqbJHuxGMaO9ugbEmVjfn60ESDskbr2Zxk/O/SV
         7ddEL7SrhBfeEKxuhyZMwVe9G5x047MwXjmoLDq6yQKZ90wlyvIdOz7ojo+a9GBOICwJ
         /wFt3bHmHNA6+PsuSgRL+JmGBGrjK5XRbGdamWFIA86xM7hHePHDmJypYSq2deMcYyoA
         4skg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=js8zyX6Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ad78599a6bsi70309896d6.37.2024.05.28.13.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 13:33:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=js8zyX6Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC3Tl-0003Ai-20; Tue, 28 May 2024 16:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TS-0002sa-V9
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:10 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TF-0003bY-GF
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:10 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6f6bddf57f6so1299359b3a.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 13:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716928256; x=1717533056; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqzSCMsfptnvlD39ckpVKWyNk31U6Z555g0h0Nw1Xsk=;
 b=js8zyX6QAp4vFPgRnUW7HD+rJQ4rZqjsZId+q46emDEhnQBb+jK/4Qj3smlhsWHshx
 NfPkM4JU6PZzAW9LeIpbXymNvaKgyyYYqG548yuvJkGI2AqjKD6HZNIWY2L+1GPpEXJD
 U1+B8eKKqLHv8uCWjzAW8dksaQtATzisBNwNKzaiOa70qYra88NHZr7AVEWA71Gzysqb
 HPTc1rcPHNY0gaiR2advGn47JneOoVZD6JBZbXQhXmfOwHixsfIO+vlTzOWw8FiCxN68
 VK+ASf6gSAHmwPG4LhzuxGasYAtjfhn4btF+0EyvUSeCz651GQFsPuDhP/MiVFiNHzTL
 nw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928256; x=1717533056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XqzSCMsfptnvlD39ckpVKWyNk31U6Z555g0h0Nw1Xsk=;
 b=F9Xm3LiaUWJTNRv6tLAF2ZkrHyJfUTorb6OZOHXOzjIs0ZV5CvFIwYGetKaqIgZIG3
 0VYmxjFoP3lsauYm0Q3P/7cf0Xqby6Ww0aMC/enZc7416NrvtunlqARKTyKzXNivsCJC
 uFZfi015vgTXSdhWTtz7nDLjfgnP3G9toF1ITGtcIp9pKkeHcZIhg+pj7lsYbs3yrDNV
 Em0/fmSCYIjNVh2m/6wPHf13K0MIuKhEMqUqsLtg3D6cmz19pixYZjpag5dZvxrc5Z+W
 VkZCqOQiCjcJEV8UvLGGX6Ka1fIYalF+Gs3UrWOaOMOEGGt5lpXz7P2I79mFZwVY5n+D
 nowQ==
X-Gm-Message-State: AOJu0YyhR+pEN+AQoEfFInSVUgchAlS3E0/meZQECT2ZKj+mao0HTQK+
 IF6kIXqyPc0o6j2OiwPayvnYSBFSZw4hAyOr7TSzQL/xuhetl7HlT3Dc3U/Mo+4=
X-Received: by 2002:a05:6a21:3283:b0:1b2:4834:7a24 with SMTP id
 adf61e73a8af0-1b248347b96mr5457349637.45.1716928256122; 
 Tue, 28 May 2024 13:30:56 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3dbe9sm7042036b3a.10.2024.05.28.13.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:30:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 12/33] target/arm: Convert SQSHL and UQSHL (register) to
 gvec
Date: Tue, 28 May 2024 13:30:23 -0700
Message-Id: <20240528203044.612851-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
References: <20240528203044.612851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Se82uIPr4X8Q

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  8 ++++++++
 target/arm/tcg/translate.h      |  4 ++++
 target/arm/tcg/neon-dp.decode   | 10 ++-------
 target/arm/tcg/gengvec.c        | 24 ++++++++++++++++++++++
 target/arm/tcg/neon_helper.c    | 36 +++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c  | 17 +++++++---------
 target/arm/tcg/translate-neon.c |  6 ++----
 7 files changed, 83 insertions(+), 22 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 25eb7bf5df..f345087ddb 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -326,6 +326,14 @@ DEF_HELPER_3(neon_qrshl_u32, i32, env, i32, i32)
 DEF_HELPER_3(neon_qrshl_s32, i32, env, i32, i32)
 DEF_HELPER_3(neon_qrshl_u64, i64, env, i64, i64)
 DEF_HELPER_3(neon_qrshl_s64, i64, env, i64, i64)
+DEF_HELPER_FLAGS_5(neon_sqshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqshl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqshl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqshl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqshl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_srshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_srshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index ea63ffc47b..6c6d4d49e7 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -463,6 +463,10 @@ void gen_gvec_srshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 void gen_gvec_urshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_neon_sqshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_neon_uqshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 
 void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 void gen_ushl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
diff --git a/target/arm/tcg/neon-dp.decode b/target/arm/tcg/neon-dp.decode
index 8525c65c0d..6d4996b8d8 100644
--- a/target/arm/tcg/neon-dp.decode
+++ b/target/arm/tcg/neon-dp.decode
@@ -109,14 +109,8 @@ VSHL_U_3s        1111 001 1 0 . .. .... .... 0100 . . . 0 .... @3same_rev
 @3same_64_rev    .... ... . . . 11 .... .... .... . q:1 . . .... \
                  &3same vm=%vn_dp vn=%vm_dp vd=%vd_dp size=3
 
-{
-  VQSHL_S64_3s   1111 001 0 0 . .. .... .... 0100 . . . 1 .... @3same_64_rev
-  VQSHL_S_3s     1111 001 0 0 . .. .... .... 0100 . . . 1 .... @3same_rev
-}
-{
-  VQSHL_U64_3s   1111 001 1 0 . .. .... .... 0100 . . . 1 .... @3same_64_rev
-  VQSHL_U_3s     1111 001 1 0 . .. .... .... 0100 . . . 1 .... @3same_rev
-}
+VQSHL_S_3s       1111 001 0 0 . .. .... .... 0100 . . . 1 .... @3same_rev
+VQSHL_U_3s       1111 001 1 0 . .. .... .... 0100 . . . 1 .... @3same_rev
 VRSHL_S_3s       1111 001 0 0 . .. .... .... 0101 . . . 0 .... @3same_rev
 VRSHL_U_3s       1111 001 1 0 . .. .... .... 0101 . . . 0 .... @3same_rev
 {
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 216a9f81e3..63c3ec2e73 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -1240,6 +1240,30 @@ void gen_gvec_urshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     tcg_gen_gvec_3_ool(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, 0, fns[vece]);
 }
 
+void gen_neon_sqshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3_ptr * const fns[] = {
+        gen_helper_neon_sqshl_b, gen_helper_neon_sqshl_h,
+        gen_helper_neon_sqshl_s, gen_helper_neon_sqshl_d,
+    };
+    tcg_debug_assert(vece <= MO_64);
+    tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, tcg_env,
+                       opr_sz, max_sz, 0, fns[vece]);
+}
+
+void gen_neon_uqshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3_ptr * const fns[] = {
+        gen_helper_neon_uqshl_b, gen_helper_neon_uqshl_h,
+        gen_helper_neon_uqshl_s, gen_helper_neon_uqshl_d,
+    };
+    tcg_debug_assert(vece <= MO_64);
+    tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, tcg_env,
+                       opr_sz, max_sz, 0, fns[vece]);
+}
+
 void gen_uqadd_bhs(TCGv_i64 res, TCGv_i64 qc, TCGv_i64 a, TCGv_i64 b, MemOp esz)
 {
     uint64_t max = MAKE_64BIT_MASK(0, 8 << esz);
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index 516ecc1dcb..88301f0dcb 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -129,6 +129,18 @@ void HELPER(name)(void *vd, void *vn, void *vm, uint32_t desc) \
     clear_tail(d, opr_sz, simd_maxsz(desc));                    \
 }
 
+#define NEON_GVEC_VOP2_ENV(name, vtype) \
+void HELPER(name)(void *vd, void *vn, void *vm, void *venv, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    vtype *d = vd, *n = vn, *m = vm;                            \
+    CPUARMState *env = venv;                                    \
+    for (i = 0; i < opr_sz / sizeof(vtype); i++) {              \
+        NEON_FN(d[i], n[i], m[i]);                              \
+    }                                                           \
+    clear_tail(d, opr_sz, simd_maxsz(desc));                    \
+}
+
 /* Pairwise operations.  */
 /* For 32-bit elements each segment only contains a single element, so
    the elementwise and pairwise operations are the same.  */
@@ -339,11 +351,23 @@ uint64_t HELPER(neon_rshl_u64)(uint64_t val, uint64_t shift)
 #define NEON_FN(dest, src1, src2) \
     (dest = do_uqrshl_bhs(src1, (int8_t)src2, 8, false, env->vfp.qc))
 NEON_VOP_ENV(qshl_u8, neon_u8, 4)
+NEON_GVEC_VOP2_ENV(neon_uqshl_b, uint8_t)
 #undef NEON_FN
 
 #define NEON_FN(dest, src1, src2) \
     (dest = do_uqrshl_bhs(src1, (int8_t)src2, 16, false, env->vfp.qc))
 NEON_VOP_ENV(qshl_u16, neon_u16, 2)
+NEON_GVEC_VOP2_ENV(neon_uqshl_h, uint16_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, (int8_t)src2, 32, false, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_uqshl_s, uint32_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_d(src1, (int8_t)src2, false, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_uqshl_d, uint64_t)
 #undef NEON_FN
 
 uint32_t HELPER(neon_qshl_u32)(CPUARMState *env, uint32_t val, uint32_t shift)
@@ -359,11 +383,23 @@ uint64_t HELPER(neon_qshl_u64)(CPUARMState *env, uint64_t val, uint64_t shift)
 #define NEON_FN(dest, src1, src2) \
     (dest = do_sqrshl_bhs(src1, (int8_t)src2, 8, false, env->vfp.qc))
 NEON_VOP_ENV(qshl_s8, neon_s8, 4)
+NEON_GVEC_VOP2_ENV(neon_sqshl_b, int8_t)
 #undef NEON_FN
 
 #define NEON_FN(dest, src1, src2) \
     (dest = do_sqrshl_bhs(src1, (int8_t)src2, 16, false, env->vfp.qc))
 NEON_VOP_ENV(qshl_s16, neon_s16, 2)
+NEON_GVEC_VOP2_ENV(neon_sqshl_h, int16_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, (int8_t)src2, 32, false, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_sqshl_s, int32_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_d(src1, (int8_t)src2, false, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_sqshl_d, int64_t)
 #undef NEON_FN
 
 uint32_t HELPER(neon_qshl_s32)(CPUARMState *env, uint32_t val, uint32_t shift)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c751da78ef..c88702dad6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10937,6 +10937,13 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
+    case 0x09: /* SQSHL, UQSHL */
+        if (u) {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_uqshl, size);
+        } else {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_sqshl, size);
+        }
+        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
@@ -11072,16 +11079,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                 genfn = fns[size][u];
                 break;
             }
-            case 0x9: /* SQSHL, UQSHL */
-            {
-                static NeonGenTwoOpEnvFn * const fns[3][2] = {
-                    { gen_helper_neon_qshl_s8, gen_helper_neon_qshl_u8 },
-                    { gen_helper_neon_qshl_s16, gen_helper_neon_qshl_u16 },
-                    { gen_helper_neon_qshl_s32, gen_helper_neon_qshl_u32 },
-                };
-                genenvfn = fns[size][u];
-                break;
-            }
             case 0xb: /* SQRSHL, UQRSHL */
             {
                 static NeonGenTwoOpEnvFn * const fns[3][2] = {
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 337488bbf1..a3eec47092 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -796,6 +796,8 @@ DO_3SAME(VQSUB_S, gen_gvec_sqsub_qc)
 DO_3SAME(VQSUB_U, gen_gvec_uqsub_qc)
 DO_3SAME(VRSHL_S, gen_gvec_srshl)
 DO_3SAME(VRSHL_U, gen_gvec_urshl)
+DO_3SAME(VQSHL_S, gen_neon_sqshl)
+DO_3SAME(VQSHL_U, gen_neon_uqshl)
 
 /* These insns are all gvec_bitsel but with the inputs in various orders. */
 #define DO_3SAME_BITSEL(INSN, O1, O2, O3)                               \
@@ -931,8 +933,6 @@ DO_SHA2(SHA256SU1, gen_helper_crypto_sha256su1)
     }                                                                   \
     DO_3SAME_64(INSN, gen_##INSN##_elt)
 
-DO_3SAME_64_ENV(VQSHL_S64, gen_helper_neon_qshl_s64)
-DO_3SAME_64_ENV(VQSHL_U64, gen_helper_neon_qshl_u64)
 DO_3SAME_64_ENV(VQRSHL_S64, gen_helper_neon_qrshl_s64)
 DO_3SAME_64_ENV(VQRSHL_U64, gen_helper_neon_qrshl_u64)
 
@@ -1000,8 +1000,6 @@ DO_3SAME_32(VHSUB_U, hsub_u)
 DO_3SAME_32(VRHADD_S, rhadd_s)
 DO_3SAME_32(VRHADD_U, rhadd_u)
 
-DO_3SAME_32_ENV(VQSHL_S, qshl_s)
-DO_3SAME_32_ENV(VQSHL_U, qshl_u)
 DO_3SAME_32_ENV(VQRSHL_S, qrshl_s)
 DO_3SAME_32_ENV(VQRSHL_U, qrshl_u)
 
-- 
2.34.1

