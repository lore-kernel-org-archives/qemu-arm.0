Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3068377lfr;
        Sun, 11 Apr 2021 05:38:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJMlL0f4hiooDmV6O21yPjmZ1H09FtgIZnf6Qs7gabdZH1AFa/1AA3EVnCyJIA1F8WmKv4
X-Received: by 2002:a05:6e02:1e01:: with SMTP id g1mr485034ila.83.1618144719602;
        Sun, 11 Apr 2021 05:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618144719; cv=none;
        d=google.com; s=arc-20160816;
        b=HvRH+ua7lcVPHnov8B+OnQ1oDuw83wwM5VGYk2+U7zqXwOM1bYNgW8KLH2DddL4b91
         1Ga6RkqxWWL0jy+He1yWiqJ1fHoOeon34okSbK10V8qUP4XImizXi895Ur7Pg/6tMC1l
         4QSinCoke5or3gt6PvCy5ywiNpY52RXP/bAsnaMJ6Z+jQf4evOjVqItSMBx58w0mWKmm
         KTFlKE2IWziNgo9yq70i9REUZv5rXzmb0ov2TEXOjPd2P87eNo71bR/wV/Lw5U1yeYEC
         Gly2bDTvFAYAX3eWChZW8FouQ3u2LGrgI8hBi7PLoNwqk/gZmAngAPQR2V7ypqg94gmL
         kSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=c1lC2N5qYUFS9onSXcWFEDQCeOdGmtYQEEeqJjMIgro=;
        b=s+Pya+4xD85YQBIepqFeThXSRr4hRcKy3iamHN5HIzezXsm6FFWmb+LU0oLSFEXST4
         vYms3DPOsUjJxBpxQ+1oYa/E7BQxeAkg7ZKfMiJaLMriIgwnBMNzIwABBkeMXY95N49J
         R5DqJR6o++Nhe3VxZiB0U+4ALCeoRg7F+Q1HNcWPsmIGqOGuMs33d8Oe3FpW+QdImNdd
         GSQJEBJ1nbRYVmoj4r/EOUXX+wVM1ayn9/lfgzn79Fg9aNTNcCcdAHZu7rWFUBcK+ZQc
         IDpdPtJu4FOVhO1GldlNbcHPQ/b7CSMkV1YjND4lAtufSD32sa/jjDtvtS5r0qHuMkWH
         4DwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HRb73IzI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si10921328ill.115.2021.04.11.05.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HRb73IzI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZMM-0000h3-Td
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYzD-0003dS-5U
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYyw-0004EH-Lq
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c1lC2N5qYUFS9onSXcWFEDQCeOdGmtYQEEeqJjMIgro=;
 b=HRb73IzIrBTgfBvORRbSCcEe6x/n+jQQjUIbBA4/t0kMLdf8vyipw/A3U0gMxaEpdMsWht
 cpGvw9D/9j7kg07Unvjs/QH8/4vy+urqljV2XF/oq5Zg3YkO4l6CVGC7ZBYKAK535gNYAw
 R+63xV0k40KpeR8TZRnpSaqtV6cx8gU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-UCK3eHolOpSSLzIJPamQLg-1; Sun, 11 Apr 2021 08:14:24 -0400
X-MC-Unique: UCK3eHolOpSSLzIJPamQLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CA3810054F6;
 Sun, 11 Apr 2021 12:14:22 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4476A10023B2;
 Sun, 11 Apr 2021 12:14:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 26/29] hw/arm/smmuv3: Implement fault injection
Date: Sun, 11 Apr 2021 14:09:09 +0200
Message-Id: <20210411120912.15770-27-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fNVGQechdZsK

We convert iommu_fault structs received from the kernel
into the data struct used by the emulation code and record
the evnts into the virtual event queue.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- fix compil issue on mingw

Exhaustive mapping remains to be done
---
 hw/arm/smmuv3.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index aefc55a607..53b71c895c 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1652,6 +1652,76 @@ static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
     return -EINVAL;
 }
 
+struct iommu_fault;
+
+static inline int
+smmuv3_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                     struct iommu_fault *buf)
+{
+#ifdef __linux__
+    SMMUDevice *sdev = container_of(iommu_mr, SMMUDevice, iommu);
+    SMMUv3State *s3 = sdev->smmu;
+    uint32_t sid = smmu_get_sid(sdev);
+    int i;
+
+    for (i = 0; i < count; i++) {
+        SMMUEventInfo info = {};
+        struct iommu_fault_unrecoverable *record;
+
+        if (buf[i].type != IOMMU_FAULT_DMA_UNRECOV) {
+            continue;
+        }
+
+        info.sid = sid;
+        record = &buf[i].event;
+
+        switch (record->reason) {
+        case IOMMU_FAULT_REASON_PASID_INVALID:
+            info.type = SMMU_EVT_C_BAD_SUBSTREAMID;
+            /* TODO further fill info.u.c_bad_substream */
+            break;
+        case IOMMU_FAULT_REASON_PASID_FETCH:
+            info.type = SMMU_EVT_F_CD_FETCH;
+            break;
+        case IOMMU_FAULT_REASON_BAD_PASID_ENTRY:
+            info.type = SMMU_EVT_C_BAD_CD;
+            /* TODO further fill info.u.c_bad_cd */
+            break;
+        case IOMMU_FAULT_REASON_WALK_EABT:
+            info.type = SMMU_EVT_F_WALK_EABT;
+            info.u.f_walk_eabt.addr = record->addr;
+            info.u.f_walk_eabt.addr2 = record->fetch_addr;
+            break;
+        case IOMMU_FAULT_REASON_PTE_FETCH:
+            info.type = SMMU_EVT_F_TRANSLATION;
+            info.u.f_translation.addr = record->addr;
+            break;
+        case IOMMU_FAULT_REASON_OOR_ADDRESS:
+            info.type = SMMU_EVT_F_ADDR_SIZE;
+            info.u.f_addr_size.addr = record->addr;
+            break;
+        case IOMMU_FAULT_REASON_ACCESS:
+            info.type = SMMU_EVT_F_ACCESS;
+            info.u.f_access.addr = record->addr;
+            break;
+        case IOMMU_FAULT_REASON_PERMISSION:
+            info.type = SMMU_EVT_F_PERMISSION;
+            info.u.f_permission.addr = record->addr;
+            break;
+        default:
+            warn_report("%s Unexpected fault reason received from host: %d",
+                        __func__, record->reason);
+            continue;
+        }
+
+        smmuv3_record_event(s3, &info);
+    }
+    return 0;
+#else
+    return -1;
+#endif
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1660,6 +1730,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->translate = smmuv3_translate;
     imrc->notify_flag_changed = smmuv3_notify_flag_changed;
     imrc->get_attr = smmuv3_get_attr;
+    imrc->inject_faults = smmuv3_inject_faults;
 }
 
 static const TypeInfo smmuv3_type_info = {
-- 
2.26.3

