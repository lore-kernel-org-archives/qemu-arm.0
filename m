Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp650972lfm;
        Sun, 16 May 2021 12:59:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMCvghMBvR8PRfVw6A2rl+a/Fby/NwZmtS86mlJsj7gRtW45okgK2+rzmPshQ9Q5TRpqAO
X-Received: by 2002:a05:6638:155:: with SMTP id y21mr5063781jao.62.1621195155243;
        Sun, 16 May 2021 12:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621195155; cv=none;
        d=google.com; s=arc-20160816;
        b=BfWJBdhCkwW58KkcYpv0N0noxMwPz9zNPF7fvrgEefi57fkQmd86tvr7gCDvmAolr+
         VAnaArjZZGil3+STzs4Aqj6+K3/IL4fgB2AjaHlKQTzHI9XBEeeFJY6VmrjEKdv4Hl7v
         xI/6Tyqy46DdhN3pQ95bac53SJOBDkE8oRDlKWqyu80ts3YoWV1vpEfs1ktQSGxzuP6a
         3kkKyK54gB7u9PgaG1h/RuV+cSQ+gZ/7reXorqWvD0wKUHFwvhdap2wmzz1otW5ADHum
         tXcBJNyMQ5M5l0KCz8YmVe8fHVt0CiNWFqOs1aabj9YV9ivTU/easiWdJYYmKUyB8MOa
         wnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=mqQ4DMFzKzxF9Upa+LyY67jKGzxPhuKFDkw8xPHM4bY=;
        b=pTL5hJyeqx4SV7nM1MfGH9zymZ7qSHjsjaDxCvHvIywuztGN/Nfj2mcE5hVN1ZhzvJ
         kBroWnCJjsFijd0rAV0aZV92xvgFN9us0Pv1Hap2MSyAoAaZcEpSJOudyfuSvsqi7kih
         4mDIWKypZFTwbZXbleZM23xk1VDLdqvyOM3/HnQuDNvTj9tlbQZK/VayEKibw0jkRhQ9
         Vj43a1EzHxxwgJwUT7xDSYIxmM3Fn8K7HdCmBKIzkSHUOI0mhg19+2KxAnbDYTkVlrYZ
         ZtH4PrQ6qPo5kldpOY3ifIVAUaWGRhOVPlM6CgAeFQfcpnPkRKZFXBi6rYfbYPbWFDci
         rsvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si13870521ilj.21.2021.05.16.12.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 12:59:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liMuw-0001tV-Fi
	for alex.bennee@linaro.org; Sun, 16 May 2021 15:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMuk-0001sX-Tu; Sun, 16 May 2021 15:59:02 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45306 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMuh-0008Bo-ON; Sun, 16 May 2021 15:59:02 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id 20A006080516;
 Sun, 16 May 2021 21:58:57 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 01/19] hvf: Move assert_hvf_ok() into common directory
Date: Sun, 16 May 2021 21:58:37 +0200
Message-Id: <20210516195855.28869-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p+KEyuae6SI7

Until now, Hypervisor.framework has only been available on x86_64 systems.
With Apple Silicon shipping now, it extends its reach to aarch64. To
prepare for support for multiple architectures, let's start moving common
code out into its own accel directory.

This patch moves assert_hvf_ok() and introduces generic build infrastructure.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 MAINTAINERS              |  8 +++++++
 accel/hvf/hvf-all.c      | 47 ++++++++++++++++++++++++++++++++++++++++
 accel/hvf/meson.build    |  6 +++++
 accel/meson.build        |  1 +
 include/sysemu/hvf_int.h | 18 +++++++++++++++
 target/i386/hvf/hvf.c    | 33 +---------------------------
 6 files changed, 81 insertions(+), 32 deletions(-)
 create mode 100644 accel/hvf/hvf-all.c
 create mode 100644 accel/hvf/meson.build
 create mode 100644 include/sysemu/hvf_int.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 78561a223f..e948df01f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -434,7 +434,15 @@ M: Roman Bolshakov <r.bolshakov@yadro.com>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
