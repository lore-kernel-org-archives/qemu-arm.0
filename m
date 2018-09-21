Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2854231wrd;
        Fri, 21 Sep 2018 01:22:18 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZx0oWEWjmkAhSG2IDdDsVEXZXc/KGz6V7hRd8mUUNS9qKy+gBGkN6LrooXC4yXQ/jJMUji
X-Received: by 2002:a0c:a482:: with SMTP id x2-v6mr30263513qvx.76.1537518138245;
        Fri, 21 Sep 2018 01:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518138; cv=none;
        d=google.com; s=arc-20160816;
        b=cLTT4ewwZ4E1ttjkHxzJWT7LuQiyogU3VJmj5gI7rGnA0PuV9+8+iPY1psxsIXLgcw
         E7csLuArS3P6fpyRSSWtJGxWgIpryodzvm6G6tIK23bKdg3Yf1ygg0Mx5pKwPmjKAhdg
         azSrLttlvD7Oab349gDW+cyqx4Rlj06OcPJce/iWCO+F8UXCjf5hnlJatkX799Qk9Q+S
         is750ipUos4YTsLgHB1QXYrjtCr8Cz+pCFtGwlS8liI4iHg4fPD0O33g94zGMy9giNkB
         ZMmWepdUymWGkw3qABA/+8EqfEekra/pJJ6caeDTkTfX0rj/0ucLntj5KkfeARCw+qRe
         83lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=9THBJTmKde1h3eWLXBr7ccWsWxWeigYQoyzzXYkWk84=;
        b=WxrjwOwCdxsX6T+Sqp4AbpYYA3OM6c7yEcVh/y+lazHVlhu2RvxDPa7AVBm+PqSp3C
         TlDTwC9QDT2ogwwuKdYewe0ie3yAfHL01d29LS0ius02/Z7SLGMnifCoRl0aw2StzgJp
         GqqKD3w1aKWaXuq7vPDxUyzJ0zfgYTt+ZXdVFNvq48Bh3czoahJo/y4dEYD/5NM2c8L6
         NnmI3/XwGn/eAES/qz3VKaEd3h8hEbUARMZ7SxbNrJ9WyTgy0CgDXUCqiQzBkWhHeuhl
         c92f8mWdy3HbVkJIFua7Vgtfv6i1nSphqMrrR4pPuAktjv7+4SGNtMbzKfVKDFQxTbqf
         mikQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2-v6si3108193qtq.170.2018.09.21.01.22.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:22:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Ghd-0006FS-Mm
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:22:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GeO-0003ZK-9D
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:18:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GeL-00012U-Lq
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:18:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53482)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3GeL-00010T-GI; Fri, 21 Sep 2018 04:18:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B71C55C9;
	Fri, 21 Sep 2018 08:18:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D41B7D904;
	Fri, 21 Sep 2018 08:18:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:17:52 +0200
Message-Id: <20180921081819.9203-2-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 21 Sep 2018 08:18:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 01/28] hw/arm/smmu-common: Fix the name of the
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y/yXUaZsI/09

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

