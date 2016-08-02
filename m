Received: by 10.25.21.156 with SMTP id 28csp103419lfv;
        Tue, 2 Aug 2016 03:21:00 -0700 (PDT)
X-Received: by 10.13.239.6 with SMTP id y6mr17533701ywe.315.1470133260854;
        Tue, 02 Aug 2016 03:21:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d82si1144454qkc.297.2016.08.02.03.21.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 03:21:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUWom-000513-BX
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 06:21:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bUWod-0004yV-OZ
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 06:20:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bUWob-0003zW-9Z
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 06:20:50 -0400
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:35136)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bUWob-0003zS-24; Tue, 02 Aug 2016 06:20:49 -0400
Received: by mail-pa0-x242.google.com with SMTP id cf3so11637366pad.2;
	Tue, 02 Aug 2016 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A+BeKPWcYwmRtOUAzJdHixJ37pIWU7wjbHjn4qX2zR4=;
	b=ftMya49iAJSVsHWLRxlzRIM8KSgycvliBg0XAEE0smfKCTBRzJPUi7IQJu5yfnEJim
	QjMKqHtgCamYSgX0Kh+ruTGZvbTagdDWjMck3+6KiXtQpgEQKm4ca+jzDZe9hB5mnUr/
	Qc8UGoFznartMEG5FaaE2cCZ3pEwpzhUzoyZCM06FVjY9nA3bzo44vjdRRdaF8teSuCw
	H8bxtv7zsnxVnPtbfmlvpLmioNkMwQ+LHIlIBXFrsoJlSZVD/vrHd7jpIyUNoblAh0id
	wKExbrqsyu5SjXWNEocipOQUMZ40Yp5+s6nV3sRDHq2F3fFvXgP+UCLjggXIIoPqMriK
	c0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A+BeKPWcYwmRtOUAzJdHixJ37pIWU7wjbHjn4qX2zR4=;
	b=WQPEDmpSkyG7XrxTBR+ccxi4OM3ANBcH1hFsN4r0hgzI44pknJtOi6BFK9b9FbqfuB
	PXZ1U/ZhKRQxgaOlGO+WpYsfOoV5REam1BTYOF/LcwnqJyqzlmI079bnKa7EgSThbWms
	Kx+J7EPtHYrWnpABLY1+nyOgE4d8D98dpeZ8dNY3ku47pvPUNOcHwdBZNRZreO6sTy+/
	e8hq7RHloL+aYqSE1E64wi4Mo3Ep9q+9MZwSMU6WT/u+neoO34iIRBLMHwWxaVlK16zV
	YBrDqaDiRmChfRrQTwfDDioanICOxffi6hFAwBZHpFXcWyfE5CyROKTXuAKtGWzYx1/z
	ABFw==
X-Gm-Message-State: AEkoouu52A86xxMTIfB2jM/FdehLMrXkoVVD5neN5KXvLE4e6eFF8RbBKnIcSmTLEPT5Rg==
X-Received: by 10.66.220.194 with SMTP id py2mr51004014pac.77.1470133248241;
	Tue, 02 Aug 2016 03:20:48 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	m78sm3580612pfj.66.2016.08.02.03.20.44
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Aug 2016 03:20:47 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Date: Tue,  2 Aug 2016 15:50:15 +0530
Message-Id: <1470133216-6758-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
References: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Subject: [Qemu-arm] [RFC PATCH v1 1/2] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: Prasun.Kapoor@cavium.com, qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HaS97hCi/yNm

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Add helper API to read MIDR_EL1 registers to fetch
cpu identification information. This helps in
adding errata's and architecture specific features.

This is implemented only for arm architecture.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 include/qemu-common.h |    1 +
 util/Makefile.objs    |    1 +
 util/cpuinfo.c        |   52 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 1f2cb94..62ad674 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -134,4 +134,5 @@ void page_size_init(void);
  * returned. */
 bool dump_in_progress(void);
 
+long int qemu_read_cpuid_info(void);
 #endif
diff --git a/util/Makefile.objs b/util/Makefile.objs
index 96cb1e0..9d25a72 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -35,3 +35,4 @@ util-obj-y += log.o
 util-obj-y += qdist.o
 util-obj-y += qht.o
 util-obj-y += range.o
+util-obj-y += cpuinfo.o
diff --git a/util/cpuinfo.c b/util/cpuinfo.c
new file mode 100644
index 0000000..3ba7194
--- /dev/null
+++ b/util/cpuinfo.c
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
+#include "qemu-common.h"
+#include "qemu/cutils.h"
+
+#if defined(__aarch64__)
+
+long int qemu_read_cpuid_info(void)
+{
+    FILE *fp;
+    char *buf;
+    long int midr = 0;
+#define BUF_SIZE 32
+
+    fp = fopen("/sys/devices/system/cpu/cpu0/regs/identification/midr_el1",
+               "r");
+    if (!fp) {
+        return 0;
+    }
+
+    buf = g_malloc0(BUF_SIZE);
+    if (!buf) {
+        fclose(fp);
+        return 0;
+    }
+
+    if (buf != fgets(buf, BUF_SIZE - 1, fp)) {
+        goto out;
+    }
+
+    if (qemu_strtol(buf, NULL, 0, &midr) < 0) {
+        goto out;
+    }
+
+out:
+    g_free(buf);
+    fclose(fp);
+
+    return midr;
+}
+#endif
-- 
1.7.9.5

