Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1242822wme;
        Wed, 16 May 2018 08:22:23 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrsCs+uxF0RhpGsoji8a5enQryCF5UhGv2NHPotmvGYWJFZkeCIqJF7gjsavR6wWHNlUONm
X-Received: by 2002:a0c:bd1a:: with SMTP id m26-v6mr1340298qvg.232.1526484143170;
        Wed, 16 May 2018 08:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526484143; cv=none;
        d=google.com; s=arc-20160816;
        b=gSQcqWM119uNKU6w54ja5F787Lg+z3bV9nerCsMZugnI/Q9WzVTBgj93ts5vxIJNZ9
         CvITm2NIiwnYcBzgwE4TXIfGefYH+F2TQMy0Xwbm+lWG4+HR3gXx6d2QjA/tYO6iqyWw
         WQ5IOP9ZxBOgfCGIAD8FMBo+7azccvz24r5pE7IDzj/QW9Y8xsr2qquZQqbRmypLYnXM
         4vfxHOiufCtWpediV+QQVOXQsMTlFaL6eVQ5NvjCXjkg1VSqKtSH4a2KV3/BMVTlibHF
         c9j3N3k1VBZjgDptZJOd7GSFcQ1l5Mv/qjXQNnVcJNials7QVrkdlWHeTbNa+gS0RisG
         QQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=Fb5HikhDWUErmOb6J3sSybUBLTZKRPHbT8OuLVI8e1A=;
        b=IgFFx1VUHg1EIt7IP76S9w3Cx7UBquYEopggSG5NwsE8l35Lr+uM0YROoytqWSIRun
         xiMQNT9ULd4DDI8RVRMzkpvbtwJMBuCQ/78uFXFjKE9C1NWcaJiMOetOvibwJON6p7s0
         oaKL/pev9DpasyFU8rHoHZj6l2xcCYAbdlyxiijFAYSryhcwoKNVSBeNCntNBYxNXVF+
         5bgur1TkdHs0iiRUhbJHV1T5n+gEbQiH8FiHocmz5omDqLs7JI+pY+0soKdOHMr7t5zL
         XT0EHAlqbj+uiItRJojNTjKWHIpgugkYmX543Dc8g+TgDKnF4qtbKE6Y6C4juenV6NJ+
         usSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1-v6si208120qvd.146.2018.05.16.08.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 08:22:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIyFy-0007oJ-J3
	for alex.bennee@linaro.org; Wed, 16 May 2018 11:22:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFj-0007mi-DI
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFc-0005gV-J2
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:07 -0400
Received: from [45.249.212.32] (port=54404 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFb-0005cu-Q7; Wed, 16 May 2018 11:22:00 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 3B1826B686841;
	Wed, 16 May 2018 23:21:46 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.361.1; Wed, 16 May 2018 23:21:40 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Wed, 16 May 2018 16:20:21 +0100
Message-ID: <20180516152026.2920-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [RFC v2 1/6] hw/vfio: Retrieve valid iova ranges from
 kernel
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jonathan.cameron@huawei.com,
	linuxarm@huawei.com,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	eric.auger@redhat.com, alex.williamson@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w8X02qtiuCyK

This makes use of the newly introduced iova cap chains added
to the  type1 VFIO_IOMMU_GET_INFO ioctl.

The retrieved iova info is stored in a list for later use.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/vfio/common.c              | 108 +++++++++++++++++++++++++++++++++++++++---
 include/hw/vfio/vfio-common.h |   7 +++
 linux-headers/linux/vfio.h    |  23 +++++++++
 3 files changed, 132 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 07ffa0b..94d7b24 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,8 @@ struct vfio_group_head vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
 struct vfio_as_head vfio_address_spaces =
     QLIST_HEAD_INITIALIZER(vfio_address_spaces);
+struct vfio_iova_head vfio_iova_regions =
+    QLIST_HEAD_INITIALIZER(vfio_iova_regions);
 
 #ifdef CONFIG_KVM
 /*
@@ -1030,6 +1032,85 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
     }
 }
 
+static void vfio_iommu_get_iova_ranges(struct vfio_iommu_type1_info *info)
+{
+    struct vfio_info_cap_header *hdr;
+    struct vfio_iommu_type1_info_cap_iova_range *cap_iova;
+    VFIOIovaRange *iova, *tmp, *prev = NULL;
+    void *ptr = info;
+    bool found = false;
+    int i;
+
+    if (!(info->flags & VFIO_IOMMU_INFO_CAPS)) {
+        return;
+    }
+
+    for (hdr = ptr + info->cap_offset; hdr != ptr; hdr = ptr + hdr->next) {
+        if (hdr->id == VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE) {
+            found = true;
+            break;
+        }
+    }
+
+    if (!found) {
+        return;
+    }
+
+    /* purge the current iova list, if any */
+    QLIST_FOREACH_SAFE(iova, &vfio_iova_regions, next, tmp) {
+        QLIST_REMOVE(iova, next);
+        g_free(iova);
+    }
+
+    cap_iova = container_of(hdr, struct vfio_iommu_type1_info_cap_iova_range,
+                            header);
+
+    /* populate the list */
+    for (i = 0; i < cap_iova->nr_iovas; i++) {
+        iova = g_malloc0(sizeof(*iova));
+        iova->start = cap_iova->iova_ranges[i].start;
+        iova->end = cap_iova->iova_ranges[i].end;
+
+        if (prev) {
+            QLIST_INSERT_AFTER(prev, iova, next);
+        } else {
+            QLIST_INSERT_HEAD(&vfio_iova_regions, iova, next);
+        }
+        prev = iova;
+    }
+
+    return;
+}
+
+static int vfio_get_iommu_info(VFIOContainer *container,
+                         struct vfio_iommu_type1_info **info)
+{
+
+    size_t argsz = sizeof(struct vfio_iommu_type1_info);
+
+
+    *info = g_malloc0(argsz);
+
+retry:
+    (*info)->argsz = argsz;
+
+    if (ioctl(container->fd, VFIO_IOMMU_GET_INFO, *info)) {
+        g_free(*info);
+        *info = NULL;
+        return -errno;
+    }
+
+    if (((*info)->argsz > argsz)) {
+        argsz = (*info)->argsz;
+        *info = g_realloc(*info, argsz);
+        goto retry;
+    }
+
+    vfio_iommu_get_iova_ranges(*info);
+
+    return 0;
+}
+
 static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
                                   Error **errp)
 {
@@ -1044,6 +1125,15 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
             group->container = container;
             QLIST_INSERT_HEAD(&container->group_list, group, container_next);
             vfio_kvm_device_add_group(group);
+
+            /* New group might change the valid iovas. Get the updated list */
+            if ((container->iommu_type == VFIO_TYPE1_IOMMU) ||
+                (container->iommu_type == VFIO_TYPE1v2_IOMMU)) {
+                struct vfio_iommu_type1_info *info;
+
+                vfio_get_iommu_info(container, &info);
+                g_free(info);
+            }
             return 0;
         }
     }
