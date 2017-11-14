Received: by 10.223.150.237 with SMTP id u100csp3057322wrb;
        Mon, 13 Nov 2017 17:18:07 -0800 (PST)
X-Google-Smtp-Source: AGs4zMay3WR8PFRQbk+Lf5lqtndjKaKpu4GtS/6Y2YWu2xJqtHqkPSlAWVOkTxtFBVkSVdmTQshF
X-Received: by 10.37.211.80 with SMTP id e77mr2906750ybf.329.1510622287668;
        Mon, 13 Nov 2017 17:18:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510622287; cv=none;
        d=google.com; s=arc-20160816;
        b=oXd83E4ZKeXcrydnSw399FMdMh+PkK/RAuQ7JZ/23pZIXlHcjnSdu6XQeZ8zsLFbNB
         ucII4rwfSFuRAWgSniVGI6Nvb2XH4QmrFIJZIEsCUltGS5kVVqQ11ZgjhIjov3fGaz9C
         ucI1BJW5kESonu6WEUg659Ijoz8YXy+o6UL7JM9QXd0SbjeCJbwlP/UvraEPsy2n1fdD
         21W0lShXIIw6WvhH7EC3/hLEVAwJymKlffoeNfOLhp73awXCLerIdhUr+xjV+NKEFgEd
         Lq8R3tSznZGeoT6Qj2xS4KsMeI3rwj2Q7is+tEQu9sA8CpHm/b2oQPTqpA8o2d5kUydX
         QShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=fKsZSZj52yKf80WBghyyMLKaM0MONwxSvcAC2EXo/kQ=;
        b=XhmHHVB+hysp5jshhDE+EBpFx+JgJIKYvtQ1uxjcAePV5iZfX7dbbP5hO6p5rjUZYS
         7n2N2f+yd8L54t8mUuIj4aYC9q/4vXE2vGpz7lrVWTWD4Jj2SsKPaRjZS1sFzmvQYec2
         T1UZzzzteSSIbdx0kYeNh9PWB0sPWfRQHv7BstycipoUQnfXeTnkvLQH+baUawrJowyP
         0SgZ8uVmxf2KsOsIgcJ+F9tbEuyzNNbN0Rc5PYuKiw2uRwyxnAHmZCvTZzk00p4JV+XS
         F4tORjWw83z5W2QPZqd5GSVNWynxW/crBRpwp+VJOeg1pRiWHXDRk4rKqisndUdzKyXU
         FQiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h1si3854724ywa.137.2017.11.13.17.18.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 17:18:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEPrb-0004Hn-1F
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 20:18:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEPpt-0002XC-2t
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 20:16:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEPpo-0003ck-Po
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 20:16:21 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2350)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eEPpn-0003Xd-RP; Mon, 13 Nov 2017 20:16:16 -0500
Received: from 172.30.72.60 (EHLO DGGEMS407-HUB.china.huawei.com)
	([172.30.72.60])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DKT86839; Tue, 14 Nov 2017 09:16:06 +0800 (CST)
Received: from localhost (10.177.27.25) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.361.1; Tue, 14 Nov 2017
	09:15:56 +0800
From: <zhuyijun@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>
Date: Tue, 14 Nov 2017 09:15:50 +0800
Message-ID: <1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
X-Mailer: git-send-email 1.8.4.msysgit.0
In-Reply-To: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5A0A43D6.0134, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 4b8fec13b3fdd04b975ecdebe6c4a9bd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
 reserved_region of device iommu group
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
Cc: peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5nl/JIlHaezh

From: Zhu Yijun <zhuyijun@huawei.com>

With kernel 4.11, iommu/smmu will populate the MSI IOVA reserved window and
PCI reserved window which has to be excluded from Guest iova allocations.

However, If it falls within the Qemu default virtual memory address space,
then reserved regions may get allocated for a Guest VF DMA iova and it will
fail.

So get those reserved regions in this patch and create some holes in the Qemu
ram address in next patchset.

Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
---
 hw/vfio/common.c              | 67 +++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.c                 |  2 ++
 hw/vfio/platform.c            |  2 ++
 include/exec/memory.h         |  7 +++++
 include/hw/vfio/vfio-common.h |  3 ++
 5 files changed, 81 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7b2924c..01bdbbd 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,8 @@ struct vfio_group_head vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
 struct vfio_as_head vfio_address_spaces =
     QLIST_HEAD_INITIALIZER(vfio_address_spaces);
