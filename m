Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945F2CD6E55
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 18:28:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUqIc-0000ct-R5; Wed, 03 Jun 2026 14:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wUqIS-0000Y7-5T
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 14:26:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wUqIP-0003Yo-2Q
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 14:26:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so38192085e9.1
 for <qemu-arm@nongnu.org>; Wed, 03 Jun 2026 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780511186; x=1781115986; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XHo+RgjT6TDt8H4pIyhVDsbRZWepv+aHkO1DZ26YbNU=;
 b=hFJpSN7JWmme86u/3pZEW1kqFTf2jsIOwO/oW9YVlDl5m6Bh3iDBh8LwQtDjioz4Du
 W9RsZc40S3W+KCEDm70h73TTfNHIxNy5iE9M+mMR2U2GRMTaapUT+MOnHAILT3aiQNeN
 UrWiQLBX7TLfvxa+GF3wWXLo8CpPQUpv6SXzSCV3WdH+I8r2f2mwhm3LJnu/FhXX8Z09
 AzZme/dMiGkCQcWIx2rB9lpfaTGe7HCvqT9INKZcyxHxic1cpfUcvNVQkzXpxQB25KT/
 F6Ol0vJH4NSvHJ0LZv7d73BiCu2Zxz3uKxpKaTw59e8vCwIDkoHiaai8X/e+80Mr/gUv
 G1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780511186; x=1781115986;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XHo+RgjT6TDt8H4pIyhVDsbRZWepv+aHkO1DZ26YbNU=;
 b=lZPThJ7YgSQT6HvdXvRrYOvENYeDVqc5ksCxv2mvZ/D+t7wC9jVMFu+uwigaOVeNAP
 Xx0832ov9EYeyAo00DmK93HPPD1W5y2Bn7cfD33MBC3qrDxAQyPIZU1ORG8yqpERBTMV
 fDz/NFYA+zN/QfrI620rruXZnEqs71FCLf8cIJDYM50Yqodma5cHQOXIu6yQ71xZcKLf
 Fl8SvhMDz5de2Ktvt2rr/0p9AG0SvASXhL3L7/8HIuD0XNYVrEDo2ij6T/iVO1hs3APd
 0SmJRnx7wO6x6d3P7XXiTFLsEWDXitSN16d1O13jbwnExZ0qgWVUeKNNuk465nsOnrvj
 WoEw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9booCMVIcz0H2TRuTYo3gqg6av4bMydf9b3WCHJgeP5CgFbqqWtRsFbLSSARjxFWRnLwbGFxjqmw==@nongnu.org
X-Gm-Message-State: AOJu0YzgJskDJv8jjJC9OQidXMp4itdBgkBByZtubGj7QekNvnOPW8Ra
 wKaii2RxuxJe5NPW3BPN594ZLXRxi7tAB+jtpujNjnIKzAVximONBp1bLaVD69bKGh9Fo+k2No/
 k1jA2Pao=
X-Gm-Gg: Acq92OE4b9EZOS4eYXoH7SmXJxbzkgLzsQOjf5x3/SfCMia8TSYxe6D054SlOjEtESv
 eS7j5QbrMK0XUu3uOE7IDcyp8H+5IJgzHFGEFlwRZh+yLLV8h8TC9PgzMKY2h3x3K1q1XpXE4vH
 DhjUDiXpF1WOvgnx0LW7qv0yIzqejliS3OxDSXtvDcY3fEN3hL/mTIM1lgswBqjKcX6ZoOBxvXV
 nyOhhIyFxdQ8xKeL6/ZIHPi+yuYPc6VdrBsRIMIhnUffu8drK+SovyWt75E6ko3C3x+v81s6BVN
 KL2h8d0vKu/dr8zkXA6fWcqRWF8KJrANAU3fJGXzP8oi7tOEMWfxVbVOhWsgPfzT2Zx23DPVnpG
 jdz8E2FP8B+0vUaZFwSgpwbZDDo/2dU0Z6dt0iYZVFuHLDq/IrzKqXiFLpC/+a7AuEMYeO09eNR
 7hxul05e1gH99nrBZDl4jr/l/ni+KaEKrESugf+g==
X-Received: by 2002:a05:600c:64c5:b0:490:52c0:744c with SMTP id
 5b1f17b1804b1-490b5ed43cbmr74362175e9.20.1780511186589; 
 Wed, 03 Jun 2026 11:26:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:d530:6a6b:58a7:e220])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ed944sm9793127f8f.13.2026.06.03.11.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 11:26:26 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Wed, 03 Jun 2026 19:26:20 +0100
Subject: [PATCH v2 1/6] target/arm/tcg/cpu64.c: Extra test for GPC3.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-jmac-gpc3b-v2-1-115c51936962@linaro.org>
References: <20260603-jmac-gpc3b-v2-0-115c51936962@linaro.org>
In-Reply-To: <20260603-jmac-gpc3b-v2-0-115c51936962@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x332.google.com
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

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/cpu-features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 38a695ded7..ad1b1ddc9b 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1148,6 +1148,11 @@ static inline bool isar_feature_aa64_rme_gpc2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, RME) >= 2;
 }
 
+static inline bool isar_feature_aa64_rme_gpc3(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, RME) >= 3;
+}
+
 static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, DIT) != 0;

-- 
2.43.0


