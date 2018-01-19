Received: by 10.28.71.27 with SMTP id u27csp844979wma;
        Fri, 19 Jan 2018 07:05:17 -0800 (PST)
X-Google-Smtp-Source: ACJfBosxWUvOR0UpZ8foay4qrYcTmH073knEjB1exX0ygnUvVxYA0aY0rp8WA5WWaYJE9tbkihkt
X-Received: by 10.37.189.1 with SMTP id f1mr29011521ybk.228.1516374317233;
        Fri, 19 Jan 2018 07:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374317; cv=none;
        d=google.com; s=arc-20160816;
        b=tUWqYUtT3rZzjhCQ2rWC+U07tdGybl4ey2efjynMNZbTzehrZyl9TLfs3HPqVKHe1Q
         ZIK46FxZGxySyQ9CYRNY31aooCyJY2hhGK2tVJ7iINDrzsjFPwcH1b5Z/PAPPG0W+3MN
         acQ47vy9QdoGyyLKidD0VJcjUOmz/Ri74O8MZBubS5fx+BzThFp8Kz+7ZHm7OZBkbrVP
         Yw6iJfim+82fwxikHsuk+Kbh9e9rHPXc2p82KYOFVbS/T8IsGag1+aKGmJUJ6D8EGQam
         HjR/AogAoR1IMJZABpNLD96OOcQbMJRqIyBPlP8mwLyyDIu2p2F25WtiQwCQq2C6O/zp
         PXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=fzZ5X3aw2NwM2CZRgKM1cmkFy+b+7lLvErFMoEZ04qc=;
        b=pOYSIy+TRz2PibYm61RuFQelytu7enw0rgt9+/5y7GwkziiaCKf/9x+RYD+5MLMmrC
         CpP4423dhpO+bakZcyZpyMWN6+6lTCytLzUTDdkL4KJ4zTD7dEntq5WJKufesbdKGxZ5
         pNYhHN8K7AkpOZfHin6Ju6zPfOEnR1GVG+gslqXX3mbr/BUt7qJ/53n3FE/QryBjiKK+
         rBbSvadtFy54ePToC/35fGbednzqEhLes6S+KhpCIcdOERgzBXD5zXck1Ct0XZ9qOL4f
         vwr6EcB5mazZyxYG+Ue2PzBxjZenT8O0sEuVYH84I/rM1oXP+AUWwHZ6RSQPakLg/lu2
         ZnMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z145si1873390ywa.407.2018.01.19.07.05.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:05:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYEG-0008VJ-NN
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:05:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYBJ-00065G-6c
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:02:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYBG-0006hO-0a
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:02:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYBF-0006gi-QW; Fri, 19 Jan 2018 10:02:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5E3276545;
	Fri, 19 Jan 2018 15:02:08 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 503B35C885;
	Fri, 19 Jan 2018 15:01:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:03 +0000
Message-Id: <1516373355-305-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 19 Jan 2018 15:02:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 10/22] virtio-iommu: Implement attach/detach
 command
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
X-TUID: H2uxDiFq75iM

This patch implements the endpoint attach/detach to/from
a domain.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index cca2614..b30d761 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
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
1.9.1

