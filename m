Received: by 10.223.172.38 with SMTP id v35csp4644743wrc;
        Tue, 19 Sep 2017 00:53:22 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDfl22BwBmnGnDTyF3A3vnK3jPNj6WnIJa7xyuFu1+B3KrZL9mVQNq+JafHbDYwbv2Zz3Mx
X-Received: by 10.200.49.88 with SMTP id h24mr768683qtb.335.1505807602626;
        Tue, 19 Sep 2017 00:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807602; cv=none;
        d=google.com; s=arc-20160816;
        b=Iaz65V+rj3qCugTcWdhk5clTftKWGPZviYTcFfKvtnyY9Td9u0ytxq1gS4IxQLJvVW
         r/SVQVrpVZKt9j4oTBk8QiEeA1Kt20ahPousspYOc5C+Kn5XOmbE204B42uxsMe6oNh3
         t3BkvwabIyd01ZboFlAyCA0LGdlxrZswAHk6vsleGTzaX7ndvWOD8q5b5sN44bPEeoqG
         L/zK+GxlenM2lrGwm62LIxWs7Exc++DIUVG/aWGHDPhQGkyJo6ZFOkE0Rt9IfxCl8w8G
         qLghMnzVEeK1Dc0J0PGX/tHB9Nc7GycwJsnKt7OuZwbZGnbFA/8M5TR27ks7uU+Jc/Z6
         fp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=qvI+6sOUWtKc6l8MlmHi/GwTSnXmwuDGVvwJZzW041w=;
        b=g+NWiR102oWUCkYVAkxL/2lQVEXZDpsPayuHUde9zElpur6aBUksCYyFTudZ7P0w6A
         4RQxb4TdnkofQZLOSRjm+7SZIKxo/nNpm72bUP3UX4P7J2ZbUBARRXOItNMiGJFViGGP
         TLb/HqQe8BEcadthLqJOZZSwQs4jpyCECjagznPDDkrHjisseY6yEa0HViag1ObNIlR3
         LcZReoYNtd6VPv5Dlao3OLJfnL+MJwD0OX7Qs/ZARNzrXEn0hM7KcRbPj0X1ei5Ae+y1
         SPUTtXPJ5qh7ZIeAqrjPuXIHMcsdS7Jle3+mm1ddE4HYt/uxIaDWh0y88WoqewYjfCqS
         WlMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v32si9146694qtd.457.2017.09.19.00.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDLM-0003cv-A7
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:53:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDGX-0008QF-Uw
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:48:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDGX-0000xr-12
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:48:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52470)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDGU-0000uT-Go; Tue, 19 Sep 2017 03:48:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80D491F56A;
	Tue, 19 Sep 2017 07:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 80D491F56A
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F7DA61346;
	Tue, 19 Sep 2017 07:48:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:39 +0200
Message-Id: <1505807208-9063-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 19 Sep 2017 07:48:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 07/16] virtio-iommu: Implement attach/detach
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
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q5LYXKB9UAOU

This patch implements the device attach/detach to an
address space.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 41a4bbc..bd859fb 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -110,8 +110,7 @@ static void virtio_iommu_put_dev(gpointer data)
     g_free(dev);
 }
 
-viommu_as *virtio_iommu_get_as(VirtIOIOMMU *s, uint32_t asid);
-viommu_as *virtio_iommu_get_as(VirtIOIOMMU *s, uint32_t asid)
+static viommu_as *virtio_iommu_get_as(VirtIOIOMMU *s, uint32_t asid)
 {
     viommu_as *as;
 
@@ -205,6 +204,8 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     uint32_t asid = le32_to_cpu(req->address_space);
     uint32_t devid = le32_to_cpu(req->device);
     uint32_t reserved = le32_to_cpu(req->reserved);
+    viommu_as *as;
+    viommu_dev *dev;
 
     trace_virtio_iommu_attach(asid, devid);
 
@@ -212,7 +213,22 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
         return VIRTIO_IOMMU_S_INVAL;
     }
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    dev = virtio_iommu_get_dev(s, devid);
+    if (dev->as) {
+        /*
+         * the device is already attached to an address space,
+         * detach it first
+         */
+        virtio_iommu_detach_dev_from_as(dev);
+    }
+
+    as = virtio_iommu_get_as(s, asid);
+    QLIST_INSERT_HEAD(&as->device_list, dev, next);
+
+    dev->as = as;
+    g_tree_ref(as->mappings);
+
+    return VIRTIO_IOMMU_S_OK;
 }
 
 static int virtio_iommu_detach(VirtIOIOMMU *s,
@@ -220,14 +236,24 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
 {
     uint32_t devid = le32_to_cpu(req->device);
     uint32_t reserved = le32_to_cpu(req->reserved);
-
-    trace_virtio_iommu_detach(devid);
+    viommu_dev *dev;
 
     if (reserved) {
         return VIRTIO_IOMMU_S_INVAL;
     }
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
+    if (!dev) {
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+
+    if (!dev->as) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
+    virtio_iommu_detach_dev_from_as(dev);
+    trace_virtio_iommu_detach(devid);
+    return VIRTIO_IOMMU_S_OK;
 }
 
 static int virtio_iommu_map(VirtIOIOMMU *s,
-- 
2.5.5

