Received: by 10.28.71.27 with SMTP id u27csp3766927wma;
        Tue, 23 Jan 2018 00:10:53 -0800 (PST)
X-Google-Smtp-Source: AH8x2248R997sLp7DYhvuvi6bJVjQYXVKm48fuvDHNJIET7VdufoSSP4JzqI3KRru0rTACl/5rJk
X-Received: by 10.13.201.65 with SMTP id l62mr1549548ywd.331.1516695052960;
        Tue, 23 Jan 2018 00:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695052; cv=none;
        d=google.com; s=arc-20160816;
        b=UtlGvOcFhL/B3ocLfHUuKKz2uyGxxkOy5KLPppW7gajbXAv6G9eLGpvi5KjfIioEwc
         /sSFtZFCLPAaLCB20yA7l4BgHtcmnTBpIAX8TSZchqGvYkRU406eobfWJC6JJshVfx06
         frs5+jI+GHifZXIh9W2B6iA1ZiIw98qJWaMJIk4r58HAIFdiWhmj4NG6zWErOIAtxbBK
         /yQDKgYDd8IIa1RFBh6F8ZJwBE+TK/V/K9lTAu6Kv2nivswqzUTaKauVBadVveWYc7bb
         XoSbyLj9ciGDGF2sZ57IrkiVLRvCOfHOLiPycjE56qYfCVaAN5eK+3i720tkfHgK13qT
         5IYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=9DHsfznHUr0FRpPEgTcRbakKprzahfzlIofGQGmHEs8=;
        b=RyTl/dkQ9en7M96RyKvTAoz2yoY8ksOdNp1AcZRDBhBbFU12p31MRTw8X2ZAEMeeY5
         4Iinpwv/v5fyEhUdJv22qkOzR6cRqC2adssVz6ClLEp6m+8Ar0hGoClJmX2xm9JGke3f
         pIsWvH0NZurxbLri673InuwMce6VS/xzMsNoerdzkBRF6bwGx+0/1kJQpi/35Eb6+pI3
         CCvhMHHdsZVf7z7hBONKGtqhoqo5Nh7dv5QTqqkbV3PvrhM6Cnozb5ImVccIptzd/OKV
         X7lfvDCKYhoNYU/YPEFfFK9SiO0xiqreGRF12cSOPrFq0NOl2rrfxqiyAdZcQaXKFxB/
         o82w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k18si3860729ywa.186.2018.01.23.00.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtfQ-0007ij-5X
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:10:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edteo-0007FA-I0
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edten-0001rI-G8
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46550)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edten-0001qQ-6z; Tue, 23 Jan 2018 03:10:13 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D73C3C058EDC;
	Tue, 23 Jan 2018 08:10:11 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CA6DD1E7;
	Tue, 23 Jan 2018 08:10:10 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:01 +0100
Message-Id: <1516694904-64879-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 23 Jan 2018 08:10:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 02/25] tests: add machine 'none' with -cpu test
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dSU+FhRjeGRD

Check that "$QEMU -M none -cpu FOO" starts QEMU without error

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  - rename file to machine-none-test.c (Thomas Huth <thuth@redhat.com>)
  - use qtest_startf()/instead of qtest_start() (Thomas Huth <thuth@redhat.com>)
---
 tests/Makefile.include    |  2 ++
 tests/machine-none-test.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 tests/machine-none-test.c

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 8883274..ea0a803 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -380,6 +380,7 @@ check-qtest-s390x-y += tests/virtio-balloon-test$(EXESUF)
 check-qtest-s390x-y += tests/virtio-console-test$(EXESUF)
 check-qtest-s390x-y += tests/virtio-serial-test$(EXESUF)
 
+check-qtest-generic-y += tests/machine-none-test$(EXESUF)
 check-qtest-generic-y += tests/qom-test$(EXESUF)
 check-qtest-generic-y += tests/test-hmp$(EXESUF)
 
@@ -782,6 +783,7 @@ tests/display-vga-test$(EXESUF): tests/display-vga-test.o
 tests/ipoctal232-test$(EXESUF): tests/ipoctal232-test.o
 tests/qom-test$(EXESUF): tests/qom-test.o
 tests/test-hmp$(EXESUF): tests/test-hmp.o
+tests/machine-none-test$(EXESUF): tests/machine-none-test.o
 tests/drive_del-test$(EXESUF): tests/drive_del-test.o $(libqos-virtio-obj-y)
 tests/qdev-monitor-test$(EXESUF): tests/qdev-monitor-test.o $(libqos-pc-obj-y)
 tests/nvme-test$(EXESUF): tests/nvme-test.o
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
new file mode 100644
index 0000000..2eb13e8
--- /dev/null
+++ b/tests/machine-none-test.c
@@ -0,0 +1,68 @@
+/*
+ * Machine 'none' tests.
+ *
+ * Copyright (c) 2018 Red Hat Inc.
+ *
+ * Authors:
+ *  Igor Mammedov <imammedo@redhat.com>,
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qemu-common.h"
+#include "qemu/cutils.h"
+#include "libqtest.h"
+#include "qapi/qmp/types.h"
+
+struct arch2cpu {
+    const char *arch;
+    const char *cpu_model;
+};
+
+static struct arch2cpu cpus_map[] = {
+    /* tested targets list */
+};
+
+static const char *get_cpu_model_by_arch(const char *arch)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(cpus_map); i++) {
+        if (!strcmp(arch, cpus_map[i].arch)) {
+            return cpus_map[i].cpu_model;
+        }
+    }
+    return NULL;
+}
+
+static void test_machine_cpu_cli(void)
+{
+    QDict *response;
+    const char *arch = qtest_get_arch();
+    const char *cpu_model = get_cpu_model_by_arch(arch);
+
+    if (!cpu_model) {
+        fprintf(stderr, "WARNING: cpu name for target '%s' isn't defined,"
+                " add it to cpus_map\n", arch);
+        return; /* TODO: die here to force all targets have a test */
+    }
+    global_qtest = qtest_startf("-machine none -cpu %s", cpu_model);
+
+    response = qmp("{ 'execute': 'quit' }");
+    g_assert(qdict_haskey(response, "return"));
+    QDECREF(response);
+
+    qtest_quit(global_qtest);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("machine/none/cpu_option", test_machine_cpu_cli);
+
+    return g_test_run();
+}
-- 
2.7.4

