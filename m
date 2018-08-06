Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3449834wru;
        Mon, 6 Aug 2018 13:24:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfte5gJcdWTn+I5vm3zziNkW05QXVPz62rjjZm/lZmTDIQQaYnmHV2uVfqWX9boGaQL+2jQ
X-Received: by 2002:ac8:2f7c:: with SMTP id k57-v6mr15959675qta.424.1533587055847;
        Mon, 06 Aug 2018 13:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533587055; cv=none;
        d=google.com; s=arc-20160816;
        b=m1o23cD8M7RMj2ITq18r+ck5eGdU7SC3sRETZGOVui8RLVtObFlPY8uj6hX09dX9D8
         L65cA1aTuPFC0ZHUh3Qdwgy3sR1ksNJOzWCOr4lrZa3Ip8YlWjMAoDH+MjLyYZFJBtp6
         p3anjUcQo3JBExLhy+YMMaaVAG5c+xuOlBTp7HCk4jCKj7WuML4S/eiUR9q/p80yBdz8
         psrK2BPB/5f7AIcZ6KGbIY8wR4OTIK2TO4tuzlQbIyfhdI4cRYUXzrO6Qtqs3OG992Yp
         lKN34Zin8+ZZiXa+/AlLh9ouUGdALdf2rMpErwvIW9OzlebE0H8l1KTa75OP7IZs09lr
         FrVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=pk2vXlJTrcjnZAk8n2rz5HfVULgRedXvGjUMnxX0ZjA=;
        b=X1F6GFsFV4IxDodlGrFFqImdYbusqp+HU6kp3JhGK9u0dhSWMQn/+PNuaic5pXQV5q
         7iM0fk3diMQOKSD2Q9MpAGzIPZXGPWFN2KP1GgGLqZxiYH9o0qGi9xAr8U0l0++c1xok
         iuBPuxBVQ03fodzveHNLfZV+KyRCAnfNCViOZy0oCAbvdzNMmCuoZUms6Ge0uqFg/+6h
         R6m7bsNXIt40MYRBIf4eQusFl9veOEo2Rnz2n4+qfdMgXcFDbbelxDTxc7xFFfF62YMK
         T33uTTuRyixshlWtBg8YRhnjnUon24xWrQsHHqecx1IWYzk6w1JcJcN82AxSGbFCiczW
         nWnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x58-v6si13030552qtj.117.2018.08.06.13.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmm35-0004pt-99
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:24:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlub-0006SX-Tg
	for qemu-devel@nongnu.org; Mon, 06 Aug 2018 16:15:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlua-0006uJ-NG
	for qemu-devel@nongnu.org; Mon, 06 Aug 2018 16:15:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40544 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmluW-0006nR-Kp; Mon, 06 Aug 2018 16:15:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2627040241C4;
	Mon,  6 Aug 2018 20:15:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62BD62156711;
	Mon,  6 Aug 2018 20:15:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:38 +0200
Message-Id: <1533586484-5737-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:24 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v7 10/16] virtio-iommu: Add an msi_bypass property
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BRNYQFsx0o5J

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
index 0291a04..ec0cf1e 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -42,6 +42,9 @@
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 #define VIOMMU_PROBE_SIZE 512
 
+#define IOAPIC_RANGE_START      (0xfee00000)
+#define IOAPIC_RANGE_SIZE       (0x100000)
+
 #define SUPPORTED_PROBE_PROPERTIES (\
     VIRTIO_IOMMU_PROBE_T_NONE | \
     VIRTIO_IOMMU_PROBE_T_RESV_MEM)
@@ -104,6 +107,25 @@ static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
     ep->domain = NULL;
 }
 
+static void virtio_iommu_register_resv_region(viommu_endpoint *ep,
+                                              uint8_t subtype,
+                                              uint64_t start, uint64_t end)
+{
+    viommu_interval *interval;
+    struct virtio_iommu_probe_resv_mem *reg;
+
+    interval = g_malloc0(sizeof(*interval));
+    interval->low = start;
+    interval->high = end;
+
+    reg = g_malloc0(sizeof(*reg));
+    reg->subtype = subtype;
+    reg->start = cpu_to_le64(start);
+    reg->end = cpu_to_le64(end);
+
+    g_tree_insert(ep->reserved_regions, interval, reg);
+}
+
 static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
                                                   uint32_t ep_id)
 {
@@ -121,6 +143,12 @@ static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
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
 
@@ -841,8 +869,32 @@ static void virtio_iommu_set_status(VirtIODevice *vdev, uint8_t status)
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
index 913e96b..aa20ba4 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -58,6 +58,7 @@ typedef struct VirtIOIOMMU {
     GTree *domains;
     QemuMutex mutex;
     GTree *endpoints;
+    bool msi_bypass;
 } VirtIOIOMMU;
 
 #endif
-- 
2.5.5

