Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE882FF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:55:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpa-0008OZ-28; Sun, 26 Apr 2026 09:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoX-00066k-0y
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:25 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoU-0001dR-Cq
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:24 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2ad617d5b80so54584265ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211180; x=1777815980; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGWu4lyY8cEb2Z1OBLO2Ci5af2jrg0iIa0ouni1CdxE=;
 b=UmEgYfi4AJNWNqnaQCOrhhZmXdlKf3rfCWCJ8w5W+DuFXzEh1f/dupPVkxmHNyESri
 HXlslk2uKi4RzPMmX2W72TSXx+M53yITouyJVe2+8hboF74sLmy9gYYW7VJOBPbK2uXo
 PtMWJecQTaPJC1eupegKDUI6qyTc3ueVaAfa42QXWvMW4VwcMNupZ+HbQSlrocIKuYHX
 577Uf3MuZxyzfnjOa5blQtKixvq487uyovErU57kBLf8r89mGbJ/E24dZ7oGnqj1ixMd
 xLgcixR9UQCwfEkziXb3DUokkqskhj8Nv9jj94l+9H+9QHEfrCJVuEwFe3e2DEmoqKDg
 IGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211180; x=1777815980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YGWu4lyY8cEb2Z1OBLO2Ci5af2jrg0iIa0ouni1CdxE=;
 b=W3OyFrhn+o9CgEN14CFumsic4z/u4fe8Et0SxhCWU7FOUJ/MBwB3f3SMVQp+4bJTVW
 Hvd5kRRgVh1MNpYUMJgxinTjaGXE9CvazbeQXj1+1yEP4LryYE+36qQZWsE1mo8dlirs
 1tiIaO8jXuoR/WLk5itqDjljGfA24gKk+ULllrhw2MIT0xO4+AfTRTSy216iLJ8Kyc53
 xgZuxki8ha4uLZRMxk9aUguxohpiVNhNyc3VMUCsRPt0ZXlnU7Tlm8XASgCMxaG5HyP/
 gVlMshqrs0Cg8un+NeA8TFfJYjB2bFfAjSBPDpKP17idWCP7Oc3Yv9qfkR9RMQLBRK99
 THyQ==
X-Gm-Message-State: AOJu0Yybr6j8lNCARy1TsqdtEc+8Qw1okWTjHMWymNBe+Bt8+bG27MGN
 p/uoV3m16BBbTWO/pnOc5EnHDlPOzFHGo07bMwEVbHXB1OkVn4nKQCEKG0L83gNEUE0=
X-Gm-Gg: AeBDies+M70VZQnEFx5ULV9xHdQOApxw/PE+ay9hbnUQtUC9DiRKiLnNTZdJ577EwKl
 78A628l5kvTOjI/04t3mc2npneMAyeEtj6qPmtqTUHNZUKrNbypuAxjXGL1GMHQQDPbRmOrOglz
 I0KzW+A6j8PuBVjJ1dyiVIacWD2CLWqJ2n24c5zHWFGb4r7YfLJ+hWxM6RgTRB6Ac/N0bQbOBdZ
 fFA3pdk+9IbrUX3y/oWGQPwmHyGR64Qu25CUygwKc8Il9VckFcRESnLynI36zDHQZx0hlhOM417
 +9BIiN/uQ0UOlO8OzcOYcpciqm2Zn8uz25Bo/+lPSRYHj78U8cHZ6ZCvE83hVWMXE6z7xRMbMhO
 waDkCIQkCHk2Pdn4U3RRewWrfCseIBsxJsfi2XVpT7L5gEfNY6+vKJG0N7mvQ+luAF0eWtTZFPI
 bHLE1HO6bkgqGnEwj85OLqaWCgsh7VVlyumwyuAi4J
X-Received: by 2002:a17:902:ea12:b0:2b0:6e4a:32d0 with SMTP id
 d9443c01a7336-2b5f9fbbdacmr407946525ad.35.1777211179727; 
 Sun, 26 Apr 2026 06:46:19 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:46:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 70/84] fpu: Export parts{64,128}_div
Date: Sun, 26 Apr 2026 23:39:47 +1000
Message-ID: <20260426134002.865628-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-parts.h | 5 +++++
 fpu/softfloat-parts.c.inc     | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/fpu/softfloat-parts.h b/include/fpu/softfloat-parts.h
index eb76b47934..5460f5c592 100644
--- a/include/fpu/softfloat-parts.h
+++ b/include/fpu/softfloat-parts.h
@@ -179,6 +179,11 @@ FloatParts128 parts128_pick_nan(const FloatParts128 *, const FloatParts128 *,
  * Operations
  */
 
+FloatParts64 parts64_div(const FloatParts64 *a, const FloatParts64 *b,
+                         float_status *s);
+FloatParts128 parts128_div(const FloatParts128 *a, const FloatParts128 *b,
+                           float_status *s);
+
 void parts64_round_canonical(FloatParts64 *p, float_status *s,
                              const FloatFmt *fmt);
 
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index cdab18bf26..cc142ff5a5 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -807,8 +807,8 @@ static FloatPartsN *partsN(muladd_scalbn)(FloatPartsN *a, FloatPartsN *b,
  * corresponding value `b'. The operation is performed according to
  * the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
  */
-static FloatPartsN partsN(div)(const FloatPartsN *a, const FloatPartsN *b,
-                               float_status *s)
+FloatPartsN partsN(div)(const FloatPartsN *a, const FloatPartsN *b,
+                        float_status *s)
 {
     int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
     FloatPartsN r = *a;
-- 
2.43.0


