Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp616381lfe;
        Wed, 18 Mar 2020 03:15:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvQpdqk+iaUcxQVJcsioYk82Z5HBkAm9ffgEyIv+wJu+HCQdntFpfikDDwbbTDVMaKrnOen
X-Received: by 2002:ac8:749a:: with SMTP id v26mr3521708qtq.260.1584526556131;
        Wed, 18 Mar 2020 03:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584526556; cv=none;
        d=google.com; s=arc-20160816;
        b=qXVFVYzUstbAF7oDb31pNL4W0VT9CwmsJqWl/G+gmc5nyPe043z+FX5jw2hZuILI8G
         /Zi/j61MT/FcJp80DLZ1DTiLPKQcelW78pGowXZUDWiuGH/YZCNBN6gUpRi45pF0Mvlm
         8xBUCXX0eyPHOrPkswYgWGuXQ2Tu/Q2UZDFTO9s1C7ecE1rzWSZL0ByCj8u7jvOjJ77H
         bDCnWrq5bR13Iu4bdY8TF+xmp4Ql9lRyIBp3gRdRCtiK8mZP16mLt97ecloXDsN42FJq
         NE3FW8J6il2KtdeeiQv55SAAWNptv5wEaZ1DZ5YWDHRE4JH156+2arpWfuRyghQFBMMA
         Ccrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=b/xFgYePXPIX12aaAGxsXGPT9CqkwDZHYIS0r7ZTW0U=;
        b=k/Rsh6jDWghzYmzzUOJDAr1KVUKSSlwKTPaSpcMnC9Bcp8RpPtHg+NhThI8CbGIWOu
         bZ8kxiJLiXwfzzIN7obp2OV9O2OEJDvsDszi0zYudqgnxEV8HG9RxKrGAIZv3BJzeqsS
         G7BevTMr3twnp8JleRQ2Z7cpohg/VM9p8rtJw2t1ZHgHp4oqtnK+86WswmiynerYH4ZA
         GBmZjKt4txkiHa9EmWw5xtm29QqnblTcrwWtDlrxJdzI8XZRyISDyxKC2C/ILS+QAP2h
         JhgEcXNNCF67EITV9k46D5iwENwE1bNZNfoS9AZR7gg2uqsJSB/4s+agJdl6MTuOmyXH
         3ytg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=VeCzmd+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si3565198qtn.241.2020.03.18.03.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 03:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=VeCzmd+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:48080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEVjv-0007qu-Eg
	for alex.bennee@linaro.org; Wed, 18 Mar 2020 06:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVh5-0003AD-C5
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 06:13:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVh4-0005Qv-5J
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 06:12:59 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:26454)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVh4-0005Py-0j; Wed, 18 Mar 2020 06:12:58 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IABnOg030625; Wed, 18 Mar 2020 03:12:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=b/xFgYePXPIX12aaAGxsXGPT9CqkwDZHYIS0r7ZTW0U=;
 b=VeCzmd+6ZI6MCKt9Hit8BdNR4+pYplmI9iihYkvkau//8osJb0goh3S0uoIcqGHVc1tp
 hsaTgvxtfMNwT9qa37H/T1VboZFSEERC5PjKPl0sfyvFa39kYeXBiJNXh4Yb3HT6KOJA
 2JrngrMGmOzmIvRtW5evinqpl6dd+8f7cTrxlPjsOhYOV5nEC5zob4hzkOulo2Z5VdVw
 iViLcJaN99oJGQEhso/56au+GMSQGvZY74P6tCKbwxGNtbxnlinnTz/LEQyZ0ILLE+Qw
 iLxwPzK8YvclSEiXRCYyuVtyoyTOft+aa0j4dJNP6Wfk59f3qcfqzn2A6REv14z/zAiQ 2Q== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yu9rp9tw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 03:12:55 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 18 Mar 2020 03:12:54 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 18 Mar 2020 03:12:53 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Mar 2020 03:12:48 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v8 8/8] virtio-iommu: add iommu notifier memory-region
Date: Wed, 18 Mar 2020 15:41:59 +0530
Message-ID: <20200318101159.8767-9-bbhushan2@marvell.com>
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
X-TUID: Z3AuEQZ7abEc

Finally add notify_flag_changed() to for memory-region
access flag iommu flag change notifier

Finally add the memory notifier

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/virtio/virtio-iommu.c | 22 ++++++++++++++++++++++
 hw/virtio/trace-events   |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index b68644f7c3..515c965e3c 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -814,6 +814,27 @@ unlock:
     qemu_mutex_unlock(&s->mutex);
 }
 
+static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
+                                             IOMMUNotifierFlag old,
+                                             IOMMUNotifierFlag new,
+                                             Error **errp)
+{
+    IOMMUDevice *sdev = container_of(iommu_mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+
+    if (old == IOMMU_NOTIFIER_NONE) {
+        trace_virtio_iommu_notify_flag_add(iommu_mr->parent_obj.name);
+        QLIST_INSERT_HEAD(&s->notifiers_list, sdev, next);
+        return 0;
+    }
+
+    if (new == IOMMU_NOTIFIER_NONE) {
+        trace_virtio_iommu_notify_flag_del(iommu_mr->parent_obj.name);
+        QLIST_REMOVE(sdev, next);
+    }
+    return 0;
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -1033,6 +1054,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->translate = virtio_iommu_translate;
     imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
     imrc->replay = virtio_iommu_replay;
+    imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
 }
 
 static const TypeInfo virtio_iommu_info = {
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 8bae651191..a486adcf6d 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -76,3 +76,5 @@ virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uin
 virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, uint64_t map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64
 virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64
 virtio_iommu_remap(uint64_t iova, uint64_t pa, uint64_t size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
+virtio_iommu_notify_flag_add(const char *iommu) "Add virtio-iommu notifier node for memory region %s"
+virtio_iommu_notify_flag_del(const char *iommu) "Del virtio-iommu notifier node for memory region %s"
-- 
2.17.1

