Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018E0CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 20:39:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRyYa-0002Li-8E; Tue, 26 May 2026 16:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyY4-0001K9-9e
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:38:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyXy-0007Uc-He
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:38:47 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso94956835e9.2
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 13:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779827915; x=1780432715; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7mHdUlQXGaWyFWOgTCnLIZVkxyrdDDV5OFAs1hIZcGQ=;
 b=ylPUVU2QURMgd9Xx699Hqwga+3w3XW6AqV6ahLgpUthSanMNh35NCLujT8VP4WaJOB
 TzfiKMOsI+FNVVec43BAoXs4695uWuEcX8wL8xc+H5ON1I+5RoSxVrVVjJ0345/6yvrz
 qHeTZHlUur7hBezWFcyMTsPmZyWq0hpgZMkCjLA23VMne/NSvgER3gQfV1FVj19WPTa+
 JJnFjvncRwesbfe05C4/pD+T7KT8dcCudlXcz0lNbAA5FNQw8L3XNsH1mQzfufW57XUJ
 Qlemk7vs4+It4xeEKvd6Z8hJbutJQ/lFW9LaQXLaj+xaYHPC4w+LLimJXICFn3MylJza
 Peag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779827915; x=1780432715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7mHdUlQXGaWyFWOgTCnLIZVkxyrdDDV5OFAs1hIZcGQ=;
 b=hEn7/4SiOvNYndD6eIExVPohXv24m8Ao3eBU9YuCdfY3ZJDB6HPN38lAqS5TKwjnGE
 Qd2BSdnHeJU2qwn0kMaG/hbDdMgUKyQyG9N2ZcYCevkj8vRiRdM3lGcZKUC+R+eie+PF
 V16fOchc/Swn93fv5J/nKTBVKt+ORHvUidPVvcWayWCL+HDX8elkYgtIHSMTDOHsDZEo
 rbhhfS+/fMrnvuUhTaA+MdzVcxxfBUAonXG8W9+neTIMR7IWt8SLer+xmygJJ/eOQIlA
 ztrvZdtPm9otU195BiukWZshu/G5sWDCZw1mDv7W79SBRfOl/Lh4/ZsvisLX4wkhnvqi
 Q7aQ==
X-Gm-Message-State: AOJu0YzR/TM7k+bwmR2e4CcoKtDd7GmQjl2RCZ9NWb/bMS8JTbEyXLtT
 rt0OkUIYUb7xOkyrM46x+qdqPQMkIn95m0aMgALgkpbMyJk7iTPdk+li+LdcJ7dsygs=
X-Gm-Gg: Acq92OFvdDQDn++w36WQUYJvxlQ+G3YDCyba0nrL6NuyzaShrcCpb74ThX6NC7WIXWV
 e7TnGNlK/QmpH1v4OFt9F0UC2p2W9s5XCuHgR8XrtWJUSK8E7PXbyBGVZtngjfPtjkLNOWifo5O
 RbkrG4zeINZDMJnh4FEDhk4kVLxE0GJdb/qXjsFhQrOjdvPxMWKNUOUgwscwI/YShPEOSAjl+nW
 GnXS+P/jnSEn8j0MMoBaNWVPhPmsQzUkFdeLWaVnHV7X+FVtVWRFnwtvwpT7mD90zIrCDiJiNh0
 QrjidoJyfYI22Ogt+i5zgFHDh9SB6RerNYNzi5BFLNEqyvn7ofCTfwgmG6F3HsN188q62Y85aT1
 XwkMRAuhMViffbE11eE4pmG9x6I/z38naWzWsRjYOt2QU5ywNxJxTQLHcjeddNbx1EA+HAelJV6
 SAWWZpJRJYAUNYO+3DrWfCOmTCzTO5x2GDyAI2qNAVkwYVobDy7Soo6qOtd+TRn7Wtvg==
X-Received: by 2002:a05:600c:8b77:b0:490:5368:743 with SMTP id
 5b1f17b1804b1-49053680a94mr284980435e9.32.1779827915418; 
 Tue, 26 May 2026 13:38:35 -0700 (PDT)
Received: from m17.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49045282201sm389760375e9.8.2026.05.26.13.38.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 May 2026 13:38:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 10/17] target/arm: Use make_ccsidr(LEGACY) in 32 bit 'max'
 CPU type
Date: Tue, 26 May 2026 22:37:15 +0200
Message-ID: <20260526203722.79463-11-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526203722.79463-1-philmd@linaro.org>
References: <20260526203722.79463-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Commit 676624d757a ("target/arm/tcg: refine cache descriptions
with a wrapper") added the make_ccsidr() helper. Use it. Besides
being simpler to review, it also makes arm_max_initfn() more in
line which aarch64_a57_initfn(), which it almost duplicates.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/cpu32.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 919ed8a6cf8..cf643ce43b1 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "cpu.h"
 #include "accel/tcg/cpu-ops.h"
 #include "internals.h"
@@ -756,9 +757,12 @@ static void arm_max_initfn(Object *obj)
     SET_IDREG(isar, ID_ISAR6, 0);
     cpu->isar.reset_pmcr_el0 = 0x41013000;
     SET_IDREG(isar, CLIDR, 0x0a200023);
-    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
+    /* 32KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    /* 48KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2);
+    /* 2048KB L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 2 * MiB, 7);
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 
     aa32_max_features(cpu);
-- 
2.53.0


