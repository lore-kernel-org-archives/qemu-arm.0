Received: by 10.25.0.198 with SMTP id 189csp84553lfa;
        Wed, 3 May 2017 05:57:37 -0700 (PDT)
X-Received: by 10.237.62.200 with SMTP id o8mr915553qtf.152.1493816257590;
        Wed, 03 May 2017 05:57:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si1915480qks.309.2017.05.03.05.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 05:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5tqa-0007wc-Ub
	for alex.bennee@linaro.org; Wed, 03 May 2017 08:57:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tqT-0007to-63
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:57:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tqS-0000Xo-4v
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:57:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57162)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5tqR-0000XG-TG; Wed, 03 May 2017 08:57:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A52E93B702;
	Wed,  3 May 2017 12:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A52E93B702
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A52E93B702
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 668DB182D8;
	Wed,  3 May 2017 12:57:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 May 2017 14:56:55 +0200
Message-Id: <1493816238-33120-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 03 May 2017 12:57:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 01/24] tests: add CPUs to numa node mapping
 test
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hjgLzJIcebUy

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 tests/Makefile.include |   5 +++
 tests/numa-test.c      | 106 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 tests/numa-test.c

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 31931c0..16ff8f3 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -260,6 +260,7 @@ check-qtest-i386-y += tests/test-filter-mirror$(EXESUF)
 check-qtest-i386-y += tests/test-filter-redirector$(EXESUF)
 check-qtest-i386-y += tests/postcopy-test$(EXESUF)
 check-qtest-i386-y += tests/test-x86-cpuid-compat$(EXESUF)
+check-qtest-i386-y += tests/numa-test$(EXESUF)
 check-qtest-x86_64-y += $(check-qtest-i386-y)
 gcov-files-i386-y += i386-softmmu/hw/timer/mc146818rtc.c
 gcov-files-x86_64-y = $(subst i386-softmmu/,x86_64-softmmu/,$(gcov-files-i386-y))
@@ -300,6 +301,7 @@ check-qtest-ppc64-y += tests/test-netfilter$(EXESUF)
 check-qtest-ppc64-y += tests/test-filter-mirror$(EXESUF)
 check-qtest-ppc64-y += tests/test-filter-redirector$(EXESUF)
 check-qtest-ppc64-y += tests/display-vga-test$(EXESUF)
+check-qtest-ppc64-y += tests/numa-test$(EXESUF)
 check-qtest-ppc64-$(CONFIG_EVENTFD) += tests/ivshmem-test$(EXESUF)
 
 check-qtest-sh4-y = tests/endianness-test$(EXESUF)
@@ -324,6 +326,8 @@ gcov-files-arm-y += arm-softmmu/hw/block/virtio-blk.c
 check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
 gcov-files-arm-y += hw/timer/arm_mptimer.c
 
+check-qtest-aarch64-y = tests/numa-test$(EXESUF)
+
 check-qtest-microblazeel-y = $(check-qtest-microblaze-y)
 
 check-qtest-xtensaeb-y = $(check-qtest-xtensa-y)
@@ -753,6 +757,7 @@ tests/vhost-user-bridge$(EXESUF): tests/vhost-user-bridge.o contrib/libvhost-use
 tests/test-uuid$(EXESUF): tests/test-uuid.o $(test-util-obj-y)
 tests/test-arm-mptimer$(EXESUF): tests/test-arm-mptimer.o
 tests/test-qapi-util$(EXESUF): tests/test-qapi-util.o $(test-util-obj-y)
+tests/numa-test$(EXESUF): tests/numa-test.o
 
 tests/migration/stress$(EXESUF): tests/migration/stress.o
 	$(call quiet-command, $(LINKPROG) -static -O3 $(PTHREAD_LIB) -o $@ $< ,"LINK","$(TARGET_DIR)$@")
diff --git a/tests/numa-test.c b/tests/numa-test.c
new file mode 100644
index 0000000..f5da0c8
--- /dev/null
+++ b/tests/numa-test.c
@@ -0,0 +1,106 @@
+/*
+ * NUMA configuration test cases
+ *
+ * Copyright (c) 2017 Red Hat Inc.
+ * Authors:
+ *  Igor Mammedov <imammedo@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+static char *make_cli(const char *generic_cli, const char *test_cli)
+{
+    return g_strdup_printf("%s %s", generic_cli ? generic_cli : "", test_cli);
+}
+
+static char *hmp_info_numa(void)
+{
+    QDict *resp;
+    char *s;
+
+    resp = qmp("{ 'execute': 'human-monitor-command', 'arguments': "
+                      "{ 'command-line': 'info numa '} }");
+    g_assert(resp);
+    g_assert(qdict_haskey(resp, "return"));
+    s = g_strdup(qdict_get_str(resp, "return"));
+    g_assert(s);
+    QDECREF(resp);
+    return s;
+}
+
+static void test_mon_explicit(const void *data)
+{
+    char *s;
+    char *cli;
+
+    cli = make_cli(data, "-smp 8 "
+                   "-numa node,nodeid=0,cpus=0-3 "
+                   "-numa node,nodeid=1,cpus=4-7 ");
+    qtest_start(cli);
+
+    s = hmp_info_numa();
+    g_assert(strstr(s, "node 0 cpus: 0 1 2 3"));
+    g_assert(strstr(s, "node 1 cpus: 4 5 6 7"));
+    g_free(s);
+
+    qtest_end();
+    g_free(cli);
+}
+
+static void test_mon_default(const void *data)
+{
+    char *s;
+    char *cli;
+
+    cli = make_cli(data, "-smp 8 -numa node -numa node");
+    qtest_start(cli);
+
+    s = hmp_info_numa();
+    g_assert(strstr(s, "node 0 cpus: 0 2 4 6"));
+    g_assert(strstr(s, "node 1 cpus: 1 3 5 7"));
+    g_free(s);
+
+    qtest_end();
+    g_free(cli);
+}
+
+static void test_mon_partial(const void *data)
+{
+    char *s;
+    char *cli;
+
+    cli = make_cli(data, "-smp 8 "
+                   "-numa node,nodeid=0,cpus=0-1 "
+                   "-numa node,nodeid=1,cpus=4-5 ");
+    qtest_start(cli);
+
+    s = hmp_info_numa();
+    g_assert(strstr(s, "node 0 cpus: 0 1 2 3 6 7"));
+    g_assert(strstr(s, "node 1 cpus: 4 5"));
+    g_free(s);
+
+    qtest_end();
+    g_free(cli);
+}
+
+int main(int argc, char **argv)
+{
+    const char *args = NULL;
+    const char *arch = qtest_get_arch();
+
+    if (strcmp(arch, "aarch64") == 0) {
+        args = "-machine virt";
+    }
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_data_func("/numa/mon/default", args, test_mon_default);
+    qtest_add_data_func("/numa/mon/cpus/explicit", args, test_mon_explicit);
+    qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial);
+
+    return g_test_run();
+}
-- 
2.7.4

