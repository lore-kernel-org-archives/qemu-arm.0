Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8C0FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:42:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzjD-00077t-PW; Sun, 26 Apr 2026 09:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGziu-0006y9-3R
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:37 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzis-0008M9-1A
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:35 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2ad9a9be502so58228745ad.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210832; x=1777815632; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7r9gKcYxP/AKKHrV6vUOMBch48/rRs6VOLxoecOoEA=;
 b=huQgvnYhZ4Zr/EQ9osNEdkbE3yVHsR9ljtDeTO8TkiIX85gm/qn8zhs6K1PQ2jwFdJ
 rCaK2Lp9Nvi+d8p5Quf0dQEUq+Flcd8QBUbpNNtBvOluQMk5bYBxMqUWOXlI5H/SGNoX
 C2PgVHdT/D67jXGuxQGml8pzVNrhNuJLHr6zPWCP61gg/4BgR/jPCyHHG5i4fbRfdpAz
 sWfXQ/C8TVHMWDFgsGBcOwXV/4mzdZyQJfjISD+EZSlNxDIcAuLnlFQEJwLXiELY2Hk0
 WgWXrOQtWOluvL+RcmqmWhu6l7UdHRx+aHMxJV5BF+0vwH9VmhrvhIIkaCAtBwN75ey9
 MbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210832; x=1777815632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i7r9gKcYxP/AKKHrV6vUOMBch48/rRs6VOLxoecOoEA=;
 b=ki5zq2CirJt+3XXyhCvr4DnL5xCodUg2vOWckXu1F7+7+hbhoq8LXaWT960kYZ+jxe
 6L3JJxTcaklzUBAUuHI9Ccy0OZ9AEgFdFEJWx5RrvJhvIe/DVyKmd+gaDxq/pNq2G7rX
 N1niz62n2xM3oisgw3x6wrpYWy0sRvEJwvuoBrdcBL4isNXv+te+eYjV86XojwyfBsXS
 GTHZOElJ/i45TVEhXhl4OLOzbbIwVRbUumQjJvoo5bayupiE9kqlbXHn4ITMK2diNN+2
 cXqmEcIYixQEQS6JJd1sqoRGatq9yfvZVFFALY68FyHlFH/tTck/dG+k+VoCoEp3S9By
 922g==
X-Gm-Message-State: AOJu0Yz6s23Aa8li9i+2GdxBQc97HI3KHJMUHgmLeWaYeWzpSgdWW0RE
 2Fndmv6X4BAg5QxSn3fRNi8O5TNpV1VXmhxHsdovLPlGJNlU7GVVIE7lXkXLKyprRRVkB7aq2MU
 UZkZOGq8=
X-Gm-Gg: AeBDievik2C9jdtgadpgJutQdteYMY3Y6UH/1Qhv3eb6Ci1wE/KzUSQ1LcQ8GrnToEx
 RgNFgTs8DkEPqH4B2kmDL5JW7AxBpeaao7U4zdvebdNDSGT9p5Ccs6I91DwHA2ox0vSZBfYYN60
 keyGEUiNxmE0px5QMJqD6eWScbp+euAXLPM3aO+T087hPR/5/0A0KU4hyR9DL37YYkC1Fmz2cux
 mD3XtjzNXdA8kDmWvsWcWtMJ5kNtZ2qcYL/p1Ix/GXCSWibOP0omHO6VOHE8MoIHS8era7q+SSq
 z0FN4DXQkCBR5MLsPfZT1tzDPJb8BAnGCr0OrJg+USFYA62KBTSl+s3DdEYXoUGTWpR2SueK7LK
 rIbzKiDkqQ9sB2ySa3s2yl2q/i3zR0D2bb36n+VqdGqEHGvq7nkIJr7yZKWtUVy+qBF8Lmf3M4c
 nCUBTVePSA0CLTTlECTfZHh8sE81LKBxUAR2SBdDJx
X-Received: by 2002:a17:903:3c67:b0:2ae:8272:deb0 with SMTP id
 d9443c01a7336-2b5f9ebd04amr411907525ad.15.1777210832478; 
 Sun, 26 Apr 2026 06:40:32 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:40:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 09/84] fpu: Reverse the order of softfloat-parts* inclusions
Date: Sun, 26 Apr 2026 23:38:46 +1000
Message-ID: <20260426134002.865628-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Define the widest addition primitives first, so that
they're already defined before being used by the
narrower muladd primitive.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index e5d8b9573a..aa96ac530d 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1638,14 +1638,11 @@ static const uint16_t rsqrt_tab[128] = {
 #define FloatPartsN    glue(FloatParts,N)
 #define FloatPartsW    glue(FloatParts,W)
 
-#define N 64
-#define W 128
+#define N 256
 
 #include "softfloat-parts-addsub.c.inc"
-#include "softfloat-parts.c.inc"
 
 #undef  N
-#undef  W
 #define N 128
 #define W 256
 
@@ -1654,9 +1651,11 @@ static const uint16_t rsqrt_tab[128] = {
 
 #undef  N
 #undef  W
-#define N            256
+#define N 64
+#define W 128
 
 #include "softfloat-parts-addsub.c.inc"
+#include "softfloat-parts.c.inc"
 
 #undef  N
 #undef  W
-- 
2.43.0


