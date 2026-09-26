Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564FFC98335
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:02:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMPS-0002A2-FT; Sat, 26 Sep 2026 03:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPN-00028t-B6
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:17 -0400
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPL-0000Oy-J3
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:17 -0400
Received: by mail-dy2-x0d.google.com with SMTP id
 5a478bee46e88-34346932d93so111694eec.3
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406074; x=1791010874; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uuwRl4ClI+53kQRmwmmbWdvUO8JCv7PNWaf6z+9UVak=;
 b=m3lEff/L10dTx8JQXEl+5mG6lOIWXXyCDz0xgZ8hjAi5+JbHhYcVYxD/1oJE5nyuCX
 ir/zM0rO4OdmvLNFPVFyGIx9eSoZLOvT6ZaSB6yIoZrFPKAFnAb+htM1Afee4biIOnVD
 WMjMzaRPFyNjwxz8mxLLR8whJB5lm0mX9loHaraaXZI1w+V5LLf/f4NhzfvWQNkjzFAs
 j15mHsO1wc34euEwK+HXFvXNJTKsqFiiY4DIPY9Q61qb7YnZjpYvC6fw4bc5tkiCYz64
 qThfDtI4w2gidls9b6KeEdbsNiHtKvJLPhSKQKFgjm/BCb0s7FDQWHsdSffvf8M2MN3l
 BGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406074; x=1791010874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uuwRl4ClI+53kQRmwmmbWdvUO8JCv7PNWaf6z+9UVak=;
 b=WE4VxdOnfwRncim7Ydu9UyGhIyB9IYYh+TmheBxNsSvEY143vVS15owxd3kbX7S1w4
 6aUkGXuYQZMjq71sg+Iv9bzGZlBtZhXHAAW7wAZLxyHApebMbkj4FMT4niq1MzYepdhh
 QnNE7cQy6MPrYCIhop2rnLuGHGPigLQ4GDAp4zV+Le/1/EqAmQ88hDyEBf0ai+TLh7vX
 ZgrfyWk4y73IZw/lMV9500w4vsMu7mry6MI148VKR80bFu5/JXoY6+g1wDWE/wGesPpl
 qIcVu6jLOyJOQ6UNTyA0xSTGLkoSdbHahalvmR+qOYnzFm0/Vg4w6GR9sxLwRybxETsB
 FNyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwlsoKfOZl1Azt49VVe2gDShgMnlxZc9mf4mlXkK1JoRn+cn3ApPGE7iSDjhBJ22iW0WnCCUA5vSg==@nongnu.org
X-Gm-Message-State: AFuF++mvAO2nzBYDKpx1AyjQJr2jUCqE8kB1CIdYHuzAivIGobMrKJyp
 BJ9ntM0SffM1TeTUiucVUD99tAwwVvx2OXRI91QAtw99+sgY0jne1BLt
X-Gm-Gg: AYBFou3Nu8MeqNLd/fMk7Jwg8AiCF5Jk2fUwsw/T7TT71QTrzwGrRG5YZ7uEqxtceJ0
 dRY4ybd1uMkbamGhOY75s/h1QehfZYNmU4zl4egYU7kEwEoq20vNbBbe+7hHMhQTvVAALZkRw1q
 knLNoxHX6uAfhP24gUwRWxz+Q5X0+nhb1K942I/m/bQyVaywlS6SjIEZWCHGiwuEenxWbm1zePq
 lfKxuV5pOx62ihxjiT/ggZWWsk2DSBNNR83ZXWygwKoDVeq0OtJiyCt8+SZi5dTawOL04XwFc28
 JDPP0S8KI7ZGubnY9aQQq7mJnquXf5IVfv62vkWE7cCpA432GrvE/+zHfM27jR6izPwh97vLgnV
 eGyVsQkQEB2jh6N7/s2xznSj9dHtG9rft6BZv81hE0aPE0IbmurCWBcZkDNxpBjYLHYBWBlZSy6
 IKIvMy+ZHNP+OxMm7RLa7mb1emwWGkm6u8k4Dl9QupUe/bYrB45joQxxv2bQ+vz8oEZAaaL7i71
 xahiACaq3xWRubRshC8VgWu/LuviSo=
X-Received: by 2002:a05:7300:e11c:b0:339:85bf:dd89 with SMTP id
 5a478bee46e88-34272b3c01emr2505009eec.35.1790406073689; 
 Sat, 26 Sep 2026 00:01:13 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:01:12 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 02/55] configs/targets: remove target info definitions
Date: Sat, 26 Sep 2026 15:00:01 +0800
Message-ID: <20260926070057.1234-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Now that we remove machine_typename, we don't need to keep duplicated
file per target anymore. So we can just rely on target-info-stub.c.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 configs/targets/aarch64-softmmu.c | 25 -------------------------
 configs/targets/arm-softmmu.c     | 25 -------------------------
 configs/targets/meson.build       |  6 ------
 configs/targets/riscv32-softmmu.c | 24 ------------------------
 configs/targets/riscv64-softmmu.c | 24 ------------------------
 meson.build                       |  7 +------
 6 files changed, 1 insertion(+), 110 deletions(-)
 delete mode 100644 configs/targets/aarch64-softmmu.c
 delete mode 100644 configs/targets/arm-softmmu.c
 delete mode 100644 configs/targets/meson.build
 delete mode 100644 configs/targets/riscv32-softmmu.c
 delete mode 100644 configs/targets/riscv64-softmmu.c

