Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1764CCD4F21
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:18:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIeE-0007ln-Ck; Sat, 16 May 2026 13:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIeD-0007e6-Db
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:17:57 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIeB-0008Vd-9v
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:17:57 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so4347285e9.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951873; x=1779556673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YmD4sp5440Auzy57VBkVy85eXe6fk5EYMJ3PbOMhuoY=;
 b=BM+hL2XqIl4OUOhcTxZVD3uIQ3FCo26mVOwXTa9dIcXtx2SZuZJn9MYFW/rjATrWM/
 LQ2RngKAKeUB5ZYaeBjI2fkeDG92eLipdYaYnxWpnhn1KMhqw2zHFP6oxf4JznMKNjuK
 0xsLxdnFS6FrNwXFvykGu6epytdwodVAvDcyqFbX88GFrnvj+iWdnQ7Q9EPHMCFaADtN
 ugc358KwduG4LLvag/NQbIbl6QW3gMJ4los6rlNX48pTxQSKn2zm7QtWbrAncWJOZ62W
 3/k+shHG2WcdTbDSrTTN2m9NGQVBAeA2j/lU5//mcKblES49hj1Y4ADkW6VZWdZyl14x
 cZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951873; x=1779556673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YmD4sp5440Auzy57VBkVy85eXe6fk5EYMJ3PbOMhuoY=;
 b=HY90P3X6nX1KNu2ZcPD34y9JWM3eOXqYHpLa6LPsjJJuVpAFhdx6OakbLqRdFRR1He
 d522yszGDJvkxeeIS//decorzG0bZUFt80ltKpjHPsyajsQP/229nJuvM+vtLdeHPlPh
 5J+GYUAh8BZiR8b1c/dObQy7io/WfnRpg4zyETayCCJZfs17RApkO/ssyfXSI32B/8mc
 esXzQAd98gWcgkIUxTj08WC/Us2ZjzS1Whr6JH1qnyRe4aVyD5RjxEWditz68sYtySNJ
 LvyZxjoh/npM8ag4iwkrQDbuYCXkHggk9u8w4M9NvjBK4y8xXQ5QIYjH/imvw3lUFj2U
 9Fxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/DbYQ8vvth6GsnuzET0yLLey6XXB0wZ0/aDL5fWiJNuwGCTB3mBUzK4zOJD7TWc7mIQhwCTZ50hw==@nongnu.org
X-Gm-Message-State: AOJu0YwkG1l6Xmd+DaqeeUqHjMbIh10RHFJcjrLG0U61/k2VMn2rxWc5
 IaD7HKEbtyr0kJLc9ST8vbYcsDk/mCp8JTWDtnoszGDDgy69DukabpaOr8lfGtjLk9Y=
X-Gm-Gg: Acq92OHfT5m0ga6SwZ6CNaffDn7ERmpHhytqIbcsCjwnrLob0bR5hj/FVwPgUq76jpM
 uKWn2ZPtQ79A9gSCKd+lWKwUB4euHYSQrqqT5CrjnouvTUpulE1lSGwf/zULhEIpWkwa1vE4N3Y
 NhKmFKvpARk05I4oiCNDYpSlCBsvdRWoPTrSa4UQk6FG7vwF3tAsiQobHRbM092YCywVU7cZYyD
 PB1HcHN0NkoF7Elvw28FWBQ64OA1xbMiiU0LhzmgXu2Q2l8xHs8ZAxXUKyZcFp+JqKG0VwfZlKJ
 Eb9wymv+zkIMUS02qjPLXXdST/K1DeW83RFYhCRDvfb++zI634CUcGJyS5uw5L0Lwu6ghqaV35g
 9zOSpfOuLe167uOam2T+ZSW3LUrL9Zb0xabJfzAsSHl12DXK2gP4KcrpTL+mOQYHQ1SUXLSk4mU
 J6L98cv/lLXMpyWuM2JEz/mplFCuGgTmCajo83E2BLn3j6USMj0P/EQhSwFF1bnPayQi0dHRRT
X-Received: by 2002:a05:600c:3541:b0:48e:75fd:9f9e with SMTP id
 5b1f17b1804b1-48fe63264ebmr107714465e9.20.1778951873441; 
 Sat, 16 May 2026 10:17:53 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767d16sm24468445f8f.6.2026.05.16.10.17.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:17:52 -0700 (PDT)
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
Subject: [PATCH v7 20/21] target/arm: Build cpu32-system.o as common object
Date: Sat, 16 May 2026 19:15:22 +0200
Message-ID: <20260516171524.19184-21-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

cpu32.c only contains CPU types used in 32-bit system emulation:
rename it as cpu32-system.c; always compile the file but only
register the QOM types for the 32-bit binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/tcg/{cpu32.c => cpu32-system.c} | 10 +---------
 target/arm/tcg/meson.build                 |  5 +----
 2 files changed, 2 insertions(+), 13 deletions(-)
 rename target/arm/tcg/{cpu32.c => cpu32-system.c} (99%)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32-system.c
similarity index 99%
rename from target/arm/tcg/cpu32.c
rename to target/arm/tcg/cpu32-system.c
index 8220d785f5b..6e983900899 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32-system.c
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM TCG-only CPUs.
+ * QEMU ARM TCG-only CPUs (not needed for the AArch64 linux-user build)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -13,15 +13,9 @@
 #include "cpu.h"
 #include "accel/tcg/cpu-ops.h"
 #include "internals.h"
-#if !defined(CONFIG_USER_ONLY)
 #include "hw/core/boards.h"
-#endif
 #include "cpregs.h"
 
-
-/* CPU models. These are not needed for the AArch64 linux-user build. */
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-
 static void arm926_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -746,5 +740,3 @@ static void arm_tcg_cpu_register_types(void)
 }
 
 type_init(arm_tcg_cpu_register_types)
-
-#endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 97d31b7515e..2d08fccef12 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,10 +30,6 @@ translate32_d = [
 arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64)
 arm_stubs_ss.add(files('stubs32.c'))
 
-arm_ss.add(files(
-  'cpu32.c',
-))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'gengvec64.c',
   'translate-a64.c',
@@ -84,6 +80,7 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
 
 arm_common_system_ss.add(files(
   'cpregs-at.c',
+  'cpu32-system.c',
   'gicv5-cpuif.c',
   'psci.c',
   'tlb_helper.c',
-- 
2.53.0