+
+HVF
+M: Cameron Esfahani <dirty@apple.com>
+M: Roman Bolshakov <r.bolshakov@yadro.com>
+W: https://wiki.qemu.org/Features/HVF
+S: Maintained
+F: accel/hvf/
 F: include/sysemu/hvf.h
+F: include/sysemu/hvf_int.h
 
 WHPX CPUs
 M: Sunil Muthuswamy <sunilmut@microsoft.com>
diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
new file mode 100644
index 0000000000..f185b0830a
--- /dev/null
+++ b/accel/hvf/hvf-all.c
@@ -0,0 +1,47 @@
+/*
+ * QEMU Hypervisor.framework support
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/error-report.h"
+#include "sysemu/hvf.h"
+#include "sysemu/hvf_int.h"
+
+void assert_hvf_ok(hv_return_t ret)
+{
+    if (ret == HV_SUCCESS) {
+        return;
+    }
+
+    switch (ret) {
+    case HV_ERROR:
+        error_report("Error: HV_ERROR");
+        break;
+    case HV_BUSY:
+        error_report("Error: HV_BUSY");
+        break;
+    case HV_BAD_ARGUMENT:
+        error_report("Error: HV_BAD_ARGUMENT");
+        break;
+    case HV_NO_RESOURCES:
+        error_report("Error: HV_NO_RESOURCES");
+        break;
+    case HV_NO_DEVICE:
+        error_report("Error: HV_NO_DEVICE");
+        break;
+    case HV_UNSUPPORTED:
+        error_report("Error: HV_UNSUPPORTED");
+        break;
+    default:
+        error_report("Unknown Error");
+    }
+
+    abort();
+}
diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
new file mode 100644
index 0000000000..227b11cd71
--- /dev/null
+++ b/accel/hvf/meson.build
@@ -0,0 +1,6 @@
+hvf_ss = ss.source_set()
+hvf_ss.add(files(
+  'hvf-all.c',
+))
+
+specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
diff --git a/accel/meson.build b/accel/meson.build
index b44ba30c86..dfd808d2c8 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -2,6 +2,7 @@ specific_ss.add(files('accel-common.c'))
 softmmu_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
 
+subdir('hvf')
 subdir('qtest')
 subdir('kvm')
 subdir('tcg')
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
new file mode 100644
index 0000000000..3deb4cfacc
--- /dev/null
+++ b/include/sysemu/hvf_int.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU Hypervisor.framework (HVF) support
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+/* header to be included in HVF-specific code */
+
+#ifndef HVF_INT_H
+#define HVF_INT_H
+
+#include <Hypervisor/hv.h>
+
+void assert_hvf_ok(hv_return_t ret);
+
+#endif
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index f044181d06..32f42f1592 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -51,6 +51,7 @@
 #include "qemu/error-report.h"
 
 #include "sysemu/hvf.h"
+#include "sysemu/hvf_int.h"
 #include "sysemu/runstate.h"
 #include "hvf-i386.h"
 #include "vmcs.h"
@@ -76,38 +77,6 @@
 
 HVFState *hvf_state;
 
-static void assert_hvf_ok(hv_return_t ret)
-{
-    if (ret == HV_SUCCESS) {
-        return;
-    }
-
-    switch (ret) {
-    case HV_ERROR:
-        error_report("Error: HV_ERROR");
-        break;
-    case HV_BUSY:
-        error_report("Error: HV_BUSY");
-        break;
-    case HV_BAD_ARGUMENT:
-        error_report("Error: HV_BAD_ARGUMENT");
-        break;
-    case HV_NO_RESOURCES:
-        error_report("Error: HV_NO_RESOURCES");
-        break;
-    case HV_NO_DEVICE:
-        error_report("Error: HV_NO_DEVICE");
-        break;
-    case HV_UNSUPPORTED:
-        error_report("Error: HV_UNSUPPORTED");
-        break;
-    default:
-        error_report("Unknown Error");
-    }
-
-    abort();
-}
-
 /* Memory slots */
 hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
 {
-- 
2.30.1 (Apple Git-130)

