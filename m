Received: by 10.28.71.27 with SMTP id u27csp851694wma;
        Fri, 19 Jan 2018 07:10:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBovOH2qErfTAq9SgDSXJzZfRapsBZImrvuQz5uQLluPwIlIDrot+gO5tQugnWFeSDwCOoucx
X-Received: by 10.13.225.17 with SMTP id k17mr9841263ywe.61.1516374640275;
        Fri, 19 Jan 2018 07:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374640; cv=none;
        d=google.com; s=arc-20160816;
        b=dNoHohZT9IeJ7s8ZkLyAu4dzG2M7vohgFuqz4Hz4UAHgRRbl0sNlY/D6w3CSKkte71
         59qZGoWE5gtMPKGZT2w+Tuy8V09WOtE8Mi2Ga03svkgu2PNXchdxzbmkuusZ1pGwDGP8
         2s6m1rV4LYLQsFHwSBVC7nSbE0ZsYEK+3sWjn76zcLX3mc6zAMoT5496xVSzRLrWlcx5
         WtUTvV+OsmHloEfSqpF4q86/9mQff4V+jmcsDVtLmBg2mjBz+4oxmuQ6o1tA/h100ke8
         3w1BlIoMjyyCDHOWbEOLm2EOR/+TRXUizxVNN+10I52hW50GCrUzP+UNX9tH/S89ZPLw
         2LqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=cAQmXhWVAyxhd83vod2/w4LPML/3D1Dsea+PgsyCtWY=;
        b=i3/gwD/NAMgRzhHZ71uMGaBYohtZ8/lbhtqp2aSbQ37QeGWTNzWlEgwvluvzSLQTux
         sRPVZ+y0smtl6RNnLqGCNwJ6+j6gNEROxbmUPO+crCDZ/3YXjXV+/Gu9puBiSQA6DGml
         wpUtP8Xmz1F3+uK7yyVc7VYV7QGEKG8I75sg52nzSZCW7btkcdR6Is00/HsYB54hSs5b
         5aHn/1Di7w/xYCtJSYhamG70qXQJXejyPhjs9ZOIPlCDJcDx/b/zriZeUbVS3k9v3CH1
         +CyQNntg1xNZuXtjfq4WBwRCn5DdAwJj7LOtnmQcTBxW89CEbwdH/6vTfhscWVzMWHQb
         +v8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p5si647883ybb.274.2018.01.19.07.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:10:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYJT-0004j3-Mj
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:10:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYGr-0002o3-AX
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 10:07:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYGq-0005kZ-CF
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 10:07:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYGl-0005gj-MQ; Fri, 19 Jan 2018 10:07:51 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF0DF690A;
	Fri, 19 Jan 2018 15:07:50 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 271F15C1B7;
	Fri, 19 Jan 2018 15:07:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:15 +0000
Message-Id: <1516373355-305-23-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 19 Jan 2018 15:07:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 22/22] hw/vfio/common: Do not print error when
 viommu translates into an mmio region
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a3kYwLWfSTFd

On ARM, the MSI doorbell is translated by the virtual IOMMU.
As such address_space_translate() returns the MSI controller
MMIO region and we get an "iommu map to non memory area"
message. Let's remove this latter.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 35b83fe..239a208 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -326,8 +326,6 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
                                  iotlb->translated_addr,
                                  &xlat, &len, writable);
     if (!memory_region_is_ram(mr)) {
-        error_report("iommu map to non memory area %"HWADDR_PRIx"",
-                     xlat);
         return false;
     }
 
-- 
1.9.1

