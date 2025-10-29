Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273ABCCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:46:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE02-0000tF-2w; Wed, 29 Oct 2025 17:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDzz-0000qs-F0
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:46:32 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDzp-0006Pz-N1
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:46:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso3515865e9.3
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774374; x=1762379174; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DXKvVaxZH8lCY599mLKDq3KvFOHFWntba41CF+GSKak=;
 b=xZbSGafx7JqTts/stQOL/3YQYjBZPGRC8nWdY2Yiuidw2vR60ZZ42a8oKpmIPun9HE
 dTLy5Iikt3zhEQXunhMPAM0Ppv1vks9rr9pA8PYTjzwhJ/+T8TtZjKeHIezyS/K61BrG
 c2BwpPX3eZ3d0ImgFgaVKKwvR9L99eAvQvrZ3hT82cG1oJOJFcKVybz3sF6kHglj4POE
 aum0vWCMqsZIwVFhofaIn85+FAdKhHZu4pUi7Z9+uJFRcd4tpwlMQVIui4oEBs48Cvne
 0hHkI++anLDJto5swUvf+idXvpVzuL4EY8AUdHkyV2pj1x0IGXz6DLMi18CROCKuWYSN
 wt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774374; x=1762379174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DXKvVaxZH8lCY599mLKDq3KvFOHFWntba41CF+GSKak=;
 b=CX4py3TkcmsLk/SfQ88Ef9Y7Z/HgemG2NKgIngAuhbpktWIsaUyO36xIjJnzpDwxhK
 P/uT0TptHmKYOhQzkcRGkX1rv57l5+q1TNCqVODhN1qp8n/AWUWgrxQxMfCnVL9aLv6K
 TgeiTngrj6doh5fDio/fo2fGwLwnXLePwqzqIBJtRJXskwegws0f9HgyAjmEFhF1dr+g
 QD5BSWdenMQOInpnAxnvck/Rf8JKbkx+ga4sTIP1lGeUjUeOfYRFrlWcUDmQqrjGvpV2
 7JocjUGQNyoexNH3xIyYn87cWramUC4aYZfFfAWYHFXhhXkSQ+g8TQO6AqMLxDFoXIMR
 Dxuw==
X-Gm-Message-State: AOJu0YxjsOtJrenVmQXjaLStnLalSR59bGId1xlV1iRCEY9EDysDaeRs
 vIZ0JihkJ5jdXa123d2CPz//OaJ4btC3hOdedhNGvn23U0qhI71ylpjpe3XaQTaQMIG0xjfO6EI
 RjLbSoic=
X-Gm-Gg: ASbGnctuendzFuKoB4Ah99Zz5f18OrsLFujMLbTCH0cpkvlDTmwHgbaZ32IvtBlswTC
 AP8/Da9nN57khCZllQnej4m26h+w0eZkDQ8F7GEPfcpwcm1hKguguT2VH2lBv8wZZHAz7qyYbkm
 3ipXyA6JnWwQhEDbOAeB6sqKy7e+mvRuX+vKsOTS6Vlj1TDH63XNCmqhjp+oJ3kJbFQc8wIvZZt
 pVVpWZL8l6OdeGCjZONQIEd4akS/3WJ4HK0FY7pt4beNtg8k+eIzpK7wvYwp+JJIUkD9eIqfHya
 BjRBSsjhQ85r995sCJgIIscx6cjgTn0yHqjoIx9H5E0O+ChgJhx1xdphMSBFkaWJLZhiQwH0zTS
 8tnjVHjnmlCe3jDX3Rng78sZuAG/cwFd+2e50rFddCk7dcgqms1GY9xvVX0umVbMSpA5m4d+QDN
 adJfmsTa4NakbA8K+cg6msc+ttbuBtz3ZZUIl4J76DCp3pubMDPA==
X-Google-Smtp-Source: AGHT+IHe+IfTYe2xBLhwdAjDGtNPZ2WBoRFp7xzoRXkESS07W9aUm65o7uh9PPPYRjKnmkwunDUQ8w==
X-Received: by 2002:a05:6000:4301:b0:425:86c8:c4ff with SMTP id
 ffacd0b85a97d-429aef8284emr3838013f8f.22.1761774374281; 
 Wed, 29 Oct 2025 14:46:14 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b79cbsm28468721f8f.4.2025.10.29.14.46.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:46:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 06/23] config/target: Implement per-binary TargetInfo structure
 (ARM, AARCH64)
Date: Wed, 29 Oct 2025 22:39:43 +0100
Message-ID: <20251029214001.99824-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Implement the TargetInfo structure for qemu-system-arm
and qemu-system-aarch64 binaries.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021205741.57109-7-philmd@linaro.org>
---
 configs/targets/aarch64-softmmu.c | 26 ++++++++++++++++++++++++++
 configs/targets/arm-softmmu.c     | 26 ++++++++++++++++++++++++++
 configs/targets/meson.build       |  1 +
 3 files changed, 53 insertions(+)
 create mode 100644 configs/targets/aarch64-softmmu.c
 create mode 100644 configs/targets/arm-softmmu.c

diff --git a/configs/targets/aarch64-softmmu.c b/configs/targets/aarch64-softmmu.c
new file mode 100644
index 00000000000..4e1e2f64da1
--- /dev/null
+++ b/configs/targets/aarch64-softmmu.c
@@ -0,0 +1,26 @@
+/*
+ * QEMU binary/target API (qemu-system-aarch64)
+ *
+ *  Copyright (c) Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/target-info-impl.h"
+#include "hw/arm/machines-qom.h"
+#include "target/arm/cpu-qom.h"
+
+static const TargetInfo target_info_aarch64_system = {
+    .target_name = "aarch64",
+    .target_arch = SYS_EMU_TARGET_AARCH64,
+    .long_bits = 64,
+    .cpu_type = TYPE_ARM_CPU,
+    .machine_typename = TYPE_TARGET_AARCH64_MACHINE,
+    .endianness = ENDIAN_MODE_LITTLE,
+};
+
+const TargetInfo *target_info(void)
+{
+    return &target_info_aarch64_system;
+}
diff --git a/configs/targets/arm-softmmu.c b/configs/targets/arm-softmmu.c
new file mode 100644
index 00000000000..9b3fdd2854a
--- /dev/null
+++ b/configs/targets/arm-softmmu.c
@@ -0,0 +1,26 @@
+/*
+ * QEMU binary/target API (qemu-system-arm)
+ *
+ *  Copyright (c) Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/target-info-impl.h"
+#include "hw/arm/machines-qom.h"
+#include "target/arm/cpu-qom.h"
+
+static const TargetInfo target_info_arm_system = {
+    .target_name = "arm",
+    .target_arch = SYS_EMU_TARGET_ARM,
+    .long_bits = 32,
+    .cpu_type = TYPE_ARM_CPU,
+    .machine_typename = TYPE_TARGET_ARM_MACHINE,
+    .endianness = ENDIAN_MODE_LITTLE,
+};
+
+const TargetInfo *target_info(void)
+{
+    return &target_info_arm_system;
+}
diff --git a/configs/targets/meson.build b/configs/targets/meson.build
index a9f6b24ec01..cca2514eb51 100644
--- a/configs/targets/meson.build
+++ b/configs/targets/meson.build
@@ -1,4 +1,5 @@
 foreach target : [
+      'arm-softmmu', 'aarch64-softmmu',
   ]
   config_target_info += {target : files(target + '.c')}
 endforeach
-- 
2.51.0


