Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1256723dyc;
        Fri, 4 Jul 2025 07:33:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQDYd31RtjWNIxoBsiWVmfy1YXXlMnCaeGItARnud3hrBvw/mEF9cZKLRwdOPcsqm3sX/7yQxe+KbPkw==@linaro.org
X-Google-Smtp-Source: AGHT+IE1on8F1+Q8rFrz8PtuSFaiLsu9yrqQoKz8RHWxrGT1H+iV8LLXkVCGERzj/9vb1/mhPJMK
X-Received: by 2002:a05:6102:5123:b0:4e5:ac99:e466 with SMTP id ada2fe7eead31-4f2f23dbd39mr1467146137.18.1751639616255;
        Fri, 04 Jul 2025 07:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639616; cv=none;
        d=google.com; s=arc-20240605;
        b=aP9sW7Dcdpmf4vvx8jfRzrkE0py+2Hpea/aV5ASKrAZy4EPrTG+zlUhG0g7wHWWlZX
         a8QlUCJ3nAdu5xyOrh4duUAaqVJ9jOePyxLWDjD/h7k/ppwoASeCktnblkr+77kDXhUE
         BLTYnWjxJmcduVgK+Bpu2mBpoGkQQhDbBqANeYNP4rKY/T/k7XtAMYF4uyufF2Oq8ZoB
         54yPrR7DDL40xqyV9kdybZ7UCuGJVKjtVVYGseH9rW0blrtSmBzs7tXGDNb4MQbBK9Ur
         CqnRThaMtJvDypz2Eg0FXQdAdEzHJjFvx+P1jhq/qCos2h0g9BXk2LkrwweIlW4cbP1F
         a37g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wpo5YL86phg7e3gQ3lunP/NsQqxYcAUD6doV1Hx7zww=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=Kzkxer9p9f9bzT3a0WPwW9svHawixwn5pXWJMfQtiP6OtxC+g2fxm1goXaPJUT1DB0
         KFBoMQuLHWnNkhlRZGIR9Wo3rsatPA96EPKORQTihku+o236XLtTjdRmgCXAPorMxboF
         FFBj3h0Y1HRrJg9mpQUZkLKSOr5mT0nuNvJNxTWVzI0FnwT0XSOgBk56zou5idHcl8O+
         O1vR/gK4fXpAOXqCynnO5x2jU4JjUjJc6WeswqGj+Z4euEVQHj4wlaqv9bqd/aWGhQNi
         UnDONcoA9ab4MTzKjdXs9rAiKzbzLTwHAyHQ5czx9EX39ncMd6rkgoX6mH3VpO4oISyW
         n/BA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q4VoHLXc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea731686si771144137.443.2025.07.04.07.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:33:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q4VoHLXc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXhT2-0000YW-Pd; Fri, 04 Jul 2025 10:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM7-0004ev-Uf
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:25:41 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM2-00088g-LW
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:25:35 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-40ba3d91c35so736677b6e.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jul 2025 07:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639129; x=1752243929; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wpo5YL86phg7e3gQ3lunP/NsQqxYcAUD6doV1Hx7zww=;
 b=Q4VoHLXcb9iKleJQQGr0lUmNLuVkg7uDEi6ynoyRR3FdoPfJdJVR0/2Vq36t49ZaLL
 3yWeqthdnBQ6vIs7IzKNrwLYDlsNEWUFCIXuz1gARsJ2KLryrGsyMiJO4RXwtoD6Rzes
 wV6FJSjJJvyBEzCXZTNwYMGU5mtTEXbphxkbcuH9wU39xyqWPxonOBiQ4pcjALKlrNYA
 mylgoijQzi7CwyvfohChXrS94j2lkMjWfiBXkCvWK2NzFmssNdMdBTKcZyOwpjgRZvEl
 bZVCQmH4NrDQq5xjBAfdKJOJM6bNdFr+o4JVIvBCTYvCRNAJ+rhHwOypU32zSD59BlyN
 UpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639129; x=1752243929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wpo5YL86phg7e3gQ3lunP/NsQqxYcAUD6doV1Hx7zww=;
 b=mVpSqhYsrz2cBssH7SPENFqmvNVIc8vcvVOzVWjYO0f63r1Mui6SXw+BzvEWHIlkRW
 nZE83ppZqEmVKqksk2vUC1kx+PHxucS+YuHS5F6eI+LIaLT679ChDFPBA4S6JUqVV75k
 SXjM1pTqMWV6UT2U7PpmKmDSGR4a7+2GquwaTQNeLsCSPHNUKg5mAmTjtoLIg26Tiwoq
 6XHKYsPQBbcYOREkjRKjLdfe5Ux6nmq22v2DNDPM2u8cKAdT6qSdCiaV2Cs3s7keS5yE
 96P8keVypqCZL/GLX2hpamoUhVFXGs+TvFHf5cQ17obGP5uB1DrBlrLfrzi12nE8+01p
 YD1A==
