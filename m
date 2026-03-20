Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96831098784
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:17:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3Zi6-000680-Au; Fri, 20 Mar 2026 09:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhr-0005uv-Iw
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:05 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhp-0000Lh-4e
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:02 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b93698bb57aso400429866b.0
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774012559; x=1774617359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4b4g1ndm+NdlMFQZnj8OfDx+Y1WcTpX3//RVeDa+Hw=;
 b=LbDryekaMpdhy151zLdMoSjOiWN9HTe9u9iDPscOGtmrejApkZlpgbsKuCpH4V2VkK
 461TRahUlP4Jr1j53xj6UqvYviUg9wNDf6KPbACP/ZndkeV4xTtXjYuraV14Zs1I3FKj
 ut8vN8aqjaAIPou3UyG4mnnArrrcjUC8QoU8kYGWpUlnAXd86NNafTNXJfc27ASuK/aF
 wdcYBWK5yKLQr44lmq4QVQHqSlog0HCvJYcbPXdUmNzlKVMNWiOLXRgwl3LHeNKDK3Qb
 CJvBI23nG1ov7mpfZHc6jBS3hB1mAzZ8TA8p3q5h28WeLc4+6iQOmThf7MFeH+bMqhGH
 ycFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774012559; x=1774617359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/4b4g1ndm+NdlMFQZnj8OfDx+Y1WcTpX3//RVeDa+Hw=;
 b=Cy6+UAKRSuEkIb1d2cE+G59WsSBE8MhizJxfpcfmB3ciiMw1+kGKml51OKjm3TcCl6
 WIQGRbLAbTMO49Yru+oRGOJRj/2UV4auh78fdLMpnvgvpepRIYbUh50fezc3VYFz3ggE
 HIbnQjmvMhkd/zncw1djyzIZ5GJ5MBFYVLNwJyk0PwPnYTCTGPcfpbxcQ1y6dkfVZU9j
 Rme7VoCzrZr/Xtl9v2ToPHtuDocP8RoH3jShSUT360Us0DjxqzezKywYm0bAlylHwyoN
 Atan+nyGBshiKpBhLa38PMmMPgFPbEX4Q7FkSlCx54zJKx1aiwo/ZViXipodyxCxGbHh
 bzDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4voNYr845JkmGBnl0aDEQWVH4kmG6i+yEmNhn/TpTgX6zbD4S3sF3KjmBOURTA+yERTu0ULPzdw==@nongnu.org
X-Gm-Message-State: AOJu0Yy0TZmTeCGry4o3vifPvkDnthOfuODbCp2kxjfwP/UNjUcY34Hp
 01A3q4yBfZWcFkkkvW91H4fQRqYoInp2TH88XnG6h98eYqPzwHCt8q2PZnMen4bycSM=
X-Gm-Gg: ATEYQzy6zKAJp/HwuuUX+5HioLPFfGnpiz2+wcmhk8TjGmmgta3s4WyJrdjfzYZByly
 sxEzYHL7cyiqIN5jQRBkts1ItoXgrH4pNmUI+FbYk/AEDethx/6fIaRR5jaSYlzEulVaD1uI2DT
 6EKGhwIRLIS5sdh/QPy2+iHACrsIpKJmZNpnLX+keN7T7u1ludL1z1eXQw68srwHkBvghWpiC6z
 mvfktvlU4GnhFXKVQEwbG90yRGZQPFvMZlpgsIIN4ivZ7lHISw8gzNj+2UaHhsClDxtdFgIT4Si
 Fm2xJZwdXPYYg+Xn4h7+PYvUTveUmu3ZTjoGJ/2rFjQx8sBhO0bPRI0Xi5Z2lG48xy8gtvclRy8
 0MeCOJsSQX6fhbDCg85ZJueMlRU7OtYv6iy6+GBW91Ryh86UCZgEXA76g5nLgD8W1gDZDCd7gmc
 zCrj0do2uSf0o/j8AN1APNrro=
X-Received: by 2002:a17:907:1c09:b0:b97:bcac:2fd8 with SMTP id
 a640c23a62f3a-b980f950567mr536768866b.13.1774012558595; 
 Fri, 20 Mar 2026 06:15:58 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8da12sm160740366b.21.2026.03.20.06.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:15:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0AC385F9D9;
 Fri, 20 Mar 2026 13:06:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 17/35] target/arm: use syndrome helpers to set SAME_EL EC
 bit
Date: Fri, 20 Mar 2026 13:05:48 +0000
Message-ID: <20260320130607.2071996-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This removes the last use of ARM_EL_EC_SHIFT.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 5214e3c08a8..07a52643e71 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -56,7 +56,7 @@ raise_exception_debug(CPUARMState *env, uint32_t excp, uint32_t syndrome)
      * Similarly for watchpoint and breakpoint matches.
      */
     assert(debug_el >= cur_el);
-    syndrome |= (debug_el == cur_el) << ARM_EL_EC_SHIFT;
+    syndrome |= (debug_el == cur_el) << R_SYNDROME_EC_SHIFT;
     raise_exception(env, excp, syndrome, debug_el);
 }
 
-- 
2.47.3


