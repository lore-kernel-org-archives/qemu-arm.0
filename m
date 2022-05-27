Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1227199lfh;
        Fri, 27 May 2022 12:03:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh4XE6nzW/kWTgtU7359hPFesZvinsbndK1OQr7l8XCxxjYdSlcWlHRfGx3wc8mMQccfZP
X-Received: by 2002:a05:6214:27e4:b0:462:2055:c3cd with SMTP id jt4-20020a05621427e400b004622055c3cdmr27350520qvb.31.1653678185095;
        Fri, 27 May 2022 12:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678185; cv=none;
        d=google.com; s=arc-20160816;
        b=SnUQvIngNcUlcEblziRbdVZB8OfrplgldMEeJCV6T8PwhglFObPFu289GK6va7pvfu
         YtJpGjY3wB5Siw2KtAM0Do7MribOEdEbSOTHS3c6ORFvpQJBx+vUDK1gQZiOFFmjofHG
         yKKRyWKcBhlrMv02FiFu+M5PGtuLWRh6khqkvyT8jQL/+L2mL+6MN6UkW48+qMVjGG6N
         h5IHepQWGftwEoS5LBVSGyOtsMcuZmhtoe4FH0x75ajlhDmr+hZgypRt7hUeWzo+EUU8
         M8QnMTOvDPIG5cdPGykAsjyjVhhV9vb2c1qV5XOD/7Bo8eQrKDmvLtePHG/GFvhgSDCE
         ktyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WelRz2UJ0xRf8Km45bXT5GAI1tfeHdpN33pvZE1X+20=;
        b=QxaD6hsmuyHnyPARAl27CCMYhLHqPzrgmas08CJkWtaUvK95igzavb1l9/UKi30sJR
         kfcE/rQr+DugkgIxMeCEt+Q74DVdQ9evQScbBqSueYf+QXsw1Glzq2MMkTgaflrsb4t0
         FPnORRhob1R1Xjcpt1SLSxaidieHv+whDXX5HRoSAKmqC+UZjUFA0U+PTlWt6kKvpnws
         bIQn2NyMWBVHUuLazgnA6wWLq5qfMwvrCmqIcMWVMiEp2IT9C2cp3MyZvkm/u/0q+xRx
         GQS3Me3yFbW3Ao9izL2OZzZxjQBTNjb6VVyQuFPqHU4h+NTlgpK1ZN6S6Yps69VgEzTa
         AvkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hg24BSJM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a05622a014a00b002f38685c7b5si3318541qtw.179.2022.05.27.12.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:03:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hg24BSJM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufEm-0002qF-IX
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYo-0007gg-Mc
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:42 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYj-0003eo-5D
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:42 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e66so4554096pgc.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WelRz2UJ0xRf8Km45bXT5GAI1tfeHdpN33pvZE1X+20=;
 b=Hg24BSJMflcSTtI27edKZMPiBeX/HKFjZDHH4ZrLo4jxmPVd3yNedcWQdUVHQ+690B
 NsVxTOAy/QMNMEtyymIGWXAjT8meThOs2qI0lPNcwsFYwKZVrJc4CKd4SbMj9GuWKpQe
 WlxUGd4l2arFzNZ4Py0BOjVe8eVCrXXS5frC/wJL4osXpc3J3j3uz5fOGItuVJ3J3sQp
 DwUW5gVNu1wIUyRmLnpadDNnoE7LApGTJPhrzae8a70oeZlWda6mQ943fyj5hgorrC+7
 LDqM24g/3YQ3cD9ktVMdTCGco2cTsQAt4rFPw98DECdRlL0ZMjEkI71NZ8i9hNH4IvHR
 wKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WelRz2UJ0xRf8Km45bXT5GAI1tfeHdpN33pvZE1X+20=;
 b=Nj6hlXH+cWeJYWZipCszFdxbRCzZ7oY/URi3pbxNwYdP7wVitUF03gb6z1AIbUXkbT
 HoHle1e+8pVTLMXNH+e6V2vzAH3HPlQdbzinId/iGY4G4rQ1TgOfiPtv6Qet+JtCEXxd
 l9QaGtCL1zjoX4eANh+XrGMKjj5PzyBUBVrirSRyJ3o5q/REkoxNGwnF2fTB9aAe9iOO
 hjZ0fNxytRsb6+qqno0s5iiYUDNjuHZtq00w1/tcO6hoRVXTlwea+kEIVhb/LF6pXzqF
 UZwzjZ5ACLD+x6JZFeh+YmODjz1EjgptU7vORTBxW4hIByjJwmxxPqRZnbVRFERYpqb4
 q1hg==
