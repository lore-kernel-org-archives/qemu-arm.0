Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3263439lfc;
        Wed, 13 Oct 2021 12:19:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPMmyMtlDk90Li8d40FjLVCYOGeuB87Hxj1425mrg8D2Df+hC7ihXO3o+Sgvx9lxxfpHFI
X-Received: by 2002:ac8:5f4d:: with SMTP id y13mr1397277qta.16.1634152782017;
        Wed, 13 Oct 2021 12:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634152782; cv=none;
        d=google.com; s=arc-20160816;
        b=ucSL3xQQAQ5ti/Gt0mu85DxuWCmMkjPeDT0BMF2gwcHwGhYbn/oEIG0MCsX+d/dld+
         aHZFn0KIJXxyro2lRPLmVnolLpyHM/cv5poPWvGAMwGlXFsn/30XFVP2nXYv3x5y/G8z
         YUttl6aADRlHg1iGLe1aVeWrYBJlZ0YXhVpe6gmZA6ICQQkEh4T/46+EaaV47u3nqbK7
         E1nCMtzLOTBoufSPVAom6WtvmjqkIRgM4QWRoWJHrdjrpcpsjDdE0/Ya/5NdaeWuRsXp
         EpCzbaJ/qmrEVeMd04Cnm1kX0crFl1CLZjmtV+2/ROUSnD3mCPguC8OTqoyXqW7/9rkn
         yyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o2NAnYAlRSvrJz/V3FlJd7dHnql2g2ReULcYNzzRaE8=;
        b=v8LEVq1ZlP0nPMJ5FQ1Swuh8LKaiReTT4DYhaX6hKnOXYWsBaDenH0r6zdmeVk141+
         PVCAjevQPRlnu2GdMxWTZgHc4VEcj22PLqNsRQe5wfbexz/e9oy23D9XlhZbCKfZZ96y
         1Pprsv2iqPr4h6qcGCOqbJYsSOuLWlk1tMqfmxblzKE7pOy493zo7BxmWaNPiXDeQZMh
         b6THEfmS3ax3q1sHUDdG52HqfEvLp61GkyTDn3wlsIoQYhOD4mXqd1cLh7yY8cNlVx4u
         0xBp3EoGJVkbeQ/cEyCkfU6DzoboR5YRuK+P64r3kY7OcQ9dPwXB8SqL5VXFAGGZzdxc
         +Pig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VhomGXyz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c63si247038qkf.323.2021.10.13.12.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 12:19:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VhomGXyz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1majmv-00064I-EX
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 15:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1majlO-00041Y-19
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:18:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1majlK-0003d8-Kp
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634152681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2NAnYAlRSvrJz/V3FlJd7dHnql2g2ReULcYNzzRaE8=;
 b=VhomGXyzKdgOLTVVucmPlfh/2d+8uWm4N5FO4O0CqYwbFj/PA3P04xnGg4qyvEUB7r28yT
 89dzEddnEwiRLC0cVatpF0cVQGz5KERNVEofDi3xyMfT+7Ao8Z48AKkyXQYWH71WRMloFf
 CjqVdWd2usr/YQ1J/XFGcxJ9mwPAhQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-F7TlVXI6Ouix2qsN_y2-iA-1; Wed, 13 Oct 2021 15:18:00 -0400
X-MC-Unique: F7TlVXI6Ouix2qsN_y2-iA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8BA8101B4A1;
 Wed, 13 Oct 2021 19:17:58 +0000 (UTC)
Received: from virtlab-arm04.virt.lab.eng.bos.redhat.com
 (virtlab-arm04.virt.lab.eng.bos.redhat.com [10.19.152.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D7A660CC3;
 Wed, 13 Oct 2021 19:17:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, cohuck@redhat.com,
 peter.maydell@linaro.org
Subject: [PATCH v3 1/2] virtio-iommu: Remove the non transitional name
Date: Wed, 13 Oct 2021 15:17:54 -0400
Message-Id: <20211013191755.767468-2-eric.auger@redhat.com>
In-Reply-To: <20211013191755.767468-1-eric.auger@redhat.com>
References: <20211013191755.767468-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, abologna@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iEFsHdPOAIiF

Remove the non transitional name for virtio iommu. Like other
devices introduced after 1.0 spec, the virtio-iommu does
not need it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Andrea Bolognani <abologna@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
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

