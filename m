Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5374821lfm;
        Wed, 26 May 2021 05:19:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPAyGCw973Z5YKE+0OKpBi7BSxEKF/iONXm4ESg1EnyDndCfnTHALhWmbl4Ws91VIHYb/+
X-Received: by 2002:aa7:d0d7:: with SMTP id u23mr37898266edo.147.1622031568888;
        Wed, 26 May 2021 05:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622031568; cv=none;
        d=google.com; s=arc-20160816;
        b=e2UJrjUKp6TuzfHqWRdsxy+pYXXAYV145cVIhv0jYsV2j1lp0ycWUgEQ9EvlE98vcL
         ISoHzI9BjUNuuGfQ25e2LnCLRqHpSfTAp4OenSlYgIi7rC3TxcSXkS672k1sE+k82EvU
         6G3iySzOHv7hTxzSML54pETIm+aV5/kFhtYCOCqEbUHH5oyWaKrKxzGwVriZNQMx2i7k
         ZhG+jaeJ08HmDhbEUEZEID1VXJbZecTHSo0KA/8oTBDvh9t8QNz39c6QHI6BElBWqEEu
         1UDGdsctfxGGgBiAcu8qdqORoZnJSntl8/r2w68KzUa6Bjy0+krMTlNuqRzS8rtYmDd2
         sUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3PQhiScHPkNKcCY+PhXTE0UGJiFJX/FPoJRFcJeb+U0=;
        b=x0O5KfI0Zi/YUvJhdYiGoyFM6i7gO2h0peC/qpvIgtxpxz8wPpDnd0yW7HEdY2+xb5
         9zD2DnSEF606oo7nSZrpqLqWIzXOZE4o72rpS1Ds314MhooQX62WxzFkodyz0F+o8b14
         GaMMrmq0n2kefsNR5sjseKYEZJ8XT1+JQFU43fY8Cv4502Sg7Jck0QYsCWywvuZ7+bOf
         eN8Ji/aAw/y6gJ/fNzFHIhWODANGDFNP1t/lSSBrtA3nmoMdac4A+3WdUFIdthhA5JpU
         iZdnH9oh68rwdJkTrkbUg8LgCQ0Q73lR62hEaBWUrB/ef/rKEEitszPU+yT7T3KWUH+z
         oa4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=OpUxCrrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi15si21645257edb.459.2021.05.26.05.19.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 May 2021 05:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=OpUxCrrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llsVU-0001dS-1F
	for alex.bennee@linaro.org; Wed, 26 May 2021 08:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsV6-0001aL-Hy
 for qemu-arm@nongnu.org; Wed, 26 May 2021 08:19:04 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsUy-00033k-4L
 for qemu-arm@nongnu.org; Wed, 26 May 2021 08:19:04 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso363452wmh.4
 for <qemu-arm@nongnu.org>; Wed, 26 May 2021 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3PQhiScHPkNKcCY+PhXTE0UGJiFJX/FPoJRFcJeb+U0=;
 b=OpUxCrrXqnAop+Smfw6gb/h67wmtiVBhoiTxyI9RdJu0GgMBdKVFHdR1dgGqvRBx2L
 s7BGEwAUZQyxBpuIvHcFGuYyxcvqyu7PHtCJTQhZz5FQNgNqynij5pIP+96/biiSZisW
 jj/WgPmyAzSVzDQYJQ59PhezGe3ROXAFmhAhpT24o0n3OxLo9BLoXCeSu3HZxINww8lA
 F7v5JCa1csryj6+JmTK2ZCt1rnwj1cG32qvGQZfW4q+/THrWGWy0ZW9Aao+6LGhZRJ74
 PAC9g1dLCRAYbkGQMkIueVyfijS3biBOgRU8Ilo+y1FqG2ZdXBV01/TPzb5p/Yv76+zU
 8IxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PQhiScHPkNKcCY+PhXTE0UGJiFJX/FPoJRFcJeb+U0=;
 b=M7ay3JuJqh5oNH4FMQjml0ts5RkspTnw23rwRsNUrI08FCSY5fG0oETLGdgXc6MWkO
 Hsx/Ed5uYsg14pMn/dlfOLoapWru2lvVBTbeebK4gIlOoilhAsyYJQXbHVQWUNck3zzX
 0lXjLyrCr3nXW1IuHril4fOfqPnTpF0uFAL6tv4lWpLeQEradehFXoI9mQH9fXP8cXjP
 zu/igA91kzckSteXSzoINJB2syBunECxuXlEFRNHSqB1f8wtUnJakYvOcz6psxgXk9EJ
 O4BgeIFrfbW9mAtxj3UtDKbxeFp4aisDoaJVUsmThd3kXG/4StXiuh6FBPHSuqFJPcZQ
 /VpA==
X-Gm-Message-State: AOAM5336YrB5XDSUa7rhvD1sVU1VnY6UvB4Ea+bYFkygAsHKX5O2hZqh
 etqkJ54vBNJd6RIO9lVXBcN/KgjuxJH42rxCDA6ZkkOX/1XB2oxuBpO2TEKO5OdjzwkTtUZ2yNt
 zLMzqw5wO7UiBPt81bUP2NRF5aD9FKK8Lx6Hz36hcQ/2qWIULe/R60woUhVv0QmGYOA==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr29180288wmb.45.1622031534171; 
 Wed, 26 May 2021 05:18:54 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id n13sm21000887wrg.75.2021.05.26.05.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:18:53 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2 2/4] target/arm: fold do_raise_exception into raise_exception
Date: Wed, 26 May 2021 13:18:45 +0100
Message-Id: <20210526121847.1935454-3-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526121847.1935454-1-jamie@nuviainc.com>
References: <20210526121847.1935454-1-jamie@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jamie@nuviainc.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7zls7yEBkJp9

Now that there are no other users of do_raise_exception, fold it into
raise_exception.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 target/arm/op_helper.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 078ed74ab962..3b3daa955598 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -27,8 +27,8 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
-static CPUState *do_raise_exception(CPUARMState *env, uint32_t excp,
-                                    uint32_t syndrome, uint32_t target_el)
+void raise_exception(CPUARMState *env, uint32_t excp,
+                     uint32_t syndrome, uint32_t target_el)
 {
     CPUState *cs = env_cpu(env);
 
@@ -49,14 +49,6 @@ static CPUState *do_raise_exception(CPUARMState *env, uint32_t excp,
     cs->exception_index = excp;
     env->exception.syndrome = syndrome;
     env->exception.target_el = target_el;
-
-    return cs;
-}
-
-void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint32_t syndrome, uint32_t target_el)
-{
-    CPUState *cs = do_raise_exception(env, excp, syndrome, target_el);
     cpu_loop_exit(cs);
 }
 
-- 
2.30.2

