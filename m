Received: by 10.25.159.19 with SMTP id i19csp2423784lfe;
        Wed, 27 Jan 2016 05:52:28 -0800 (PST)
X-Received: by 10.55.76.134 with SMTP id z128mr35562301qka.90.1453902748358;
        Wed, 27 Jan 2016 05:52:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q62si6095116qhq.32.2016.01.27.05.52.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 05:52:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:50630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOQWJ-0003HT-U3
	for alex.bennee@linaro.org; Wed, 27 Jan 2016 08:52:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQWC-00033W-VC
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQWB-0002C4-SB
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:20 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:36572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQWB-0002Bt-M7
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:19 -0500
Received: by mail-wm0-x22a.google.com with SMTP id l65so145799132wmf.1
	for <qemu-arm@nongnu.org>; Wed, 27 Jan 2016 05:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gME1jvM1eGCKe8gKexG1kYsgedrsR9kIY4HQ9sG1b5E=;
	b=bwIpgkURwwToCfW3HYD0Clk+D3+rKbX2+8Q/Oz7NlNZWkKOLI6D73kJyeK8ANopwUa
	eFtucHOPQppzHhRJihoI9GhlR1WinHEIGcp7hNsAoC3iJyQ24qE4JNwVQ9hU1366kjoB
	UTvRdmTwuTUulkt0GQ9mfYOI24brxKi2OOYHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gME1jvM1eGCKe8gKexG1kYsgedrsR9kIY4HQ9sG1b5E=;
	b=Edhpnzzu2qwrvAo4Bj4vB17qeOHlWHTAdFPS5RP5kIVlo/WvV5wgpkr75pbU6tuYoU
	vcTvQUwQX3eM/FcfOls94VMA9eh1DsSyl70rned3T+K7XVj7jhFEQEhW1T7/6F19D7eY
	aOZY9G7JKzwcxjNWwfXjgKbFdPDeewapYV/bbzOt5yk6BGbf2l1KA59nlpbHQ6gvNOAD
	2PQkiAavGdX7RwO7tZ601QzzLtOzRUF0OQ7TfQ/r0s0VCQxEcAjUV+LiwGsd7RDJ9WnD
	miYtkxVOorGCCK6+vbt/Zgij0ISabnj3aKCreeYKIpJPNVDFVm5XbGxonvSpkR8aQC4d
	N4ZQ==
X-Gm-Message-State: AG10YOSvR2rJn8XVBHR8BUx9VYs4JEAxHOtSbXMpaoZntdl92tELod4RevC/4aVGYmJkveee
X-Received: by 10.194.113.102 with SMTP id ix6mr33045460wjb.143.1453902738998; 
	Wed, 27 Jan 2016 05:52:18 -0800 (PST)
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90])
	by smtp.gmail.com with ESMTPSA id t9sm6345866wjf.33.2016.01.27.05.52.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 05:52:16 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Wed, 27 Jan 2016 13:51:54 +0000
Message-Id: <1453902715-25304-7-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
References: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC 6/7] hw: arm: virt: register reserved IOVA region
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
X-TUID: stY8VGQdk6v0

Registers a 16x64kB reserved iova region. Currently this iova
region is used by the kernel to map host MSI controller frames
(GICv2m, GITS_TRANSLATER).

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 hw/arm/virt.c         | 10 ++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3839c68..7eaf8be 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -125,6 +125,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
+    [VIRT_RESERVED] =           { 0x0be00000, 0x00100000 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
     [VIRT_PCIE_MMIO] =          { 0x10000000, 0x2eff0000 },
@@ -815,6 +816,8 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
     hwaddr size_pio = vbi->memmap[VIRT_PCIE_PIO].size;
     hwaddr base_ecam = vbi->memmap[VIRT_PCIE_ECAM].base;
     hwaddr size_ecam = vbi->memmap[VIRT_PCIE_ECAM].size;
+    hwaddr base_reserved = vbi->memmap[VIRT_RESERVED].base;
+    hwaddr size_reserved = vbi->memmap[VIRT_RESERVED].size;
     hwaddr base = base_mmio;
     int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
     int irq = vbi->irqmap[VIRT_PCIE];
@@ -822,6 +825,7 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
     MemoryRegion *mmio_reg;
     MemoryRegion *ecam_alias;
     MemoryRegion *ecam_reg;
+    MemoryRegion *reserved_reg;
     DeviceState *dev;
     char *nodename;
     int i;
@@ -838,6 +842,12 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
                              ecam_reg, 0, size_ecam);
     memory_region_add_subregion(get_system_memory(), base_ecam, ecam_alias);
 
+    reserved_reg = g_new0(MemoryRegion, 1);
+    memory_region_init_reserved_iova(reserved_reg, OBJECT(dev), "reserved-iova",
+                       size_reserved, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), base_reserved,
+                                reserved_reg);
+
     /* Map the MMIO window into system address space so as to expose
      * the section of PCI MMIO space which starts at the same base address
      * (ie 1:1 mapping for that part of PCI MMIO space visible through
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 1ce7847..194871b 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -61,6 +61,7 @@ enum {
     VIRT_PCIE_MMIO_HIGH,
     VIRT_GPIO,
     VIRT_SECURE_UART,
+    VIRT_RESERVED,
 };
 
 typedef struct MemMapEntry {
-- 
1.9.1

