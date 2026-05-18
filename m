Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB7ECD4F3C
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 07:37:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOsVD-0001AM-FR; Mon, 18 May 2026 03:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wOsUX-0000hF-Ij
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:34:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wOsUR-0000W8-86
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:34:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso20714015e9.0
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 00:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779089654; x=1779694454; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJXBAMljJ3HNUiOLoOf/P1eX4evD+Y3r1ylafdPHJPw=;
 b=fVqQzWUwKvTRMHhN8e2j/jqaGAp99YtdBAHUzFXFSJEL9stWMVSTVUaBNcUCfnHue5
 jP+5DClW67TlJj9OWj15xdGnI9Evxv605k7zvnKMm2Wk/avH0qYxKnKuGXbgfd4z71WJ
 25jT+WC+ys39U3c3OR3XjXS3x3NiVAKOGkzyuwF9Rye8EOAmn0Mi5TpNplQWg3n85tUf
 hIAHaKr/FZQGjEjBp5NR/kUgSb/c5mZ2OE/Uq/wRp17bR9viRMLOGT1ZseT8ezvEaTG/
 c84TiMDjKQWJgz9wM5hrMci7D1vDP8rf0H14lZ7vlycO8VALpG+FFP7RNer/5DCnkc3n
 oCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779089654; x=1779694454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mJXBAMljJ3HNUiOLoOf/P1eX4evD+Y3r1ylafdPHJPw=;
 b=gEdLqdbgtIJaq95QlmyOmMMFU4OuVBstjlGv6v2GrF/f1nu0KLYcv0zh6sIjS670Cs
 I9YOO58fSd5pt1B0lMKzWnX5l7FrjlsBFi+EZdPoVQPgWOJwkyM9p71l51CceGvyKZEX
 yctMZa7AujwJaVrUlxHjZXoVs/6ZjlBZP1o8eTGsT2REAfKntlCG6w1y2xSHDAixIcpV
 8bpBN4llRdjj+SjWkS3k8yprxA5ug6af0P/sUdWDH1Cp4rNWyf4aNXS5VVwJde+zcQRz
 v9GNdO2PODMh2e9FNKDO8vqtHFtBBnDWYLd4c78WBHSB0BqjJ2hKJx+BgEmdiD7CCnnK
 1w4A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8AEcQlWVSVV2Q0WGHrjj50WGgX1t9vIaP3Yh1qS/6R1QQvutU3+zzoRyCzjvzLz+XfAs7Ya86bvg==@nongnu.org
X-Gm-Message-State: AOJu0YyCTaKicm4O1bJmkP8rRCSj634c87su1n4/QIvuuURNCcfPZARe
 S3xfNJ5GSXi6DBjR4NHTpMpXy6Tqph52SZKoWybsA+ZtjtFC4cTDBeFc
X-Gm-Gg: Acq92OG/JeOGBpIpH/+JMSmnlNxTezPKNyHARx0fUQ3oWvqnOmELfbctc9RfqxAKMp/
 r0TVrcaA0tU8v4JpUjq24vcUBO9ZjrTExEG5ed0HQJBfUYQeG7ncTOuX7l5U1plpYlW1xtScWyV
 ilYUH9/a0CoNE2+3vdMW+zr9uXe9peWjDs1O05tbsFt+QV8dfEaP2biQu/6ugwHNc+90t9jFPCq
 e95ddXl64JXOiJOm4/Vp/kfluxJmK7qW9VzlV6IUswb3zxOjVqrY0GjoaQUdlQT848inFOF85l/
 2W3RQnWoUs3ehUmyb2c0AJFHGu2u3yTQSfFXY7ozhkRuo0okDHz1daRsdKiIDV5jxU7LkPKyjkh
 FhxpAXwlRIefT2B9CVMfToMguue639Fff7ZLjRXMZQNaJPc8a6NY1QaQoQMsb+eecCKWXis69NR
 kOy5hZ2XEmDp55a1Z88UlRqqFqBaGv3Ai0EDB4n4Rfx05G1C3mu8FP8KMj
