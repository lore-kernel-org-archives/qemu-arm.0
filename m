Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp933019njk;
        Fri, 24 Jan 2025 08:39:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUz2ys67SjPwAY6XS+Z1SmKM3Y21u8S9h2XaQ0s8eCfz+xcZvCzKXj7MsI1JRjPjDmKwj529FuZPPWrVw==@linaro.org
X-Google-Smtp-Source: AGHT+IF6EQlF1ufw8MvF9uhcQ7G+8BQhJD+ZRzEwCN5WU7EN4XOEgQx+zI9bEyuSgAbeFJ3cZ6x1
X-Received: by 2002:a05:6122:885:b0:515:f586:5298 with SMTP id 71dfb90a1353d-51d5b2cbc82mr27727964e0c.7.1737736771950;
        Fri, 24 Jan 2025 08:39:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736771; cv=none;
        d=google.com; s=arc-20240605;
        b=J14U2nIsbXMdBn+HZkwqlVy3ZP4m+WTubgurvD+XAD3sPZqlVOjBct30xrUcbtniq2
         Xiv7kdAiLaR95zShjNMGZZkIzsTwCKdiOf8LdyjgGbTJSUkiAphYNeWSwBfR5Q1WQhpK
         XiWT5ev4LZb+17/5pYaCx4fqbK0vDRU7YiIUyBP+vcxN3PDIgfZTErohPId8JlxsZ0y8
         CVNlfSWWLWAzfvjAE9r0rI2uKtNWH7iUbcNPEVINbu2qJDJi+I9u7/ZWArKFjjn2gOCm
         d+w+qXR0Y/L3dpIBxU1X9qIA7YVB17R/du4LsVWdZP4D8dOfm1z4iXcb+nV5ZKkJ23ZR
         5bgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hq2s3IXVV8PkzL3MODbSyRBZT7eZFQL8olH5eQca4yA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=K2TpfBsq1AZVZutAPVzbi3NJ6MVUU6TkubqZuSnt153HyR5Cn6xG392MSp50zFaGQB
         fbH2xPR4P3wRTBVyqaUXo5vdxng+rKcXkjz3qDEu40JKjLIqkrFtD49PIskZTzGh2omt
         SuuA2qrdBRxVdLiWjMOGBSd5CA0/2lSXvHdfT/sjDzIfP//l3VwC+qcf/Dc0OU+Ayeoi
         +gXnH6w7sSBbKqeYwocEFO0dpk8RAvU1l73dh2ex5SyzmXM0HSr1yQT1rqGZnar7nA7c
         MVEUiGIp3qwXJ+/fo9cGGtfFnRhnD7JwPbJCmeqRxzew3YUqn7qWKolXtTjXmdG+aTFx
         2xZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IvSPd9vf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51e4ea7c99esi961841e0c.72.2025.01.24.08.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:39:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IvSPd9vf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMcm-0005xg-Cq; Fri, 24 Jan 2025 11:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYz-0005fP-08
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:50 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYw-0005iJ-0Z
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:43 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43618283dedso23829865e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736180; x=1738340980; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hq2s3IXVV8PkzL3MODbSyRBZT7eZFQL8olH5eQca4yA=;
 b=IvSPd9vf3cVr84dN8fnre8/vha11vLqMZsA6ND8brcC7+tB8dmY5T5RxMMIFaZaEUO
 SihFRzsxNi7LZnHuAsN6qp8fHxLsMLo2e3fC+7RTTz+dX6qidPmqiV9Vj/xhBAcLiDTe
 Bg8AmDnn5Gdek+E1hjQHjWOMBUx64IBX58OI0bLje7itHjvseJigZA2E0wBV0JTUIwY9
 VsWprj7fruunwbfOR36lRwbOvvlYgZVL/FBvwmft2WS1Lc3vsC20iCAJuuz9jT1wvytk
 wsdD8RRGDg2B9c2H4JswsKW2oZhLmhkho5BfO8zvcQBQsWTrhNFgOAA3i5PeoVb2PLd8
 wpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736180; x=1738340980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hq2s3IXVV8PkzL3MODbSyRBZT7eZFQL8olH5eQca4yA=;
 b=CysSgmhUsZ/O4nzdz+lyI0+uhbunDYqsXYSXdFfRsIXUImeM74sr3ssQ5cnvXOBF/n
 fxz7sBvfrXv7HHsFm5+zT/YRDYUJmjh+VaOMS4GLyoVj7Kq0eLgG5ZRYV+fofeDaXkAK
 5g2HPyLySlzoO67HzKYfEKF8+hm6zjV7J5wmp26WGPNFveizg5e3cCTYdr0I/ZoMXumK
 V1cnaEqwG7VutaWJMmpORd6FNFXJizAfeA2oQ+uHB+7IBw6qpS+njzXqc4LDNXc9ZHX+
 CgPg6AY+0JK5FQVLLNcH/C7T22vwJCl7AoXkLEPlPBDx+PqrIrYHCFT+CyziNVyI0sKd
 uHmA==
X-Gm-Message-State: AOJu0YwrfnOviiVod0L005oCTvN4cNWbHws2n0tQCr7xZaUayY0moh7G
 JJAJXAZCCDjOttAY+6NaWGNoJ7tpD7vZ+ovOsVKSDQLu6Ecot1/i1BU9kgFskUWYZ1ZalEiAP4K
 Q
