Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD747CD4F39
	for <qemu-arm@archiver.kernel.org>; Wed, 13 May 2026 10:59:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wN7J4-0006jH-Cb; Wed, 13 May 2026 06:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wN7Fg-0003BR-Jx
 for qemu-arm@nongnu.org; Wed, 13 May 2026 06:55:47 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wN7Fd-0001Sq-5d
 for qemu-arm@nongnu.org; Wed, 13 May 2026 06:55:44 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488ad135063so53337235e9.0
 for <qemu-arm@nongnu.org>; Wed, 13 May 2026 03:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778669736; x=1779274536; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31uAyBAt0YBaO7HX9hDUa25jYs4P+S8BQjl4K/ghWPQ=;
 b=Uzvgmd58fkca9X8Xx8YWmnr53zy3pXKP8v+Oxt91a57ZYlZqPrIboAzKxbsMJOCQ6Y
 o0B8WC659QVkLjCx3d1yMWpy9AK6yFsGpNRnWAUZtu2Ij93u3/q4UN7o8ewZW58RTRbm
 xaBubAbmhyTmPDpfkluiixfLZ3pJYRqphrywBXSLPAMsaDRAWTs0858HoJKrEI5rUNwY
 Kn57S1YLRg5dE3WrtqawSOn09AqCHwBHnnF8KdM8u2007amVWiIYAls9zVPLUaN9EjlY
 9H5NG1rltPzzWraovSo8djnKO5UKcjaA1PU/D3+qrj9dOjHNFbyHvlfyRhCDyPx8KxUx
 Te8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778669736; x=1779274536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=31uAyBAt0YBaO7HX9hDUa25jYs4P+S8BQjl4K/ghWPQ=;
 b=eSr2K661Ui+cp40xEnbTYa+ErhdVMMMWvRvpUM3HHXSI7rFG6rFzTRfWYLCwoDjlug
 YDjcqhAZxIbHx1S+w6HF4doEZL2knpqS6ZdQjEAWMnvRu1Lf+GgWnoRXAzfdN4zFHbPO
 MZ0D3yyGk4oSFg25+mZpx2bfYwINFr07ML+X8CCkzhjdoOxKkQZ364fdWrt+OMd/mPH8
 ZjYG3VLGdWuqdpDe3YxR7/EQRjRauzJ6+ok12tXeroI3kMewZu0jft1Vo+xzDB0GKQg5
 hTZnipjHzUTlK5pXxy6AJm9myDef98+JpEaWvNt8Iyl+Vwg1LM43n79v8jddhtVDuhqA
 QscQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ruwtJsoHr0MP06OSv7ny1PAoelXXYbwxnvRDlWckFSZitdgEJL9DC9KlO3GVfkbcHi2o68rQkAQ==@nongnu.org
X-Gm-Message-State: AOJu0YwZ5rGPS44fDwX950sGCcdIr8To55Z6Zeos9gf8wmq9Np9ILc/O
 iHzFB2H60AVnHRM1bh+Y++i/cseRu5Zh4mCZPqD8n/8RQYBrnzM6X2Li
X-Gm-Gg: Acq92OE40Tml8lxiNy8SZdIPEFi7Y4bA/gYvAAvI8SkbzHmZH/q02lKfGFb+iUwRUzT
 pjYj5l2a5CLzAJbSanKwz/SlrhDbF45hm1vfxAZ0CX04wPyfwIcPdY5V2vG6yI6ef0ID/TAhdvV
 Z2U96Zv1VKBk0QlTXUe5OFMaYkTdkif1F4WSX0LYJbPAAQeg+rrvH9nMDt9QrDdX/wQJJadBK2J
 K+yEShZtrb+jXKx0PVswtjAW1/SjYVXyl1UjHMo1D6GH9SnV35wD2IL0YFoBo8wIy+tI85MFAvV
 SJHBokhfY5sriQqdFyR7aJoSwbmR7vbJxajmGlCN4n4obNNMJEpcMYXWYhGqWO9qAFdu8orJyDV
 j8lrUDR/R5TXDq3fzh/1h9tvyGcci8g2CptSEQp4I4qn9bH6owMLvAgBSyplQqVEwWQuxfs+Ljv
 B5i4QFEg3kdgjssIQJegvS3LoA7lbAfRNIQGaebbmdwxfY
X-Received: by 2002:a05:600c:3144:b0:48e:82af:d9 with SMTP id
 5b1f17b1804b1-48fcea18dfbmr31076885e9.29.1778669736002; 
 Wed, 13 May 2026 03:55:36 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.196])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f410d9fsm56062295e9.6.2026.05.13.03.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:55:35 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 YannickV <Y.Vossen@beckhoff.com>
Subject: [PATCH v6 12/15] hw/arm/xilinx_zynq: Split xilinx_zynq into header
 and implementation files
Date: Wed, 13 May 2026 12:55:14 +0200
Message-ID: <20260513105517.146706-13-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513105517.146706-1-corvin.koehne@gmail.com>
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wm1-x32b.google.com
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
---
 hw/arm/xilinx_zynq.c         | 13 +------------
 include/hw/arm/xilinx_zynq.h | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 12 deletions(-)
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
index 0000000000..0337d238ea
--- /dev/null
+++ b/include/hw/arm/xilinx_zynq.h
@@ -0,0 +1,36 @@
+/*
+ * Xilinx Zynq Baseboard System emulation.
+ *
+ * Copyright (c) 2010 Xilinx.
+ * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.croshtwaite@petalogix.com)
+ * Copyright (c) 2012 Petalogix Pty Ltd.
+ * Written by Haibing Ma
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
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


