Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727C5CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:50:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OH-0000Bt-Hq; Thu, 07 May 2026 19:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OF-0000AZ-Iw
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:23 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OE-0000zr-2U
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:23 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7dcd17e19b6so908850a34.1
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197461; x=1778802261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0L8sm2nuOmiw4XE7Qu74ytG281Y5T5t916Djua5D5pM=;
 b=LGG1CIIotYGCSUPqPvZ4LrIIUj8K9UQX1X0KIFRGkUItPsFTgYbQL0JW3b6TlUbHXr
 yc++/8CCbkBgppsD7uBLSoieXrGrAIUquGyCXpD3CBBa1P/xaeHOBMKhhIjXFlWDr/R0
 s4e+FoD24LDnh3ILk/8sO4yd0X0vvDY997OR2LanntbEIKfEJAEZGuR1fbM6axVDLSjh
 l3KRJGXJkpdn24mUw7LNJSb2aY2qqjiygV7K7tEN2Cc+0LzylMHdPwn1niT/Zxy1gTdD
 YUvKmV46nfimPyOy7PEoAxGdNLLHZgY9r4mGx/0vnvbKmoV7XS7H8bl6HpZp69oqftkY
 Bh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197461; x=1778802261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0L8sm2nuOmiw4XE7Qu74ytG281Y5T5t916Djua5D5pM=;
 b=NH0R/F5o+RbzwhmhpQq2dLm8NrlK1x4SBqHirJ4GeQFHpYC+Ookka0Sw+4TtcFWYZu
 VhPAzwLUiRqhwtvMJ7ZXQJmOGpapBK90jYv8Nb6dh122Aukp+2k7TQI1lN15oISPuTCb
 nJ5R4qHqTcE3uQoFdBz35B/9OWaxkWTOIY8cHpDHqL2W/0nwkr+ZJ6RdyVG1wS+55Iqw
 U02vETUlE9RRM/2F49aWee3Ltogryk1FAet23W2Sjp4yKAR/yDWiG6TPiPjrNc2H3hBp
 wEye1SH9MU1aTfWI/eZpnAtEf4bmW+trhd2fnhlumhkUsqZGOHcLxd6kkGm+3Zvep+Ot
 lFyA==
X-Gm-Message-State: AOJu0Yxw8iJDACEQLX869Rgx1FRGNjiCfKQJtLMko9KUBr80K96CQgDR
 v2V196uuclSF5Yl238cNDMwipsgVW+r7jaJ8VTLKvm+qEw/KNd3289E1Je88r7NLakLp5un/Tiu
 0mbd0
X-Gm-Gg: AeBDieu86i/zOIGRv86uIeAZdYAKWWI/PzYU3/D1pNgNMHBBqGST1DJwKbXlGynFfuV
 TUEsf+z3qPQaAg+caQyt3lJaghYPvyvkdrTjAlyA1Gqci4oI/ZZI33RwS9EczpkBHGJXe49E9yC
 3eXtHqrjth4anCUJ/HUl6hTWTZoCf1phtp6SymtYyuFnvSeX6tYyFcevE1mkd5+C4WGDIYlSwHI
 cWpzTC9h2Whrz5reCNMU+lPl7Ne8k9yO5un3+trElt8R793Jxzox6dvUbsaL8VzuGn2D79iWlMD
 pjDd1MT/+fxlhB/TYWhu/aXRzsLAqcpNH8vgcgq9hQJjeKtsQWJWBFSnUMZGuEAYeXtIqn2845e
 7lk4SKgyfgUDaL1o06NXc96WQPR1b+NXJ7llOWgGFJ8Ku+ved0emMaE1sd5XkK91CGlk0P0oLFE
 +oPUunl0EJ9tFexFojuZbkQJvCi2NNs7d68uWt6/1CXup/B+db2f6705F8
X-Received: by 2002:a05:6830:3142:b0:7dc:3d7e:40c2 with SMTP id
 46e09a7af769-7e1df23c9bemr6443314a34.27.1778197460624; 
 Thu, 07 May 2026 16:44:20 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 05/60] target/arm: Enable FEAT_FAMINMAX for -cpu max
Date: Thu,  7 May 2026 18:43:18 -0500
Message-ID: <20260507234413.643512-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 4 ++++
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 649d854a65..ff0c2b1c47 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1266,6 +1266,10 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
+    t = GET_IDREG(isar, ID_AA64ISAR3);
+    t = FIELD_DP64(t, ID_AA64ISAR3, FAMINMAX, 1); /* FEAT_FAMINMAX */
+    SET_IDREG(isar, ID_AA64ISAR3, t);
+
     t = GET_IDREG(isar, ID_AA64PFR0);
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8cd7fe7b00..da5f7efce2 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -68,6 +68,7 @@ the following architecture extensions:
 - FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
+- FEAT_FAMINMAX (Floating-point maximum and minimum absolute value instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FGT (Fine-Grained Traps)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
-- 
2.43.0


