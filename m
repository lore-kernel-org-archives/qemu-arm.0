Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp613592lfe;
        Wed, 18 Mar 2020 03:13:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuf4h4NDG2bRO3WKwys65AFdqIOWhwT/Ir8x7On31xBuJ5EkYG0tEbzxswL62XHrXyCx9FB
X-Received: by 2002:ac8:c09:: with SMTP id k9mr3595343qti.241.1584526382724;
        Wed, 18 Mar 2020 03:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584526382; cv=none;
        d=google.com; s=arc-20160816;
        b=bfC5U62xCHCQgsVsUeFuDRV07eNiplXjB5Jw23dbNtbZkfeJVTB7v2IBx+D3Pkbj1d
         6gA++bZl/1GJ9ScaU3al5JNpAM0z2Ez/ZqkaH2mkoZGeT6NIEKYGBRVgYOglEIltkow6
         HSULKfgMIiRGWsXVaTxBQ/ekJiV+EENGpgNVrQZBy6zFbke1LpFWJZy383To4MBPKsLD
         GsqBiLzw5z47uK2YmECSk43b+X7zxxa3HeeSv8L3o33ayYAtYY5a/eniCpnWADnBGcz5
         7WxM2sJRPQMVQ97DyTe31tDcpq4rS0tC1QyhwRBsOBoZ+y5tUK3VE/Fo4jPi6ElapN1z
         JnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=w1PjheBBbpwXuVOh06nYaUHWFHP75aU7PlNsOsBVK/M=;
        b=PdsCbJCOqhRaeRpkMH4qwtFQ0kRreEFfp/LGgOcoP9uhDqsnfhRMqF1W+V8R4h/gF7
         IQSaeAQ3wlQlMK6mUabP8AJGlXxzmVeIu7JC0qR8ebeuBAcNQvUzA41M2VqSKi7aJfIj
         iTZ6DlO/3V/vm/mN6m1Zn0Vv4/j/173Rd1lBAaOnJq3NS8gLZDwyhqhN8h/PCa/k9a49
         qZu6zXh96auoZCsa33djBSKLlaksOSqkiOvATUrvoxFQzqzP+D6yzXdv8EjUbSNPSB4l
         7oxSgWOuHo/UYtQI2gs9VAHXR6uf44RcefbJU2Ye/6XawgGaQYr8UtzrADB0NpNGBF37
         0JNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=UiwThwlR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h24si3471561qtm.206.2020.03.18.03.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 03:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=UiwThwlR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEVh8-0002Lq-2Q
	for alex.bennee@linaro.org; Wed, 18 Mar 2020 06:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgg-0002FD-Q6
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 06:12:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgf-0004g6-Pf
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 06:12:34 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:12606)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgf-0004fj-Kg; Wed, 18 Mar 2020 06:12:33 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IABnOe030625; Wed, 18 Mar 2020 03:12:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=w1PjheBBbpwXuVOh06nYaUHWFHP75aU7PlNsOsBVK/M=;
 b=UiwThwlRdc9P2BQsawOW/7Ikty4/+xO0V7mNB9v4f0nP9lXVaAAyr8RVLArJ13swtCZZ
 7MZUn3U579LjiGc5MUrj/wz183R7j+PzWmss9Hr/UHWxpjCa1QNC8X2sp7uxx2QPgbvf
 MU38AUTb2/dEWLfwQiC4DL0Gkmwkrd/h7oVz8/H1+ZTqcMeBJ8UMhZbLLJQw6vWilFn6
 gpKzUaiP8lsakrhVgKJb/VoaKPwXMC9wgZPsS0RI93NVh/H5dojssfTnbJ7BIcPofoBD
 TICb5KM9o/OkhoLqjl2B+IuCVMxeNGunE71mUfyUhslng2JXoMO0OwKV341q2a5YwBOM 3g== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yu9rp9tv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 03:12:31 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Mar
 2020 03:12:29 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Mar 2020 03:12:25 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v8 4/8] virtio-iommu: set supported page size mask
Date: Wed, 18 Mar 2020 15:41:55 +0530
Message-ID: <20200318101159.8767-5-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318101159.8767-1-bbhushan2@marvell.com>
References: <20200318101159.8767-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zGqVu1AC1Mje

Add optional interface to set page size mask.
Currently this is set global configuration and not
per endpoint.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
v7->v8:
 - new patch

 hw/virtio/virtio-iommu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4cee8083bc..c00a55348d 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -650,6 +650,15 @@ static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     return (ua > ub) - (ua < ub);
 }
 
+static void virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
+                                            uint64_t page_size_mask)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+
+    s->config.page_size_mask = page_size_mask;
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -865,6 +874,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
 
     imrc->translate = virtio_iommu_translate;
+    imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.17.1

