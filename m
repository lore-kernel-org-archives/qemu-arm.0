Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B8ACCD1AA
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 20:58:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBJQh-000062-IK; Tue, 21 Oct 2025 16:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJQf-00004t-BV
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 16:58:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJQc-0002Hi-S6
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 16:58:00 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47109187c32so28865925e9.2
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 13:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761080277; x=1761685077; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2lrAQwDz95GQqXWTWVIMmW6B1FdErbGMCTqSMKZ+Gno=;
 b=nlJ0fcLUs4f9Os92Z+m/qZ6XMJCFB2G9Cz+e7FVjBPL7sWZfiB7VNNm+Xvm2NBWE1F
 qYE5NM7opOjfHRxbnS845nyoa6mUUVEhy4sxTQhsYuiCJBnHno+0lIxuvNntxne44nT1
 DVXLv1oTlNZv4C9oXJ2Klm53RJgZwWkjCAm5VsEQmUPuVo9Jcwq2aCENozgCHi2frS8U
 mcEH3WgFLeSM5oPaYBfEFNwrw4Zr12LOTCkbxO1hIwo8mdfDyeHUg9niloggkoXg+vcQ
 pxLSmfwTm9hf1++a2RIe8Ky+v7WENRgi3Cy3fVY2yQsX+KYGYhSYsJwpsa8gFvocBjHw
 pRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761080277; x=1761685077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2lrAQwDz95GQqXWTWVIMmW6B1FdErbGMCTqSMKZ+Gno=;
 b=P/F4kQj/5EolqCdCjqJ6JX1pfEBXbqixdvJ6q1qmQND4Od8h+nT/i9XDYMTMs1ULdW
 XEiacvzUBnF/k+syKcvwcvWtEq5CB6iHWk53oeth5UCmsJtjnqX6oMinqz+Mf2pO1hIQ
 vHvi2Y2MaVkKQxzzo1P9YneeJNhpgWnV4gCHLWzjObpv3o4WVafklsgd8uyZPnYmv7EG
 BgjYCdHfvXsg+EwsY+TVd8tLr25k05KdhZMVRVTY31rCyl+wJHgFHdMD+M5GafL+9lZI
 SgEGs8TUGNRSjAIGiwCp6LQWo48GuZqepPiKYTLm2qt67zlbPfLFH4D27Adc0qFduwGD
 bafg==
X-Gm-Message-State: AOJu0YwiNkgZWtJBBDykfd7cV9IXIsu3RfFILnleynOypK2cDNa6wpy/
 gfT8FCY/0wiozi0raev+D5lp1vZfkC4Uqfv5prMMn2LKlkxaaYjkdXRdoj8K+7SJ0xs=
X-Gm-Gg: ASbGncsy2nwBlWi/TDg1mbb/pgnjnpindgx60k79CvACYeWLBaUi+iPhCVpIuAWA+GU
 ucKBQbh8Mv9kroLofpvSR7MHnF9ZBSGcMAaFBmvUn7x4jTTqy9P2GJWT+baIRWYRM38BsSJsGXA
 t+6At1dp8awIdmqg8PTLTJ3q1OAzV0YYq+sEAQUgOQqADVcAnqLXIPpX4EzkumSJTTw+NRA2r4+
 yXz9Y3H8EYBuIxk9QPVdVNetY6lIAW/7pWcH7C5WEVvarggan2GOCkYo2d7yAJNfjaqnGd//f0e
 6sQdTXcgbjb4IzxqcX7BgQBNX2X08WNCfN9gzKwzYwQbKI0tCTxSAswDsQzMU7eInFawq7Xwyk5
 CJXbIYMZrbjkHorNTTgz4ptL4LtNzRddwqWIHE7m6iB+M2+ofAADkNY6F1nR0v/YBNo1mXY7Okj
 DMi7Wo7uAfNV/9oxYAFlnssHi8wXpDoJP/yulKv8TlTW08Du29j/9RDRVCOVvF
X-Google-Smtp-Source: AGHT+IHfivURQppPOG7xVw+QeOgPzHJEUKQhL+nIqhbGD9J70obPcLW+g002F0nv/0oD1+boAXl82Q==
X-Received: by 2002:a05:6000:290d:b0:427:9d7:86f9 with SMTP id
 ffacd0b85a97d-42709d787bemr11572592f8f.47.1761080276883; 
 Tue, 21 Oct 2025 13:57:56 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5a1505sm22127964f8f.8.2025.10.21.13.57.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 13:57:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc.michel@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v7 01/19] hw/arm: Register TYPE_TARGET_ARM/AARCH64_MACHINE QOM
 interfaces
Date: Tue, 21 Oct 2025 22:57:22 +0200
Message-ID: <20251021205741.57109-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021205741.57109-1-philmd@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
index c5710a6a47c..f4ac0a6e95b 100644
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


