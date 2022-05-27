Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1257032lfh;
        Fri, 27 May 2022 13:02:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5fuKVoLv/3fZrDQLYogxA7fg5P6nnltCJFLh3SykWYB/ADg5/vF7AQPdLNQdYndgGaKwa
X-Received: by 2002:ae9:c313:0:b0:69d:7664:e51d with SMTP id n19-20020ae9c313000000b0069d7664e51dmr29666796qkg.199.1653681745491;
        Fri, 27 May 2022 13:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653681745; cv=none;
        d=google.com; s=arc-20160816;
        b=hWRX8BBXPNZAEcDULMXr0uwoDHowx/YOpPKK8FoIbrKLcf6zrlgSjaze5aFVdlFpQR
         Zq/XVPL9JkKUPlmKb/R+X/XGvWgvvX19pNAOKGUh9offUYF58f+OB1Ki34f8mXxTMg3v
         JqkzdoxeLLIBxnsYDwvMqMg1aBc9asHBZIM9TDnKgO/rOfNSjOAZheDdZP9utgAwgOut
         5cv5CbHJm4hD9aZO8cCmkft3xemE/MQp+xx62MsN1Arq/3h7kvAZQuxDVwUtnXp4kqkK
         1AQuijiTgTu6vT3zW0sfxZ6bFizXwiZZ8yJfeaTrdqV7I+FWUG94QWRPngeKhjDKk2n9
         AuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rq70BX8hTMAI6b+cFkI1RRrKLuHgtJvjF5od3jr4Io4=;
        b=rIEjN5ZkV6LPqgBoDSFLmUP2ipX3SOI8QU2GR+WtYmkJaHdOSgUfyLmwDZ4Cst1rG+
         W2AVG7PGLs2A+sMbvmN8s8GwNfMn1qZAw9w/kjtctAShjNPMAdCL3dpkVd6IS1v+54+c
         Yc8YiqYsO/Ssfp2/u0kr1/Mr2IDo+lQrH/vBMGkETigZ2XENslYmvm2FUNK7ZBhG/SC4
         gbpoya7M5UoV7bRwBijd0lUsQF1Rgekr7o1v8am8aUFolXBZf3dbJvk4GPiq8GPvgKLf
         EKD5XcmKgm0qnDJ3c6tdmivvPnK2jN3jFMFiyzNacmUr5+ZlflMfEvbkHqlfv0mH/8bv
         3m1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d8Dx9zyN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020a05622a134600b002f3b09edc1bsi3504735qtk.412.2022.05.27.13.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d8Dx9zyN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugAC-0008Gm-W3
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefW-0001j7-Bx
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:38 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefT-0005LA-Ry
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:37 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 x2-20020a17090a1f8200b001e07a64c461so7794919pja.4
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rq70BX8hTMAI6b+cFkI1RRrKLuHgtJvjF5od3jr4Io4=;
 b=d8Dx9zyN5GjhIAOFuEqONCoFcB1Go+sySL9JUtyZxRz2PXkaPBwppQAqDIzRQNcE6W
 PXGnYX4fFyFYHuFu0jIXUX6ZRyd4L+/iI3xnLFvN+9jDOdpsuicxGEd1iUSEbERJO6gy
 mGWT9WSJVp5ayVNKNpH5Mbj75TlKrcfCs9JJ+MiQrm7EA7/W3AzpO4+WHVGnu2Kv1fOv
 eae6tq4/zlTkv7ELJAjFSWEp9cpdbyq4MWw90wWE9pnBQ3XwAsYedohwCruVPet9xV+J
 ka9EhagAWojfB2G2rsbC7EtH2tyJj7Arbpz15nwAkJFIo3XY/73z/MBOGiYpvlf+4sNU
 KHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rq70BX8hTMAI6b+cFkI1RRrKLuHgtJvjF5od3jr4Io4=;
 b=ane0MUWOJpohyVX6pkIZQl8orpZV6f2UtrOEbKrtlKWeEIxygcG7axC8kN8s6gZv6L
 JoXJ6PGQmHevbtgo1o9GdR2s3eVpUmvmlGRDL5H1/TqCC960t98B3cH6KugNmRiDdJLp
 +MOeeK6ouWmXU3+0vPg6zE2eOLOQxjdUHS7MDmW+y2hlFHWcw05EyFhjihWlXQY9HcWC
 PgeVqWX12FMBNG6wYpD9AbnVdmGTnUeqj4S3ZPoMcbYiGTHWd58uu7uklDvCTFQNC9lC
 KYl0LJzdbZroQJwWWGx0hBDKnJ9WtRuaJXz46ifQvcA6lfys0LlFUeiGXrD2fggxkOEf
 Tt/Q==
X-Gm-Message-State: AOAM533QK4M8XgbfYVlOkqef7z90+Qut76Gez1RBcAt7DkoiIQ1sdFW8
 xg+KlhAfQ+7gTu8L5gBgZF5LS1q7N3z/Xg==
X-Received: by 2002:a17:902:b698:b0:158:faee:442f with SMTP id
 c24-20020a170902b69800b00158faee442fmr45317894pls.75.1653675994629; 
 Fri, 27 May 2022 11:26:34 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 092/114] target/arm: Expand frint_fns for MO_8
Date: Fri, 27 May 2022 11:18:45 -0700
Message-Id: <20220527181907.189259-93-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: 1egVPynqJR7a

Simplify indexing of this array.  This will allow folding
of the illegal esz == 0 into the normal fn == NULL check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2f7651249a..99e5d89645 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4167,7 +4167,8 @@ static bool trans_FCVTZU_dd(DisasContext *s, arg_rpr_esz *a)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_dd);
 }
 
-static gen_helper_gvec_3_ptr * const frint_fns[3] = {
+static gen_helper_gvec_3_ptr * const frint_fns[] = {
+    NULL,
     gen_helper_sve_frint_h,
     gen_helper_sve_frint_s,
     gen_helper_sve_frint_d
@@ -4179,7 +4180,7 @@ static bool trans_FRINTI(DisasContext *s, arg_rpr_esz *a)
         return false;
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16,
-                      frint_fns[a->esz - 1]);
+                      frint_fns[a->esz]);
 }
 
 static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a)
@@ -4222,7 +4223,7 @@ static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
@@ -4230,7 +4231,7 @@ static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
@@ -4238,7 +4239,7 @@ static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
@@ -4246,7 +4247,7 @@ static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
@@ -4254,7 +4255,7 @@ static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz]);
 }
 
 static bool trans_FRECPX(DisasContext *s, arg_rpr_esz *a)
-- 
2.34.1

