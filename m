Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551D8CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:41:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3sOb-0004A3-5R; Wed, 01 Oct 2025 04:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3sOY-00049g-V2
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:41:07 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3sOO-00078h-Di
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:41:06 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e501a9034so21753875e9.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759308050; x=1759912850; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+43Frybxtu37pJKEzYAVow0FhNpEXntydLCzq2hBNXA=;
 b=de5xEDp6qzoiNSl//Z8Eztkpu2k8j4t8UfGqO+vs1keS6XsihH2ItqeNiu9kXFLd3i
 GNJAKbYr4vhfp21mrwsHW8cGX3vpxduQfya5XGi9+t2JUSw1TUqz4eFzWqVG4y7X3kzT
 kfGERnGGtBy+BheXDQXQnpEF7E6s3iYU32e15yrKKX4Gj+iesIGsSOFptZPVsPgOKN08
 uIHOwhyjxNfLoXWJT0DSiO/EpVG32AHH3bR/SM81YtWKwPpgf4dUAgTypGFPas2mWUn1
 f34QAzRYosZLDt0e2Ag2A98VcYJ78g0lT3/E3gvu5BBxkIJfQ4dIw/iUovU1bVNNXPyR
 A4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759308050; x=1759912850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+43Frybxtu37pJKEzYAVow0FhNpEXntydLCzq2hBNXA=;
 b=ujGlHxRJtq9VCEpO5QGyldJg3grL/Bqp/vFBigCU++RvJFXsXgjzT+PQ3nc1lAWClO
 0TQg2W8Q3F0Ypv5PDyY6fx8jLuwGe0cn8maN49JexpH9JII1ZndzsWA6RwNYzxLOXrK+
 hFKa7GnFMF7MaCBc5bvKvTm0L8zn1SwVkzL/K0Bwfu5Z1cVTTWgB6PCRjh77dQj94vW9
 fwN7aLOI3JcZUhpWUbLp9hXEVggI9pohbmbDOmp6DS7FC3TKuXO3H5lYj1ja5Ih9KPWv
 NAup3wOHOtaOM1zOd8htIZAeIwsz8+pEDOlfuDMHB2b+EjI5cU5ANkP+vArHtFbdGFen
 LgNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2gdUawuF7Lupqw+D735nWK6xLk+ogOm61Nu3hIx2e/j0mPpG2nG2lzrq/oSX1n2YOR3XX/W8kNw==@nongnu.org
X-Gm-Message-State: AOJu0YyQa7voP26GwHRWAaF4QqFE+pB7NIzN7ggiG+1jPh8GkDWT/STW
 qIa2jhr/NulGbQwVKPuyXbVa1NF5tTIw9XP89GURLDfeIOAi0+fZH6vLJ+e49xmVtuI=
X-Gm-Gg: ASbGnctbXEWgG08axpfcHoYKdGaRodnJtNIbZBMYlnc96U/E+HOURUmx3wIlLuVy/EE
 pw+pNPsiyBpblokWMkI3RYZTWeRDBQoj16WEyRpzq1fmjyHkGVMmlWgMNqSh1HkdQF9wwuxoNua
 EXg92fycL6JAwNMchAGgRhMkjWMIOX25frVFZFXbGXRJrb8d1eluwDttOEWY3n3oSuIlaDa0p82
 wlcLh35tFIjsiCj/lb+bArKKrGDYCexg4im9GOGF9E6Kgre5cPI06S2AXmLjtZoXwJ3e4VJQCKs
 3WE+kWhbVRODHKRIPCJoxrNQUX4t3Xc6lYNB5k37EUVMdVZ0swcI7dpFIgvJsHUigvRyaczcRo4
 5MaRjODvfPN4S4ZzKiwhZdkYKv53YL6co+yQsV6Spr5BnnfIKqTmBUptvu1R58zhB2JBvGj8OG1
 1dG1x+rQMKRdPCirOJ6AiG
