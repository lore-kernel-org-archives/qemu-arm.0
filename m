Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1242113lfh;
        Fri, 27 May 2022 12:30:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWWHrbPgzAPUIV2fxp+sc0rfJQcNJ7GIUIyniwaRVIYDuuJ42rzd2iDQ9+04MAi1u3lD5B
X-Received: by 2002:ac8:5b15:0:b0:2f3:ea22:d265 with SMTP id m21-20020ac85b15000000b002f3ea22d265mr35002190qtw.453.1653679831044;
        Fri, 27 May 2022 12:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653679831; cv=none;
        d=google.com; s=arc-20160816;
        b=loQGqBlmK/kxprXyE5ia4YMKGv9+7WKbDrFQWLawN9YkcC2SqC1kHQk/j1kW/7Cj04
         7587aQpDVOf2l4yKBv7KefWoOwp0FQ4kA7WTvrU2Fcce2Zeb7eE7v+rSCmWzBayAsx8G
         acqGuvOqoMwbnpsWr+RcKTiLMkGZS9PPg6t8m+G5tDK5+HREj7Y+UcfMeR0xZlpeSGCH
         wXPFLOFEh5TCunWSuDS/KZEhOO23BQEbznrAPFbp6yqgrW/Uu80tFMXknVggdBXzuKHw
         ZsWJi5l5njb3oQq9hooKlynGWNpTEYoDVPrt/e/LNsYXmbiN5JYtCXXw09i8V73+KESb
         Sa0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2WxAwM40s96Oyqh2/sR7/3CobKp3pYRH8H0LH0HfcWs=;
        b=jtQBcm8pevgqsNYyWn/1ukpTtYUX0bpW3DuC7aJQccyEe4K9iHdLNNi+XaRraBLdnl
         u6Pq/QuXqhf6jUEUSqI80UYDY93xkbt8Niq/5ajiDUAa7YFzEdP8LlpNfyVBz4EiZCvV
         /8GdvluQzau+DgKXNlGCx6WE5gj1THDxa2TaslaDFQweHXLCtpK7EXUZ3T/FVoyRX7xm
         Afj2bj40vUanU80EKvupAA3uY2BKFcAJmoxS5yk/UfDH5n/0u7iuYmpQx9V/UXDFTfOT
         AUoljKJRdO3aXVAi0p8EevJInvJwIZyADHo5FwRnqPyb2aW1zsTG4XwkWhzFv3xqXt1G
         b3Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LLDDS1Do;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21-20020a05620a409500b006a34cf4c496si4229994qko.191.2022.05.27.12.30.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LLDDS1Do;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuffK-0001cX-Fv
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec0-0003HH-9C
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:01 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuebx-0004JM-66
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:22:59 -0400
Received: by mail-pl1-x631.google.com with SMTP id s14so4801563plk.8
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2WxAwM40s96Oyqh2/sR7/3CobKp3pYRH8H0LH0HfcWs=;
 b=LLDDS1DozQuRO1nrYbyf+Y1SSXNozCvqd1llitSTuMvbI2QK+Cthb09XjWGWnmHJic
 ohQiXjRMTSP9gwVYMfRtO/bUh/7zCN+ph219CQasnpxIOlC0Rf+z3dRK83N5WNXln/S0
 mutxe5GvFLka+31VyxCdltz6gHhQHk1LO5ZspDeGw/xPrI9f06n3Sk+551dOd/kvraVh
 kC0kvqEK5pzL6/sAgT+N01nI8iHaeOQFzZdp63/V5++pWjPyxw+mf9tr44oX1yPnnXk0
 h3fu/Yh+NuWl9do4aUtV4tn74BySZL0rpy6QV897LCrQtlQsYDvI64rctRsbZqp/Ur10
 rkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2WxAwM40s96Oyqh2/sR7/3CobKp3pYRH8H0LH0HfcWs=;
 b=4gotHCn/+lgoz0owOcVZoiOouVpoXV+M9vLLZB0P8O9RtTDfDDVnEN8AkbaSqOrzXh
 /mhMabl5dCl6l5a0YadVqP1oNtcDzMjOwcOjDr1niAiy/aDyy0p1VLTHWFAPQihjcWM9
 ScHMaPByyo9kjqDClRamHuS9cy+So3XXclNz1lKcPa6tZUq8Ri9sw8Pfn8Zlns7ekfsz
 U1SDKLXvmy3YyKjf95sfzl0rixO8p2G0uUGBuUboa4v2HD4IJlMrQec2j2pBDWQhn0es
 s/STwkrdWRAa3n3bT71lcZ6sg9z/74mK+5nmoXlK9PSHzD7lOHaDEaoh4wJBJnR1NviM
 0PvA==
X-Gm-Message-State: AOAM532k86W0xL5CAWCEZeZ5N2cyKd7hAs+GtQ9ldmTJPbsCKqCpKP5+
 UN0/T859qWlpr7nlOReMeB7mmNe5IVctRg==
X-Received: by 2002:a17:902:9303:b0:15f:446e:dccc with SMTP id
 bc3-20020a170902930300b0015f446edcccmr44854630plb.35.1653675767205; 
 Fri, 27 May 2022 11:22:47 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 041/114] target/arm: Introduce gen_gvec_fn_arg_zzi
Date: Fri, 27 May 2022 11:17:54 -0700
Message-Id: <20220527181907.189259-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-TUID: I55ysu8yUVQV

We have two places that perform this particular operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 62bfc6fe7c..7a3b5f137a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -273,6 +273,16 @@ static bool gen_gvec_fn_zzi(DisasContext *s, GVecGen2iFn *gvec_fn,
     return true;
 }
 
+static bool gen_gvec_fn_arg_zzi(DisasContext *s, GVecGen2iFn *gvec_fn,
+                                arg_rri_esz *a)
+{
+    if (a->esz < 0) {
+        /* Invalid tsz encoding -- see tszimm_esz. */
+        return false;
+    }
+    return gen_gvec_fn_zzi(s, gvec_fn, a->esz, a->rd, a->rn, a->imm);
+}
+
 /* Invoke a vector expander on three Zregs.  */
 static bool gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
                             int esz, int rd, int rn, int rm)
@@ -3503,12 +3513,7 @@ static bool trans_ADD_zzi(DisasContext *s, arg_rri_esz *a)
     if (a->esz == 0 && extract32(s->insn, 13, 1)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_addi(a->esz, vec_full_reg_offset(s, a->rd),
-                          vec_full_reg_offset(s, a->rn), a->imm, vsz, vsz);
-    }
-    return true;
+    return gen_gvec_fn_arg_zzi(s, tcg_gen_gvec_addi, a);
 }
 
 static bool trans_SUB_zzi(DisasContext *s, arg_rri_esz *a)
@@ -6825,10 +6830,10 @@ TRANS_FEAT(ADCLT, aa64_sve2, do_adcl, a, true)
 
 static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
 {
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+    if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_fn_zzi(s, fn, a->esz, a->rd, a->rn, a->imm);
+    return gen_gvec_fn_arg_zzi(s, fn, a);
 }
 
 static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
-- 
2.34.1

