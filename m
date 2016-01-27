Received: by 10.25.159.19 with SMTP id i19csp2423814lfe;
        Wed, 27 Jan 2016 05:52:32 -0800 (PST)
X-Received: by 10.140.170.212 with SMTP id q203mr36325259qhq.32.1453902752129;
        Wed, 27 Jan 2016 05:52:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l88si6664903qgf.84.2016.01.27.05.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 05:52:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:50631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOQWN-0003P6-KA
	for alex.bennee@linaro.org; Wed, 27 Jan 2016 08:52:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQWK-0003IO-1B
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQWF-0002Ch-1i
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:27 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:38732)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQWE-0002CV-NZ
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:22 -0500
Received: by mail-wm0-x231.google.com with SMTP id p63so27409499wmp.1
	for <qemu-arm@nongnu.org>; Wed, 27 Jan 2016 05:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K9vXJ9fdBJF07Zx8bt3DW9yP494yTmhYatMxMqzAGx4=;
	b=YJvk+Tx+a1m2WtcANMfFMFxNfvYF42n7SN9me7YjeQnY42JZLaFl+tKbPi4VwibE0F
	UYt0vLdFtznEG9AXDtiCWn+F1AqhQUUODWWZnu2PA3pvYBvRYrJd5llxhkfEw7w2R/1o
	lGdahGrQF+Dwwnugm5fTnr9/0bsuBt7VAnZaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K9vXJ9fdBJF07Zx8bt3DW9yP494yTmhYatMxMqzAGx4=;
	b=Lo0DV47w45kIBlCEsOvyt0NhIn9vqrcDjEqtL/7YAAdJbcLQxzn21Cmv0ObKy51oag
	wCZLgwmrygqFUOBTrsHFj8++iDzMYiwnbLVWcupxE/bwFRPlICypCO4wb+ZECPuOjo92
	/R1X5xsEYv7wkohX6KPMzQPpuJ1FsElbUX0eNJs8ZJibTuDR4z40yx+03Orb4hhA/HTs
	7aM9FgVsXlprzJjLFpPSdiH48BgqR0QccQmAVM/BAGlahyr5uBwMtKyKIliNE9ui7dWD
	ynV4V20yJqKAwsKX1wXeg8XizDluiSr0XY7BzO2Mj4JoNV87RApZSmPNblsYOue6fT2C
	FBgA==
X-Gm-Message-State: AG10YOSCdbuB+RpGzBmD6ly444aZ/70g2kLMYeHrP5Kk2OciG8YgfWtqFhJbRfO28f1lF9BB
X-Received: by 10.28.50.193 with SMTP id y184mr31490025wmy.103.1453902741988; 
	Wed, 27 Jan 2016 05:52:21 -0800 (PST)
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90])
	by smtp.gmail.com with ESMTPSA id t9sm6345866wjf.33.2016.01.27.05.52.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 05:52:20 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Wed, 27 Jan 2016 13:51:55 +0000
Message-Id: <1453902715-25304-8-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
References: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC 7/7] hw: vfio: common: adapt vfio_listeners for
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
X-TUID: YWyMHiNKGVvw

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

