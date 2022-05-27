Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1218371lfh;
        Fri, 27 May 2022 11:46:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmKnwLFhcjI2ZSnpbCBBMPGiks4NBTTRgP4LPNJWENE8a/Wt0KlCswjjmUi6ImP3YhciIa
X-Received: by 2002:a05:622a:1e12:b0:2f3:d254:45b7 with SMTP id br18-20020a05622a1e1200b002f3d25445b7mr34969872qtb.88.1653677216824;
        Fri, 27 May 2022 11:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653677216; cv=none;
        d=google.com; s=arc-20160816;
        b=rihob7hqVCCbsGkghvW86wKyMKGO4qMB+xk+ukVduJ4myT1HH6zBRsXnVAZORZbNvM
         8ShBFFxNCaNY/lquQvHeIjKYDVuhx8BV/0nJGYWc9VjeR6aEE27fEob9qE6DH458r+ZD
         qPpOU6YrNCj/E/rmEB+Fd3/B40AeEZrsrSSMb5BdCVx7eeOSMzBzcmpdBmqEkUTk2WCD
         v69LVnm0fWAbhKCN1YoLvJIgkhoeoU0jH9tz5/wfFskjW36QJUEdvV5MfS0PtENu6XZv
         e+APX6t6rt2JUjNgZudXIfmHIrTO/sfFWvy8NKZB2Vo/ShWPnhT0pbKX9GWXyQo7O5/u
         mv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KxUP5s2X8KUuJjnNhiSle2qZf/aBbvU7yZ2XRv2i2BU=;
        b=wgPCvN+a2IT+8m31Fh0RZVQWaq7JnctFfC9ULes2LSdCypdXtFmZ1nDfU+IRbdBOLV
         n1pSeI+Nt+skJ9n0cOXRi3etA9qcDQF8wAxQJ8B1vgJna9gtKGrOVbupo7CcwRGktDej
         mquwaqh9yTcoy1ab/3Nw9iBNVWbBBFs31ENMUdc8aHURjv251WhPDD1LGBho/KgjpMD9
         MrlzLiIcfOnttO4N2ZVKHriK3LPHfSHi/MglUoNfujKb1iVRsEFl7Lh/Rqnpn6tatzW8
         oUTAaeXeZVe/8ef7nSt2s532NTlTIdXyNhobdp4BUtIlNUbjq1sYNvKF4GRaHokTPDzR
         91hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PcWde18F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020ac87f48000000b002f3dddd1d19si3073166qtk.734.2022.05.27.11.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PcWde18F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuezA-0002qS-9s
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYX-0006ec-0Z
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:25 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYU-0003ZJ-KI
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:24 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso5012239pjb.3
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KxUP5s2X8KUuJjnNhiSle2qZf/aBbvU7yZ2XRv2i2BU=;
 b=PcWde18FB3U2nq+M7NmUX4xnULKxe3BKZrBrllaxVg4UVYMf5qXw0y5sPJmcrRJuM1
 jyQCc/AU29i4tP8Trrtz3xhgxAwI0K0fGoorDLcaFUYMwUmsFpDOBQZAQfT8Q3BlxvGN
 eIdw2InM9yN9GLA2umgqAZmN1CsUL9i3TSHiVhQqM6YwDI6MxFBqbDhD/ooLmjt7uW3a
 z2PrHUqsGsUJY4DJ2K9yZ7gvposIh9RuyUNQ/voZA8TECRI27z+DCEEiuJKfw9CRQCo0
 uMMORXntblb8QnZ7dpBQDwTpvvAjfjyZQIS2uNIetFCasHMHgC5UYQtTusDfgwEDBuA1
 b9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KxUP5s2X8KUuJjnNhiSle2qZf/aBbvU7yZ2XRv2i2BU=;
 b=GsYroKd5YN7oTGjF4xGCV52p4Mj63AzK6hiucDW8H0y7NtrJMm7YGv7jGPwYnK4tYy
 Mi5HhNk4lSQ3HBfsGSzD6BD24OuFpp0h/3chCtxdOKlJcrkwzNwGgZeze08iRvOWkf8I
 J5FjFdoTbXh+lchiOa3jahl0aQvDEyEoZ7/NnA+PXBbGu3ckrkiIsDxn2Vl3HI2MP/+9
 /CCyBQZWcCVDBOaMEAdWMaij3iawURrUQUIViA6tvXAReoy1BFfHt7bo+/7r25O+fjtp
 nnUT69V+ENHLNWa03Vs4psEHHKrS+0jquiwRhZUSthHS/gdDthZbqBdSo56Np0J6W/jb
 KFIg==
X-Gm-Message-State: AOAM53012OAgX8dgAoxo3ai8aWCnPesrTp0HiY30WWyvSgairRGjEsBb
 mD30A9UQGIWGEvMh1KwJaDd7Jyl9ZMl9nQ==
X-Received: by 2002:a17:902:f605:b0:14d:bd53:e2cd with SMTP id
 n5-20020a170902f60500b0014dbd53e2cdmr43496604plg.164.1653675561280; 
 Fri, 27 May 2022 11:19:21 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 013/114] target/arm: Rename do_zzxz_ool to
 gen_gvec_ool_arg_zzxz
Date: Fri, 27 May 2022 11:17:26 -0700
Message-Id: <20220527181907.189259-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: lOOor+qhy/OD

Rename the function to match gen_gvec_ool_arg_zzzz,
and move to be adjacent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f7367a4f62..b42df76c69 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -199,6 +199,12 @@ static bool gen_gvec_ool_arg_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
     return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
 }
 
+static bool gen_gvec_ool_arg_zzxz(DisasContext *s, gen_helper_gvec_4 *fn,
+                                  arg_rrxr_esz *a)
+{
+    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -3820,15 +3826,9 @@ TRANS_FEAT(DOT_zzzz, aa64_sve, gen_gvec_ool_zzzz,
  * SVE Multiply - Indexed
  */
 
-static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
-                        gen_helper_gvec_4 *fn)
-{
-    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
-}
-
 #define DO_RRXR(NAME, FUNC) \
     static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_zzxz_ool(s, a, FUNC); }
+    { return gen_gvec_ool_arg_zzxz(s, FUNC, a); }
 
 DO_RRXR(trans_SDOT_zzxw_s, gen_helper_gvec_sdot_idx_b)
 DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
@@ -3840,7 +3840,7 @@ static bool trans_SUDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
     if (!dc_isar_feature(aa64_sve_i8mm, s)) {
         return false;
     }
-    return do_zzxz_ool(s, a, gen_helper_gvec_sudot_idx_b);
+    return gen_gvec_ool_arg_zzxz(s, gen_helper_gvec_sudot_idx_b, a);
 }
 
 static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
@@ -3848,7 +3848,7 @@ static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
     if (!dc_isar_feature(aa64_sve_i8mm, s)) {
         return false;
     }
-    return do_zzxz_ool(s, a, gen_helper_gvec_usdot_idx_b);
+    return gen_gvec_ool_arg_zzxz(s, gen_helper_gvec_usdot_idx_b, a);
 }
 
 #undef DO_RRXR
-- 
2.34.1

