Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C082C8303C
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 17:25:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYpXx-0003QJ-MI; Mon, 07 Jul 2025 13:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWo-0000wi-3a
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:21:18 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWk-0005DN-Jv
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:21:17 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so1852501f8f.1
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751908868; x=1752513668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tcYY49R7t8cD3E0o3RM5/WaFwIS6rVmkHsnfg7UE9No=;
 b=LWkQ5G2z3d+WQpgo5dSsYEiKEWFZ5P3IJzQVgT0iTPuyrCmcTsj3+AcPlki1FnnVUL
 kOgax440WWD2/ppqrunriHF9tGtKLP5nqHdHl6a43aUjvjOWvItxG+Jyyw+8tI3Frle7
 MpBuGObSuPwH61gHh1XPQ/QBWs1NeCohs0DSl1nEMCpY2iKl/ulqL5qYKVKvw5BJ0rNK
 po/4Vt2sYKecopa96VEe4y3F0JvUSR62yZ1puBOelvPDUlZSnbk4bAQm6/CuwkFn4GXD
 N3VcBd+RdBxVFbasoCfKgHFWmZbSrsZPNothpup5HrQqUzb6/3XAvU5c8B5tZKfBUBCg
 rSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908868; x=1752513668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tcYY49R7t8cD3E0o3RM5/WaFwIS6rVmkHsnfg7UE9No=;
 b=SzwD0VI4jBuur5KikJOuKIcdLwmx+s73QhlhjBbs9qZI6Pj0G9CiUVy0DRSFPdUfcE
 l38/1oztAW33PPbLfnH2kx6eykreHo3PN6TvT9UBibDY2N3ivbyvP1JXUAGedi2K8Pwy
 Y1aJpzmget6S/KhsHDfVeqpij36YDUJBUhmbBsYthpdsQQ6t8CThn5JvEZ6Y171lcgFh
 FXbb8v7LrWX7HaaBYjPQk4lUAT34dEt6yJcDAHyxXHpQrDRue714PcxauvqPHGACrky1
 wRwLmcBcp+jJ1OCBu3yDzSpKHkXpXoqUbwxf6UqtvbkEZqH930FTuk1TMlrV6s+8Q6AD
 zjMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmX60SC5rA1HyHoN+MxJ6nPDsEmrIRT5KVqxwBIyXdGBdXI3M9dbCZQ6S34pL7JDLTtf+d7ySHmg==@nongnu.org
X-Gm-Message-State: AOJu0YyyihQCePhGUUrhmOhgQtdGmCa4plsdwFdZZrz1O2OAMNm6JQ4P
 LEE2KGrWpQof9koLQqQMohqp4oC2/cNRDa7vfLwvruJssuyzowUvgLVQDW6yOqRo2K8=
X-Gm-Gg: ASbGnctd4lbP+WafbPh20JlsvAoDXFb3VGiqB7/5OeyOzNuAIxnrpzLMBi2uuwEuh0w
 uWqFoxJLuu+pV5PjNa1Gug7CYMB2y+NTthX3uOvR7fuVBlztveRGXsjhR7BhvcFpPSgGRA4WnfJ
 FATtCD77uNnKwlGbFKiUA9/1xN7tsrKAgzuktj1zgN+gVigzwMS3Gbi+xg5vEdueMgjRtxb7Irx
 mAog5IQj2Ref6JHiUVJ+5Nb6HiRxpxM+5uSAtAZcK1X8rGVAWGh32zcPuR64PcvrRZg/yysrqMW
 czPw+PRtEC9gBoJu8xt4J+bmAKTR0+7xhCIUFogiQ09RNXeG4CNW0hbd90cTV88r5tSKBl/GEkZ
 pa3KvrwUfZmDnWobM2bCIfwdwmV+WgGdh8jrB
X-Google-Smtp-Source: AGHT+IFnrPorS9WLSbdH7zTaU10K5+rThP1w8i6Qrfo5VMoicWjPRg/v6fPCP0B/272vnMAgO6/XoA==
X-Received: by 2002:a05:6000:1a8c:b0:3a4:dde7:ee12 with SMTP id
 ffacd0b85a97d-3b49aa86c76mr7874874f8f.53.1751908868301; 
 Mon, 07 Jul 2025 10:21:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a997b1ecsm149058215e9.11.2025.07.07.10.21.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 10:21:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH-for-10.1 v6 11/14] hw/arm: Register
 TYPE_TARGET_ARM/AARCH64_MACHINE QOM interfaces
Date: Mon,  7 Jul 2025 19:20:05 +0200
Message-ID: <20250707172009.3884-12-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

Define the TYPE_TARGET_ARM_MACHINE and TYPE_TARGET_AARCH64_MACHINE
QOM interface names to allow machines to implement them.

Register these interfaces in common code in target_info-qom.c used
by all binaries because QOM interfaces must be registered before
being checked (see next commit with the 'none' machine).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                   |  1 +
 include/hw/arm/machines-qom.h | 18 ++++++++++++++++++
 target-info-qom.c             | 24 ++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 include/hw/arm/machines-qom.h
 create mode 100644 target-info-qom.c

diff --git a/meson.build b/meson.build
index b5f74aa37a7..a6cdccd8094 100644
--- a/meson.build
+++ b/meson.build
@@ -3879,6 +3879,7 @@ common_ss.add(pagevary)
 specific_ss.add(files('page-target.c', 'page-vary-target.c'))
 
 common_ss.add(files('target-info.c'))
+system_ss.add(files('target-info-qom.c'))
 specific_ss.add(files('target-info-stub.c'))
 
 subdir('backends')
diff --git a/include/hw/arm/machines-qom.h b/include/hw/arm/machines-qom.h
new file mode 100644
index 00000000000..a17225f5f92
--- /dev/null
+++ b/include/hw/arm/machines-qom.h
@@ -0,0 +1,18 @@
+/*
+ * QOM type definitions for ARM / Aarch64 machines
+ *
+ *  Copyright (c) Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_ARM_MACHINES_QOM_H
+#define HW_ARM_MACHINES_QOM_H
+
+#define TYPE_TARGET_ARM_MACHINE \
+        "target-info-arm-machine"
+
+#define TYPE_TARGET_AARCH64_MACHINE \
+        "target-info-aarch64-machine"
+
+#endif
diff --git a/target-info-qom.c b/target-info-qom.c
new file mode 100644
index 00000000000..7fd58d24818
--- /dev/null
+++ b/target-info-qom.c
@@ -0,0 +1,24 @@
+/*
+ * QEMU binary/target API (QOM types)
+ *
+ *  Copyright (c) Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qom/object.h"
+#include "hw/arm/machines-qom.h"
+
+static const TypeInfo target_info_types[] = {
+    {
+        .name           = TYPE_TARGET_ARM_MACHINE,
+        .parent         = TYPE_INTERFACE,
+    },
+    {
+        .name           = TYPE_TARGET_AARCH64_MACHINE,
+        .parent         = TYPE_INTERFACE,
+    },
+};
+
+DEFINE_TYPES(target_info_types)
-- 
2.49.0


