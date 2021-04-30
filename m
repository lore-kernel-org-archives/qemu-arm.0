Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp476763lfg;
        Fri, 30 Apr 2021 13:41:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkQO5Chyl5y0MUjCKcdTe9wm5L/FmYCUCuB1+gxoPyPj77YDzZwutxJASwyoiR1F+HQ1ZK
X-Received: by 2002:a6b:6b15:: with SMTP id g21mr5667033ioc.28.1619815262317;
        Fri, 30 Apr 2021 13:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619815262; cv=none;
        d=google.com; s=arc-20160816;
        b=AFogSeXlZd78jA55KnWYR0Up77dXBriZm+9ld56soPHiAnxYmstNPDDQU7pQLN+G2u
         KJ8OFt+dSK3b8v+da/EYHsAkkqBcM28eb5cLc4LS3eEGNRncahsrS0Hw/j7pK+89uUye
         7GrhpkUvCvWxiymv8nUQiW0sVg6dr9T3CJTxuxUwuvfNYxbetl2LdWzAkGvrVRT7j0rb
         ptAmZ/AGenwHXCwdhTedqpiAzPJhq/CxBFc55STUjJxIARhUGIMiqUGwGDOOi4imCX4B
         Ldnyipu6+sc8JK47VRMrbnA7rpSJqZg3jRD7uAPOK8AasvNenZfWf5FKq//LeADptCs1
         stMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9m49cTBF+uBd2parMcxDIMwzzkCg+x47RKDDIpkpN1g=;
        b=g/P3wXdc8ik1G5Dw3BOdN34zKRBr57fZb1tSMIpSHqXW6jnnTj61j6w3CWd0oLfnn+
         sC/sQcLv9pzoqMrM7u8Z0wvLKA53U6SUkaTNVnU4YibbrBgVT5NRqi4bLa3wMf2oDMAs
         yPQ7HH91kfvCBcJrCItV96z7xRB+BroGnnLa9ajhPwIfuBesCVZxM/6XEkHmwsorFw8T
         aL3at1Hzvuh6V6TuT4Mf5VrPPWbSP27hzm7HSawuVxJHZ5kGfKHgn3fwgFmAI9hT0RlD
         htCekISxANUyLyRtK6f19WjB9l0gXbdvlVgEJp13pwg1qjOpkP8v1KYh/14xD5yWrW6q
         bUgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bTQ4Ck02;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si3284473ilh.58.2021.04.30.13.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bTQ4Ck02;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZwb-0008Eb-JC
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiZ-0008QU-AS
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:31 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiO-00060j-I2
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:31 -0400
Received: by mail-pf1-x429.google.com with SMTP id i13so2278623pfu.2
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9m49cTBF+uBd2parMcxDIMwzzkCg+x47RKDDIpkpN1g=;
 b=bTQ4Ck02Aw/OMBO5R8SyMjU/NpjP6dsW7h9DcK/IzMVSegdn0V7u0h30oa4IuRuYF1
 WDyxUOhVBjrLK1ynXU2dZDS3LzEaRcF5tJPK/xReR5cFrBmk0+quTWVGIy4UdwOqSwkd
 pUBVpFrVHsxtB3z+GgPW1IDJJuE3wIheB5TD5xI1sUDCUjMCnDZhRW1gOC2Tn5w1mZYp
 kbbojrsAVGdWuf7di76a6EpoW237xqu972Yd6QoT7dOQ2PHqqR4TjnJJ08TGXhMFikrP
 aktyDM49hHSHof8d+g5j12GCDcXzq83Kr+MqJIm9NlmP/eQY4zpakScgLkLFlKSCzMGZ
 K15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9m49cTBF+uBd2parMcxDIMwzzkCg+x47RKDDIpkpN1g=;
 b=OGyySSOTpD1ekN0rN2+K8raTDyvnbCD3amXIJgPrMQcWzEz0LmrsYbtT0ymzfDUgmf
 WKqcqSuKI3LNWaY9jv6uQYFncGus9l0ErVxSq48VmvXRaOCp6GbywtL8lmzYFef2gdku
 2X4qw0JMCVA3HASj17zM6taFngpron1yzlvxQ3MM/5GuXbF+EA9vaoHxcZLqhjO9exmg
 q+ftOXL+dqYHrx8b+LrBIwr9iOiKLhcPZF3mfShhBpXBiJIrFUgBpUujawd6AWbfWpmq
 Dq/4ejU0VHSsRwB7dxPsUmdjZYFQHis12mfIzne91C0cz33o7wGGnaW47Lnno8Hw2Mmk
 TjlA==
X-Gm-Message-State: AOAM530IagRK9/LPKeZTBN5sImvrc77IjoWERVDx3g7Kbn9LpEjKappY
 JqkmR9/KSesZFimuPMvQ/n8RISsVOuYFPg==
X-Received: by 2002:a65:4985:: with SMTP id r5mr6205596pgs.65.1619814379125;
 Fri, 30 Apr 2021 13:26:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 13/82] target/arm: Implement SVE2 integer multiply long
Date: Fri, 30 Apr 2021 13:25:01 -0700
Message-Id: <20210430202610.1136687-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: LQiotZUpwfCf

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

