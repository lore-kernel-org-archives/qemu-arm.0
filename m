Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp263269ejc;
        Wed, 11 Oct 2023 10:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsXZJ/zUyDVZTug+svnjtL4FeX7EQ3IeF/KW8AoChFneQ2Uywy9a1mSp/Xhu8fBJ3/iCQe
X-Received: by 2002:ac8:5b0c:0:b0:417:b545:9eb5 with SMTP id m12-20020ac85b0c000000b00417b5459eb5mr27902587qtw.10.1697047009635;
        Wed, 11 Oct 2023 10:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697047009; cv=none;
        d=google.com; s=arc-20160816;
        b=l2AU8GTuWVsDv0AF9tr9S2+FOZ7DZFHxZsZ5BNK5Sh/YqFBrULadxXjFMQlW1xUXWI
         Yfbwt0NU3PIrUHi8eWdZUeJhXQpqLZRKYBtEh0dykmx6XqmyRVar7DOpnXm8A4pmD1b/
         8HcUyMef0tldNBRE1D3Kj12oVnOoulUq78SrN4SUgGT3wERwcVTyuGc2IleMdPkm4IPK
         o/RQhNd3jhDAcTDxJTeyBt9D3+4DNjMfRLUKbR+gZRNYcz1v/S8CyM06Ie8bugTkg6rj
         mMkS/9+Xt7gSPlNLe4j4RYDpqr0UryvmilWwZWPYIhwjW9pRehz+Fw0XFvik29SXV5xk
         U3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t6otjZ3QP+E7KXmddhTyDYDDSHN7VtAPx/sJ/dA0Xzg=;
        fh=9ZVtvpfpBEZx1oWqIMPFEsByQUx/hbHUkY9aIbMmkns=;
        b=io/qslCsdDoih2NqWL3sU83qP0TrJMYotU54GzfPaEbdV/2GvtneQrUYuq6et4lvag
         Ra47/DjnY77I7J8drL9knRhSibEB7jwPEG2dmaDj/xEvNYhri4i358NBj4JMkqH6rjyK
         Ln+lsa3Zv74PiWwz6uJAcSDGzTLXU5mM7qc32LeW3+rZ6h7jy3H0QHek2MC53pmxf2RJ
         b9n5x0qmwqd9+DGF8X8E8AeGIDaeAA3kVvM7zIPS7EIVS7gJpQfa0yFlv+lmB2SSytY+
         ULNIYIX97VIMkdeUYdJP9t5Jqxn7nO8aUDFT8wGgXvqX2SnPB3wiITqRaywaHUqUcMmq
         GfDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GktSqnJV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a05622a14cd00b0040fe864c812si9583147qtx.10.2023.10.11.10.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 10:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GktSqnJV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qqdRh-0001iZ-Jh; Wed, 11 Oct 2023 13:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdRI-0001K3-PG
 for qemu-devel@nongnu.org; Wed, 11 Oct 2023 13:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdRG-0006eM-1A
 for qemu-devel@nongnu.org; Wed, 11 Oct 2023 13:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697046965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t6otjZ3QP+E7KXmddhTyDYDDSHN7VtAPx/sJ/dA0Xzg=;
 b=GktSqnJVh6JZAtk2XPK0EDTaQQqfbW/kMmtyjpdoCtHxuVQNgfIpg4cRjBX0MPQ75ZwUPr
 ukz9FqbLO+XBHYzgNejegNlVrs3+J3HHqOm4PeRwgY6tGTjUbJhQ9Q16BGSiMdtSi3mHRy
 NlTra7aW5Hbr42pT2f3yQlp2AFNw7Nw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-7EjqNZ2QOE25TCj72qpf_g-1; Wed, 11 Oct 2023 13:56:02 -0400
X-MC-Unique: 7EjqNZ2QOE25TCj72qpf_g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4541832D30;
 Wed, 11 Oct 2023 17:56:01 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EE09492C3E;
 Wed, 11 Oct 2023 17:55:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com
Subject: [PATCH v3 09/13] virtio-iommu: Record whether a probe request has
 been issued
Date: Wed, 11 Oct 2023 19:52:25 +0200
Message-ID: <20231011175516.541374-10-eric.auger@redhat.com>
In-Reply-To: <20231011175516.541374-1-eric.auger@redhat.com>
References: <20231011175516.541374-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uGRtkyuP9FXu

Add an IOMMUDevice 'probe_done' flag to record that the driver
already issued a probe request on that device.

This will be useful to double check host reserved regions aren't
notified after the probe and hence are not taken into account
by the driver.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/virtio/virtio-iommu.h |  1 +
 hw/virtio/virtio-iommu.c         | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 70b8ace34d..1dd11ae81a 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -40,6 +40,7 @@ typedef struct IOMMUDevice {
     MemoryRegion root;          /* The root container of the device */
     MemoryRegion bypass_mr;     /* The alias of shared memory MR */
     GList *resv_regions;
+    bool probe_done;
 } IOMMUDevice;
 
 typedef struct IOMMUPciBus {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 0e2370663d..13c3c087fe 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -639,19 +639,13 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     return ret;
 }
 
-static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
+static ssize_t virtio_iommu_fill_resv_mem_prop(IOMMUDevice *sdev, uint32_t ep,
                                                uint8_t *buf, size_t free)
 {
     struct virtio_iommu_probe_resv_mem prop = {};
     size_t size = sizeof(prop), length = size - sizeof(prop.head), total;
-    IOMMUDevice *sdev;
     GList *l;
 
-    sdev = container_of(virtio_iommu_mr(s, ep), IOMMUDevice, iommu_mr);
-    if (!sdev) {
-        return -EINVAL;
-    }
-
     total = size * g_list_length(sdev->resv_regions);
     if (total > free) {
         return -ENOSPC;
@@ -688,19 +682,27 @@ static int virtio_iommu_probe(VirtIOIOMMU *s,
                               uint8_t *buf)
 {
     uint32_t ep_id = le32_to_cpu(req->endpoint);
+    IOMMUMemoryRegion *iommu_mr = virtio_iommu_mr(s, ep_id);
     size_t free = VIOMMU_PROBE_SIZE;
+    IOMMUDevice *sdev;
     ssize_t count;
 
-    if (!virtio_iommu_mr(s, ep_id)) {
+    if (!iommu_mr) {
         return VIRTIO_IOMMU_S_NOENT;
     }
 
-    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, free);
+    sdev = container_of(iommu_mr, IOMMUDevice, iommu_mr);
+    if (!sdev) {
+        return -EINVAL;
+    }
+
+    count = virtio_iommu_fill_resv_mem_prop(sdev, ep_id, buf, free);
     if (count < 0) {
         return VIRTIO_IOMMU_S_INVAL;
     }
     buf += count;
     free -= count;
+    sdev->probe_done = true;
 
     return VIRTIO_IOMMU_S_OK;
 }
-- 
2.41.0

