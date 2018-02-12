Received: by 10.28.71.27 with SMTP id u27csp216918wma;
        Mon, 12 Feb 2018 11:12:18 -0800 (PST)
X-Google-Smtp-Source: AH8x226KwZ3vHzAImwIZk7PxVx8tKdEX6VEMlkeU47z4RYRASyoVNnOoCdAckFd4dd81cw7Ck9zF
X-Received: by 10.37.210.199 with SMTP id j190mr8274750ybg.483.1518462738655;
        Mon, 12 Feb 2018 11:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462738; cv=none;
        d=google.com; s=arc-20160816;
        b=mvpy0ltSgseDrqCdzzZYF51sTu9Jk4U/0FHUOr7OTkTpt5hTl5X7T38s+cssH8XF2M
         PrHgE6eTvxmMGuq67ZhbSPX6Jbged4ajC+t8Yq+bP7YTKvzZkgMXSTlacwqJB1tvhGAP
         IIGkqNom9GOxW8PF/cyIyrX4P8eGIE30/SHyKnru1tB47PTi5x3FUd/KkjM4gtARZbt0
         JgpyxYVs5+ekIHrE/0BHFEHiRP1z5/P85x0ren6T07cghLsGb7A5CYwGKzJFh5Wj5r3k
         RPp+5MKBcWLI60pBYgN8JEn2MXMq/fPBNXjJKR+Gj605eIz/fpH1CWokR/uB1mgrCj/b
         1Yig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=rXtDSQjUE0WmtIdBYpMi9eDabBSLbRuDFPDHV2iW4TM=;
        b=IX6OzgdowpVPYWCXl1cMmKGODrgsWfClbwAvQKOQqKfungyB+dA6NfnvCBee5CchVZ
         PKQy6GsBnNsigpfEHor/4AK3caDlyMc7ITPOYeLhoLXgOmXqJL7zn6g3i4u6NXYJOQr8
         DoH1QyB6II0/fk713XSJaA1lBXW/g1BjdWD2LXJCvsJxbdORqerCUXE8OaaWg54PdwW+
         4QwqsHoapxu7hVBIhy5Q1VLfJPbVHhfHEE9glk0M2w+l3X2nzjzl8zQuqByVPK0L3MgM
         FAYWqu1N4Lwf8H4cOD2vEMu8Y2ItdbxlhQTfXQQosLPRPyumDSa2AzuMQrUhoEc8maXd
         CLzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t125si1610426ywc.8.2018.02.12.11.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:12:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJWU-00034H-3L
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:12:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKS-0000dk-7U
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKR-000446-CU
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:52 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36794 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJKR-00043I-7b; Mon, 12 Feb 2018 13:59:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DE177D67B;
	Mon, 12 Feb 2018 18:59:50 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B77F1227915;
	Mon, 12 Feb 2018 18:59:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:12 +0000
Message-Id: <1518461904-5305-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 12 Feb 2018 18:59:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 12 Feb 2018 18:59:50 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 10/22] virtio-iommu: Implement attach/detach
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
X-TUID: e1vBMwPZzoBS

This patch implements the endpoint attach/detach to/from
a domain.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 207b17a..69ff516 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -114,8 +114,8 @@ static void virtio_iommu_put_endpoint(gpointer data)
     g_free(ep);
 }
 
-viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id);
-viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id)
+static viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s,
+                                              uint32_t domain_id)
 {
     viommu_domain *domain;
 
@@ -194,6 +194,8 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     uint32_t domain_id = le32_to_cpu(req->domain);
     uint32_t ep_id = le32_to_cpu(req->endpoint);
     uint32_t reserved = le32_to_cpu(req->reserved);
+    viommu_domain *domain;
+    viommu_endpoint *ep;
 
     trace_virtio_iommu_attach(domain_id, ep_id);
 
@@ -201,7 +203,22 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
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
@@ -209,14 +226,24 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
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

