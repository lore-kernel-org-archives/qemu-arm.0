Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp338455lft;
        Fri, 8 Jul 2022 08:29:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unvR1qckoXUf0pY7/nnr++f9pyIEcEpU3jqB8kb7uT6FEYBQpL2qIKck4/wzX3twq8LIXz
X-Received: by 2002:a05:6214:29c3:b0:473:2ae:e92a with SMTP id gh3-20020a05621429c300b0047302aee92amr3035500qvb.36.1657294150567;
        Fri, 08 Jul 2022 08:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657294150; cv=none;
        d=google.com; s=arc-20160816;
        b=hkklH7IpUtBNMSND0dkqzSOnEPTce9mLlXeVHwbKAWbvew/Z5/Mtzxqvo3acc8vULE
         G2c+iPUntevQGaR9yWcZLteK1APdj5+eenkPfpPNF2U+PrYOkcsNUWFOzz3ClbgtbvSM
         ZQ0jqWsXyeIB0fabpw6KZCNpMD4J0xiu2ylbhBso0wD7UhHY9qckWBKmE8uOMg1So/wX
         KtVCzOrvaGkfdYmvq4KDCBI9mPxfcr6byhED3epzdJbjjVQEbWQzh2m+HPF3HgbuS2e0
         28zTY7+DDMXnAbLWf8GRc9gBdP6sCfr8iXO8ijpcLJ4pztfmIdd+XrpAmfjvB8ltDpNQ
         5ikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xDxZQB7t7jC7e11iBt04ewldeYznmzQBar7IyZiGr2c=;
        b=aE9c9RyTEnUtnS5IO5oTeNgkqChddUN9bpkFgbYeQsE9MjYQt2/2uVCLT5eSBEEndM
         JVtrcmMVPlPI/5iDx52zHEb3wvVQUYaFAU76NkTNBaDJM6ZAZON5HyZvcW18BR46DtBs
         kNH2CZ3aLG+49btdUhkxyw0CfvIbjOCgF1QTpvT2VWgXe3KNrnoMMXzKyk5zHDB5jixC
         FgZ8fqi++iA+wQMjcwzxVZd+FSh6+AfrUrwIrZjdo+NH1U8H+edZ/pgmtz+lsINuGCEX
         xmZ3eNZ6qFQk8BedUA8eDYyF6LSIR+9v3v8XDgRg6t5tfmuq6nbLD2fTXbVje2xxFJrV
         GuEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CC/uRJhV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20-20020a05620a28d400b006b24cc136f7si17969765qkp.354.2022.07.08.08.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:29:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CC/uRJhV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9puo-0004UM-1B
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjN-0004ML-Dn
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:22 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjK-0002S5-JI
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:20 -0400
Received: by mail-pf1-x42c.google.com with SMTP id j3so11131421pfb.6
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDxZQB7t7jC7e11iBt04ewldeYznmzQBar7IyZiGr2c=;
 b=CC/uRJhVs/t+i96t2DEXFbjTKMmlUFMgw5Y1LmAMWxratlU/g+3wvUlL+16E1l93/F
 Y2XVriwbMRgMsP8Veo6xuVjSGD0Jv1FQJwSQllR37vINjIYJ3CJkF3jBIfEuViXwAiCm
 zP6/sA72NIFgDNzVV80yFxP1ofPOTMhUcfNTdqP8MAAjG3keaqXTYulmuFCqDKDy5drL
 L12ISOu+VlXmqyjTjar1kKC40plclRv44Fsc2Zi9L/lZr2cVP6a97Sxp2Rv5J0xxHonX
 CUfYW1r2f8HDcTYfymFKzpF9ITSJVd7UdzU4b1lIEpITAv4Z1Qgz23kZg+1/LSx2BW1W
 zWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDxZQB7t7jC7e11iBt04ewldeYznmzQBar7IyZiGr2c=;
 b=6ddJ0bmlagC+hTUNfINLupqeo0tBOCEbHBNSdJqhEP5s+9kfngmEyimm1jl1cOlq+r
 2D0hclZsxCUC6FwoJya4nGnhlkGqxcIcrs9Pfzbq1G+w1Q1+mbkMzRWyNpotL1diUH+/
 9r6OQpyF+UXeHY0pSQYXM98wNCDMloATakfHJzxCcCLVT2yQx8DCY9kUdkQyupsMpXAd
 5rFOUWmVXKQInte71YSJ1sVYGt9L24Zo4sZMXOGBie/nTMUtjHsjklWHvvQzgAK8DLWY
 BMRe1FsBYpqtRQXJXKctq3vdxDHfzDkkpHMWWdOk0ho5XsNLxl9vSr58kSv7V3O1mMP7
 60tw==
X-Gm-Message-State: AJIora8TJAv2BigLF+06iOzXs0hzSfmOp0u6z6gPr7j+Yj/0cSrRWf0q
 qdLG40C/TXVCOXH6z6koKpKinw==
X-Received: by 2002:a63:e202:0:b0:412:7a7a:53e9 with SMTP id
 q2-20020a63e202000000b004127a7a53e9mr3753129pgh.624.1657293437321; 
 Fri, 08 Jul 2022 08:17:17 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 30/45] target/arm: Implement SCLAMP, UCLAMP
Date: Fri,  8 Jul 2022 20:45:25 +0530
Message-Id: <20220708151540.18136-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P5a1PFAzQ5kf

