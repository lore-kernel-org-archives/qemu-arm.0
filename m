Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp567747wrw;
        Fri, 9 Nov 2018 03:31:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5eMvHbQsp7rYathTd6kRLA+ynIozDbQmS2jFJeDDv0g80VwRnbC7ScHU9G3uQkG3+itGezP
X-Received: by 2002:aed:2022:: with SMTP id 31-v6mr7954655qta.252.1541763108877;
        Fri, 09 Nov 2018 03:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763108; cv=none;
        d=google.com; s=arc-20160816;
        b=mbhvcJrNerY6SSZaFwtjYmlnL8QtkB0Ts25YxvVijbBW4en9M14kjSr4pwlecJzloL
         FFNauJtaRstIlJkQYTypboRplqFTL9MMPdodwLeABiLS7Vdf5xJAs8UXsEsKvYK4vyxE
         1fS7vwkBfyxc+Gnz1SNTwBy6l2fNcEBhFmzDN7lgodj6p7WuT4bpT2y0qC91u8TVUnJf
         qNaxGFXoiu1vzwiNvXLrqCI+wuupt66yeW+ryNYFFQA7K6cPwRd31+Sl+Y8pSGXOh+9Q
         BQtuaBGT6plKenro+PGHWLDiPx8t2VI/wTS6uM+2oN+O5WfL42liPQPS555mAgeeI3hT
         9IZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=E/KeBjK1lopVYMZ4gg7+ZR2mLTfwHik+rxv7iXJchRw=;
        b=o+S9GB8078ImHPLMJBbWjLLXISmdt5f70/nRAlDpuEMXI304R8jLIk6jmXsYwpnh47
         FgYXBDYKvPt3Q6Rn1jjjnOc41tjKouvAslYzZ02nFKU2zFzaK/Y0NmlZrrcMgaVxjgdw
         V7hKiCrYZUnuMXGU8WIs2D2A5aWnWQJ9HVALmmNed3v2UsZzz63PTzGoqVB1OUj4Nj0m
         BnqJo1h1Q91Y+3LNAOtdvZ0ABE/8OafwLrL6WdZ7/UlH1hGlpKg0nLKLb2b/6xZMA9sd
         5/hm4vsU10PYWr5OLkN5hN4Ou2fqyveLVnVRlv0nZoIYGQsLllevsCp7s+O0WWmrfxI7
         gKvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g16si1101634qtg.304.2018.11.09.03.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:31:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL50u-00079W-9z
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:31:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL4zt-0006bE-VN
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL4zr-0000BH-CV
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38908)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL4zr-000876-1i; Fri, 09 Nov 2018 06:30:43 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2444289AE6;
	Fri,  9 Nov 2018 11:30:37 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC3B15C219;
	Fri,  9 Nov 2018 11:30:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:46 +0100
Message-Id: <20181109112957.10067-8-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 09 Nov 2018 11:30:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v8 07/18] virtio-iommu: Implement attach/detach
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jEdHoQm/BuLG

This patch implements the endpoint attach/detach to/from
a domain.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/virtio/virtio-iommu.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index e4014a8800..bd245ea979 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -82,8 +82,8 @@ static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
     ep->domain = NULL;
 }
 
-viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id);
-viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id)
+static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
+                                                  uint32_t ep_id)
 {
     viommu_endpoint *ep;
 
@@ -112,8 +112,8 @@ static void virtio_iommu_put_endpoint(gpointer data)
     g_free(ep);
 }
 
-viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id);
-viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id)
+static viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s,
+                                              uint32_t domain_id)
 {
     viommu_domain *domain;
 
@@ -191,10 +191,27 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
 {
     uint32_t domain_id = le32_to_cpu(req->domain);
     uint32_t ep_id = le32_to_cpu(req->endpoint);
+    viommu_domain *domain;
+    viommu_endpoint *ep;
 
     trace_virtio_iommu_attach(domain_id, ep_id);
 
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
@@ -202,10 +219,21 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
 {
     uint32_t domain_id = le32_to_cpu(req->domain);
     uint32_t ep_id = le32_to_cpu(req->endpoint);
+    viommu_endpoint *ep;
 
     trace_virtio_iommu_detach(domain_id, ep_id);
 
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
+    return VIRTIO_IOMMU_S_OK;
 }
 
 static int virtio_iommu_map(VirtIOIOMMU *s,
-- 
2.17.2

