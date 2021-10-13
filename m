Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3051593lfc;
        Wed, 13 Oct 2021 08:29:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7OewE45W6URW6k3hkaYklJI7HPLXalANuKMWcznzniCAqI12kKbPL+mb3E/cAXbcuGsj1
X-Received: by 2002:a0c:b4c9:: with SMTP id h9mr36377407qvf.6.1634138942128;
        Wed, 13 Oct 2021 08:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634138942; cv=none;
        d=google.com; s=arc-20160816;
        b=RzHUFBoNzqqWNZo7pb5KdEeGllzUStT7/J/HLb5C9vGp4pFIImzI4RZqib/7eLYI94
         KAM04hlfnqA/0QWt4FetmisatBXUgQGkizEHpPq1YhKsGWMfZdjh8HXfN2LVyUGAptBI
         XT9Kf0aLYhC1LAd2ARky1b2Fzu3yMX+hiU0+dw+syfcscnqakjf2ymtP5AIYKV0oWfU5
         K9hvHs7dSMmWY4AnVuS0NQoQRni+ygj/A7vUigrxhOr5+HJM/oqXgioMZGuyYOLUqlgW
         C+xS6v7RyJ+3Dy9lTSddrRExF3PC/v30cqp2+7TPDdXJa3Bhc4Rlr+ltY3ahEI5rSfeZ
         vY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SwHV/2QtY80q2FxsMoExm6f2RxPEuHBvYB2jja5QAbQ=;
        b=mIq+m6ao3QniQpyF4YFgy0CAPwLvDhmmv3L/VFPbS2yC5qwIaoUMqLV2tjPiVwjpI6
         lIN8zGfXod3tvv0NHy816/9xwLCA2GsQ3zSN6a9ePlkd6ifgGjWxZuEnATFhTYXRRIV+
         I/kq7wiPNvOD73z5s4c3ndgCA/htja3lr00giCyuOxGDYKkVWchR+7Z0EDrt7nYG2uvh
         0jSKNVxiqZd08FVlrG10L5qW6HvmvXWX6nlcIw3VqxMY4FE5lszfpUfkTQfb9G2P7vMn
         lRrqNWOaXQ8ooDCNHbfwmMdQhv+VF152f+SNv1+AXptU+uakqX88TVIvu/RS0a2J4tr5
         LBdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DLlTJuu2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19si8847541qko.363.2021.10.13.08.29.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 08:29:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DLlTJuu2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1magBh-00009B-Gw
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 11:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1magBV-00006k-Sg
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 11:28:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1magBS-0001iq-Hs
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 11:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634138925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwHV/2QtY80q2FxsMoExm6f2RxPEuHBvYB2jja5QAbQ=;
 b=DLlTJuu2H8EGMPIuj9PADHvu4Nxjx1OpvwLcxK6ZzdN7f8Sc4qg11BPKWHeHrLGFOtp5zg
 pTfden7ZnMiVNAiFKr3iqG2aGlS0457uSJrgmHtdD1Aul2mCG+gOPY7ce8cESnyqS0Fjfi
 8BGHx0B85qgvfGmvZOFk3jhoUUFX0Ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-Mbh4lYOZOcCCSavDHNo9aA-1; Wed, 13 Oct 2021 11:28:42 -0400
X-MC-Unique: Mbh4lYOZOcCCSavDHNo9aA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C59E379EDF;
 Wed, 13 Oct 2021 15:28:41 +0000 (UTC)
Received: from virtlab-arm04.virt.lab.eng.bos.redhat.com
 (virtlab-arm04.virt.lab.eng.bos.redhat.com [10.19.152.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E37D55BAE2;
 Wed, 13 Oct 2021 15:28:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, cohuck@redhat.com,
 peter.maydell@linaro.org
Subject: [PATCH v2 1/2] virtio-iommu: Remove the non transitional name
Date: Wed, 13 Oct 2021 11:28:26 -0400
Message-Id: <20211013152827.764566-2-eric.auger@redhat.com>
In-Reply-To: <20211013152827.764566-1-eric.auger@redhat.com>
References: <20211013152827.764566-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aEzil3G+cz5e

Remove the non transitional name for virtio iommu. Like other
devices introduced after 1.0 spec, the virtio-iommu does
not need it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Andrea Bolognani <abologna@redhat.com>
---
 hw/virtio/virtio-iommu-pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 770c286be7..86fa4e6c28 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -100,7 +100,6 @@ static void virtio_iommu_pci_instance_init(Object *obj)
 static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
     .base_name             = TYPE_VIRTIO_IOMMU_PCI,
     .generic_name          = "virtio-iommu-pci",
-    .non_transitional_name = "virtio-iommu-pci-non-transitional",
     .instance_size = sizeof(VirtIOIOMMUPCI),
     .instance_init = virtio_iommu_pci_instance_init,
     .class_init    = virtio_iommu_pci_class_init,
-- 
2.27.0

