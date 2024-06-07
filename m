Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp1227369ejf;
        Fri, 7 Jun 2024 15:57:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGFCoLwtxxrUUo1sOZ8ysGS/KK/w/1I7i6NruPkL01ud0ztw1aIq7k/WPuKBoLmbxsdbUA1WbN8O0dQzV7fkLRVSYZw1/B
X-Google-Smtp-Source: AGHT+IE8jzbKQsQnYQxJjwsjztJNUmoRKC0g29dVI62yMTHnP/2MIznwOkpIR6AMPz/DkJTpD3/y
X-Received: by 2002:a05:6808:618b:b0:3d1:ff1d:400e with SMTP id 5614622812f47-3d210d1c86dmr4104163b6e.11.1717801058780;
        Fri, 07 Jun 2024 15:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717801058; cv=none;
        d=google.com; s=arc-20160816;
        b=HICFkzUerEk0ra7BX0S5+VT89eQPJWNLDLLbjzJXySO7ZApJv8p3qRcl6z3C81wLDv
         wFqK8OPi4T8HiWSoKiQICUZ0WaU8cQeKLRWmiUIAjVBkwslYODwFpfQX7jNoQ4WnzWRo
         FyCFocIBH76k1ZqCCYrZKGUsEuMbDhXNCWWHpVYb/2/movEsr0e+/O9nbhSIAzp88CP7
         xt2kZWf6ATqTXxESIy7FCdHB0cUujeWu0peIO/0QUnbeOGEXNZ8zPfC6PiIptPdPwqcR
         bwLlV0UjdphB+Wgs/+6znpuVPqfCO2gNqldi7EhDRuEQUNYyyGRAEzp41AsgzPG2DXAd
         trfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ekL5HzvnxBYBoYa78c8HNqOALcdyf3GJNi8rKTmSLDs=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=v+WdgqQxKHn7i/UzzZv3CsKyrjb9hq4CBcKlMrSxizRX2SxU2opWuJRGnRD4t0kTee
         LMbTtCIdQLhwLnkYR9Kq5aESYo2XA0dcuUnUxjR7e+ci5MaXyzASl/I4a4spP1S3GjmS
         XoTQV4JSFTtBgNwIneg1U9PUYTFE0K8WjYi5XnCpqUBdUAN5XHi72zrall/pw7BKV2Rn
         VAwMR+/pfVxFTdXGpzIPhbwfSpW5WjJdfdI3cWssFQCQIhBBOwrUZjBiWysfUrcMu2M8
         3uGpOui6aoHXgmxD+sgpQ+/BnYbdG8bAo7lul0zNCKZ5CaDZ7/wHetbpzTRbPc79Xg1r
         SG0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MKSJkHcw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79533348f4fsi476900685a.620.2024.06.07.15.57.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 15:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MKSJkHcw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sFaku-0006bt-KQ; Fri, 07 Jun 2024 10:39:48 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFakt-0006Wo-EQ
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 10:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFakr-0003PG-7h
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 10:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717771184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekL5HzvnxBYBoYa78c8HNqOALcdyf3GJNi8rKTmSLDs=;
 b=MKSJkHcwUhHntpOre17/KxGTLlMqf+66HN0Im0PWJayN/6G3pKOat1IGHxmD8BOPZTsyEe
 mbZ5FYPuJDlN5x44KejEWRG0KO8krmjx6pXoG42AkHJ+6FG7LBqlDUJMYa6/8E/J1vefGe
 HQJsTSE6mbaHFaEGl1EnFxHo+i2g0zU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-437-yCXr66ovN9KRrXCF4P8TGw-1; Fri,
 07 Jun 2024 10:39:39 -0400
X-MC-Unique: yCXr66ovN9KRrXCF4P8TGw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CA2FA19560BA; Fri,  7 Jun 2024 14:39:37 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CF23E1956048; Fri,  7 Jun 2024 14:39:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [RFC v2 4/7] virtio-iommu: Compute host reserved regions
Date: Fri,  7 Jun 2024 16:37:24 +0200
Message-ID: <20240607143905.765133-5-eric.auger@redhat.com>
In-Reply-To: <20240607143905.765133-1-eric.auger@redhat.com>
References: <20240607143905.765133-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ddHu+dldCENM

Compute the host reserved regions in virtio_iommu_set_iommu_device().
The usable IOVA regions are retrieved from the HOSTIOMMUDevice.
The virtio_iommu_set_host_iova_ranges() helper turns usable regions
into complementary reserved regions while testing the inclusion
into existing ones. virtio_iommu_set_host_iova_ranges() reuse the
implementation of virtio_iommu_set_iova_ranges() which will be
removed in subsequent patches. rebuild_resv_regions() is just moved.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 151 ++++++++++++++++++++++++++++++---------
 1 file changed, 117 insertions(+), 34 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 0680a357f0..33e9682b83 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -494,12 +494,114 @@ get_host_iommu_device(VirtIOIOMMU *viommu, PCIBus *bus, int devfn) {
     return g_hash_table_lookup(viommu->host_iommu_devices, &key);
 }
 