@@ -1071,7 +1161,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ||
         ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
         bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU);
-        struct vfio_iommu_type1_info info;
+        struct vfio_iommu_type1_info *info;
 
         ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
         if (ret) {
@@ -1095,14 +1185,14 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
          * existing Type1 IOMMUs generally support any IOVA we're
          * going to actually try in practice.
          */
-        info.argsz = sizeof(info);
-        ret = ioctl(fd, VFIO_IOMMU_GET_INFO, &info);
+        ret = vfio_get_iommu_info(container, &info);
         /* Ignore errors */
-        if (ret || !(info.flags & VFIO_IOMMU_INFO_PGSIZES)) {
+        if (ret || !(info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
             /* Assume 4k IOVA page size */
-            info.iova_pgsizes = 4096;
+            info->iova_pgsizes = 4096;
         }
-        vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
+        vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
+        g_free(info);
     } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_IOMMU) ||
                ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU)) {
         struct vfio_iommu_spapr_tce_info info;
@@ -1256,6 +1346,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
     if (QLIST_EMPTY(&container->group_list)) {
         VFIOAddressSpace *space = container->space;
         VFIOGuestIOMMU *giommu, *tmp;
+        VFIOIovaRange *iova, *next_iova;
 
         QLIST_REMOVE(container, next);
 
@@ -1266,6 +1357,11 @@ static void vfio_disconnect_container(VFIOGroup *group)
             g_free(giommu);
         }
 
+        QLIST_FOREACH_SAFE(iova, &vfio_iova_regions, next, next_iova) {
+            QLIST_REMOVE(iova, next);
+            g_free(iova);
+        }
+
         trace_vfio_disconnect_container(container->fd);
         close(container->fd);
         g_free(container);
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index d936014..874fe2c 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -164,6 +164,12 @@ typedef struct VFIODisplay {
     } dmabuf;
 } VFIODisplay;
 
+typedef struct VFIOIovaRange {
+    uint64_t start;
+    uint64_t end;
+    QLIST_ENTRY(VFIOIovaRange) next;
+} VFIOIovaRange;
+
 void vfio_put_base_device(VFIODevice *vbasedev);
 void vfio_disable_irqindex(VFIODevice *vbasedev, int index);
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index);
@@ -187,6 +193,7 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 extern const MemoryRegionOps vfio_region_ops;
 extern QLIST_HEAD(vfio_group_head, VFIOGroup) vfio_group_list;
 extern QLIST_HEAD(vfio_as_head, VFIOAddressSpace) vfio_address_spaces;
+extern QLIST_HEAD(vfio_iova_head, VFIOIovaRange) vfio_iova_regions;
 
 #ifdef CONFIG_LINUX
 int vfio_get_region_info(VFIODevice *vbasedev, int index,
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index 3a0a305..117341d 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -589,7 +589,30 @@ struct vfio_iommu_type1_info {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_IOMMU_INFO_PGSIZES (1 << 0)	/* supported page sizes info */
+#define VFIO_IOMMU_INFO_CAPS	(1 << 1)	/* Info supports caps */
 	__u64	iova_pgsizes;		/* Bitmap of supported page sizes */
+	__u32   cap_offset;	/* Offset within info struct of first cap */
+};
+
+/*
+ * The IOVA capability allows to report the valid IOVA range(s)
+ * excluding any reserved regions associated with dev group. Any dma
+ * map attempt outside the valid iova range will return error.
+ *
+ * The structures below define version 1 of this capability.
+ */
+#define VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE  1
+
+struct vfio_iova_range {
+	__u64	start;
+	__u64	end;
+};
+
+struct vfio_iommu_type1_info_cap_iova_range {
+	struct vfio_info_cap_header header;
+	__u32	nr_iovas;
+	__u32	reserved;
+	struct vfio_iova_range iova_ranges[];
 };
 
 #define VFIO_IOMMU_GET_INFO _IO(VFIO_TYPE, VFIO_BASE + 12)
-- 
2.7.4


