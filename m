Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2739522lfc;
        Wed, 13 Oct 2021 02:56:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq8rVkG+LCw0L/kQzlQjDnvSStG//LFzmgVLwiTLPQa21EyWb8Td6YNqClv74Mm6w8q04W
X-Received: by 2002:a67:d209:: with SMTP id y9mr34157649vsi.26.1634119009170;
        Wed, 13 Oct 2021 02:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634119009; cv=none;
        d=google.com; s=arc-20160816;
        b=kPnKXA3Cx6G6aqwJH0TphlAleePBHkvyVU+7Wy42k5u6gUUWoj/HKeiIYufGxHX+pc
         +qkvGQLXkfBYD3jB+Vv66+wSGO0djGiYL1NoKCqmBAbh54b/4p6pCxgaHWtL8RLW51ED
         sIiwNma1SX6OtB30IVkTDPeWFs8QuGbol5oWbTlyPsn4rRZgE9k41oDmJ6xRAwDicrEi
         hlOLLAwAX/H2QFwEyhOpcKNLHaEja70VrgsPRHNmFikwFjYO8fClBLY80gupi5kaqZLx
         zqLpQLq0a+LgI7LkD6GIVP4XdCMaN8NYTdb9jDCfPLscZRYtrRkdUACbfdekHlvmNPRd
         FAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=wVvjaP0b6BjDDsb2dY0WSiL5klTEpnk0APTTGcF06f4=;
        b=EfyOUCWqZSzvckg8nfgjKYBPcmKoDb2cRsGGvz/1JjtufSP6xvbrYLm0oDfOTMUOVB
         PK4sCra9wb0lChMoVWXIpglhbaFXUZ6R0MkcDpwTItLgwsuIpiQfaw934krCc2J0uZeX
         R0ro0e2SlHQfbx8iTjaZUF2h/1S3CJujb2B5Qf9KC+dkrnkVrn9AvO6Sc3urS0y4jESC
         l1aT4jrLbwrXGS1ictX/1LTShO1+WYNVEmObcebpvVCSbB9DBYbSWWFuRYlfHDFzXzze
         JG0fRPDn/vqvliNISBtVubpam+fEwlAwukSbAdd34EHzuXWTvo5izqGwvn+t28aXwmQx
         z+BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D70iGbx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si11200807vsh.275.2021.10.13.02.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 02:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D70iGbx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mab0C-0004DM-F6
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 05:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1maaze-00048o-MA
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 05:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1maazd-0007zV-2e
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 05:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634118971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wVvjaP0b6BjDDsb2dY0WSiL5klTEpnk0APTTGcF06f4=;
 b=D70iGbx7Q5Z0tQWocI6qI+PMsSVpoU0o6rns3sy2oagVuahcxP5XLw0XcXATq/An4huvx1
 R9FtmSPhcKCVhK0gauoUYCAh6iMos/DeMvyvdqeBSNDkTGf9HMx/EI50d0nQQUkD3mSlte
 QVScjIrFii8b4LGqoITyEkCigtYH0dM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-tYu-iwJVN5OlQhmRhNTZfg-1; Wed, 13 Oct 2021 05:56:10 -0400
X-MC-Unique: tYu-iwJVN5OlQhmRhNTZfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43CC81927809;
 Wed, 13 Oct 2021 09:56:09 +0000 (UTC)
Received: from virtlab-arm04.virt.lab.eng.bos.redhat.com
 (virtlab-arm04.virt.lab.eng.bos.redhat.com [10.19.152.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8574F196F9;
 Wed, 13 Oct 2021 09:56:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, cohuck@redhat.com,
 peter.maydell@linaro.org
Subject: [PATCH] virtio-iommu: Remove non transitional name
Date: Wed, 13 Oct 2021 05:55:54 -0400
Message-Id: <20211013095554.758806-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dw9pe307k+1o

Remove non transitional name for virtio iommu. Like other
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

