Received: by 10.25.159.19 with SMTP id i19csp2423732lfe;
        Wed, 27 Jan 2016 05:52:21 -0800 (PST)
X-Received: by 10.55.26.6 with SMTP id a6mr34975868qka.0.1453902741466;
        Wed, 27 Jan 2016 05:52:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c195si2887249qhc.42.2016.01.27.05.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 05:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:50627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOQWC-00032o-IF
	for alex.bennee@linaro.org; Wed, 27 Jan 2016 08:52:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQW9-0002wD-3t
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQW4-0002AQ-4n
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:17 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:35156)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOQW3-0002AG-Tx
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 08:52:12 -0500
Received: by mail-wm0-x22e.google.com with SMTP id r129so145874177wmr.0
	for <qemu-arm@nongnu.org>; Wed, 27 Jan 2016 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m/sUPWwI+V6iWVZQmd7TY0OLyRNcL7ZsnZzsKZVuYhc=;
	b=OBe3xWAk6WXym0Mn6hQ5fwB8Rqx/6ByYHeO+UKEvSb7YDPiKqFZfbgf0SwbARTmYYs
	VJSQJaLidhEu9QB3vezq4b/culRaXQP8vhvuKG31QC+fJFiMcAubxX0PHNQM/H00l+/f
	3xmWrFA+H0JvgPPS4SATl4d8F+utCkpfuD8/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m/sUPWwI+V6iWVZQmd7TY0OLyRNcL7ZsnZzsKZVuYhc=;
	b=huN8bT1KMPqcztIpvcEQYE3VstaPkhCvhk07ksfdvdELxzLTccHbbWcxdEmU1sfq2h
	lWseF9GsZtgo+tnTWFzUPxugGTBK6Mvwaf1NaIM4PgyLedgHJZBLCoE+6iBAugDTHJYF
	lbxwt9z4Gl8NaSS9HytDq7sAkhXfMIMGs7TVoEa+mKiPI7QWdlEfVTWbrH3Lm7a85/Io
	+uo1ay9HlfdpZiPyw2en81BazC+lmGW+HQtKlFgH/ai33OiIxjBNr/M22mTqxbjSRFJS
	ceT17XthXce5hdvq93FvWkNWwoVH6C5TaPKTV7ctMLxOo3BuVPgSaQetipZ0GoHQHpkS
	NEKw==
X-Gm-Message-State: AG10YOSItd/I4Jq7lqs7ikmFxzfaVxAfEeeBQSoiaDzeT1b4axxD8TTwa3k0PSSXkW84V/QB
X-Received: by 10.28.173.208 with SMTP id w199mr28699707wme.45.1453902731211; 
	Wed, 27 Jan 2016 05:52:11 -0800 (PST)
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90])
	by smtp.gmail.com with ESMTPSA id t9sm6345866wjf.33.2016.01.27.05.52.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 05:52:09 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Wed, 27 Jan 2016 13:51:52 +0000
Message-Id: <1453902715-25304-5-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
References: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [RFC 4/7] hw: vfio: common: introduce
	vfio_register_reserved_iova
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
X-TUID: 9bGBoL2hGg2A

vfio_register_reserved_iova allows to register the reserved IOVA region,
typically for MSI frame binding purpose. The kernel allows registering
a single reserved IOVA region.

Unregistration is handled through legacy vfio_dma_unmap.

The function will become static in subsequent patches. However, since
there is no user yet, the compiler argues; the function is currently
not static and a dummy declaration needs to be added.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 hw/vfio/common.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6797208..247c87b 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -208,6 +208,36 @@ static int vfio_dma_unmap(VFIOContainer *container,
     return 0;
 }
 
+/**
+ * vfio_register_reserved_iova: registers the iova reserved region
+ *
+ * @container: container handle
+ * @iova: base iova of the reserved region
+ * @size: reserved region size
+ *
+ * unregistration is handled using vfio_dma_unmap
+ */
+int vfio_register_reserved_iova(VFIOContainer *container, hwaddr iova,
+                                ram_addr_t size);
+int vfio_register_reserved_iova(VFIOContainer *container, hwaddr iova,
+                                ram_addr_t size)
+{
+    struct vfio_iommu_type1_dma_map map = {
+        .argsz = sizeof(map),
+        .flags = VFIO_DMA_MAP_FLAG_MSI_RESERVED_IOVA,
+        .iova = iova,
+        .size = size,
+    };
+
+    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0) {
+        return 0;
+    }
+
+    error_report("VFIO_MAP_DMA/MSI_RESERVED_IOVA: %d", -errno);
+    return -errno;
+
+}
+
 static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
                         ram_addr_t size, void *vaddr, bool readonly)
 {
-- 
1.9.1

