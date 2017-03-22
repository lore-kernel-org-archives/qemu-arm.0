Received: by 10.25.15.230 with SMTP id 99csp260024lfp;
        Wed, 22 Mar 2017 06:41:08 -0700 (PDT)
X-Received: by 10.55.151.199 with SMTP id z190mr30984261qkd.138.1490190068761;
        Wed, 22 Mar 2017 06:41:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d203si1111345qkc.148.2017.03.22.06.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Mar 2017 06:41:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqgVg-0005b0-6M
	for alex.bennee@linaro.org; Wed, 22 Mar 2017 09:41:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgPG-0008Gw-IJ
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:34:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgPF-000276-MQ
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:34:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50882)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cqgPF-00026u-EK; Wed, 22 Mar 2017 09:34:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DA6183F43;
	Wed, 22 Mar 2017 13:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5DA6183F43
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5DA6183F43
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 661D118A50;
	Wed, 22 Mar 2017 13:34:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 Mar 2017 14:32:40 +0100
Message-Id: <1490189568-167621-16-git-send-email-imammedo@redhat.com>
In-Reply-To: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 22 Mar 2017 13:34:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.10 15/23] QMP: include
 CpuInstanceProperties into query_cpus output output
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
X-TUID: 3sEhjcYdrY6O

if board supports CpuInstanceProperties, report them for
each CPU thread listed. Main motivation for this is to
provide these properties introspection via QMP interface
for using in test cases to verify numa node to cpu mapping,
which includes not only boards that support cpu hotplug
and have this info in query-hotpluggable-cpus (pc/spapr)
but also for boards that don't not support hotpluggable-cpus
but support numa mapping (virt-arm).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 cpus.c           | 9 +++++++++
 qapi-schema.json | 6 +++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index 167d961..03aa12c 100644
--- a/cpus.c
+++ b/cpus.c
@@ -50,6 +50,7 @@
 #include "qapi-event.h"
 #include "hw/nmi.h"
 #include "sysemu/replay.h"
+#include "hw/boards.h"
 
 #ifdef CONFIG_LINUX
 
@@ -1810,6 +1811,8 @@ void list_cpus(FILE *f, fprintf_function cpu_fprintf, const char *optarg)
 
 CpuInfoList *qmp_query_cpus(Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     CpuInfoList *head = NULL, *cur_item = NULL;
     CPUState *cpu;
 
@@ -1860,6 +1863,12 @@ CpuInfoList *qmp_query_cpus(Error **errp)
 #else
         info->value->arch = CPU_INFO_ARCH_OTHER;
 #endif
+        if ((info->value->has_props = !!mc->cpu_index_to_instance_props)) {
+            CpuInstanceProperties *props;
+            props = g_malloc0(sizeof(*props));
+            *props = mc->cpu_index_to_instance_props(ms, cpu->cpu_index);
+            info->value->props =  props;
+        }
 
         /* XXX: waiting for the qapi to support GSList */
         if (!cur_item) {
diff --git a/qapi-schema.json b/qapi-schema.json
index 68a4327..a6b5955 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1322,6 +1322,9 @@
 #
 # @thread_id: ID of the underlying host thread
 #
+# @props: properties describing to which node/socket/core/thread
+#         virtual CPU belongs to, provided if supported by board (since 2.10)
+#
 # @arch: architecture of the cpu, which determines which additional fields
 #        will be listed (since 2.6)
 #
@@ -1332,7 +1335,8 @@
 ##
 { 'union': 'CpuInfo',
   'base': {'CPU': 'int', 'current': 'bool', 'halted': 'bool',
-           'qom_path': 'str', 'thread_id': 'int', 'arch': 'CpuInfoArch' },
+           'qom_path': 'str', 'thread_id': 'int',
+           '*props': 'CpuInstanceProperties', 'arch': 'CpuInfoArch' },
   'discriminator': 'arch',
   'data': { 'x86': 'CpuInfoX86',
             'sparc': 'CpuInfoSPARC',
-- 
2.7.4

