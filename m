Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1994326ejb;
        Fri, 24 May 2024 16:27:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4l6LELSgUUKEapbXs5/c92PJf78LmCCR/PdcN0iaUyuR6CrceMN4ln8jh8EWD+ANobWLvPSZSaZ7rmc2XJ7N/SYgOkWAg
X-Google-Smtp-Source: AGHT+IFm0tYu8JFUhW3txLPAsJSrhLoVwfFLK4YvjPI+6jPQ6lCeOCPC9Co4lhQ8+4F/9NCgFtl6
X-Received: by 2002:a05:6214:338a:b0:6ab:9910:b4a0 with SMTP id 6a1803df08f44-6abaf5bbf33mr27221956d6.0.1716593234622;
        Fri, 24 May 2024 16:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593234; cv=none;
        d=google.com; s=arc-20160816;
        b=0V1ynu+cMwwjdWoBf/k/aInaclO85NslN1vFwAvpIEnp2aV8XTq9Qw+Oh+tWBSoI3+
         6NCBsESRzMudD7lzdjw1y6ytRa1lLmYGiBOu2kPxyuVCmOeEmmrdjNYk2qErtdT2F+vr
         MWZPZqE7sg16Ts/NWN4an/gId2eDb+pMdhTLVXWVNYVEfXmlf4cl0iotDAcYPTck5W2v
         Q9K/ezGj0whDKVDJgzxulUiSTefNA4bBIGbgUsoH4L6NfdqxDgS7Bp8i6NRhbrz+dx9Z
         D3xO0zBjLVKWBx6z2VTPMXB2sHnnXhO3yMyK1Opi/Iis7rDz7q2RoH4AUCrKfDNFOqb4
         rMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M/akLjaDjomvFRgt+5ZiGPiHf+F8Vp/Gx5uhLMA7u/o=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=fGjRqE54nhj6uOqjAGf6lNZ+f5cqGt+SPlj4o2gXzy6aICbPrvzaspwWsGzisgA1Rz
         bYscHFXB0wVhWj5MeF90K9D1Sz8zl2ewz9pEpcAIlVyOhwsZLeX7cAnlUeAhXBHq7Zdi
         kvTwWoIFQIsrFw1IJlA6afHCnTmkk+5u0WV33Me/q9PyZZR2A+JWa3QBOTRbvPeCISsd
         gHk0cYfi4sRWo+vTflF4KLc+DTlI2f2WO7PperydtX3c7FQPRj35BypltYhWUiomFHsL
         kvHS+fMw1MehZeP+xk+Io21xssY6xYDrZB15g6wdjx+vawBL1dpvLKEZeUUDNEiI1wVg
         uwng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i1FvT67s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac070f0cacsi27542956d6.208.2024.05.24.16.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i1FvT67s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeIb-0001Em-7y; Fri, 24 May 2024 19:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0007Og-V6
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:28 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHd-0006s9-Oh
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:23 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6f8ea2df4b3so1165462b3a.2
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593106; x=1717197906; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/akLjaDjomvFRgt+5ZiGPiHf+F8Vp/Gx5uhLMA7u/o=;
 b=i1FvT67sLMStVhGp06l133x85K+H86awxA8CaSptlOKZP/JSKkV16VF1t0H7Vnw2BH
 WNlk6CV6utBIXmSkmdg3fj0DPIAkH8STEAJ5T14cL9a46tkwmnZwWpkhlKLVeF/4+iDu
 bELB2mmfGMX16ItfdG+gBAvQhzXX5zBhTMGGScGHAZwp42CkRi3kbaL/gWMBg+e1nSwn
 /GN4//nubn3NAxLLVt02mBjTLwzpK7irTfcLoFufc5zjrMu551NU0J85XkkPRM6Grseb
 TFSJNUsFjO103kP9Rq8nmjE4Z0vO+R4V/KnsqLZDGRJrSmopEphN/LvPr0UljZUh3v4G
 22dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593106; x=1717197906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M/akLjaDjomvFRgt+5ZiGPiHf+F8Vp/Gx5uhLMA7u/o=;
 b=diD3POtKxbIeUwJFD0f1PcOj9Tb367lTXTje1mvfs0Cyg7Sfypr7nc05oiA+ieTd97
 C5N42wN0miEKB5TIVHOaW5Xq/HmsakDxPEYDRiVrx4eO8Ikk75GLNlm3ek1AYry/xrn+
 9KqiSCgwDAVROwRVqCbAAPOJH/V77TE96LYAhUHdiUknMRG46dX3XR152XzP5SJ2T0y5
 YSP8Nn6PrVQgHKyJmp5zAi6v7rGdJTU1P/wcvuuX7FrTYb+C4ouC+v9r3OS4GON3sHF0
 a70FANbxFJDDklClVBt7OUtlwaX9CbSOihQLp6E4fRv0yvBX0t4fqcrnoFy4GPt2nHZJ
 AdMw==
