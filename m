Received: by 10.25.0.6 with SMTP id 6csp238987lfa;
        Wed, 10 May 2017 04:33:13 -0700 (PDT)
X-Received: by 10.237.37.55 with SMTP id v52mr5316329qtc.31.1494415993760;
        Wed, 10 May 2017 04:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494415993; cv=none;
        d=google.com; s=arc-20160816;
        b=USqXI9whQfxpvTBRvuKW7wtiQMvNIqj9O9i4cqv1Qa6/+Ljcgzqli9FPzhROsew1gV
         0GZXF/uMnrBO4aIWa1ZW5s1/Heuc1ju1D3zQpjertNkOa/r1AHiKTb85DL91kGle/3Rl
         dcPVYZcxY+7oG0Xt1jWqjI7//gnhOXr/oJB7Nt95y9ME84mT5XsKrojTXzW8hts5wxLm
         meyjVi1hI/H+erYrtD8bWNSrGwHJ7iK359odAajdU67YQC8gu3fIll1fwC32bqJTRH0Q
         7/pcEdfhgeIkdYmedCD6RxHcKLM/KnOHoFOTlF7TR+JcrD1ww5BsVjf3I+NALlKWuH/4
         OFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=Cbaf7WOGELf5SDedb22RUkJcED/w/lLCtPp8aQI/nu8=;
        b=rJw+X2iuVQ+YxCxXYAMhxDJtHzAwAq5NF7lX+T3+q9yg4MoE6tHK1tvgLPjdlOKbUD
         WncZ4X1iCFPHWVMfyl/iyZTsGoS4wCgyZJwG+HaYkzgurCAT5ax+QxvZ4VZJVN3U6R8i
         TXCaZ50bB2eyfaUykk2buf1nWSJIJMLZO5pvFtJpFZdcVIKmMkh1zaAUFYPWgjOziTa5
         +n9sHWozF8M+KcXOuOsy4HjXPMKGy02LONE1slmQRQ5yIc/fb/5SLKUovb26e3SWUInU
         LOUbaYr05MYo8gtgfXO70G2YToRg5e3eG/TF+xDm7tn5oFnYWi7Tdgs4L8LLBXA9SFiE
         iWaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l128si2816386qkd.276.2017.05.10.04.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Prl-0001gl-4X
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:33:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Pp6-0007Zd-5U
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Pp0-0001hR-9A
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35090)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8Pp0-0001h4-30; Wed, 10 May 2017 07:30:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02163C059738;
	Wed, 10 May 2017 11:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 02163C059738
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 02163C059738
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED2947DFF5;
	Wed, 10 May 2017 11:30:18 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:48 +0200
Message-Id: <1494415802-227633-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 10 May 2017 11:30:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 04/18] virt-arm: add node-id property to CPU
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
X-TUID: qUrAxNugkk9o

it will allow switching from cpu_index to property based
numa mapping in follow up patches.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c    | 15 +++++++++++++++
 target/arm/cpu.c |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dfd6fd4..653b4d7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1350,6 +1350,7 @@ static void machvirt_init(MachineState *machine)
     for (n = 0; n < possible_cpus->len; n++) {
         Object *cpuobj;
         CPUState *cs;
+        int node_id;
 
         if (n >= smp_cpus) {
             break;
@@ -1362,6 +1363,20 @@ static void machvirt_init(MachineState *machine)
         cs = CPU(cpuobj);
         cs->cpu_index = n;
 
+        node_id = numa_get_node_for_cpu(cs->cpu_index);
+        if (node_id == nb_numa_nodes) {
+            /* by default CPUState::numa_node was 0 if it's not set via CLI
+             * keep it this way for now but in future we probably should
+             * refuse to start up with incomplete numa mapping */
+             node_id = 0;
+        }
+        if (cs->numa_node == CPU_UNSET_NUMA_NODE_ID) {
+            cs->numa_node = node_id;
+        } else {
+            /* CPU isn't device_add compatible yet, this shouldn't happen */
+            error_setg(&error_abort, "user set node-id not implemented");
+        }
+
         if (!vms->secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
         }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ee1406d..c185eb1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1573,6 +1573,7 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
                         mp_affinity, ARM64_AFFINITY_INVALID),
+    DEFINE_PROP_INT32("node-id", CPUState, numa_node, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.7.4

