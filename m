Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1144568njb;
        Sat, 1 Feb 2025 08:46:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW4a9tILpa6RHaVwhaaBfStBi1hkxISI0UI73f1H/ZRFYsK3TqzMVmghH0vaSY4lK72G/Ha7Xz9fD6ZmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IELVyleyydKG9dBW4gEZ9DYTZdbcZSu2MKEJlBzTz47EKELXLoiV4iIQrF3ZyulfZWDHbtj
X-Received: by 2002:a05:622a:2b07:b0:46e:2a18:939d with SMTP id d75a77b69052e-46fdd36eedfmr196443221cf.11.1738428387012;
        Sat, 01 Feb 2025 08:46:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428386; cv=none;
        d=google.com; s=arc-20240605;
        b=flndPWWlARMfmz+wbRoskKKRE0W7oygLknD1noy3waPZPk05i1ZIDIwbFQ/um5wvB9
         18RyQv8lKcx/uqWB7uxkTfzrVsQaqkM3tFoX41tOOUQ71/8BzPt5eN22HeG5ISSQIjid
         MsxZbJwAHnDZRZQL0V/IBZzZL/gTXe0sZJ2srLs8bslWHeGnnbbljwDN7aE7KGMeYfLP
         VpEgvzlPPKpuGL/uDMocGYqKaH6HPWKgNvZGVWGx0QW8w03gpAVsfQHzR7JHQ7RXK8r3
         t6JT/5OSUdFyATJ9IcPhGgZQXdWSgmF0FGAdN5+6yHPHVZLklGLJEXwAQ5joT3FN2ic9
         bYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2jpxKV3cZKID86X9NgsSgQN/RBeTni16lZXdGrHHA/o=;
        fh=RQr3kLrrv6gxd+qSf6JE1e31WR7UrAf0QlvRQqXfaJw=;
        b=GFNlg8495U3gsJTYP/CMt8FNrSZ7zQKNsl6kkbB1UlxhPANzGOCWwMYqrKoBXU1xHu
         nrKq0nLpbT87BMGaAeeD8cktG6UowcTYDrQhT4oyYZ2jqAHnzljHRmCWL5/p+hqQqXfi
         en4dCIccyN8O3tcSDLrevECXQ2jqfd/tWHS2qsSpE4Nkwliez3ecKruRJGnf8r2VDs7l
         Yf/4jq34YXxZLQXF0CdglxwokvynYziC7NHMNLKbenR/LLP8Bajxb06dgN3reCCk6r6X
         WZ/4Qew+Fqz2udfRnXaRargKn2An2emYq67YctNQwjJCYJ1DTf7JIJA94GVZznIKLaaM
         RzdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j+BaWDgk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1d08c5si60309781cf.373.2025.02.01.08.46.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:46:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j+BaWDgk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1teGYH-0006U2-UN; Sat, 01 Feb 2025 11:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYE-0006PR-Lz
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 11:40:58 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYC-0001Bp-VS
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 11:40:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361c705434so22420965e9.3
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2025 08:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428055; x=1739032855; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2jpxKV3cZKID86X9NgsSgQN/RBeTni16lZXdGrHHA/o=;
 b=j+BaWDgkicdfj7pI2C82yw9Ia4Co1zrihxIlW37WNcHFL3BL2N9i+w9F8x3uQO/nrO
 ofaqmorr5Pwx5OdTCK9Kz3WzxWeOGR6i0kxOE+NPc+kuN0vfX8CX9ElDq8LcefYUudAG
 gI0ySCkP4/fTZfT5cCVU/re0vgnJoclwWxSxb8SxmoyZx3RuUeJVCAzES+VLWo7BkqO8
 NsctAEh/N42QWzxXvmQJLB9khQv17wIahRAWmih4v09JJ6ISPcO/YnCSHwhUJ2VtdzVD
 Z8F8kge+6DGEjWGHcCj5pDzSvSnpPMKZmAUf1X62SozQ4pm1dzTTRPKyuMXRK/7MN7rE
 +rkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428055; x=1739032855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jpxKV3cZKID86X9NgsSgQN/RBeTni16lZXdGrHHA/o=;
 b=MONvqUn3hZYWWzC7hjpRNn3xzChVqmOBJ9qv+AAABYQVp797LVW6PwX1J/sYSXsW+8
 PilhSfIcWElHyai73bZvfsCWinc8TLKSdwLzUGfsHnzVQVoANAXWWBgLsN1fnxXE7iXN
 NFUaRev/auQ8t5KAc81k+TIIU6t3nMl4HyI+do6hHylvupg52yyALQRhqx0uofuUKVlc
 U9qi7bT5D2l5/TDkOWSq2XglLUJibdIt08FAU7Hg+TjOpoeokaQtRzYMLWLpuYXiptVa
 nkICbjWhoTjZVl6NRhlpvTW4aJxWIbJ+OKALgedYAq5f6yHj4+m0l06W0VW8j5NJrSEt
 L04w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh/9glmjglr9kzxMRvy7L6FKkbgLSJ9R4KIFkO1kz4y0segMsTx54fep/Su6D0JDCaaZFLAGYLMaWV@nongnu.org
X-Gm-Message-State: AOJu0YwV/8X0rEdJ+c+IvQbD18JLU3QPL8wvgcAWdb93TDb16kQS/QCm
 u1ApEbeZj+Q+Od1wwAf0lhaOKUR3p8jJEdSINyDu9RS0r07c4EAt2x+7ohMSQ5U=
