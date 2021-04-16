Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp729608lfr;
        Fri, 16 Apr 2021 14:09:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAyJDnFJQVq29hZKeexPH1aEcZ7zZDMenc5Xo2+W2MLFIIpO39HEXvyJjZ4rqqgLZMVxLS
X-Received: by 2002:a67:7c7:: with SMTP id 190mr4005399vsh.19.1618607339980;
        Fri, 16 Apr 2021 14:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607339; cv=none;
        d=google.com; s=arc-20160816;
        b=PNHyr02zxqyR1rAmyBAwyqnj4W4zqVJzuIDnp9b/AmK6dn3RlAZHoExgNJF4f0Mr3h
         aGfTr/EAwtlqXcVT7Hm5P3tiotcWgNzKeNTxyHHuUANOn7RD7dV/Erd11pPrGZDP66xk
         JvTxCwlK2jX9lBY6urfzpPqj4XAsPIJLfhK5ivspBCqaEvrPm9TGd7Evzr5dF1Mf98u3
         vwu77Ouv7iUuHXYlJ7luYqLSczfY4jxDr26nRUmGIM/xG3T9Scw5WSwJyaNU1GA+DaeY
         0FECxvHGvd+U2/960evyX9seoBExIjtkq+0DY0WOKEsy53POinN7jxEf3QCgUjA8qbCj
         CXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9m49cTBF+uBd2parMcxDIMwzzkCg+x47RKDDIpkpN1g=;
        b=Y4qcC7vfUYTcElUx9RDNS2IjRrGuipQdrLauFqat1cZNam7Xv3UWsVVPqe617ua8sa
         R8ZC51I2yGsRN2ggPSzrhV1RkxpR+2uBEAmYK079oerbYnaB+Gq3CAMW7CdQq8vWJAeH
         a4Ad09K513Ed5afH3OrLF6V1suDAXY3Y4kwPB5RdCLKqatGymUUMkFRKjV2QYg4bcQJr
         zVzQui4AKR5WP6qMps68suYusu8ZF2JjrrsiS4dS5JnHgkq/Fltf2PtfxaNeLFmCGQlp
         SMOmcGYzpbY30mW5egWCdrxZPb4plIbbllnx7LomX6l4ZLGTfxEHP3p75vQyAtCT9Api
         ynvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xi4NwC50;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si3257205uaq.222.2021.04.16.14.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xi4NwC50;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVhz-0003do-8W
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcD-0004BP-MW
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:01 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc9-00016N-IG
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:01 -0400
Received: by mail-pl1-x630.google.com with SMTP id u7so12821535plr.6
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9m49cTBF+uBd2parMcxDIMwzzkCg+x47RKDDIpkpN1g=;
 b=xi4NwC50Lb79a1r63NrPsrhBzjr4a4VBz4Tv8hhJXZMc5wQYgU5ie0PDEy0uKqV0+1
 tVmeP+SVx0a7opzdI7o6PNth8aGdJhN6iTgokD9CduPYzJJVbO2oJRq4Jx3lcOMH5jS4
 nx5xXIpUuNQ0HJb5rw+TY4lyPWq0slQMKrOZ9mauVR/8JNRJkV67IgcAGVPuODMPFomb
 3dPZ8JemwEosIszcs4SvnAsZiE+K/+0yOtJNw1v+/mroPxOO+4wzg+qoJAkAkx8mdqiY
 5RgGOpz19p+xlWE1O6CELnwgNkBx3BAKHonMoS3MnmImcOCim31CLlAWJEaNhyji4tWM
 O3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9m49cTBF+uBd2parMcxDIMwzzkCg+x47RKDDIpkpN1g=;
 b=nrP6061J3yceufc5CS3CAufe2yqybG29qAFIvv3ZLZV4HFVUUU4KzeVxNAq0o8wM1o
 RAviQV6RK3NTxygiJMMfA/z2dtPNu0xcQ8tgd0iwjlZcciobYAjnV2/O73n7hXSgBK8T
 cBzOElx3aCqNX5hQ0CwJvYieR9ab+wvJzrdNgPCOzacU0793LCwVgicJj/eOi09GJNdG
 zrDUpgWkVAjnaWltJmIzXW37ntJ+eWnQSO0SMR/iWsBFumNyISggQ5eBMAAiRKzaPuSj
 aUYgkI2/DSKeILoqkSTckUrrOce9YpXA0iEl/tprCxh23N66y1WXKgwIaQT+HStzPBJ1
 QCXA==
