Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2866495wrd;
        Fri, 21 Sep 2018 01:36:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63zDsXran1Y37HVRmqj/I5ce+gafPziEqFdUwWYLk4tX9aQEWKOpMDzQ6X6PbJ3NjSSEDt5
X-Received: by 2002:a0c:bfe8:: with SMTP id u37-v6mr1839646qvj.14.1537518965910;
        Fri, 21 Sep 2018 01:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518965; cv=none;
        d=google.com; s=arc-20160816;
        b=FFZmthbD+90wViLjGQfTj7j3kgn+cYMmb9QMUP0GsRFerVD/yxnx1HalWMKFDFqLki
         oRrYL8NQ/Va3UJIKW8sqF8NchxyY2JfGZdClQQ7Bv8k8k04dyVJNmpJkLgGKcPEg7+vd
         VO25+ZptDCEN06CUR7AV529QBEeVxdst0IJwBN2ft9nekTEZjMunh3pgY+SZXiTPfkMs
         8BmVcvtTlPdfOrt7MPRkVkeaMI9+NfpIIlbI1zJ4sP/7IVQIn3s3avMBN4d2Vb3JcbJk
         gT6AfI6QdFhl3dP5N5h5R308vpOSEmust1y+C8GwPamKwgfZLOWBLVYvSSSHFTdMzHnQ
         B+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=UchQ+eWC+fiJUPLviVTR4/zJuH710po+wB1bqIVTxCM=;
        b=QmY8jl0xIeEMX8hKgjrtz2jPDbx22dWoYSfxIn6cdjWovUPNuSVzKPU6ZV4bhVvVPA
         Qj7igMT7FKuVKMoyrmkHi3ggk6Xc8T31PhAzi/50Qbp2JfvJEFJZJ0wcBpfZ/3XZf5mc
         0duIcx7O71b2X87b6jaXNTX5CZhCCH2vn6fmbvzWmM/nJfNhmB9K6FQqBgljpiUKKMj3
         yQbHXkeDXj1tX77Vk7cydtnDU31RtS0z8340hkaIoIR3/0KALr12oklUqisNuN2R0+ke
         mBB6VP9iU+92qo8+obI2S5Nn+NjBMHnodLVKjRpiUttBrczEWOC6RDI6Sy+Qb6UJhKaq
         Ct1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2-v6si2519415qvu.284.2018.09.21.01.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Guz-00033m-9Z
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:36:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gf8-0004BS-Jn
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gf4-0003aq-QZ
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Gf3-0003Rl-IC; Fri, 21 Sep 2018 04:19:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49F473082B03;
	Fri, 21 Sep 2018 08:19:35 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A2B07D665;
	Fri, 21 Sep 2018 08:19:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:17:59 +0200
Message-Id: <20180921081819.9203-9-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 21 Sep 2018 08:19:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 08/28] hw/vfio/common: Force nested if iommu
 requires it
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
X-TUID: rVWu2hTulxSr

In case we detect the address space is translated by
a virtual IOMMU which requires nested stages, let's set up
the container with the VFIO_TYPE1_NESTING_IOMMU iommu_type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 53b8f773cc..1416892f1c 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1041,11 +1041,15 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
  * nested only is selected if requested by @force_nested
  */
 static int vfio_iommu_get_type(VFIOContainer *container,
-                               Error **errp)
+                               bool force_nested, Error **errp)
 {
     int fd = container->fd;
 
-    if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
+    if (force_nested &&
+        ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_NESTING_IOMMU)) {
+        /* NESTED implies v2 */
+        return VFIO_TYPE1_NESTING_IOMMU;
+    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
         return VFIO_TYPE1v2_IOMMU;
     } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU)) {
         return VFIO_TYPE1_IOMMU;
@@ -1085,9 +1089,16 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     VFIOContainer *container;
     int ret, fd;
     VFIOAddressSpace *space;
+    IOMMUMemoryRegion *iommu_mr;
     int iommu_type;
+    bool force_nested = false;
     bool v2 = false;
 
+    if (as != &address_space_memory && memory_region_is_iommu(as->root)) {
+        iommu_mr = IOMMU_MEMORY_REGION(as->root);
+        memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
+                                     (void *)&force_nested);
+    }
 
     space = vfio_get_address_space(as);
 
@@ -1148,12 +1159,18 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
 
-    iommu_type = vfio_iommu_get_type(container, errp);
+    iommu_type = vfio_iommu_get_type(container, force_nested, errp);
     if (iommu_type < 0) {
             goto free_container_exit;
     }
 
+    if (force_nested && iommu_type != VFIO_TYPE1_NESTING_IOMMU) {
+            error_setg(errp, "nested mode requested by the virtual IOMMU "
+                       "but not supported by the vfio iommu");
+    }
+
     switch (iommu_type) {
+    case VFIO_TYPE1_NESTING_IOMMU:
     case VFIO_TYPE1v2_IOMMU:
     case VFIO_TYPE1_IOMMU:
     {
-- 
2.17.1