This is an SVE instruction that operates using the SVE vector
length but that it is present only if SME is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  18 +++++++
 target/arm/sve.decode      |   5 ++
 target/arm/translate-sve.c | 102 +++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    |  24 +++++++++
 4 files changed, 149 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 3a8ce42ab0..92f36d9dbb 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1019,6 +1019,24 @@ DEF_HELPER_FLAGS_6(gvec_bfmlal, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(gvec_bfmlal_idx, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_sclamp_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sclamp_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sclamp_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sclamp_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_uclamp_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_uclamp_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_uclamp_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a9e48f07b4..14b3a69c36 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1695,3 +1695,8 @@ PSEL            00100101 .. 1 100 .. 01 .... 0 .... 0 ....  \
                 @psel esz=2 imm=%psel_imm_s
 PSEL            00100101 .1 1 000 .. 01 .... 0 .... 0 ....  \
                 @psel esz=3 imm=%psel_imm_d
+
+### SVE clamp
+
+SCLAMP          01000100 .. 0 ..... 110000 ..... .....          @rda_rn_rm
+UCLAMP          01000100 .. 0 ..... 110001 ..... .....          @rda_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9ed3b267fd..41f8b12259 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7478,3 +7478,105 @@ static bool trans_PSEL(DisasContext *s, arg_psel *a)
     tcg_temp_free_ptr(ptr);
     return true;
 }
+
+static void gen_sclamp_i32(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_i32 a)
+{
+    tcg_gen_smax_i32(d, a, n);
+    tcg_gen_smin_i32(d, d, m);
+}
+
+static void gen_sclamp_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 a)
+{
+    tcg_gen_smax_i64(d, a, n);
+    tcg_gen_smin_i64(d, d, m);
+}
+
+static void gen_sclamp_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                           TCGv_vec m, TCGv_vec a)
+{
+    tcg_gen_smax_vec(vece, d, a, n);
+    tcg_gen_smin_vec(vece, d, d, m);
+}
+
+static void gen_sclamp(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                       uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop[] = {
+        INDEX_op_smin_vec, INDEX_op_smax_vec, 0
+    };
+    static const GVecGen4 ops[4] = {
+        { .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_b,
+          .opt_opc = vecop,
+          .vece = MO_8 },
+        { .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_h,
+          .opt_opc = vecop,
+          .vece = MO_16 },
+        { .fni4 = gen_sclamp_i32,
+          .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_s,
+          .opt_opc = vecop,
+          .vece = MO_32 },
+        { .fni8 = gen_sclamp_i64,
+          .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_d,
+          .opt_opc = vecop,
+          .vece = MO_64,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64 }
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &ops[vece]);
+}
+
+TRANS_FEAT(SCLAMP, aa64_sme, gen_gvec_fn_arg_zzzz, gen_sclamp, a)
+
+static void gen_uclamp_i32(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_i32 a)
+{
+    tcg_gen_umax_i32(d, a, n);
+    tcg_gen_umin_i32(d, d, m);
+}
+
+static void gen_uclamp_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 a)
+{
+    tcg_gen_umax_i64(d, a, n);
+    tcg_gen_umin_i64(d, d, m);
+}
+
+static void gen_uclamp_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                           TCGv_vec m, TCGv_vec a)
+{
+    tcg_gen_umax_vec(vece, d, a, n);
+    tcg_gen_umin_vec(vece, d, d, m);
+}
+
+static void gen_uclamp(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                       uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop[] = {
+        INDEX_op_umin_vec, INDEX_op_umax_vec, 0
+    };
+    static const GVecGen4 ops[4] = {
+        { .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_b,
+          .opt_opc = vecop,
+          .vece = MO_8 },
+        { .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_h,
+          .opt_opc = vecop,
+          .vece = MO_16 },
+        { .fni4 = gen_uclamp_i32,
+          .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_s,
+          .opt_opc = vecop,
+          .vece = MO_32 },
+        { .fni8 = gen_uclamp_i64,
+          .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_d,
+          .opt_opc = vecop,
+          .vece = MO_64,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64 }
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &ops[vece]);
+}
+
+TRANS_FEAT(UCLAMP, aa64_sme, gen_gvec_fn_arg_zzzz, gen_uclamp, a)
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 9a9c034e36..f59d3b26ea 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2690,3 +2690,27 @@ void HELPER(gvec_bfmlal_idx)(void *vd, void *vn, void *vm,
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+#define DO_CLAMP(NAME, TYPE) \
+void HELPER(NAME)(void *d, void *n, void *m, void *a, uint32_t desc)    \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {                        \
+        TYPE aa = *(TYPE *)(a + i);                                     \
+        TYPE nn = *(TYPE *)(n + i);                                     \
+        TYPE mm = *(TYPE *)(m + i);                                     \
+        TYPE dd = MIN(MAX(aa, nn), mm);                                 \
+        *(TYPE *)(d + i) = dd;                                          \
+    }                                                                   \
+    clear_tail(d, opr_sz, simd_maxsz(desc));                            \
+}
+
+DO_CLAMP(gvec_sclamp_b, int8_t)
+DO_CLAMP(gvec_sclamp_h, int16_t)
+DO_CLAMP(gvec_sclamp_s, int32_t)
+DO_CLAMP(gvec_sclamp_d, int64_t)
+
+DO_CLAMP(gvec_uclamp_b, uint8_t)
+DO_CLAMP(gvec_uclamp_h, uint16_t)
+DO_CLAMP(gvec_uclamp_s, uint32_t)
+DO_CLAMP(gvec_uclamp_d, uint64_t)
-- 
2.34.1

