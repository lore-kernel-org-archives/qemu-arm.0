Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82614F46C45
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 15:05:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9lVT-0002u9-Kk; Mon, 06 Apr 2026 11:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVR-0002sB-5n
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:04:49 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVP-0003qX-Ev
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:04:48 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2adff872068so18070875ad.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 08:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775487886; x=1776092686; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTl6UdXPMq3a4SAQ816+q1nAoDgsRIfLxCudW7enz6A=;
 b=DIe1jiae6c7xsypEtYaZGBeatOhxvFQGrFNW1T8lOVQRyKsZ5D6eTr/Fc6ChcxXOnM
 5CujWMMN8b+tv5zLyadyWdFXUeOLXfZLhuWk1ifreqgHl3MBZ9rkoJxjssLWzP4GgTuh
 6z7a1DdNLBqDfb/RyeWfDdxDEJBjEDSD0cr5RsMmuj8NFwYl+/GLBWcUdpVu4Lz/6Fym
 DKjadZjtIyYXkyH4x9lcJWBEmzG//SvJ2JKCuQAaOyp8XCQrNuk+FYw66i+Knu4aL2DC
 Z7CnFh9gHdz8rEYVtOsztHEKu4j7F31mt/wQWkEp1n4T8Aqjl+VUZB3jpp4xlFLQnDDG
 biXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775487886; x=1776092686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eTl6UdXPMq3a4SAQ816+q1nAoDgsRIfLxCudW7enz6A=;
 b=qVU5oOLnhrlENESzRuKhRbxbKkNWzjyGBkDmBAVxR9ZVl5MRH8v8mZ7osRMb5elfvt
 nCt7jAsscxp+Jk09rTFTSK6S/KHfLV6uyLnU58lnZypBVD4JxcwPxVIRBiMJT7j63f9S
 XWZN6+j80Hx4eq7xy574+L3pEPvXn4fDKKeAZ10AvaQvuaHXzoZWUbyRDCfwxmPSiAFN
 lUQaAf2NGjflCWSONtcmx1s3Bg6dFbEqEU2GxjXFeEzWaFUdKl6GxBuUM2KN3FAjrMWI
 J2B4xVA+4Bc0Gsl3JmPMg5O/MO5K+/j5rlGAdccGY8MqQGQBpk4jtmeZXH32lQr0rMAQ
 uGTQ==
X-Gm-Message-State: AOJu0Ywox9NcR4VGo3qva3a5cTzBN0r9iw4ov+Kgmk12sf47OfJwWthm
 RBU9+z4kIx6OxjfrQzpQaXAVmD3ibSFrAkLqby+mvL0+vXE8AI5pYjYWfAO9y7G43pA=
X-Gm-Gg: AeBDiesQ/C7rjavQ/UFYlYy46PAYGA77d2J0Ay5viyf7xMcvl0v7IHRZOn0mtZyQXUN
 txa6cgxwB3FIQSehGPaG0A7oZj2iG2L8pUfBpMfq3EI+XBKZ+S7ZnlnTLuzrbF0rcbFC2qHYKHG
 xqRSxPmFk4xa2cwEoVL0lTpuMOjJznlf3M2yMxsC3Lp0sblXYwL1PxS08eRceMpSHfYRE/APSQC
 qBS7UjWxewegB6ABCPqkUBMyCVByQBdt5P01nbK6kCZO0SzkbMcQ8HAkgwkd/qKHyxpfk6MUPr1
 vqw3oN8W4nG7RlH+7PBGH3oEVIjYlx5Mwt7uae/fJQO2+RjPBRUCAx5BNioCORy/uWXHCpv7YdB
 01Jk3AUMio6k9Hko94LQZsFjdElx2QWjJ3/l1p60/iYO4txLJULwpBlwq/K7AcGOsm6Ve0QR2hM
 zvpZj9ccMigToa1w/r+fkaQc0Vj4C8rNSzDorOFIaOjlB2J1LLKuFxnFJLRkAdf2504mptTPRpA
 C+2
X-Received: by 2002:a17:902:cec6:b0:2b0:b290:f302 with SMTP id
 d9443c01a7336-2b2818de0femr158776545ad.35.1775487885870; 
 Mon, 06 Apr 2026 08:04:45 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d72sm137770075ad.51.2026.04.06.08.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 08:04:45 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 03/14] target/arm/tcg/translate.h: remove tcg-op-gvec.h
 include
Date: Mon,  6 Apr 2026 08:04:23 -0700
Message-ID: <20260406150434.407201-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
References: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
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

Include tcg-op-gvec-common.h instead.
No target/arm code rely on target specifics for gvec ops.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 6d52606f9b7..e28eac54afb 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -3,7 +3,7 @@
 
 #include "cpu.h"
 #include "tcg/tcg-op-common.h"
-#include "tcg/tcg-op-gvec.h"
+#include "tcg/tcg-op-gvec-common.h"
 #include "exec/translator.h"
 #include "exec/translation-block.h"
 #include "helper.h"
-- 
2.47.3


