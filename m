Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94D6CA5FC5
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 19:26:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBzwO-0004OV-Nt; Wed, 30 Sep 2026 15:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominic.plunkett@gmail.com>)
 id 1xBzOy-0000pr-CK
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 14:51:36 -0400
Received: from mail-wr2-f35.google.com ([74.125.225.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dominic.plunkett@gmail.com>)
 id 1xBzOu-00080z-8T
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 14:51:36 -0400
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-48b0591cf85so231553f8f.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 11:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790794289; x=1791399089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=r7i1IrT64o/7fZxNRm4nqi6zq1D/+yliH52iOpwnxDA=;
 b=QTTGbayQ1VRTFDcAxT03E5qE6Om2ZHf+H4+I6biNyB3or8n5wh8fdCQFL0WPvhH+Io
 uHlTWZpoSOJwtS+VmiB6EvO4bQoVeLsKZnGxizJ0kjJJAB4vqESlG4Q7DyVktMVjlFrK
 jli7sjC18nXXJS6Zg9Ix05TuO9p0l9PcIoKxIm+Oaz26RcwjMdt2fz4GBA1yBkBPuHRq
 2CuSnvIUdJSrNke+OJnES830krLNlGMVmhSHs9PtNBf45uMNpZyr9NIuEnrbUPwRTxTU
 feKUSVIRmQqumUQ2poPhFUVi88SWJc1FncwtNeyJ4ITpnIHlcW39NOECW9XOolwsa0Ms
 6SMw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxynA/lFr8kBLADLPYQOPDCVqksE8Ss5XGTapYTFkxiwQrBQBa9UUTLzPAwDqRebnO/R26o8RY9XA==@nongnu.org
X-Gm-Message-State: AFq9FYJpF9di9AmOAeO0S4UwylVaSLsT8TD4zhlE/JPd9DyOhKH5adNy
 TXjUw+fa/la0rUFcYSKsbSmVXJB8DGUqs1zJ2RfC6DxiHDXSU0ZADt9H
X-Gm-Gg: AYBFou1iBN+BUQJtIhMJj7V/c1J0ozD9hfkpzLUmZqttuWUsYglGeLCxPtmVb7O/1U5
 Yl8E6VbKvoLNs9mWUj0fR3uvnc3X3FqAkW/GUYK6GWZ2Af8x3eBBvp2IL0iJxNx6jlkcki1qN6T
 uL7Q8pr96/oYZTSKoe0PPF5z1bs5DE1uuKLagB3OlLc+reeyKBHARPW5DM/Qf3B2XTURWn/0I9a
 t3cODO9FwL3fbA0IhjvFR03ZJ+0w/OEdjnpHZobvs+iO7ralxIDlq0aftbA6eI3p8rDpa5L7fIr
 wWJNzBpBhJ6iZjKh1amK4mhfdgAgb4TqFRbAUnRfu5yyyDxUXNRje7QRVHHxmURKCWR9wrc9yRK
 tRmZkltEhGdPfoXlzTh/X7J0XQwSyHkLIBBJuRW9auI2BMdP/Dbn97vDyUHMlXfYcowHMB0UrmE
 ek9LC5KeDemRzYWqV2zZ+nQ9uknUdBGKTiPykHW47LF2tAUSNllkA7LaM=
X-Received: by 2002:a5d:5e84:0:b0:48a:f11a:c34a with SMTP id
 ffacd0b85a97d-48b02579290mr4487724f8f.52.1790794289597; 
 Wed, 30 Sep 2026 11:51:29 -0700 (PDT)
Received: from tower ([185.182.52.52]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068ff96dsm1162790f8f.8.2026.09.30.11.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 11:51:29 -0700 (PDT)
From: Dominic P <gcc@gcc.dp11.uk>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-arm@nongnu.org
Subject: [PATCH 2/3] tests/tcg: Add tests for sign extension after rotate
Date: Wed, 30 Sep 2026 19:51:23 +0100
Message-ID: <20260930185124.3036980-3-gcc@gcc.dp11.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930185124.3036980-1-gcc@gcc.dp11.uk>
References: <20260930185124.3036980-1-gcc@gcc.dp11.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=74.125.225.99;
 envelope-from=dominic.plunkett@gmail.com; helo=mail-wr2-f35.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_MSPIKE_H2=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Sep 2026 15:26:08 -0400
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

Cover the rotr_i32 (ARM ror) and rotl_i32 (i386 roll) forms fixed by
the previous patch.  Both tests fail without it.

Assisted-by: Claude Opus 5 (Anthropic)
Signed-off-by: Dominic P <gcc@gcc.dp11.uk>
---
 tests/tcg/arm/meson.build          |  1 +
 tests/tcg/arm/test-arm-opt-ror.c   | 21 +++++++++++++++++++++
 tests/tcg/i386/meson.build         |  1 +
 tests/tcg/i386/test-i386-opt-rol.c | 21 +++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 tests/tcg/arm/test-arm-opt-ror.c
 create mode 100644 tests/tcg/i386/test-i386-opt-rol.c

diff --git a/tests/tcg/arm/meson.build b/tests/tcg/arm/meson.build
index 8f70411dfd..fd82b5c7a6 100644
--- a/tests/tcg/arm/meson.build
+++ b/tests/tcg/arm/meson.build
@@ -39,6 +39,7 @@ tests += {
   },
   'pcalign-a32.c': {'cflags': ['-marm']},
   'issue4448.c': {},
+  'test-arm-opt-ror.c': {'cflags': ['-marm']},
 }
 
 # Vector SHA1
diff --git a/tests/tcg/arm/test-arm-opt-ror.c b/tests/tcg/arm/test-arm-opt-ror.c
new file mode 100644
index 0000000000..2579168a13
--- /dev/null
+++ b/tests/tcg/arm/test-arm-opt-ror.c
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Regression test for tcg optimize vs sign bit repetitions after rotate. */
+
+#include <assert.h>
+
+int main(void)
+{
+    /* Load from memory so that TCG does not see a constant. */
+    volatile int v = 3;
+    int x = v, gt;
+
+    asm("sxtb %1, %1\n\t"
+        "ror %1, %1, #1\n\t"
+        "sxtb %1, %1\n\t"
+        "cmp %1, #0\n\t"
+        "movle %0, #0\n\t"
+        "movgt %0, #1"
+        : "=r"(gt), "+r"(x) : : "cc");
+    assert(gt);
+    return 0;
+}
diff --git a/tests/tcg/i386/meson.build b/tests/tcg/i386/meson.build
index 04d438a062..4152371a3f 100644
--- a/tests/tcg/i386/meson.build
+++ b/tests/tcg/i386/meson.build
@@ -28,6 +28,7 @@ tests += {
   'test-i386-fxtract.c': {},
   'test-i386-fyl2x.c': {},
   'test-i386-fyl2xp1.c': {},
+  'test-i386-opt-rol.c': {},
   'test-i386-pcmpistri.c': {'cflags': ['-msse4.2']},
   'test-i386-pseudo-denormal.c': {},
   'test-i386-snan-convert.c': {},
diff --git a/tests/tcg/i386/test-i386-opt-rol.c b/tests/tcg/i386/test-i386-opt-rol.c
new file mode 100644
index 0000000000..e0393147e1
--- /dev/null
+++ b/tests/tcg/i386/test-i386-opt-rol.c
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Regression test for tcg optimize vs sign bit repetitions after rotate. */
+
+#include <assert.h>
+
+int main(void)
+{
+    /* Load from memory so that TCG does not see a constant. */
+    volatile int v = 3;
+    int x = v;
+    char test;
+
+    asm("movsbl %b1, %1\n\t"
+        "roll $31, %1\n\t"
+        "movsbl %b1, %1\n\t"
+        "testl %1, %1\n\t"
+        "setg %0"
+        : "=q"(test), "+q"(x));
+    assert(test);
+    return 0;
+}
-- 
2.55.0


