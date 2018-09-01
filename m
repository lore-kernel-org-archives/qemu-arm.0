Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp625153wrd;
        Sat, 1 Sep 2018 07:32:54 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbF8loEHUysWNHN5+TsZKnhVgRPF0IsJJPqrpXesjc1xSgM6rIeW10J26a3dsfxckFu70gz
X-Received: by 2002:a37:79c5:: with SMTP id u188-v6mr19254877qkc.82.1535812374677;
        Sat, 01 Sep 2018 07:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812374; cv=none;
        d=google.com; s=arc-20160816;
        b=yz970QF/jeZb/fI7raOhUtOmfxZaiaF3jJO7r2hPytqGlW2oJQp0kKUXqkFtgwehjw
         mY8rYkST/VQ+grb7ybdUJM9WQJa1y6JLh05DiWBKGVQ9rn6rmGVWANuv7WL8eVi6SUfh
         boa/zB+Z80CHDuyw0J3LZZdmhKDwORg+YGdOYqnl1r8LH4rErrSZzAIFdRV7qsbxDXO5
         oZeRHPQ4yt95rslSRX76egg9CGULRzplAXiOAIkeZCgvkM9kO0s7DIfhPKqzHSNAaB71
         lMo4j3T49iZPAcXgBpSUZ0+c+xO516UVAn1qBs6QZryX717ifIdh3WE56kxX4tO97U/d
         iizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0Il6cKHRMCYjB3Q7f2udMvDM54w0SdeYH4YskwdWPlk=;
        b=dIvNkkJei6+SxYJd/TnPkkYZNW5rKakUhnKnkPiwI1GyEOQ5V3yzx+JnX2ewIgNrhF
         StEInZTF2RLMEM7laPWKO2p1Vc7DkE5R4YQrXtaY4CUhO9VYujU/cweCoYBdEQhTcVSr
         lgJSSSQN+TYCVz88P8+nlJraAsmyyLAvqOFHodcjw+uy4V1ke2h/ADquEXAso7qHyhsb
         i8n1cQ5NgwC/tnIwOkCrOUK08+W9q/3cazaAn2/lkd0q67FY2xNwzJ9RUwXKPcRIuDu2
         tnpWN6laxFTn7AxhPOoddtekOfBytTwTQIRCoYF3w6T1blQU/BC9KwUYjBRuRqR55AwK
         AyQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r17-v6si11418867qkh.108.2018.09.01.07.32.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6xK-00066Q-3h
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:32:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6qS-0006So-1e
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:25:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6oV-0005Uz-0q
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:23:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57188 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6oU-0005UY-Ra; Sat, 01 Sep 2018 10:23:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DCB9807689C;
	Sat,  1 Sep 2018 14:23:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94A202166B41;
	Sat,  1 Sep 2018 14:23:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:22:58 +0200
Message-Id: <20180901142312.11662-7-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Sat, 01 Sep 2018 14:23:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Sat, 01 Sep 2018 14:23:46 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 06/20] hw/vfio/common: Refactor container
 initialization
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
X-TUID: 2BjBmc25UldL

To prepare for testing yet another extension, let's
refactor the code. We introduce vfio_iommu_get_type()
helper which selects the richest API (v2 first). Then
vfio_init_container() does the SET_CONTAINER and
SET_IOMMU ioctl calls. So we end up with a switch/case
on the iommu_type which should be a little bit more readable
when introducing the NESTING extension check. Also ioctl's
get called once per iommu_type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 102 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 65 insertions(+), 37 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3f31f80b12..39f400b077 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1036,12 +1036,58 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
     }
 }
 
