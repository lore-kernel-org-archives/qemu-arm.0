Received: by 10.25.0.144 with SMTP id 138csp186829lfa;
        Fri, 14 Apr 2017 01:40:45 -0700 (PDT)
X-Received: by 10.200.38.146 with SMTP id 18mr6989749qto.123.1492159245446;
        Fri, 14 Apr 2017 01:40:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z14si1237608qtb.78.2017.04.14.01.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Apr 2017 01:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cywma-0000gE-SY
	for alex.bennee@linaro.org; Fri, 14 Apr 2017 04:40:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cywjW-0006ic-0E
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 04:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cywjU-0008Mn-WE
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 04:37:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33504)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1cywjU-0008Kk-QA; Fri, 14 Apr 2017 04:37:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C083804FE;
	Fri, 14 Apr 2017 08:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0C083804FE
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0C083804FE
Received: from thinkpad.redhat.com (ovpn-116-243.ams2.redhat.com
	[10.36.116.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9471D60A99;
	Fri, 14 Apr 2017 08:37:24 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Apr 2017 10:37:15 +0200
Message-Id: <20170414083717.13641-3-lvivier@redhat.com>
In-Reply-To: <20170414083717.13641-1-lvivier@redhat.com>
References: <20170414083717.13641-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 14 Apr 2017 08:37:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/4] ppc: remove
 cannot_destroy_with_object_finalize_yet
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
Cc: Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w4lOBweSxpL3

This removes the assert(kvm_enabled()) from kvmppc_host_cpu_initfn()

This assert can never be triggered as the function is only registered
when KVM is available (see also 4c315c2
"qdev: Protect device-list-properties against broken devices").

So we can remove the cannot_destroy_with_object_finalize_yet from
kvmppc_host_cpu_class_init() without fear and beyond reproach.
(as it has already be done for i386 with 771a13e "i386: Unset
cannot_destroy_with_object_finalize_yet on "host" model" and
e435601 "target-i386: Remove assert(kvm_enabled()) from
host_x86_cpu_initfn()")

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 target/ppc/kvm.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 9f1f132..64017ac 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2245,14 +2245,8 @@ static void alter_insns(uint64_t *word, uint64_t flags, bool on)
     }
 }
 
-static void kvmppc_host_cpu_initfn(Object *obj)
-{
-    assert(kvm_enabled());
-}
-
 static void kvmppc_host_cpu_class_init(ObjectClass *oc, void *data)
 {
-    DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
     uint32_t vmx = kvmppc_get_vmx();
     uint32_t dfp = kvmppc_get_dfp();
@@ -2279,9 +2273,6 @@ static void kvmppc_host_cpu_class_init(ObjectClass *oc, void *data)
     if (icache_size != -1) {
         pcc->l1_icache_size = icache_size;
     }
-
-    /* Reason: kvmppc_host_cpu_initfn() dies when !kvm_enabled() */
-    dc->cannot_destroy_with_object_finalize_yet = true;
 }
 
 bool kvmppc_has_cap_epr(void)
@@ -2333,7 +2324,6 @@ static int kvm_ppc_register_host_cpu_type(void)
 {
     TypeInfo type_info = {
         .name = TYPE_HOST_POWERPC_CPU,
-        .instance_init = kvmppc_host_cpu_initfn,
         .class_init = kvmppc_host_cpu_class_init,
     };
     PowerPCCPUClass *pvr_pcc;
-- 
2.9.3

