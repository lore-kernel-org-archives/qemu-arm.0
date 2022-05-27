Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1240506lfh;
        Fri, 27 May 2022 12:27:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8J6MYn3Q+UpQabmHcYmmzPNjOQLNWNEhaImfVhTs0fjU6FI9TqSWlGD0+pKg79ZXglglv
X-Received: by 2002:a05:620a:4016:b0:6a5:9c5b:8a1c with SMTP id h22-20020a05620a401600b006a59c5b8a1cmr9818300qko.700.1653679641697;
        Fri, 27 May 2022 12:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653679641; cv=none;
        d=google.com; s=arc-20160816;
        b=y2gjIa1+igUJPgzWKqD1eJkVmuHuUmo8Kd03IsBy4o3ptetu3QIh/rc5eGKO/QRrkN
         odS53zeu8DFr3lJG7/+UpSFQ19sPxCO3YOBhIHTmE2QE2DGKnbKfr8KpaFY6iEosGlak
         libFP6oNkbSwB790kUHTb4aLnW0Qxe7Xbd6AFuF68YKMQrHXFO4ZNqvTHNKbB9jexebK
         GDXgKWVRx/9HsrvoPVuKVH5ID9Co1hmJdl7Lr+nJuSRZAACemEo/tKDMyhf8XuYG1EbM
         jxVoL7qj7Q0Li5jef+UpLc19D8eVW59fr0IwEwmUnClBRPE3xF1VgtanI0jQoo0GoxP9
         t30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=s+jNkIlkI0Mxzpu2Q0Y0wsvArZquJwwiRJK1CMneaAk=;
        b=BOBb5CTYsMmvFb++FKQhFyKGdchfmODhmXvPB8GYvoITOD7b1BvJKfK+qPg3+ukcwA
         kAppUZAzIxuLRZaMhW7QpwMo+BWzTnmYWwocVIIMrvZrXKwoN+3Ce993qVXdzX32DIXz
         TKCmZV8eqPc2RTr9cwqS06b3qSq4Q1aymxQwG5RegwG5fx7q6YuwYC4SH8UxMl1lp8vW
         8QQ3mJaP20qaId+jenxg1kxSS3JBv2bgYs9LE5dDBl11oMDT8X8RPxBfUSThFZWXse5B
         3Ly1BvikC1zlBe+DKNAQ7qHEN6wuznhiMoODJ6PM43se9nxAgyLpR+5oIX1YYA4ndGXs
         7/XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aw41KLpF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 27-20020a05620a071b00b0069c7ad4331bsi2756818qkc.571.2022.05.27.12.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:27:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aw41KLpF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufcH-0005Ur-36
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecM-0003c2-LW
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004Qn-GV
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:21 -0400
Received: by mail-pf1-x433.google.com with SMTP id i18so4970627pfk.7
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s+jNkIlkI0Mxzpu2Q0Y0wsvArZquJwwiRJK1CMneaAk=;
 b=aw41KLpFlQmebLxvSLA6TNhdIHjwfZCmtEx91PgyR9wui3ARYcclKvI7Qjww82A9WI
 7fsf9jkK3brblVw1TScS+pVeKs1N88XXqu3WqOuoSm5tiDUzMsQQj9rSGCniUHM7MFMU
 fPDR+03biiqGNHS/pSxMRbi6rumkq/G21G+zIMdSK2nJ56Evs0xzQxUelvvIGoLwnSO5
 8nKEnPqztdayyCX49uDPbr4AO0I+hezv1mH6C4wXPmVFKRpnzbi5nZwCAqTXvl2333RW
 sTtK+RceBH3Gap48sU1jydgyS6ikhBykK0ge0rxAX/rIWRUAQVSkqM0xWbtcegZLowza
 DbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s+jNkIlkI0Mxzpu2Q0Y0wsvArZquJwwiRJK1CMneaAk=;
 b=BPGEZBty9SH5nG47PHP2RHJYg5Laie1gqyYAVj4mLpHlO8JOGkPyGRn0HwVuy76wG0
 TLMibR53y67xXvK+732F8tij/8+9xmTAufNg+1lynzi0LtACFR/zMs2yjO93B7Z/TmHh
 wAgqSECBMYCb4dKhTPOw9aHNW5iuUKQTvrwCVg6zpRBZPflfDktznh1Npg5WQZikNwvu
 Nb98oxw1b9npboIoQi3YmdtInKo2lPbGxyqF+bgHiO+dik4P2HS3+qU9PHIXiVmRawMS
 UQzhbv1/D5ECDrNdl110vB5v1FW3Ralla/tz/yyA9eWILa8nQLvmhoU8wBickWRqnOL4
 +gww==
X-Gm-Message-State: AOAM531gWoWZ88sElWm487iNGK5ee08kRW5KlYV8IUUCUcRvJKE0K/7Z
 xVqpRvs71R9zmaTyIRWleNOZ+h0vCqch2w==
X-Received: by 2002:a05:6a00:9a6:b0:518:fb72:5e2e with SMTP id
 u38-20020a056a0009a600b00518fb725e2emr14379326pfg.55.1653675783846; 
 Fri, 27 May 2022 11:23:03 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 059/114] target/arm: Use TRANS_FEAT for do_zip, do_zip_q
Date: Fri, 27 May 2022 11:18:12 -0700
Message-Id: <20220527181907.189259-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-TUID: ILfjnks23HiM

Convert SVE translation functions using do_zip*
to use TRANS_FEAT and gen_gvec_ool_arg_zzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 54 +++++++++-----------------------------
 1 file changed, 13 insertions(+), 41 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 75c52d8ce1..7c9deb267f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2287,48 +2287,20 @@ TRANS_FEAT(PUNPKHI, aa64_sve, do_perm_pred2, a, 1, gen_helper_sve_punpk_p)
  *** SVE Permute - Interleaving Group
  */
 
-static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_zip_b, gen_helper_sve_zip_h,
-        gen_helper_sve_zip_s, gen_helper_sve_zip_d,
-    };
-    unsigned vsz = vec_full_reg_size(s);
-    unsigned high_ofs = high ? vsz / 2 : 0;
+static gen_helper_gvec_3 * const zip_fns[4] = {
+    gen_helper_sve_zip_b, gen_helper_sve_zip_h,
+    gen_helper_sve_zip_s, gen_helper_sve_zip_d,
+};
+TRANS_FEAT(ZIP1_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           zip_fns[a->esz], a, 0)
+TRANS_FEAT(ZIP2_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           zip_fns[a->esz], a, vec_full_reg_size(s) / 2)
 
-    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, high_ofs);
-}
-
-static bool trans_ZIP1_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip(s, a, false);
-}
-
-static bool trans_ZIP2_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip(s, a, true);
-}
-
-static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
-{
-    unsigned vsz = vec_full_reg_size(s);
-    unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
-
-    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_zip_q, a, high_ofs);
-}
-
-static bool trans_ZIP1_q(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip_q(s, a, false);
-}
-
-static bool trans_ZIP2_q(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip_q(s, a, true);
-}
+TRANS_FEAT(ZIP1_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_zip_q, a, 0)
+TRANS_FEAT(ZIP2_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_zip_q, a,
+           QEMU_ALIGN_DOWN(vec_full_reg_size(s), 32) / 2)
 
 static gen_helper_gvec_3 * const uzp_fns[4] = {
     gen_helper_sve_uzp_b, gen_helper_sve_uzp_h,
-- 
2.34.1

