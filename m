Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F858CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:18:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtGy-0007C7-DB; Fri, 15 May 2026 10:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtGw-000728-Cw
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:12:14 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtGu-0004En-I4
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:12:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488d2079582so92964725e9.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854331; x=1779459131; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZ8fiEyIcsczQEDgRlwFz4p9FVMl4Ln4nKLkoMyRd58=;
 b=hRjz0wlF7AaLk8Eu42GKYOysnjTFWqg3yYf/SB3AoP/CkMjr87BMM80jeIqM9JmAuY
 ed5v9pDEv3jAMJMXG/JKN2WhHvao4JXH1boUN/v8p2t802ACFI+ksldZcEBcq0ZWKwIc
 rcN7gV8Rmlwue5gzHALSrsGigtTRQ/0gW4Ql7lV34TBnLU/O2V7css9Y5Cd1Ku6AdME/
 Xh6aEaRaXB5IPGsE/5xfi+9JczECmc/2Q2ITMTVvat5r3d+jM2XM+4ihKvXjS8CB1qJF
 oHIJJsmjGEx287HFJfl5ZaSavHEZXKi2D/eLzbsCRDE7NQt+YXLMX5qtZqVWTbjUWacz
 b5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854331; x=1779459131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hZ8fiEyIcsczQEDgRlwFz4p9FVMl4Ln4nKLkoMyRd58=;
 b=BxIWhkZbFAqW5NHY27vpDcAeJOcsvO66E7eCHvo9gDKlq8UJeB/oBLHd40xemdgDUp
 ykTJm8lZejF9YfcrXf6I8ryMqqbt4dJ91z3y/mqX2g2fJOhqG37KLi2kwKo6nMvBmD7p
 joHg+ZYJ69xzL0aESX7LobaRuEhmLm/hE5GhyJoFpHqbGWqjR1CfrN0+X9Dsk1ktc8fd
 Tr7vG9hjacl9HZcP1AvNvnjOc2Ropm62ZVHRXy9CajxmTqQHqMPsaxlJap6C0ZiF7eyY
 y4tHf/OBXtZ4aBI7hz/9EBDXtmgOOAo+q3weZ9W3VvSEvnrcd9nyD4Du6qkyZr564eEk
 L+QQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/wShIdW3mJpF5SMc0b+/83VRy0yu8CmXSbk5G6SUSOjcUy5d0REOG36bZWWrZ3iEr+xGRWiru4og==@nongnu.org
X-Gm-Message-State: AOJu0YzWqSrDxXOXdRnZGlUMou/CHc/61feJJSbnTglDIHfAFHJs18Hn
 28v6YjSI/i65IQjAogp+eMW1o6C2AdHHsJRnY/LIeuF0Ee9ym9wUtznU/8EZ3LH1zYxmPKHI9ej
 5/r1A5DI=
X-Gm-Gg: Acq92OF1UY6KGfarVMhKwUiHzLZNw0Gl4JdL+Gsh2TadtZI4AxN8KMjZHW2ciGcYLF+
 OzLw9WG1XVMmUQfHbEdkbfFVjcTtazeyOkMO+FE35G7AyuL4/T06hFtUpIM/lCi1iP6RW9IyClu
 48xXTzvqwVYUdyDWHDJcs7QWgofRuY4QV8aYdbGL2+vTOWZS3If5zwHcANqI/0SNvCZS1MWAmDi
 5fzcXmjbE5lGFM3Ca5y8IqcJUtkV3s5pCJD6G0phFqZz7hYhlpYbOj41uRyt1JXPC43AKrCQJbQ
 lNp2upHERT7/cT5jQtXXMUbOPWup4mRSVWvujcksP5GlupQBGa0CtoEKzpGvk0fYqsaHqVqNxzH
 +FRCMF4ctAwcDeagL5N8KnFbeQYh8pZNKnQEE/XCJ6qjwzK64O+H9nYkxLTkjMyayX0atV/6Edo
 FayCsh2jtGFPiLFvQ9HK8aVdU0R8HUi8tCApYX4wc18vwMJbXl5MVH+pQF/3BtbzF1z5QcJM84Q
 1HqT6F2cSM=
X-Received: by 2002:a05:600c:48a8:b0:48f:e230:d5ab with SMTP id
 5b1f17b1804b1-48fe651e11cmr35164875e9.31.1778854330979; 
 Fri, 15 May 2026 07:12:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5376812sm67877445e9.11.2026.05.15.07.12.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:12:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 13/20] target/arm: Use make_ccsidr(LEGACY) in 32 bit 'max'
 CPU type
Date: Fri, 15 May 2026 16:10:24 +0200
Message-ID: <20260515141032.3271-14-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
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


