Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24010CCD18E
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 19:51:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8l2g-0001e1-4b; Tue, 14 Oct 2025 15:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2Y-0001aA-Bo
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:36 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2S-0003Pv-TV
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:34 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-782e93932ffso5192707b3a.3
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760471425; x=1761076225; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LZTPxisuBlozaf2cVitU7+jksAc4vzj+QrVyIeBLhAA=;
 b=rMJcjhNz/V9GHpxBqz0mUOKdIBrChROEocSlZR305kZHjZvWGRo/SqE3dCxxNzg+o6
 bfcul+wIyqNrweAZXIRvZ1tKQwo1h1jdgqSM0LBfG/W2AFWN9P9FSBBNwjzxXWRibEuf
 cDlc3iNSW2WhD0bO7zTkjfGvd4+PokRvBRAvZr03XfDkthrroVS/0ivFjc4ZL9iYFYHU
 jVnttCrPyytFUlPfY/v2RXpRe77CQiv3V+Hg8ktbrNpUKHZI8+Gkt/Olu0xsEmCVDe6R
 voQuxSlRonSo2ogen+eGnnmM7YvssVvlo4hDlpvxNqbhFBY/3tj1BaIQbk/w3g2/FhQg
 lqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760471425; x=1761076225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LZTPxisuBlozaf2cVitU7+jksAc4vzj+QrVyIeBLhAA=;
 b=dE8KqgdRPtt4kZPs1Wqe6wNC0P7gYrVwtKD4O9AMSYpibPdEGGCaQNbpt2r9TSlsHU
 5vzel478OvaPbWotM13xCA6yN5J3eNCJ0YmeRLZ8m+UDtcEEdJwGE//c8hgRE2puQAFg
 qFO1lOytW2pg5b6OkmkaUv7p+V0YgQhlD9X2C3/J80/F2+sM/60S+i86I6Wk12Q6UH+f
 F8piPy91B1gxHuNl4vxZFuRKHlIF70To8bVoH0RlpfBH/bmpH5S2Soei9NJkeN/lendi
 NEx/8hsmuiwY2kl9R+HXyZeIpDzeXh3iJ6/ZhEiq+TO5O27vtgTtGboluAXxj+ogdtrE
 uljg==
X-Gm-Message-State: AOJu0YxSC1nM8dQOpYMTIGtOLN+eeqhiZrdv45Azbzg9WhbP3ThkMTTM
 5HC7u9JJkBti16XTmHp+DLYxuQY8LY24ohCt4Pj1qYQ5SFYjLBw8X462mE5kad8RCk4=
X-Gm-Gg: ASbGncswxcX58AhuBbTK/e6XGMUBlm0zPkImg06LrCjzOo3VwGKbcomBXDqqswAVM2x
 JhMT/aVNGIe6kyn2fU3gbSpwhgi07dnDdhtMWNA7+CuI85EruH8yJFogSljfYW03JOFNxb+K0uv
 sptyULIbljcwzT0x4yWxi8Z0YI+2tm1cCaqZsrOCbGt5LhqYM8h9YOGYy4qehRL48DOnjvDPZL6
 QZfc0N0+8OVfGHrhkPoqlOBBMIpH2lQgQ7BWqFY6UoBgcE6xbmXmaxQob1rA4tYZXaLC8Qro0gm
 CzyJQkVjx4uIr6b9sAa2GJtwmB4qU8PTZWMsXwCyM5JMfX+ZJJnNx8+mUVYWdI6bCUCauimldLg
 S2Q0RqtU5+WoeGpy+ixOXy+fWXT2uNCkqUs6HpEgRc+nP8qT7/r8=
X-Google-Smtp-Source: AGHT+IH/xTYEyE3k6CYI52N0Lb6Dimhu1SAmlR0ypZYBqzgpQTln9z4yS1hidHRmrRCdUr+dpb31qg==
X-Received: by 2002:a05:6a20:4305:b0:324:6e84:d16e with SMTP id
 adf61e73a8af0-32da83e6479mr32108514637.43.1760471424962; 
 Tue, 14 Oct 2025 12:50:24 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b63a03dsm15918727b3a.19.2025.10.14.12.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 12:50:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 6/7] target/arm: Honor param.aie in get_phys_addr_lpae
Date: Tue, 14 Oct 2025 12:50:16 -0700
Message-ID: <20251014195017.421681-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014195017.421681-1-richard.henderson@linaro.org>
References: <20251014195017.421681-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5fcf104272..23f6616811 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2319,7 +2319,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
         /* Index into MAIR registers for cache attributes */
         attrindx = extract32(attrs, 2, 3);
-        mair = env->cp15.mair_el[el];
+        mair = (param.aie && extract64(attrs, 59, 1)
+                ? env->cp15.mair2_el[el]
+                : env->cp15.mair_el[el]);
         result->cacheattrs.is_s2_format = false;
         result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
 
-- 
2.43.0


