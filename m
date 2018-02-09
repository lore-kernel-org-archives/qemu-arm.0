Received: by 10.28.71.27 with SMTP id u27csp1213447wma;
        Fri, 9 Feb 2018 09:51:22 -0800 (PST)
X-Google-Smtp-Source: AH8x227pudUlOrZmLHjtA1X5yHZtniCLk2vDdyl3qWjNExm+Pn6UCyNSN8BVsEr1/mRi8RdA324N
X-Received: by 10.129.235.13 with SMTP id n13mr2565824ywm.414.1518198682416;
        Fri, 09 Feb 2018 09:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518198682; cv=none;
        d=google.com; s=arc-20160816;
        b=HuViQFKxTXWbmk4kSOykXVT238DrI28iHL5XBCCJ9jc37pKdj2/c0+1ncf82Yh3OYh
         g4ZeWm31YApINyqjeWl8UiWbfdjvjLDJv49iHpEX2iKl0BffA01sucWFH2j5wMPmFN63
         1MRYMryqIB217ELcyI81xwMLwmAg/GcpHoycm2yEO40oj/wSFew3sRPg8CQSPNoIqfiU
         r1qLhxp6FXDYntPRUqrJBqaeeeLoUuxBF+GHxVE/d+1a7S0FlycrXcnqQH+vZuiqvA7R
         9I8OptRrd20eCQ+mXa7+8OizVhbzOzdVZHCbHCUHEjpusajNqY0jE8LLDV/S7n79tH66
         6AVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=fg58VMww4mKN1p5fXdoZdkTRsmwOPtV3092k6HwfhsI=;
        b=noKs6LlkuiCrBrJdEnfF371UgTFrlHuw27tsck+k+3c1ua3gLYlTtoDL6HCEO/WFo9
         4z1MPJrpff4VoF4zi25OyjLK21b5IiURWhOi9ZoiMBbHDKVS0fARak72wxekmUgz3lFe
         pjeeHIjL1zm9P/bwYbJomceQC4YhmL2DG8ReMA3rHMdVNxNtxJvJFo7feqOKhOg9JP5d
         zrX6h7EabYl7IbKNm5YNiadxGCLsSZhgDVjRa334c2FXhIs1tm+27Oybsp/Ajl0SfWYX
         fMoEGs403XdV2WF8w6SvUcxBH0ot7fLCY1cfzIGNASlafr9Xkwo+k+Dda8cAx6WSMFRF
         t6UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z89si500502ybh.245.2018.02.09.09.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekCpV-0004SN-Qe
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:51:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekBDa-0007M8-9H
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:08:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekBDX-0001Et-2S
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:08:06 -0500
Received: from leibniz.telenet-ops.be ([195.130.137.77]:55064)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1ekBDW-0001DK-Jy
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:08:02 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
	[IPv6:2a02:1800:110:4::f00:19])
	by leibniz.telenet-ops.be (Postfix) with ESMTPS id 3zdJwl1s9GzMqg5w
	for <qemu-arm@nongnu.org>; Fri,  9 Feb 2018 16:32:55 +0100 (CET)
Received: from ayla.of.borg ([84.194.111.163])
	by laurent.telenet-ops.be with bizsmtp
	id 8fHm1x02c3XaVaC01fHmCm; Fri, 09 Feb 2018 16:17:50 +0100
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
	by ayla.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0003S6-Pf; Fri, 09 Feb 2018 16:17:46 +0100
