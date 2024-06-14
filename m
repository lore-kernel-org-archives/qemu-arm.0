Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp149481ejb;
        Fri, 14 Jun 2024 02:55:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMJiB5inIFDZ2AZw6VovxnOlpkyIQ5Bom0lfbrwchRtUnvPhlU3fjS5Yi+PWqC1HeP2alQ29thY/acXqY9jIJAEy1WOTWy
X-Google-Smtp-Source: AGHT+IGvzvRKuN6TU5Q5ze/mbD1aqaNL758WI5WgJS2Ec2YYFuzh2FYRvMBc+YgzVTVrlPPjoQ3l
X-Received: by 2002:a67:fb87:0:b0:48b:c136:67ed with SMTP id ada2fe7eead31-48dae3e15eemr2127582137.24.1718358927331;
        Fri, 14 Jun 2024 02:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718358927; cv=none;
        d=google.com; s=arc-20160816;
        b=PdPFQbubM9ob5t/eLhRPGFnVXsC/awVJExzuA+CAWrPchUREC7VcLNiIYc3DjH4w5N
         JFjfgPbof7FoNSxyxsSfTcD1WJIttIBRhBUdoeAMy5t17CFmiIKEpT2dc0dBCzIfxqYM
         kuJ2Wyd1EEuFlmiw0rxfYuuy7d9slwZECAGizPLKRR6suHUbJzu0np0kt3whMClsoA63
         RqMifRVtGnGjckL0qMriMT/E+nZUSx1P/AluwcrIiQnSLlk2AsZdq4aTKJ57JwhTzTeO
         gXOKWEvE9CPKfj20iNoe3rSeRRJwbS1k9qGiUk0pxV2h4qiQfWwqaI7Fe9sYXcoTRkkl
         N1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/HKnQiklWYaIghTeOtHpxL/kWpViS48zyv9S134mg24=;
        fh=NBkbC8z0yxZVnBu5+T/osSPCS2NzeZu/yHpj5pv7NrY=;
        b=npVYhkW7IcIYxOOZIYHk5kDg1+0WpBAn8qdGIqczW7LtA/bdQkPrubxUXYm2tS89Nk
         XN0EgJEpi3M3XmUjWKSAQpKe3474zYr4147plgBNTRrV6vZ1KyyimBMrWN9kDBqJK1tV
         eVkeZ0Gvo/pI09+3vbS5yXEKPoq+12qmuDDHKz0sLdGKHfHjliTrdALep2L1szkrM+bj
         6rDzKTcJRaVGu2iufnI6XNX1tpvbZ+0M0frpBWZUPKcaHZN4wmYxqH842lY6tuk7o4kf
         Ug2JT2PBaoF2jfkTyuSrJotrhEr88ysAT0/WOziFVcmX56Ep+UZWr6xJimeefX4Kha5T
         wcXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CD2JsMW/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abd10643si336483285a.387.2024.06.14.02.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 02:55:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CD2JsMW/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sI3du-0006GN-Ig; Fri, 14 Jun 2024 05:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI3dq-0006FJ-Ej
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 05:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI3dp-0003bT-0v
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 05:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718358879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/HKnQiklWYaIghTeOtHpxL/kWpViS48zyv9S134mg24=;
 b=CD2JsMW/d7m8MkoZxuhWJZpgEFUdhRF9MAEb2t43H3e7UvhTO3xz8RSknl2tpFLR/38S3a
 LMnM3/yCMjWaOA4F4mDhxsl7fjZRNq7DxvBpctrroJgKXTzrU1t/CVxMQ3bREenfYmuM0o
 urEQ6oCGGGn8WWuf1wPxja9NyMSGK2s=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-RrmSGGorNGWiGv8_7QMUsw-1; Fri,
 14 Jun 2024 05:54:35 -0400
X-MC-Unique: RrmSGGorNGWiGv8_7QMUsw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6128F195609E; Fri, 14 Jun 2024 09:54:34 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 05446300021A; Fri, 14 Jun 2024 09:54:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v4 4/8] HostIOMMUDevice: Store the aliased bus and devfn
Date: Fri, 14 Jun 2024 11:52:54 +0200
Message-ID: <20240614095402.904691-5-eric.auger@redhat.com>
In-Reply-To: <20240614095402.904691-1-eric.auger@redhat.com>
References: <20240614095402.904691-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Vdo9KlL87pmP

Store the aliased bus and devfn in the HostIOMMUDevice.
This will be useful to handle info that are iommu group
specific and not device specific (such as reserved
iova ranges).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/sysemu/host_iommu_device.h | 2 ++
 hw/pci/pci.c                       | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/host_iommu_device.h b/include/sysemu/host_iommu_device.h
index 40e0fa13ef..ee6c813c8b 100644
--- a/include/sysemu/host_iommu_device.h
+++ b/include/sysemu/host_iommu_device.h
@@ -35,6 +35,8 @@ struct HostIOMMUDevice {
 
     char *name;
     void *agent; /* pointer to agent device, ie. VFIO or VDPA device */
+    PCIBus *aliased_bus;
+    int aliased_devfn;
     HostIOMMUDeviceCaps caps;
 };
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index c8a8aab306..50b86d5790 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2745,11 +2745,15 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
 bool pci_device_set_iommu_device(PCIDevice *dev, HostIOMMUDevice *hiod,
                                  Error **errp)
 {
-    PCIBus *iommu_bus;
+    PCIBus *iommu_bus, *aliased_bus;
+    int aliased_devfn;
 
     /* set_iommu_device requires device's direct BDF instead of aliased BDF */
-    pci_device_get_iommu_bus_devfn(dev, &iommu_bus, NULL, NULL);
+    pci_device_get_iommu_bus_devfn(dev, &iommu_bus,
+                                   &aliased_bus, &aliased_devfn);
     if (iommu_bus && iommu_bus->iommu_ops->set_iommu_device) {
+        hiod->aliased_bus = aliased_bus;
+        hiod->aliased_devfn = aliased_devfn;
         return iommu_bus->iommu_ops->set_iommu_device(pci_get_bus(dev),
                                                       iommu_bus->iommu_opaque,
                                                       dev->devfn, hiod, errp);
-- 
2.41.0

