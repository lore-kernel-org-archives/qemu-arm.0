Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1254217dyc;
        Fri, 4 Jul 2025 07:30:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYOyqQx5FFs2DrEwFHcTJ2oSqThSZCeQV6alfFWxhLNjjOCouo7Q7Vhr28e8My7QFozhn6VrQ/ROuWFg==@linaro.org
X-Google-Smtp-Source: AGHT+IE4NpwZEzBKSwW7KPlerKimJLst86PPu4UAYMEEyKLPSNha4waC1ZL4tMa4Zcpw48K+ltmj
X-Received: by 2002:a05:6102:41a5:b0:4eb:f8aa:9c36 with SMTP id ada2fe7eead31-4f2f1dc1aa3mr1580266137.4.1751639403866;
        Fri, 04 Jul 2025 07:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639403; cv=none;
        d=google.com; s=arc-20240605;
        b=icerccCUrR5C4Ly9OjNbR3IjydlwDFFt/y7h/7893SEnPH1Q+sw1/T/iEF1UzArhr+
         cCtl57mNIK5jtdAz5PMEbX9fE1p8xNmwUAXjm8SGH47fCwWVb6O78DQNy/buJ+k81vcM
         Yz0GmTiHD58yYDQizlWfsGoVbMbcXJ1vo4D9KDrLC+lUO0/fGJe9iezjzm8uZ8QEtxt3
         K3DyvCzmz9J74erelsOjqIVYtWSui6RJw8yCp0YUZe0dCvO5XjwBRg3kMK5/gvD29+z9
         vPorUDof1jCaBkpWdNrT+t/uPnmntWbHpaFhqivowTJLhWJ0zzGqM7NTeIBThYvy7ZVP
         ZZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N99/thIYmrVhphn4jsghLGsBrndERIdHe0ir0x8GWEE=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=dHv3OHZQtYk46GdNfbqKkGEjrQ/+F8q8+4a/PnPz8frD819f03vjZ4oLtExno6xGkD
         5OEXWpDZNOCvKsCT8hEfz8l/OFQJwhBjYIib+9WsF3eBz6NLZujf0Y/69bHrKnQT0zW1
         gJDWg5xLNwhXqwu7x8mNQ2lRxHtEagU36gI2x1D62Q2Hfj1XX9IdntoTDqFDGPMHOJGq
         xH1tXRzb7rtyhI4uMhiIp52u4OJ9bFj5yHNxRlPJv/QOdj5oI4t0y5/Ks2MkJHuZ/sVS
         jZhNJsCoNey7v2ia/aQXAk+g8n6ZMZc6CRZO9bUxctRfcseBo1qmsmqwJ8yaYLV1hSE2
         IbpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYPdP7Gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea4e8c9fsi848018137.32.2025.07.04.07.30.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:30:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYPdP7Gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhN9-000768-PS; Fri, 04 Jul 2025 10:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIW-0005Vr-9N
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:52 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIU-00069A-Cf
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:51 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2eff5d1c7efso814181fac.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638909; x=1752243709; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N99/thIYmrVhphn4jsghLGsBrndERIdHe0ir0x8GWEE=;
 b=KYPdP7Gd+T7jWW+nuDah7b4liP7rfW/Tgf/26K76duGE4NPuUd8U+oFxfrMQUn7q6w
 vJB1Yb2xPD5oZWCKRT80T1U3sMy3f+7B4sGHdwFOxwUh0amEjBS9aPeRYxQiAFNWtCj0
 S7VHc3hAfy4xOaSwdH1twa7TuGauBaWEsFrnNyeezAP6uYuYcjzXuX/1isbcmxJW4WuX
 cH4ajJ8OQHQ9gyFAubWv8hkMwUkwnsTlePMRqCgF8kpQEn8FBFnA0ckAzXL9hrwhKv0e
 Z8cD8+waMgcPIvAMRqkxG0VTxVT9p6y45JBoj8cZ0JFNRrclwKXpF/1+6zo7/Br9BCgi
 OgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638909; x=1752243709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N99/thIYmrVhphn4jsghLGsBrndERIdHe0ir0x8GWEE=;
 b=AeftnrXhkoYaruxCs5NeJyZBQ64wG+ZbVyryu+iB5GBh7fFcPPa6DQ/iLzx8X6qQEo
 BmJTHliUXSGbXT1/czJDI0U4J+YdB6+QnkbUHwYV1SFxzajnuZrjmhbrZKyvsEJJMLAV
 nKE/8jcLneCRJid6j3wAvjqYif1tPNZ7xeXG4tqCw2ZAY2rx6J5bbIDUe9+e4o8NexMz
 WmIASYgzU/wshkrcW1JJuiXNf9oa9XJoRZN5v/d6pUyOMAleetv1JP0xmbrE8xMkBE0c
 VzhQ8v9bq7nY6g8hvGw+ZT9+Oh+7cXZpG+tB7oYtxMRtdZC/5u35eTEnuY5iVMwTiptG
 lUIQ==
