Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2788404wrd;
        Fri, 21 Sep 2018 00:02:00 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYXxZA58TnLlqeBY7nr4c+yRLJGy6s/5wKtkVRt4pjAgaPI84M0ryMtTzcv/UHCfDOXdECv
X-Received: by 2002:a37:b307:: with SMTP id c7-v6mr29396234qkf.341.1537513320305;
        Fri, 21 Sep 2018 00:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537513320; cv=none;
        d=google.com; s=arc-20160816;
        b=RvU8sMGsHKiGUe9utiQnExqCthkwg/cvbU4Ee/HTCbF/HUiYV/B2OYvrwmhVn3M8Ra
         b8z/4cPcBc8Wxty2jLGUrgHfCUDPFiEi+BLvYrGHnKdXT1a5q+k68BGUebD4Wt1E7Wjp
         Q++U1ZKSM5JLau78jqU2JlNblZGqJu0ThvjOYLu0xndWXUj8M0CKqGzXtqiSOSs8wH/E
         L49wjm0fJY8AOP5jvXne9HWNzpufm9ET1VeL6Z/U7ZKe5n8JxoTksMQrbP6/2XQq2BQf
         1CptiGJhVCpc8XERLbeDuCtJcdH6htBGHzH0blhf6LIFhC2KqWVeloNf9XNYI7FMXf9r
         hzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=9THBJTmKde1h3eWLXBr7ccWsWxWeigYQoyzzXYkWk84=;
        b=OcbJ7k9sT00IxM2ehq4htA1meU4+keWm5SSjVOL1VglPZUCn2FY4hdL4tIGm9mQPwz
         w1OTEWbEguvl3PX/sxSgY2aPQOT5sY4avEIiAAx9UBDNU1LfdeCaQ4txA/CUAUkPFY1J
         Kmasae2K+4YocAO1VhlQ+EBUE+P5UnMdgCyTHxgqIF86HCOLjBCkUB6zHnEx8OLVqdWq
         BpepQogvpSfTgqI//7fSNYz9Q57J0e8VMDzlmQWPTALz3dIPWSaPl0vmkslyrJcRubF7
         xmz4BdDFxfN7aZ2ykgPOkgGXSQ7uv/n+13AQbe38zG9hT5OYyJDLcqFxCStROK99m7p3
         VlfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e17-v6si244424qvq.88.2018.09.21.00.02.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 00:02:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3FRv-0002P1-Q4
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 03:01:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3FRm-0002On-Uc
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 03:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3FRk-0005Sh-AA
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 03:01:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51630)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3FRk-0005QO-4E; Fri, 21 Sep 2018 03:01:48 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com
	[10.5.11.25])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59CCA8110D;
	Fri, 21 Sep 2018 07:01:47 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19A1D2015AD1;
	Fri, 21 Sep 2018 07:01:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 09:01:37 +0200
Message-Id: <20180921070138.10114-2-eric.auger@redhat.com>
In-Reply-To: <20180921070138.10114-1-eric.auger@redhat.com>
References: <20180921070138.10114-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.25
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 21 Sep 2018 07:01:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/2] hw/arm/smmu-common: Fix the name of the
 iommu memory regions
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tAHdEiFXmCDF

At the point smmu_find_add_as() gets called, the bus number might
not be computed. Let's change the name of IOMMU memory region and
just use the devfn and an incrementing index.

The name only is used for debug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 55c75d65d2..3f55cfd193 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -311,6 +311,7 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
     SMMUState *s = opaque;
     SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_pcibus_by_busptr, bus);
     SMMUDevice *sdev;
+    static uint index;
 
     if (!sbus) {
         sbus = g_malloc0(sizeof(SMMUPciBus) +
@@ -321,9 +322,8 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
 
     sdev = sbus->pbdev[devfn];
     if (!sdev) {
-        char *name = g_strdup_printf("%s-%d-%d",
-                                     s->mrtypename,
-                                     pci_bus_num(bus), devfn);
+        char *name = g_strdup_printf("%s-%d-%d", s->mrtypename, devfn, index++);
+
         sdev = sbus->pbdev[devfn] = g_new0(SMMUDevice, 1);
 
         sdev->smmu = s;
-- 
2.17.1

