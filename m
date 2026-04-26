Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F79FF8863
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:55:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpd-0000DJ-57; Sun, 26 Apr 2026 09:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoj-0006N0-Kx
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:39 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzof-0001m8-Ue
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:36 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2b2589c26e3so87818155ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211192; x=1777815992; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ArQwXjzFF16f9Ne+o84gg3ezdzBrk7JE6QKO/XyacX4=;
 b=NzRGkwkOF9pnRzIQRHnOVyNE/yAzpxAuqTt7rewRUZx/o4wofSL6k/cvGIrXdv5ZkA
 bLvnHfsEH59y/ZHx7nfDoxl/41SRL76CtPyIh67MhPNMJYOc3AmBSLpAcWDN1bgzw6nl
 c/bEs+q7tNg8g8Almh9E4yGAK3IF8JbNTpVtoNWkZXBeudm7AwW+3x0uxFadWe3CW3eH
 ANJV99RsZLTJfDrmWRlRg7kk1+a/AkyoGQumCSDxXoDwlLxV/OEhqK+vjdz7NXnsFSnb
 SzA/1VUMrKXRe3e0KuWbo+jr/0L67uciCEn0E4fQoeRxHfh9msa8wz526TWmppLoDT1o
 RFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211192; x=1777815992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ArQwXjzFF16f9Ne+o84gg3ezdzBrk7JE6QKO/XyacX4=;
 b=MjRj27I7lrue+WRdq8+aRLXfpMX5JMhxG2Z7yJgDsG8bXVFTs80eBZVVA4y+Vh1fK8
 RKojvv9D2WG3JO7+mzTYWs5pRl3p5GkHObeUUqxj/VLn4q7vAifX7AxDaexYWuzzjR+a
 3qj2p2yDNhdbybK4bpk82uGttDjXdsqDPDxhgaE4t0zSxH1wQM7x13q1PlciUULP12V5
 ox6qUPElob91rkm63MPK8/VLwcY9kRNYA8xrr1rgijv6UAMn9n/fC1tC+eCOel/jT4sd
 Xu8eOdu+TAkXgcMkdAk2nX/13hM2SXIBhDnoHkELi4akNUJJ6sNIE8GTK+csD/KsaqeG
 sNHA==
X-Gm-Message-State: AOJu0Yxwhuud1pPtqCpZZYUZvXIl4UKl86KnBbhiOS+wjjExhNx3eit9
 hIAwwDCfcOMtfq2ia2ElodiyElrLZI3iXkiRVrH3q4cjAN98wCEp3ws0JEyLo8ZpoBI=
X-Gm-Gg: AeBDieudCglgz7yKtAQaNvxz/4noNWcoTsz9ZA1JRvkGyjXg5fpV0ukhyvi2qpzEUrF
 1LvKbI0+awtX4JkUgylUnohlM2uIv0GbJNaqFVKIMgjtoUBR1tPUv0fiw4hHDv9qzHJMy460ePP
 nd1vJIGD7Y8zbJvD5Zq8Xcl+5HDODjoCpa3OWvkDWAFxu/b6D3JLkXkeP35I5P1/odCKqpY3PRo
 oeLUJIehSeuXKgdQjvuhG2rf1RIdSiqUb6sWFuJmmHKm1otPKIcnl0GdbNXVGOzN5gScdim+MUm
 bAyYgvieg5JZgc74QwPga6lJ87yoI9d48O2X6S3B6JzHOzHSVGAlCP25ZvjDZtcnSqjhR0PpmaU
 /RZiw3pibmTyYrUJIbVvegku51Pet/FWW9onx5tPIAU8+qBWDqq08B4SWPecLdSQF7POaa1wVGY
 61Q6YhAlkFmTleBMEe1KlChA9JVbo5VAO3+S83dYVN
X-Received: by 2002:a17:902:ee84:b0:2b2:4697:78f4 with SMTP id
 d9443c01a7336-2b5f9fe094fmr331404855ad.31.1777211192517; 
 Sun, 26 Apr 2026 06:46:32 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:46:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 75/84] fpu: Drop QEMU_FLATTEN from muladd routines
Date: Sun, 26 Apr 2026 23:39:52 +1000
Message-ID: <20260426134002.865628-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
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

The float16, bfloat16 and float128 paths are not so
important that they require forced optimization.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 959a82636b..d51920652a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1897,9 +1897,8 @@ floatx80_mul(floatx80 a, floatx80 b, float_status *status)
  * Fused multiply-add
  */
 
-float16 QEMU_FLATTEN
-float16_muladd_scalbn(float16 a, float16 b, float16 c,
-                      int scale, int flags, float_status *status)
+float16 float16_muladd_scalbn(float16 a, float16 b, float16 c,
+                              int scale, int flags, float_status *status)
 {
     FloatParts64 pa = float16_unpack_canonical(a, status);
     FloatParts64 pb = float16_unpack_canonical(b, status);
@@ -2114,8 +2113,8 @@ float64 float64r32_muladd(float64 a, float64 b, float64 c,
     return float64r32_pack_raw(&pr);
 }
 
-bfloat16 QEMU_FLATTEN bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c,
-                                      int flags, float_status *status)
+bfloat16 bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c,
+                         int flags, float_status *status)
 {
     FloatParts64 pa = bfloat16_unpack_canonical(a, status);
     FloatParts64 pb = bfloat16_unpack_canonical(b, status);
@@ -2130,8 +2129,8 @@ bfloat16 QEMU_FLATTEN bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c,
     return pack_raw64(&pr, &bfloat16_params);
 }
 
-float128 QEMU_FLATTEN float128_muladd(float128 a, float128 b, float128 c,
-                                      int flags, float_status *status)
+float128 float128_muladd(float128 a, float128 b, float128 c,
+                         int flags, float_status *status)
 {
     FloatParts128 pa = float128_unpack_canonical(a, status);
     FloatParts128 pb = float128_unpack_canonical(b, status);
-- 
2.43.0


