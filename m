Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23505C4451C
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 18:49:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmFW1-0001Sl-1m; Tue, 21 Jul 2026 14:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUj-00010m-S9
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:15 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUg-0006bb-QC
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-384c94c9414so7079449a91.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 11:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784659624; x=1785264424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2irtkmCXeSBot/ksE+dJpMF9mnBmRYCPessI916HB3E=;
 b=JgoILgMeUddhX82PCyDCa7KKxBZICUgtl56sjnB3V5caZQ2NAaWyo/z6/sL0jM0bpX
 Z59pZbdR+rMfgEl+SitCbqTFRMqU2Dv3wlqNN65vCr3fAyY2zbFOUJw0+7aMOHBUOtpF
 Jn94KloLN00eu5TB4GA1Lw+X+ks6RC+vfrySS7aWvHLLfRCf/igdh3xsGZqMPMRu6oAa
 Gss91O6qgRDwbqx8YSYRH7loz5xIvIGZoCJd09ZbuZlCv6hUBzJjc0krBaehdYf3VCoa
 9kJi2CWTKVcTYrceHlsX0/fYCYDW8sSBJMk8rCOQ+kz7QgRmnkNCxzNIwJo+4RoRKhll
 gVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659624; x=1785264424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2irtkmCXeSBot/ksE+dJpMF9mnBmRYCPessI916HB3E=;
 b=ZK9ALU5nVig4thvs9f4b75LojXd3FdB3WAbP53E8M4hMKirRUZA97mSMznPpFimS3B
 7SM14aHyGr63qhBMVT+jYymca39CB7zYgdDgYGzcEgIbcq97hi1GIxGFbwJLB2bZSk+t
 1/MvI2NL2cn4ZMhES+lPW3mBUoPHrdfncc7DajU/IL1ztdp4e/UxU1FHvye/bk9vhNee
 Lu8QQAgctnLkEB5xPsW82O+GlMz27gB3hjFIoZH/lxHUyWhk9lqyiLm3B/gL2ovdiSWl
 +O0RPtZl4HiYqj+cloKAeH3nLjs0iR66F7ajZpK5ucnwPswbnRbvcs1dmCI5082Ae1Iy
 SrSg==
X-Gm-Message-State: AOJu0Yz0E+UpzwHQaykdequYBa91ogNi3PNM39W3m96cUsXBLxaMs9wl
 VbjKXjqTvC0VKk9svt2MxtD8tUz5lqwdhUgcL0mAmqWZFDKsg/0ueaRQu7RpYmgED78=
X-Gm-Gg: AR+sD111NRBn0J2624Vm3boqv9WPq3zPRtkxNlMDPCCR9Mrdrwhrz14ErPBwx1NK1mg
 bpotwLTJu5dkijZAVKY75KmciFoIMJi8Nl2SRSu1hII6611UxYowuwPWRylyFors+om6Te3PvvI
 /E63Um/iG3zdCt2XbqFtffCHwQCwdh3Y6YYe7KRkxMkldU0uYBnHOzRKxsx4ebe0rBwUJIBuBpE
 vNkc4KczbyWFK40LCQMnoi0QPhq56Dr31LD0uUR1bpzILIwE5VVR5rPhrE3u8eVIuWuQFBfxBS1
 sr0hkVmOJomIhZLGef6MDsBI9Tff4xBMVi5gmsEMLvrd9MFLrJF9BI7uVBIJ0sPyp6sZatsKjS7
 zSEcFZ1DSsLmfBwxz68brar1k/BR7NL5Bc0RNgQt4kwwYebQ7jwXRPXbwpa3hXi84VJ9yFofQ5u
 noGrBup+k=
X-Received: by 2002:a17:90b:3c46:b0:38e:5ab7:ce9b with SMTP id
 98e67ed59e1d1-38e5ab7d242mr17297489a91.21.1784659623515; 
 Tue, 21 Jul 2026 11:47:03 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce29e340esm41108094c88.5.2026.07.21.11.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:47:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/20] target/arm: Remove DO_ZPZZ_AH_FP from translate-sme.c
Date: Tue, 21 Jul 2026 11:46:39 -0700
Message-ID: <20260721184656.530230-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
References: <20260721184656.530230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Expand the macro at each use site.
Merge the two arrays and index by fpcr_ah.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 41 +++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index e77d017656..59a4f9a59b 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4415,19 +4415,6 @@ TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
  *** SVE Floating Point Arithmetic - Predicated Group
  */
 