X-Received: by 2002:a05:600c:4fc9:b0:489:1c1f:35df with SMTP id
 5b1f17b1804b1-48fe60e58ecmr192898655e9.10.1779089653738; 
 Mon, 18 May 2026 00:34:13 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc08:b284:85e6:f7f4:1a4a:4dfe])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3b18fsm32590222f8f.11.2026.05.18.00.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 00:34:13 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Yannick Vossen <Y.Vossen@beckhoff.com>, qemu-arm@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Corvin Koehne <C.Koehne@beckhoff.com>, qemu-block@nongnu.org
Subject: [PATCH v7 10/16] hw/arm/xilinx_zynq: Split xilinx_zynq into header
 and implementation files
Date: Mon, 18 May 2026 09:33:55 +0200
Message-ID: <20260518073401.11279-11-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518073401.11279-1-corvin.koehne@gmail.com>
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: YannickV <Y.Vossen@beckhoff.com>

Create xilinx_zynq.h header file to expose ZynqMachineState and
related definitions for machine inheritance. This enables creation
of derived machines based on the Zynq platform.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xilinx_zynq.c         | 13 +------------
 include/hw/arm/xilinx_zynq.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/arm/xilinx_zynq.h

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 66a4480cc8..6c83439017 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -41,9 +41,7 @@
 #include "exec/tswap.h"
 #include "target/arm/cpu-qom.h"
 #include "qapi/visitor.h"
-
-#define TYPE_ZYNQ_MACHINE MACHINE_TYPE_NAME("xilinx-zynq-a9")
-OBJECT_DECLARE_SIMPLE_TYPE(ZynqMachineState, ZYNQ_MACHINE)
+#include "hw/arm/xilinx_zynq.h"
 
 /* board base frequency: 33.333333 MHz */
 #define PS_CLK_FREQUENCY (100 * 1000 * 1000 / 3)
@@ -87,15 +85,6 @@ static const int dma_irqs[8] = {
     0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16)), /* movt r1 ... */ \
     0xe5801000 + (addr)
 
-#define ZYNQ_MAX_CPUS 2
-
-struct ZynqMachineState {
-    MachineState parent;
-    Clock *ps_clk;
-    ARMCPU *cpu[ZYNQ_MAX_CPUS];
-    uint8_t boot_mode;
-};
-
 static void zynq_write_board_setup(ARMCPU *cpu,
                                    const struct arm_boot_info *info)
 {
diff --git a/include/hw/arm/xilinx_zynq.h b/include/hw/arm/xilinx_zynq.h
new file mode 100644
index 0000000000..cefb7789ff
--- /dev/null
+++ b/include/hw/arm/xilinx_zynq.h
@@ -0,0 +1,30 @@
+/*
+ * Xilinx Zynq Baseboard System emulation.
+ *
+ * Copyright (c) 2010 Xilinx.
+ * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.croshtwaite@petalogix.com)
+ * Copyright (c) 2012 Petalogix Pty Ltd.
+ * Written by Haibing Ma
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QEMU_ARM_ZYNQ_H
+#define QEMU_ARM_ZYNQ_H
+
+#include "target/arm/cpu-qom.h"
+#include "hw/core/qdev-clock.h"
+
+#define TYPE_ZYNQ_MACHINE MACHINE_TYPE_NAME("xilinx-zynq-a9")
+OBJECT_DECLARE_SIMPLE_TYPE(ZynqMachineState, ZYNQ_MACHINE)
+
+#define ZYNQ_MAX_CPUS 2
+
+struct ZynqMachineState {
+    MachineState parent;
+    Clock *ps_clk;
+    ARMCPU *cpu[ZYNQ_MAX_CPUS];
+    uint8_t boot_mode;
+};
+
+#endif /* QEMU_ARM_ZYNQ_H */
-- 
2.47.3


