Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1207402lfh;
        Fri, 27 May 2022 11:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy54CwQ2/lFeF6gGh0e8kZh5Zt+H38gCv225ADRMGFbt4mgObDSBTE6Bj+DumgddcfWq4k0
X-Received: by 2002:a05:622a:51:b0:2f3:c5f7:66f1 with SMTP id y17-20020a05622a005100b002f3c5f766f1mr33612621qtw.662.1653675845404;
        Fri, 27 May 2022 11:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653675845; cv=none;
        d=google.com; s=arc-20160816;
        b=RyDTRiMwIosc2PI+LfqwYOCEPLM8GuWYfp6gAxhd+Qxs3B1hbQt+v5Ot8xDv53uK06
         5LLUn71KrGNLf5WIV6KAp01nVSsjAtUduV9Krb6w6MO+IjUCKjbwoh/tp9v3lvHwBnDL
         uUOJZeSwEiVKfCKipcsQ6pOQnbizZqWX3UdrxobLRkR3bkdyzXcYktUNvEVcNr3vxNcS
         NrsSbdc13Zy1hXBMprklMqClmLA7C6lXzbrEUKbiXOLG0zbr6uES8pCvv+n6NiJX/Pg6
         27sSIT+SuP5FOUhGeAjGnenc25c5r8JMKy5JSXlQ83bmKibEpeuBKHlbMLwJwU9mkcQb
         ukGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JHzf7f1Jof2ZrWRypNY/8bOSixU6sqwto2Tj3rN5pqs=;
        b=RO53ocIDuEhWnVJp/PpWsja5mLV/6jtjhxe1WczJzkSltdNVcx5bgwuwoj82bhw+G4
         tAqqvWMh3Ooz8cQSsbdHA3GPiDrRnMhL45QEkG5lGwToy7okRctc4QXFfhm/+fTWis7z
         mAE7XRwvtb5MI+VeuC33XdEmnQnORRcRiJMGFxt2ipxQyfXZ2ZiFRbmu5s01UAV8C7oB
         I9HvKLmYONfb2f7J8m2cAMx4LUjmN2JAi5+y+Cyt/8VSvQTNjTulJbI1EjDxQRcYf0Yk
         Vp71AqykJOeU5NdYHz4EaU3jYcUlgGAPro3HGDv6Oh4Qhd8aIq3jloWvDWwtquHA/rEw
         A5zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=upQSPe07;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15-20020a05620a424f00b006a36dcc7434si3660309qko.375.2022.05.27.11.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:24:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=upQSPe07;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nued2-0004Iq-TF
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYe-00074D-25
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:32 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYa-0003Uk-MB
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:31 -0400
Received: by mail-pf1-x429.google.com with SMTP id 202so5019713pfu.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JHzf7f1Jof2ZrWRypNY/8bOSixU6sqwto2Tj3rN5pqs=;
 b=upQSPe0787JHiFnxrcXRiMU3u1PgH/CCGy5pJZ6QC3M8pv2E/hFoNv6VRFNA3mu84K
 YicDQDkDh8jpI+KQ3kIoXjk9Nz27Ar97iF4C+UrUdJ4RQdhVKmyZUEpACAN6yOxR6zv0
 dHJGoqFf9NMG37DLzgmABMcf3Dglmj8sewDFceE1KPLn3FVRbhjNvK78HH8EtwvnYLQ7
 sZCNM0HCHrsa4H4IS+1DKcLQ+DEph0TUodFeaC5dTHjDaGumfDubBanD62/INDQNw8YR
 0ZW7YJvou/96hWHsQ5RDBzqrlj5+6VHXE1DOgvrdkvEF99MB251CJ2pX8kpZkAq8syJu
 hP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JHzf7f1Jof2ZrWRypNY/8bOSixU6sqwto2Tj3rN5pqs=;
 b=B7Dm2FnFtHGvbzmnTc0MXW3bG2St41HeZFHegjHVTOa9eRZw+HfGFJFN1gTlrEq850
 BY8jubO5nPGq25igloSimh0ZBSOaJE1Ht6Gu4sYI5spGYKVxJCIRRodrahDGUOsvqQQ4
 fIg9ROLpkAxupSlDeMFWQLlHDvNHE832ia9gZ/qczuxecdoLhQZeW2B0demylSu2N0JY
 NFp0g9hrY+oJiKrVxsJjUfaNEOjd8iwDL6yRyRorlXwnJ7sIL35gsI+Pu/7jJTqr6mU7
 sXJknIkxE5UipiYcysQ9apNAJDCAq0dP0kcHdfcA8LXneTy4K1KlUeP3/hPEFFG2We2g
 OfLQ==
