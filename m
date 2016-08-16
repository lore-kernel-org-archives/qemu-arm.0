Received: by 10.25.21.156 with SMTP id 28csp1937964lfv;
        Tue, 16 Aug 2016 05:06:35 -0700 (PDT)
X-Received: by 10.55.112.193 with SMTP id l184mr26847867qkc.116.1471349195335;
        Tue, 16 Aug 2016 05:06:35 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si15963292qkh.316.2016.08.16.05.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Aug 2016 05:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZd8c-00025g-Oh
	for alex.bennee@linaro.org; Tue, 16 Aug 2016 08:06:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bZd5p-0000hc-3F
	for qemu-devel@nongnu.org; Tue, 16 Aug 2016 08:03:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bZd5i-0002iw-AF
	for qemu-devel@nongnu.org; Tue, 16 Aug 2016 08:03:40 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:36739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bZd5Y-0002el-P3; Tue, 16 Aug 2016 08:03:25 -0400
Received: by mail-pf0-x243.google.com with SMTP id y134so5416244pfg.3;
	Tue, 16 Aug 2016 05:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AWTvbo8m7eBwFCRiPyPnq0jJNFg+kwXnNFNEPh7G72k=;
	b=hwRpX8AWhUXFbOaRmxXUVD9Was3DFAkhAOviJH2PoL8s5AKVEOd+SVmIyEU3CkKK6u
	z0WXsqkj3r/6wjLvQX/JgZZErDGaajcarOG8v9DOAEJN5cdczLGcMIWbkc9omPI9c87d
	o7mxQdXGBdiHO/zbQBcFD1SjaCAsbqhNEirJt156LC1Gx9Txn/3xNQkb/ID/wG7pfEcQ
	I1OpeMC55D6w5Dz84MZfRpnFNMb685CcvNIPwy4lFTSGLOvLX7Uz9HyzcHeXeEuUHAqR
	rR2lsZuHRmZohw54BqYpjPhQa3hc6w8kDp6qx2sizpjgs4+6VBIlGP/odKgfn3U2rQJl
	5nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AWTvbo8m7eBwFCRiPyPnq0jJNFg+kwXnNFNEPh7G72k=;
	b=juZyLBLKLHqRIEBedROwo2zS465jbnNvJoK2thfTQ1gS5lgreUCFN5AuDxasap17H3
	I8gQlDwPlSr/a2r73wlgWoUN+c9Uo/V11diV0T9FP6hxK0gtLJVH+hmLXlKA775MGfCc
	kSxkaejsVNpR/glGXsj5vvijoKPoZCKOQW98LhGpstFVbEVNBKD4fD/AsE7uDJLBaz1i
	K7+4wdzGKHIse3zBhO/LyFBpBl59kJzsDloD4u5kSustwu94pEGalmZJBO7DYppm77WW
	m/uielf/1hxZKPBl1hZyLMs/sazEBbdQkNKeOedeIK6wIPY/qNa3aRup6itPHbYjeW1Z
	3kJw==
X-Gm-Message-State: AEkoouvUy2kOpNiim3tH1L+BURHYcE9/H3w/NVGG38bARq8TmpstxtlpSQNkIso9f6z2yA==
X-Received: by 10.98.10.157 with SMTP id 29mr63198326pfk.62.1471349003729;
	Tue, 16 Aug 2016 05:03:23 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	u72sm38850990pfa.31.2016.08.16.05.03.20
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 05:03:23 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Tue, 16 Aug 2016 17:32:47 +0530
Message-Id: <1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-devel] [RFC PATCH v2 1/2] utils: Add helper to read arm
 MIDR_EL1 register
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Prasun.Kapoor@cavium.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	vijay.kilari@gmail.com, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UpMi+Zozoxns

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Add helper API to read MIDR_EL1 registers to fetch
cpu identification information. This helps in
adding errata's and architecture specific features.

This is implemented only for arm architecture.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 include/qemu/aarch64-cpuid.h |  9 +++++
 util/Makefile.objs           |  1 +
 util/aarch64-cpuid.c         | 94 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/include/qemu/aarch64-cpuid.h b/include/qemu/aarch64-cpuid.h
new file mode 100644
index 0000000..3c11057
--- /dev/null
+++ b/include/qemu/aarch64-cpuid.h
@@ -0,0 +1,9 @@
+#ifndef QEMU_AARCH64_CPUID_H
+#define QEMU_AARCH64_CPUID_H
+
+#if defined (__aarch64__)
+uint64_t get_aarch64_cpu_id(void);
+bool is_thunderx_pass2_cpu(void);
+#endif
+
+#endif
diff --git a/util/Makefile.objs b/util/Makefile.objs
index 96cb1e0..aa07bc3 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -35,3 +35,4 @@ util-obj-y += log.o
 util-obj-y += qdist.o
 util-obj-y += qht.o
 util-obj-y += range.o
+util-obj-y += aarch64-cpuid.o
diff --git a/util/aarch64-cpuid.c b/util/aarch64-cpuid.c
new file mode 100644
index 0000000..42af704
--- /dev/null
+++ b/util/aarch64-cpuid.c
@@ -0,0 +1,94 @@
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
+#include "qemu-common.h"
+#include "qemu/cutils.h"
+#include "qemu/aarch64-cpuid.h"
+
+#if defined (__aarch64__)
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
+static bool is_thunderx_cpu;
+static uint64_t aarch64_midr_val;
+uint64_t get_aarch64_cpu_id(void)
+{
+#ifdef CONFIG_LINUX
+    static bool cpu_info_read;
+
+    if (unlikely(!cpu_info_read)) {
+        aarch64_midr_val = qemu_read_aarch64_midr_el1();
+        aarch64_midr_val &= CPU_MODEL_MASK;
+        cpu_info_read = 1;
+        if (aarch64_midr_val == MIDR_THUNDERX_PASS2) {
+            is_thunderx_cpu = 1;
+        }
+    }
+    return aarch64_midr_val;
+#else
+    return 0;
+#endif
+}
+
+bool is_thunderx_pass2_cpu(void)
+{
+   return is_thunderx_cpu;
+}
+#endif
-- 
1.9.1