X-Gm-Message-State: AOAM531oCL0a2PFfIosijMO482pEMg5wg1hYopA9d9LltbjO1tZNDRRt
 V5t86pellR8GS/uy67yl6z6XN3twcKCBvg==
X-Received: by 2002:a17:90b:4a07:: with SMTP id
 kk7mr11473953pjb.165.1618606975971; 
 Fri, 16 Apr 2021 14:02:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/81] target/arm: Implement SVE2 integer multiply long
Date: Fri, 16 Apr 2021 14:01:32 -0700
Message-Id: <20210416210240.1591291-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ltjkM+kxmrKL

Exclude PMULL from this category for the moment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 15 +++++++++++++++
 target/arm/sve.decode      |  9 +++++++++
 target/arm/sve_helper.c    | 31 +++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  9 +++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3286a9c205..ad8121eec6 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2347,4 +2347,19 @@ DEF_HELPER_FLAGS_6(sve_stdd_le_zd_mte, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_stdd_be_zd_mte, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f6f21426ef..d9a72b7661 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1196,3 +1196,12 @@ SSUBWB          01000101 .. 0 ..... 010 100 ..... .....  @rd_rn_rm
 SSUBWT          01000101 .. 0 ..... 010 101 ..... .....  @rd_rn_rm
 USUBWB          01000101 .. 0 ..... 010 110 ..... .....  @rd_rn_rm
 USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
+
+## SVE2 integer multiply long
+
+SQDMULLB_zzz    01000101 .. 0 ..... 011 000 ..... .....  @rd_rn_rm
+SQDMULLT_zzz    01000101 .. 0 ..... 011 001 ..... .....  @rd_rn_rm
+SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
+SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
+UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
+UMULLT_zzz      01000101 .. 0 ..... 011 111 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index cf0dbb3987..f30f3722af 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1154,6 +1154,37 @@ DO_ZZZ_TB(sve2_uabdl_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
 DO_ZZZ_TB(sve2_uabdl_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
 DO_ZZZ_TB(sve2_uabdl_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
+DO_ZZZ_TB(sve2_smull_zzz_h, int16_t, int8_t, H1_2, H1, DO_MUL)
+DO_ZZZ_TB(sve2_smull_zzz_s, int32_t, int16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZ_TB(sve2_smull_zzz_d, int64_t, int32_t,     , H1_4, DO_MUL)
+
+DO_ZZZ_TB(sve2_umull_zzz_h, uint16_t, uint8_t, H1_2, H1, DO_MUL)
+DO_ZZZ_TB(sve2_umull_zzz_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZ_TB(sve2_umull_zzz_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
+
+/* Note that the multiply cannot overflow, but the doubling can. */
+static inline int16_t do_sqdmull_h(int16_t n, int16_t m)
+{
+    int16_t val = n * m;
+    return DO_SQADD_H(val, val);
+}
+
+static inline int32_t do_sqdmull_s(int32_t n, int32_t m)
+{
+    int32_t val = n * m;
+    return DO_SQADD_S(val, val);
+}
+
+static inline int64_t do_sqdmull_d(int64_t n, int64_t m)
+{
+    int64_t val = n * m;
+    return do_sqadd_d(val, val);
+}
+
+DO_ZZZ_TB(sve2_sqdmull_zzz_h, int16_t, int8_t, H1_2, H1, do_sqdmull_h)
+DO_ZZZ_TB(sve2_sqdmull_zzz_s, int32_t, int16_t, H1_4, H1_2, do_sqdmull_s)
+DO_ZZZ_TB(sve2_sqdmull_zzz_d, int64_t, int32_t,     , H1_4, do_sqdmull_d)
+
 #undef DO_ZZZ_TB
 
 #define DO_ZZZ_WTB(NAME, TYPEW, TYPEN, HW, HN, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 70900c122f..19a1f289d8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6021,6 +6021,15 @@ DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
 
+DO_SVE2_ZZZ_TB(SQDMULLB_zzz, sqdmull_zzz, false, false)
+DO_SVE2_ZZZ_TB(SQDMULLT_zzz, sqdmull_zzz, true, true)
+
+DO_SVE2_ZZZ_TB(SMULLB_zzz, smull_zzz, false, false)
+DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
+
+DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
+DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
+
 #define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
 static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
 {                                                               \
-- 
2.25.1

