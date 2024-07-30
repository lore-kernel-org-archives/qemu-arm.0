Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2222141njb;
        Tue, 30 Jul 2024 01:11:52 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUSjvLwZm3mAm817FozB3a7jUh5N/IloXIKOpAKxRYoOYRSMHqbV1CBo1ubtI5vdjFpAO8Gi9oMFt2oc0nrJj/dnNn0vwH1
X-Google-Smtp-Source: AGHT+IHT57KDFHXHt0a4fYwv8pPpKdvqI6HYeiUTsgzH5/yWG4FqUrfGy+uKeySQCGgfhIkWSWe8
X-Received: by 2002:a17:906:c14b:b0:a7a:b50a:30d2 with SMTP id a640c23a62f3a-a7d3ff50c51mr828813566b.17.1722327111799;
        Tue, 30 Jul 2024 01:11:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722327111; cv=pass;
        d=google.com; s=arc-20160816;
        b=lFwoo9V2lGtoOc428r++58IVknM5UQGjLLX7ZhANZ2f6L1suXs5ktb2C5eV8M41TJP
         8kXBNuV2FKbxzR0pHDALn/gsQ7XcAr2oDHgoJ1ts7PFfaFZuuBq/K6W2vJ2EGnU83w7R
         gpR7bPlIv8J+A2TRSyLqFF8x+e08GxfB/MnRxr7Cq17e7JDigrPylxEzB7PWgXk756Dp
         9l4y+sFbfFNfk6yJGGmz/DlMTfOTgU+qKy4q0deI10b2a5Ax5Uoo8QHnpiqg/tPUMJVT
         CHmhV3nokJyBx/qYaDLoBenr9eywrZAAmm23EzkSRcFJwUN8yC6H/jYtmy5gcippDtB+
         QPSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=rEo38lpj5pKroMhTmXhAg9xdI4a0uSu2selrCgZQTVY=;
        fh=K9hvV5Ipi0VSlYxX/fm25RHJYlx13FFj5pikD+TSDpg=;
        b=a1d7rvFuppxkWNXVTd/H+kajfc5aEBOXwbnA4NFpbG4SnGW6yP5OhyeLKtb6HTPbdV
         KI3NeD5gV2gXtyBY1BTShnHiznYXxD5b/WAXi0bvZmUuTKKjYA5J+aHyVzRKO2X/P6gx
         EKd/f8/QZXSIDJCnAZFiST6cUUQZMWa2mCxDDoDMwYqqUdY6rQ4+TxWXsqN3gTESUhc4
         rH67Mex8RC3MTZjI2yGFbDncEeqMCl5qGdO5lAotJfd+j5CM0mnGAseEowf1EtVQH+3T
         AlIOz9e0JCpvdrJpEqxFd8pD1ZGf6ziXUxxeW6QE+wtaAXQfq/yEFkZEs9VvZs+Z12Ud
         LHLw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HyTTuB4e;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22620-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-22620-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-22620-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-a7acab3b5fesi748045566b.475.2024.07.30.01.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-22620-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HyTTuB4e;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22620-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-22620-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39FAB1F233C4
	for <alex.bennee@linaro.org>; Tue, 30 Jul 2024 08:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A2519007A;
	Tue, 30 Jul 2024 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HyTTuB4e"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE66944E
	for <kvm@vger.kernel.org>; Tue, 30 Jul 2024 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722327054; cv=none; b=rI58li9i4VPOF5gEGYdmU9qaJhi41ijy3Fk7gXztMbAqF/UentZYZ//xUqfDbg+YAUjBjMxRdBJehyrqOAIVmtkMWcN2eRW7VSgJtzv4cfKW8olv3atyVyXbRdSZFRnTXbJH4rfDgNpzwY370d0OiGpDPUXVFC9rXKLiTIx6jfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722327054; c=relaxed/simple;
	bh=QQOT2UhJL9gJ5a0vHYE+17pO5MkCn74qZjUbEqwIV5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=SjLHj6b43nCxZ2OW0woteqgK3JiBkd3bA0KnE3UvQ34NluFHuxJsp1U0wj/gNNX8p7eFBH5fPFVM0UFPN0+/aWbt+nROuvPVGZS3TB/om4iL+TyxeFhLc0fn5k8BMVn2d68KnuA0X9cahPvFwaqsgGFldS6c1vxtbrepfHGX5CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HyTTuB4e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722327051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rEo38lpj5pKroMhTmXhAg9xdI4a0uSu2selrCgZQTVY=;
	b=HyTTuB4eOO5UqKkI2AT7XpaGdlIA+hcVVde4wbp0rpr+F2pP+WaASImIFjTpJ+wJ/E5q3Q
	f1ccFZWxLzdleYpx0cWrVlena0YbnrGC4sAI11399t/73SeoVXRi0Nelv7Ioa62kwlAvh3
	nKTgOTt4K3EeLozksG3qrPdm6ISZGJM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-365-uYIN_LaRPM2GTvQ-9jPnAA-1; Tue,
 30 Jul 2024 04:10:44 -0400
