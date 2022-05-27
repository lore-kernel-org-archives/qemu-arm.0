Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1208431lfh;
        Fri, 27 May 2022 11:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLI3nbod3Vw/kG+ek4m2uzGN4tko+WrkpThpbI1n/9cY9ODyOOaiNUq5mysWmvqonQueiY
X-Received: by 2002:a05:620a:4e2:b0:6a3:7433:3818 with SMTP id b2-20020a05620a04e200b006a374333818mr20498205qkh.362.1653675961352;
        Fri, 27 May 2022 11:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653675961; cv=none;
        d=google.com; s=arc-20160816;
        b=gkR7P/F+VcyojJYSv5QG3WT7X5gagjbzUUjp9U++BuvNRMO13UnA5urD2V89mE6pto
         YEtdjUG5SW2cfus+/4G9ujpf4lljlrkeh7F0BmWVhJ+mzwdACY5rC4Woo26XgKULFiEx
         ofl64q7y+k7hrwTNOZta3LFqRggFIKwCUZJQYARS3yt41JSmN1f3P+Hcqroj5M8gLAV2
         IVifjgfCfgKieOYW25rY1bfSUa/6zwoZ1S7se6uN230SiR2+ha/+LfMR54+H2cz0t9YN
         uqhA8WiwQipJf5VMsi/GUhdaZql7zsnCkBUjyM5Wqq2b+Te/ut/KaLJK1DVXYrAO05MQ
         0O7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mOAT0W5sv/vx7YTFhV5jbZVOcZvSb23Me4MYt3wvbXw=;
        b=D43nMj9DOy91pqIlNZRb/K4pyVWSyVm1C3Rn6A0OPVr3od+3a8YbtE5PNjnyST58Dd
         29dBiS7ANElHM23ny/3DiEnCShqh+cG9W7S+82gNjst1JtIWtrpFbKfPhJ8mTAjGnoKC
         DsxVOHPryycsN4rSd66umIVrXQsL5FLzo9bNUoHqRZQ6l/oZwjvXqfQTNbGaNtCVUdl+
         9uiQ15Q9pAarPV++7tpCndY85eMmyaTSSd4frtz09gaZ0WIhrW/F85SEAX5+/1dxyipD
         kTE0lnd0RdA0h14qmzgJSyT4yQl41sBdiCtyvc3xJoOuPVjzrB+1rqnpDVvWxu9zNHBM
         921g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o+iLfHn1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05621421ad00b004626110db72si3160219qvc.64.2022.05.27.11.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o+iLfHn1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueeu-0000DJ-RK
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYf-00079x-EF
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:33 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYc-0003VM-E4
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:33 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 137so4566076pgb.5
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mOAT0W5sv/vx7YTFhV5jbZVOcZvSb23Me4MYt3wvbXw=;
 b=o+iLfHn1sEkA+dYsGq2YzMZ8pwXn9C1s9nMrRxxzQ/z8dmMpTl2HktLLnj9e+IoZgI
 P4dp/T68TsUIFUXDW30Sn1YIxDirOLCBtnfMFBo38l4N7OaEVLBtxG2WtHdjfJiKHJ8P
 o8ZXbKDI5WcjtZu7pucFnwRFNyKxcHRu3mqQM7iSsD+oJyxjJp2l4QlePOikkZayG13d
 gcyyytDa4GtNBhjru5ZXpdmnLa2fp6DQT8Vtlejpa4w3jorHXBpZrwkaXYn5RghUDKEF
 GhxPRBlyZ2Ha718bJE7NML9GcII/pv3M64WV/nRLFk3hAAUU+is3ATR+UCCU9niPudAj
 z0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOAT0W5sv/vx7YTFhV5jbZVOcZvSb23Me4MYt3wvbXw=;
 b=vpYJtPiC2aGUBZzg2b35b52K+dLlx5/ULzvdsOSRRHK0XXJbtLv0Jw2jHufHGxZJ6H
 4HT2SlyhatFhz3fEwa8/onmQET7XEPagIUQ2kP2ZaLy6b0hxRL1qmYDD3Ex9h0nGCSFj
 EWhy4k/eoUy441Tw2JKAKu/eQvaZ0D7u3G6HVeLtFvC2qmH8WVIVLqB9mFAeip6LnZ5t
 0/5jPhF7C8O2oyztD8AMMTP3EJffdw5de0mrE1M8TyVED2K5BW3oytI8RQ4p/slr0J80
 J9TSGYwzpX+Pqa1eNvRR9xB0+dWDB6PYDdjMoAb5P7Yu/PSikSNCBMAoQ6XK6Jb9W59H
 wIOw==
X-Gm-Message-State: AOAM533OEDZA6bDHZ70ETJOgxXUvfPbBgNR/UpXk6WZB0y2WIVYDg6F+
 MByfUN/q1M++Na4mjTFzHUr2ZQ==
X-Received: by 2002:a63:ec56:0:b0:3fa:f7f8:c644 with SMTP id
 r22-20020a63ec56000000b003faf7f8c644mr10299466pgj.52.1653675569536; 
 Fri, 27 May 2022 11:19:29 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 022/114] target/arm: Use TRANS_FEAT for do_sve2_zpz_data
Date: Fri, 27 May 2022 11:17:35 -0700
Message-Id: <20220527181907.189259-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tr2WY4o2GQ4Z

Convert SVE translation functions using do_sve2_zpz_data
to use TRANS_FEAT and gen_gvec_ool_arg_zpz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 53 ++++++++++----------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d5a09a60af..fe11cfed6b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6554,48 +6554,23 @@ static bool trans_UADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
  * SVE2 integer unary operations (predicated)
  */
 
-static bool do_sve2_zpz_ool(DisasContext *s, arg_rpr_esz *a,
-                            gen_helper_gvec_3 *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpz(s, fn, a, 0);
-}
+TRANS_FEAT(URECPE, aa64_sve2, gen_gvec_ool_arg_zpz,
+           a->esz == 2 ? gen_helper_sve2_urecpe_s : NULL, a, 0)
 
-static bool trans_URECPE(DisasContext *s, arg_rpr_esz *a)
-{
-    if (a->esz != 2) {
-        return false;
-    }
-    return do_sve2_zpz_ool(s, a, gen_helper_sve2_urecpe_s);
-}
+TRANS_FEAT(URSQRTE, aa64_sve2, gen_gvec_ool_arg_zpz,
+           a->esz == 2 ? gen_helper_sve2_ursqrte_s : NULL, a, 0)
 
-static bool trans_URSQRTE(DisasContext *s, arg_rpr_esz *a)
-{
-    if (a->esz != 2) {
-        return false;
-    }
-    return do_sve2_zpz_ool(s, a, gen_helper_sve2_ursqrte_s);
-}
+static gen_helper_gvec_3 * const sqabs_fns[4] = {
+    gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
+    gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
+};
+TRANS_FEAT(SQABS, aa64_sve2, gen_gvec_ool_arg_zpz, sqabs_fns[a->esz], a, 0)
 
-static bool trans_SQABS(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
-        gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
-    };
-    return do_sve2_zpz_ool(s, a, fns[a->esz]);
-}
-
-static bool trans_SQNEG(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
-        gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
-    };
-    return do_sve2_zpz_ool(s, a, fns[a->esz]);
-}
+static gen_helper_gvec_3 * const sqneg_fns[4] = {
+    gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
+    gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
+};
+TRANS_FEAT(SQNEG, aa64_sve2, gen_gvec_ool_arg_zpz, sqneg_fns[a->esz], a, 0)
 
 #define DO_SVE2_ZPZZ(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                \
-- 
2.34.1

