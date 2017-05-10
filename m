Received: by 10.25.0.6 with SMTP id 6csp237752lfa;
        Wed, 10 May 2017 04:30:45 -0700 (PDT)
X-Received: by 10.237.59.204 with SMTP id s12mr5225192qte.274.1494415843789;
        Wed, 10 May 2017 04:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494415840; cv=none;
        d=google.com; s=arc-20160816;
        b=Lo+FJicZ+Bovq9tnTnpvTiDi45sF2U7jcEHE05ssKogU2gttSVAOht7hSdVbxaBrqZ
         7lbapAW6qdfk+kon16i/5qO0B6oeOfpWOXrfyRAgJzabBgpZ52cNY99JH7axnfnrBJI4
         czB6NbQmYrrViXyrmsoe1DDkHvuMEnh1BnS79uAq1Q6Tp9PIffM5pq8wcmyqg3KQiqSN
         EE83i2/fQrM4ltHeetnUI4jkAuN6BGwhusiWUE7RWbj89H4PUXGYWqzJYamNWNhvewvy
         JjSTmDwZTUEUTGo79SMla4zedclLSby0a1/QtRQA41MMIIJ2UfV4+3sY8wGTSxKWNvtf
         hH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=89cBd8IdMWpHCK2SyaA5fg1r0u2mpFHzl9MvGSKKKAQ=;
        b=cj7tjk6w7qD03WE/HScQnY7DHELbpONMAliP5xwFaL3QjgBHtw8wtIrJQK2mUHb0mj
         R+UbKkiE5XFtFHXQMcbYDE72ctJiAb+MBat0x22BB8yR+I3ULuIFqtrrXrAC/Jq+Mw5v
         SEhu+ZHdsbtzxbjvSlFWWQ3rt/nkxTp9OKTGZqcFpszlN9Xs0o2zWEBDQWg/fRmcEw8q
         iqFhylYGthXM45FDFxoUQCgen62X8Eoi+G5j2YkRDkcsAftKS4Ue4K4Tq3R7IiRXfKJK
         ZMR7aj4oSIQyfp4UEsXXDXtprFBeXR7OMnCMVDRe8nldFy3zWPWcEJnGlQ68/lK+YhlS
         1TrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v128si2765375qki.3.2017.05.10.04.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8PpH-0007ZY-VX
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:30:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Poy-0007S5-SU
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Poy-0001gd-0z
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59976)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8Pox-0001gR-OF; Wed, 10 May 2017 07:30:19 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A900461BB2;
	Wed, 10 May 2017 11:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A900461BB2
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A900461BB2
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C8B383282;
	Wed, 10 May 2017 11:30:16 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:47 +0200
Message-Id: <1494415802-227633-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 10 May 2017 11:30:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 03/18] pc: add node-id property to CPU
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
X-TUID: LbfNsvecqmZF

it will allow switching from cpu_index to property based
numa mapping in follow up patches.

PS:
patch changes default value of CPUState::numa_node from 0
to CPU_UNSET_NUMA_NODE_ID. The only place for x86 that
would affected is monitor's 'infor numa' command which
uses that field. However legacy 0 value is still preserved
by pc_cpu_pre_plug() in this patch if user/numa.c hasn't
set it explicitly, so there is no change in behavior.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c      | 17 +++++++++++++++++
 target/i386/cpu.c |  1 +
 2 files changed, 18 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 01693d5..455300f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1893,6 +1893,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
                             DeviceState *dev, Error **errp)
 {
     int idx;
+    int node_id;
     CPUState *cs;
     CPUArchId *cpu_slot;
     X86CPUTopoInfo topo;
@@ -1982,6 +1983,22 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
 
     cs = CPU(cpu);
     cs->cpu_index = idx;
+
+    node_id = numa_get_node_for_cpu(cs->cpu_index);
+    if (node_id == nb_numa_nodes) {
+        /* by default CPUState::numa_node was 0 if it's not set via CLI
+         * keep it this way for now but in future we probably should
+         * refuse to start up with incomplete numa mapping */
+        node_id = 0;
+    }
+    if (cs->numa_node == CPU_UNSET_NUMA_NODE_ID) {
+        cs->numa_node = node_id;
+    } else if (cs->numa_node != node_id) {
+            error_setg(errp, "node-id %d must match numa node specified"
+                "with -numa option for cpu-index %d",
+                cs->numa_node, cs->cpu_index);
+            return;
+    }
 }
 
 static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 13c0985..007a5bd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3982,6 +3982,7 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_INT32("core-id", X86CPU, core_id, -1),
     DEFINE_PROP_INT32("socket-id", X86CPU, socket_id, -1),
 #endif
+    DEFINE_PROP_INT32("node-id", CPUState, numa_node, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
     { .name  = "hv-spinlocks", .info  = &qdev_prop_spinlocks },
     DEFINE_PROP_BOOL("hv-relaxed", X86CPU, hyperv_relaxed_timing, false),
-- 
2.7.4