X-MC-Unique: uYIN_LaRPM2GTvQ-9jPnAA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 66A411956095;
	Tue, 30 Jul 2024 08:10:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.65])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 08C131955D47;
	Tue, 30 Jul 2024 08:10:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D59B921F4B8E; Tue, 30 Jul 2024 10:10:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com,
	andrew@codeconstruct.com.au,
	andrew@daynix.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com,
	berto@igalia.com,
	borntraeger@linux.ibm.com,
	clg@kaod.org,
	david@redhat.com,
	den@openvz.org,
	eblake@redhat.com,
	eduardo@habkost.net,
	farman@linux.ibm.com,
	farosas@suse.de,
	hreitz@redhat.com,
	idryomov@gmail.com,
	iii@linux.ibm.com,
	jamin_lin@aspeedtech.com,
	jasowang@redhat.com,
	joel@jms.id.au,
	jsnow@redhat.com,
	kwolf@redhat.com,
	leetroy@gmail.com,
	marcandre.lureau@redhat.com,
	marcel.apfelbaum@gmail.com,
	michael.roth@amd.com,
	mst@redhat.com,
	mtosatti@redhat.com,
	nsg@linux.ibm.com,
	pasic@linux.ibm.com,
	pbonzini@redhat.com,
	peter.maydell@linaro.org,
	peterx@redhat.com,
	philmd@linaro.org,
	pizhenwei@bytedance.com,
	pl@dlhnet.de,
	richard.henderson@linaro.org,
	stefanha@redhat.com,
	steven_lee@aspeedtech.com,
	thuth@redhat.com,
	vsementsov@yandex-team.ru,
	wangyanan55@huawei.com,
	yuri.benditovich@daynix.com,
	zhao1.liu@intel.com,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH 04/18] qapi/common: Drop temporary 'prefix'
Date: Tue, 30 Jul 2024 10:10:18 +0200
Message-ID: <20240730081032.1246748-5-armbru@redhat.com>
In-Reply-To: <20240730081032.1246748-1-armbru@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: B2vNrrnnxKGi

Recent commit "qapi: Smarter camel_to_upper() to reduce need for
'prefix'" added a temporary 'prefix' to delay changing the generated
code.

Revert it.  This improves OffAutoPCIBAR's generated enumeration
constant prefix from OFF_AUTOPCIBAR_OFF to OFF_AUTO_PCIBAR_OFF.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/common.json |  1 -
 hw/vfio/pci.c    | 10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/qapi/common.json b/qapi/common.json
index 25726d3113..7558ce5430 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -92,7 +92,6 @@
 # Since: 2.12
 ##
 { 'enum': 'OffAutoPCIBAR',
-  'prefix': 'OFF_AUTOPCIBAR',   # TODO drop
   'data': [ 'off', 'auto', 'bar0', 'bar1', 'bar2', 'bar3', 'bar4', 'bar5' ] }
 
 ##
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 2407720c35..0a99e55247 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1452,7 +1452,7 @@ static bool vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
     int target_bar = -1;
     size_t msix_sz;
 
-    if (!vdev->msix || vdev->msix_relo == OFF_AUTOPCIBAR_OFF) {
+    if (!vdev->msix || vdev->msix_relo == OFF_AUTO_PCIBAR_OFF) {
         return true;
     }
 
@@ -1464,7 +1464,7 @@ static bool vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
     /* PCI BARs must be a power of 2 */
     msix_sz = pow2ceil(msix_sz);
 
-    if (vdev->msix_relo == OFF_AUTOPCIBAR_AUTO) {
+    if (vdev->msix_relo == OFF_AUTO_PCIBAR_AUTO) {
         /*
          * TODO: Lookup table for known devices.
          *
@@ -1479,7 +1479,7 @@ static bool vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
             return false;
         }
     } else {
-        target_bar = (int)(vdev->msix_relo - OFF_AUTOPCIBAR_BAR0);
+        target_bar = (int)(vdev->msix_relo - OFF_AUTO_PCIBAR_BAR0);
     }
 
     /* I/O port BARs cannot host MSI-X structures */
@@ -1624,7 +1624,7 @@ static bool vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
         } else if (vfio_pci_is(vdev, PCI_VENDOR_ID_BAIDU,
                                PCI_DEVICE_ID_KUNLUN_VF)) {
             msix->pba_offset = 0xb400;
-        } else if (vdev->msix_relo == OFF_AUTOPCIBAR_OFF) {
+        } else if (vdev->msix_relo == OFF_AUTO_PCIBAR_OFF) {
             error_setg(errp, "hardware reports invalid configuration, "
                        "MSIX PBA outside of specified BAR");
             g_free(msix);
@@ -3403,7 +3403,7 @@ static Property vfio_pci_dev_properties[] = {
                                    nv_gpudirect_clique,
                                    qdev_prop_nv_gpudirect_clique, uint8_t),
     DEFINE_PROP_OFF_AUTO_PCIBAR("x-msix-relocation", VFIOPCIDevice, msix_relo,
-                                OFF_AUTOPCIBAR_OFF),
+                                OFF_AUTO_PCIBAR_OFF),
 #ifdef CONFIG_IOMMUFD
     DEFINE_PROP_LINK("iommufd", VFIOPCIDevice, vbasedev.iommufd,
                      TYPE_IOMMUFD_BACKEND, IOMMUFDBackend *),
-- 
2.45.0