+struct reserved_ram_head reserved_ram_regions =
+    QLIST_HEAD_INITIALIZER(reserved_ram_regions);
 
 #ifdef CONFIG_KVM
 /*
@@ -52,6 +54,71 @@ struct vfio_as_head vfio_address_spaces =
 static int vfio_kvm_device_fd = -1;
 #endif
 
+void update_reserved_regions(hwaddr addr, hwaddr size)
+{
+    RAMRegion *reg, *new;
+
+    new = g_new(RAMRegion, 1);
+    new->base = addr;
+    new->size = size;
+
+    if (QLIST_EMPTY(&reserved_ram_regions)) {
+        QLIST_INSERT_HEAD(&reserved_ram_regions, new, next);
+        return;
+    }
+
+    /* make the base of reserved_ram_regions increase */
+    QLIST_FOREACH(reg, &reserved_ram_regions, next) {
+        if (addr > (reg->base + reg->size - 1)) {
+            if (!QLIST_NEXT(reg, next)) {
+                QLIST_INSERT_AFTER(reg, new, next);
+                break;
+            }
+            continue;
+        } else if (addr >= reg->base && addr <= (reg->base + reg->size - 1)) {
+            /* discard the duplicate entry */
+            if (addr == reg->base && size == reg->size) {
+                g_free(new);
+                break;
+            } else {
+                QLIST_INSERT_AFTER(reg, new, next);
+                break;
+            }
+        } else {
+            QLIST_INSERT_BEFORE(reg, new, next);
+            break;
+        }
+    }
+}
+
+void vfio_get_iommu_group_reserved_region(char *group_path)
+{
+    char *filename;
+    FILE *fp;
+    hwaddr start, end;
+    char str[10];
+    struct stat st;
+
+    filename = g_strdup_printf("%s/iommu_group/reserved_regions", group_path);
+    if (stat(filename, &st) < 0) {
+        g_free(filename);
+        return;
+    }
+
+    fp = fopen(filename, "r");
+    if (!fp) {
+        g_free(filename);
+        return;
+    }
+
+    while (fscanf(fp, "%"PRIx64" %"PRIx64" %s", &start, &end, str) != EOF) {
+        update_reserved_regions(start, (end - start + 1));
+    }
+
+    g_free(filename);
+    fclose(fp);
+}
+
 /*
  * Common VFIO interrupt disable
  */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index c977ee3..9bffb38 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2674,6 +2674,8 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vdev->vbasedev.type = VFIO_DEVICE_TYPE_PCI;
     vdev->vbasedev.dev = &vdev->pdev.qdev;
 
+    vfio_get_iommu_group_reserved_region(vdev->vbasedev.sysfsdev);
+
     tmp = g_strdup_printf("%s/iommu_group", vdev->vbasedev.sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
     g_free(tmp);
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index da84abf..d5bbc3a 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -578,6 +578,8 @@ static int vfio_base_device_init(VFIODevice *vbasedev, Error **errp)
         return -errno;
     }
 
+    vfio_get_iommu_group_reserved_region(vbasedev->sysfsdev);
+
     tmp = g_strdup_printf("%s/iommu_group", vbasedev->sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
     g_free(tmp);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5ed4042..2bcc83b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -46,6 +46,13 @@
         OBJECT_GET_CLASS(IOMMUMemoryRegionClass, (obj), \
                          TYPE_IOMMU_MEMORY_REGION)
 
+/* Scattered RAM memory region struct */
+typedef struct RAMRegion {
+    hwaddr base;
+    hwaddr size;
+    QLIST_ENTRY(RAMRegion) next;
+} RAMRegion;
+
 typedef struct MemoryRegionOps MemoryRegionOps;
 typedef struct MemoryRegionMmio MemoryRegionMmio;
 
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index f3a2ac9..3483ca6 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -161,10 +161,13 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+void update_reserved_regions(hwaddr addr, hwaddr size);
+void vfio_get_iommu_group_reserved_region(char *group_path);
 
 extern const MemoryRegionOps vfio_region_ops;
 extern QLIST_HEAD(vfio_group_head, VFIOGroup) vfio_group_list;
 extern QLIST_HEAD(vfio_as_head, VFIOAddressSpace) vfio_address_spaces;
+extern QLIST_HEAD(reserved_ram_head, RAMRegion) reserved_ram_regions;
 
 #ifdef CONFIG_LINUX
 int vfio_get_region_info(VFIODevice *vbasedev, int index,
-- 
1.8.3.1


