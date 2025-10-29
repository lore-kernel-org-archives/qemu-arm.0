Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AEECCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:41:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEDv8-0005Pp-H1; Wed, 29 Oct 2025 17:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDv6-0005P9-Vm
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:41:29 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDuw-0005m8-B2
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:41:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so3570515e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774065; x=1762378865; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vMg20FGEN3XAffg6y9kZVfeDy5BlDMnMkEI0JSirbJQ=;
 b=VBmOQtfoAkGv+DxrYOXCW1hOpPwEWcT9cqXpsiaeQLZWANtGu2570ANJWg6lv7tQeK
 PDStrPGqf0PQT5mQj79DBkM1teTaQubK9ngxiD4PTyHzZjT5ycBgrMtJYdzDv89/SOwA
 c2fmCPVySab4zSCzk2nm+R5N1HGPGhA9Wfj0c5QsWJVjzIoeJdgms020S+n1fWviqqAP
 u8r7jG3e3dBayrIh0PeK1T7Ju2ybKsdBj+owyBBxdstzg1LYFiyq7vKx9UUyhhQuA8pg
 rg5yvDQzq98rH77sMN7lnxhKMOrtflNiMiNfxFNVGK/X8P0RdPaAxAyQgQamQizuq7YY
 5BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774065; x=1762378865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vMg20FGEN3XAffg6y9kZVfeDy5BlDMnMkEI0JSirbJQ=;
 b=W//mtPapWT55/zkqSFT+OMb47hUBc+F4Mcw58UIfLn9b/33aTDCqpPdDWxZGzeqeuP
 iMuLjbu51AatD7MXXB6kRjpsoZNmZ9yrbtek4o49lh9VJVpT3qahGITDFPzO/3a9DWS7
 HLCvbBIXENGa9FeLw19SWlNAA+GLprW1SefM4vyeoI9zfkMd4CTnN69DvwwSqu6Bxb7t
 AGUGeyptwVZH4jWkJpSSc86jhXTfX84GbWuDVP84tY1ZTOhmYWNAaEf8k/1nB/34xXN5
 KXf33r5CWNVfrkYp3pOchS8Mjl2/bnPXae8bnrCgFMqBCagntVcBCMIuCssvVrQ66K2C
 TAfg==
X-Gm-Message-State: AOJu0YxVYhHQbY+dfjRYgueGNDwW3hL2LNpsP+eN+eGdhoaujHsgDCA+
 CN8qzU8H95hS/T9Lht80AHajdsHZvQrmTk/YtmFk84I8fL2+76gOs4BaDv32OaboQk0=
X-Gm-Gg: ASbGnctKFbxKJWTUUKH7AaxQNNW5aPpklgSEyNlBaJg8Vwp+YdjDANlmTcZ3SMeODxm
 LyG9LPOPGvyqIidDVnVEbT0x4Vl839IKVChATkdyDn6auwzAXo41LV5mMOuQw1iU4Oe2qSxYpE8
 aGC8VvyYo3lKXFB6VH+eL1i+8ScFB1d7DOOobn0yQYJuBUQFWvQm5+Kpw/d6xK9tJ1CCuCbzjnI
 6AXgKviplNF4/Rz7SyOttq2IqyZ73gmfslVbr41uCeu72502DP94EWmKc5b5Fj4uzl964iup/Bs
 CSRMCdyN5iBbA80V89s7mz12INmyM0dzAPap+44sRCoqZalJ00toz6NT29ZTk/4t4cSB/E0jXDE
 cHE1y0HTophKRldYQ8XuOVya1RzQ4o0JMmPO4ut2ciK6JgPujnOaVbFTNASUvg6uYnYlInF3Uzr
 xEOmcbWY6TsFx0J5501k9GYv5Jinit8XrWLTg/1xNXe4Pw9LKPrA==
X-Google-Smtp-Source: AGHT+IE7Lu3fGHzxbo/6N5YEa9X70DPvJIqq2b1ZhV/fEfuhXaleik+8opbS0kP8kIN8QkTDkqgGNQ==
X-Received: by 2002:a05:600c:608b:b0:475:de12:d3b2 with SMTP id
 5b1f17b1804b1-4771e1f1dc2mr44058035e9.36.1761774064708; 
 Wed, 29 Oct 2025 14:41:04 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772899fdfbsm4184555e9.4.2025.10.29.14.41.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:41:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 01/23] hw/arm: Register TYPE_TARGET_ARM/AARCH64_MACHINE QOM
 interfaces
Date: Wed, 29 Oct 2025 22:39:38 +0100
Message-ID: <20251029214001.99824-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021205741.57109-2-philmd@linaro.org>
---
 meson.build                   |  1 +
 include/hw/arm/machines-qom.h | 18 ++++++++++++++++++
 target-info-qom.c             | 24 ++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 include/hw/arm/machines-qom.h
 create mode 100644 target-info-qom.c

diff --git a/meson.build b/meson.build
index 8ad37c992b1..de95da32699 100644
--- a/meson.build
+++ b/meson.build
@@ -3911,6 +3911,7 @@ common_ss.add(pagevary)
 specific_ss.add(files('page-vary-target.c'))
 
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
2.51.0


