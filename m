Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAEEFB5181
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:30:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wAg-0007Up-Bj; Mon, 06 Apr 2026 22:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAd-0007Tc-Uv
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:04 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAb-0006wY-36
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:03 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-35d932cc948so2568674a91.2
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528879; x=1776133679; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTl6UdXPMq3a4SAQ816+q1nAoDgsRIfLxCudW7enz6A=;
 b=m+sd/FrIYi1tqVd3NMPqbwAh40Ugmw/l6sySEb67T9fH/ie3Dg+Dl25X0Sytz+lErB
 VRH6i6qcGXZQl3+TIu/c3wVhLi2HG9BPkjrhqUCHj5oh5ysXTrjGUBdfxY9Cl2z6zGxs
 n2QL5zs6C7kZEa9DjdPtVcYbuiONMBvTbuvJDOHA8nsM+rey5SZGZBpkRszPrqojc3ST
 OPWOzfe/2nVOXgRAsTJ9GPwhOAqKPRcgjaKJ17fhU9EnEAlwM7XzhOrOSoxERE0QNzRO
 6tvmxlDW8D3+Jl2p4HGtht+9EPtx3QNtwsHxaLCoM2YsVwYbwSEUiWiAVI6TlE4wZv4/
 eLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528879; x=1776133679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eTl6UdXPMq3a4SAQ816+q1nAoDgsRIfLxCudW7enz6A=;
 b=h/Lm/jZh/S6zn8lDuf3B5DFqDWMRdV8P2VgZ5gZwuYwOW3Y2rIAjSYHiWWNENeYG2O
 iC3H/LKZ1NhuMGTeGQ3SqayiVuNqvJr+anuGgiPx8hEVBsYhYllXor9hvdxZUOGqSSgb
 QWfpWRJegEbma6IpVdzinpZsYi7ua1Nizak8QGpWgwUBLHxuYXRT+6ts8yaMLJsCj+Bv
 wgi8U6pVQpZLDT7yiJlqCq5ssF+NDlJVOORfU+A2lcyCJSTtcR3kaWLvwDcfaUdusdq7
 F0SPKWHknsH8LRto4VZ7tBC0DXbOF6cpoyoKGZpMFifIksIDk1LbBz/ePizdCjiHMbwy
 Bo9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVIF9Yotk0i5EZb7vniIj9VQ/nTg0wqig7JRwqSxT0M41NoJjjh+KH+r0KRtc8iOeD10a6Vp33sw==@nongnu.org
X-Gm-Message-State: AOJu0Yz2PSTXR0t4+U2FeRt8+eNuC/0BlpJn/jptxoSkjK0Mh5Tq8VG8
 wIkJOhgL6toKepOivoPi1GBBSdsky24PZcS+0P2zF+7EoexG6xwqyIjqlyfkEpZGkdI=
X-Gm-Gg: AeBDietQPJrbCQAiuf0yRYckwQEA5v8vx4NfeijoiKkOJJD1zh8j1erxB6VJz9VAhLy
 p2WELucElv1pP0wsX5rB2sL0YDaYRWvRYhRNV0ShynY100+QW72H+EcRSK0qPiOkNuLqrWseicS
 hadGqAcSaXrC2zwOdGpxfuohIASLFLAwfXAEO3VVFPQUmpDbbCVBKI+Fij5+XtnIGRpxZ9iKcr7
 JemRwfCX9EpVuD/G6o9U65NM0DJC9BSeQLE4APOeLCoSKoYmMtTBdGUnABZWamP84FZYLocSCBq
 FCPfW1hxL92v3vvonwOtXSn5pVFMXyCydrv448L/y9g4k0zYWpF1xz+/zQ4fINhSWO8/yCrXja1
 XjibfrvcL8EnQWQ4vGzeb2w5LTBnd/UBQIa8selwlvL2G2LPTbWJg8/lFTyaqiyX7bfHqW5l5r1
 tOoEpsmiErjHvQmCvUN8uBOvi8eiOZ5APdF9cEVdBdXVAWRETNg2cgLEMgAnqW6IIEs7P8SOBOz
 vtd
X-Received: by 2002:a17:903:907:b0:2b0:af2f:b27a with SMTP id
 d9443c01a7336-2b281667455mr163936055ad.11.1775528879344; 
 Mon, 06 Apr 2026 19:27:59 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:27:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
Subject: [PATCH v9 03/20] target/arm/tcg/translate.h: remove tcg-op-gvec.h
 include
Date: Mon,  6 Apr 2026 19:27:31 -0700
Message-ID: <20260407022748.57629-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1032.google.com
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


