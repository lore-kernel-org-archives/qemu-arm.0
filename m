Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3454461wru;
        Mon, 6 Aug 2018 13:30:36 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdkWKz/OlyZ1oKJNfJ65k/DWj91BUE+3/UynoYpfipRUDcgNd7Qpne1dLFOAhCXfzY1vqIB
X-Received: by 2002:a37:cc44:: with SMTP id r65-v6mr15542458qki.285.1533587436735;
        Mon, 06 Aug 2018 13:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533587436; cv=none;
        d=google.com; s=arc-20160816;
        b=MnUtaJtQY4EUVoKxGu9UWaq+2nUdkeHhaCIcL/5dt3ro9BBV++zQr7GO2YB23t+KLc
         ITRV5a1QSkPyYa4H43tK5EZr6n9QT3IMtJuU3V9KzI0tC10NDsrXvG0FTsNVmZIcRWfL
         NnOrJt9LfMPcv8mlLKds48dyPj1g+Fh0bpsiRj8ZbDFsiqmIrnKnN9FedBs785bxL59n
         o+vsQKdRIfOeQD7/LneQMxH1GmDe4XujXGWUE/6NVLgz+aKDiG2uQDNKGo1TA2/hcH31
         EOLmlEtsERH19EKz4hmR71uNdh5+LhPL7f0lPmhXq03MfedZQOkSrGDQTBkHqwin6VGg
         Uj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ritXlzWKem2i6Ga48UJsmoDXNrnyM7sV+O4sFyqMiyc=;
        b=hUyELAL4OZIX4TQgktux3wXcYMofzbm/8+RlH9WJiUuGS8kc5XeXJ40RTrrE7Z3abW
         iV9Jel9VwBR24flTILbNvh2AQs+FD82HGntA7bsgjetA0h8AqxdOIpNVegYG2rux0ZNz
         C/G87FL+695xXAJGo0zs7Pga6lngbson04diEphza8THtMHFC+4M5juKS58EcxP19Gr6
         NTx1TFhq2yYPEwCSZBkC64pjUzUZAJvg7C7cP4Oszp4KsZz27W5HS5Af98HQDO8rWZqC
         lX9rMTEAGvCVnzCVHCTAyd7zV6j452Zs+Z3AQmkt9c7ouyceQqosEWu7cWpsdUxvCpXi
         tpkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r10-v6si2470888qvi.112.2018.08.06.13.30.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:30:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmm9E-0002oY-5o
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:30:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluv-0006pe-JD
	for qemu-devel@nongnu.org; Mon, 06 Aug 2018 16:15:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluu-0007C5-IC
	for qemu-devel@nongnu.org; Mon, 06 Aug 2018 16:15:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40598 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmluo-00077x-QS; Mon, 06 Aug 2018 16:15:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 629EF40214E2;
	Mon,  6 Aug 2018 20:15:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C55DD2166BA0;
	Mon,  6 Aug 2018 20:15:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:44 +0200
Message-Id: <1533586484-5737-17-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:42 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v7 16/16] hw/arm/virt: Allow virtio-iommu
 instantiation
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
Cc: wei@redhat.com, kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kT+WxIrESfIf

The virtio-iommu now can be instantiated by adding the virt
machine option "-M virt,iommu=virtio"

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dd3cc71..25f7c21 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1679,6 +1679,8 @@ static char *virt_get_iommu(Object *obj, Error **errp)
         return g_strdup("none");
     case VIRT_IOMMU_SMMUV3:
         return g_strdup("smmuv3");
+    case VIRT_IOMMU_VIRTIO:
+        return g_strdup("virtio");
     default:
         g_assert_not_reached();
     }
@@ -1690,11 +1692,13 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
 
     if (!strcmp(value, "smmuv3")) {
         vms->iommu = VIRT_IOMMU_SMMUV3;
+    } else if (!strcmp(value, "virtio")) {
+        vms->iommu = VIRT_IOMMU_VIRTIO;
     } else if (!strcmp(value, "none")) {
         vms->iommu = VIRT_IOMMU_NONE;
     } else {
         error_setg(errp, "Invalid iommu value");
-        error_append_hint(errp, "Valid values are none, smmuv3.\n");
+        error_append_hint(errp, "Valid values are none, smmuv3, virtio.\n");
     }
 }
 
@@ -1872,7 +1876,7 @@ static void virt_3_0_instance_init(Object *obj)
     object_property_add_str(obj, "iommu", virt_get_iommu, virt_set_iommu, NULL);
     object_property_set_description(obj, "iommu",
                                     "Set the IOMMU type. "
-                                    "Valid values are none and smmuv3",
+                                    "Valid values are none, smmuv3, virtio",
                                     NULL);
 
     vms->memmap = a15memmap;
-- 
2.5.5

