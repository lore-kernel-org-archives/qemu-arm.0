Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86FFCD8C81
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:50:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoF-0006nL-4P; Thu, 04 Jun 2026 19:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoD-0006lk-NU
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:09 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoB-0007wS-9o
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:09 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2bf77d4a4e2so13994155ad.1
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616946; x=1781221746; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6nA2YiQhG++AMTvXj+mmEfp459VqpwutOWbksti+JQ=;
 b=F/RaKhLtt9Fq0PIR56AArkzzKiUKE9kGDWbHeDQSUXEZ6AEOv4RegZyMdKLsqJFBx6
 0CcMSie7TxaKU0rmqphFJ8iKzELrWAVnUXXhp9PeO0yXwFhrAvYGcZKHZgZQr+jALaE1
 fjFC4RcURjwL7F8PjIk6DZC4QsXw7tUIjfHq3Tga+52k8S4sju34E5FQBqMTb17+MCXh
 YPTE/uegp8GH2mk416xuQZDQfePL57gUvmyIvR0eAqd0ll9PEUOFLMBqRi6zrwvGVlMa
 iYIE61glw13pggiuT1uGalrqqO8yXQcZHIi9ainkFNNovj8UZziLPRm3Q4biOmtQSqYz
 JlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616946; x=1781221746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W6nA2YiQhG++AMTvXj+mmEfp459VqpwutOWbksti+JQ=;
 b=Rjzc5vTWkhByTRPioytzxMZLWlJrRt7Alkalxzr7QNYr+CVwrfb6QDiNQIj//zVohs
 DwUDRZ5XI8MwfFuZswJ7wNNv0+Arm3iWi+R3xqssT4LWzqXAGTaSIO1BjwcKbgcZOVBB
 ic7HE5BpLQzQXHnv1pYIwoZD2Rkb96ZVFDCumwbyJKlcXi6T9T0B4GtvJm5H7uJ5W1Q7
 RJw+ZCNZFgMYSATLKqxMehsurXnRz6iQ/uxkKcfgZG0sqmTY54J/s/hGWSp7p8bfbC16
 aIfDCYlHhlp8dZXODL7uxxNJJVVptrcweNtvkL9/XIxO1tMFZBwnIh/Fh7GNqajp9C/z
 Uwtg==
X-Gm-Message-State: AOJu0YwSm8bM2zTqyD2A1qS29fkySnuS30R9X6D5gDvdAqxWkew87397
 MeeUN6YOGhvzr8f4U8PxDW4o5ytYuM43ovYgxfIsfh6fal54G6nIa2PX68llwQq6Uy5WbyiDDzy
 qQf0Ep44=
X-Gm-Gg: Acq92OGIFGdfrl66u6tk0A5ZkJkaGpjPro7/4kAfysu339ncjZU2rUhNzl8S91aHXBS
 8BQEEXexR0fm3RjDTgcPXxYFrDIncCXYPzWSu/U/Q1KcVA00v4+AVvOh/PO8QP4joLYqNhfWZEo
 Og4vjagHpisVAjTNXtFX0LJ1A/6ObGOq8WfwJm+ThgA8sNBoW9sKC2dEF/M+EIilTCjKEFn34Np
 tETqQbmG7DQMphqpS6D4Kt3RISG932SNl7NVs0OiyEWCbDnDG9DThz8QTc4jKuumlKx7KZicdQJ
 JVyQYAnT3M+Y6WAS6XZRFWTaabLYJGqDHqyMXfVFf9CDc+rL9QPpNEig+34USlvXDbYZviK2+Fn
 T33i5PdsB39JBxnYRKoswV4GybgTvlnYKXeGQPPcnMe4EjKtZPe+bkdfaa9A3FSHhirzAIQWSy2
 NHh6O0k9ZPss5WDLTsxCT4RdMDDgnYTfeZnRcYwQc=
X-Received: by 2002:a17:902:c403:b0:2c0:c262:b924 with SMTP id
 d9443c01a7336-2c1ec920ec1mr1487065ad.13.1780616945832; 
 Thu, 04 Jun 2026 16:49:05 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:49:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 16/25] target/arm: Enable zeroing in DO_FCVT{N,
 L}T macros in sve_helper.c
Date: Thu,  4 Jun 2026 16:48:43 -0700
Message-ID: <20260604234852.573178-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Use the low bit of simd_data to hold a 'zeroing' bit.
The simd_data field is currently unused and always 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index fa4bf02278..c2b3162084 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -8595,6 +8595,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vg,                               \
                   float_status *status, uint32_t desc)                        \
 {                                                                             \
     intptr_t i = simd_oprsz(desc);                                            \
+    bool zeroing = simd_data(desc) & 1;                                       \
     uint64_t *g = vg;                                                         \
     do {                                                                      \
         uint64_t pg = g[(i - 1) >> 6];                                        \
@@ -8603,6 +8604,8 @@ void HELPER(NAME)(void *vd, void *vn, void *vg,                               \
             if (likely((pg >> (i & 63)) & 1)) {                               \
                 TYPEW nn = *(TYPEW *)(vn + HW(i));                            \
                 *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, status);      \
+            } else if (zeroing) {                                             \
+                *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = 0;                   \
             }                                                                 \
         } while (i & 63);                                                     \
     } while (i != 0);                                                         \
@@ -8617,6 +8620,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vg,                               \
                   float_status *status, uint32_t desc)                        \
 {                                                                             \
     intptr_t i = simd_oprsz(desc);                                            \
+    bool zeroing = simd_data(desc) & 1;                                       \
     uint64_t *g = vg;                                                         \
     do {                                                                      \
         uint64_t pg = g[(i - 1) >> 6];                                        \
@@ -8625,6 +8629,8 @@ void HELPER(NAME)(void *vd, void *vn, void *vg,                               \
             if (likely((pg >> (i & 63)) & 1)) {                               \
                 TYPEN nn = *(TYPEN *)(vn + HN(i + sizeof(TYPEN)));            \
                 *(TYPEW *)(vd + HW(i)) = OP(nn, status);                      \
+            } else if (zeroing) {                                             \
+                *(TYPEW *)(vd + HW(i)) = 0;                                   \
             }                                                                 \
         } while (i & 63);                                                     \
     } while (i != 0);                                                         \
-- 
2.43.0


