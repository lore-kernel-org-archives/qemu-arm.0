Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp949893wrt;
        Thu, 22 Nov 2018 09:19:07 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WjxusMpChBK94abgU8lRNLKJ6NwbbKhb45Tm3RdK2/tHbC9acXMowXRI2V9BNAKJK2gl+B
X-Received: by 2002:a25:ed0c:: with SMTP id k12-v6mr11469612ybh.87.1542907147387;
        Thu, 22 Nov 2018 09:19:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542907147; cv=none;
        d=google.com; s=arc-20160816;
        b=WJut434TL+9QvkCWSs4Nyivl3N4/IsbKJDECdbnK2gmcF7oKCmY/AkzTrr0i6eYUNG
         bZAgvG0aVs9dxvqaGX4ckbBMGfbKTcRfWZody7E6zb3JPUjFhcKqj015MuvfwQUZjuvS
         tLMjr5qHE3rfxWkjLBG9JQALe9SbuWwb946kT6KufbNsHmdW5WZ5jLN4snYe+dUIcDmM
         l9/LM+OaZatasua3lCM7kMy0HZ4/6BC23lH7+52qfMTufzIkrF5GZjQ9ZxgvA8Uq2rNo
         VrjSWAyksnDLscI2GljizuXvEh6NPG5bXh8FOTszkafSIPdAaEsrE7MO0sh5RF/DTtmh
         J1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=2Dm+eO9OmB/WUsi/1V9m13WNhdBGTRwWxeB9VVuVBRI=;
        b=V+PAHgsikNwUs6KfJHFV3eSoB9CGZpfznCmTItZadjxTtKNX8WLznBY+svKMUrTM3Z
         19z5/BYdw1CKnB3MeiHPpKw7IDjLajIoO0+9sjykiVPHMOKKR/RHQxjCZDhfEJ7ZIzjR
         0XrBFvl7pZLhrYOG3uaBeG7zicBoE7FKpK8xmeQaMGRo27Cr0JcAU21vZsYsXetpIbFa
         f8ZHmz86awJETuXWMQRmsAokVM3XxpcYHVnMxekgoMXQFrZDs14n2xtCuTlsCP0pG77f
         0ojbQzZUJhMfyGV9H5tb6uReaIC17Ybji2wgq6ugqZtYKWS8HEcZcDw3uKwE4lCWvZh6
         r4hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l19si19686378ywa.358.2018.11.22.09.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 09:19:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPsd8-00086h-Nw
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 12:19:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsb5-0005Q4-Aq
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:17:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsb1-0006QQ-Sk
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:16:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52862)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPsb1-0006GN-EE; Thu, 22 Nov 2018 12:16:55 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC96D31256BE;
	Thu, 22 Nov 2018 17:16:42 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A606360610;
	Thu, 22 Nov 2018 17:16:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Thu, 22 Nov 2018 18:15:32 +0100
Message-Id: <20181122171538.12359-12-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-1-eric.auger@redhat.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 22 Nov 2018 17:16:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v9 11/17] virtio-iommu: Expose the IOAPIC MSI
 reserved region when relevant
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YFTZWszKRsYw

We introduce a new msi_bypass field which indicates whether
the IOAPIC MSI window [0xFEE00000 - 0xFEEFFFFF] must be exposed
as a reserved region. By default the field is set to true at
instantiation time. Later on we will introduce a property at
virtio pci proxy level to turn it off.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v8 -> v9:
- pass IOAPIC_RANGE_END to virtio_iommu_register_resv_region
- take into account the change in the struct virtio_iommu_probe_resv_mem
  definition
- We just introduce the field here. A property will be introduced later on
  at pci proxy level.
---
 hw/virtio/virtio-iommu.c         | 36 ++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4fc43494d9..324518c300 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -41,6 +41,9 @@
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 #define VIOMMU_PROBE_SIZE 512
 
+#define IOAPIC_RANGE_START      (0xfee00000)
+#define IOAPIC_RANGE_END        (0xfeefffff)
+
 #define SUPPORTED_PROBE_PROPERTIES (\
     1 << VIRTIO_IOMMU_PROBE_T_RESV_MEM)
 
@@ -102,6 +105,30 @@ static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
     ep->domain = NULL;
 }
 
+static void virtio_iommu_register_resv_region(viommu_endpoint *ep,
+                                              uint8_t subtype,
+                                              uint64_t start, uint64_t end)
+{
+    viommu_interval *interval;
+    struct virtio_iommu_probe_resv_mem *resv_reg_prop;
+    size_t prop_size = sizeof(struct virtio_iommu_probe_resv_mem);
+    size_t value_size = prop_size -
+                sizeof(struct virtio_iommu_probe_property);
+
+    interval = g_malloc0(sizeof(*interval));
+    interval->low = start;
+    interval->high = end;
+
+    resv_reg_prop = g_malloc0(prop_size);
+    resv_reg_prop->head.type = VIRTIO_IOMMU_PROBE_T_RESV_MEM;
+    resv_reg_prop->head.length = cpu_to_le64(value_size);
+    resv_reg_prop->subtype = cpu_to_le64(subtype);
+    resv_reg_prop->start = cpu_to_le64(start);
+    resv_reg_prop->end = cpu_to_le64(end);
+
+    g_tree_insert(ep->reserved_regions, interval, resv_reg_prop);
+}
+
 static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
                                                   uint32_t ep_id)
 {
@@ -119,6 +146,12 @@ static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
     ep->reserved_regions = g_tree_new_full((GCompareDataFunc)interval_cmp,
                                             NULL, (GDestroyNotify)g_free,
                                             (GDestroyNotify)g_free);
+    if (s->msi_bypass) {
+        virtio_iommu_register_resv_region(ep, VIRTIO_IOMMU_RESV_MEM_T_MSI,
+                                          IOAPIC_RANGE_START,
+                                          IOAPIC_RANGE_END);
+    }
+
     return ep;
 }
 
@@ -858,6 +891,9 @@ static void virtio_iommu_set_status(VirtIODevice *vdev, uint8_t status)
 
 static void virtio_iommu_instance_init(Object *obj)
 {
+    VirtIOIOMMU *s = VIRTIO_IOMMU(obj);
+
+    s->msi_bypass = true;
 }
 
 static const VMStateDescription vmstate_virtio_iommu = {
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index f55f48d304..56c8b4e57f 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -59,6 +59,7 @@ typedef struct VirtIOIOMMU {
     GTree *domains;
     QemuMutex mutex;
     GTree *endpoints;
+    bool msi_bypass;
 } VirtIOIOMMU;
 
 #endif
-- 
2.17.2

