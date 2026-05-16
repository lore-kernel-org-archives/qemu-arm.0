Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B558ACD4F21
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:17:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIdW-0004Y4-EY; Sat, 16 May 2026 13:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIdV-0004Mh-33
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:17:13 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIdT-0008Jy-Bb
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:17:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-44a74032ff8so526997f8f.1
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951830; x=1779556630; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HVBWmui2gRqhhcBVAajrDH3fSaJghOrYunK4qpZkBCg=;
 b=PAalJzhY6kKgozaAaFt8d4/Z8h97vNJgrmDcJoCG9hMVfsq1gEiPa3BKNrBGyqoFFj
 UjKsRP6PJwwq46C3/ouW0KVuwiCZM3lHg/GxTXdPi1TsNYevo2wlY3OVexRF6xHiDpAr
 AoNJgo9zd52SMxU8jPqr9ykgOfenQJtE1PtVfwGnwfhsZn6mn5FCFs8pJtM3q/c0Vl6F
 Fj72Nn9Rwdt9Qmmj/dCXikq+3Xw1YpRQ04H+HX2fufdMOy+y0aYJsE6ioHxKlqkXklYV
 SQgeA+1Lcrx+foWWeRbbpGOLkXuAw18CPdACWW2I4Ft2QjojgblXKMmr4WhFg5JcG2ix
 7E/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951830; x=1779556630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HVBWmui2gRqhhcBVAajrDH3fSaJghOrYunK4qpZkBCg=;
 b=mWTkXu7uvocfs46WGNpPLnT2K5ukJJQSrMnFuHOn2m3Ocs4G4ZM+8fBJCps3E26cbz
 kE+74EXI5DW2QyNMZgcDzjY5qAD3zg5stTH4mlSvJKAXr471J3xjJpoSB5qGPySyFmE9
 4UF3RdkL4WrpAFbzPSiw3mnvzl2XBHTJs+AS7c5DfF1Osh8fD7pJx7dO/ulGhJ3veSjn
 Kybt+WJ37stFzbiegNbCbNe1uPzUKb5AaqhcQYrxYA5HvSJcIchps92WttWbEM//VpDU
 ZgadKu1N2ADlSSJTtb3ahadb7NtODYwSsn7+g01r81L4IbqUAkr8L/8Fuwf+LMDJReJQ
 X4kg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8I+3u/dAXm/4fAnKh96rE8GgeAfpC1+7PGfGSO/A2PVftj5fSYQZ/NM8zTyTUdPmxC+50W1AzRlw==@nongnu.org
X-Gm-Message-State: AOJu0YyDQNEnS2PfEtG9bVatQzn2NP8H7/48M96QCBhUgzekns6E/yNQ
 sQ8MZiVETfETJSyHhLn4TLFInahEI8Bu7K9P1OzWhL/l3T89RL9T3AGbKqQLpWzWNik=
X-Gm-Gg: Acq92OG+nO2ACMG/2UAYxaqVHzT4gxOSVVVoNmBV6BoxsQ8cUJ+O7vxvXpKbWRSVrAL
 pTA+AmXCVQ5xiwB+N8EH7J/5IYRB9+rDY11NtzbJ5Gu6S4aluu1yvlhdL313Gt5peBKQ4VFUctu
 aVvugmji9I5diNocFyIEI1AvbVIl095nQQlW3wnyTtZdwdzwjLaEm2PorPJgkR2JzgOkJ4EM17S
 t3Mx9IUtlEVHyMwCx39Gq65FYNnCEbn32zwRR9K6h2liDv9bwx4+hhwaSLpK792E6NaOkQijdG6
 MSWugouv7T2d6fqWOHRZvumPFo7LOe2Dy6ix0kxXEkL6reGQ5NIqpB6glAmoH/nJAZqoOEjxyEM
 dX67isTLvOyilN2zcBwu+4NdAVCT+QjUQNMnZDP8dRUBLMt5u2tiPDrSe0L2vWSYXz4nVfppube
 mnJ7E1Li/WUdCIozn2bT/7E8ZEcUIa1kSbT1MNVMN90264t+MYziw5TMrRmd9H/Zva5kqEmVhe
X-Received: by 2002:a05:6000:4007:b0:441:1e8e:d8fd with SMTP id
 ffacd0b85a97d-45e5c5ccbebmr12960261f8f.29.1778951829790; 
 Sat, 16 May 2026 10:17:09 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a17ec2sm21342752f8f.24.2026.05.16.10.17.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:17:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v7 14/21] target/arm: Use make_ccsidr(LEGACY) in 32 bit 'max'
 CPU type
Date: Sat, 16 May 2026 19:15:16 +0200
Message-ID: <20260516171524.19184-15-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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


