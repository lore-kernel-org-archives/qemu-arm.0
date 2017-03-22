Received: by 10.25.15.230 with SMTP id 99csp257821lfp;
        Wed, 22 Mar 2017 06:35:44 -0700 (PDT)
X-Received: by 10.55.24.154 with SMTP id 26mr6321220qky.31.1490189744634;
        Wed, 22 Mar 2017 06:35:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1si1086678qkh.324.2017.03.22.06.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Mar 2017 06:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqgQS-0000wm-23
	for alex.bennee@linaro.org; Wed, 22 Mar 2017 09:35:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgNq-0006wJ-KC
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:33:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqgNp-0001ix-OX
	for qemu-arm@nongnu.org; Wed, 22 Mar 2017 09:33:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cqgNp-0001ii-IN; Wed, 22 Mar 2017 09:33:01 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87C9580482;
	Wed, 22 Mar 2017 13:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 87C9580482
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 87C9580482
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C6286046C;
	Wed, 22 Mar 2017 13:32:59 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 Mar 2017 14:32:29 +0100
Message-Id: <1490189568-167621-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 22 Mar 2017 13:33:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.10 04/23] hw/arm/virt: explicitly allocate
 cpu_index for cpus
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
X-TUID: tCV7dYLCPr9a

Currently cpu_index is implicitly auto assigned during
cpu.realize() time cpu_exec_realizefn()->cpu_list_add().

It happens to match index in possible_cpus so take
control over it and make board initialize cpu_index
to possible_cpus index explicitly. It will at least
document that board is in control of it and when
'-device cpu' support comes it will keep cpu_index
stable regardless of order cpus are created so it won't
break migration.
Within this series it will be used for internal
conversion from storing cpu_index based NUMA node
bitmaps to property based mapping with possible_cpus,
And will allow map cpu_index to a CPU entry in
possible_cpus array.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4de46b1..0cbcbc1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1364,6 +1364,7 @@ static void machvirt_init(MachineState *machine)
     mc->possible_cpu_arch_ids(machine);
     for (n = 0; n < machine->possible_cpus->len; n++) {
         Object *cpuobj;
+        CPUState *cs;
 
         if (n >= smp_cpus) {
             break;
@@ -1373,6 +1374,9 @@ static void machvirt_init(MachineState *machine)
         object_property_set_int(cpuobj, machine->possible_cpus->cpus[n].arch_id,
                                 "mp-affinity", NULL);
 
+        cs = CPU(cpuobj);
+        cs->cpu_index = n;
+
         if (!vms->secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
         }
-- 
2.7.4