X-Gm-Message-State: AOAM533KRhgs/8ikgP2Z/+RamcGWgnCHWV8xsk8gH6+9R9bupC6cYAHH
 UhMC/G4uTARc/fr2SNJH9BwsqrI0qpe3nA==
X-Received: by 2002:a63:693:0:b0:3f5:ef4e:d359 with SMTP id
 141-20020a630693000000b003f5ef4ed359mr38831271pgg.540.1653675574909; 
 Fri, 27 May 2022 11:19:34 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 028/114] target/arm: Use TRANS_FEAT for do_sve2_zpzz_ool
Date: Fri, 27 May 2022 11:17:41 -0700
Message-Id: <20220527181907.189259-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x5FXUvkQe/rJ

Convert SVE translation functions using do_sve2_zpzz_ool
to use TRANS_FEAT and gen_gvec_ool_arg_zpzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 118 +++++++++++++------------------------
 1 file changed, 40 insertions(+), 78 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f8277eeb7c..0a69a1ef65 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -804,8 +804,6 @@ static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
     return true;
 }
 
-#undef DO_ZPZZ
-
 /*
  *** SVE Integer Arithmetic - Unary Predicated Group
  */
@@ -6471,40 +6469,19 @@ TRANS_FEAT(SQRDMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
  * SVE2 Integer - Predicated
  */
 
-static bool do_sve2_zpzz_ool(DisasContext *s, arg_rprr_esz *a,
-                             gen_helper_gvec_4 *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzz(s, fn, a, 0);
-}
+static gen_helper_gvec_4 * const sadlp_fns[4] = {
+    NULL,                          gen_helper_sve2_sadalp_zpzz_h,
+    gen_helper_sve2_sadalp_zpzz_s, gen_helper_sve2_sadalp_zpzz_d,
+};
+TRANS_FEAT(SADALP_zpzz, aa64_sve2, gen_gvec_ool_arg_zpzz,
+           sadlp_fns[a->esz], a, 0)
 
-static bool trans_SADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[3] = {
-        gen_helper_sve2_sadalp_zpzz_h,
-        gen_helper_sve2_sadalp_zpzz_s,
-        gen_helper_sve2_sadalp_zpzz_d,
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    return do_sve2_zpzz_ool(s, a, fns[a->esz - 1]);
-}
-
-static bool trans_UADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[3] = {
-        gen_helper_sve2_uadalp_zpzz_h,
-        gen_helper_sve2_uadalp_zpzz_s,
-        gen_helper_sve2_uadalp_zpzz_d,
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    return do_sve2_zpzz_ool(s, a, fns[a->esz - 1]);
-}
+static gen_helper_gvec_4 * const uadlp_fns[4] = {
+    NULL,                          gen_helper_sve2_uadalp_zpzz_h,
+    gen_helper_sve2_uadalp_zpzz_s, gen_helper_sve2_uadalp_zpzz_d,
+};
+TRANS_FEAT(UADALP_zpzz, aa64_sve2, gen_gvec_ool_arg_zpzz,
+           uadlp_fns[a->esz], a, 0)
 
 /*
  * SVE2 integer unary operations (predicated)
@@ -6528,44 +6505,34 @@ static gen_helper_gvec_3 * const sqneg_fns[4] = {
 };
 TRANS_FEAT(SQNEG, aa64_sve2, gen_gvec_ool_arg_zpz, sqneg_fns[a->esz], a, 0)
 
-#define DO_SVE2_ZPZZ(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                \
-{                                                                         \
-    static gen_helper_gvec_4 * const fns[4] = {                           \
-        gen_helper_sve2_##name##_zpzz_b, gen_helper_sve2_##name##_zpzz_h, \
-        gen_helper_sve2_##name##_zpzz_s, gen_helper_sve2_##name##_zpzz_d, \
-    };                                                                    \
-    return do_sve2_zpzz_ool(s, a, fns[a->esz]);                           \
-}
+DO_ZPZZ(SQSHL, aa64_sve2, sve2_sqshl)
+DO_ZPZZ(SQRSHL, aa64_sve2, sve2_sqrshl)
+DO_ZPZZ(SRSHL, aa64_sve2, sve2_srshl)
 
-DO_SVE2_ZPZZ(SQSHL, sqshl)
-DO_SVE2_ZPZZ(SQRSHL, sqrshl)
-DO_SVE2_ZPZZ(SRSHL, srshl)
+DO_ZPZZ(UQSHL, aa64_sve2, sve2_uqshl)
+DO_ZPZZ(UQRSHL, aa64_sve2, sve2_uqrshl)
+DO_ZPZZ(URSHL, aa64_sve2, sve2_urshl)
 
-DO_SVE2_ZPZZ(UQSHL, uqshl)
-DO_SVE2_ZPZZ(UQRSHL, uqrshl)
-DO_SVE2_ZPZZ(URSHL, urshl)
+DO_ZPZZ(SHADD, aa64_sve2, sve2_shadd)
+DO_ZPZZ(SRHADD, aa64_sve2, sve2_srhadd)
+DO_ZPZZ(SHSUB, aa64_sve2, sve2_shsub)
 
-DO_SVE2_ZPZZ(SHADD, shadd)
-DO_SVE2_ZPZZ(SRHADD, srhadd)
-DO_SVE2_ZPZZ(SHSUB, shsub)
+DO_ZPZZ(UHADD, aa64_sve2, sve2_uhadd)
+DO_ZPZZ(URHADD, aa64_sve2, sve2_urhadd)
+DO_ZPZZ(UHSUB, aa64_sve2, sve2_uhsub)
 
-DO_SVE2_ZPZZ(UHADD, uhadd)
-DO_SVE2_ZPZZ(URHADD, urhadd)
-DO_SVE2_ZPZZ(UHSUB, uhsub)
+DO_ZPZZ(ADDP, aa64_sve2, sve2_addp)
+DO_ZPZZ(SMAXP, aa64_sve2, sve2_smaxp)
+DO_ZPZZ(UMAXP, aa64_sve2, sve2_umaxp)
+DO_ZPZZ(SMINP, aa64_sve2, sve2_sminp)
+DO_ZPZZ(UMINP, aa64_sve2, sve2_uminp)
 
-DO_SVE2_ZPZZ(ADDP, addp)
-DO_SVE2_ZPZZ(SMAXP, smaxp)
-DO_SVE2_ZPZZ(UMAXP, umaxp)
-DO_SVE2_ZPZZ(SMINP, sminp)
-DO_SVE2_ZPZZ(UMINP, uminp)
-
-DO_SVE2_ZPZZ(SQADD_zpzz, sqadd)
-DO_SVE2_ZPZZ(UQADD_zpzz, uqadd)
-DO_SVE2_ZPZZ(SQSUB_zpzz, sqsub)
-DO_SVE2_ZPZZ(UQSUB_zpzz, uqsub)
-DO_SVE2_ZPZZ(SUQADD, suqadd)
-DO_SVE2_ZPZZ(USQADD, usqadd)
+DO_ZPZZ(SQADD_zpzz, aa64_sve2, sve2_sqadd)
+DO_ZPZZ(UQADD_zpzz, aa64_sve2, sve2_uqadd)
+DO_ZPZZ(SQSUB_zpzz, aa64_sve2, sve2_sqsub)
+DO_ZPZZ(UQSUB_zpzz, aa64_sve2, sve2_uqsub)
+DO_ZPZZ(SUQADD, aa64_sve2, sve2_suqadd)
+DO_ZPZZ(USQADD, aa64_sve2, sve2_usqadd)
 
 /*
  * SVE2 Widening Integer Arithmetic
@@ -7735,16 +7702,11 @@ static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
 DO_SVE2_PPZZ_MATCH(MATCH, match)
 DO_SVE2_PPZZ_MATCH(NMATCH, nmatch)
 
-static bool trans_HISTCNT(DisasContext *s, arg_rprr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[2] = {
-        gen_helper_sve2_histcnt_s, gen_helper_sve2_histcnt_d
-    };
-    if (a->esz < 2) {
-        return false;
-    }
-    return do_sve2_zpzz_ool(s, a, fns[a->esz - 2]);
-}
+static gen_helper_gvec_4 * const histcnt_fns[4] = {
+    NULL, NULL, gen_helper_sve2_histcnt_s, gen_helper_sve2_histcnt_d
+};
+TRANS_FEAT(HISTCNT, aa64_sve2, gen_gvec_ool_arg_zpzz,
+           histcnt_fns[a->esz], a, 0)
 
 TRANS_FEAT(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
            a->esz == 0 ? gen_helper_sve2_histseg : NULL, a, 0)
-- 
2.34.1