+/**
+ * rebuild_resv_regions: rebuild resv regions with both the
+ * info of host resv ranges and property set resv ranges
+ */
+static int rebuild_resv_regions(IOMMUDevice *sdev)
+{
+    GList *l;
+    int i = 0;
+
+    /* free the existing list and rebuild it from scratch */
+    g_list_free_full(sdev->resv_regions, g_free);
+    sdev->resv_regions = NULL;
+
+    /* First add host reserved regions if any, all tagged as RESERVED */
+    for (l = sdev->host_resv_ranges; l; l = l->next) {
+        ReservedRegion *reg = g_new0(ReservedRegion, 1);
+        Range *r = (Range *)l->data;
+
+        reg->type = VIRTIO_IOMMU_RESV_MEM_T_RESERVED;
+        range_set_bounds(&reg->range, range_lob(r), range_upb(r));
+        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions, reg);
+        trace_virtio_iommu_host_resv_regions(sdev->iommu_mr.parent_obj.name, i,
+                                             range_lob(&reg->range),
+                                             range_upb(&reg->range));
+        i++;
+    }
+    /*
+     * then add higher priority reserved regions set by the machine
+     * through properties
+     */
+    add_prop_resv_regions(sdev);
+    return 0;
+}
+
+static int virtio_iommu_set_host_iova_ranges(VirtIOIOMMU *s, PCIBus *bus,
+                                             int devfn, GList *iova_ranges,
+                                             Error **errp)
+{
+    IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, bus);
+    IOMMUDevice *sdev;
+    GList *current_ranges;
+    GList *l, *tmp, *new_ranges = NULL;
+    int ret = -EINVAL;
+
+    if (!sbus) {
+        error_report("%s no sbus", __func__);
+    }
+
+    sdev = sbus->pbdev[devfn];
+
+    current_ranges = sdev->host_resv_ranges;
+
+    if (sdev->probe_done) {
+        error_setg(errp,
+                   "%s: Notified about new host reserved regions after probe",
+                   __func__);
+        goto out;
+    }
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
+    range_inverse_array(iova_ranges,
+                        &sdev->host_resv_ranges,
+                        0, UINT64_MAX);
+    rebuild_resv_regions(sdev);
+
+    return 0;
+error:
+    error_setg(errp, "%s Conflicting host reserved ranges set!",
+               __func__);
+out:
+    g_list_free_full(new_ranges, g_free);
+    return ret;
+}
+
 static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
                                           HostIOMMUDevice *hiod, Error **errp)
 {
     VirtIOIOMMU *viommu = opaque;
     VirtioHostIOMMUDevice *vhiod;
+    HostIOMMUDeviceClass *hiodc = HOST_IOMMU_DEVICE_GET_CLASS(hiod);
     struct hiod_key *new_key;
+    GList *host_iova_ranges = NULL;
 
     assert(hiod);
 
@@ -509,6 +611,20 @@ static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
         return false;
     }
 
+    if (hiodc->get_iova_ranges) {
+        int ret;
+        host_iova_ranges = hiodc->get_iova_ranges(hiod, errp);
+        if (!host_iova_ranges) {
+            return true; /* some old kernels may not support that capability */
+        }
+        ret = virtio_iommu_set_host_iova_ranges(viommu, bus, devfn,
+                                                host_iova_ranges, errp);
+        if (ret) {
+            g_list_free_full(host_iova_ranges, g_free);
+            return false;
+        }
+    }
+
     vhiod = g_malloc0(sizeof(VirtioHostIOMMUDevice));
     vhiod->bus = bus;
     vhiod->devfn = (uint8_t)devfn;
@@ -521,6 +637,7 @@ static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
 
     object_ref(hiod);
     g_hash_table_insert(viommu->host_iommu_devices, new_key, vhiod);
+    g_list_free_full(host_iova_ranges, g_free);
 
     return true;
 }
@@ -1243,40 +1360,6 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
     return 0;
 }
 
-/**
- * rebuild_resv_regions: rebuild resv regions with both the
- * info of host resv ranges and property set resv ranges
- */
-static int rebuild_resv_regions(IOMMUDevice *sdev)
-{
-    GList *l;
-    int i = 0;
-
-    /* free the existing list and rebuild it from scratch */
-    g_list_free_full(sdev->resv_regions, g_free);
-    sdev->resv_regions = NULL;
-
-    /* First add host reserved regions if any, all tagged as RESERVED */
-    for (l = sdev->host_resv_ranges; l; l = l->next) {
-        ReservedRegion *reg = g_new0(ReservedRegion, 1);
-        Range *r = (Range *)l->data;
-
-        reg->type = VIRTIO_IOMMU_RESV_MEM_T_RESERVED;
-        range_set_bounds(&reg->range, range_lob(r), range_upb(r));
-        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions, reg);
-        trace_virtio_iommu_host_resv_regions(sdev->iommu_mr.parent_obj.name, i,
-                                             range_lob(&reg->range),
-                                             range_upb(&reg->range));
-        i++;
-    }
-    /*
-     * then add higher priority reserved regions set by the machine
-     * through properties
-     */
-    add_prop_resv_regions(sdev);
-    return 0;
-}
-
 /**
  * virtio_iommu_set_iova_ranges: Conveys the usable IOVA ranges
  *
-- 
2.41.0