X-Gm-Message-State: AOJu0YymyDi+jzIUFK/cUX22mEvBcXkpMvwxhnSkeF2wiYbOUVmJED6A
 lixUHu5H74tJtlvW6hqwC2FkWUxFupbBjLLUiJmNRFkplM3KtCRzWMpb/lHAZvC/tSuit/KLE8Z
 0ec7wz1Q=
X-Gm-Gg: ASbGnctSnszxwvmPmjW35NtpkNHZ2PDiTyCtxM2wKkX0Vft1iAvV3H/jFua4JRf8uYa
 DYti0WJPzZ418Vum6m5/b8By75huWOzkU33+nZzZYKMeZUIROb+q68I8MnGw1w5FDfgqerXmGWc
 SoJmGATao0HrL+quG0dw2lXL2dnGevE6HVFk60YG5pSwXLVBFLFb6XTU9LIRH7gFX+75aqvqjlQ
 VffwCL8o0i3pp2s7x0DshKbXAqelpaHiEiVsFZQ05IVQVEYLc85LytiiMRx7AAMvbABS1COtGhj
 +hGaEjWhXOkqBNpLEHf2a6LXpMR23gWOkWLWf849bXNprda1KodcE8adPwQs42/OdZxLfH4aH3u
 M6TxqXOEpmKTK23STeBxgNeCDAMjnbhHEpkUIasGs/IM28oTu9P2Rt9z2vIw=
X-Received: by 2002:a05:6808:211f:b0:40c:5b58:c9f9 with SMTP id
 5614622812f47-40d073ccd23mr1493081b6e.22.1751639129235; 
 Fri, 04 Jul 2025 07:25:29 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 071/108] target/arm: Fold predtest_ones into
 helper_sve_brkns
Date: Fri,  4 Jul 2025 08:20:34 -0600
Message-ID: <20250704142112.1018902-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 759rJAKykkRU

Merge predtest_ones into its only caller.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 5b5871ba13..492e42acc8 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4061,31 +4061,25 @@ void HELPER(sve_brkn)(void *vd, void *vn, void *vg, uint32_t pred_desc)
     }
 }
 
-/* As if PredTest(Ones(PL), D, esz).  */
-static uint32_t predtest_ones(ARMPredicateReg *d, intptr_t oprsz,
-                              uint64_t esz_mask)
-{
-    uint32_t flags = PREDTEST_INIT;
-    intptr_t i;
-
-    for (i = 0; i < oprsz / 8; i++) {
-        flags = iter_predtest_fwd(d->p[i], esz_mask, flags);
-    }
-    if (oprsz & 7) {
-        uint64_t mask = ~(-1ULL << (8 * (oprsz & 7)));
-        flags = iter_predtest_fwd(d->p[i], esz_mask & mask, flags);
-    }
-    return flags;
-}
-
 uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
     intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
-        return predtest_ones(vd, oprsz, -1);
-    } else {
-        return do_zero(vd, oprsz);
+        ARMPredicateReg *d = vd;
+        uint32_t flags = PREDTEST_INIT;
+        intptr_t i;
+
+        /* As if PredTest(Ones(PL), D, MO_8).  */
+        for (i = 0; i < oprsz / 8; i++) {
+            flags = iter_predtest_fwd(d->p[i], -1, flags);
+        }
+        if (oprsz & 7) {
+            uint64_t mask = ~(-1ULL << (8 * (oprsz & 7)));
+            flags = iter_predtest_fwd(d->p[i], mask, flags);
+        }
+        return flags;
     }
+    return do_zero(vd, oprsz);
 }
 
 uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
-- 
2.43.0

