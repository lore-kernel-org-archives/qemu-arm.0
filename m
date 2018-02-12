Received: by 10.28.71.27 with SMTP id u27csp206074wma;
        Mon, 12 Feb 2018 11:01:35 -0800 (PST)
X-Google-Smtp-Source: AH8x224HL2GI9F2U8isAkPDrpam6wx3w/T0xeUeLoIWnqbmfhFncALpWPzEgh2Zzg5M56Z52+Oh4
X-Received: by 10.13.255.193 with SMTP id p184mr3997050ywf.360.1518462095037;
        Mon, 12 Feb 2018 11:01:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462095; cv=none;
        d=google.com; s=arc-20160816;
        b=oJ7ZaVXKUBNaeRYxGMU15WpdxN8ZNAB1SGh2PREY9J+axUTLkd1u8M6bFT6gKIKq6t
         Skijt4VeCPMlOamn01dSY1SPPtq2mwr13IR+qm6DI8hE4G9Pnd/jJOuD51iqX1Fi1/IR
         wjUVMUs6JFtOnvB0p7UsBTqpyDETrdy7nhksKp1SbMgA2HkvkNTZ3s09ev5PV3UmfAor
         aDJKvz9RYl4DVwYaokM9wWOdSHK6TRBH3h8SLfllQc4u7f1wViV2q28evje5uVNR0l1K
         mOT+jEV78hlcvQOqmSACihII7o6OtbtWBo12DecqLQHZ0UtiHCL7lQtKhZIyqou3cI7Q
         XxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=7S1aO6pS2zJwkkVO4FHUVf7NXVWSoLRxFMPOGSt2w7Y=;
        b=cSS9T+Pip32GDXAeMB7lg9nXfzki65tl+vesf9NDohItBhnk4/aBWboIDab0AMqSu9
         7Z0mvEORaCFf5ph8CEt7IlHteZz5ur67AY1MjbApjzmX/Trtpzv+yi5TLoxO16iXQZ0y
         WR8e3UNtLlUhrhf797yKo4jUzwwr39gZG++e/6WM+566T7B2lCLQwr3CVVfWjqXwqWW4
         3/yDbynCQMLW7yIsdf91yBPdbeDoJhBj0gaU2J3Pm/OQ70IEVcg/aq573twpdALFAqQM
         54hndaOtoliaelBfJUkV4kNqhukH3cxCQfYZKZKKH07YvzH2UnPlrYoN+Y04jbj10Ut2
         ADyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q185si217711ybc.141.2018.02.12.11.01.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:01:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJM6-0002Hh-CW
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:01:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJJg-0008M7-VF
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJJg-0002Vh-6a
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:05 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55966 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJJg-0002Uc-2z; Mon, 12 Feb 2018 13:59:04 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7832140FB633;
	Mon, 12 Feb 2018 18:59:03 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E84531006ED7;
	Mon, 12 Feb 2018 18:58:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:05 +0000
Message-Id: <1518461904-5305-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 12 Feb 2018 18:59:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 12 Feb 2018 18:59:03 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 03/22] pc: Implement get_primary_pci_bus
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mDK6bJpS3y6D

Implement this get_primary_pci_bus() which returns the root
bus.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/i386/pc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 55e69d6..ac33ade 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2342,6 +2342,13 @@ static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
     }
 }
 
+static PCIBus *pc_machine_get_primary_pci_bus(const MachineState *ms)
+{
+    PCMachineState *pcms = PC_MACHINE(ms);
+
+    return pcms->bus;
+}
+
 static void pc_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -2381,6 +2388,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = pc_machine_device_unplug_cb;
     nc->nmi_monitor_handler = x86_nmi;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
+    mc->get_primary_pci_bus = pc_machine_get_primary_pci_bus;
 
     object_class_property_add(oc, PC_MACHINE_MEMHP_REGION_SIZE, "int",
         pc_machine_get_hotplug_memory_region_size, NULL,
-- 
1.9.1

