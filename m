Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEF1CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:21:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZ7-0001T4-Vs; Wed, 20 May 2026 13:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYy-0001La-EA
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:33 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYu-0001tT-4e
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:30 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-36936dcf19dso2432752a91.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297506; x=1779902306; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2J8h7EuqX8JGH71JQZgqsud/ulFplvnKZbTkt0er6k4=;
 b=etK+tLZfutA/effxR7MraiXzQF56H+kJb4c+dJgaJmRuLxcU5tefevzAOZGJS7FyKt
 4daK03f7Egn19iwYEwpb+NzDYCTShN4Xz2uw9NzE5w/Y5HiVMzUypJNmd1AM9dqpbTc1
 wE0Ks0X9KN/ndY9YxVQXAmcpkswvAI9/vbVVEd34mOKLXPeI/Nl71BPXR3//0risAsZi
 DOPcRSR9J13t+tGwO3yYt73jc1RGbCw/hhRkZwG6lVYIKD0Z4Y2fJaTnZj8t/IJzhKuO
 dPd5EL9F7fL7qxll3KZ6G7x86ykAedC3HHVKoODIC2Uad5Mt/psb3p7BACq3OyKnhMRQ
 7YBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297506; x=1779902306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2J8h7EuqX8JGH71JQZgqsud/ulFplvnKZbTkt0er6k4=;
 b=f6Bn+HfKXxRUCL/BjAPKooSJiQjIZbvPRzgEvQsOIdtqGaY+9qm3YwQda61bdlCUk6
 p4srmJyhfy3fFjcPqHfskuQTg+BZ3E29CmU92JqrwkKkFo1rcEtOaB2Dp8wXgKC8Njnh
 wC3IOyk2VTeHn+uT9FlKTlmwt2LBvD7FLA8CE1rFvc+D3C7PzQkv50BsKfdAm6vNlXGc
 XOlHzV4omTJz/lviDJHDqTmJFosLW1Rph5HANFsgNW/lNquCbMQhbYW42AKgWL7g2qWh
 zr+BpMm7TZSeVPR8S6SrnmXpbnHyHOKfSbgM5UAvdebUU1zpUI+sjoZfaHcACXKMGoRr
 wu1A==
X-Gm-Message-State: AOJu0YzOMd2pDfa2GxH5v9SvvvSyFszR3YQAkHfJ7cToieJI1MhuMStx
 j8czAPcgZafkxxG2vydgmnpcqsX/sMJekwjDz3gxnu1DZzL85a1embrdph+6tML7E9AlN3hVAxX
 bdK1RqC4=
X-Gm-Gg: Acq92OHG+1zBITc4hyS3QmOelNqciGfuGhdJV8XQi6kdpejBm3SZQPuPJcEOjlDThi5
 pJjpCWhzwJqwqoAO0oMXEETQiAoTxn2qCcJaU2Ocv5yiM4IM4HYNox9DCiAdIE6VPL0E+yJm0Nz
 L8v8mFK/klSuv7gssCtSNjxneevOA9pPZLmS7gifRoJJA0YZI9Az/5sIvsXqpHfYM/2VW8Lmpry
 2sQxroZ2/W8Z92stgHjtcW3c2dNya0k3X5hzg2IKVSxM7R23OlMA9CzYsPXHWkxcRmujd7sYY6T
 CfyHbR8xaBbOiZzHxryimuxQmXIBikxvwn5sS38iCBUmYdq2dSaR7gReVqFe5neCy4ecXKvGECX
 BZcvhQolgqv1XyfSbnl4rIRXv480gg+wPf2cOFHMgkUiaAqzIrFZqVF7/JQkkNq5lHkVDri4LkU
 oxWsz4M37Zp1vJ1SmrdzRHSKUBhJ4K
X-Received: by 2002:a17:90b:1d83:b0:367:bb54:8768 with SMTP id
 98e67ed59e1d1-369518970f7mr22392194a91.4.1779297506307; 
 Wed, 20 May 2026 10:18:26 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 06/30] fpu: Use parts64_round_to_int in
 parts_s390_divide_to_integer
Date: Wed, 20 May 2026 10:17:56 -0700
Message-ID: <20260520171820.848839-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
index 905ba6ecf8..08ea56a71d 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5197,12 +5197,11 @@ static void parts_s390_divide_to_integer(FloatParts64 *a, FloatParts64 *b,
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
         r_precise = parts64_muladd(b, n, a,
-- 
2.43.0


