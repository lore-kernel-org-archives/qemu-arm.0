Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3445117wru;
        Mon, 6 Aug 2018 13:18:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdsLIj0JzbXiUcWYPHSa9w9fM6b4POHw0UIESBPNTydfdrZl3xL54vik/sXlfVY77gCymvs
X-Received: by 2002:aed:3cc3:: with SMTP id e3-v6mr16364025qtf.356.1533586700440;
        Mon, 06 Aug 2018 13:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533586700; cv=none;
        d=google.com; s=arc-20160816;
        b=H9UbXAnsXFRKFkNlQHd0mwtIm4m8p+YS2siJpX9s48C5QK4YVqkDzvdY87mlGU8cSd
         E24eLM3QNYdCp9afvhuCTgI/k9WExsUMeXONoCwOVqO0vmFt19wFqQKuU8+xDCm5LqmW
         XhaqQPlv21VTo2wmrXLoA0deK/phUmnb1RdJN2WvfRtJjS3nIb629KFlJ2gJTDjc8UBI
         U3DCrqmhTDCvN/EeX+pPcAwR/bzwh4RviwlcGNSq/SSibwd7H/v51pTlLIRwdDSRTUtl
         Dn7Lym4pMdh2gyqUXntV9DsBhw8wGa77iDgcXg2zqotI4EiA0ZD49bDJQiu+UQMj2VAJ
         fIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=WN59MNwTHHemDoeJcyP0S87AWtRbtS8SC3I60vrr6gQ=;
        b=vqEz1P69OpnXdJpybBFWWv8DOn1hZQFGWSxtu4Y7j/EkLKUYukzIJWNfQ87wexRGUJ
         AuoEZbaT+DRXQUEyvCUkJsY29NCKXotMm5kYmigiuQqu8sV9LxiW4R1Wrno8pVmdOLy0
         1D5ETBu9o5JtzogsCgyPOKxHHD2iLoxhTjPuKxpR/OU/uA0HsXd50aFNVeUsH1o0zdDA
         7uFj1/JIWLz50Rze5YfRx5qbAJZpnuXnoEWKfOIKk4kVge/Un/zB7pdqupMdnbwTSscl
         TwB+Cu4mETjmu55Od6Ysq0T8FBwuHuNbD78zjtNRWV86EBMci/v8O/mzK0c2wCKqCoKp
         xrug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q12-v6si1247795qtn.388.2018.08.06.13.18.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:18:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmlxL-0007yg-Nc
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:18:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluQ-0006Es-0f
	for qemu-devel@nongnu.org; Mon, 06 Aug 2018 16:15:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluP-0006hO-35
	for qemu-devel@nongnu.org; Mon, 06 Aug 2018 16:15:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46918 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmluL-0006fH-Bo; Mon, 06 Aug 2018 16:15:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D39328780F;
	Mon,  6 Aug 2018 20:15:12 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C976215670D;
	Mon,  6 Aug 2018 20:15:10 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:34 +0200
Message-Id: <1533586484-5737-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 06 Aug 2018 20:15:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 06 Aug 2018 20:15:12 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v7 06/16] virtio-iommu: Implement attach/detach
 command
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
X-TUID: HNdXec4FtEOg

This patch implements the endpoint attach/detach to/from
a domain.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 8bbb116..4cb6e15 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -83,8 +83,8 @@ static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
     ep->domain = NULL;
 }
 
-viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id);
-viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id)
+static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
+                                                  uint32_t ep_id)
 {
     viommu_endpoint *ep;
 
@@ -113,8 +113,8 @@ static void virtio_iommu_put_endpoint(gpointer data)
     g_free(ep);
 }
 
-viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id);
-viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id)
+static viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s,
+                                              uint32_t domain_id)
 {
     viommu_domain *domain;
 
@@ -193,6 +193,8 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     uint32_t domain_id = le32_to_cpu(req->domain);
     uint32_t ep_id = le32_to_cpu(req->endpoint);
     uint32_t reserved = le32_to_cpu(req->reserved);
+    viommu_domain *domain;
+    viommu_endpoint *ep;
 
     trace_virtio_iommu_attach(domain_id, ep_id);
 
@@ -200,7 +202,22 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
         return VIRTIO_IOMMU_S_INVAL;
     }
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    ep = virtio_iommu_get_endpoint(s, ep_id);
+    if (ep->domain) {
+        /*
+         * the device is already attached to a domain,
+         * detach it first
+         */
+        virtio_iommu_detach_endpoint_from_domain(ep);
+    }
+
+    domain = virtio_iommu_get_domain(s, domain_id);
+    QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
+
+    ep->domain = domain;
+    g_tree_ref(domain->mappings);
+
+    return VIRTIO_IOMMU_S_OK;
 }
 
 static int virtio_iommu_detach(VirtIOIOMMU *s,
@@ -208,14 +225,24 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
 {
     uint32_t ep_id = le32_to_cpu(req->endpoint);
     uint32_t reserved = le32_to_cpu(req->reserved);
-
-    trace_virtio_iommu_detach(ep_id);
+    viommu_endpoint *ep;
 
     if (reserved) {
         return VIRTIO_IOMMU_S_INVAL;
     }
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
+    if (!ep) {
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+
+    if (!ep->domain) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
+    virtio_iommu_detach_endpoint_from_domain(ep);
+    trace_virtio_iommu_detach(ep_id);
+    return VIRTIO_IOMMU_S_OK;
 }
 
 static int virtio_iommu_map(VirtIOIOMMU *s,
-- 
2.5.5

