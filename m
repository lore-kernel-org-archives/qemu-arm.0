Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5219570lfh;
        Thu, 2 Jun 2022 15:38:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/PFT/uWFbe6jWf05AwF79eCCF8OLaJxL5FpPdJkEV9YziiG1KH6kvb31y1Qd7G/8Axwl2
X-Received: by 2002:ad4:5aa3:0:b0:464:5ded:841e with SMTP id u3-20020ad45aa3000000b004645ded841emr13464816qvg.52.1654209526476;
        Thu, 02 Jun 2022 15:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654209526; cv=none;
        d=google.com; s=arc-20160816;
        b=b4piOPnn+xMiNK+7R066xQrzsYelFOpPd58jbVZKo8qLYaIb8Q3kmfA/kCEENiU6z/
         EO7qwPTBjOcVwPNJIxs9reCp+pRPX69N/1Xerjvd0X0BX/DBbLUCQy/Be7PI92+RZpi3
         eUWoNPuQQ7XYuYvKQiY1FszTJ8p8RzyIUtSmQx5EDuDeKiOmilX+J0MgmR/8UhuPWDCp
         16MxjZtTL6hXo5P4wZMFmQ6zacg3I+4GOF9khJFsL6JreliuQcvz14RUUGfoUDhwb717
         JVEdqKbsylLSA3S9QHro9SxbWmHXyq8opCqzOqCKnXcybnK5fvmkoUd5JfdoOBQ1Ubm8
         51Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v2OWlMDXUhVyLVgrCa1XT6Oie3T/J/YrHToI9tDWVqs=;
        b=omwAVS8pReymjkUXbrkFZmsENbSb7TsWLK2wg98RvEuL8OYmWSSzwdrF6RDV6LoYkQ
         c1UNjJlG4hTJT4hFj7dC1IvxepvLTC8iyyxn+zqPXn70YUeIbic9WqE1HXwmSW+7HM8O
         SjTs4gUkbK9yrmcXZZFTA9dk1nT8LjSGI1/qBL7l+oyiz6oksP/mj1MKgXHqdwQdeYeU
         //Izztq3+UCush1uojqRrvJvhgO7letaPWWJL/IlEU0Qm9Bys1+4p5ea6yTXc9zsPyw5
         T2lqqebYthBwmznLWAb075f7ICi7GjdCuQslEL5MahoJTTnQ/qktmta2F6Fx3l1Vmz38
         OuZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TDIHcX+Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020ad45dc2000000b00467cc31e9basi1210257qvh.427.2022.06.02.15.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:38:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TDIHcX+Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtSn-0000WX-SG
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskI-0001d8-3N
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:49 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskE-0000up-Ep
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id u18so5552431plb.3
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v2OWlMDXUhVyLVgrCa1XT6Oie3T/J/YrHToI9tDWVqs=;
 b=TDIHcX+YhcJv9QGBgBPMNTQWKRY1540ITeZ9jpxfcda0QMr2f/ZGbu0nsMvIoDhavr
 H1PQKZrHIfFm5JSK+a+2w4g9a1DP5MVe4EbwwnDjpHUvbCwhDwZ9hvu32XyfYzMoi9Zg
 9i0ryN9NUyBcXCNO6VP4jaUweEGWAKryC65Xs3YifRvRFk0R/vMYUtoVkF3WetQG8TGO
 BsEKfjx/Jk1WSclzoLLBBO8YeRJu8zppZKDQ37aA2Ayllq6cuz4KNZbtKmHli5U+hohD
 aSfccQneugCEULwBPXnf5PBzbx8awkoKIonc5Ltrigf51ExxNnGOnbSOh8l86IW9JekJ
 QDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v2OWlMDXUhVyLVgrCa1XT6Oie3T/J/YrHToI9tDWVqs=;
 b=XVVgrwrZKiATyili7q/HA2N+IDtu/q7mCTLMf7f3Um1HveV2YXYmOQxbYaHQ4xjdVS
 1+ntniISLVYmO17RZk69Ko7X4TqooLZWcvAbXZa/B0GbUhmW1eldfXUEeom+gLx5zrV3
 hsWOUs/ZxPZpTvx64Y1+THhnPoTFnmm0trV2Du0pMv9xOjHmvuxuW9kCI9sXVvofmodT
 gLQL0+zDlkZachR775+7lnq49E1wLuhV6W1DPfkHyutbtqq1UoU9+aj/e6cbSyhTJ8xi
 H5hf5t3P/42oI5lcdV8WDFj70i1gVE+hX3MAIGyBcWM9blzm/nGsxL8XSdUKMYIvfljW
 XPSg==
