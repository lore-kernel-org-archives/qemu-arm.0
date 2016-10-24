Received: by 10.80.166.35 with SMTP id d32csp2468221edc;
        Sun, 23 Oct 2016 22:56:05 -0700 (PDT)
X-Received: by 10.237.54.194 with SMTP id f60mr13544283qtb.153.1477288565913;
        Sun, 23 Oct 2016 22:56:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 133si9984767qkk.304.2016.10.23.22.56.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Oct 2016 22:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byYEu-000337-Ll
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 01:56:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1byYEq-00031u-7o
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 01:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1byYEp-0004iB-B7
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 01:56:00 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:35452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1byYEp-0004hx-1v; Mon, 24 Oct 2016 01:55:59 -0400
Received: by mail-pf0-x244.google.com with SMTP id s8so15516642pfj.2;
	Sun, 23 Oct 2016 22:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H5BCEjQpnVXM0yqZpIR50I+52Js0YH651b7Xa9C9cT4=;
	b=eFOz0RszVrG7Ei+CVCQnnti5SC07oAxr/r3WkDhBf5Y2lqa9grrVLw1EdOvZF6u5G0
	Lf9g+zMLx8tYW7j5yyxDdrBwQPk4+YsaI5g+IFsMQXlfNltYiwJnVcHQJvW70gBmhu+I
	6crAa7QrfteMDrjwBJJCbROd7WZvzpoWndJYA5quRFcqKp7vf9aReRQucLHq1stIzeg9
	tJ2pvLAui6f246t0fgVeTVl7IW79e5M9BIlBO+4w/DoPqhriG/sIP3e7/FYslf49mri1
	8ZknuPellqNQuEHQK/zoiukEsV/2HhocJ7spLL51q0WEdntxAPOXRaCqSRtggXqWU3WE
	dwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H5BCEjQpnVXM0yqZpIR50I+52Js0YH651b7Xa9C9cT4=;
	b=fp0/uioHGrakkruw5CaWR/IBGXfB76jSOm9RQggoE3XMgfhFk7T0RuWNg5o9Gg+RKk
	+I2ampI07peWPBPV1/krHj1oK6wpK952CWZTZ6wGB8Kz3HLbUBhhSgyscJW6ZTRSmDj+
	wGDQ07VWWTcFOCc+pwS4qK0Q9YLyUo7oeyr5YSdaAQVT1e/zEU5SaVAey4ZhG5uTqUfq
	NUjbfVuk2iKKm8vwqtErj825517Mi/YJ59/ZDW06UYbXv8TqTP2Y+4xDogB1vCK2hKdN
	zTVEmlFQ7l7GMRFI3VVyugH9dbkruBwQY0RsDjEzpD5YjFHC4FAhKQGSm01aMSMmSvcB
	XpGg==
X-Gm-Message-State: ABUngve+9JVEhD878/5OSUy0ihezmCtSvAnNWtsG+wxKsnS9CvjER3ceYn+M7pLn+2MtrQ==
X-Received: by 10.98.103.152 with SMTP id t24mr25559228pfj.77.1477288557130;
	Sun, 23 Oct 2016 22:55:57 -0700 (PDT)
Received: from localhost.localdomain ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	c5sm21627558pfj.71.2016.10.23.22.55.54
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Oct 2016 22:55:56 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Mon, 24 Oct 2016 11:25:22 +0530
Message-Id: <1477288523-10819-3-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
References: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v3 2/3] utils: Add helper to read arm MIDR_EL1
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
X-TUID: dDKcAfZH48Td

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Add helper API to read MIDR_EL1 registers to fetch
cpu identification information. This helps in
adding errata's and architecture specific features.

This is implemented only for arm architecture.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 include/qemu/aarch64-cpuid.h |  9 +++++
 util/Makefile.objs           |  1 +
 util/aarch64-cpuid.c         | 87 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)

diff --git a/include/qemu/aarch64-cpuid.h b/include/qemu/aarch64-cpuid.h
new file mode 100644
index 0000000..dbcb5ff
--- /dev/null
+++ b/include/qemu/aarch64-cpuid.h
@@ -0,0 +1,9 @@
+#ifndef QEMU_AARCH64_CPUID_H
+#define QEMU_AARCH64_CPUID_H
+
+#if defined(__aarch64__)
+uint64_t get_aarch64_cpu_id(void);
+bool is_thunderx_pass2_cpu(void);
+#endif
+
+#endif
diff --git a/util/Makefile.objs b/util/Makefile.objs
index 36c7dcc..d14a455 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -37,3 +37,4 @@ util-obj-y += log.o
 util-obj-y += qdist.o
 util-obj-y += qht.o
 util-obj-y += range.o
+util-obj-y += aarch64-cpuid.o
diff --git a/util/aarch64-cpuid.c b/util/aarch64-cpuid.c
new file mode 100644
index 0000000..a6352ad
--- /dev/null
+++ b/util/aarch64-cpuid.c
@@ -0,0 +1,87 @@
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
+#include <math.h>
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/cutils.h"
+#include "qemu/aarch64-cpuid.h"
+
+#if defined(__aarch64__)
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
+static uint64_t qemu_read_aarch64_midr_el1(void)
+{
+#ifdef CONFIG_LINUX
+    const char *file = "/sys/devices/system/cpu/cpu0/regs/identification/midr_el1";
+    char *buf;
+    uint64_t midr = 0;
+
+#define BUF_SIZE 32
+    buf = g_malloc0(BUF_SIZE);
+    if (!buf) {
+        return 0;
+    }
+
+    if (!g_file_get_contents(file, &buf, 0, NULL)) {
+        goto out;
+    }
+
+    if (qemu_strtoull(buf, NULL, 0, &midr) < 0) {
+        goto out;
+    }
+
+out:
+    g_free(buf);
+
+    return midr;
+#else
+    return 0;
+#endif
+}
+
+static uint64_t aarch64_midr_val;
+uint64_t get_aarch64_cpu_id(void)
+{
+#ifdef CONFIG_LINUX
+    aarch64_midr_val = qemu_read_aarch64_midr_el1();
+    aarch64_midr_val &= CPU_MODEL_MASK;
+
+    return aarch64_midr_val;
+#else
+    return 0;
+#endif
+}
+
+bool is_thunderx_pass2_cpu(void)
+{
+    return aarch64_midr_val == MIDR_THUNDERX_PASS2;
+}
+#endif
-- 
1.9.1