-#define DO_ZPZZ_AH_FP(NAME, FEAT, name, ah_name)                        \
-    static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = {         \
-        NULL,                  gen_helper_##name##_h,                   \
-        gen_helper_##name##_s, gen_helper_##name##_d                    \
-    };                                                                  \
-    static gen_helper_gvec_4_ptr * const name##_ah_zpzz_fns[4] = {      \
-        NULL,                  gen_helper_##ah_name##_h,                \
-        gen_helper_##ah_name##_s, gen_helper_##ah_name##_d              \
-    };                                                                  \
-    TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz,                      \
-               s->fpcr_ah ? name##_ah_zpzz_fns[a->esz] :                \
-               name##_zpzz_fns[a->esz], a)
-
 #define DO_ZPZZ_AH_FP_B16(NAME, FEAT, name, ah_name)                    \
     static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = {         \
         gen_helper_##name##_b16, gen_helper_##name##_h,                 \
@@ -4489,7 +4476,14 @@ static gen_helper_gvec_4_ptr * const sve_fminnum_fns[4] = {
 TRANS_FEAT(FMINNM_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fminnum_fns[a->esz], a)
 
-DO_ZPZZ_AH_FP(FABD, aa64_sme_or_sve, sve_fabd, sve_ah_fabd)
+static gen_helper_gvec_4_ptr * const sve_fabd_zpzz_fns[4][2] = {
+    { NULL, NULL },
+    { gen_helper_sve_fabd_h, gen_helper_sve_ah_fabd_h },
+    { gen_helper_sve_fabd_s, gen_helper_sve_ah_fabd_s },
+    { gen_helper_sve_fabd_d, gen_helper_sve_ah_fabd_d },
+};
+TRANS_FEAT(FABD, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
+           sve_fabd_zpzz_fns[a->esz][s->fpcr_ah], a)
 
 static gen_helper_gvec_4_ptr * const sve_fscalbn_zpzz_fns[4] = {
     NULL,
@@ -8134,8 +8128,23 @@ static gen_helper_gvec_4_ptr * const sve_fminnmp_zpzz_fns[4] = {
 TRANS_FEAT(FMINNMP, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpzz,
            sve_fminnmp_zpzz_fns[a->esz], a)
 
-DO_ZPZZ_AH_FP(FMAXP, aa64_sme_or_sve2, sve2_fmaxp_zpzz, sve2_ah_fmaxp_zpzz)
-DO_ZPZZ_AH_FP(FMINP, aa64_sme_or_sve2, sve2_fminp_zpzz, sve2_ah_fminp_zpzz)
+static gen_helper_gvec_4_ptr * const sve_fmaxp_zpzz_fns[4][2] = {
+    { NULL, NULL },
+    { gen_helper_sve2_fmaxp_zpzz_h, gen_helper_sve2_ah_fmaxp_zpzz_h },
+    { gen_helper_sve2_fmaxp_zpzz_s, gen_helper_sve2_ah_fmaxp_zpzz_s },
+    { gen_helper_sve2_fmaxp_zpzz_d, gen_helper_sve2_ah_fmaxp_zpzz_d },
+};
+TRANS_FEAT(FMAXP, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
+           sve_fmaxp_zpzz_fns[a->esz][s->fpcr_ah], a)
+
+static gen_helper_gvec_4_ptr * const sve_fminp_zpzz_fns[4][2] = {
+    { NULL, NULL },
+    { gen_helper_sve2_fminp_zpzz_h, gen_helper_sve2_ah_fminp_zpzz_h },
+    { gen_helper_sve2_fminp_zpzz_s, gen_helper_sve2_ah_fminp_zpzz_s },
+    { gen_helper_sve2_fminp_zpzz_d, gen_helper_sve2_ah_fminp_zpzz_d },
+};
+TRANS_FEAT(FMINP, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
+           sve_fminp_zpzz_fns[a->esz][s->fpcr_ah], a)
 
 static bool do_fmmla(DisasContext *s, arg_rrrr_esz *a,
                      gen_helper_gvec_4_ptr *fn)
-- 
2.43.0


