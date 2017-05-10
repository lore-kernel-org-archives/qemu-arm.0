Received: by 10.25.0.6 with SMTP id 6csp239723lfa;
        Wed, 10 May 2017 04:34:39 -0700 (PDT)
X-Received: by 10.55.136.3 with SMTP id k3mr4609723qkd.283.1494416079371;
        Wed, 10 May 2017 04:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416079; cv=none;
        d=google.com; s=arc-20160816;
        b=dopaHbdbNRuytjuS79HLD7vMIVDEz94nNP6O583A4opIAIOTOGUAeHLV5EGyHvf9iR
         uGP22MmVdn1nXZgML5hQddyWIQKy9PF308tLoENn5Giz3Trqq2VuAsT/6O2419fA4evR
         W+GryV18epnFp9cM+pBL7FXLXi/paihgEIGdjBg7maNUpU185jHxBNqPXPW18e167Za7
         5jZqVfCdVATc438f0HBitLYmnBukpREN2h5KqQ+5ZAJ8bvd0hnNoep4cTJcQprGQDSmV
         TPTaxd6XizSftf144pLjKKiw9odI1R8FB+0K0sY3LwcaFyV+8B6sjNcpWCc+hrvtoDqz
         UwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=psJBJFSShvAJHj3Pg5hEkiN+noOIyqeJaqyCIRUxCPs=;
        b=tJXzmGj9W49DNVrLJcfLQgYlXxkCz3w8M/3iGpannOgC/GZ6kZUW/kgEQpoTg5ELaU
         U+Qi01Ak4UdBTE5h+YU1dMPrb3GqrgIuav1gJJb11SmjWszAhZ+4xyZkpKZcZ81HV2Zb
         ZDQohHm8qqIfbUeU5Pq1UbCkXWdEev6BHdq8pGxyr1dbLFjKgrbSczMgMmgBwG0VqbpB
         HkmAvtNIFTeN9ALGJnmkOVLvTCPEjLEh+xT+IfuM7CoJClqQjf74TG4cMQFg8qwlAzqG
         XMCySKS9a4e4h0MAkWs9EaxzHAnjJ+qmU3n5FSvsOA3g4qR/9orA7a7kGptXtr/0D1bp
         jxnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k18si2844625qtc.300.2017.05.10.04.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:34:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Pt8-0002pw-OC
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:34:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpG-0007ka-PW
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpF-0001n5-Vf
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8PpF-0001mq-NM; Wed, 10 May 2017 07:30:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98A2037EEF;
	Wed, 10 May 2017 11:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 98A2037EEF
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 98A2037EEF
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A78967DFF5;
	Wed, 10 May 2017 11:30:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:55 +0200
Message-Id: <1494415802-227633-12-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 10 May 2017 11:30:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 11/18] QMP: include CpuInstanceProperties into
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
X-TUID: cz1DBt/GNOKS

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
index bf48873..f1bcebe 100644
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