X-Gm-Message-State: AOAM531DP3QFsxtzMBvNjhtmwwcaH/617XXotktbC1PNJcXtlnsNE4QQ
 UalEsK1Rltp3RqE0AEKmBeAIJYih3fMN/g==
X-Received: by 2002:a17:902:f64f:b0:156:f1cc:b284 with SMTP id
 m15-20020a170902f64f00b00156f1ccb284mr6694383plg.147.1654206761064; 
 Thu, 02 Jun 2022 14:52:41 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 53/71] target/arm: Implement SME integer outer product
Date: Thu,  2 Jun 2022 14:48:35 -0700
Message-Id: <20220602214853.496211-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: TD1J3uX0VbBz

This is SMOPA, SUMOPA, USMOPA_s, UMOPA, for both Int8 and Int16.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    | 16 ++++++++
 target/arm/sme.decode      | 10 +++++
 target/arm/sme_helper.c    | 82 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 14 +++++++
 4 files changed, 122 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index ecc957be14..31562551ee 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -128,3 +128,19 @@ DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sme_bfmopa, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_smopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_umopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_sumopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_usmopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_smopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_umopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_sumopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_usmopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index e8d27fd8a0..628804e37a 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -76,3 +76,13 @@ FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
 BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_h         10000001 101 ..... ... ... ..... . 00 ..        @op_32
+
+SMOPA_s         1010000 0 10 0 ..... ... ... ..... . 00 ..      @op_32
+SUMOPA_s        1010000 0 10 1 ..... ... ... ..... . 00 ..      @op_32
+USMOPA_s        1010000 1 10 0 ..... ... ... ..... . 00 ..      @op_32
+UMOPA_s         1010000 1 10 1 ..... ... ... ..... . 00 ..      @op_32
+
+SMOPA_d         1010000 0 11 0 ..... ... ... ..... . 0 ...      @op_64
+SUMOPA_d        1010000 0 11 1 ..... ... ... ..... . 0 ...      @op_64
+USMOPA_d        1010000 1 11 0 ..... ... ... ..... . 0 ...      @op_64
+UMOPA_d         1010000 1 11 1 ..... ... ... ..... . 0 ...      @op_64
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 0807fbc708..cebddabbc7 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -1089,3 +1089,85 @@ void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
         } while (row & 15);
     }
 }
