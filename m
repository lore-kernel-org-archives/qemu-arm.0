Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1696390lfc;
        Fri, 28 Aug 2020 11:48:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOYOrJTQPfoXMdR5WMr4zR8IyHqCp+JCOl3DwTmDqglEdMFzvzCS4AgsmmA2LeR2JC8YVo
X-Received: by 2002:a25:df02:: with SMTP id w2mr4089597ybg.189.1598640498271;
        Fri, 28 Aug 2020 11:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598640498; cv=none;
        d=google.com; s=arc-20160816;
        b=pAQjpja3FkQ3QC/4Ca47IaPEpIIFzWsbRZ9agI+s6yW+dBKntEGGVWZwGJyZxQ9jOI
         pPCtz9uYz2/5R3s+DQohtMyw/+Y3sobaytupaSrmvnO4L48ES6O9EtM+rJ/4XTu73NMx
         4/9GZwn6llRnHKGQsihBE5icJi6vNEn3k6WRikt7vaHsw6iHnd0CqVs0YKZWkZkmC1gw
         /zKSqGprN/BWSUSN5WYVDcvp6sGKzWDl8+yQISbshJqGJowFMFaGisVSLZu1wIWseXm2
         oAesqJSVoPmz8miew8Tcrw7WRHp2A7hj0YpkZqrUvV/9qEjafdohmrEq+JX/svwAIopV
         47+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k2fvNqZMBMcu+QPHwCHqAmjAV+Giderb+QvU3S3E5kg=;
        b=uw5g/3cPpUnerPNXACLHzvtqMqIl8L+btY4yB2wnnuTekTUzJsmbvQnZYSbOAA6tOy
         latpEMOYjMG2mdynnI0MfRH8srz9WDb8hOgPdcmRVgesobX2VUbaxDjY1Oe0EA5g2col
         Nsg8XuLVwWLd8yMykuExcuGGMb19Q3S58sUn2lsLHn+g+XSsOM85ZbDTLumtdb+2oorc
         lt88wDFBFmjVwDFmSyzCeUwdG4oNOSDEHNGPpNWb3714gneULGvNhf+Ezexa7iBOy0/v
         dwsFsE8bPogDp+K6+olS/QQXAOq8h3COdye7NfxF+f9362EfFo5NaOKmPwGcwVd+1kU3
         MNuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWA1Eare;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10si78337ybd.491.2020.08.28.11.48.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:48:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWA1Eare;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjQ9-0007FB-EU
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCp-0002nm-Pp
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:31 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCk-00061D-1P
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:31 -0400
Received: by mail-wr1-x443.google.com with SMTP id b18so50684wrs.7
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 11:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k2fvNqZMBMcu+QPHwCHqAmjAV+Giderb+QvU3S3E5kg=;
 b=VWA1EareKeIVNI81aZYnIdjOamSaZuyYYcm5QuiqAlJgOtEIKzLTmRz/Bnc8ZtPysj
 WWVayamAVQJi14sdFSy7lxjEJA5jmc6NZ48ocaEcPyMykxKR4qTDrgpP7tmrnlEbcMQi
 g35b016zVudrZiEzWypdeQpFcEOe9NGQnGNafEyy0bCHmuQOTeEmQmdsidejkv+DOdMS
 xzD6nB4H3oj5SnI80zlvC/julxv+m34Ta0SoIbYV3QXoUGuNZVmy/PvQhoDgLZMyTvdo
 mFCzR1P9nxw/X1G+ZE7Ll/+G09qfHM2h9ttz/y0m9iMfN4a+SqTL/Nftz/bYSN7yEJuo
 /wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k2fvNqZMBMcu+QPHwCHqAmjAV+Giderb+QvU3S3E5kg=;
 b=oxq+uQtYHcinabS/8CuDxNlXtTrlSmq6WomfyBhWG/kG24G5eVEUBfStaQjgwjat+E
 sFYm2Xv39Av14FhsJ0LWFUvY65AvM6PIzmPnEFbNjps00wdDnqJNFkFqZ61dcvL0aOG1
 s/Agp0xEcZgszQm+1BSQhuMJxtULs/VaxJDPmIMa8MgBruCRgYV/iYtkWXoIVs3XXdys
 ksquVl0jDo0SWQc3rh3pNypUHB2EXW+qokmWrxL+ZhY2T/EtaZx4QbP8dZ6WK5cqfk6h
 zd2zohVXwCVXazADjkg5GxyoIuXzIN5xE38z4TXt3jIiCfEn2UqWQTOdAPKn0jbuxn8i
 TDXA==
X-Gm-Message-State: AOAM531Id4xHqru4thqnPrGYUQGaERKKZaSOA3BN5XgD8tDG9UdcyfmT
 sgrbmNLc9YRQdYl7PLa4b1iF0A==
X-Received: by 2002:adf:9ed1:: with SMTP id b17mr278555wrf.140.1598639664666; 
 Fri, 28 Aug 2020 11:34:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 23/45] target/arm: Implement FP16 for Neon VADD, VSUB, VABD,
 VMUL
