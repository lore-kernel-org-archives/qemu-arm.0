Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F547CD3445
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 16:21:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLNw7-0001Mb-Jg; Fri, 08 May 2026 12:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wLNw6-0001LJ-7z
 for qemu-arm@nongnu.org; Fri, 08 May 2026 12:20:22 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wLNw4-0000xE-Jo
 for qemu-arm@nongnu.org; Fri, 08 May 2026 12:20:21 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso21724275e9.2
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 09:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778257219; x=1778862019; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LTDqMeLcyGj/NXygQntrcbmLjmm6kj/aNSi917QkrfA=;
 b=WwhJejmzrfOEPhii6BcDtt8HGwAXEzXDeNiSxnxDGgEmzX3S0jvi46g360z0nsDG3S
 p4BtLNFBx7RB2hldaxT+7geY6i5wG2PZLXs2dLxwKnEwA33omlHzWCxaTvlajKSXT4Dy
 YhWl3GgdZffV00SCLE2Sol7NTBPh2k/Kl3MeaOydx7Xsf5gdf37z7bkyWbg9/5I4/hYZ
 jmJ2RXArFNmLt5WnciFbIFXIuviWjNYI7h8zKAqT9tIREgkYKjfoiVjy7FNiVEPtuAn+
 WzqdxKq00tZn6/dhlIVnOdVo4xppWuyV4EkoXRcNRxoXwvYnk5kszqN0+uABvpoAKvXT
 7bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778257219; x=1778862019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LTDqMeLcyGj/NXygQntrcbmLjmm6kj/aNSi917QkrfA=;
 b=QFKrR6YnQhhCSJ0Bfeg2JVYHhU2ni9XEIDUUKvNVV3kRzmOmxgntf9aOMq9WO5qihn
 BhpxNH228otR9VVhyD4PHlmtC+NhGbKWl9xp5rl5Hf78ZQ8bWjbyXHBs1WjPKUUmUXvC
 awE8mvcusY0Ver0VAz/zopZHA49EEM7EcguJdky13R243NNiIZ+1Lv+ISvToIu7l7xW9
 sgVpvlKVOI9FFYLp0R5cXIa2Ag5+NCXMm7/Gos78Z0fRBLj3CGLIxAtta/5VD9pDZSWQ
 XVXS1mNMb73qWJ8ynAipsa153VtmaulnOUYwlk/jf4fYNqHFE980hOispNxv0EeQ71oh
 VXbg==
X-Gm-Message-State: AOJu0Yxhsh17N+dsxW4LkZRRuVE5lSKlYqpmmV5FPInMU1eJ3X0OMU6n
 gCcbEmBdy3NIqx9zq1OVzT0dU8/kf5rw0XDW3+RSaPY38Os4F9eqlInxnqVjam56giQ/i30PqIM
 pZmwB
X-Gm-Gg: AeBDievcnOeVy0rvA3w/o59mx67h6NqQnDtVG8oY9mrwv9NHKP0B3hyNKoB9vnMdDRE
 f+nCW0cGnlw0ciN9vRAUbcUdvNJIfJe6HdY3OwFc9zxyOSOsV33ikBmBnqJY9JJHV3IenwQGNOX
 AmgjcVGC4SygnulXz7uFWxP1a4cxhvhilfA8dpur/KKtqF6FI8oF83/hb4rkuuaS1feti5W5pf4
 AOwdBkjNgLtCkH/3ezeqV9ZCa7kcVx98cmLXUEbZQZcxhHlb4UgvX5GdgaRxFDG1libUu6pchcZ
 Af3KcLPGN9gj3nPnqOiM3Xx7jXHOM+ScII6U+BqzLkj434xreZmhh5pZg/UxXzzgxG2aBnAnmu8
 1AIRE5Hr5o97lImF4pJXrMaKp+UDJwm4Cde9jNci6yfOI9WC37DT2GNwKhi0GXqRJydHtTbxOHy
 llnF+yz/tlZsxWr24GfHbbG3xc3IwCRoo2rpaN2xl1o1hqVFkTVvoWLaCOhquQAqVjySM+bal9g
 3mHHImU2FQQbgKlVYWZpF/YO94sFs4=
X-Received: by 2002:a05:600d:10:b0:489:a4:e555 with SMTP id
 5b1f17b1804b1-48e51f36fc6mr176894445e9.21.1778257218794; 
 Fri, 08 May 2026 09:20:18 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548ec6aea4sm6226998f8f.10.2026.05.08.09.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 09:20:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/4] hw/display/exynos4210_fimd: Use LOG_GUEST_ERROR instead
 of hw_error()
Date: Fri,  8 May 2026 17:20:12 +0100
Message-ID: <20260508162013.2751001-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508162013.2751001-1-peter.maydell@linaro.org>
References: <20260508162013.2751001-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

The exynos4210_fimd device model uses hw_error() in several places
for "the guest set this register field to something out of range";
update to the more modern LOG_GUEST_ERROR.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3405
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/exynos4210_fimd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index a91f04aaf7..0c9e42ec52 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -533,7 +533,8 @@ exynos4210_fimd_palette_format(Exynos4210fimdState *s, int window)
             ((s->wpalcon[1] >> FIMD_WPAL_W4PAL_L_SHT) & FIMD_WPAL_W4PAL_L);
         break;
     default:
-        hw_error("exynos4210.fimd: incorrect window number %d\n", window);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "exynos4210.fimd: incorrect window number %d\n", window);
         ret = 0;
         break;
     }
@@ -757,7 +758,9 @@ exynos4210_fimd_blend_pixel(Exynos4210fimdWindow *w, rgba p_bg, rgba *ret)
             blend_param[i] = FIMD_1_MINUS_COLOR(bg_color);
             break;
         default:
-            hw_error("exynos4210.fimd: blend equation coef illegal value\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "exynos4210.fimd: blend equation coef illegal value\n");
+            blend_param[i] = 0;
             break;
         }
     }
-- 
2.43.0