X-Gm-Message-State: AOJu0YzYj++faFgQ1bOTN37r44owh6RxZPxHmU0/+Qqhzfeg45WQMVO5
 lkAORCt6OGGhU3hN/tElF6c/HAlYwJ6JpIRm6zwOVZ9Fo442d0gVUFDA5yXRQDXXy12JQhe8anW
 Eeqq4u+Y=
X-Gm-Gg: ASbGnctULk5V/KRnULpxKW2H2h98LRVsjTr6n+QGUB+hks8MjDAMbI662edogQKkqWg
 sz0cLjCVaUVpjUAEKXXYLGVwFE4vQf3yNkHBs9YPrRGEs03s28C15BgAvO3JWCfbvpAOdnWHldc
 EMqPVL+i1fpeb+nAO1YQ/UDwIJolc+3fgl+kZqYqrgjiGfBCHoq9+rYRX1Wn4URxN8jJYEKkzfl
 rc12O5jjdFyxSoZwwvYBvJXyYvNxWzavSxwXkj+aeef3WM/xHt7cUqBrG8oQ+ErNlhTCHML7WrX
 BCklwaJv1BgQ+6dyF0hmnc9ocLcaMa3niulDGhK9uUuYmaFmNH0qJ+QZG3GDtvZBWSibQiiwxGh
 FHoWkfg5XKwvA6UbNZVhfGjpPe0i2WM+72PnBGkVZKNAy5eW6
X-Received: by 2002:a05:6870:5588:b0:2b8:e6f2:ba7e with SMTP id
 586e51a60fabf-2f796aaea72mr1847358fac.12.1751638909157; 
 Fri, 04 Jul 2025 07:21:49 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 034/108] target/arm: Pass ZA to helper_sve2_fmlal_zz[zx]w_s
Date: Fri,  4 Jul 2025 08:19:57 -0600
Message-ID: <20250704142112.1018902-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /dagd+rLU446

Indicate whether to use FPST_FPCR or FPST_ZA via bit 2 of
simd_data(desc).  For SVE, this bit remains zero.
For do_FMLAL_zzzw, this requires no change.
For do_FMLAL_zzxw, move the index up one bit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 2 +-
 target/arm/tcg/vec_helper.c    | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 7e304245c6..b85bd885f9 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7214,7 +7214,7 @@ static bool do_FMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sub, bool sel)
 {
     return gen_gvec_ptr_zzzz(s, gen_helper_sve2_fmlal_zzxw_s,
                              a->rd, a->rn, a->rm, a->ra,
-                             (a->index << 2) | (sel << 1) | sub, tcg_env);
+                             (a->index << 3) | (sel << 1) | sub, tcg_env);
 }
 
 TRANS_FEAT(FMLALB_zzxw, aa64_sve2, do_FMLAL_zzxw, a, false, false)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 8b49577e2f..e8467823f2 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2191,7 +2191,8 @@ void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
     intptr_t i, oprsz = simd_oprsz(desc);
     bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
-    float_status *status = &env->vfp.fp_status[FPST_A64];
+    bool za = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    float_status *status = &env->vfp.fp_status[za ? FPST_ZA : FPST_A64];
     bool fz16 = env->vfp.fpcr & FPCR_FZ16;
     int negx = 0, negf = 0;
 
@@ -2274,8 +2275,9 @@ void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
     intptr_t i, j, oprsz = simd_oprsz(desc);
     bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
-    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 2, 3) * sizeof(float16);
-    float_status *status = &env->vfp.fp_status[FPST_A64];
+    bool za = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 3, 3) * sizeof(float16);
+    float_status *status = &env->vfp.fp_status[za ? FPST_ZA : FPST_A64];
     bool fz16 = env->vfp.fpcr & FPCR_FZ16;
     int negx = 0, negf = 0;
 
-- 
2.43.0

