Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914F410F996A
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:49:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXx0-0005Nz-Dd; Wed, 08 Apr 2026 14:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAXwy-0002mq-HQ
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:48:28 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoM-0000mO-Sg
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:20 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2b0ba3bfe16so2952825ad.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600537; x=1776205337; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTl6UdXPMq3a4SAQ816+q1nAoDgsRIfLxCudW7enz6A=;
 b=Hj3V0QQHD3N0XMGhCmjFCEkDs0AbPASAohjqyhSGVkxVKmq+6erpGpTXkhq4z9WeVH
 nd5+13dLCPIFfWb04QV8+Is/3Vc8Pk3P+AeKEDyazTiwV85yxKkMrzyTJRQagrMohj53
 ybCjnqvT9fml5uwBsBGFHtmE2yfra3qeAGj5aYmjlz6BiT0rISZkIAg/o9vE3XR/pVIX
 WCnqXfyhV5k6DclHA+VoNk03s8V4b49TNfK2FW0BUd1QZ8TNmEPavK+xCaRfTuQvfdTB
 mNAhu6OvuZG42Gd2Q9r5ci1ZxHadXzGslGjtECnlhOeHnnvKc0j+9szg/GHe7A8zieYh
 DxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600537; x=1776205337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eTl6UdXPMq3a4SAQ816+q1nAoDgsRIfLxCudW7enz6A=;
 b=joPmuFVYHZR8RyAxApcuoS62JiknHyjlRfi5x66mjDspiKQ4ATFiXOr1jGGz06/l3v
 ucVfZ/GZoDPistyOxcVlvlGZ3ZccczHlghN6J9BgyD2LNe6MzXEOY8F5eHdxIAZShLog
 f1SCAKyFVGKdsCCU9wDIfMrX8xy7PJiw4wuR4+tzsR3211kXs4hN3qtTPCr0HpMlIYXX
 PYRXE9hIxFCUNzLA6Am0962crW/deLL8SoUQEh3xJZgTSwYCSpf6hP4N0sPnQszDE7wh
 +F6MrnDUJa9SrJr6r8CrxGzgoDS4xwTM4YWscawNhPxoZMylK0mPCjXMmB6/8ZzPmtVN
 UIqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn7mkk9dF7NuffgsjVqQB5V8+mSWBPu5mUTBCza4aUyqmQoQ8SxUdmFNNp4IzO6BeiSSsuY3f4DQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw8IJlLZyyuAc9EyXA17bscMyun1UqbtIaOiGyxCvTBFlf4F69B
 N0IGIWJmbrCSbsCE+ayHLqlZRY8URRDirDRxuqzOCoDwqTZWW0NUAtioVD4ugwVfzd8=
X-Gm-Gg: AeBDietALyns9gFhrPv/isrWECI6oAge28Wy4/l+xyzxvuCSH2ypdNoc8Mqg6kSFxlZ
 WOlUcY43yQM6xcxzBKWTktADuvb/19F/AqRfqe5UEqs8UObSF3pwQLVUBadB0+iww9M9YTp3rmK
 kOK5u59llSlshhXbXGSz/aC+wXQgG3aztn/T8ccOaHtiwwfBABB1miutadtnlM97xvXarFlBMM+
 ASvaqsBvDuai5AO/Ry22WJuVuxNjKxkjwQHWpWyqhxAQ3ZU9Xs6xmAjCNJYfWYR5BD9D7u7HLpV
 eJr13yzJ8Mq+5eLl2dv4rk3Yt1MXz08PExYZtqwie9j/QvNIHBFcM91IFpdgJViXc+wzlILhpe2
 +mSpI2hWi47DHyMuNlGjAoXPsORCvc3TesQRBXBdbox2qEH12BapXoo64tL0XNjKerQbK94pr0m
 lXiq52JploBFD+cPZIEvx7UXxJvA6JNaGp6EoBj+9goXX82gILvX6Qak6gUtT2V/N2BlhMF0QPq
 2YM
X-Received: by 2002:a17:903:2c6:b0:2b0:be79:e521 with SMTP id
 d9443c01a7336-2b277e7eb3emr189565295ad.26.1775600537327; 
 Tue, 07 Apr 2026 15:22:17 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:16 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 03/21] target/arm/tcg/translate.h: remove tcg-op-gvec.h
 include
Date: Tue,  7 Apr 2026 15:21:50 -0700
Message-ID: <20260407222208.271838-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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


