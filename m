Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1177387lfi;
        Mon, 23 Mar 2020 01:49:23 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsTw3skwYxrXU6jwRlavTAvzePHdwXiCypwDNBVeLP00TPHQQe1UxlwVWY7tPCzsDWrP5kw
X-Received: by 2002:a37:a213:: with SMTP id l19mr18847968qke.377.1584953362901;
        Mon, 23 Mar 2020 01:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584953362; cv=none;
        d=google.com; s=arc-20160816;
        b=arK5wE8T6cNILVighnSQaY5E3dunMzp05jSJqeUVwPbShLnNrDidERU5GYQMqCdTBo
         6Nln+1FBOh47LKTgubQQCA1EBEAvlqDLoR6QfeiAyL+/tgMGxtygj1lW//g/vCLpPBAo
         3e9mhmAaHKNKGRCDXjtx/s4uLQbvUa+wdIUCf476EL4t/FRwA9JB+uyzRv7QVfpdZa5c
         LEL2eEoZMFD/5uT4D5VHhgZVtwzaLgDNtbsuH2ic3WWMtpwbCOM95TTB2yd9j4U19QAi
         r0bug6239eguDGK3bgpWHmXxgUmwRffqACNpGujNKUdWDfomPRZ8BtVYjcb6qic8LtPo
         r/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=RiNtP0lrtaA2ZggFVaFqGet0PIqt/tlcLob6DvD3BIo=;
        b=KLb8UaK5z1vX/3AtVtvC4mzsQJX8WaoknDzKfEPdK+DCMww6WY4JjS0SrRoteRSWWm
         rXPu6sovrE9L5vEkdcuay7KwlkW26XOooAl5ECqedP2JeW73y/5kJxxBjbO3m4MUFPli
         ZSa7UGQ7wu9yxdj+MtdCbnXq53quvR12k6OMf24YnxlA6vLIeRD2hnrf/Pn8Sn9kgzQ/
         XLfwtbwRPL8O+qqXvbgL3PR6JPnOUyRq8j82Ir/OEi4FgQ14ekqR+veo7+nSZnpl0DZP
         Qg/biB7yXXM9gmjx5wEcMmDsggQfCMaKUODT+RaW0D0N6KUhZzJ8Wcs/sgRgN2IslFHn
         KFMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=xPsIXPFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20si8525982qkn.120.2020.03.23.01.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 01:49:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=xPsIXPFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:58668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGIlu-0002hv-3T
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 04:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjc-0008Vn-98
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjb-0003AA-82
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:47:00 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:35584)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjY-00039L-PN; Mon, 23 Mar 2020 04:46:56 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8eL99013746; Mon, 23 Mar 2020 01:46:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=RiNtP0lrtaA2ZggFVaFqGet0PIqt/tlcLob6DvD3BIo=;
 b=xPsIXPFZH1oBDFsmhrf4vd1qjKM+gRvSsYTpuGTLutwgM7aCvKuU1+Lgutt5N4zcrJgQ
 yUSMhQ4PRW97XYPXqfG73NELAFSyBEYLViw0AkZfNfPtCUy4N6+m9YainsvFkgoXz2Dr
 Z2jFZQBkzfhznDLi/LPGD+sDv7w5ogXuAYimPhC0Ks7sXiOQoRGxOoUlQMUhQg2dzf5Q
 5C7yXBz+6rvKilU8ualk7AGCRU0NDwY9sX7kqNFCEbA59cFYHNEO0YOxXgRS8ZHiSZcP
 faM5/b9Z7OU2PnCBpkzbINye+E/KKOd9YhAFXHW6p5/A8BDaiRvJICJ2H+qVBO41t6g7 RA== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
 by mx0b-0016f401.pphosted.com with ESMTP id 2ywvkqkxcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 01:46:51 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Mar
 2020 01:46:49 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Mar 2020 01:46:45 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v9 4/9] virtio-iommu: set supported page size mask
Date: Mon, 23 Mar 2020 14:16:12 +0530
Message-ID: <20200323084617.1782-5-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323084617.1782-1-bbhushan2@marvell.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_02:2020-03-21,
 2020-03-23 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dfHi+ZFrYZZu

Add optional interface to set page size mask.
Currently this is set global configuration and not
per endpoint.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 include/hw/virtio/virtio-iommu.h | 1 +
 hw/virtio/virtio-iommu.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 6f67f1020a..4efa09610a 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -35,6 +35,7 @@ typedef struct IOMMUDevice {
     void         *viommu;
     PCIBus       *bus;
     int           devfn;
+    uint64_t      page_size_mask;
     IOMMUMemoryRegion  iommu_mr;
     AddressSpace  as;
 } IOMMUDevice;
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4cee8083bc..a28818202c 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -650,6 +650,14 @@ static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     return (ua > ub) - (ua < ub);
 }
 
+static void virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
+                                            uint64_t page_size_mask)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+
+    sdev->page_size_mask = page_size_mask;
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -865,6 +873,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
 
     imrc->translate = virtio_iommu_translate;
+    imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.17.1

