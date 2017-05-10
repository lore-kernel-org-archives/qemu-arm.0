Received: by 10.25.0.6 with SMTP id 6csp237694lfa;
        Wed, 10 May 2017 04:30:39 -0700 (PDT)
X-Received: by 10.55.42.220 with SMTP id q89mr4698300qkq.211.1494415839324;
        Wed, 10 May 2017 04:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494415839; cv=none;
        d=google.com; s=arc-20160816;
        b=rBx11YaxmyKR493fiwljON8UY6Ti8bHJVmS/UzIiCt800XInqUhqTCA4JkNZ74GBtq
         hWCIEeF/+473ovJMYwoY6B8poCOlJPFlyD+vzRkCtbKQY8LS9iaA0Wu4odDxJw8x/r8/
         6DiyWbsnO0CD55DB2lufQDduoCe3WcvtJgclvpaxBpoDGffPMOwtzJ0Jlou4qFckM7jz
         o9f/vvNRME6mF04heddSy6HWoW/RQ8T2Galj+0UIYpgDF9xKNF6ywcPzziEcedRBTqkJ
         4IlWkd2pvd9+rIabixfoNNscFdnLhvkZcfKOeBBSKwaIartV6AX/NNqec2IcLiP34yRT
         DjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=t7Sh2C6MGUk8nf1MGdlziSBPSDKuCcBaazEOcA17t1c=;
        b=vwOSxcnUO6LJ4sp8XYncyWF0idCmPimRk+kSOwhFI59HY6f+lNPAXx/egNUyPC4Ke4
         EwRsO8aRcCgaA7m8Rd36sZLgq7kSIzcSw/Q84VGn0RK8co0rxGG0HfOFtmbQA3vOnYcp
         7BXeyRyPt4XOi6qx8apVkKd4kf75V0dO0JNAGERR01PS+t3xQ78REoTZBr9LNDfhtutE
         gKYAIRr8KnEGnn/sM/4D9rou/9EF2s5kIanRRa9/95yxykME3CCbIv8iKzYa98AUNr7X
         AELO67PapBpnxOIWN1VY+TEWmTKJABTOG7bsRhEXVnLszK4behGf6TSU28ByjTPRlRo8
         /ttg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n21si2933532qka.193.2017.05.10.04.30.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:30:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8PpG-0007ZK-Nk
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:30:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Pp3-0007XH-JM
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Pp2-0001i5-JG
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59582)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8Pp2-0001hp-AK; Wed, 10 May 2017 07:30:24 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E47D80C0B;
	Wed, 10 May 2017 11:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3E47D80C0B
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3E47D80C0B
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 48BEB7DFF5;
	Wed, 10 May 2017 11:30:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:49 +0200
Message-Id: <1494415802-227633-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 10 May 2017 11:30:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 05/18] numa: add check that board supports
 cpu_index to node mapping
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
X-TUID: XpPCFw/gpzc1

Default node mapping initialization already checks that board
supports cpu_index to node mapping and refuses to start if
it's not supported. Do the same for explicitly provided
mapping "-numa node,cpus=..."

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
v3:
  - amend erre msg to print:
     "NUMA is not supported by this machine-type"
   (Eduardo)
---
 numa.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/numa.c b/numa.c
index bcdfca2..7182481 100644
--- a/numa.c
+++ b/numa.c
@@ -141,10 +141,12 @@ uint32_t numa_get_node(ram_addr_t addr, Error **errp)
     return -1;
 }
 
-static void parse_numa_node(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
+static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
+                            QemuOpts *opts, Error **errp)
 {
     uint16_t nodenr;
     uint16List *cpus = NULL;
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
 
     if (node->has_nodeid) {
         nodenr = node->nodeid;
@@ -163,6 +165,10 @@ static void parse_numa_node(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
         return;
     }
 
+    if (!mc->cpu_index_to_instance_props) {
+        error_report("NUMA is not supported by this machine-type");
+        exit(1);
+    }
     for (cpus = node->cpus; cpus; cpus = cpus->next) {
         if (cpus->value >= max_cpus) {
             error_setg(errp,
@@ -253,6 +259,7 @@ static void parse_numa_distance(NumaDistOptions *dist, Error **errp)
 static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
 {
     NumaOptions *object = NULL;
+    MachineState *ms = opaque;
     Error *err = NULL;
 
     {
@@ -267,7 +274,7 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
 
     switch (object->type) {
     case NUMA_OPTIONS_TYPE_NODE:
-        parse_numa_node(&object->u.node, opts, &err);
+        parse_numa_node(ms, &object->u.node, opts, &err);
         if (err) {
             goto end;
         }
@@ -452,7 +459,7 @@ void parse_numa_opts(MachineState *ms)
         numa_info[i].node_cpu = bitmap_new(max_cpus);
     }
 
-    if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, NULL, NULL)) {
+    if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, NULL)) {
         exit(1);
     }
 
-- 
2.7.4

