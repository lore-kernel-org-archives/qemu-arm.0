Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1267119lfm;
        Wed, 17 Jun 2020 21:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztQggM8dw/DqBt2B6XW5b7XfalIb6GVDiwHLS+DaYH0s6iekyGqtv7E/5dGghptPcDYBXH
X-Received: by 2002:a25:d791:: with SMTP id o139mr3486874ybg.97.1592455216956;
        Wed, 17 Jun 2020 21:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455216; cv=none;
        d=google.com; s=arc-20160816;
        b=Wmc1R24+GlS+xpab7xxh73wqUGmUgNP26HhELwrZA006lLQk/9QdVBW6RWGvDxG5AL
         C3EWTGuew3vLj8+QD3oVZzUiaoBCkB6XOroqlbTuwkDRV4Ua/Fd6tD35AQG3C96reqn3
         IsT+ToAGeSW22vcEjtdcK1NFAY+bSvspX/9tFyEXOtMgBI77Xd0BiLstXvILVbnIOb0x
         0gWn6sldsxYGpzF2U7o8Wgoq0Ps1V1JXcnp7GSOQsg9BKG37MilCo9fwtBRhFSGkOVTO
         cW2KQNHIFJ15LEpM2zkM3YDLUn5lPN1lfeFDUaKqzGzAkUPN7j6waWhtuUjBQddoM/Jb
         jUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1Ect+RfbwRQE+SaGPuscMfM1jXM7V1K7psi0bTt1xSE=;
        b=hFDhE/2q4hVddMKt/4ek4rX1qzcZR2WroLySU3QwwZBdvaKa7ivLOu6GV5amx7QQz6
         No2tgPDudcEcHxnE4m6g9x2Caj6ej5o8jzQ6vI03nbf/Pa9QGqurPZGgthYpRnXg2pp/
         O2+5syuEOKjE3QGea9HlvNio+uuB/+0fjhpE1DFVQ1j2NFhQs8F+nWFXDTiaUZoDwpDw
         RYoW90SpETRFQjDNwcBMbvPnJDYdgN1ua167f8yPj8qhB7OXU0mi2bC/VYfh8bSz3TiS
         I4kyJyLdWsHC4TxtQEtPHemnBHuNoufDXgBXY5k8rXfNveyCu5Wkr3fUkvSk1NFHN0Ra
         Ttgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dnh3Cy20;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si1472202ybk.106.2020.06.17.21.40.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:40:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dnh3Cy20;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmLY-0003Jn-6m
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmAB-0004rW-1R
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:28:31 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmA7-0002Yi-QE
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:28:30 -0400
Received: by mail-pf1-x444.google.com with SMTP id 23so2176031pfw.10
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Ect+RfbwRQE+SaGPuscMfM1jXM7V1K7psi0bTt1xSE=;
 b=dnh3Cy20b/wvE4ejWxOxkh3QvgQWJUc/oz4Bde6UpDEuLvIGnYyD+vuJtE6NPPEBjd
 nDuBZOlbdDOhNango3AM6ml3rP0k4h0UShNPpEyO2Pvbk8ekc/y5Fq6ibxl7CbXf3a9X
 lkLXd9sZoWtz2gtB2HiNQ/WyMv4wPxVxkCDABXObN//os5l1gIEv1CmnyPs5ic1I82dx
 0doQ4CjCz6uJiFuDfLvaIod80FEAnQoIiKXPQsZ95/5im9d01R7Xq/pa8i6SIb6S7WJ5
 sdKK1KSl82CzkRZx1PvkPU/diDASdSahT20SXohknC6uZWaAYnWJ+nva0GNEnMtFoQge
 1aMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Ect+RfbwRQE+SaGPuscMfM1jXM7V1K7psi0bTt1xSE=;
 b=Ilgin6SLDyDJlB2sms6UnZWQJ1RhGd84lifTtS4/NChWOUu3HfHf8VtPovA2Kn0ggc
 ZAJ9imMM6bDgz6rYBsQCofhxNGD2V5Yje0lzJSrWfBM1aaXqE0Ex2fT2XqJMR+bdWfbf
 Mtm8vB8Y/QM9cxEItOS3oz0LAzUnD819cFxGWoE0oeWKAFbPal/r2D9Di/fmKe5nPCGi
 7zozWWabYwBMMDXJL9av09taFjRmaoGsBP1yV3H95MIg3xxQJNsMgWdlxRmYY7VEmVhj
 /hbIDwh9o9Tll1Ya9HmueDzPMReB5WB0Jc0MAlq/LmkcsBQ4kqjyMeJhCNHAgaBB/WtJ
 tW1A==
X-Gm-Message-State: AOAM532kn3SU3jbzfP6qM9MRBWSdeca2g6Acz7bKYk77IlXUQq0iMdTM
 auk1tMbP6hnIlzX2LUIqjv7LLw==
X-Received: by 2002:a63:9dcd:: with SMTP id i196mr1780437pgd.378.1592454503898; 
 Wed, 17 Jun 2020 21:28:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l134sm1154412pga.50.2020.06.17.21.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:28:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 027/100] target/arm: Implement SVE2 integer multiply long
Date: Wed, 17 Jun 2020 21:25:31 -0700
Message-Id: <20200618042644.1685561-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
X-TUID: 0AddmaO+UOjJ

Exclude PMULL from this category for the moment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 15 +++++++++++++++
 target/arm/sve.decode      |  9 +++++++++
 target/arm/sve_helper.c    | 31 +++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  9 +++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index e662191767..cb1d4f2443 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1859,4 +1859,19 @@ DEF_HELPER_FLAGS_6(sve_stdd_le_zd, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_stdd_be_zd, TCG_CALL_NO_WG,
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
index 71babd2fad..32370d7b76 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1199,3 +1199,12 @@ SSUBWB          01000101 .. 0 ..... 010 100 ..... .....  @rd_rn_rm
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
index 87b637179b..cb2c425104 100644
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
index fed7774c1e..0712a25de7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5587,6 +5587,15 @@ DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
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