+
+typedef uint64_t IMOPFn(uint64_t, uint64_t, uint64_t, uint8_t, bool);
+
+static inline void do_imopa(uint64_t *za, uint64_t *zn, uint64_t *zm,
+                            uint8_t *pn, uint8_t *pm,
+                            uint32_t desc, IMOPFn *fn)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
+    bool neg = simd_data(desc);
+
+    for (row = 0; row < oprsz; ++row) {
+        uint8_t pa = pn[H1(row)];
+        uint64_t *za_row = &za[row * sizeof(ARMVectorReg)];
+        uint64_t n = zn[row];
+
+        for (col = 0; col < oprsz; ++col) {
+            uint8_t pb = pm[H1(col)];
+            uint64_t *a = &za_row[col];
+
+            *a = fn(n, zm[col], *a, pa & pb, neg);
+        }
+    }
+}
+
+#define DEF_IMOP_32(NAME, NTYPE, MTYPE) \
+static uint64_t NAME(uint64_t n, uint64_t m, uint64_t a, uint8_t p, bool neg) \
+{                                                                           \
+    uint32_t sum0 = 0, sum1 = 0;                                            \
+    /* Apply P to N as a mask, making the inactive elements 0. */           \
+    n &= expand_pred_b(p);                                                  \
+    sum0 += (NTYPE)(n >> 0) * (MTYPE)(m >> 0);                              \
+    sum0 += (NTYPE)(n >> 8) * (MTYPE)(m >> 8);                              \
+    sum0 += (NTYPE)(n >> 16) * (MTYPE)(m >> 16);                            \
+    sum0 += (NTYPE)(n >> 24) * (MTYPE)(m >> 24);                            \
+    sum1 += (NTYPE)(n >> 32) * (MTYPE)(m >> 32);                            \
+    sum1 += (NTYPE)(n >> 40) * (MTYPE)(m >> 40);                            \
+    sum1 += (NTYPE)(n >> 48) * (MTYPE)(m >> 48);                            \
+    sum1 += (NTYPE)(n >> 56) * (MTYPE)(m >> 56);                            \
+    if (neg) {                                                              \
+        sum0 = (uint32_t)a - sum0, sum1 = (uint32_t)(a >> 32) - sum1;       \
+    } else {                                                                \
+        sum0 = (uint32_t)a + sum0, sum1 = (uint32_t)(a >> 32) + sum1;       \
+    }                                                                       \
+    return ((uint64_t)sum1 << 32) | sum0;                                   \
+}
+
+#define DEF_IMOP_64(NAME, NTYPE, MTYPE) \
+static uint64_t NAME(uint64_t n, uint64_t m, uint64_t a, uint8_t p, bool neg) \
+{                                                                           \
+    uint64_t sum = 0;                                                       \
+    /* Apply P to N as a mask, making the inactive elements 0. */           \
+    n &= expand_pred_h(p);                                                  \
+    sum += (NTYPE)(n >> 0) * (MTYPE)(m >> 0);                               \
+    sum += (NTYPE)(n >> 16) * (MTYPE)(m >> 16);                             \
+    sum += (NTYPE)(n >> 32) * (MTYPE)(m >> 32);                             \
+    sum += (NTYPE)(n >> 48) * (MTYPE)(m >> 48);                             \
+    return neg ? a - sum : a + sum;                                         \
+}
+
+DEF_IMOP_32(smopa_s, int8_t, int8_t)
+DEF_IMOP_32(umopa_s, uint8_t, uint8_t)
+DEF_IMOP_32(sumopa_s, int8_t, uint8_t)
+DEF_IMOP_32(usmopa_s, uint8_t, int8_t)
+
+DEF_IMOP_64(smopa_d, int16_t, int16_t)
+DEF_IMOP_64(umopa_d, uint16_t, uint16_t)
+DEF_IMOP_64(sumopa_d, int16_t, uint16_t)
+DEF_IMOP_64(usmopa_d, uint16_t, int16_t)
+
+#define DEF_IMOPH(NAME) \
+    void HELPER(sme_##NAME)(void *vza, void *vzn, void *vzm, void *vpn,      \
+                            void *vpm, uint32_t desc)                        \
+    { do_imopa(vza, vzn, vzm, vpn, vpm, desc, NAME); }
+
+DEF_IMOPH(smopa_s)
+DEF_IMOPH(umopa_s)
+DEF_IMOPH(sumopa_s)
+DEF_IMOPH(usmopa_s)
+DEF_IMOPH(smopa_d)
+DEF_IMOPH(umopa_d)
+DEF_IMOPH(sumopa_d)
+DEF_IMOPH(usmopa_d)
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 847f2274b1..4aa0aff25c 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -337,3 +337,17 @@ TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst,
 
 /* TODO: FEAT_EBF16 */
 TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
+
+TRANS_FEAT(SMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_smopa_s)
+TRANS_FEAT(UMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_umopa_s)
+TRANS_FEAT(SUMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_sumopa_s)
+TRANS_FEAT(USMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_usmopa_s)
+
+TRANS_FEAT(SMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_smopa_d)
+TRANS_FEAT(UMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_umopa_d)
+TRANS_FEAT(SUMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_sumopa_d)
+TRANS_FEAT(USMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_usmopa_d)
-- 
2.34.1

