Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BAEFD707B
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 11:12:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2SKg-0006pc-IE; Tue, 17 Mar 2026 07:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w2SKe-0006p1-KI
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 07:11:28 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w2SKd-00012a-3p
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 07:11:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48628ce9ab5so6732995e9.2
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773745883; x=1774350683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GZF9kn1GifXuriiiuFYGF1LFBi6if1Y7iHvqUJJdTkM=;
 b=pUzAeKrbWP/KXa8rMO4k36n/VrlGfBBBXhA6unSGWH8hegF/oJFyAM8H2bS1Xlolks
 JmAwWFE8g+xEdJ1jRaCrKV246jLEL/zmkjIrQ0dayeXPl92H+UEVJ3gkvx5NSVh2wsLU
 9qUvsQdQsoK2zvXheXdv6oXYy11ojO83KVEalY5bPkauC4pfDJjCoKJdauF5guUswNZm
 0VZt1oG1pRE+52U/ZBMPyxn31sEn0IqxdNxuNwukkBwLJHdaiRQIDT5Ki/l8MvAl0zWB
 lOa6kvaF3jAoe5MdS2q5LiweDzdWVT281nnkAVfdXCPhnFbbYEfK3CKh85N73cpOqe0t
 cAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773745883; x=1774350683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GZF9kn1GifXuriiiuFYGF1LFBi6if1Y7iHvqUJJdTkM=;
 b=rk6UNy2X/pZcsWkAmmdkS3Xg0qH7VcmwaMr5oWleHx9ZSjFuDQ5sky3DTJKbYzJuBy
 KRCjMLsGFV6+Yp0C/Gn7+WaKdeebBKBBTeFup2O8y780xYoL+zViz8CC/lkJDUrlMgLr
 xIX3zXzxBVLm7VXaJfA1tmyjlvEDldWdyLQ/VPs8f9x2+JKoA067j5hMnHWT2RJKw2Mo
 bjQjFJ4E//KRWGMhw3S1aBjr7m2XLbEvFLpzKofYRkcwLobLfOFw2/VIO0mPHu6be80N
 hucCZmvWr6SU4j52QCEilegDGTF0pZhjEjHhW3RJuNVbyHL9hlr0lclJgqrUpbAUNiyS
 b7xw==
X-Gm-Message-State: AOJu0YwBxE3URNnwG/s+sHcZdGOXL3nF18lKeuCDCPW23gUTrI1rPUP4
 CabzF2C8i55JW1pDu/mxTQ5FFw7/jr+Ym7zb6+VKJ1HziHVUczFMefhAU5Dh/LYzpif3fiU/3IH
 Skkaq
X-Gm-Gg: ATEYQzwYoLf1spdyb7vIU6J59B4u9LSTMKShVTDk8ZUDwlJABAKh7uzlkt4h/GC3La1
 WCUMrPSvegSbDREAZhoYXitoezoiwKAzLDRDfgyusCwT7HbkYaqm+xkbRYfaYck54xyPoFD4jE5
 I7ExIz9lk2jCuZ648tWcuoUV86q2OQpatPVry3FQzxenZnZgCzxOADOo6smlna/jLVEUZSrYmE5
 ImFH79Oo75VW+IFOjKP8Hn+SqbChX9iQKWCT3fvhJo3PpNWDAywav0UIli1ZqYofCgE3YAZdVgL
 bXN5UYXWZJBtj9wGK060E/FieAeLaEFXJDP0O7ovftSOfoeLRpAlwWDLYUZmeMxSnTGOKTxjCyV
 DgNbRr6YqAKlcQsYdf85k9N5yVqSaK7tCO31YTEz0vlVsAYovWVKLMbcqPsmIx5+H5KMSuG6sYC
 ptLd4ySjLmGoOf5IBLdFCGPzhc2BjTXziilHVsKXwraOyZ6gj8r4Y/u/uxvcvJ2HdMH1vIaL4lq
 164XrRP12tP+ONoERS1hGIPvmQEPkc=
X-Received: by 2002:a05:600c:a46:b0:485:358b:e80c with SMTP id
 5b1f17b1804b1-4855649971bmr295742285e9.0.1773745883097; 
 Tue, 17 Mar 2026 04:11:23 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48557c7c514sm116579885e9.32.2026.03.17.04.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 04:11:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] tests/qtest/arm-cpu-features: Fix thinko in g_strdup_printf()
 call
Date: Tue, 17 Mar 2026 11:11:21 +0000
Message-ID: <20260317111121.2062455-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

In commit 62272f9f8891 we changed some uses of fixed char arrays
to call g_strdup_printf() instead. In one place I made a silly
error where in changing
  sprintf(name, "fmt string", ...)
to
  name = g_strdup_printf("fmt string", ...)
I forgot to delete "name" from the argument list.

Luckily Coverity spotted this (as CID 1645771) because at this
point "name" is NULL and passing g_strdup_printf() a NULL first
argument is not valid.

We didn't notice the mistake in testing or CI because this bit of
code is only run if on an AArch64 host with KVM and SVE available.

Correct the error by removing the stray function argument.

Fixes: 62272f9f8891 ("tests/qtest/arm-cpu-features: Use g_strdup_printf() instead of char arrays")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/arm-cpu-features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 5444e4d40b..bbdd89a81d 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -612,7 +612,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
              * we need at least one vector length enabled.
              */
             vq = __builtin_ffsll(vls);
-            name = g_strdup_printf(name, "sve%u", vq * 128);
+            name = g_strdup_printf("sve%u", vq * 128);
             error = g_strdup_printf("cannot disable %s", name);
             assert_error(qts, "host", error, "{ %s: false }", name);
             g_free(error);
-- 
2.43.0


