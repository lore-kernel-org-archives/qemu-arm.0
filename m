Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56A9C8303C
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 17:23:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYpXu-0003FM-GZ; Mon, 07 Jul 2025 13:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWV-0000o3-Mr
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:20:59 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWR-00056m-Mn
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:20:58 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so2131169f8f.0
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751908842; x=1752513642; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/3S1SutETVOVzQXn+B5Ty8Wa6Pzu0fGa53c3etvcBA=;
 b=lMmFyQVS5UyejsR6o0MB3nNkYbGyS8jS61F+/iTt7aHA2WyANZG70JCFcKzRYul13p
 a60FEXY+tTxJSPsdiFBPWSi4kzJ0txfsKcLTMxjUFtRDsXW2bc5Deo2CHVcVcMuz0DAq
 fM+UMuD8YNX7lwU7/ncpMpmDOldsJ+Z5ccdeaB88v/vflEyzkoPl3N5fA4UKPbcHvgVM
 AkzXKF3yjqaKeEDI4xNysv1FmJ4POal/6f9tIKZnricVgpal2tCmAglenBmZaAb2qJgM
 LD/2AWdsYfVi0vYbzgpJLmWQl38ni0+OKP8ED4P3vLiVSC6q2Yl/OaNhnvuKJjwsPpoZ
 eBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908842; x=1752513642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/3S1SutETVOVzQXn+B5Ty8Wa6Pzu0fGa53c3etvcBA=;
 b=sRfIQNf1l/7mPgFsEI3+y2ZD2OUUXAWu/kU6nGkTiQ3fjEXOw3Gs058aDnFfJBW8Uy
 989R0WHK8TgKPHBg8YojAXHyoq/Jl/3SkWREo5NyN4LzJjGFKbYdWgT91P89L/yIy9zJ
 YxDO/q3PStKMS/q5w+G9uHnQXqmejeNxr8t9LTINQjnK5GCn6tGmUlGKOGhdLRHpmYxd
 JQcqc8R+XUotbRYDKi+cdaq9d2WsZa0i1DiuEXdhpf8AHPYQmjJ9Saw6Skkxc04gLUKJ
 EmCq/1N2kgAJaWCtVeqMLr8UesQZQZsQICT+Bx3o2bMs3dPoSpUSMcAcVI8VjxyoWJSV
 u0xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp+lkGiVxrQ+ByqKoM/Q2oVB2Tbht3gOLj2Ek43CcQ1I6u1CCsPggC5MdaM6cMajPjQStofl0LVQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz9uHpuJu/WkHAkN7rGzKPMlV/0QzyiOrIBaIimi/WtpFIFL6cT
 ETh7Tr595EOCjQW5Xo9GbsZn0sqahQhXtu+5/tOF//wGa3RPbKC2u1tZa113KotZWNs=
X-Gm-Gg: ASbGncufr8+9Nyz1ioPNJTCJzuZ0dXoi9DCBEIzljyPgzvJMwDnPhnvs+OpjSXvUOxq
 gUHpA4k3esiNy2ITV0oyRRKzkLMXWzS9oAgWj9uWkIIgDUhdaTy4L5nUkZdKXz1GikavgvKMUIQ
 h+j8nPUUTWo+9XE2HCA224Ft94AROB81vPCWmRi4TkdoJFPtBq4cwiNsWBM0af5nTUi26IqbM5k
 KKvjMKdSOrAPMPY2KXLlLNL/DpYpoSLR4/Ap3iXfrohuIKmdhFB8kGy6Pau//YvSaChA0H9oQVN
 IXYME0TZqnLv03qrYFLKjAJ37/vqru7JnGt2H0VYCAxdWXEH5aP6udFUcllBHL1SQr1Jj2vHhS5
 X9oknj5SZRe+tENgWjqaf2/8PG/627viybEJer+1xsu9Jccg=
X-Google-Smtp-Source: AGHT+IEE2BgYU4ioX3C7uU/iCZP0JhspMkrKzzO2Roh10BzFrS0z4whPy53s/TQGYRTtAf2ayV+M7g==
X-Received: by 2002:a05:6000:40c9:b0:3b3:a43a:cc54 with SMTP id
 ffacd0b85a97d-3b49aa7daeamr8990189f8f.45.1751908841758; 
 Mon, 07 Jul 2025 10:20:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1685499sm117981975e9.22.2025.07.07.10.20.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 10:20:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH-for-10.1 v6 06/14] qemu: Convert target_words_bigendian() to
 TargetInfo API
