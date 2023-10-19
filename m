Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp526693ejb;
        Thu, 19 Oct 2023 06:48:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM18u62RAkdTlxr2J64cP56uSph5j28F/baoc2F5Xd3+DafLZkNh/k9CXLQ1Umgpln+Zsb
X-Received: by 2002:a05:690c:d:b0:5a7:bde8:51d5 with SMTP id bc13-20020a05690c000d00b005a7bde851d5mr2382339ywb.32.1697723314155;
        Thu, 19 Oct 2023 06:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697723314; cv=none;
        d=google.com; s=arc-20160816;
        b=S2UdCOk30SslvkKkXTR+15kp72dV6dd9NQAZ4XcqP9DnHDZ6SVZ9xHFvCOx4qKpdye
         sEd5gdQF0M6akKjzmMcvIJl/fi9LDP8KuwJZJrZqwSzHItxd9/eMaGn6VuF0qBvrv1Nu
         zBWcNq3fTg3FWGiz4xZGOG79vtdHdcTHeIZoAqSs4qczfAK9VVoFztP/s7xkPI9xXa8j
         nt7rjudUdU0eN7QSirrh5rWRHOA0MufEOx+AOK4RTzEADl1zaZ79T7/ijdv605nc9mdm
         TZ5znAZWtCNo7xDo1FrHjzSMfw1MVKEiZgGq/kOHnKju+Tklrha9HM3n0boH4uOcDjDn
         xN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vCrSobHK22rm67+bVy/cvxms40Hc7KFI4C7YFSba7Cs=;
        fh=tKh4J0nBsRIusPtBH+FcUVX1EUO0S/KOQKlAHLEPEHM=;
        b=ZAa+t/Q9Vu2V72Hmi8tQ578iMSoazJrVSctUPnOIttTvAfC6baLZ7VAH9EsV5fC8TU
         z3cdSyVrEXHYRemQFAz84tlhLzDqaMQfDPFOt/n9UTf5qA8Pi8LoguXkpqk4nTuXlqLG
         EAfyzMq7aOE7ZXAmL1KTy5I2dpmIdI3cQurv69O96oF9mnIP/+BWPQSs5Wr5C6yeQzfI
         +CtbNmA+uWiHxbFfe0BNxHKEKygY4+M1bUfgPyf67YkGKZP2V5Cvd+WZKWDD0UOnYIel
         e6dmEv3ouNp8rsXUHAEaXhOMWOA1aLIMCHKXBZS5zuN1JypPcZ6zPP99S4pGe0mtePiQ
         35tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fMW29+0t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020a0cd68d000000b0066d0621bb60si1517374qvi.508.2023.10.19.06.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fMW29+0t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtTNJ-0001We-5Q; Thu, 19 Oct 2023 09:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTNC-0001Sk-Jz
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 09:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTN9-0002yR-Fm
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 09:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697723253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCrSobHK22rm67+bVy/cvxms40Hc7KFI4C7YFSba7Cs=;
 b=fMW29+0temJSYzp4VZd18a90r6uGP4eicNuJ5Y0iXqFHejnAEnWFNZVW7R7C910o8wU34Y
 IvS6tbTqUXLoZn77BIAFHwT0yZJnQXwWm469bOjy2GAiQPr618KizJfVX6KpncF3G9KdV9
 EJZ1fBUwMtIL1LYnq/wD7GK11bZLi24=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-fn9EBtxCM4GuIKvfu7nS1g-1; Thu, 19 Oct 2023 09:47:29 -0400
X-MC-Unique: fn9EBtxCM4GuIKvfu7nS1g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5159D3C14939;
 Thu, 19 Oct 2023 13:47:26 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96A1A492BFA;
 Thu, 19 Oct 2023 13:47:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 yanghliu@redhat.com
Subject: [PATCH v4 10/12] virtio-iommu: Implement set_iova_ranges() callback
Date: Thu, 19 Oct 2023 15:45:16 +0200
Message-ID: <20231019134651.842175-11-eric.auger@redhat.com>
In-Reply-To: <20231019134651.842175-1-eric.auger@redhat.com>
References: <20231019134651.842175-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: A33dbs1zJBHP

The implementation populates the array of per IOMMUDevice
host reserved ranges.

It is forbidden to have conflicting sets of host IOVA ranges
to be applied onto the same IOMMU MR (implied by different
host devices).

In case the callback is called after the probe request has
been issues by the driver, a warning is issued.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Yanghang Liu <yanghliu@redhat.com>

---
v3 -> v4:
- Use GList instead
- added a warn_report in case the probe has already been issued

v1 -> v2:
- Forbid conflicting sets of host resv regions
---
 include/hw/virtio/virtio-iommu.h |  1 +
 hw/virtio/virtio-iommu.c         | 67 ++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 1dd11ae81a..781ebaea8f 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -40,6 +40,7 @@ typedef struct IOMMUDevice {
     MemoryRegion root;          /* The root container of the device */
     MemoryRegion bypass_mr;     /* The alias of shared memory MR */
     GList *resv_regions;
+    GList *host_resv_ranges;
     bool probe_done;
 } IOMMUDevice;
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 13c3c087fe..15aadd6fdd 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/iov.h"
+#include "qemu/range.h"
 #include "exec/target_page.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio.h"
@@ -1155,6 +1156,71 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
     return 0;
 }
 
+/**
+ * virtio_iommu_set_iova_ranges: Conveys the usable IOVA ranges
+ *
+ * The function turns those into reserved ranges. Once some
+ * reserved ranges have been set, new reserved regions cannot be
+ * added outside of the original ones.
+ *
+ * @mr: IOMMU MR
+ * @iova_ranges: list of usable IOVA ranges
+ * @errp: error handle
+ */
+static int virtio_iommu_set_iova_ranges(IOMMUMemoryRegion *mr,
+                                        GList *iova_ranges,
+                                        Error **errp)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    GList *current_ranges = sdev->host_resv_ranges;
+    GList *l, *tmp, *new_ranges = NULL;
+    int ret = -EINVAL;
+
+    /* check that each new resv region is included in an existing one */
+    if (sdev->host_resv_ranges) {
+        range_inverse_array(iova_ranges,
+                            &new_ranges,
+                            0, UINT64_MAX);
+
+        for (tmp = new_ranges; tmp; tmp = tmp->next) {
+            Range *newr = (Range *)tmp->data;
+            bool included = false;
+
+            for (l = current_ranges; l; l = l->next) {
+                Range * r = (Range *)l->data;
+
+                if (range_contains_range(r, newr)) {
+                    included = true;
+                    break;
+                }
+            }
+            if (!included) {
+                goto error;
+            }
+        }
+        /* all new reserved ranges are included in existing ones */
+        ret = 0;
+        goto out;
+    }
+
+    if (sdev->probe_done) {
+        warn_report("%s: Notified about new host reserved regions after probe",
+                    mr->parent_obj.name);
+    }
+
+    range_inverse_array(iova_ranges,
+                        &sdev->host_resv_ranges,
+                        0, UINT64_MAX);
+
+    return 0;
+error:
+    error_setg(errp, "IOMMU mr=%s Conflicting host reserved ranges set!",
+               mr->parent_obj.name);
+out:
+    g_list_free_full(new_ranges, g_free);
+    return ret;
+}
+
 static void virtio_iommu_system_reset(void *opaque)
 {
     VirtIOIOMMU *s = opaque;
@@ -1450,6 +1516,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->replay = virtio_iommu_replay;
     imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
     imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
+    imrc->iommu_set_iova_ranges = virtio_iommu_set_iova_ranges;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.41.0

