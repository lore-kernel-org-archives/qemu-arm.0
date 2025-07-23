Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4A1C83F17
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 16:55:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueckS-0006jY-3y; Wed, 23 Jul 2025 12:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ueckN-0006Z6-9g
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:55:15 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ueckL-0007CX-Ak
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:55:14 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-455ecacfc32so120345e9.3
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753289711; x=1753894511; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TSSqnF+/AnLbbiFDbwFnSXG1BHUKqc9hNcz56nYG9RU=;
 b=uWQhX9H7VkG2G5xOCBCwu4x4KBMLwUq9+WSNMqHEfGDHag5tP3vRfQqxlxVF3cYuP1
 ndJ6aH92sItIBYnQwbH7AQMaKrAfyqlyomCTldMmjVy0zvKuRFk3AuFNX+KrDZ6kdSsA
 g7QE4Zwq50TiTOaByIvt0DyMA6rZvbadO7OA3C9niZs9tO8ZhjY3DidT0I4B8Y+OygEo
 7q8JKthvAjSYCOhB0qYTleKI7WSz+nNSELCSdGp7UJGHAD0NveOETmbO64N3Uxu/YEhI
 sFw7FHeQ+14j2o1Fe2QwTngjElJWLSG59g4hIX+40c1bWM3bJoaLOfXMEJXqnwkVCNay
 B4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753289711; x=1753894511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TSSqnF+/AnLbbiFDbwFnSXG1BHUKqc9hNcz56nYG9RU=;
 b=pl/dpmIEVDOxndvDGjtfSfHMYWarVZ19jxMFmUqE2e0lRSj8MACB3kryek41n8fzqp
 xKdp8fVulAr6Cxa9UVtpoM9g8K3n225X/I28GvCWpR9C0ja2CnFR61/BCUiVGgP2EX2x
 OJ87C2P0MwPBP5GvzPHehhpexz6umI7GHgI3VqLG6r1aXymeQ5L8D/XiuMSrzX3HCZFZ
 dSY4XVPFVm6w2nVKzhxVy+mG0Sy467T1JEAH06jgyzNjs7L2AEFbtSvtT1Bh1pPhNheB
 hkOhBzb1bZKfw5zu5GYmNJFpggAZmqR3Ay5iPDcMU1Yczwwgo4ukbuF4bGuaCDbg1tn6
 mMIA==
X-Gm-Message-State: AOJu0YwU+Ut5azxwSXo9dYfllBEYkzyszF2GAEQZkcOmsEqCckRG4r6S
 qM7G4pmsPXoLd83Z8i8nPzBuJAzL2XYrjrMSm2QQ5Nk+65QOInuPusjj7ldLgSSyxHyRJRqObsk
 +krBI
X-Gm-Gg: ASbGncsf+BEtEdGagrNvBbOtin0RyGPGjEe1mn78MlTVY8bKOASGrEVMnx8RZJgnZgd
 OvJShEocBZVlP52+USCNyox2W6VRGIAQyoD1PUh596XxGvC5n8iveFyqNIekHOD2B/CAFMRwxaH
 /zUpkJlG9kYfCt29ANabSyGo92MmiwYR+7rdzPE9HGCgbZpccaBXk52P3YC7YLmq4E/1fOMwLMK
 OZnvYwQ51rRt/LX3JCEOyIWeS0M2CPIDZKy2oGMZLuRRRFMC9YZz9z2a4COmtoF19u+ZwCHtoMP
 OBuVodyQNtR70Jfv3qEqudnXBLucuZN0L8LZNmhzsQOXnsR2kXdqxkUuGTfaH1pqDUmavSdSJTp
 GJrG9khT1GW8ImOe7DONbCy/GzaO0LH0UWsCGILI=
X-Google-Smtp-Source: AGHT+IGH7cxCrVcNJGmUuVExdHaGCE4xgRpV4YihEuNUy32SEWElQCbzk+28z/NwH/+QLbxcVvAniw==
X-Received: by 2002:a05:600c:4f05:b0:458:6733:fb59 with SMTP id
 5b1f17b1804b1-45868d4f124mr31899645e9.19.1753289711496; 
 Wed, 23 Jul 2025 09:55:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458693cd224sm28559825e9.21.2025.07.23.09.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 09:55:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-10.1 6/6] target/arm: Fix LD1W, LD1D to 128-bit elements
Date: Wed, 23 Jul 2025 17:54:58 +0100
Message-ID: <20250723165458.3509150-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723165458.3509150-1-peter.maydell@linaro.org>
References: <20250723165458.3509150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

In our implementation of the SVE2p1 contiguous load to 128-bit
element insns such as LD1D (scalar plus scalar, single register), we
got the order of the arguments to the DO_LD1_2() macro wrong.  Here
the first argument is the element size and the second is the memory
size, and the element size is always the same size or larger than
the memory size.

For the 128-bit versions, we want to load either 32-bit or 64-bit
values from memory and extend them to the 128-bit vector element, but
were trying to load 128 bit values and then stuff them into 32-bit or
64-bit vector elements.  Correct the macro ordering.

Fixes: fc5f060bcb7b ("target/arm: Implement {LD1, ST1}{W, D} (128-bit element) for SVE2p1")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/sve_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index c4aaf0cc45f..c442fcb540d 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -6439,8 +6439,8 @@ DO_LD1_2(ld1sds, MO_64, MO_32)
 
 DO_LD1_2(ld1dd,  MO_64, MO_64)
 
-DO_LD1_2(ld1squ, MO_32, MO_128)
-DO_LD1_2(ld1dqu, MO_64, MO_128)
+DO_LD1_2(ld1squ, MO_128, MO_32)
+DO_LD1_2(ld1dqu, MO_128, MO_64)
 
 #undef DO_LD1_1
 #undef DO_LD1_2
-- 
2.43.0


