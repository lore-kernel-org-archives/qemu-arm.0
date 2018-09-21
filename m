Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2869182wrd;
        Fri, 21 Sep 2018 01:39:23 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdb4jQESy494WhjrgofI5T4nQ6rmYE2MXDmeQ4VuAJX1DBs0iNeFe1c3cZBBoqMdouCEfKUe
X-Received: by 2002:a37:4712:: with SMTP id u18-v6mr30339259qka.301.1537519163545;
        Fri, 21 Sep 2018 01:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537519163; cv=none;
        d=google.com; s=arc-20160816;
        b=nJb4Pr1tZXOjMNVL6qRTjKg8pechuHEZwt5//PoBtjw9G70k9lH8mIR5jSpBPxx+9G
         yP80pCGZclXJqudElMEBjsUuoI8sCE4NOOo+Tdgmg6X4SuQmYA+bLFdjfQk7VhbhBrfi
         PFNo3InL5cE0qA/AbEGnHaymUZGUVLhCS3oEOB/zNTqPZrXeaIAwJXVuLY38JHktHskj
         rHsIj43X17Iq9+fDA2OtJbFIxcrMUxCQJlq6fjYSXhsxYR/H++xNQCyWg9YguzaWMAzO
         r2GbMfQSvjZcYGIcPBXEJtI43xFsCEOENBrwiuaJMieUTiyo1HCyrE1/fB2tZfr7lKQ5
         7wUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=XD2VF3XlJ7xM0N/n4zE9EJ6LjDumDva358NQvoP+8rk=;
        b=n1H+etlBPFcP727TcD3j8f11Abr1jgQjrrkSN3+DddV80Se5E91ChYA2HlX+Jo1ThZ
         Pe391Zc2nlU3WqIERMkQI2XMjwvir4QQZbKH9lfChHAms0Yxlo8UsIEtoqcVC6JG+G+j
         q7L0jfka285ARPVr23SePXuntKbTExVroll5tdfP8i7ARitNAP+CTqz6WxLRAS7gJ/XQ
         xwHqPhyUd2+lMfloTtw2tyFp8nVt6a9bVIlYiJ7StqgCe/zh99ByXUhaEEwvqp/XCa7Z
         4drWlj+VUUPknyKym6YWB9Ecvh400Oq9HG8a/hP8TeLndYtXbi+DCWM5iROL5Dm5EQsV
         OiwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y12-v6si1664878qti.27.2018.09.21.01.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3GyA-0005vW-Uy
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:39:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Ggw-0005pE-JN
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Ggt-0007Rb-FD
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40346)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Ggt-0007PZ-8Z; Fri, 21 Sep 2018 04:21:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64CFF88E61;
	Fri, 21 Sep 2018 08:21:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73D967D665;
	Fri, 21 Sep 2018 08:21:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:14 +0200
Message-Id: <20180921081819.9203-24-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 21 Sep 2018 08:21:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 23/28] hw/arm/smmuv3: Remove warning about
 unsupported MAP notifiers
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
X-TUID: pkJEv9ATv832

SMMUv3 now is integrated with VFIO by enable the 2 stages of
the physical SMMUv3. This relies on a MAP notifier for MSI
stage 1 binding notification. So let's remove this warning.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 1d8deae37f..c6dec63f07 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1504,14 +1504,6 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
     SMMUNotifierNode *node = NULL;
     SMMUNotifierNode *next_node = NULL;
 
-    if (new & IOMMU_NOTIFIER_MAP) {
-        int bus_num = pci_bus_num(sdev->bus);
-        PCIDevice *pcidev = pci_find_device(sdev->bus, bus_num, sdev->devfn);
-
-        warn_report("SMMUv3 does not support notification on MAP: "
-                     "device %s will not function properly", pcidev->name);
-    }
-
     if (old == IOMMU_NOTIFIER_NONE) {
         trace_smmuv3_notify_flag_add(iommu->parent_obj.name);
         node = g_malloc0(sizeof(*node));
-- 
2.17.1

