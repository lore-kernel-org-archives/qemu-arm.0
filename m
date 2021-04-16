Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp823309lfr;
        Fri, 16 Apr 2021 17:02:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdOx4oQSwvYJPfPx+KEYJu3yudDOqHOPZjZc0o7HQj4oWR99joEvKCZ6SsEHxEZ96xTSIw
X-Received: by 2002:a67:2f90:: with SMTP id v138mr7986914vsv.23.1618617724523;
        Fri, 16 Apr 2021 17:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618617724; cv=none;
        d=google.com; s=arc-20160816;
        b=NKbpvFRbbAJyVw6aDyGKKZB8p6RoLsOlyhEsFzptEXQOnOdx/d9S5Y8mlrIJ8yGKwb
         ObDOGIEsoJertvKzEcUXbq8kaemf4/IVSUI52XS9OQP8fd781S64PKAlb7wgSlzQFaT1
         7RbmvTVwoZX+7Q7gSgvD//X/AsktwU1coMMap/r+veZUrslsl+ZLqrQODVrhGth9kPW2
         HsdoSeAJrhRkHyJjmm1HvgIS2EmKUKV7IyOIbBBAqPIRPXxS2l2sWjoAUxaKbh6nLNLA
         KwCfiQTkRUOfHhZ9mQPh9S8KFU5jiXm3kNc4798GJEDZYs3+8qLcliUW0YWYoz+I6K1N
         Astw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=doLgHy4UzU3or1oUi8sNNPd0558SCSQfVTW0p961kLw=;
        b=LP83V/SG206P/lXP2DNk3wT/w4KRWQTHKqzDTKt+hPv7L7pg+bOTPaGBPrhfbjPTmA
         02qUGfKXanJg4HHOhWFcGg6AV5Z3A5YyYE3ADctIppbjpeI1GT2XkYViP7cH5rgLxEz2
         R3NNEV3+F/C2wxa57GBA5pdxCXi8WIGOnTV3w05nTWDUe9oI8AFGO0uv7CNjPAawh3vn
         8iqt1kpjUWSVFaPTyOPGJiNbn82y5NwE9/oE93nNNjIvm6c875CgC/BsWYCv1NuC4om/
         12izLfsxAVCGEpVdBsO0xYVyw5Qbc6hHVhu1r4Ytaixs17TVNgN9s8KwuHD6VTOgtolA
         ctRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EZeWxHLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k18si3657443uab.66.2021.04.16.17.02.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 17:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EZeWxHLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXYPT-0000Y6-Ne
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 20:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN8-0005GM-DN
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:38 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN6-0005dV-JC
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:38 -0400
Received: by mail-pf1-x42b.google.com with SMTP id w6so4825585pfc.8
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 16:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=doLgHy4UzU3or1oUi8sNNPd0558SCSQfVTW0p961kLw=;
 b=EZeWxHLvTsBDaWu7zXTaKI89eMrv/T79BdmHiBX3R5TaCyO5XBy7KJKmLklC9XXEt4
 i3JC8BB2eCJU73BQM2RndbYyZPyYCE8yifnNGtVQW2vD5CisAxRYKfJ6/pf11OMKxsxm
 ki+PA8SsiHU1w5qpDRF5zxJE7AIzgUmsFJ/jESKGaVmMmG3TJnBsaB5CfGvPJ1qU1RgB
 aJ5JYD+2oKyec4NX48KY/nI/ozWMJ5gMpaerqK45B5gstnm6bOxJPb+qw2+NFHnCScp2
 orsWMe4k0LGZiQnZcc94cuOwgkBUXnEe5gX3K+wW7ZrKsBPKzORtALAXHIFk8/3kiYM9
 hkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=doLgHy4UzU3or1oUi8sNNPd0558SCSQfVTW0p961kLw=;
 b=EQHGe0XWNJXvsiW+Lq5WyLb6KK52rDuh7JEyllovMLOQariF8TKNrU/Rzf0ehOdCfp
 Yqb02D1rY19vQZYzUsg1ze+9rxP9/OrJpwcD23/Aia3ibToCptNX+k2NDPzlxMgxmzG/
 ftJzWR/Wn6lRA3WPw2sFUiT9Rrl7DVMsskkyBpvOELi+X2SlnmivrweuLA3H92eE23H+
 PXv0l/GN/Pl9KUrWPmyslJVyxn5TRTrmPwrhxaphzz/Vn3s8SguPjBTDtQ8V4z+3dzKt
 RXAR58JefhzLXE5TtnT2EX/BlOK7ZBgf+RVWVDL/HYcG3BBALdfcwiNB/rk15TRtObRk
 g+2g==
X-Gm-Message-State: AOAM532fS/+ayB+ln8gtNGc67c/mOKfnoUOj7XXWrUGmi9AO1HQc420D
 r78lz+JnNc8qEtG4ug6jXGmZmA==
X-Received: by 2002:a62:52c7:0:b029:255:e78e:5069 with SMTP id
 g190-20020a6252c70000b0290255e78e5069mr9612330pfb.45.1618617575158; 
 Fri, 16 Apr 2021 16:59:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/11] fpu: Add float_round_to_odd_inf
Date: Fri, 16 Apr 2021 16:59:22 -0700
Message-Id: <20210416235928.1631788-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EhIwNJwX6yIw

For Arm BFDOT and BFMMLA, we need a version of round-to-odd
that overflows to infinity, instead of the max normal number.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 4 +++-
 fpu/softfloat.c               | 8 ++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 8a3f20fae9..3b757c3d6a 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -134,8 +134,10 @@ typedef enum __attribute__((__packed__)) {
     float_round_up           = 2,
     float_round_to_zero      = 3,
     float_round_ties_away    = 4,
-    /* Not an IEEE rounding mode: round to the closest odd mantissa value */
+    /* Not an IEEE rounding mode: round to closest odd, overflow to max */
     float_round_to_odd       = 5,
+    /* Not an IEEE rounding mode: round to closest odd, overflow to inf */
+    float_round_to_odd_inf   = 6,
 } FloatRoundMode;
 
 /*
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 67cfa0fd82..76097679b0 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -694,13 +694,12 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
 
     switch (p.cls) {
     case float_class_normal:
+        overflow_norm = false;
         switch (s->float_rounding_mode) {
         case float_round_nearest_even:
-            overflow_norm = false;
             inc = ((frac & roundeven_mask) != frac_lsbm1 ? frac_lsbm1 : 0);
             break;
         case float_round_ties_away:
-            overflow_norm = false;
             inc = frac_lsbm1;
             break;
         case float_round_to_zero:
@@ -717,6 +716,8 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
             break;
         case float_round_to_odd:
             overflow_norm = true;
+            /* fall through */
+        case float_round_to_odd_inf:
             inc = frac & frac_lsb ? 0 : round_mask;
             break;
         default:
@@ -771,6 +772,7 @@ static FloatParts round_canonical(FloatParts p, float_status *s,
                            ? frac_lsbm1 : 0);
                     break;
                 case float_round_to_odd:
+                case float_round_to_odd_inf:
                     inc = frac & frac_lsb ? 0 : round_mask;
                     break;
                 default:
@@ -6860,6 +6862,8 @@ float128 float128_round_to_int(float128 a, float_status *status)
 
             case float_round_to_zero:
                 break;
+            default:
+                g_assert_not_reached();
             }
             return packFloat128( aSign, 0, 0, 0 );
         }
-- 
2.25.1

