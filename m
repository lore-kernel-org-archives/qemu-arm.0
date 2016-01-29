Received: by 10.25.159.19 with SMTP id i19csp1053928lfe;
        Fri, 29 Jan 2016 08:55:06 -0800 (PST)
X-Received: by 10.55.79.134 with SMTP id d128mr11782066qkb.73.1454086506446;
        Fri, 29 Jan 2016 08:55:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v67si18503957qgv.34.2016.01.29.08.55.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:55:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCK9-00034Q-TU
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:55:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJF-0001oV-2D
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 11:54:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJE-0003yZ-6B
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 11:54:08 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:34743)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJD-0003yG-WB
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 11:54:08 -0500
Received: by mail-wm0-x22c.google.com with SMTP id 128so60844338wmz.1
	for <qemu-devel@nongnu.org>; Fri, 29 Jan 2016 08:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m/sUPWwI+V6iWVZQmd7TY0OLyRNcL7ZsnZzsKZVuYhc=;
	b=WIiXRs06xWi9/JqaA44efiaoSZKeuW5+8da30Ib4pCRUKznbdXfrJn97PcLAohQi0B
	QQ3h+F245BY+n7sZqEIRrKIBGMyMSz1nIlWFQr9eiyevl8lp7Y44912toGZEl51+mx1g
	PJxK9c4hwayAQ+FRZJwTNHBkb0rtpd8UJq6kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m/sUPWwI+V6iWVZQmd7TY0OLyRNcL7ZsnZzsKZVuYhc=;
	b=FVNhY1UUSADXIk9HFSLOtkHA6NsYYAHz5Bhyd1I8dHqKeMoGhMdkxA5v2YHsEIxIOP
	cX7kXyh7ib/HIu34Ng0VA1KJyu3scMcygSHsjK2qrIhQaX5SnhOwP+qz/TxOkz+VCh9Y
	KoGGVouXELHa9V/ZbJvULZn8vRHE04J4Ewb28aNR9kyOp+smGS7rB2Q3PNKcvOcvbMCC
	9PINcRVCWPTj9R39/Odl8NeSGRj8rkYaiiKtrGT3x2Tq7ohwt2c4QZHhcqCH7FYc458R
	+CdE5UdUE87WEiC57ewIOa/TZWyATDQyFx9FHEIntoPbVf6bCsdjsaN0QxLtMDYcc7lv
	b2XA==
X-Gm-Message-State: AG10YOQhCOcagBt7pjdKe6EKaLL1bV0PRolVW9W3Gq6N39lE/mgAKXSZnbD4QYOm4c8t+y2I
X-Received: by 10.194.21.135 with SMTP id v7mr9822638wje.131.1454086447339;
	Fri, 29 Jan 2016 08:54:07 -0800 (PST)
Received: from new-host-12.home
	(LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
	by smtp.gmail.com with ESMTPSA id
	ei9sm16415530wjd.40.2016.01.29.08.54.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 08:54:05 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Fri, 29 Jan 2016 16:53:45 +0000
Message-Id: <1454086429-4373-5-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-devel] [RFC v2 4/8] hw: vfio: common: introduce
	vfio_register_reserved_iova
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NEI3t4Owq41q

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

