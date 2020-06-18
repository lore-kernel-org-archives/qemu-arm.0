Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1272124lfm;
        Wed, 17 Jun 2020 21:48:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfiMi0c3A2GNCWl/PsYz8+E2MIP/0pJu2Ppe8LHAFA+Md9hOvZarVocYRJXR7l0DcjFig6
X-Received: by 2002:a5b:346:: with SMTP id q6mr3823066ybp.472.1592455702654;
        Wed, 17 Jun 2020 21:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455702; cv=none;
        d=google.com; s=arc-20160816;
        b=YtMvErRVU87VoHMYWQiBBacFfuUFKzdcsxSTmh8FOhmQpJwl+9e+RfG4SrBWTO/RJJ
         379C92QTSNk8L/eMs4by2XL/0RgFO3Ug8bf+A9HICDaC6+T8tFuSiCliGNT78yhWRCJZ
         oW2MI2wOGQShWdI53K5xH5AuzBwXy3p79YOBb7G5gJGV6dzbbhPWVpKL3EaKOqIpQSu2
         Bbxrbzl+kvfSjVMDE2utd9gcEqVJ1bwZywybiZS1LV3pQCOQZdsGCQQs1IFEDfWfMF6S
         TkX9yfe2/S3WD54kv+TCADfKRiURu0jdhLbcp9cfSlKN6kpaWzwOg7VINDj0eHQ7/qiC
         PZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Tm7o+ybUE8BofbR4cOSu/VBFEkpYrRST1ZqVe+E2dOY=;
        b=0Zy6Ym7wiGni7kUNbcZ8ViJ1Z8Pilkx9Cjo2Cxn8uxkCZUYG94wY1DcH/bGXQ/Xypk
         lKmVhIo9PgnHrAZPRByVlsj+5FHHTvYDWXg0P9/Z0nhNIazdDlEQSYFnSBSdanuI3Sp4
         +hGUCuvTtN/EwDcPdwRUL+Dqqrga5pIWDN8gPsZHcmYCwaDgu2p5SqAgxYZl99INmpZY
         q5SwZy+ADdjGtJdjMbXcULqPZ1Ezm8FvjQKXipDPHPQnXHxxqCJknaYpmSfqKthO7uMs
         7Gl1GVangeNxvlVExt8Zq5vSLximuIeH3aU+lI+XZC9lHykFhk9bljSfTK/isnAyWXyz
         tNEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVK++HaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2si1535930ybn.178.2020.06.17.21.48.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:48:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVK++HaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmTN-0001sx-VY
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBN-00082z-Ii
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:45 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBL-0002uJ-Ke
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:45 -0400
Received: by mail-pl1-x641.google.com with SMTP id 35so1924507ple.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tm7o+ybUE8BofbR4cOSu/VBFEkpYrRST1ZqVe+E2dOY=;
 b=bVK++HaHoyYqjh5G7bBc5cUBvSZrz+tGuo0NFB7QgURoQe5XrubpkLrEacMBdKmYKT
 QyB1artbSzbIsEPk5UtVRu3fsUWLg7R1NelXcG3kXTNU7hpZhjeRy5Bom93jcfEv5fkU
 4E3JDu4byMySDgE0m75AdfQJJOps4tdksYRvZVZ0H/c6wxoSGOIh5AZzridDFLWL/66f
 l9TsJvEr4J1KHTZRTDYKLrELQdj9NrHUiIrFDXDSuj8pnRw5WhXTTc07OPtyhdfrVphs
 4/tGiSWSiElU+Zm9t3B7uqxp38CaI2AeazdmIrPtIM41KyMUqtSrpSIpt66MQ+TveWpL
 eYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tm7o+ybUE8BofbR4cOSu/VBFEkpYrRST1ZqVe+E2dOY=;
 b=npmi7MPAzK4OboEwP+q/Tsu1b5JkZC2v4jbw+Dw31L1k/HY/XSSEuV+DYKtYrWCICT
 ep1AZFHdtaD/R9n2Cu3nozkn0180Kk/Av7DzH335JjFdSTO+eiVI6Rq6h2Zdu8gtAtry
 W9d3dXViUNh53hKSpgNxW3/VLTqPgzTS7SNZ0g/BY6pm9M0JsoNA+lURFuDogVHUogYM
 z6/ZvZb4MCurLQO7xuCeBUvq93vOqEYI3Y9wsDAleZBEfHBGUL7mahmhUUl37YC83+Ys
 hgUR3s7aWRN1u/20dt606uTZy46HMHdQlYKYOitGTK5rCTffALxqLpKH/aUEgN3S0mJw
 yGvg==
X-Gm-Message-State: AOAM53242AGBqp4zwY227kr5Z8hkYbxybMYsVq6SFUFw9eJ5V1Pn5xli
 g3+fyKSJmFjn+mSqL0Y++FsMikbK5aA=
X-Received: by 2002:a17:902:523:: with SMTP id
 32mr2194475plf.212.1592454582260; 
 Wed, 17 Jun 2020 21:29:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id j17sm1157899pgk.66.2020.06.17.21.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:29:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 040/100] target/arm: Implement SVE2 floating-point pairwise