X-Gm-Gg: ASbGncscmwfRrQsQRazTC6SyLdNvXwkn24zEY7x+DJUhW0nlKBlts4Je68dmqblrvSy
 xgyAJAypXVfBgJrrVZggoXers7ywh5NWBptGJCfHVj67GV3Pqfc4cMhBnRcytAEFgrtUHoFu7nT
 2zQ/f/XY0EmGbpZHE2To0a90Oci++i8pZvwKuCqGvNyqg+TQudNZDqIywWaqL+si/+BKxu20tIz
 kaUo1/U28BD2DYC5e/pwK7JUHsilB1BYsvaDb/PTexlnaP0W7wOpCAJlUK9rBkxHTn1xu7C81lg
 aFdcdXQiE1XXaOWJZ537
X-Received: by 2002:a05:6000:1ace:b0:385:ec89:2f07 with SMTP id
 ffacd0b85a97d-38c51970003mr11770908f8f.32.1738428055478; 
 Sat, 01 Feb 2025 08:40:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 30/69] target/arm: Implement FPCR.AH semantics for SVE
 FMIN/FMAX vector
Date: Sat,  1 Feb 2025 16:39:33 +0000
Message-Id: <20250201164012.1660228-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fPJ9Xnnx8/sj

Implement the FPCR.AH semantics for the SVE FMAX and FMIN
operations that take two vector operands.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 14 ++++++++++++++
 target/arm/tcg/sve_helper.c    |  8 ++++++++
 target/arm/tcg/translate-sve.c | 17 +++++++++++++++--
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 3c1d2624ed4..918f2e61b7e 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -1140,6 +1140,20 @@ DEF_HELPER_FLAGS_6(sve_fmax_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fmax_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_ah_fmin_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmin_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmin_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_6(sve_ah_fmax_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmax_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fmax_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_6(sve_fminnum_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fminnum_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 2f6fc82ee4f..a688b98d284 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4347,6 +4347,14 @@ DO_ZPZZ_FP(sve_fmax_h, uint16_t, H1_2, float16_max)
 DO_ZPZZ_FP(sve_fmax_s, uint32_t, H1_4, float32_max)
 DO_ZPZZ_FP(sve_fmax_d, uint64_t, H1_8, float64_max)
 
+DO_ZPZZ_FP(sve_ah_fmin_h, uint16_t, H1_2, helper_vfp_ah_minh)
+DO_ZPZZ_FP(sve_ah_fmin_s, uint32_t, H1_4, helper_vfp_ah_mins)
+DO_ZPZZ_FP(sve_ah_fmin_d, uint64_t, H1_8, helper_vfp_ah_mind)
+
+DO_ZPZZ_FP(sve_ah_fmax_h, uint16_t, H1_2, helper_vfp_ah_maxh)
+DO_ZPZZ_FP(sve_ah_fmax_s, uint32_t, H1_4, helper_vfp_ah_maxs)
+DO_ZPZZ_FP(sve_ah_fmax_d, uint64_t, H1_8, helper_vfp_ah_maxd)
+
 DO_ZPZZ_FP(sve_fminnum_h, uint16_t, H1_2, float16_minnum)
 DO_ZPZZ_FP(sve_fminnum_s, uint32_t, H1_4, float32_minnum)
 DO_ZPZZ_FP(sve_fminnum_d, uint64_t, H1_8, float64_minnum)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 187bd647c29..2813e5f4871 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3759,11 +3759,24 @@ TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
     };                                                          \
     TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz, name##_zpzz_fns[a->esz], a)
 
+#define DO_ZPZZ_AH_FP(NAME, FEAT, name, ah_name)                        \
+    static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = {         \
+        NULL,                  gen_helper_##name##_h,                   \
+        gen_helper_##name##_s, gen_helper_##name##_d                    \
+    };                                                                  \
+    static gen_helper_gvec_4_ptr * const name##_ah_zpzz_fns[4] = {      \
+        NULL,                  gen_helper_##ah_name##_h,                \
+        gen_helper_##ah_name##_s, gen_helper_##ah_name##_d              \
+    };                                                                  \
+    TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz,                      \
+               s->fpcr_ah ? name##_ah_zpzz_fns[a->esz] :                \
+               name##_zpzz_fns[a->esz], a)
+
 DO_ZPZZ_FP(FADD_zpzz, aa64_sve, sve_fadd)
 DO_ZPZZ_FP(FSUB_zpzz, aa64_sve, sve_fsub)
 DO_ZPZZ_FP(FMUL_zpzz, aa64_sve, sve_fmul)
-DO_ZPZZ_FP(FMIN_zpzz, aa64_sve, sve_fmin)
-DO_ZPZZ_FP(FMAX_zpzz, aa64_sve, sve_fmax)
+DO_ZPZZ_AH_FP(FMIN_zpzz, aa64_sve, sve_fmin, sve_ah_fmin)
+DO_ZPZZ_AH_FP(FMAX_zpzz, aa64_sve, sve_fmax, sve_ah_fmax)
 DO_ZPZZ_FP(FMINNM_zpzz, aa64_sve, sve_fminnum)
 DO_ZPZZ_FP(FMAXNM_zpzz, aa64_sve, sve_fmaxnum)
 DO_ZPZZ_FP(FABD, aa64_sve, sve_fabd)
-- 
2.34.1

