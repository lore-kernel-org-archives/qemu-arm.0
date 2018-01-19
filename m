Received: by 10.28.71.27 with SMTP id u27csp845458wma;
        Fri, 19 Jan 2018 07:05:38 -0800 (PST)
X-Google-Smtp-Source: ACJfBouFLHGBIChfWbsoj3srlepfvrA6lJqMl46qXGwHllz66E2u8kFPkw8i1P01RASKIsPdU1Jh
X-Received: by 10.13.237.69 with SMTP id w66mr9985743ywe.313.1516374338476;
        Fri, 19 Jan 2018 07:05:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374338; cv=none;
        d=google.com; s=arc-20160816;
        b=PDuYQd7yfY0h/Tdk9wAa+Jx3jLhqiSWz1JtVFAdjXoNMOoTzG3rBXdiS7qp9jBf5+D
         e0F5zNcwOvHvW6SF5xgvthwDGit6k74waxZ9noboawQWpE4h8K3d6It86AWwHqd/sR5m
         SUPxsQAsxMKJPvp7EmnSgQEEb8pgibrTnVJyfLvCXll4Y5fuUC22AwTvxlIADBL6t/hm
         s7y32EWmPP1YEA3wq+lQV+fzLJWdqWsVkjRzpb3vb3o/IonHK6t8Rwm8xkkEyrcx3Pmr
         uUeBMFMzRXZy6ATKCSeMCdvuqhr/A8/g+W/AdShDLVoaV9MA+cDtslLAETaETNCgk02j
         9HmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=PpSAJN/ZCJtWbeBvWnCQZRuIgWmBHZix92YWN5nXIsw=;
        b=QxNIKs3Nw4nY71u17TDl71i6pfrkxfiDHSDRP4hISyyW58HqEB9vUmDnJMbfeVymWt
         cdSMZaYlrSqdjdQ9AyhKlUX+86gY1rAeTHwqnZxTqgW2zFTaOVS1dvGl1djNM4n7dG5I
         0E1Vwzp2M9xVHXGgSragDD+gP6WtuZvctNDl1s4KGDst8IHgj7dvXFQ+2pT1Gz/x8oWf
         cxkxoV+wwdMehL8HjIMCIo61SCjWrjilSKU9ClXw0hrApE61miYW7kqnu70+ok0sDRid
         z7FmND5DlTM+f9iNw5CFvsxrbfafetz/t81ylkeZJkifj+k+yo7xlQJZ3RD2/xkGKqq/
         58dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u85si2314554ywg.146.2018.01.19.07.05.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:05:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54205 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYEc-0000RB-0P
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:05:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYDB-0007hU-V4
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:04:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYDA-0008S7-Tg
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:04:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53184)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYDA-0008Re-LC; Fri, 19 Jan 2018 10:04:08 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC4F44B60;
	Fri, 19 Jan 2018 15:04:07 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8A3D5C1B7;
	Fri, 19 Jan 2018 15:03:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:07 +0000
Message-Id: <1516373355-305-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 19 Jan 2018 15:04:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 14/22] virtio-iommu: Add an msi_bypass property
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8C4idn45dDls

In case the msi_bypass property is set, it means we need
to register the IOAPIC MSI window as a reserved region:
0xFEE00000 - 0xFEEFFFFF.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/virtio/virtio-iommu.c         | 52 ++++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |  1 +
 2 files changed, 53 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 0e712b3..306a633 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -41,6 +41,9 @@
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 #define VIOMMU_PROBE_SIZE 512
 
+#define IOAPIC_RANGE_START      (0xfee00000)
+#define IOAPIC_RANGE_SIZE       (0x100000)
+
 #define SUPPORTED_PROBE_PROPERTIES (\
     VIRTIO_IOMMU_PROBE_T_NONE | \
     VIRTIO_IOMMU_PROBE_T_RESV_MEM)
@@ -103,6 +106,25 @@ static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
     ep->domain = NULL;
 }
 
+static void virtio_iommu_register_resv_region(viommu_endpoint *ep,
+                                              uint8_t subtype,
+                                              uint64_t addr, uint64_t size)
+{
+    viommu_interval *interval;
+    struct virtio_iommu_probe_resv_mem *reg;
+
+    interval = g_malloc0(sizeof(*interval));
+    interval->low = addr;
+    interval->high = addr + size - 1;
+
+    reg = g_malloc0(sizeof(*reg));
+    reg->subtype = subtype;
+    reg->addr = cpu_to_le64(addr);
+    reg->size = cpu_to_le64(size);
+
+    g_tree_insert(ep->reserved_regions, interval, reg);
+}
+
 static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
                                                   uint32_t ep_id)
 {
@@ -120,6 +142,12 @@ static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
     ep->reserved_regions = g_tree_new_full((GCompareDataFunc)interval_cmp,
                                             NULL, (GDestroyNotify)g_free,
                                             (GDestroyNotify)g_free);
+    if (s->msi_bypass) {
+        virtio_iommu_register_resv_region(ep, VIRTIO_IOMMU_RESV_MEM_T_MSI,
+                                          IOAPIC_RANGE_START,
+                                          IOAPIC_RANGE_SIZE);
+    }
+
     return ep;
 }
 
@@ -847,8 +875,32 @@ static void virtio_iommu_set_status(VirtIODevice *vdev, uint8_t status)
     trace_virtio_iommu_device_status(status);
 }
 
+static bool virtio_iommu_get_msi_bypass(Object *obj, Error **errp)
+{
+    VirtIOIOMMU *s = VIRTIO_IOMMU(obj);
+
+    return s->msi_bypass;
+}
+
+static void virtio_iommu_set_msi_bypass(Object *obj, bool value, Error **errp)
+{
+    VirtIOIOMMU *s = VIRTIO_IOMMU(obj);
+
+    s->msi_bypass = value;
+}
+
 static void virtio_iommu_instance_init(Object *obj)
 {
+    VirtIOIOMMU *s = VIRTIO_IOMMU(obj);
+
+    object_property_add_bool(obj, "msi_bypass", virtio_iommu_get_msi_bypass,
+                             virtio_iommu_set_msi_bypass, NULL);
+    object_property_set_description(obj, "msi_bypass",
+                                    "Indicates whether msis are bypassed by "
+                                    "the IOMMU. Default is YES",
+                                    NULL);
+
+    s->msi_bypass = true;
 }
 
 static const VMStateDescription vmstate_virtio_iommu = {
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 0b6b3f2..458b2a0 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -57,6 +57,7 @@ typedef struct VirtIOIOMMU {
     GTree *domains;
     QemuMutex mutex;
     GTree *endpoints;
+    bool msi_bypass;
 } VirtIOIOMMU;
 
 #endif
-- 
1.9.1