X-Gm-Message-State: AOAM532Fuz1pwYHjP6VHq74N9xNKU1bFdMHO9RmfF7K/W3nNk352G5ff
 /a5cD+Myi+txRMRPegilKzByjVe4cjOb/g==
X-Received: by 2002:a65:57c5:0:b0:3fb:a60e:9b32 with SMTP id
 q5-20020a6557c5000000b003fba60e9b32mr4216724pgr.553.1653675567884; 
 Fri, 27 May 2022 11:19:27 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 020/114] target/arm: Introduce gen_gvec_ool_arg_zpz
Date: Fri, 27 May 2022 11:17:33 -0700
Message-Id: <20220527181907.189259-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rGuFw++OWtEx

Use gen_gvec_ool_arg_zpz instead of gen_gvec_ool_zzp
when the arguments come from arg_rpr_esz.
Replaces do_zpz_ool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 45 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e81c2de37f..be426db6a9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -222,6 +222,13 @@ static bool gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
     return true;
 }
 
+static bool gen_gvec_ool_arg_zpz(DisasContext *s, gen_helper_gvec_3 *fn,
+                                 arg_rpr_esz *a, int data)
+{
+    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, data);
+}
+
+
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
 static void gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int pg, int data)
@@ -805,11 +812,6 @@ static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
  *** SVE Integer Arithmetic - Unary Predicated Group
  */
 
-static bool do_zpz_ool(DisasContext *s, arg_rpr_esz *a, gen_helper_gvec_3 *fn)
-{
-    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, 0);
-}
-
 #define DO_ZPZ(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)           \
 {                                                                   \
@@ -817,7 +819,7 @@ static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)           \
         gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,       \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,       \
     };                                                              \
-    return do_zpz_ool(s, a, fns[a->esz]);                           \
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);              \
 }
 
 DO_ZPZ(CLS, cls)
@@ -836,7 +838,7 @@ static bool trans_FABS(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_fabs_s,
         gen_helper_sve_fabs_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_FNEG(DisasContext *s, arg_rpr_esz *a)
@@ -847,7 +849,7 @@ static bool trans_FNEG(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_fneg_s,
         gen_helper_sve_fneg_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SXTB(DisasContext *s, arg_rpr_esz *a)
@@ -858,7 +860,7 @@ static bool trans_SXTB(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_sxtb_s,
         gen_helper_sve_sxtb_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_UXTB(DisasContext *s, arg_rpr_esz *a)
@@ -869,7 +871,7 @@ static bool trans_UXTB(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_uxtb_s,
         gen_helper_sve_uxtb_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SXTH(DisasContext *s, arg_rpr_esz *a)
@@ -879,7 +881,7 @@ static bool trans_SXTH(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_sxth_s,
         gen_helper_sve_sxth_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_UXTH(DisasContext *s, arg_rpr_esz *a)
@@ -889,17 +891,19 @@ static bool trans_UXTH(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_uxth_s,
         gen_helper_sve_uxth_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SXTW(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_sxtw_d : NULL);
+    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_sxtw_d
+                                : NULL, a, 0);
 }
 
 static bool trans_UXTW(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_uxtw_d : NULL);
+    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_uxtw_d
+                                : NULL, a, 0);
 }
 
 #undef DO_ZPZ
@@ -2659,7 +2663,7 @@ static bool trans_COMPACT(DisasContext *s, arg_rpr_esz *a)
     static gen_helper_gvec_3 * const fns[4] = {
         NULL, NULL, gen_helper_sve_compact_s, gen_helper_sve_compact_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 /* Call the helper that computes the ARM LastActiveElement pseudocode
@@ -3008,7 +3012,7 @@ static bool trans_REVB(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_revb_s,
         gen_helper_sve_revb_d,
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_REVH(DisasContext *s, arg_rpr_esz *a)
@@ -3019,12 +3023,13 @@ static bool trans_REVH(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_revh_s,
         gen_helper_sve_revh_d,
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_REVW(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_revw_d : NULL);
+    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_revw_d
+                                : NULL, a, 0);
 }
 
 static bool trans_RBIT(DisasContext *s, arg_rpr_esz *a)
@@ -3035,7 +3040,7 @@ static bool trans_RBIT(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_rbit_s,
         gen_helper_sve_rbit_d,
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
@@ -6624,7 +6629,7 @@ static bool do_sve2_zpz_ool(DisasContext *s, arg_rpr_esz *a,
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpz_ool(s, a, fn);
+    return gen_gvec_ool_arg_zpz(s, fn, a, 0);
 }
 
 static bool trans_URECPE(DisasContext *s, arg_rpr_esz *a)
-- 
2.34.1

