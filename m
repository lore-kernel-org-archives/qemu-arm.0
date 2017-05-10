Received: by 10.25.0.6 with SMTP id 6csp239354lfa;
        Wed, 10 May 2017 04:33:54 -0700 (PDT)
X-Received: by 10.55.170.15 with SMTP id t15mr4583719qke.303.1494416034508;
        Wed, 10 May 2017 04:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416034; cv=none;
        d=google.com; s=arc-20160816;
        b=ot3TdGF+q/Bn1EFx+HX9k8G+QszT3oq8ZB0tFathTAdfDBXL+4AGniJ/azYdrro9Q8
         hRaq8lHYbQ9tX5e0z7qKhglqR6wpP7CLktQsTK1lZQcljPWCkR+AO+vc7B+Usrawz/fX
         a4wDzD07vz5ZhhDcErxeZW48AowT+gF32S1jq9QctFR74O/zmiaZmYKZwIpjF+O3xHgp
         S6ePFYDXlaSMV0INy1ZP+otWG+bZ/a18SfnFWIqJQhNw9yO06LGsN0E8lGEoE0IbnvbW
         EQ0kW4nlQ8fc/0uIwAFqFgDh6GEap0GMMajbi9OR9cmc0tGNB9Ehj8veQmPTN+M9W8/P
         CmQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=eE2EIV07uZbvh0EjZKEg9No/xf1qJKm1Eh6n5VmV0Vs=;
        b=wE8iEdLfNDCH9FLFax5K6/y+INH26u5TQEoV6TaYpM/ELeAkAvvLzhU9OPp56IBKy2
         m6tsyQ3To8FwZlD5XeSl6063LWEsyz5uoJj+YTUBLk/eCTBfO/NieldUzyf3bVZ/Pa+l
         z8M1JqQvJv822pPoRUT+kHAlKTwZC1Tput23F7bBdPMmR7cJbEyhCSk6m7jHgXC+4Sn7
         TAqFPA4yWntPJ5QMRKSuICbsFrAB3oaXkUVtO8iNCW8NDq0v54uPZkEtCf9/rDm8BKnZ
         IQ5np5aR2hDLi1vKflEl6G9naiWbVCU8zFIY6w40FApZysRDNp4ihWjXjNVvkIyszBNq
         h9hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 26si3224922qkt.215.2017.05.10.04.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:33:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8PsP-0002D5-Q5
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:33:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Pp7-0007an-V2
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Pp7-0001jw-0e
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49594)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8Pp6-0001jV-R0; Wed, 10 May 2017 07:30:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACB0280F91;
	Wed, 10 May 2017 11:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ACB0280F91
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com ACB0280F91
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB9527DFF5;
	Wed, 10 May 2017 11:30:25 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:51 +0200
Message-Id: <1494415802-227633-8-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 10 May 2017 11:30:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 07/18] numa: do default mapping based on
 possible_cpus instead of node_cpu bitmaps
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
X-TUID: yMOtA6hjjbrz

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 numa.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/numa.c b/numa.c
index 7db5dde..c89fc2d 100644
--- a/numa.c
+++ b/numa.c
@@ -458,6 +458,7 @@ void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
 void parse_numa_opts(MachineState *ms)
 {
     int i;
+    const CPUArchIdList *possible_cpus;
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
     for (i = 0; i < MAX_NODES; i++) {
@@ -519,18 +520,21 @@ void parse_numa_opts(MachineState *ms)
 
         numa_set_mem_ranges();
 
-        for (i = 0; i < nb_numa_nodes; i++) {
-            if (!bitmap_empty(numa_info[i].node_cpu, max_cpus)) {
-                break;
-            }
-        }
-
         /* assign CPUs to nodes using board provided default mapping */
-        if (!mc->cpu_index_to_instance_props) {
+        if (!mc->cpu_index_to_instance_props || !mc->possible_cpu_arch_ids) {
             error_report("default CPUs to NUMA node mapping isn't supported");
             exit(1);
         }
-        if (i == nb_numa_nodes) {
+
+        possible_cpus = mc->possible_cpu_arch_ids(ms);
+        for (i = 0; i < possible_cpus->len; i++) {
+            if (possible_cpus->cpus[i].props.has_node_id) {
+                break;
+            }
+        }
+
+        /* no CPUs are assigned to NUMA nodes */
+        if (i == possible_cpus->len) {
             for (i = 0; i < max_cpus; i++) {
                 CpuInstanceProperties props;
                 /* fetch default mapping from board and enable it */
-- 
2.7.4