Date: Fri, 28 Aug 2020 19:33:32 +0100
Message-Id: <20200828183354.27913-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2MOP31PO/Uxw

Implement FP16 support for the Neon insns which use the DO_3S_FP_GVEC
macro: VADD, VSUB, VABD, VMUL.

For VABD this requires us to implement a new gvec_fabd_h helper
using the machinery we have already for the other helpers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h             |  1 +
 target/arm/vec_helper.c         |  6 ++++++
 target/arm/translate-neon.c.inc | 36 +++++++++++++++++----------------
 3 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index f5ad5088bf1..aa1ac75571f 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -629,6 +629,7 @@ DEF_HELPER_FLAGS_5(gvec_fmul_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fmul_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fmul_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fabd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fabd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_ftsmul_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index a6c53d2ab6c..988d5784e83 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -707,6 +707,11 @@ static float64 float64_ftsmul(float64 op1, uint64_t op2, float_status *stat)
     return result;
 }
 
+static float16 float16_abd(float16 op1, float16 op2, float_status *stat)
+{
+    return float16_abs(float16_sub(op1, op2, stat));
+}
+
 static float32 float32_abd(float32 op1, float32 op2, float_status *stat)
 {
     return float32_abs(float32_sub(op1, op2, stat));
@@ -739,6 +744,7 @@ DO_3OP(gvec_ftsmul_h, float16_ftsmul, float16)
 DO_3OP(gvec_ftsmul_s, float32_ftsmul, float32)
 DO_3OP(gvec_ftsmul_d, float64_ftsmul, float64)
 
+DO_3OP(gvec_fabd_h, float16_abd, float16)
 DO_3OP(gvec_fabd_s, float32_abd, float32)
 
 #ifdef TARGET_AARCH64
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 9879731a521..9d0959517fa 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -1082,34 +1082,36 @@ static bool do_3same_fp(DisasContext *s, arg_3same *a, VFPGen3OpSPFn *fn,
     return true;
 }
 
-/*
- * For all the functions using this macro, size == 1 means fp16,
- * which is an architecture extension we don't implement yet.
- */
-#define DO_3S_FP_GVEC(INSN,FUNC)                                        \
-    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
-                                uint32_t rn_ofs, uint32_t rm_ofs,       \
-                                uint32_t oprsz, uint32_t maxsz)         \
+#define WRAP_FP_GVEC(WRAPNAME, FPST, FUNC)                              \
+    static void WRAPNAME(unsigned vece, uint32_t rd_ofs,                \
+                         uint32_t rn_ofs, uint32_t rm_ofs,              \
+                         uint32_t oprsz, uint32_t maxsz)                \
     {                                                                   \
-        TCGv_ptr fpst = fpstatus_ptr(FPST_STD);                         \
+        TCGv_ptr fpst = fpstatus_ptr(FPST);                             \
         tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, fpst,                \
                            oprsz, maxsz, 0, FUNC);                      \
         tcg_temp_free_ptr(fpst);                                        \
-    }                                                                   \
+    }
+
+#define DO_3S_FP_GVEC(INSN,SFUNC,HFUNC)                                 \
+    WRAP_FP_GVEC(gen_##INSN##_fp32_3s, FPST_STD, SFUNC)                 \
+    WRAP_FP_GVEC(gen_##INSN##_fp16_3s, FPST_STD_F16, HFUNC)             \
     static bool trans_##INSN##_fp_3s(DisasContext *s, arg_3same *a)     \
     {                                                                   \
         if (a->size != 0) {                                             \
-            /* TODO fp16 support */                                     \
-            return false;                                               \
+            if (!dc_isar_feature(aa32_fp16_arith, s)) {                 \
+                return false;                                           \
+            }                                                           \
+            return do_3same(s, a, gen_##INSN##_fp16_3s);                \
         }                                                               \
-        return do_3same(s, a, gen_##INSN##_3s);                         \
+        return do_3same(s, a, gen_##INSN##_fp32_3s);                    \
     }
 
 
-DO_3S_FP_GVEC(VADD, gen_helper_gvec_fadd_s)
-DO_3S_FP_GVEC(VSUB, gen_helper_gvec_fsub_s)
-DO_3S_FP_GVEC(VABD, gen_helper_gvec_fabd_s)
-DO_3S_FP_GVEC(VMUL, gen_helper_gvec_fmul_s)
+DO_3S_FP_GVEC(VADD, gen_helper_gvec_fadd_s, gen_helper_gvec_fadd_h)
+DO_3S_FP_GVEC(VSUB, gen_helper_gvec_fsub_s, gen_helper_gvec_fsub_h)
+DO_3S_FP_GVEC(VABD, gen_helper_gvec_fabd_s, gen_helper_gvec_fabd_h)
+DO_3S_FP_GVEC(VMUL, gen_helper_gvec_fmul_s, gen_helper_gvec_fmul_h)
 
 /*
  * For all the functions using this macro, size == 1 means fp16,
-- 
2.20.1