X-Gm-Message-State: AOJu0Yy4iPsAmQMWPjNZhAt895dOIaShAMT/LzQ2JQoiM0OX7ccnb56H
 K7PMoUpm2Zq2JoBfliCHUzf2P9yEhcy8o9dLhthx2VJ1gmkSGEKofkFKfFKXECM=
X-Received: by 2002:a05:6a00:2c94:b0:6e8:f57d:f1ec with SMTP id
 d2e1a72fcca58-6f8f34ca8b9mr4517706b3a.17.1716593105523; 
 Fri, 24 May 2024 16:25:05 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 48/67] target/arm: Convert SQRSHL and UQRSHL (register) to
 gvec
Date: Fri, 24 May 2024 16:21:02 -0700
Message-Id: <20240524232121.284515-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: TwAUOQuV5S1m

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  8 ++++++
 target/arm/tcg/translate.h      |  4 +++
 target/arm/tcg/neon-dp.decode   | 17 ++----------
 target/arm/tcg/gengvec.c        | 24 ++++++++++++++++
 target/arm/tcg/neon_helper.c    | 24 ++++++++++++++++
 target/arm/tcg/translate-a64.c  | 17 +++++-------
 target/arm/tcg/translate-neon.c | 49 ++-------------------------------
 7 files changed, 71 insertions(+), 72 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index f345087ddb..9a89c9cea7 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -334,6 +334,14 @@ DEF_HELPER_FLAGS_5(neon_uqshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(neon_uqshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(neon_uqshl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(neon_uqshl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqrshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqrshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqrshl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqrshl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqrshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqrshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqrshl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqrshl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_srshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_srshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 6c6d4d49e7..048cb45ebe 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -467,6 +467,10 @@ void gen_neon_sqshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 void gen_neon_uqshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_neon_sqrshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_neon_uqrshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 
 void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 void gen_ushl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
diff --git a/target/arm/tcg/neon-dp.decode b/target/arm/tcg/neon-dp.decode
index 6d4996b8d8..788578c8fa 100644
--- a/target/arm/tcg/neon-dp.decode
+++ b/target/arm/tcg/neon-dp.decode
@@ -102,25 +102,12 @@ VCGE_U_3s        1111 001 1 0 . .. .... .... 0011 . . . 1 .... @3same
 
 VSHL_S_3s        1111 001 0 0 . .. .... .... 0100 . . . 0 .... @3same_rev
 VSHL_U_3s        1111 001 1 0 . .. .... .... 0100 . . . 0 .... @3same_rev
-
-# Insns operating on 64-bit elements (size!=0b11 handled elsewhere)
-# The _rev suffix indicates that Vn and Vm are reversed (as explained
-# by the comment for the @3same_rev format).
-@3same_64_rev    .... ... . . . 11 .... .... .... . q:1 . . .... \
-                 &3same vm=%vn_dp vn=%vm_dp vd=%vd_dp size=3
-
 VQSHL_S_3s       1111 001 0 0 . .. .... .... 0100 . . . 1 .... @3same_rev
 VQSHL_U_3s       1111 001 1 0 . .. .... .... 0100 . . . 1 .... @3same_rev
 VRSHL_S_3s       1111 001 0 0 . .. .... .... 0101 . . . 0 .... @3same_rev
 VRSHL_U_3s       1111 001 1 0 . .. .... .... 0101 . . . 0 .... @3same_rev
-{
-  VQRSHL_S64_3s  1111 001 0 0 . .. .... .... 0101 . . . 1 .... @3same_64_rev
-  VQRSHL_S_3s    1111 001 0 0 . .. .... .... 0101 . . . 1 .... @3same_rev
-}
-{
-  VQRSHL_U64_3s  1111 001 1 0 . .. .... .... 0101 . . . 1 .... @3same_64_rev
-  VQRSHL_U_3s    1111 001 1 0 . .. .... .... 0101 . . . 1 .... @3same_rev
-}
+VQRSHL_S_3s      1111 001 0 0 . .. .... .... 0101 . . . 1 .... @3same_rev
+VQRSHL_U_3s      1111 001 1 0 . .. .... .... 0101 . . . 1 .... @3same_rev
 
 VMAX_S_3s        1111 001 0 0 . .. .... .... 0110 . . . 0 .... @3same
 VMAX_U_3s        1111 001 1 0 . .. .... .... 0110 . . . 0 .... @3same
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 773dbf41d3..51e66ccf5f 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -1263,6 +1263,30 @@ void gen_neon_uqshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                        opr_sz, max_sz, 0, fns[vece]);
 }
 
+void gen_neon_sqrshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3_ptr * const fns[] = {
+        gen_helper_neon_sqrshl_b, gen_helper_neon_sqrshl_h,
+        gen_helper_neon_sqrshl_s, gen_helper_neon_sqrshl_d,
+    };
+    tcg_debug_assert(vece <= MO_64);
+    tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, tcg_env,
+                       opr_sz, max_sz, 0, fns[vece]);
+}
+
+void gen_neon_uqrshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3_ptr * const fns[] = {
+        gen_helper_neon_uqrshl_b, gen_helper_neon_uqrshl_h,
+        gen_helper_neon_uqrshl_s, gen_helper_neon_uqrshl_d,
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
index 88301f0dcb..b29a7c725f 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -435,11 +435,23 @@ uint64_t HELPER(neon_qshlu_s64)(CPUARMState *env, uint64_t val, uint64_t shift)
 #define NEON_FN(dest, src1, src2) \
     (dest = do_uqrshl_bhs(src1, (int8_t)src2, 8, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_u8, neon_u8, 4)
+NEON_GVEC_VOP2_ENV(neon_uqrshl_b, uint8_t)
 #undef NEON_FN
 
 #define NEON_FN(dest, src1, src2) \
     (dest = do_uqrshl_bhs(src1, (int8_t)src2, 16, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_u16, neon_u16, 2)
+NEON_GVEC_VOP2_ENV(neon_uqrshl_h, uint16_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, (int8_t)src2, 32, true, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_uqrshl_s, uint32_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_d(src1, (int8_t)src2, true, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_uqrshl_d, uint64_t)
 #undef NEON_FN
 
 uint32_t HELPER(neon_qrshl_u32)(CPUARMState *env, uint32_t val, uint32_t shift)
@@ -455,11 +467,23 @@ uint64_t HELPER(neon_qrshl_u64)(CPUARMState *env, uint64_t val, uint64_t shift)
 #define NEON_FN(dest, src1, src2) \
     (dest = do_sqrshl_bhs(src1, (int8_t)src2, 8, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_s8, neon_s8, 4)
+NEON_GVEC_VOP2_ENV(neon_sqrshl_b, int8_t)
 #undef NEON_FN
 
 #define NEON_FN(dest, src1, src2) \
     (dest = do_sqrshl_bhs(src1, (int8_t)src2, 16, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_s16, neon_s16, 2)
+NEON_GVEC_VOP2_ENV(neon_sqrshl_h, int16_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, (int8_t)src2, 32, true, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_sqrshl_s, int32_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_d(src1, (int8_t)src2, true, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_sqrshl_d, int64_t)
 #undef NEON_FN
 
 uint32_t HELPER(neon_qrshl_s32)(CPUARMState *env, uint32_t val, uint32_t shift)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f8d2760bea..b0004e2c6f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10965,6 +10965,13 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
+    case 0x0b: /* SQRSHL, UQRSHL */
+        if (u) {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_uqrshl, size);
+        } else {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_sqrshl, size);
+        }
+        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
@@ -11107,16 +11114,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                 genfn = fns[size][u];
                 break;
             }
-            case 0xb: /* SQRSHL, UQRSHL */
-            {
-                static NeonGenTwoOpEnvFn * const fns[3][2] = {
-                    { gen_helper_neon_qrshl_s8, gen_helper_neon_qrshl_u8 },
-                    { gen_helper_neon_qrshl_s16, gen_helper_neon_qrshl_u16 },
-                    { gen_helper_neon_qrshl_s32, gen_helper_neon_qrshl_u32 },
-                };
-                genenvfn = fns[size][u];
-                break;
-            }
             default:
                 g_assert_not_reached();
             }
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index a3eec47092..5f1576393e 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -798,6 +798,8 @@ DO_3SAME(VRSHL_S, gen_gvec_srshl)
 DO_3SAME(VRSHL_U, gen_gvec_urshl)
 DO_3SAME(VQSHL_S, gen_neon_sqshl)
 DO_3SAME(VQSHL_U, gen_neon_uqshl)
+DO_3SAME(VQRSHL_S, gen_neon_sqrshl)
+DO_3SAME(VQRSHL_U, gen_neon_uqrshl)
 
 /* These insns are all gvec_bitsel but with the inputs in various orders. */
 #define DO_3SAME_BITSEL(INSN, O1, O2, O3)                               \
@@ -916,26 +918,6 @@ DO_SHA2(SHA256H, gen_helper_crypto_sha256h)
 DO_SHA2(SHA256H2, gen_helper_crypto_sha256h2)
 DO_SHA2(SHA256SU1, gen_helper_crypto_sha256su1)
 
-#define DO_3SAME_64(INSN, FUNC)                                         \
-    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
-                                uint32_t rn_ofs, uint32_t rm_ofs,       \
-                                uint32_t oprsz, uint32_t maxsz)         \
-    {                                                                   \
-        static const GVecGen3 op = { .fni8 = FUNC };                    \
-        tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, oprsz, maxsz, &op);      \
-    }                                                                   \
-    DO_3SAME(INSN, gen_##INSN##_3s)
-
-#define DO_3SAME_64_ENV(INSN, FUNC)                                     \
-    static void gen_##INSN##_elt(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)    \
-    {                                                                   \
-        FUNC(d, tcg_env, n, m);                                         \
-    }                                                                   \
-    DO_3SAME_64(INSN, gen_##INSN##_elt)
-
-DO_3SAME_64_ENV(VQRSHL_S64, gen_helper_neon_qrshl_s64)
-DO_3SAME_64_ENV(VQRSHL_U64, gen_helper_neon_qrshl_u64)
-
 #define DO_3SAME_32(INSN, FUNC)                                         \
     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
                                 uint32_t rn_ofs, uint32_t rm_ofs,       \
@@ -969,30 +951,6 @@ DO_3SAME_64_ENV(VQRSHL_U64, gen_helper_neon_qrshl_u64)
         FUNC(d, tcg_env, n, m);                                         \
     }
 
-#define DO_3SAME_32_ENV(INSN, FUNC)                                     \
-    WRAP_ENV_FN(gen_##INSN##_tramp8, gen_helper_neon_##FUNC##8);        \
-    WRAP_ENV_FN(gen_##INSN##_tramp16, gen_helper_neon_##FUNC##16);      \
-    WRAP_ENV_FN(gen_##INSN##_tramp32, gen_helper_neon_##FUNC##32);      \
-    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
-                                uint32_t rn_ofs, uint32_t rm_ofs,       \
-                                uint32_t oprsz, uint32_t maxsz)         \
-    {                                                                   \
-        static const GVecGen3 ops[4] = {                                \
-            { .fni4 = gen_##INSN##_tramp8 },                            \
-            { .fni4 = gen_##INSN##_tramp16 },                           \
-            { .fni4 = gen_##INSN##_tramp32 },                           \
-            { 0 },                                                      \
-        };                                                              \
-        tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, oprsz, maxsz, &ops[vece]); \
-    }                                                                   \
-    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
-    {                                                                   \
-        if (a->size > 2) {                                              \
-            return false;                                               \
-        }                                                               \
-        return do_3same(s, a, gen_##INSN##_3s);                         \
-    }
-
 DO_3SAME_32(VHADD_S, hadd_s)
 DO_3SAME_32(VHADD_U, hadd_u)
 DO_3SAME_32(VHSUB_S, hsub_s)
@@ -1000,9 +958,6 @@ DO_3SAME_32(VHSUB_U, hsub_u)
 DO_3SAME_32(VRHADD_S, rhadd_s)
 DO_3SAME_32(VRHADD_U, rhadd_u)
 
-DO_3SAME_32_ENV(VQRSHL_S, qrshl_s)
-DO_3SAME_32_ENV(VQRSHL_U, qrshl_u)
-
 #define DO_3SAME_VQDMULH(INSN, FUNC)                                    \
     WRAP_ENV_FN(gen_##INSN##_tramp16, gen_helper_neon_##FUNC##_s16);    \
     WRAP_ENV_FN(gen_##INSN##_tramp32, gen_helper_neon_##FUNC##_s32);    \
-- 
2.34.1

