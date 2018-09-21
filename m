Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2863460wrd;
        Fri, 21 Sep 2018 01:32:38 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYIfzhaXdtlOFxf6UnWm+abYrBLeb99xO+hxbXAzNECMIGgUvQZ95PT1kgC4/buws9fNwMg
X-Received: by 2002:ac8:2617:: with SMTP id u23-v6mr32108725qtu.100.1537518758165;
        Fri, 21 Sep 2018 01:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518758; cv=none;
        d=google.com; s=arc-20160816;
        b=TJFWbrKmwVHdXMy+zvA3KAxUWiG9Fb0yCVNSdG17WIc2/YFvt28dosE/mBqI2D84uq
         VO9zmhvbwaY7m6Uri0dWFQUO1AwywbnWG/kPyNQTukr1uVF7bKdep6jos7XpRAAbXZxE
         wGPwPsrZ8DaXkEy/7Ed/PwhGESNyKybrr8sryBqROqLd9Nn/Zaq7Wg77yrzlKdsahcaP
         Hg090on3yR24abydfUH6A9e97xOSsG9FQBraXPxYTAtdIiY59//1vaV3Rk5EAjpp+1vK
         78miCGC4TNQ2kYURtLEufvlRcLrwgJbhVsEvlfc1M+S5dJOw68VlD16DyB3QP4jjC68t
         gp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=/2OgXTtnn19GNNJ5Cb8r9fMHKuTXjcslBcoVyxluW8A=;
        b=ql8EQ81yQ+4UyrAIkmmPrJ0y1dcRwMZCIbqQ+kPjSoQzYJFwNoAAcQCoFesnuoD7H+
         ZudG7y1NKv9BQ3j1uyzMtysrUpZftGqND6DwFB/F7H74feLGlUS45R8JdVPJ++0HIMSf
         nNW0YTsXEoyY7x32FDpNa6/wXQd/a/BQloOPa70zOBu+vuXCJDi5olKy/LL2ap6H1LAf
         q9veqnSTPEjeny1mFbD8iOR3Ihom/XExbxe0MXoT30yE2jPdXC8C6sV60cvjxE2liSNE
         GrtK1Pa5lWOkpSoljC0G8KVjNbYoF8aAqeGRgw+DJOPpMrc4jX/hNloiQJjSJEwIN83W
         B58Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r33-v6si2120235qtc.108.2018.09.21.01.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:32:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54433 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Grd-00082W-MQ
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:32:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gg3-00055H-WE
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gg0-0005NL-GH
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:20:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Gg0-0005JR-79; Fri, 21 Sep 2018 04:20:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6F5931524C5;
	Fri, 21 Sep 2018 08:20:34 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99FA87D665;
	Fri, 21 Sep 2018 08:20:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:07 +0200
Message-Id: <20180921081819.9203-17-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 21 Sep 2018 08:20:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 16/28] hw/arm/smmuv3: Fill the IOTLBEntry
 arch_id on NH_VA invalidation
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
X-TUID: fJlb+/IF0+Cc

When the guest invalidates one S1 entry, it passes the asid.
When propagating this invalidation downto the host, the asid
information also must be passed. So let's fill the arch_id field
introduced for that purpose.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 196835739f..1d8deae37f 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -824,6 +824,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.iova = iova;
     entry.addr_mask = (1 << tt->granule_sz) - 1;
     entry.perm = IOMMU_NONE;
+    entry.arch_id = asid;
 
     memory_region_iotlb_notify_one(n, &entry);
 }
-- 
2.17.1

