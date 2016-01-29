Received: by 10.25.159.19 with SMTP id i19csp1055117lfe;
        Fri, 29 Jan 2016 08:57:48 -0800 (PST)
X-Received: by 10.140.220.134 with SMTP id q128mr12815059qhb.56.1454086668625;
        Fri, 29 Jan 2016 08:57:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a26si16045196qka.5.2016.01.29.08.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:57:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35337 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCMl-00089a-UA
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:57:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJQ-00029g-SM
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJP-00042J-Tp
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:20 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:33828)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJP-00042A-Jk
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 11:54:19 -0500
Received: by mail-wm0-x235.google.com with SMTP id 128so60851825wmz.1
	for <qemu-arm@nongnu.org>; Fri, 29 Jan 2016 08:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K9vXJ9fdBJF07Zx8bt3DW9yP494yTmhYatMxMqzAGx4=;
	b=bfd5HoEFRJ2m0wStI7PiDbH4Qdrx3X2UHRagB3rP45fCfd+CurLLyv+dG3k7421ajn
	oCsWf9CqfWsSjj9gJ9HKt0kQkmBSbJbS7G2VGBEY2JvvUmSeG4GUb/OjqA7rOk98hohw
	qoNotDN5w2XrskaZuQXvYOTcJef0UzmAs02Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K9vXJ9fdBJF07Zx8bt3DW9yP494yTmhYatMxMqzAGx4=;
	b=lxe1O4O14WQ9lSJmVpPgV5z+tZ/8a7LkLoEiymuuVoxL4h53nWwvRBMRPGkCH5up0g
	mqryfyco4JZ8kt8Po9Awe1soeC3mHXi0U+fGhABMLYgvxafyMevpJhUA+YafcK9+E0bB
	TJd1Ixo0Cx21XYGU9PZGDI+t9nukyaP9ZcwT3K3d+K207DNQnU3bDfEPea+4KRJ/m9V1
	knFDLu/8BtHnfXrTzeloxUlLwkRZKJvftnIX2y5/VtYeHOF/h6Wjjg0yrQa70xJaAi8B
	8QvYaAjBdxlPDNot7kqkxYmTMHFULv/FFloJGfFdnF0ETNbmNoZLop+0/wj+dHrItxc8
	h6hQ==
X-Gm-Message-State: AG10YOTQ+l9s46RBSP5vqew/xvy/X0MwRQsMUWgxFwnom4HHFDWcQV0DOXjm3Zo92yMf8LWB
X-Received: by 10.28.5.213 with SMTP id 204mr9694489wmf.20.1454086458925;
	Fri, 29 Jan 2016 08:54:18 -0800 (PST)
Received: from new-host-12.home
	(LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
	by smtp.gmail.com with ESMTPSA id
	ei9sm16415530wjd.40.2016.01.29.08.54.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 08:54:17 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Fri, 29 Jan 2016 16:53:49 +0000
Message-Id: <1454086429-4373-9-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC v2 8/8] hw: vfio: common: adapt vfio_listeners for
	reserved_iova region
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w+nSyHwQ2S/R

In case of reserved iova region, let's declare this region to the
kernel so that it can use it for IOVA/PA bindings.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 hw/vfio/common.c | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 247c87b..ee957ba 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -217,10 +217,8 @@ static int vfio_dma_unmap(VFIOContainer *container,
  *
  * unregistration is handled using vfio_dma_unmap
  */
-int vfio_register_reserved_iova(VFIOContainer *container, hwaddr iova,
-                                ram_addr_t size);
-int vfio_register_reserved_iova(VFIOContainer *container, hwaddr iova,
-                                ram_addr_t size)
+static int vfio_register_reserved_iova(VFIOContainer *container, hwaddr iova,
+                                       ram_addr_t size)
 {
     struct vfio_iommu_type1_dma_map map = {
         .argsz = sizeof(map),
@@ -271,6 +269,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
 static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
+            !memory_region_is_reserved_iova(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
            /*
             * Sizing an enabled 64-bit BAR can cause spurious mappings to
@@ -354,7 +353,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
     hwaddr iova, end;
     Int128 llend;
     void *vaddr;
-    int ret;
+    int ret = -1;
 
     if (vfio_listener_skipped_section(section)) {
         trace_vfio_listener_region_add_skip(
@@ -418,24 +417,35 @@ static void vfio_listener_region_add(MemoryListener *listener,
         return;
     }
 
-    /* Here we assume that memory_region_is_ram(section->mr)==true */
+    /* Here we assume that the memory region is ram or reserved iova */
 
-    vaddr = memory_region_get_ram_ptr(section->mr) +
-            section->offset_within_region +
-            (iova - section->offset_within_address_space);
+    if (memory_region_is_ram(section->mr)) {
+        vaddr = memory_region_get_ram_ptr(section->mr) +
+                section->offset_within_region +
+                (iova - section->offset_within_address_space);
 
-    trace_vfio_listener_region_add_ram(iova, end - 1, vaddr);
+        trace_vfio_listener_region_add_ram(iova, end - 1, vaddr);
 
-    ret = vfio_dma_map(container, iova, end - iova, vaddr, section->readonly);
-    if (ret) {
-        error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                     "0x%"HWADDR_PRIx", %p) = %d (%m)",
-                     container, iova, end - iova, vaddr, ret);
-        goto fail;
+        ret = vfio_dma_map(container, iova, end - iova, vaddr,
+                           section->readonly);
+        if (ret) {
+            error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
+                         "0x%"HWADDR_PRIx", %p) = %d (%m)",
+                         container, iova, end - iova, vaddr, ret);
+            goto fail;
+        }
+        return;
+    } else if (memory_region_is_reserved_iova(section->mr)) {
+        ret = vfio_register_reserved_iova(container, iova, end - iova);
+        if (ret) {
+            error_report("vfio_register_reserved_iova(%p, 0x%"HWADDR_PRIx", "
+                         "0x%"HWADDR_PRIx") = %d (%m)",
+                         container, iova, end - iova, ret);
+            goto fail;
+        }
+        return;
     }
 
-    return;
-
 fail:
     /*
      * On the initfn path, store the first error in the container so we
-- 
1.9.1

