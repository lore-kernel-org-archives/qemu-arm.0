Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4A4C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 13:18:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weYLO-0007d8-0R; Tue, 30 Jun 2026 09:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLK-0007bb-8C
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:40 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLI-0005tx-NB
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:37 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-697cee2eb6dso4305992a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782825455; x=1783430255; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZTLjzSfXXB3tq3ab+/lswKxuzrTXyhJd8Zf7X5oV6s0=;
 b=jojuP6FtLxI7U42en9xP/OrtxaTglyKNYVe+CtiU/h12UMi1W3gVn2C35zaXZOGUM7
 1gOwWDYN3gwmEUnrdIeLI40cRC0WOQoM+DbSvdEq0+ddLoqY6gUleVUeOo4/QWwGaO75
 QTW6bTZwhmz3N6dGb1cmRF4AIUwdrbtB47RUivI6ib+768nR4BCUM8MZ9EN3snoW9JWT
 j+MaVqf4GHSwXaqLQ8S2ltMUa9WXOy+ZkltFFkSapxpLprCc7IqTpg2klq/04OVHa/Pg
 OEGqn09afIOwy3Jj4kMnnDWHkLFpVHGIwU4c/lfJ1Ya1xDXuche2h8GujmODlHKuGvdJ
 14UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782825455; x=1783430255;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZTLjzSfXXB3tq3ab+/lswKxuzrTXyhJd8Zf7X5oV6s0=;
 b=C+GBoXzRSvkKsC1aNkP1jWmgHO4uJ8k+JBrXggrMiN0AyoYi/anuo64ZfRg7jFD9Hz
 dBKucTDRlinnMnaYX29xIPCXxgBM4M++K32UpcNG7qrZGwJytFKl5yhVGe0KMq+sXD3W
 B9klz3+P150aECVxoIWDbtES+mIHd/fYz6obL0I9qmhuQaTY1XYd4Vnb1zyOMIP1SHvb
 YAl+ywDL+++8WfYS/cssOIvVCvop3ZfB7up/lukn+8ljjG1/keOcqCUEMVJeldQQYawn
 Af9/w3XTyjCv8aCttT/g1M4ttfQSqK/Y/j2bXqeSq0z5AvGoJp89pv1xqqulyrv+YXRq
 89xA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpxFNulo+Jz+3EhE8xEjXhC5V4mEdOIxAURnjwF5jHZe2dHCtbtevBNAZObg975IwAX5jxZ5bKZ7A==@nongnu.org
X-Gm-Message-State: AOJu0Yw2+wBjyRZ4zrO4Fo7It0easCBrpf8tY1nhwsWCu9CRech/9eNO
 MZ2VfHUESCt9wVOCcYWJxYQIw+qhs8Z6JOzbx0SGJVGdfk7pWlztLUZ0PQdnnSYTqdM=
X-Gm-Gg: AfdE7cls/bIiLi6DGn1EAtcU/zZ/RTs9f3q76a7rQpVvE/CO01E6TMVpAUbW0fvv3al
 fjs4uiMPmH4OaOUL76Y2Y6rZ7LHfbDOqciHzD+nIW+e2x0vcBMGqMQO6cM+lpcTyV3VN9ct04Ph
 IB9cp7F9JokZpws9BFI+WWyeAJOfhSeosb5N40+uSecBVpglN0pkmq8UbZJivhAIGo59rc0Oe8M
 Nm9GB8JXfnya04DH0JdSwpsgytbo1HY06p5ysGQS+v4MBGT1TBjUwoTgiL42TD9gIdlcDh5DIlr
 zUCaJsdo+WUsBaceepkqWShYXdNl2hAgXKGJq2ux0eRB14Q+tO2e3RZimYo1Y3TSsUSiPc+G7p1
 BEHWh3NxwcnToQ+HtxmnbE1qGrboqNfew272ZUoAaGT1wNbvD1GbtkVbOSZFYRSs9dl8OIFAngv
 pkEOC7PyICJ6Aif/o=
X-Received: by 2002:a17:907:1b26:b0:c12:2ee1:72a8 with SMTP id
 a640c23a62f3a-c1287026ba2mr151638866b.11.1782825454259; 
 Tue, 30 Jun 2026 06:17:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:a648:9a45:1aff:ca47])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6987c3a42f6sm1201535a12.6.2026.06.30.06.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 06:17:33 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Tue, 30 Jun 2026 14:16:36 +0100
Subject: [PATCH v3 5/6] docs/system/arm: Add FEAT_FPRCVT to A-profile support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-jmac-fprcvt-v3-5-f4840d5e0a7f@linaro.org>
References: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
In-Reply-To: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ed1-x52b.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index a8072ddb67..98c028f6a6 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -85,6 +85,7 @@ the following architecture extensions:
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
 - FEAT_FPMR (Floating-point Mode Register)
+- FEAT_FPRCVT (Floating-Point to/from Integer in Scalar FP register)
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)

-- 
2.43.0