Date: Wed, 17 Jun 2020 21:25:44 -0700
Message-Id: <20200618042644.1685561-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xCMWm/ekGHWE

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Load all inputs before writing any output (laurent desnogues)
---
 target/arm/helper-sve.h    | 35 +++++++++++++++++++++++++++++
 target/arm/sve.decode      |  8 +++++++
 target/arm/sve_helper.c    | 46 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 25 +++++++++++++++++++++
 4 files changed, 114 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3fff364778..cad45b0f16 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1955,3 +1955,38 @@ DEF_HELPER_FLAGS_3(sve2_uqxtnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 733f9a3db4..54657d996a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1284,3 +1284,11 @@ UQXTNB          01000101 .. 1 ..... 010 010 ..... .....  @rd_rn_tszimm_shl
 UQXTNT          01000101 .. 1 ..... 010 011 ..... .....  @rd_rn_tszimm_shl
 SQXTUNB         01000101 .. 1 ..... 010 100 ..... .....  @rd_rn_tszimm_shl
 SQXTUNT         01000101 .. 1 ..... 010 101 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 floating-point pairwise operations
+
+FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
+FMAXNMP         01100100 .. 010 10 0 100 ... ..... ..... @rdn_pg_rm
+FMINNMP         01100100 .. 010 10 1 100 ... ..... ..... @rdn_pg_rm
+FMAXP           01100100 .. 010 11 0 100 ... ..... ..... @rdn_pg_rm
+FMINP           01100100 .. 010 11 1 100 ... ..... ..... @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 0861fd0277..27ba4e81fb 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -890,6 +890,52 @@ DO_ZPZZ_PAIR_D(sve2_sminp_zpzz_d, int64_t, DO_MIN)
 #undef DO_ZPZZ_PAIR
 #undef DO_ZPZZ_PAIR_D
 
+#define DO_ZPZZ_PAIR_FP(NAME, TYPE, H, OP)                              \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg,               \
+                  void *status, uint32_t desc)                          \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    for (i = 0; i < opr_sz; ) {                                         \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            TYPE n0 = *(TYPE *)(vn + H(i));                             \
+            TYPE m0 = *(TYPE *)(vm + H(i));                             \
+            TYPE n1 = *(TYPE *)(vn + H(i + sizeof(TYPE)));              \
+            TYPE m1 = *(TYPE *)(vm + H(i + sizeof(TYPE)));              \
+            if (pg & 1) {                                               \
+                *(TYPE *)(vd + H(i)) = OP(n0, n1, status);              \
+            }                                                           \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
+            if (pg & 1) {                                               \
+                *(TYPE *)(vd + H(i)) = OP(m0, m1, status);              \
+            }                                                           \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_h, float16, H1_2, float16_add)
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_s, float32, H1_4, float32_add)
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_d, float64,     , float64_add)
+
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_h, float16, H1_2, float16_maxnum)
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_s, float32, H1_4, float32_maxnum)
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_d, float64,     , float64_maxnum)
+
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_h, float16, H1_2, float16_minnum)
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_s, float32, H1_4, float32_minnum)
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_d, float64,     , float64_minnum)
+
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_h, float16, H1_2, float16_max)
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_s, float32, H1_4, float32_max)
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_d, float64,     , float64_max)
+
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_h, float16, H1_2, float16_min)
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_s, float32, H1_4, float32_min)
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_d, float64,     , float64_min)
+
+#undef DO_ZPZZ_PAIR_FP
+
 /* Three-operand expander, controlled by a predicate, in which the
  * third operand is "wide".  That is, for D = N op M, the same 64-bit
  * value of M is used with all of the narrower values of N.
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d71228fe5a..532db579a5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6263,3 +6263,28 @@ static bool trans_SQXTUNT(DisasContext *s, arg_rri_esz *a)
     };
     return do_sve2_narrow_extract(s, a, ops);
 }
+
+static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
+                            gen_helper_gvec_4_ptr *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzz_fp(s, a, fn);
+}
+
+#define DO_SVE2_ZPZZ_FP(NAME, name)                                         \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
+{                                                                           \
+    static gen_helper_gvec_4_ptr * const fns[4] = {                         \
+        NULL,                            gen_helper_sve2_##name##_zpzz_h,   \
+        gen_helper_sve2_##name##_zpzz_s, gen_helper_sve2_##name##_zpzz_d    \
+    };                                                                      \
+    return do_sve2_zpzz_fp(s, a, fns[a->esz]);                              \
+}
+
+DO_SVE2_ZPZZ_FP(FADDP, faddp)
+DO_SVE2_ZPZZ_FP(FMAXNMP, fmaxnmp)
+DO_SVE2_ZPZZ_FP(FMINNMP, fminnmp)
+DO_SVE2_ZPZZ_FP(FMAXP, fmaxp)
+DO_SVE2_ZPZZ_FP(FMINP, fminp)
-- 
2.25.1

