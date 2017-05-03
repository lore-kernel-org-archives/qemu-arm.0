Received: by 10.25.0.198 with SMTP id 189csp89694lfa;
        Wed, 3 May 2017 06:06:04 -0700 (PDT)
X-Received: by 10.237.36.105 with SMTP id s38mr33929626qtc.185.1493816764112;
        Wed, 03 May 2017 06:06:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f131si1678275qkb.116.2017.05.03.06.06.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 06:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5tyl-0006sG-Fp
	for alex.bennee@linaro.org; Wed, 03 May 2017 09:06:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5trB-00007I-4n
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tr8-00014t-Hv
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:58:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5tr8-000143-93; Wed, 03 May 2017 08:58:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C106C054C52;
	Wed,  3 May 2017 12:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1C106C054C52
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1C106C054C52
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D41F617C5A;
	Wed,  3 May 2017 12:58:06 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 May 2017 14:57:10 +0200
Message-Id: <1493816238-33120-17-git-send-email-imammedo@redhat.com>
In-Reply-To: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 03 May 2017 12:58:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 16/24] QMP: include CpuInstanceProperties into
 query_cpus output output
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
X-TUID: XhcX9slZCMbc

if board supports CpuInstanceProperties, report them for
each CPU thread listed. Main motivation for this is to
provide these properties introspection via QMP interface
for using in test cases to verify numa node to cpu mapping,
which includes not only boards that support cpu hotplug
and have this info in query-hotpluggable-cpus (pc/spapr)
but also for boards that don't not support hotpluggable-cpus
but support numa mapping (virt-arm).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
v2:
  * fix checkpatch error and remove extra space after = (Eric)
---
 cpus.c           | 10 ++++++++++
 qapi-schema.json |  6 +++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index 740b8dc..4f91d25 100644
--- a/cpus.c
+++ b/cpus.c
@@ -50,6 +50,7 @@
 #include "qapi-event.h"
 #include "hw/nmi.h"
 #include "sysemu/replay.h"
+#include "hw/boards.h"
 
 #ifdef CONFIG_LINUX
 
@@ -1859,6 +1860,8 @@ void list_cpus(FILE *f, fprintf_function cpu_fprintf, const char *optarg)
 
 CpuInfoList *qmp_query_cpus(Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     CpuInfoList *head = NULL, *cur_item = NULL;
     CPUState *cpu;
 
@@ -1909,6 +1912,13 @@ CpuInfoList *qmp_query_cpus(Error **errp)
 #else
         info->value->arch = CPU_INFO_ARCH_OTHER;
 #endif
+        info->value->has_props = !!mc->cpu_index_to_instance_props;
+        if (info->value->has_props) {
+            CpuInstanceProperties *props;
+            props = g_malloc0(sizeof(*props));
+            *props = mc->cpu_index_to_instance_props(ms, cpu->cpu_index);
+            info->value->props = props;
+        }
 
         /* XXX: waiting for the qapi to support GSList */
         if (!cur_item) {
diff --git a/qapi-schema.json b/qapi-schema.json
index 01b087f..76d137d 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1325,6 +1325,9 @@
 #
 # @thread_id: ID of the underlying host thread
 #
+# @props: properties describing to which node/socket/core/thread
+#         virtual CPU belongs to, provided if supported by board (since 2.10)
+#
 # @arch: architecture of the cpu, which determines which additional fields
 #        will be listed (since 2.6)
 #
@@ -1335,7 +1338,8 @@
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

