Received: by 10.28.71.27 with SMTP id u27csp828985wma;
        Fri, 19 Jan 2018 06:51:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBovge1fgzp3Bma7BxKpfCyvLFaMBwVlZDw3ewSg6FzbvkhDTfHI/9j1wWaTEbaZ9qUdt3pOv
X-Received: by 10.129.70.7 with SMTP id t7mr9979319ywa.510.1516373497802;
        Fri, 19 Jan 2018 06:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516373497; cv=none;
        d=google.com; s=arc-20160816;
        b=iRhQMRuLEmOz7TWmFilEHDjwqAgh42yJpRrdVRZZmlMgAGDJzTQZk3M7vWsXF9qodC
         jipAdkdNIk3MhN3mojQCCw++ABkxRdXju1NUzH0YHfm6W/+acepGNgcuMtK55tcwYk4a
         m6KljiE0PcHC5nFhwjfjodHyNDO/rbcPiXPexUBTHgvPgKMR/4yZkCFMZxHNNIlv0Dgv
         K88SPBPj6Xtx4qXwGdsMPRNgWavVuwFFpRri1v5XCJa7P5xlnUJk7hkp92TEHxXLvL8J
         eTpTwGcZaE3bZTOscJVBYpiOZqB9GT/hSdT1yjahcYVZptVvkNtRnChJ4OYYvDUWyA8y
         Bpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DImSrni2r/GBYGvNThGIwsOrd6eVQctQJrwJiaUiIY0=;
        b=tPxHfw0cSVHF+jHf1rYz8HSaFsYDD/crLBL6SSLG2e+y7I4GbeH7EqaWltSTZ/52+Q
         r+KSSJyfp6ojytF0aStqVs0KcREDTspGNgsqPo9hLBfjtKDpARIFY1gXhhRDnIbO+TDj
         C8D9IZDKmAhgQJCl1I9T5juheQ1GGZE3c8mU6/WSWaYQXTf8M0WAiJvGvvvaVJsuHuPR
         z08DkyFNwzB8nBWZYKoTXIs0WB1IkYQ/srWQbWtFlUYs1RoQrIWetVDVfOA48Q+Qs87Y
         dRYD7r3Z7t5w3f2r6kgdH0RHShyrO/N+7Nrcy+e1nDEGLK6HAmp+B0AUl8aDUFsufrI+
         dvXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h185si609616ywh.755.2018.01.19.06.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 06:51:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecY13-0005OX-55
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 09:51:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecY0n-0005MN-2x
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:51:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecY0j-000784-4h
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:51:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60242)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecY0i-00077g-Uu; Fri, 19 Jan 2018 09:51:17 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4F2EC08EC10;
	Fri, 19 Jan 2018 14:51:15 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EFBB5C885;
	Fri, 19 Jan 2018 14:50:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:48:56 +0000
Message-Id: <1516373355-305-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 19 Jan 2018 14:51:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 03/22] pc: Implement get_primary_pci_bus
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
X-TUID: 49ZP55MYL6oJ

Implement this get_primary_pci_bus() which returns the root
bus.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/i386/pc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 55686bf..00f4623 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2337,6 +2337,13 @@ static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
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
@@ -2376,6 +2383,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = pc_machine_device_unplug_cb;
     nc->nmi_monitor_handler = x86_nmi;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
+    mc->get_primary_pci_bus = pc_machine_get_primary_pci_bus;
 
     object_class_property_add(oc, PC_MACHINE_MEMHP_REGION_SIZE, "int",
         pc_machine_get_hotplug_memory_region_size, NULL,
-- 
1.9.1

