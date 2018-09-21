Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2857489wrd;
        Fri, 21 Sep 2018 01:25:41 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbEnfcjGzOicWKdwDrP0T1mTC0Ozv2YSLun8/GwWH/6M1ZAAYl38Y7UrEqiIOKMg5tF43WA
X-Received: by 2002:a37:4453:: with SMTP id r80-v6mr30334701qka.79.1537518341742;
        Fri, 21 Sep 2018 01:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518341; cv=none;
        d=google.com; s=arc-20160816;
        b=pJHQN7JJn+xCb0cYIYy0A3dcE3B5NnuXqzCCcfY7iHZBadBenmf1nEzZqkfXrxOwM6
         yIC3oZbZspigKCYRcOJ3yfkin91/y7/bmRcZmBDflEfr5f3UnhxqAWTBhHY7Pye0AzTV
         V/LoVdno3hfGfltXuCUTUF2xqmkfZ0SZjVO61JHN8AhImohNtcKmUWvCtb8RQ5EjQQFE
         6Ng2qHJ7OiIm9RXCuV5F4zD1XU+0krPxLYC1S+Z0i6Dx1jY+LYaWQoaAIIZ+WqOtAAFL
         Fwk74SrrTLv2Vz4W7fEBV6YGgYS862jNtE2N3gmXwAd9WaPDlW9wZESaz3HKO+R4YnJn
         SVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=F90RaVJ8oFNn+Jl0hsLkyoiiDMWyTV9XXKgg5urnqr4=;
        b=iJPyXcrxpdMBVKfKDHdXgYOaLtJ4DjKCUqVK+AtKu4Go5GMIa35C3rUXC7NmNUU0Uh
         k2uWYjYYVkM8G0xdWYlkcvLrI/9ikkI1ZxQwRvg6dmsErrJbXuYECZ+rjhyLcIEUPztc
         +NX3pXFgJgHXHQNu+rMNZvo80EOORS0+aDr0K5uAVNlHlfb+mib0AHfAxyDQeLdmj56a
         jEk8oedqUQmqTYT5HCupxeTDJfc0T1IvF3gzoddKIbVKg7Bqu4XhdFVaMXRB9iIG4BXh
         JKDnTqCXpekpVGDfDl3AtGhUBy72WAqeCJfBAmi/u/Zu8NAy8d95gnG50Z0usilCIxnV
         TLbg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w64-v6si14381631qkd.167.2018.09.21.01.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:25:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Gkv-0001V4-6y
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:25:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gey-00045C-8f
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gex-0003Fn-Cq
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Gex-0003DK-3A; Fri, 21 Sep 2018 04:19:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5105330022E8;
	Fri, 21 Sep 2018 08:19:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 041CB7D665;
	Fri, 21 Sep 2018 08:19:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:17:58 +0200
Message-Id: <20180921081819.9203-8-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 21 Sep 2018 08:19:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 07/28] hw/vfio/common: Refactor container
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
X-TUID: fyJLNH+X5U4W

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
index 7c185e5a2e..53b8f773cc 100644
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

