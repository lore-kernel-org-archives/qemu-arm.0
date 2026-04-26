Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863C0FF8864
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:57:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpf-0000Oz-JH; Sun, 26 Apr 2026 09:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoU-00066O-Sh
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:25 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoO-0001be-76
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:21 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso60077315ad.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211170; x=1777815970; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8q92mP0WsVg7jShnJO3IJxQ7Z8BkHGBrtVLkPQnGUU=;
 b=LHiQmllAc1ZNyKRQbP6OZ50uJtgggtbKK9Iv1T0KBQRmG/VLdfu3d6WAd5fjoiWSM9
 lLgI9Z2SdnbXRRo58Z9TaNs06kjlCGhT4FEMYtsK4izhEPyMiAd3Ia86HtHvLQwPBEq9
 uqoWlRgNy8uxxWsQrqDH8bYTmxpVSG+xPLpaYXCgXiHxqjemj14E8i3k0GMbkZjPvfLZ
 XIPM1szjR+Fvb+tlpVk6x1qgSIXFo+6tUNnRmFq/XJCgsi8Su1wD1/0Khipxu/GJIJG2
 l3LLrA4AKbILf4V295g7kPCmtjVHf69Ms+i7iE5571r+iswe8QGyze+uuGo/TR+05d6F
 Rg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211170; x=1777815970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t8q92mP0WsVg7jShnJO3IJxQ7Z8BkHGBrtVLkPQnGUU=;
 b=mkWgsTUF3xyZ6jipf64kl3GgugZYkwabsYEDfZ0eW7ZM9c3GMikA4fbXCucVYxctyZ
 gRLcpV5MX8JrUEElh3UazthGDmYAYwVtBOu6Aucb31FVNINAp/amKuMO4yfXZKffo6Bi
 h+qg+xO5YWGucRPlXYJ531VI9dwde+T0YGRembKiZfQu7pNM3MhgkuRoSQdlJShgS5nk
 /+NQlB6EL0wDKTN8lXwvX02yEnFFPa90F95L7mhiDlpyOmQKmrySOjb7fw1leaq2M9K4
 pt2FeIyU9e4lJ7Y2mSwv1Nob4T0C1TcgdYYA9VWgdfWM1Six8QX115dyW85MrJLHIu5X
 1JVg==
X-Gm-Message-State: AOJu0YyPFxddDb4T596r1m5mYlu/fTv56rSQ12hTYuMShpUd6Od6uwjb
 aPYk45rqh2nm+bdwSmJvu3MG4DWoBpBcmMnJsIx6DhryaBgnTB128BSXeBxaviOTTEJwUW+9P4t
 h/9xKh6Q=
X-Gm-Gg: AeBDievP6TCdlTz0nCHDFsIzssL+OKAgj0B0vX4AZ8PZ2CkE3OG89n0u/bwR6XPU7oF
 DOpYBpDghsDpo/bFgwIMq8pemB4wiKZIKC0+LBjXR5OeZgvcDYjFcyiyjknjjs19tGZJ/1gy4ld
 /bqvP+xBoSr/zIuTPekFGD9Tghu07pQxm5BA/mbfUIUKPvu6zX0+EFpg/15eO41rpJecOXRIo/0
 5DN1xbTejj3dXg6sfzQke8xMCHEEcB/s7MIioCqI6kWLAfRLL8wHxPLDQCrC2yiG40vSf7Qsmy5
 s8kTXhaUDnbRbZI4iRMpKrlnm5BJqkfiTlA4Uzg0jTSNEkBMvjLI4gOQ9He4YMgOja5DjyIPnKl
 5birzIYJaCK6+39aqxz8LcR21YpI+AdIh8NJyT3rQi/PuNN4ZjbH1kf9uZgF9ySn9CMqTWhFfXd
 /e/I5L2fY7PyQIfxT/MP5mHZGxdbwsf4dWZhDFF1bcGE5PFYPdp2k=
X-Received: by 2002:a17:903:1aac:b0:2b2:54db:3e93 with SMTP id
 d9443c01a7336-2b5f9ecb056mr314020445ad.23.1777211170521; 
 Sun, 26 Apr 2026 06:46:10 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:46:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 67/84] fpu: Use parts64_round_to_int in
 parts_s390_divide_to_integer
Date: Sun, 26 Apr 2026 23:39:44 +1000
Message-ID: <20260426134002.865628-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

We will not expose parts_round_to_int_normal.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b71bd49483..e42782c656 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5161,12 +5161,11 @@ static void parts_s390_divide_to_integer(FloatParts64 *a, FloatParts64 *b,
          * Rounding of partial quotient may be inexact. This is the whole point
          * of distinguishing partial quotients, so ignore the exception.
          */
-        *n = *q;
-        parts64_round_to_int_normal(n,
-                                    is_q_smallish
-                                    ? final_quotient_rounding_mode
-                                    : float_round_to_zero,
-                                    0, fmt->frac_size);
+        *n = parts64_round_to_int(q,
+                                  is_q_smallish
+                                  ? final_quotient_rounding_mode
+                                  : float_round_to_zero,
+                                  0, status, fmt);
 
         /* Compute precise remainder */
         r_precise_buf = *b;
-- 
2.43.0


