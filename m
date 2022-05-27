Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1252438lfh;
        Fri, 27 May 2022 12:52:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx11Qr+8+BlZBHqKsn7t2tIR31QalgBLjohVgkBw7v/L85M3d5Mq29Ukxea3cY5jjxvzOaj
X-Received: by 2002:ac8:584a:0:b0:2fe:ebf3:b690 with SMTP id h10-20020ac8584a000000b002feebf3b690mr351940qth.486.1653681144503;
        Fri, 27 May 2022 12:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653681144; cv=none;
        d=google.com; s=arc-20160816;
        b=W2OqUcq2anmktLAcz5UZ0QLR2HOs3LT9Mj/lNu55MynF3a1uyX95oZxApxYFl8o8j5
         aNLT7MHfhKyCQGjXNd1zq2g2hEuMXZlFbtw790jXv9UwC8DH2KpLz3yfAIxWXZAO9HLL
         NZHjcR0sTNXZGg1FM0Rtp5vNH+1BcG6KnCVZNOQ0AsV4gcBTXjQuUbP7gK3rDypgX9Ry
         3wCe6o9ZZu3MO9Ri+uiVR1RtUw4L3NlAOqF+r2W6pCxxX1iY9usjXC2sTE6Shd+9JBle
         6mFr7iYJePCpp0FpG8s+ME6Tx2HxBAcuc87nv/syu4eBw8OM8wqSstvJXDRBbdaiigpX
         pcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2rnO4LToh2YjF+ssnR94S0069+mABxTlfiX6BhXKrUk=;
        b=lnnc9hCxonRxpX+rz5hC0005lVcDDlN1GTwODimHF0I3dgYpIg7k8/8Lm/DxELGgeN
         ZdkwH1uOLE3GxpyzCVaF+7WQ7Xhx62J6NLLY8a4NdaFOR3MCuVHbBBtYIPb2nlHsKT1n
         rfQTBZii67WR+Q+P0zAt18coKTpkOt1SsdcbyBD/e55SkN+qL9TsHFu4KSVMwL15hN5M
         e3He4g5rJ4+slwwuMeoFMtTj0NOLog0mXNbdFwTzA4C5CC1i+Pj/YPX+oVU8xvNeW4/3
         HGblrwaRU69+RpiJYed6+tVhNhMX03elIdbH/9zoBPquqeDNr7QOD79wzr23dnDc9Ha5
         yA/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JzKroUDN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05622a00cd00b002f3d54e1a9esi3269391qtw.389.2022.05.27.12.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:52:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JzKroUDN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nug0W-0004tL-1p
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefb-0001q7-5Y
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:43 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefX-0005MC-KR
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:42 -0400
Received: by mail-pf1-x434.google.com with SMTP id j6so4964939pfe.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2rnO4LToh2YjF+ssnR94S0069+mABxTlfiX6BhXKrUk=;
 b=JzKroUDN/dRluCNRov4pP3Y01EIXTzx0RXyiiUlCqqNboXkGf03CqTuBBOnAXSaJ/W
 hS/MLmCDlod7J3qqwhJna0Ke8DOyUn697oUPLsq0qFljr8bce/05tF1zI1H+5nkVySQf
 2pqVwOc1Qli+SBdWSEezvWn7rdCLmlWnAlv0ogM7hexzoCLB7sYPuaoy1L3cm9XCWWVJ
 ULh8cpJaCQvt1qD/emwbwykZejt+D4/78qG5C8glX+rnQk6V+p0zzmwhhgFjsYao5Tbf
 AT0ij1oc84RdnGL3DmMl1eWNMW0ztGQWKHjO9enwhqn3lDzKS76/chjrLjvOTxCwe3kg
 K3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2rnO4LToh2YjF+ssnR94S0069+mABxTlfiX6BhXKrUk=;
 b=zDOKFpCWIN2Y+hpRKhn5aZxdtiZmrM6gMrmrLVjyVRXyCVkaCuGQFuFnMejlzMaZIQ
 j42Vs+4wX0dwT06DCnbzKdtjFGAxQLxLt2XkWFVqGDFOrcnDQ8/M1y+QOHBXuJWM1+6J
 1OBVAsodxy4Yk2IMwW8hunolFBBfYbV6E2l7L4zluL7gwSuBCVqBTe1fjkvWnjV9ns/M
 nOFYbcxA8GgnzVQFJPl/mGp5CZw+wwxvjN4hsfGpeUOZhazXYPTnKm4j2ReyehdXP/kE
 74sg0pR5UzXxHrLzBjqq3Ob7eO1pO0SdnCnVLNJLatCGtU08JUko4W5hPRpcis4hVi6s
 HOAw==
X-Gm-Message-State: AOAM531YQO+sWbJFiBn7zrD8gvRZeZky32Ziidyf/yzJSXSJ4lGVnQI7
 /yJwmuxAHNVxGXrGYxVePW5pfXUV6Df8tg==
X-Received: by 2002:a63:3d87:0:b0:3f6:1c54:b315 with SMTP id
 k129-20020a633d87000000b003f61c54b315mr39278937pga.432.1653675997486; 
 Fri, 27 May 2022 11:26:37 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 095/114] target/arm: Use TRANS_FEAT for do_frint_mode
Date: Fri, 27 May 2022 11:18:48 -0700
Message-Id: <20220527181907.189259-96-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-TUID: 2BRxm6uusiCg

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 53 ++++++++++----------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 43cfd2818e..552a551fef 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4168,30 +4168,16 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
     return true;
 }
 
-static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz]);
-}
-
-static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz]);
-}
-
-static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz]);
-}
-
-static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz]);
-}
-
-static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz]);
-}
+TRANS_FEAT(FRINTN, aa64_sve, do_frint_mode, a,
+           float_round_nearest_even, frint_fns[a->esz])
+TRANS_FEAT(FRINTP, aa64_sve, do_frint_mode, a,
+           float_round_up, frint_fns[a->esz])
+TRANS_FEAT(FRINTM, aa64_sve, do_frint_mode, a,
+           float_round_down, frint_fns[a->esz])
+TRANS_FEAT(FRINTZ, aa64_sve, do_frint_mode, a,
+           float_round_to_zero, frint_fns[a->esz])
+TRANS_FEAT(FRINTA, aa64_sve, do_frint_mode, a,
+           float_round_ties_away, frint_fns[a->esz])
 
 static gen_helper_gvec_3_ptr * const frecpx_fns[] = {
     NULL,                    gen_helper_sve_frecpx_h,
@@ -7289,21 +7275,10 @@ TRANS_FEAT(FCVTLT_hs, aa64_sve2, gen_gvec_fpst_arg_zpz,
 TRANS_FEAT(FCVTLT_sd, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtlt_sd, a, 0, FPST_FPCR)
 
-static bool trans_FCVTX_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve_fcvt_ds);
-}
-
-static bool trans_FCVTXNT_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve2_fcvtnt_ds);
-}
+TRANS_FEAT(FCVTX_ds, aa64_sve2, do_frint_mode, a,
+           float_round_to_odd, gen_helper_sve_fcvt_ds)
+TRANS_FEAT(FCVTXNT_ds, aa64_sve2, do_frint_mode, a,
+           float_round_to_odd, gen_helper_sve2_fcvtnt_ds)
 
 static bool trans_FLOGB(DisasContext *s, arg_rpr_esz *a)
 {
-- 
2.34.1