+/*
+ * vfio_iommu_get_type - selects the richest iommu_type (v2 first)
+ * nested only is selected if requested by @force_nested
+ */
+static int vfio_iommu_get_type(VFIOContainer *container,
+                               Error **errp)
+{
+    int fd = container->fd;
+
+    if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
+        return VFIO_TYPE1v2_IOMMU;
+    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU)) {
+        return VFIO_TYPE1_IOMMU;
+    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU)) {
+        return VFIO_SPAPR_TCE_v2_IOMMU;
+    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_IOMMU)) {
+        return VFIO_SPAPR_TCE_IOMMU;
+    } else {
+        error_setg(errp, "No available IOMMU models");
+        return -EINVAL;
+    }
+}
+
+static int vfio_init_container(VFIOContainer *container, int group_fd,
+                               int iommu_type, Error **errp)
+{
+    int ret;
+
+    ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
+    if (ret) {
+        error_setg_errno(errp, errno, "failed to set group container");
+        return -errno;
+    }
+
+    ret = ioctl(container->fd, VFIO_SET_IOMMU, iommu_type);
+    if (ret) {
+        error_setg_errno(errp, errno, "failed to set iommu for container");
+        return -errno;
+    }
+    container->iommu_type = iommu_type;
+    return 0;
+}
+
 static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
                                   Error **errp)
 {
     VFIOContainer *container;
     int ret, fd;
     VFIOAddressSpace *space;
+    int iommu_type;
+    bool v2 = false;
+
 
     space = vfio_get_address_space(as);
 
@@ -1101,23 +1147,20 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->fd = fd;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
-    if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ||
-        ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
-        bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU);
+
+    iommu_type = vfio_iommu_get_type(container, errp);
+    if (iommu_type < 0) {
+            goto free_container_exit;
+    }
+
+    switch (iommu_type) {
+    case VFIO_TYPE1v2_IOMMU:
+    case VFIO_TYPE1_IOMMU:
+    {
         struct vfio_iommu_type1_info info;
 
-        ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
+        ret = vfio_init_container(container, group->fd, iommu_type, errp);
         if (ret) {
-            error_setg_errno(errp, errno, "failed to set group container");
-            ret = -errno;
-            goto free_container_exit;
-        }
-
-        container->iommu_type = v2 ? VFIO_TYPE1v2_IOMMU : VFIO_TYPE1_IOMMU;
-        ret = ioctl(fd, VFIO_SET_IOMMU, container->iommu_type);
-        if (ret) {
-            error_setg_errno(errp, errno, "failed to set iommu for container");
-            ret = -errno;
             goto free_container_exit;
         }
 
@@ -1137,28 +1180,16 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         }
         vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
         container->pgsizes = info.iova_pgsizes;
-    } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_IOMMU) ||
-               ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU)) {
+        break;
+    }
+    case VFIO_SPAPR_TCE_v2_IOMMU:
+        v2 = true;
+    case VFIO_SPAPR_TCE_IOMMU:
+    {
         struct vfio_iommu_spapr_tce_info info;
-        bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU);
 
-        ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
+        ret = vfio_init_container(container, group->fd, iommu_type, errp);
         if (ret) {
-            error_setg_errno(errp, errno, "failed to set group container");
-            ret = -errno;
-            goto free_container_exit;
-        }
-        container->iommu_type =
-            v2 ? VFIO_SPAPR_TCE_v2_IOMMU : VFIO_SPAPR_TCE_IOMMU;
-        ret = ioctl(fd, VFIO_SET_IOMMU, container->iommu_type);
-        if (ret) {
-            container->iommu_type = VFIO_SPAPR_TCE_IOMMU;
-            v2 = false;
-            ret = ioctl(fd, VFIO_SET_IOMMU, container->iommu_type);
-        }
-        if (ret) {
-            error_setg_errno(errp, errno, "failed to set iommu for container");
-            ret = -errno;
             goto free_container_exit;
         }
 
@@ -1222,10 +1253,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
                               info.dma32_window_size - 1,
                               0x1000);
         }
-    } else {
-        error_setg(errp, "No available IOMMU models");
-        ret = -EINVAL;
-        goto free_container_exit;
+    }
     }
 
     vfio_kvm_device_add_group(group);
-- 
2.17.1

