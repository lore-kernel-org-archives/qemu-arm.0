Received: by 10.28.71.27 with SMTP id u27csp212340wma;
        Mon, 12 Feb 2018 11:07:21 -0800 (PST)
X-Google-Smtp-Source: AH8x226Y2jtNGgMxmedBqTta4cm0Q66NJhXSC1rp53myeXHefoM/PRXBGrDSJLNmd/b4dG7ziROw
X-Received: by 10.129.73.199 with SMTP id w190mr866421ywa.437.1518462440848;
        Mon, 12 Feb 2018 11:07:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462440; cv=none;
        d=google.com; s=arc-20160816;
        b=uYZALHuMkI2mSrvZYt6pwRIOxpT/sZKV8QJgmlq0FNfS+BsmlyBBtbXsJPrdwmcDbq
         DhdahIW7enJE/hlPyNtluonZA7RNwMlPvQUTID6899LwsW2hudXXFQ2TgcfkciBm/cDm
         rTKhYf9hVlamZXmhSNTvg0VAmHlXIeiex2DhsQ64G31kvtxKKoOmFb9a7V8OH5Zv2u6L
         6JKyjcXKZ3l78dZl18j6x+l7nxYqQEy5iRAQQrX9iG1HOLwdvbzDi0mJzSpYxmJSliAp
         lxGI/7A09qV8Rnrc0CuSv3cYJ3sLMcP14IRkYJXbI9P+iWEPz4npNKg6KyTBhMzFH54G
         JiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=QFKwxoO28ow3uxmWKH9uHyn7807DGf4aV/L0+YsGM+I=;
        b=w0cC/ogTgStsmLqIMliws9mDc9d+hCiJdN6tyl/8+mtN3azFS3NouRWZXJdfvIyccJ
         3rb2So4MHqIwTngoxQz70r2do4igdRrPh+QWTlae2g9uIcFU2tU5wS4DOaPSWjE3n427
         Urn8N+TQ9VDZGj5S3JQGZfX/jdz9r9X7hLcn6J8L1fCghpViADAStxpkeCXRTRDhQaKR
         ETOsewGNa9qE8Dfk9VWwRBwyrsqyQoCqHmmDE5bq0Num1Twy/W2kOjhMYtJuc86FuA/i
         P2Do6SMOr0S4VHzMRi15cDLdrQjmjJrcdN05plc+VkqWeH7iU/oCkiwAxoD7FknykjEK
         pz7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3si1600884ywl.518.2018.02.12.11.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:07:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJRg-000749-6C
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:07:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKq-00014X-4M
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKp-0004v0-0d
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:16 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37862 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJKo-0004tH-Fx; Mon, 12 Feb 2018 14:00:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E566C4040853;
	Mon, 12 Feb 2018 19:00:13 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF88D1008591;
	Mon, 12 Feb 2018 19:00:10 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:16 +0000
Message-Id: <1518461904-5305-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 12 Feb 2018 19:00:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 12 Feb 2018 19:00:14 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 14/22] virtio-iommu: Add an msi_bypass property
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
X-TUID: 8s/hXbyrzWME

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
index 85c5b95..c81a24b 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -43,6 +43,9 @@
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 #define VIOMMU_PROBE_SIZE 512
 
+#define IOAPIC_RANGE_START      (0xfee00000)
+#define IOAPIC_RANGE_SIZE       (0x100000)
+
 #define SUPPORTED_PROBE_PROPERTIES (\
     VIRTIO_IOMMU_PROBE_T_NONE | \
     VIRTIO_IOMMU_PROBE_T_RESV_MEM)
@@ -105,6 +108,25 @@ static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
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
@@ -122,6 +144,12 @@ static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
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
 
@@ -854,8 +882,32 @@ static void virtio_iommu_set_status(VirtIODevice *vdev, uint8_t status)
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

