Received: by 10.25.0.6 with SMTP id 6csp1895072lfa;
        Tue, 30 May 2017 09:25:10 -0700 (PDT)
X-Received: by 10.233.221.129 with SMTP id r123mr22287418qkf.36.1496161510561;
        Tue, 30 May 2017 09:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496161510; cv=none;
        d=google.com; s=arc-20160816;
        b=v/uJZCeSLzrW104uLUUAxglslQ1SxvlhdxwyfAljM7QgkbPDzw3iTw3pqEhb4lirld
         s/QgRRMNlETH8F3eAkxzOPYAjWkHEv7veMAxJHi3hhQNK3FsJYjTCK2G9iIJRKgV5ofY
         ZSl2YQn5Zi2RUrk/ajUTUFdBoy9GwUupj/xkZ/p6/9mbihrrbic3o8Vj9zLPFh/2YIc7
         W5CSF9GEh4glMSq1rtkECcJpoK4Yl+mZPXNhOOoiCoAlZIOSPSf6OYsWMuVd60NyHvLf
         ftyjD+NwN0JuatUSTtb5HLkZZ6ce6jU40yoLa1CVBD+LarH8U4t1ggOzxBjAAskCQxrv
         MsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=g6NEtn+ib4uxSTUw+WqqysxpQ6fkwDvbTNH7mRBMyXk=;
        b=ISrOZtWKTNFYwd7pAhu19vsWiFcuCzLTjQKgEoc+lnwlKreHG34hHwsDyNAJdDgphB
         amf0mJfZFMcfya2ju/0X2a+OBq7ihwTs2RUlqjuzU+YR5glOgct7vLtvPZ+W7KL/b5wd
         fDcR0iaL6KRtx8mEVqmQ8S/PDBWAlxdR0KNfqa9on50jwQiopCkOHIWvubPV4dO/2ogp
         YgTjP7G0VmNRo8dzGBERnv076v+zBcWuo8MJubC3JBgWdm9vUtVn+Tq/yVpKjC8qvq48
         WjmwuqA+d7nOylhHMqwpuLh5JcAOuSZ/3t79pWggJtqBc8BAAEEY4IUqzcmhqR/aEvvQ
         kybQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k125si13195309qkf.224.2017.05.30.09.25.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 09:25:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFjxF-0006bc-W4
	for alex.bennee@linaro.org; Tue, 30 May 2017 12:25:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFjwV-000613-MS
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFjwU-00059W-P2
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:24:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44530)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFjwU-00058x-IN; Tue, 30 May 2017 12:24:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89CD0C049E32;
	Tue, 30 May 2017 16:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 89CD0C049E32
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 89CD0C049E32
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C41B4171A0;
	Tue, 30 May 2017 16:24:17 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 May 2017 18:24:01 +0200
Message-Id: <1496161442-96665-7-git-send-email-imammedo@redhat.com>
In-Reply-To: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 30 May 2017 16:24:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 6/7] spapr: cleanup spapr_fixup_cpu_numa_dt()
 usage
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DERkfkgpHxEZ

even though spapr_fixup_cpu_numa_dt() has no effect on FDT
if numa is disabled, don't call it uselessly. It makes it
obvious at call sites that function is need only when numa
is enabled.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/ppc/spapr.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 34bb03d..96a2a74 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -178,10 +178,8 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int offset, PowerPCCPU *cpu,
     return ret;
 }
 
-static int spapr_fixup_cpu_numa_dt(void *fdt, int offset, CPUState *cs)
+static int spapr_fixup_cpu_numa_dt(void *fdt, int offset, PowerPCCPU *cpu)
 {
-    int ret = 0;
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
     int index = ppc_get_vcpu_dt_id(cpu);
     uint32_t associativity[] = {cpu_to_be32(0x5),
                                 cpu_to_be32(0x0),
@@ -191,12 +189,8 @@ static int spapr_fixup_cpu_numa_dt(void *fdt, int offset, CPUState *cs)
                                 cpu_to_be32(index)};
 
     /* Advertise NUMA via ibm,associativity */
-    if (nb_numa_nodes > 1) {
-        ret = fdt_setprop(fdt, offset, "ibm,associativity", associativity,
+    return fdt_setprop(fdt, offset, "ibm,associativity", associativity,
                           sizeof(associativity));
-    }
-
-    return ret;
 }
 
 /* Populate the "ibm,pa-features" property */
@@ -321,9 +315,11 @@ static int spapr_fixup_cpu_dt(void *fdt, sPAPRMachineState *spapr)
             return ret;
         }
 
-        ret = spapr_fixup_cpu_numa_dt(fdt, offset, cs);
-        if (ret < 0) {
-            return ret;
+        if (nb_numa_nodes > 1) {
+            ret = spapr_fixup_cpu_numa_dt(fdt, offset, cpu);
+            if (ret < 0) {
+                return ret;
+            }
         }
 
         ret = spapr_fixup_cpu_smt_dt(fdt, offset, cpu, compat_smt);
@@ -538,7 +534,9 @@ static void spapr_populate_cpu_dt(CPUState *cs, void *fdt, int offset,
     _FDT((fdt_setprop(fdt, offset, "ibm,pft-size",
                       pft_size_prop, sizeof(pft_size_prop))));
 
-    _FDT(spapr_fixup_cpu_numa_dt(fdt, offset, cs));
+    if (nb_numa_nodes > 1) {
+        _FDT(spapr_fixup_cpu_numa_dt(fdt, offset, cpu));
+    }
 
     _FDT(spapr_fixup_cpu_smt_dt(fdt, offset, cpu, compat_smt));
 
-- 
2.7.4