X-Google-Smtp-Source: AGHT+IFA2ESrvSkKsRHxIxWW3CYkosfkrh2sh8q4xToSakuURHQHsmdgbzcSCSKfXpwFQ1C4nwHN2A==
X-Received: by 2002:a5d:64e8:0:b0:3e5:190b:b04e with SMTP id
 ffacd0b85a97d-42557824eaemr1830230f8f.37.1759308049141; 
 Wed, 01 Oct 2025 01:40:49 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602df0sm26180345f8f.36.2025.10.01.01.40.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:40:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm: Remove sl_bootparam_write() and 'hw/arm/sharpsl.h'
 header
Date: Wed,  1 Oct 2025 10:40:47 +0200
Message-ID: <20251001084047.67423-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

When removing the spitz and tosa board, commit b62151489ae
("hw/arm: Remove deprecated akita, borzoi spitz, terrier,
tosa boards") removed the last calls to sl_bootparam_write().
Remove it, along with the "hw/arm/sharpsl.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS              |  1 -
 include/hw/arm/sharpsl.h | 17 ----------------
 hw/gpio/zaurus.c         | 42 ----------------------------------------
 3 files changed, 60 deletions(-)
 delete mode 100644 include/hw/arm/sharpsl.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 866b43434c7..d1060c60091 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1006,7 +1006,6 @@ S: Odd Fixes
 F: hw/arm/collie.c
 F: hw/arm/strongarm*
 F: hw/gpio/zaurus.c
-F: include/hw/arm/sharpsl.h
 F: docs/system/arm/collie.rst
 F: tests/functional/arm/test_collie.py
 
diff --git a/include/hw/arm/sharpsl.h b/include/hw/arm/sharpsl.h
deleted file mode 100644
index 1e3992fcd00..00000000000
--- a/include/hw/arm/sharpsl.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * Common declarations for the Zaurii.
- *
- * This file is licensed under the GNU GPL.
- */
-
-#ifndef QEMU_SHARPSL_H
-#define QEMU_SHARPSL_H
-
-#include "exec/hwaddr.h"
-
-/* zaurus.c */
-
-#define SL_PXA_PARAM_BASE   0xa0000a00
-void sl_bootparam_write(hwaddr ptr);
-
-#endif
diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index b8d27f59738..590ffde89d1 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -18,7 +18,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
-#include "hw/arm/sharpsl.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
@@ -265,44 +264,3 @@ static void scoop_register_types(void)
 }
 
 type_init(scoop_register_types)
-
-/* Write the bootloader parameters memory area.  */
-
-#define MAGIC_CHG(a, b, c, d)   ((d << 24) | (c << 16) | (b << 8) | a)
-
-static struct QEMU_PACKED sl_param_info {
-    uint32_t comadj_keyword;
-    int32_t comadj;
-
-    uint32_t uuid_keyword;
-    char uuid[16];
-
-    uint32_t touch_keyword;
-    int32_t touch_xp;
-    int32_t touch_yp;
-    int32_t touch_xd;
-    int32_t touch_yd;
-
-    uint32_t adadj_keyword;
-    int32_t adadj;
-
-    uint32_t phad_keyword;
-    int32_t phadadj;
-} zaurus_bootparam = {
-    .comadj_keyword     = MAGIC_CHG('C', 'M', 'A', 'D'),
-    .comadj             = 125,
-    .uuid_keyword       = MAGIC_CHG('U', 'U', 'I', 'D'),
-    .uuid               = { -1 },
-    .touch_keyword      = MAGIC_CHG('T', 'U', 'C', 'H'),
-    .touch_xp           = -1,
-    .adadj_keyword      = MAGIC_CHG('B', 'V', 'A', 'D'),
-    .adadj              = -1,
-    .phad_keyword       = MAGIC_CHG('P', 'H', 'A', 'D'),
-    .phadadj            = 0x01,
-};
-
-void sl_bootparam_write(hwaddr ptr)
-{
-    cpu_physical_memory_write(ptr, &zaurus_bootparam,
-                              sizeof(struct sl_param_info));
-}
-- 
2.51.0