Date: Mon,  7 Jul 2025 19:20:00 +0200
Message-ID: <20250707172009.3884-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/tswap.h       | 13 +------------
 include/qemu/target-info.h |  8 ++++++++
 cpu-target.c               |  7 -------
 hw/core/cpu-system.c       |  2 +-
 hw/display/vga.c           |  2 +-
 hw/virtio/virtio.c         |  2 +-
 system/memory.c            |  1 +
 system/qtest.c             |  1 +
 target-info.c              |  5 +++++
 9 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index 49511f26117..55ffa633598 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -9,18 +9,7 @@
 #define TSWAP_H
 
 #include "qemu/bswap.h"
-
-/**
- * target_big_endian:
- * Returns true if the (default) endianness of the target is big endian,
- * false otherwise. Common code should normally never need to know about the
- * endianness of the target, so please do *not* use this function unless you
- * know very well what you are doing!
- */
-bool target_big_endian(void);
-#ifdef COMPILING_PER_TARGET
-#define target_big_endian()   TARGET_BIG_ENDIAN
-#endif
+#include "qemu/target-info.h"
 
 /*
  * If we're in target-specific code, we can hard-code the swapping
diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index dde0e7d968a..18a8c4ff6e8 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -38,4 +38,12 @@ const char *target_machine_typename(void);
  */
 const char *target_cpu_type(void);
 
+/**
+ * target_big_endian:
+ *
+ * Returns: %true if the (default) endianness of the target is big endian,
+ *          %false otherwise.
+ */
+bool target_big_endian(void);
+
 #endif
diff --git a/cpu-target.c b/cpu-target.c
index 1c90a307593..20db5ff3108 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -22,7 +22,6 @@
 #include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "exec/cpu-common.h"
-#include "exec/tswap.h"
 #include "exec/replay-core.h"
 #include "exec/log.h"
 #include "hw/core/cpu.h"
@@ -85,9 +84,3 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
 #endif
     abort();
 }
-
-#undef target_big_endian
-bool target_big_endian(void)
-{
-    return TARGET_BIG_ENDIAN;
-}
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 3c84176a0c5..a975405d3a0 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -24,7 +24,7 @@
 #include "exec/cputlb.h"
 #include "system/memory.h"
 #include "exec/tb-flush.h"
-#include "exec/tswap.h"
+#include "qemu/target-info.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/core/sysemu-cpu-ops.h"
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 20475ebbd31..90b89cf4044 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -26,7 +26,7 @@
 #include "qemu/units.h"
 #include "system/reset.h"
 #include "qapi/error.h"
-#include "exec/tswap.h"
+#include "qemu/target-info.h"
 #include "hw/display/vga.h"
 #include "hw/i386/x86.h"
 #include "hw/pci/pci.h"
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 82a285a31d1..0f4d28033d7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -20,7 +20,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
-#include "exec/tswap.h"
+#include "qemu/target-info.h"
 #include "qom/object_interfaces.h"
 #include "hw/core/cpu.h"
 #include "hw/virtio/virtio.h"
diff --git a/system/memory.c b/system/memory.c
index e8d9b15b28f..38da62f5052 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -22,6 +22,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/qemu-print.h"
+#include "qemu/target-info.h"
 #include "qom/object.h"
 #include "trace.h"
 #include "system/ram_addr.h"
diff --git a/system/qtest.c b/system/qtest.c
index 301b03be2d3..fa42c9f9215 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -29,6 +29,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
+#include "qemu/target-info.h"
 #include "qom/object_interfaces.h"
 
 #define MAX_IRQ 256
diff --git a/target-info.c b/target-info.c
index 2659aecd8d1..758b430d94a 100644
--- a/target-info.c
+++ b/target-info.c
@@ -57,3 +57,8 @@ EndianMode target_endian_mode(void)
 {
     return target_info()->endianness;
 }
+
+bool target_big_endian(void)
+{
+    return target_endian_mode() == ENDIAN_MODE_BIG;
+}
-- 
2.49.0


