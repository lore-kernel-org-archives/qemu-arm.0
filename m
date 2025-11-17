Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937D0CEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 01:42:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKoF2-0002uE-K5; Sun, 16 Nov 2025 20:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEg-0002ZA-1J
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:55 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEd-0005yh-8F
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:53 -0500
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4ed75832448so50434611cf.2
 for <qemu-arm@nongnu.org>; Sun, 16 Nov 2025 17:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763343649; x=1763948449; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ihipyb7Ru3/tHKU6eXELZTfZpiyon46Jva01mBoEaT8=;
 b=YYn175VRWcuoDHDge++TNRYyX5xUEimMmMdu+44ZvrLB2/dGE9a//jhcIaVx/Ok+GV
 WlVWOGwP9zlXqXbEEuc4Qk3WwxxUl3FmSIJhFnwR6aBGDiEtfpWY3Fzstd0mxkrGmImt
 Fyb0ugyRhDRfB+yIZbUIa9pe29qfce2AwooLjS2t8kUjrTL4CJT8VllC4XUMzND7hVr+
 oCiGo6S4ZE1cXq04oeHwUCHPuObdByRHdqp1NhYBUJKrxY/ph7ugRbBSKBuSUkFDi51z
 Pzk8ULrRfD5F4Zg+arIADBQRiZW+6+5cpfxzs7+1NRQoeelEfs+RUQ1tgX4W6lE6W15f
 Xlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763343649; x=1763948449;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ihipyb7Ru3/tHKU6eXELZTfZpiyon46Jva01mBoEaT8=;
 b=kzf5JNSH0vMYmbkG3LRX3UkxY2Arl2irZfmTfdlVbe126cUW+Ojd7mEZclLNLlyKB+
 uIbwLXXLZGvyXOV6VFmLinbfnCR+F/rG3tK7+OgSE4Ht4vjUP6GsEqq22wwbrzayx2Ze
 8sqdyarkiQUvZQC9mSwSAm8nH3FluwxqRwnUUP75H8gQndm6qeMFYIGjM3tzT8jahFNj
 HbQFI4Az0/pXWyIt9DuRFCW8vH019/WLJYsgoSYz3b+U1j7QvUEzGkhafLnZbhtEHSug
 vmzch2gFZ8nTOUiHMyA9eVnnnHRWi8OznnEQktfI8r0vq2riX6Ts3ahnrQDySOM71erA
 c3Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU01/DY4W1cLNa7H59bZfsqS1+zNOWlXcwae46+8h1IOkULBCvbsTIspyHGa4wv9fvhVp9kE5v71g==@nongnu.org
X-Gm-Message-State: AOJu0YzClrx5GpeoETauZiNr1OcuZdXyb9J8FFvttf2of7D1H6S3Aniv
 XI4l099pXFrvoSO00m3rUCzOiiQiNf3gcrmGBVnltjIfDTJ6muMsiVeeStTU1eRl
X-Gm-Gg: ASbGncud793IcbpHAw+0LKS1w0geEjdgFX3RwfVBXKX5TASjw+w4La3+aapV1KjOJ9/
 i5FvSnLzyyJEuEoEziOKH0UuyuYkJxXQBJckcxcgNYgwwIAB8GsdX7IhWknUmMtBeuOSEKjS90f
 IofNakSDsK4ohE4l/oikqjamlOxJ1jUKcc5x2mZBZl96nqf89kXcVyw5x4Ll6801JipNb0HLT6z
 QCQZLv36dS0W7Ht5hz1tRSa1A7Js4ecoVajhY72KBPwt5r562pONYx9+sIja7TY5LPenGErqYLb
 YVRBzsuZZO/+gUGXPLuAzOcyTtF7K1zZf7+D0+pq8DxNfrYo33vSO5Usk8Y+FHcqVLRYmIDyHhN
 p1D2Zd263QXYzF6sLai74cNPGAR7Ww4l2n2nLu23+f/QuUTPeVPRS+mz8qXGx4kSnlvQDLzN9wz
 JzJfmNMg77aJLWfdRx6WE=
X-Google-Smtp-Source: AGHT+IE8lG32RhNeLkm0p2860xTfDGao3wwHUblBvro27NZk8A1ratAQ78qSLwkIe2DQNIu8RN9cBg==
X-Received: by 2002:ac8:59c1:0:b0:4ee:24d0:454f with SMTP id
 d75a77b69052e-4ee24d04d27mr10407171cf.37.1763343649047; 
 Sun, 16 Nov 2025 17:40:49 -0800 (PST)
Received: from [10.0.0.22] ([185.213.193.149])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee1c21ea34sm18246551cf.30.2025.11.16.17.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 17:40:47 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Sun, 16 Nov 2025 20:40:24 -0500
Subject: [PATCH RFC v2 07/10] target/arm: ldg on canonical tag loads the
 tag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-feat-mte4-v2-7-9a7122b7fa76@gmail.com>
References: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
In-Reply-To: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763343639; l=1576;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=fIipJW6zdB7cgS7KaJpOQoZAsxlcOoekAcIhgxUqYiw=;
 b=13d11fAol537wMifs7Pn6MTr+3m2Tko6JIS2dccj+7Z4vtRK12mM2Zm1rrA6feIc0JkcGBp17
 8oi1QxR2nkDAo15iGA2BK6tMO/TyDjHpageud9o192jWH2TWIa35FWf
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

According to ARM ARM, section "Memory Tagging Region Types", loading
tags from canonically tagged regions should use the canonical tags, not
allocation tags.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/tcg/mte_helper.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 513ee8d6a1..ddb68e11fc 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -279,9 +279,14 @@ uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
     mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_LOAD, 1,
                              MMU_DATA_LOAD, GETPC());
 
-    /* Load if page supports tags. */
+    /* Load if page supports tags. Set to canonical value if MTX is set. */
     if (mem) {
-        rtag = load_tag1(ptr, mem);
+        uint64_t bit55 = extract64(ptr, 55, 1);
+        if (mtx_check(env, bit55)) {
+            rtag = 0xF * bit55;
+        } else {
+            rtag = load_tag1(ptr, mem);
+        }
     }
 
     return address_with_allocation_tag(xt, rtag);
@@ -444,6 +449,11 @@ uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
         return 0;
     }
 
+    if (mtx_check(env, extract64(ptr, 55, 1))) {
+        shift = extract64(ptr, LOG2_TAG_GRANULE, 4) * 4;
+        return (~0) << shift;
+    }
+
     /*
      * The ordering of elements within the word corresponds to
      * a little-endian operation.  Computation of shift comes from

-- 
2.51.2