diff --git a/configs/targets/aarch64-softmmu.c b/configs/targets/aarch64-softmmu.c
deleted file mode 100644
index fdebdcc3582..00000000000
--- a/configs/targets/aarch64-softmmu.c
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * QEMU binary/target API (qemu-system-aarch64)
- *
- *  Copyright (c) Linaro
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- */
-
-#include "qemu/osdep.h"
-#include "qemu/target-info-impl.h"
-#include "qemu/target-info-init.h"
-#include "target/arm/cpu-qom.h"
-#include "target/arm/cpu-param.h"
-
-static const TargetInfo target_info_aarch64_system = {
-    .target_name = "aarch64",
-    .target_arch = SYS_EMU_TARGET_AARCH64,
-    .long_bits = 64,
-    .cpu_type = TYPE_ARM_CPU,
-    .endianness = ENDIAN_MODE_LITTLE,
-    .page_bits_vary = true,
-    .page_bits_init = TARGET_PAGE_BITS_LEGACY,
-};
-
-target_info_init(target_info_aarch64_system)
diff --git a/configs/targets/arm-softmmu.c b/configs/targets/arm-softmmu.c
deleted file mode 100644
index 2b98f65a0f8..00000000000
--- a/configs/targets/arm-softmmu.c
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * QEMU binary/target API (qemu-system-arm)
- *
- *  Copyright (c) Linaro
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- */
-
-#include "qemu/osdep.h"
-#include "qemu/target-info-impl.h"
-#include "qemu/target-info-init.h"
-#include "target/arm/cpu-qom.h"
-#include "target/arm/cpu-param.h"
-
-static const TargetInfo target_info_arm_system = {
-    .target_name = "arm",
-    .target_arch = SYS_EMU_TARGET_ARM,
-    .long_bits = 32,
-    .cpu_type = TYPE_ARM_CPU,
-    .endianness = ENDIAN_MODE_LITTLE,
-    .page_bits_vary = true,
-    .page_bits_init = TARGET_PAGE_BITS_LEGACY,
-};
-
-target_info_init(target_info_arm_system)
diff --git a/configs/targets/meson.build b/configs/targets/meson.build
deleted file mode 100644
index 2ab4d27eaf5..00000000000
--- a/configs/targets/meson.build
+++ /dev/null
@@ -1,6 +0,0 @@
-foreach target : [
-      'arm-softmmu', 'aarch64-softmmu',
-      'riscv32-softmmu', 'riscv64-softmmu'
-  ]
-  config_target_info += {target : files(target + '.c')}
-endforeach
diff --git a/configs/targets/riscv32-softmmu.c b/configs/targets/riscv32-softmmu.c
deleted file mode 100644
index 0829ab84de5..00000000000
--- a/configs/targets/riscv32-softmmu.c
+++ /dev/null
@@ -1,24 +0,0 @@
-/*
- * QEMU binary/target API (qemu-system-riscv32)
- *
- *  Copyright (c) rev.ng Labs Srl.
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- */
-
-#include "qemu/osdep.h"
-#include "qemu/target-info-impl.h"
-#include "qemu/target-info-init.h"
-#include "target/riscv/cpu-qom.h"
-#include "target/riscv/cpu-param.h"
-
-static const TargetInfo target_info_riscv32_system = {
-    .target_name = "riscv32",
-    .target_arch = SYS_EMU_TARGET_RISCV32,
-    .long_bits = 32,
-    .cpu_type = TYPE_RISCV_CPU,
-    .endianness = ENDIAN_MODE_LITTLE,
-    .page_bits_init = TARGET_PAGE_BITS,
-};
-
-target_info_init(target_info_riscv32_system)
diff --git a/configs/targets/riscv64-softmmu.c b/configs/targets/riscv64-softmmu.c
deleted file mode 100644
index 553bd1f75fe..00000000000
--- a/configs/targets/riscv64-softmmu.c
+++ /dev/null
@@ -1,24 +0,0 @@
-/*
- * QEMU binary/target API (qemu-system-riscv64)
- *
- *  Copyright (c) rev.ng Labs Srl.
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- */
-
-#include "qemu/osdep.h"
-#include "qemu/target-info-impl.h"
-#include "qemu/target-info-init.h"
-#include "target/riscv/cpu-qom.h"
-#include "target/riscv/cpu-param.h"
-
-static const TargetInfo target_info_riscv64_system = {
-    .target_name = "riscv64",
-    .target_arch = SYS_EMU_TARGET_RISCV64,
-    .long_bits = 64,
-    .cpu_type = TYPE_RISCV_CPU,
-    .endianness = ENDIAN_MODE_LITTLE,
-    .page_bits_init = TARGET_PAGE_BITS,
-};
-
-target_info_init(target_info_riscv64_system)
diff --git a/meson.build b/meson.build
index cfac634cf13..732f0a885ba 100644
--- a/meson.build
+++ b/meson.build
@@ -3754,7 +3754,6 @@ subdir('dump')
 subdir('accel')
 
 subdir('backends')
-subdir('configs/targets')
 subdir('disas')
 subdir('migration')
 subdir('monitor')
@@ -4331,11 +4330,7 @@ foreach target : target_dirs
     endif
   endif
 
-  if target in config_target_info
-    arch_srcs += config_target_info[target]
-  else
-    arch_srcs += files('target-info-stub.c')
-  endif
+  arch_srcs += files('target-info-stub.c')
 
   if target_base_arch in target_arch
     t = target_arch[target_base_arch].apply(config_target, strict: false)
-- 
2.52.0.windows.1


