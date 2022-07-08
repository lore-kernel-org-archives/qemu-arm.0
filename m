Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp333121lft;
        Fri, 8 Jul 2022 08:20:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUV2/yR3c1DY7LqjvLRCnwDJVBhGz1ZDQnk1cks1lt5cRdb7P5/BIkpsL5fsGU+SJZFfTy
X-Received: by 2002:a05:620a:1438:b0:6ae:fc6f:f998 with SMTP id k24-20020a05620a143800b006aefc6ff998mr2717552qkj.178.1657293640021;
        Fri, 08 Jul 2022 08:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293640; cv=none;
        d=google.com; s=arc-20160816;
        b=BI/gfPg1qyjSlGVz2p5X8yrLDD15WsgqOy7vz6KQO/BJhfiEj9ABuciL27wQ/13W5H
         3xqc+BvKAPh2R/G9asxfC6VBwF13yO+8By+roXhqhGtZnLU4PxL1D8C2NWGuorCJeU7S
         /UlGnyXsv+iDllvcWuQL8hWoNuoqXXTPg+mVjeQjAinwGUN1LfGN21sxt9lC/X9SYN0z
         hnRY0eh5XEgkHfDVq7iFvN5omhf/GiPeAbhDz9rZW1EQRMwBHD1TsCsH9TAcbRrCNSfG
         csJUVZDZbhcOY6jUOsTPTN7kaHo7IIeja0ORO3DDIjqaDWfeIeEtW5NCq/F6jUut8aAo
         HMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1btQdC+wS4/yxekRBbxVZ7KHECPJ8mO9wBrq6XRLd5o=;
        b=sDfFMeir3LTNhagTvfmc6ox3kEi908kKG+xer1qDrQO3hj9yDL8NMoLdygUHLOBglw
         5CPMGR791o2083ZXuFSLO09WjNKk0b68VAKbw+HbENMiEjavVvss1wmbyuNeOEunJXZ6
         uinEN1hBJmH+xPU2muCS46j2PdtNcICBV1n9PXz3Mt6NL3txikjTfxO4cJvakoBkUuHl
         3nHz9v066cFMX5Xx0ypeMBsCznx64XTd+GixTWLNjNYSnRI6t1SV9ZhH9UQe9lrMkeAw
         UaMqOi9CmsTRpewV6Ivxq9txPggMp7zLcNDDHICvGlBaJvw9JXKQMZC/PtMQKnUYLGzz
         S9uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2cqkqQp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020a05620a438800b006af4d94b807si17972358qkp.86.2022.07.08.08.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2cqkqQp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9pmZ-0001oT-EN
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piM-0002JY-Q2
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:18 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piJ-00028P-HW
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:18 -0400
Received: by mail-pj1-x1036.google.com with SMTP id a15so11563544pjs.0
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1btQdC+wS4/yxekRBbxVZ7KHECPJ8mO9wBrq6XRLd5o=;
 b=Y2cqkqQprZjZ+NYRn8GL83vhWWxcMj3hSnUxtktqdGKMj1lqrMnXMkpbOHpFrwPEKy
 /2eOovz4LK/p+CTAExvCORH344VxMemi0l7e397ocTXBUFyveLvtsv5aEk0J3zJsE8o6
 1wZjf4pXFE/ZvIomvriwt+tTYk/gknA+71ge8fYJOTlSKIkt4+2HmWThScQwSx5nPZrD
 +pFX7mHWwFk8joLyg3uJPg8/0mcnvf1lnYun9Z+4XLjYqxvzM5KVvePoPJ4/e8wzjhNN
 wHpRbkGakvoPTrQzUOzxcSDpQLg+dcBwuU3qTRYJ71SMNlBTo5oeLNJxkyI2Axy9ex7j
 5Jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1btQdC+wS4/yxekRBbxVZ7KHECPJ8mO9wBrq6XRLd5o=;
 b=kJchsRC1opAd1mfU+ph3wC6g7kd6+6d7ViKl+AHhZBHi4NJeX2nrs9Mmx/XH89Pjop
 jfHTmg0PLfSDWujrS3MirYCmw2C5nmvPbNFDniW0t2TKFhT4znZ3H5/pQyYsLQ0067R0
 Shm1W//rd4Sw9oybDrGd9tD57sfbMGwzsrUIumVwOGSRLThQyTe/OtoBhRNgpYJf20C7
 o8uc6xpYRIp6R0ryUJoqiu00f83KPsacfR0xResTRZBVwkL8s2M3+ZLJQsWoRQjfyD1a
 59oDv8pnHfWXbQDxilseuADyXToZc/UxyLoHjXOpRzdkRgopfabutucAtBWqVNe8hZDg
 ZDgg==
X-Gm-Message-State: AJIora/hc+1KJ5qzfX6XM6Cy+y5MiNE8Q3mFc+NJ34ZQwTaRMrcbIEuK
 icQS4IK+Rviuf+YwuEZrr4obSHF+hkEmQldU
X-Received: by 2002:a17:90a:9411:b0:1ef:9c3f:9a07 with SMTP id
 r17-20020a17090a941100b001ef9c3f9a07mr379692pjo.150.1657293367862; 
 Fri, 08 Jul 2022 08:16:07 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 07/45] target/arm: Mark PMULL, FMMLA as non-streaming
Date: Fri,  8 Jul 2022 20:45:02 +0530
Message-Id: <20220708151540.18136-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Xxs1yM4Mug+v

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  2 --
 target/arm/translate-sve.c | 24 +++++++++++++++---------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 4f515939d9..4ff2df82e5 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,8 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
-FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
 FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
 FAIL    0110 0101 --01 0--- 100- ---- ---- ----   # FTMAD
 FAIL    0110 0101 --01 1--- 001- ---- ---- ----   # FADDA
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ae48040aa4..4ff2102fc8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6186,9 +6186,13 @@ static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
         gen_helper_gvec_pmull_q, gen_helper_sve2_pmull_h,
         NULL,                    gen_helper_sve2_pmull_d,
     };
-    if (a->esz == 0
-        ? !dc_isar_feature(aa64_sve2_pmull128, s)
-        : !dc_isar_feature(aa64_sve, s)) {
+
+    if (a->esz == 0) {
+        if (!dc_isar_feature(aa64_sve2_pmull128, s)) {
+            return false;
+        }
+        s->is_nonstreaming = true;
+    } else if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, sel);
@@ -7125,10 +7129,12 @@ DO_ZPZZ_FP(FMINP, aa64_sve2, sve2_fminp_zpzz)
  * SVE Integer Multiply-Add (unpredicated)
  */
 
-TRANS_FEAT(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_s,
-           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
-TRANS_FEAT(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_d,
-           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz,
+                        gen_helper_fmmla_s, a->rd, a->rn, a->rm, a->ra,
+                        0, FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz,
+                        gen_helper_fmmla_d, a->rd, a->rn, a->rm, a->ra,
+                        0, FPST_FPCR)
 
 static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
     NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
@@ -7301,8 +7307,8 @@ TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
 TRANS_FEAT(BFDOT_zzxz, aa64_sve_bf16, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_bfdot_idx, a)
 
-TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_bfmmla, a, 0)
+TRANS_FEAT_NONSTREAMING(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_bfmmla, a, 0)
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
-- 
2.34.1

