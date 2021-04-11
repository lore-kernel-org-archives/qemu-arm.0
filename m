Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3056663lfr;
        Sun, 11 Apr 2021 05:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9iBDDlj1AHmbr3fywFaNhoDkvatpZJT1lsT1Jt/IKinwWUbiDfIY0p9HjlppQfTnOJZ3L
X-Received: by 2002:a92:6a0b:: with SMTP id f11mr18916102ilc.211.1618143410382;
        Sun, 11 Apr 2021 05:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618143410; cv=none;
        d=google.com; s=arc-20160816;
        b=H8EV2CelinVAhLD2TnXPtnKkUjFtqAaa8e9CMRcw4cVp/zHsrZXbgVjQc+obEuxgrH
         bHLWa5/MNWyKNisT0EJAaqXTXq2eRYQwKlIAvJwgI5K4iWnc2rrQBq8mEq/yUq0XOP//
         U9To/5Iy97qOjEvFczjoNcfG2xE2yxnwQLbS1hbcvXnU7Ioyi2dePqAsrL/Cf1c4evCW
         6iEISdgK02l12IKJnmI+Yu734mjTWOkBv/8PO23sIk8YfBH6byUQ3o1NWbFUX7Bctpg6
         oD1zX/3aanRyc302CtXFBz/UX1lgC5fzCk8bkoCcGFO1U1AB+e2zWFZ7792HLtJdXOSR
         ECAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RoWGYxKuuT5NKR3GSydHx6TuoNbLziGbQyLrmzhviEU=;
        b=wE24gGdZ/RoXo+dbyo1UtzlHotwHaji3T5MNuO/k1gpb7WZyevsRuNygdL+d68PgfL
         BWW0OCdrR+q1b+NZAK1C5OtD1EIf8Fb7Foya9fHubsVujFMHdButuVewD4gj5R6MP3Yr
         F5Km9gg43PDHvZTPKN6v6aMURqTOUewykLBzzxDkPr58YcfGBUhFpkeyER+dYe27b7aF
         kvJ8Rq4yBmIBp5X18Bt/WBTz9p3DdvZDPOeP2W6XZaRoDSiBbFRiVlwapSIS9pV6go5J
         Ms5jZcF5m+cUimwEvXPzmIH16QAjfeWmUTl8veIQoe95udMlyBWtwO1/T8EYRMkVmIky
         x0Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a6I4VzQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si11509001iom.3.2021.04.11.05.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a6I4VzQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZ1F-0004Qy-Ie
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYvG-0000LC-KV
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:10:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYvC-0002br-CM
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RoWGYxKuuT5NKR3GSydHx6TuoNbLziGbQyLrmzhviEU=;
 b=a6I4VzQMESZgLmobnuDDVuhc6SwaBaW00uPi2gJ37hnhzNlNuadUq21GCJt7wT0gDr5su2
 HqABBwSJUcWv/zf7qu0Mi6NIO4N6HawAsLoRNSNZsou+hDzyZuMLPTbjQe06uQi39TJSyL
 g0L8ulJn8ybwdubyofhT1Fwlx5DB/Ds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-5SB8fzsiMK6fcTP_2xtaFw-1; Sun, 11 Apr 2021 08:10:29 -0400
X-MC-Unique: 5SB8fzsiMK6fcTP_2xtaFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6F265B38C;
 Sun, 11 Apr 2021 12:10:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BED311037E88;
 Sun, 11 Apr 2021 12:10:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 05/29] hw/arm/smmuv3: Improve stage1 ASID invalidation
Date: Sun, 11 Apr 2021 14:08:48 +0200
Message-Id: <20210411120912.15770-6-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mJiFsFVPFerB

At the moment ASID invalidation command (CMD_TLBI_NH_ASID) is
propagated as a domain invalidation (the whole notifier range
is invalidated independently on any ASID information).

The new granularity field now allows to be more precise and
restrict the invalidation to a peculiar ASID. Set the corresponding
fields and flag.

We still keep the iova and addr_mask settings for consumers that
do not support the new fields, like VHOST.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v8 -> v9:
- restore the iova and addr_massk settings for consumers that do
  not support the new fields like VHOST
---
 hw/arm/smmuv3.c     | 44 ++++++++++++++++++++++++++++++++++++++++++--
 hw/arm/trace-events |  1 +
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index d037d6df5b..a4436868ba 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -835,6 +835,31 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     memory_region_notify_iommu_one(n, &event);
 }
 
+/**
+ * smmuv3_notify_asid - call the notifier @n for a given asid
+ *
+ * @mr: IOMMU mr region handle
+ * @n: notifier to be called
+ * @asid: address space ID or negative value if we don't care
+ */
+static void smmuv3_notify_asid(IOMMUMemoryRegion *mr,
+                               IOMMUNotifier *n, int asid)
+{
+    IOMMUTLBEvent event = {};
+
+    event.type = IOMMU_NOTIFIER_UNMAP;
+    event.entry.target_as = &address_space_memory;
+    event.entry.perm = IOMMU_NONE;
+    event.entry.granularity = IOMMU_INV_GRAN_PASID;
+    event.entry.flags = IOMMU_INV_FLAGS_ARCHID;
+    event.entry.arch_id = asid;
+    event.entry.iova = n->start;
+    event.entry.addr_mask = n->end - n->start;
+
+    memory_region_notify_iommu_one(n, &event);
+}
+
+
 /* invalidate an asid/iova range tuple in all mr's */
 static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
                                       uint8_t tg, uint64_t num_pages)
@@ -910,6 +935,22 @@ smmuv3_invalidate_ste(gpointer key, gpointer value, gpointer user_data)
     return true;
 }
 
+static void smmuv3_s1_asid_inval(SMMUState *s, uint16_t asid)
+{
+    SMMUDevice *sdev;
+
+    trace_smmuv3_s1_asid_inval(asid);
+    QLIST_FOREACH(sdev, &s->devices_with_notifiers, next) {
+        IOMMUMemoryRegion *mr = &sdev->iommu;
+        IOMMUNotifier *n;
+
+        IOMMU_NOTIFIER_FOREACH(n, mr) {
+            smmuv3_notify_asid(mr, n, asid);
+        }
+    }
+    smmu_iotlb_inv_asid(s, asid);
+}
+
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUState *bs = ARM_SMMU(s);
@@ -1020,8 +1061,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             uint16_t asid = CMD_ASID(&cmd);
 
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
-            smmu_inv_notifiers_all(&s->smmu_state);
-            smmu_iotlb_inv_asid(bs, asid);
+            smmuv3_s1_asid_inval(bs, asid);
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index b79a91af5f..8e530ba79d 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -46,6 +46,7 @@ smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
 smmuv3_s1_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
+smmuv3_s1_asid_inval(int asid) "asid=%d"
 smmuv3_cmdq_tlbi_nh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
-- 
2.26.3

