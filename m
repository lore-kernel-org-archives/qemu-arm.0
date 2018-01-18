Received: by 10.28.173.206 with SMTP id w197csp6801450wme;
        Thu, 18 Jan 2018 09:36:05 -0800 (PST)
X-Google-Smtp-Source: ACJfBouXLQUDrhXP1lvcEjJa31TdhIErZCYU9/AhvND5hMccxQWV/8Lzw6fnXxA6jxcPEiM0dpW9
X-Received: by 10.129.165.211 with SMTP id c202mr6518377ywh.25.1516296965557;
        Thu, 18 Jan 2018 09:36:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516296965; cv=none;
        d=google.com; s=arc-20160816;
        b=R9Beo2PnoBeZRh5/mVUjhiylZ+WKiDOyX9N6S3aBIUISZfDJzJ1kuHxr/YM295J7Fh
         hMweHHFlcFSyzB6F2vuvG1i1mJJ1Qvh01fC7K7AmFLNIQn53MQi0bAtN+FiCY+nyuSqo
         wO9rWjIFQqUZRX3KFctSD4Da6H+fKcwbdZzwdzj7V262Lb8MhBb7cgIoGhp2BOJwVM5/
         p0/TZaXPE7rBPk7ht54zplsrj3mc818HDEHnhv0iR/AukGZh3Qzm72Zm1vqHxzO8iMOb
         QNz+byQhkMsIvx8EgyAVkqk98QASmV6J3ia1YUVlQKXFoqApVbNZn0irFxAk2L9zu3h6
         sHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=82nawQngBvw/nt9i4PiQNfh9VTQvkis52xl9lyzTKzo=;
        b=pJUcULvdPeuJYMdh5lEZ1X7/+WaKCXz2mzL7XiuDPwT+YRSS3mBqCMty1+9SnILiq6
         QB/xeH/7CugdXf3WILOkQPPgt6BvPpHX7G5YJq6ZdGP4KMhYWHkUvZBI/jeoPrBCWCdM
         4S8cBiqxiManXAFT103fM4sO25/VpasSwhaVP2mDZtw1nXxnUe54ClFGNEwQYszcDA+8
         f4lnpqUpwNFlbav+nnqoBwQ78DyekuQ18UIY4YKZ0RWklvaOlLDarXo2uww3sCk39Q4X
         xXBVyv+6DnIroCdR5REZGXZQZ4m8yTT96mry+yEx9VkVDGJveox9ET3xPt1ciECMOChW
         dI1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b15si1695228ywh.84.2018.01.18.09.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 09:36:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecE6f-0004ME-0i
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 12:36:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6Q-0004Iz-Tm
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 12:35:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6O-0007r9-LG
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 12:35:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59098)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ecE6O-0007qb-Ch; Thu, 18 Jan 2018 12:35:48 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 700DF3C37;
	Thu, 18 Jan 2018 17:35:47 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 069F578E7D;
	Thu, 18 Jan 2018 17:35:45 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jan 2018 18:33:58 +0100
Message-Id: <1516296842-136976-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
References: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 18 Jan 2018 17:35:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 1/5] tests: add machine 'none' with -cpu test
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +WjMkgxOaWU+

Check that "$QEMU -M none -cpu FOO" starts QEMU without error

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/Makefile.include |  2 ++
 tests/machine-none.c   | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 tests/machine-none.c

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 8883274..6661149 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -380,6 +380,7 @@ check-qtest-s390x-y += tests/virtio-balloon-test$(EXESUF)
 check-qtest-s390x-y += tests/virtio-console-test$(EXESUF)
 check-qtest-s390x-y += tests/virtio-serial-test$(EXESUF)
 
+check-qtest-generic-y += tests/machine-none$(EXESUF)
 check-qtest-generic-y += tests/qom-test$(EXESUF)
 check-qtest-generic-y += tests/test-hmp$(EXESUF)
 
@@ -782,6 +783,7 @@ tests/display-vga-test$(EXESUF): tests/display-vga-test.o
 tests/ipoctal232-test$(EXESUF): tests/ipoctal232-test.o
 tests/qom-test$(EXESUF): tests/qom-test.o
 tests/test-hmp$(EXESUF): tests/test-hmp.o
+tests/machine-none$(EXESUF): tests/machine-none.o
 tests/drive_del-test$(EXESUF): tests/drive_del-test.o $(libqos-virtio-obj-y)
 tests/qdev-monitor-test$(EXESUF): tests/qdev-monitor-test.o $(libqos-pc-obj-y)
 tests/nvme-test$(EXESUF): tests/nvme-test.o
diff --git a/tests/machine-none.c b/tests/machine-none.c
new file mode 100644
index 0000000..d16c283
--- /dev/null
+++ b/tests/machine-none.c
@@ -0,0 +1,71 @@
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
+    char *args;
+    QDict *response;
+    const char *arch = qtest_get_arch();
+    const char *cpu_model = get_cpu_model_by_arch(arch);
+
+    if (!cpu_model) {
+        fprintf(stderr, "WARNING: cpu name for target '%s' isn't defined,"
+                " add it to cpus_map\n", arch);
+        return; /* TODO: die here to force all targets have a test */
+    }
+    args = g_strdup_printf("-machine none -cpu %s", cpu_model);
+    qtest_start(args);
+
+    response = qmp("{ 'execute': 'quit' }");
+    g_assert(qdict_haskey(response, "return"));
+    QDECREF(response);
+
+    qtest_end();
+    g_free(args);
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

