Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1179365lfi;
        Mon, 23 Mar 2020 01:52:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vurfonIcNv7/geoHpQGErCybf9TFSs0bwYZxWRH3FNadCWmXTclKcG+9YXCjxgkoBxuYKSl
X-Received: by 2002:a05:620a:4f7:: with SMTP id b23mr18426140qkh.188.1584953533293;
        Mon, 23 Mar 2020 01:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584953533; cv=none;
        d=google.com; s=arc-20160816;
        b=M1/6IGMQyQKXwkzXhCxlVG2sut119uNgzCpKIvp1Koxj5OBxFx7PPK3yQQY8iCEcP8
         L+x8vJ4kEXBanc4E27A8D4iIIy7R/b85G7IRTM8pCOI9DyLJCSptiU08qzlykCMkhg3h
         xGsyPotgRTpw5dmaPWybfnWZwMZ4Pxu75j9oV99bQXa2kN9aVSb7YuH1ynQ6mPjtOJmj
         7/EycC6Etq99iC1bjOuAjaHMpfF5+73KVKEnqMuqDv2K0CaW8nqGuP1vMPUI2RHyL0L1
         V72Kjo7TLAG8EJcMiIB/25LY84lSPR8gAMJOt6F6uMIW+JQTfL3/9lRsN2jbYRMIvIfI
         kSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=Hl/XyCKAJ1EEPKyfPSElXYvi1a0lw4Ra95KpUJUtj48=;
        b=VYNRJOrLMJ42w6XlFVBPZPKbk7pI0lWB97nHhatbFmYDkHvGmOx55fYjxwGVjdaOvx
         T+arngwqwKrJCJc1Jq4jtinoI//QxuZQ5WmaNmhLjvXIz1CeWO7g9H7YVzfATsNaUJC/
         w/m5biXfqAecCoYjD5HCMaDc83f6CEVRuFVcfX+we4tjWEJiSrCdExtQgdYcuwXE/ryZ
         0yJVtPTZvIFkJ2N1WDZXM5x8E/1z6lhpQJr9yYKGXd5jFLoBGs0/YL1E6ILflGUYOpnG
         VZTiVsqUShAFJuwQ0yxH9K6jyazcF7bTBr6J/YiXyK8aBrusRorgHRvoy7wm7IAr/WT7
         X3SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=fiuIkYT8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h125si8123777qke.59.2020.03.23.01.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 01:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=fiuIkYT8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:58750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGIoe-00076F-Kd
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 04:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjp-0000BI-1n
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 04:47:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjn-0003Gi-Ct
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 04:47:12 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:51134
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjn-0003FA-4J; Mon, 23 Mar 2020 04:47:11 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8eAku010847; Mon, 23 Mar 2020 01:47:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=Hl/XyCKAJ1EEPKyfPSElXYvi1a0lw4Ra95KpUJUtj48=;
 b=fiuIkYT8TdNFxpSIVM3lmovpu+wPxAWI8lQFeyTohtExktEWTG11LH8mxsgIumzXpFgm
 CO9VSOaBSOden30k7WtSos8K0aCilpDPmC24pRiL5Pdi3NPY4AK048tpDWut2LPhD8rB
 zk3yiTHcoqaF25rWSJ6/VjCSX5liGsZvamyOsnGS/gCmDkL9pjWdmL9OYYxQ53w9lqqN
 sLcJfWS7+8je7Svh7ScDvZc6t29R4BzHa+XVi3o2WCqpzE8En69KY2TG4P641oTGVr7K
 X64TtjY2ZwEmOarz8Frutmtpkp9wN58QHPaGCrEZP9DhSCAnjs7HrmOeOPAjXYUKce84 og== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
 by mx0a-0016f401.pphosted.com with ESMTP id 2ywg9ndrx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 01:47:08 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Mar
 2020 01:47:06 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Mar 2020 01:47:02 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v9 7/9] virtio-iommu: add iommu replay
Date: Mon, 23 Mar 2020 14:16:15 +0530
Message-ID: <20200323084617.1782-8-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323084617.1782-1-bbhushan2@marvell.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_02:2020-03-21,
 2020-03-23 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.148.174
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
X-TUID: bss5nA3aS8If

Default replay does not work with virtio-iommu,
so this patch provide virtio-iommu replay functionality.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/virtio/virtio-iommu.c | 44 ++++++++++++++++++++++++++++++++++++++++
 hw/virtio/trace-events   |  1 +
 2 files changed, 45 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 88849aa7b9..747e3cf1da 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -770,6 +770,49 @@ static void virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
     sdev->page_size_mask = page_size_mask;
 }
 
+static gboolean virtio_iommu_remap(gpointer key, gpointer value, gpointer data)
+{
+    VirtIOIOMMUMapping *mapping = (VirtIOIOMMUMapping *) value;
+    VirtIOIOMMUInterval *interval = (VirtIOIOMMUInterval *) key;
+    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
+
+    trace_virtio_iommu_remap(interval->low, mapping->phys_addr,
+                             interval->high - interval->low + 1);
+    /* unmap previous entry and map again */
+    virtio_iommu_notify_unmap(mr, interval->low,
+                              interval->high - interval->low + 1);
+
+    virtio_iommu_notify_map(mr, interval->low, mapping->phys_addr,
+                            interval->high - interval->low + 1);
+    return false;
+}
+
+static void virtio_iommu_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+    uint32_t sid;
+    VirtIOIOMMUEndpoint *ep;
+
+    sid = virtio_iommu_get_bdf(sdev);
+
+    qemu_mutex_lock(&s->mutex);
+
+    if (!s->endpoints) {
+        goto unlock;
+    }
+
+    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
+    if (!ep || !ep->domain) {
+        goto unlock;
+    }
+
+    g_tree_foreach(ep->domain->mappings, virtio_iommu_remap, mr);
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -988,6 +1031,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
 
     imrc->translate = virtio_iommu_translate;
     imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
+    imrc->replay = virtio_iommu_replay;
 }
 
 static const TypeInfo virtio_iommu_info = {
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index d94a1cd8a3..8bae651191 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -75,3 +75,4 @@ virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid)
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
 virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, uint64_t map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64
 virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64
+virtio_iommu_remap(uint64_t iova, uint64_t pa, uint64_t size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
-- 
2.17.1

