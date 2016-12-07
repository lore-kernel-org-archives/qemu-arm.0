Received: by 10.25.159.131 with SMTP id i125csp444288lfe;
        Wed, 7 Dec 2016 09:08:00 -0800 (PST)
X-Received: by 10.200.54.144 with SMTP id a16mr68759770qtc.104.1481130480636;
        Wed, 07 Dec 2016 09:08:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q3si14919609qkd.22.2016.12.07.09.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Dec 2016 09:08:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEfhI-0002Jt-30
	for alex.bennee@linaro.org; Wed, 07 Dec 2016 12:08:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cEfh7-0002Ew-5A
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 12:07:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cEfh2-0000Qj-Ei
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 12:07:49 -0500
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cEfh2-0000QS-9A; Wed, 07 Dec 2016 12:07:44 -0500
Received: by mail-pg0-f67.google.com with SMTP id e9so23984003pgc.1;
	Wed, 07 Dec 2016 09:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DsSpUlQ7ULN1SvhawMWxUFscaRovyLnDn7Na8wQm8IM=;
	b=cRZLWj0vN4qZgWyRh/h5UCuokOXMaWN9NlH2ZNxcwz3dm8xMfbOH1ysvv2Tj2k5DyZ
	eP8JZyK4/fcA5tamKTD58MUze70sQIubWzTXCHCPTiZryyOpzFiROSMGamUlhVKornil
	Xb2PZ5zwNGFN8VeeIJ2ewkcb5fAEEMX/2I55xDOYK57NRrSMuZvNsLm1PuMwLjjcHBeJ
	2V2Ich5Xv282hrSbLc6cHC7BNcX9kwuLrruaD73Qe9r3qcIAB86Ly7Y9TuDP0cHFz0B4
	tex7ilO2hh5xOCi4mlwOPiAHCwtEuoIMNeRYOLbhf1R6ra7YhrkBs7vcEPXNAPBlqQJI
	s6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DsSpUlQ7ULN1SvhawMWxUFscaRovyLnDn7Na8wQm8IM=;
	b=g+cr/x+bkHN+/563GRJhHqt2R9vT1G8zUiyegw6j4XIcZ7bV+2pqDhF7e4LJZLfMAN
	BDx6ypdaSjIj0QDSM8lbQYsm2ltqUA1lezdsA/fly09eNjxkmL8W/9gqpcwWxu8N+1nx
	k6U28wrWJrj/3Z+0Aep2lH2UHujsX7MHu9QNVX42hblBTMjwvstTNus9+znKT/UVPYBu
	Hwn+JbZ3MlWVYHbwM1dJXzNtRcQkWkkZICePjvVNw613OPaxlNQ/q1/8bJFme10568l8
	3b3dhh6OkxZOJirFICnZn0hgQ7NVQ+gxNq9hClsJab0T6DVPOIjSKl1DW2uM5brFdJpa
	G3YA==
X-Gm-Message-State: AKaTC01jK9UxZ02REpm5AaIUZjdhpglDFbTGechPqF4Ax9eOqvwxgiz2JrwuNi9Xjaoyaw==
X-Received: by 10.99.157.129 with SMTP id i123mr122490851pgd.148.1481130403376;
	Wed, 07 Dec 2016 09:06:43 -0800 (PST)
Received: from localhost.localdomain
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	u23sm43898487pfg.86.2016.12.07.09.06.40
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Dec 2016 09:06:42 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Wed,  7 Dec 2016 22:36:12 +0530
Message-Id: <1481130374-5147-3-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1481130374-5147-1-git-send-email-vijay.kilari@gmail.com>
References: <1481130374-5147-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.83.67
Subject: [Qemu-arm] [PATCH v5 2/3] utils: Add helper to read arm MIDR_EL1
 register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c9Zf9EkXix2w

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Add helper API to read MIDR_EL1 registers to fetch
cpu identification information. This helps in
adding errata's and architecture specific features.

This is implemented only for arm architecture.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 include/qemu/aarch64-cpuid.h | 38 ++++++++++++++++++++++++++++++++
 util/Makefile.objs           |  1 +
 util/aarch64-cpuid.c         | 52 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)

