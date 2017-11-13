Received: by 10.223.150.237 with SMTP id u100csp2395654wrb;
        Mon, 13 Nov 2017 04:31:53 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbdqaZy+Kf/H/nZ7IwUVMrNge3g8mPpBPqfT/Nrc97yOdcPa/FId5E4sn12RpFI92tXLmXd
X-Received: by 10.13.240.6 with SMTP id z6mr255421ywe.321.1510576313544;
        Mon, 13 Nov 2017 04:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510576313; cv=none;
        d=google.com; s=arc-20160816;
        b=fS/08eqt1GQA0zsLO+yeebS0op6xdlkxmwC9MWHYrGWBeHm622tR9e7CXwH44E2Rgk
         Vl9Rz0IRnKuNt1VvjZK++8CrVsE5fFCxZa9T3RJHkY+T7DVh9LfcK7ZNtUP5/JMttxFl
         DTdAHdMeM1HnHwJ47qOB8qgw3iEqLWSvIlhq8ERxjQ36fYMfuhK/XtCZztpL5dyUtFqz
         d0Bc7Ydrxjt1Lm5eXXsn/22tZGOlW1+lA4tFZRxUIkD2BiHfAUR9+Kubxo0FBRy76/Bg
         WalSbXA7+czjpLnXWQsd75HYH0VumkItUcCGO7Hmorhvc37leNJTlu8yDFp235XNXPs6
         Jp4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=fKsZSZj52yKf80WBghyyMLKaM0MONwxSvcAC2EXo/kQ=;
        b=Sxuy5G5EjzZtaQp/d3Ozgm8bHg8CVRHs5vgyio7PSGIiEOB46gDHaIj1IPAf9XLFZ4
         fFBuk9EzZBsc83rbFbNArIXVWU5g1No8kOJ8qSOESN6KF9FjMG43h4r9WXioknIL1Q8z
         KuVcucOu3D2opAeG6r7ihUPqnwak2Yfpri8OlNimv7tWONGrBCB1GxTo9TJn0JmjSfwy
         XiodPDnxFYJtO5Kmk27/y6OVhYPz7xqTbk6ekIzPXjUb/Ncjm+CkcCw4xf1bixpZ+Uwo
         RkTU4ipPsRg0BMN0UmOxjXJ5sViwQnKjXf7C+xmL2n7S60uLxlSyGBkvK+uRqrcLiu8Z
         F2Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j10si3341343ybl.773.2017.11.13.04.31.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 04:31:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEDu4-0007p3-Uw
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 07:31:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEDsT-0006sf-0M
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 07:30:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEDsO-0000xl-9O
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 07:30:13 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2347)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eEDsN-0000xG-F7; Mon, 13 Nov 2017 07:30:08 -0500
Received: from 172.30.72.59 (EHLO DGGEMS412-HUB.china.huawei.com)
	([172.30.72.59])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DKT03199; Mon, 13 Nov 2017 20:30:00 +0800 (CST)
Received: from localhost (10.177.27.25) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.361.1; Mon, 13 Nov 2017
	20:29:21 +0800
From: <zhuyijun@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>
Date: Mon, 13 Nov 2017 20:29:01 +0800
Message-ID: <1510576145-23084-2-git-send-email-zhuyijun@huawei.com>
X-Mailer: git-send-email 1.8.4.msysgit.0
In-Reply-To: <1510576145-23084-1-git-send-email-zhuyijun@huawei.com>
References: <1510576145-23084-1-git-send-email-zhuyijun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.5A099049.0013, ss=1, re=0.000, recu=0.000,
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
X-TUID: 27WURYdXBvpT

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