X-Gm-Gg: ASbGncvs0sZIKLAgOORSGD9OjJZaDjtdxQeV8YZvuFZRmwQuVkIrJSLFDRb4yMtIY+k
 KbW7qGhQkNgcSg9NDaEOLbmUhsZkYhFX3Sv92mLhacSmhEpeT8CqX4nIqaVn63OuhMeFg3YKcos
 OKwRhZ6Yma/nJDIVmO60bvd1Yao1zV1jV8n3108Uj6+vzrgq2IGGBwnG72QCNzDJJeVcTZoJodA
 jc3Sx+y/TVJLqviBpiUFM1FHceCaL7jgqUkmKMZ/T2t33w1uaAG5z87atzxgdx3k1gMygatNvvk
 AqiDq4iE6i4=
X-Received: by 2002:a05:600c:c0f:b0:42c:c28c:e477 with SMTP id
 5b1f17b1804b1-4389141c0a9mr263090115e9.23.1737736180490; 
 Fri, 24 Jan 2025 08:29:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 50/76] target/arm: Implement FPCR.AH semantics for SVE
 FMIN/FMAX immediate
Date: Fri, 24 Jan 2025 16:28:10 +0000
Message-Id: <20250124162836.2332150-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: vVYU/84K7sJs

Implement the FPCR.AH semantics for the SVE FMAX and FMIN operations
that take an immediate as the second operand.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 14 ++++++++++++++
 target/arm/tcg/sve_helper.c    |  8 ++++++++
 target/arm/tcg/translate-sve.c | 25 +++++++++++++++++++++++--
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 7ca95b8fa94..3c1d2624ed4 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -1231,6 +1231,20 @@ DEF_HELPER_FLAGS_6(sve_fmins_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fmins_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i64, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_ah_fmaxs_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmaxs_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmaxs_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+
+DEF_HELPER_FLAGS_6(sve_ah_fmins_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmins_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmins_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, fpst, i32)
+
 DEF_HELPER_FLAGS_5(sve_fcvt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(sve_fcvt_dh, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 3631d85f23a..2f6fc82ee4f 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4459,6 +4459,14 @@ DO_ZPZS_FP(sve_fmins_h, float16, H1_2, float16_min)
 DO_ZPZS_FP(sve_fmins_s, float32, H1_4, float32_min)
 DO_ZPZS_FP(sve_fmins_d, float64, H1_8, float64_min)
 
+DO_ZPZS_FP(sve_ah_fmaxs_h, float16, H1_2, helper_vfp_ah_maxh)
+DO_ZPZS_FP(sve_ah_fmaxs_s, float32, H1_4, helper_vfp_ah_maxs)
+DO_ZPZS_FP(sve_ah_fmaxs_d, float64, H1_8, helper_vfp_ah_maxd)
+
+DO_ZPZS_FP(sve_ah_fmins_h, float16, H1_2, helper_vfp_ah_minh)
+DO_ZPZS_FP(sve_ah_fmins_s, float32, H1_4, helper_vfp_ah_mins)
+DO_ZPZS_FP(sve_ah_fmins_d, float64, H1_8, helper_vfp_ah_mind)
+
 /* Fully general two-operand expander, controlled by a predicate,
  * With the extra float_status parameter.
  */
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index effa23cefd7..214aec7f83b 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3821,14 +3821,35 @@ static bool do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
     TRANS_FEAT(NAME##_zpzi, aa64_sve, do_fp_imm, a,                     \
                name##_const[a->esz][a->imm], name##_fns[a->esz])
 
+#define DO_FP_AH_IMM(NAME, name, const0, const1)                        \
+    static gen_helper_sve_fp2scalar * const name##_fns[4] = {           \
+        NULL, gen_helper_sve_##name##_h,                                \
+        gen_helper_sve_##name##_s,                                      \
+        gen_helper_sve_##name##_d                                       \
+    };                                                                  \
+    static gen_helper_sve_fp2scalar * const name##_ah_fns[4] = {        \
+        NULL, gen_helper_sve_ah_##name##_h,                             \
+        gen_helper_sve_ah_##name##_s,                                   \
+        gen_helper_sve_ah_##name##_d                                    \
+    };                                                                  \
+    static uint64_t const name##_const[4][2] = {                        \
+        { -1, -1 },                                                     \
+        { float16_##const0, float16_##const1 },                         \
+        { float32_##const0, float32_##const1 },                         \
+        { float64_##const0, float64_##const1 },                         \
+    };                                                                  \
+    TRANS_FEAT(NAME##_zpzi, aa64_sve, do_fp_imm, a,                     \
+               name##_const[a->esz][a->imm],                            \
+               s->fpcr_ah ? name##_ah_fns[a->esz] : name##_fns[a->esz])
+
 DO_FP_IMM(FADD, fadds, half, one)
 DO_FP_IMM(FSUB, fsubs, half, one)
 DO_FP_IMM(FMUL, fmuls, half, two)
 DO_FP_IMM(FSUBR, fsubrs, half, one)
 DO_FP_IMM(FMAXNM, fmaxnms, zero, one)
 DO_FP_IMM(FMINNM, fminnms, zero, one)
-DO_FP_IMM(FMAX, fmaxs, zero, one)
-DO_FP_IMM(FMIN, fmins, zero, one)
+DO_FP_AH_IMM(FMAX, fmaxs, zero, one)
+DO_FP_AH_IMM(FMIN, fmins, zero, one)
 
 #undef DO_FP_IMM
 
-- 
2.34.1

