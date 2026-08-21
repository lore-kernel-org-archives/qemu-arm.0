Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54958C5DF89
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 13:26:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxPFx-00023A-7O; Fri, 21 Aug 2026 09:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxPFw-00022q-Eo
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 09:26:00 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxPFu-0006Ox-VL
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 09:26:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-499b02fc590so6205465e9.2
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787318757; x=1787923557; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=p6lp+O4D/eE65qwxUb9w0dpA/8vp/oVveOpJwUREnbw=;
 b=eMabaMLj0xnnWMd6467caD9SyPUTYJ+9X1eXy9V0p735CnMS6308ITasLNt2iFqMYD
 dZHTDvJsEYrV/khY+Ac90OMbALcgAJjTxgeR8QKjtWNYANkMLGwW8b/NcMHR+ndo+z1N
 D+eZROF+CHs5uete21cYjyyUaV70tUfjfdz6gMMEoE4deSEfbpa4VaPOD0WL+OcOq9Gb
 CZKBh43XWbMvJ9LUBjyykf8PavSqUx07ATBNDL0846zU+2HzsxpTQps0m0bhFjBqEQMf
 R7pjxtU6l9DjyfyYSGTclOCk6wIhunkhA1yKtneVIoQez6jl88Xrpc6QpNv/NbcSkig3
 XCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787318757; x=1787923557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=p6lp+O4D/eE65qwxUb9w0dpA/8vp/oVveOpJwUREnbw=;
 b=gWf8TIMm9iMKqqYBqMzm08BU48k/69snLzK2tqkazr5nMCRi7RHqa/r0m0AGW5ABGo
 5dAZuaKjt5LmwRxX7VV76Iyg3UOrG4+YaZLuoNtTYAP34NNFyVmusoK3fEmJIzxBtPLi
 hpGoAfjc8bA86B5BVOgtfT6i3bqSgtyANYMSBFCltJ4QWOkR6vIeASywLh4XyolJ38Ia
 hcyUuvV2U3KWPNLMUQmRAHg7Ojkk0SaPTXffN7NOQ8cIOHsmG6GCCDpdf1UpGpOkKgyt
 nqiOZ5v7btcxqWC83ubJjg2dGmE5unCuSuEroKT0ItazO43kWCEOJGrSbwJpR0a6Pe3v
 N4lA==
X-Gm-Message-State: AOJu0Yy2BgB3hbFgAnn6xq2c7dWZdRkYm0l6UQaJCCuTOiVLDLR1UfOb
 N2NCu59MgzgobWACtsk5vJ9RGLTVE39wsqLfgf2uigvCcud4UL2/Ayt/Jew9dhVrGoFWIzwyLCA
 MiRLtX7Y=
X-Gm-Gg: AR+sD111gIPylZOwMA2W7smw5CvvGcOh9WOzkh8tbX8aQOsn5Eo5+cXQ/ky/5d4pu31
 2n4OSHH1vE0heJn8L/BmB+hXnGGAWkabL8S0x8XEFk2AEtHVzkuVM5xgP4ux+GOiJkTJYCCTagO
 6ILzbCiyprArZFXlFrzAvJ5a7oOdxm9aVjq7RXz3i0QgljYOY+TL3rZP1RsJ6WopZaPyabmcjJY
 qxE7gMex/6FBhkVR6pImy27O7Y6AhQWfZw1x0ubA0X6eSz0P1C5xzGqlwdcwVfvuOoVvkK9VAdh
 ih+umJtFDOUsrhKLv1kL3pARQlBk5AhAFrgtWEoXaEWsMJGinShYvWPl4LyLymn9/Q1lM36gawY
 6ylOhW2wzCj19Y0dPAMNLFaBYjfFBe5hFxBabOX8JIGyPfFswsevlsZRzimt/epFVaqn+mqt2rs
 OpQlxrUpVdbB3NHWXTTFIJNcs+/xsT7pCbBbB0FTxrujfTJKE+HRUCXiDLqz/7h+p1GhWeHN/vM
 h149he//7q3gOgnxEDtq19RWR9cbE7tOklIfzHj6GZokSRDoyofxQET4sVksK760I4MLA==
X-Received: by 2002:a05:600c:c168:b0:499:7024:9d4a with SMTP id
 5b1f17b1804b1-499b8327af5mr109630155e9.8.1787318757213; 
 Fri, 21 Aug 2026 06:25:57 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1450e54sm18770327f8f.11.2026.08.21.06.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 06:25:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Make CBZ/CBNZ UNDEF before v6T2
Date: Fri, 21 Aug 2026 14:25:48 +0100
Message-ID: <20260821132550.168896-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821132550.168896-1-peter.maydell@linaro.org>
References: <20260821132550.168896-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

The Thumb CBZ/CBNZ encodings are only introduced in v6T2 (for
A-profile) and v7M (for M-profile).  We missed out the feature-check
in trans_CBZ(), so don't UNDEF on v5T or v6M.  Add the missing check:
conveniently, the ARM_FEATURE_THUMB2 feature is true for exactly the
cases where CBZ is implemented.

Cc: qemu-stable@nongnu.org
Fixes: 9ee6e8bb853bde ("ARMv7 support.")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 055f3c5b403..df98dc2e34d 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -5783,7 +5783,14 @@ static bool trans_TBH(DisasContext *s, arg_tbranch *a)
 
 static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
 {
-    TCGv_i32 tmp = load_reg(s, a->rn);
+    TCGv_i32 tmp;
+
+    /* CBZ was introduced in v6T2 and v7M */
+    if (!arm_dc_feature(s, ARM_FEATURE_THUMB2)) {
+        return false;
+    }
+
+    tmp = load_reg(s, a->rn);
 
     arm_gen_condlabel(s);
     tcg_gen_brcondi_i32(a->nz ? TCG_COND_EQ : TCG_COND_NE,
-- 
2.43.0