diff --git a/include/qemu/aarch64-cpuid.h b/include/qemu/aarch64-cpuid.h
new file mode 100644
index 0000000..fb88ed8
--- /dev/null
+++ b/include/qemu/aarch64-cpuid.h
@@ -0,0 +1,38 @@
+#ifndef QEMU_AARCH64_CPUID_H
+#define QEMU_AARCH64_CPUID_H
+
+#if defined(__aarch64__) && defined(CONFIG_LINUX)
+#define MIDR_IMPLEMENTER_SHIFT  24
+#define MIDR_IMPLEMENTER_MASK   (0xffULL << MIDR_IMPLEMENTER_SHIFT)
+#define MIDR_ARCHITECTURE_SHIFT 16
+#define MIDR_ARCHITECTURE_MASK  (0xf << MIDR_ARCHITECTURE_SHIFT)
+#define MIDR_PARTNUM_SHIFT      4
+#define MIDR_PARTNUM_MASK       (0xfff << MIDR_PARTNUM_SHIFT)
+
+#define MIDR_CPU_PART(imp, partnum) \
+        (((imp)                 << MIDR_IMPLEMENTER_SHIFT)  | \
+        (0xf                    << MIDR_ARCHITECTURE_SHIFT) | \
+        ((partnum)              << MIDR_PARTNUM_SHIFT))
+
+#define ARM_CPU_IMP_CAVIUM        0x43
+#define CAVIUM_CPU_PART_THUNDERX  0x0A1
+
+#define MIDR_THUNDERX_PASS2  \
+               MIDR_CPU_PART(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
+#define CPU_MODEL_MASK  (MIDR_IMPLEMENTER_MASK | MIDR_ARCHITECTURE_MASK | \
+                         MIDR_PARTNUM_MASK)
+
+uint64_t get_aarch64_cpu_id(void);
+bool is_thunderx_pass2_cpu(void);
+#else
+static inline uint64_t get_aarch64_cpu_id(void)
+{
+    return 0;
+}
+
+static inline bool is_thunderx_pass2_cpu(void)
+{
+    return false;
+}
+#endif
+#endif
diff --git a/util/Makefile.objs b/util/Makefile.objs
index ad0f9c7..a9585c9 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -36,3 +36,4 @@ util-obj-y += log.o
 util-obj-y += qdist.o
 util-obj-y += qht.o
 util-obj-y += range.o
+util-obj-$(CONFIG_LINUX) += aarch64-cpuid.o
diff --git a/util/aarch64-cpuid.c b/util/aarch64-cpuid.c
new file mode 100644
index 0000000..575f52e
--- /dev/null
+++ b/util/aarch64-cpuid.c
@@ -0,0 +1,52 @@
+/*
+ * Dealing with arm cpu identification information.
+ *
+ * Copyright (C) 2016 Cavium, Inc.
+ *
+ * Authors:
+ *  Vijaya Kumar K <Vijaya.Kumar@cavium.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1
+ * or later.  See the COPYING.LIB file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/aarch64-cpuid.h"
+
+#if defined(__aarch64__)
+static uint64_t qemu_read_aarch64_midr_el1(void)
+{
+    const char *file = "/sys/devices/system/cpu/cpu0/regs/identification/midr_el1";
+    char *buf;
+    uint64_t midr = 0;
+
+    if (!g_file_get_contents(file, &buf, 0, NULL)) {
+        goto out;
+    }
+
+    if (qemu_strtoull(buf, NULL, 0, &midr) < 0) {
+        midr = 0;
+        goto out;
+    }
+
+out:
+    g_free(buf);
+
+    return midr;
+}
+
+static uint64_t aarch64_midr_val;
+uint64_t get_aarch64_cpu_id(void)
+{
+    aarch64_midr_val = qemu_read_aarch64_midr_el1();
+    aarch64_midr_val &= CPU_MODEL_MASK;
+
+    return aarch64_midr_val;
+}
+
+bool is_thunderx_pass2_cpu(void)
+{
+    return aarch64_midr_val == MIDR_THUNDERX_PASS2;
+}
+#endif
-- 
1.9.1