Received: from geert by ramsan with local (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0000lS-OZ; Fri, 09 Feb 2018 16:17:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Fri,  9 Feb 2018 16:17:35 +0100
Message-Id: <1518189456-2873-5-git-send-email-geert+renesas@glider.be>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 195.130.137.77
X-Mailman-Approved-At: Fri, 09 Feb 2018 12:38:06 -0500
Subject: [Qemu-arm] [PATCH/RFC 4/5] vfio: No-IOMMU mode support
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d262yb12hkx0

From: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>

Add qemu support for the newly introduced VFIO No-IOMMU driver.

We need to add special handling for:
- Group character device is /dev/vfio/noiommu-$GROUP.
- No-IOMMU does not rely on a memory listener.
- No IOMMU will be set for its group, so no need to call
  vfio_kvm_device_add_group.

Signed-off-by: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
[geert: Rebase]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 hw/vfio/common.c              | 61 ++++++++++++++++++++++++++++++++++---------
 include/hw/vfio/vfio-common.h |  2 ++
 2 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f895e3c3359af779..2ee94a3304202a74 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1019,6 +1019,33 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->fd = fd;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
+    container->noiommu = group->noiommu;
+
+    if (container->noiommu) {
+        ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
+        if (ret) {
+            error_report("vfio: failed to set group container: %m");
+            ret = -errno;
+            goto free_container_exit;
+        }
+
+        ret = ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_NOIOMMU_IOMMU);
+        if (!ret) {
+            error_report("vfio: No available IOMMU models");
+            ret = -EINVAL;
+            goto free_container_exit;
+        }
+
+        ret = ioctl(fd, VFIO_SET_IOMMU, VFIO_NOIOMMU_IOMMU);
+        if (ret) {
+            error_report("vfio: failed to set iommu for container: %m");
+            ret = -errno;
+            goto free_container_exit;
+        }
+
+        goto listener_register;
+    }
+
     if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ||
         ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
         bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU);
@@ -1151,15 +1178,16 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     group->container = container;
     QLIST_INSERT_HEAD(&container->group_list, group, container_next);
 
-    container->listener = vfio_memory_listener;
-
-    memory_listener_register(&container->listener, container->space->as);
-
-    if (container->error) {
-        ret = container->error;
-        error_setg_errno(errp, -ret,
-                         "memory listener initialization failed for container");
-        goto listener_release_exit;
+listener_register:
+    if (!container->noiommu) {
+        container->listener = vfio_memory_listener;
+        memory_listener_register(&container->listener, container->space->as);
+        if (container->error) {
+            ret = container->error;
+            error_setg_errno(errp, -ret,
+                    "memory listener initialization failed for container");
+            goto listener_release_exit;
+        }
     }
 
     container->initialized = true;
@@ -1169,7 +1197,9 @@ listener_release_exit:
     QLIST_REMOVE(group, container_next);
     QLIST_REMOVE(container, next);
     vfio_kvm_device_del_group(group);
-    vfio_listener_release(container);
+    if (!container->noiommu) {
+        vfio_listener_release(container);
+    }
 
 free_container_exit:
     g_free(container);
@@ -1195,7 +1225,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
      * since unset may destroy the backend container if it's the last
      * group.
      */
-    if (QLIST_EMPTY(&container->group_list)) {
+    if (QLIST_EMPTY(&container->group_list) && !container->noiommu) {
         vfio_listener_release(container);
     }
 
@@ -1249,8 +1279,13 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
     snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
     group->fd = qemu_open(path, O_RDWR);
     if (group->fd < 0) {
-        error_setg_errno(errp, errno, "failed to open %s", path);
-        goto free_group_exit;
+        snprintf(path, sizeof(path), "/dev/vfio/noiommu-%d", groupid);
+        group->fd = qemu_open(path, O_RDWR);
+        if (group->fd < 0) {
+            error_setg_errno(errp, errno, "failed to open %s", path);
+            goto free_group_exit;
+        }
+        group->noiommu = 1;
     }
 
     if (ioctl(group->fd, VFIO_GROUP_GET_STATUS, &status)) {
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index f3a2ac9fee02066f..aca2e33efb9b118c 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -77,6 +77,7 @@ struct VFIOGroup;
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
     int fd; /* /dev/vfio/vfio, empowered by the attached groups */
+    bool noiommu;
     MemoryListener listener;
     MemoryListener prereg_listener;
     unsigned iommu_type;
@@ -136,6 +137,7 @@ struct VFIODeviceOps {
 typedef struct VFIOGroup {
     int fd;
     int groupid;
+    bool noiommu;
     VFIOContainer *container;
     QLIST_HEAD(, VFIODevice) device_list;
     QLIST_ENTRY(VFIOGroup) next;
-- 
2.7.4

