Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1573048lfk;
        Fri, 26 Nov 2021 23:33:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCWkTy1Iymezh865bY/Gl9Jp9cXaIpuBVPqqh7Uv0RdCACsj5OXooaBftz5noIAXlOhr8Q
X-Received: by 2002:a5d:9a95:: with SMTP id c21mr41146908iom.189.1637998413128;
        Fri, 26 Nov 2021 23:33:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637998413; cv=none;
        d=google.com; s=arc-20160816;
        b=i1eR640nHCrPqZQ5bzBT5h/kOtAkfipXE3+SmSMn6w67pjVlcRn+r3FcwF2GcK8FV7
         XxErTWCzHxXApT66sgq31ScXZV4PDPaUwY2w7IIEveYXI1vU9/fRiX9/XiAh0dhKpMnx
         DolnTYwVS/I7+140Z20i5iG/qkSgNlkYeckvUgQ+UY8/bkEZ/XOmf+R42QqmO3JyfaVE
         U6udDfK461PAyXCWDOv6r4CJl8+tSn8Dy/ED/d7hJzFj/ncFTJQKqHATDrmk9PJSaUs2
         MPdTtMfjSELO2dWWozqF3zioIT1BgmqWnWvII76ZQbx94JoFJKx4DM1zr2YLxmVZeG2F
         ogZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k1wDKg9aw/hWRMb7nm4bmGH+Fur/D3LtTB6XsUnPF2c=;
        b=rkk4FPRttCJusgeMWBLZHN64Gt12Ldz2lCuM7aF0xlc4mZgsCLMU/DMpviTv1lUEWV
         3JRty0rmnK36dNc7XZsvQvAGUs51g+lcKgOiP0y7nLdfNndTbajxBzxNpCW581QlRLAZ
         EiCbgC5oZph0p6CQptZsYikS86CUC8kOuFZRCZDcUG9lmyTBcu+HPLboj4Qb6CiwFr2V
         Jt7NBUP3N6uScgDSTHomzDqqbibvy0cdJOShl/W4/SfuBwxPxDzxKgV70AwB7AzdLyVf
         07vzzzjtgvNlgK9dqNxJAn1EFle5MKGhUciE9jYAaPwXyIeXs4TasAKLgKSw+4bRsaWX
         Kbsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gt5SlH49;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si16186518jat.133.2021.11.26.23.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Nov 2021 23:33:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gt5SlH49;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mqsDE-0001q4-F1
	for alex.bennee@linaro.org; Sat, 27 Nov 2021 02:33:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9X-0007jB-IF
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 02:29:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9V-0002Cd-Il
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 02:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637998181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1wDKg9aw/hWRMb7nm4bmGH+Fur/D3LtTB6XsUnPF2c=;
 b=Gt5SlH49Wsfn/Kdwhm77mhipClSVVrjTwEzmEWlTmMJNqQMZDXueJNwtqUhOUaQsvdsG2Z
 F9JHM+cEFrGmBL1PEHGY0ONYz2SGyi+LoEOasjZJ1brPgcbFCleiFMjYIdZcq1wo/kfg3c
 siCdjRag3bding9mIRKtBBVDupMO7C4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-Aa9oExiMPVSSq7nUzZUDhA-1; Sat, 27 Nov 2021 02:29:37 -0500
X-MC-Unique: Aa9oExiMPVSSq7nUzZUDhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72C93624;
 Sat, 27 Nov 2021 07:29:36 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 867D0608BA;
 Sat, 27 Nov 2021 07:29:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v6 1/4] virtio-iommu: Remove set_config callback
Date: Sat, 27 Nov 2021 08:29:07 +0100
Message-Id: <20211127072910.1261824-2-eric.auger@redhat.com>
In-Reply-To: <20211127072910.1261824-1-eric.auger@redhat.com>
References: <20211127072910.1261824-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b6yHbLrw7AIe

The spec says "the driver must not write to device configuration
fields". So remove the set_config() callback which anyway did
not do anything.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events   |  1 -
 hw/virtio/virtio-iommu.c | 14 --------------
 2 files changed, 15 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 650e521e351..54bd7da00c8 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -92,7 +92,6 @@ virtio_iommu_device_reset(void) "reset!"
 virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
 virtio_iommu_device_status(uint8_t status) "driver status = %d"
 virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_range=%d probe_size=0x%x"
-virtio_iommu_set_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_range, uint32_t probe_size) "page_size_mask=0x%"PRIx64" start=0x%"PRIx64" end=0x%"PRIx64" domain_bits=%d probe_size=0x%x"
 virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1b23e8e18c7..645c0aa3997 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -832,19 +832,6 @@ static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
     memcpy(config_data, &dev->config, sizeof(struct virtio_iommu_config));
 }
 
-static void virtio_iommu_set_config(VirtIODevice *vdev,
-                                      const uint8_t *config_data)
-{
-    struct virtio_iommu_config config;
-
-    memcpy(&config, config_data, sizeof(struct virtio_iommu_config));
-    trace_virtio_iommu_set_config(config.page_size_mask,
-                                  config.input_range.start,
-                                  config.input_range.end,
-                                  config.domain_range.end,
-                                  config.probe_size);
-}
-
 static uint64_t virtio_iommu_get_features(VirtIODevice *vdev, uint64_t f,
                                           Error **errp)
 {
@@ -1185,7 +1172,6 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
     vdc->unrealize = virtio_iommu_device_unrealize;
     vdc->reset = virtio_iommu_device_reset;
     vdc->get_config = virtio_iommu_get_config;
-    vdc->set_config = virtio_iommu_set_config;
     vdc->get_features = virtio_iommu_get_features;
     vdc->set_status = virtio_iommu_set_status;
     vdc->vmsd = &vmstate_virtio_iommu_device;
-- 
2.26.3

