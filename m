Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp244301njc;
        Fri, 21 Feb 2025 04:28:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXbpHcgZBUMee5PmKuIgdDOKMQD8mh5lBbNquqA9VQpV6QGkhdV9QHpvRfjZxHSHXMEUQaqlrcYl4/dDA==@linaro.org
X-Google-Smtp-Source: AGHT+IHh4CJXCHEzYEVPuYQs8WgIKn5AfN8zxxPNRZRANDokyQkyUaCnyzPItjDeHv1hZ4xnvHYo
X-Received: by 2002:a05:620a:1720:b0:7c0:b0b7:493f with SMTP id af79cd13be357-7c0cef4a486mr492428085a.37.1740140885589;
        Fri, 21 Feb 2025 04:28:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740140885; cv=none;
        d=google.com; s=arc-20240605;
        b=f+V1R0u2giRj1mj+iWTVc0Ge280EATBS07mXPmO0PkgsS3eEkyRP67TgyvHnWnGHo/
         8CzQ8/z09LYmDq5M7kx6oFmRr8W8T5xk3MlA45f6/j8KsjOQ/j4uEYKdBML8qfxgpXOS
         xWp6CAQzEOvXgUTLWAw+8Pk4CrARKyPu9eT9/LiLj7/dSZUXDG2sfw+TIAG0qHUA9zmz
         iXUz7gL+OD1NF2qxGNmVKrecsKAR2eDNRgUN9DbAzh+EMH/4el6X1l4B0ZU/CjNPbb+E
         G5nTNRkRu55xfQ5QimIMhXd8YTWbxDUBpluFERRlWsVAerWxpDPS5gxD5Vd9DwnS/C5U
         f41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=EBrAYudfN30eTDxsGlpkwQ5zRuzxrz1/bLUV220VFQI=;
        fh=gM8cQd+sQwqiIsXSFiZOVfZCpXNcHj+3db18o8VwB+c=;
        b=B4Vf6lWKiRgQi5lSd7agp3UbAjS6XqTPrSiAbqbaieE7srqH1Yzf09cpK4qob0dcm9
         TXZ61EM0KGXUnm125h+ErCpyS0UjBfV8t8rR8Qmv2LPlT7ZszNOjknkTMGDzDr3xgfzE
         Yue9cIyA3U9h07crjD/QG4tu3UC5ipNz4ydoWFAdrj6v8u/ytll5Yv2RQIxzScZhpUvF
         rePdOAWycqehK1BP4ITvzofrWC3P3MEeoW6nrv2AJ8GSVNyV0K9ypOql05xodJ3cAm7k
         R8Q6GLZJdoG7iRQ6DS69AnvwCZb+WtNRRN79CZJQ1vnglbK8NYHZT6mHZw+jZ9gsURCV
         bnYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aFaFOOaY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c09afab4ebsi953714985a.242.2025.02.21.04.28.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2025 04:28:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aFaFOOaY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tlS5U-0002lF-Sl; Fri, 21 Feb 2025 07:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tlS5O-0001wc-34
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 07:24:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tlS5M-0007FX-4y
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 07:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740140691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EBrAYudfN30eTDxsGlpkwQ5zRuzxrz1/bLUV220VFQI=;
 b=aFaFOOaYnVj9ULWSk6wGGS7U95lIvEmS8KSRyGx2pvXHVrzaS6Yo+RmQ4tOy6BrlMwxbNm
 s2eNB+SQX/B9MO2kZQqgfsqYVSQp4ua+Qry9LecimrUI7VjKYaCt+/rvTts/LUzym4yWA0
 P+JNfASCxTYywNuVl5JRvV57ViM95Cc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-ciXNb4qvNFiQmF8UrRAaug-1; Fri, 21 Feb 2025 07:24:50 -0500
X-MC-Unique: ciXNb4qvNFiQmF8UrRAaug-1
X-Mimecast-MFC-AGG-ID: ciXNb4qvNFiQmF8UrRAaug_1740140689
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38f36fcf4b3so1229551f8f.1
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2025 04:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740140689; x=1740745489;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBrAYudfN30eTDxsGlpkwQ5zRuzxrz1/bLUV220VFQI=;
 b=apGYmHgasVY0ZRJjCjd/aGeSDWABVGUeB7OGd3dCeSVfNMO62hYAq8EKKIlYsLO2c1
 mwYZSdt6HowDxiW/L8zyvRcNlXovUiPbARzurQFhtgI/AWSc/73CMv26h3zu4yYbo9f7
 lhIeydHwwyGK14tP50zArso3bFEijp0sZe0QFGFg+RJlTYuxMVkTdNXFCDzaqsWUACTL
 WAf6JSVByf24j4GF9QTPcfde15mFCVSWJKDwp+AOhRwkiMojO+YPqD1Y9Oz/BDhwBZBi
 A4cwuy3PflF5O9WN+24ukfPCWgTOQ7FQzzEvJoZ91cRVp2ix5f1bzpsIcry3H9yY2g3p
 jO8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUa31tr+D3yWm3Q3EY9Vu+3Ww01fH1NvOLcEKm3967sXbYGIZyChvGh0fK7Vd4aomvKmsQ+DDD4Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx6k0ZswQrHRBS2dECD2ENsdLv4dulg2qMqm+MFPr/ELsEfQeNf
 KUsksGOYNWx9McK3YCn5GEU3QgNWkAAYIFLzpSECWle+UXRTjwMiiYSKU+Ad0mX0oP3Ro8MQW0g
 jJauFfSUQ3qgrtdOv8wHg2R0IdqQYpmoFalsMYUwc+E6SHkJEiw==
X-Gm-Gg: ASbGnctFpCxZdB06zciWMVotifUuIYNXhpUYB8X/NQL9iMxe5xcQ3ooUzOebjRNdnya
 g+uEisfYOYmsyo86dzIcJLXnaK5qIQs8JsuxG4/3Br6fg8zsumkP4cJedmghLbSAMqCXaMUKH/a
 NhV/eQoCJNlW+D6xdck0W9s2iMVhtCAYTB3nnUcm6EYXbu/emRRLZsKFK7z6SSf+rQw+FCCrTNQ
 XXvGUvaQ986ksLWiBZFwJZY/BdLlO5Y1cLylTjHYMXKuQDBstz1OJyM7wucewXjlOOD6bjByVV5
 8NMM0Q==
X-Received: by 2002:a05:6000:178d:b0:38f:4263:9d62 with SMTP id
 ffacd0b85a97d-38f6e9791acmr2815541f8f.27.1740140689047; 
 Fri, 21 Feb 2025 04:24:49 -0800 (PST)
X-Received: by 2002:a05:6000:178d:b0:38f:4263:9d62 with SMTP id
 ffacd0b85a97d-38f6e9791acmr2815517f8f.27.1740140688648; 
 Fri, 21 Feb 2025 04:24:48 -0800 (PST)
Received: from redhat.com ([31.187.78.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d65dfsm23693257f8f.64.2025.02.21.04.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 04:24:48 -0800 (PST)
Date: Fri, 21 Feb 2025 07:24:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 39/41] hw/arm/smmuv3: Move reset to exit phase
Message-ID: <e39e3f8b8dea856f141e9945167d2b18021ef445.1740140520.git.mst@redhat.com>
References: <cover.1740140520.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1740140520.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 52ojhOAqV9M_JiHV7j4Quckdz3aQYemkZjmv0gpqSqg_1740140689
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: U8eyC6v88ImD

From: Eric Auger <eric.auger@redhat.com>

Currently the iommu may be reset before the devices
it protects. For example this happens with virtio-scsi-pci.
when system_reset is issued from qmp monitor: spurious
"virtio: zero sized buffers are not allowed" warnings can
be observed. This happens because outstanding DMA requests
are still happening while the SMMU gets reset.

This can also happen with VFIO devices. In that case
spurious DMA translation faults can be observed on host.

Make sure the SMMU is reset in the 'exit' phase after
all DMA capable devices have been reset during the 'enter'
or 'hold' phase.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Message-Id: <20250218182737.76722-4-eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/smmu-common.c |  9 +++++++--
 hw/arm/smmuv3.c      | 14 ++++++++++----
 hw/arm/trace-events  |  1 +
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index dd74c2e558..8c1b407b82 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -924,7 +924,12 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static void smmu_base_reset_hold(Object *obj, ResetType type)
+/*
+ * Make sure the IOMMU is reset in 'exit' phase after
+ * all outstanding DMA requests have been quiesced during
+ * the 'enter' or 'hold' reset phases
+ */
+static void smmu_base_reset_exit(Object *obj, ResetType type)
 {
     SMMUState *s = ARM_SMMU(obj);
 
@@ -949,7 +954,7 @@ static void smmu_base_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, smmu_dev_properties);
     device_class_set_parent_realize(dc, smmu_base_realize,
                                     &sbc->parent_realize);
-    rc->phases.hold = smmu_base_reset_hold;
+    rc->phases.exit = smmu_base_reset_exit;
 }
 
 static const TypeInfo smmu_base_info = {
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index c0cf5df0f6..b49a59b64c 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1870,13 +1870,19 @@ static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
     }
 }
 
-static void smmu_reset_hold(Object *obj, ResetType type)
+/*
+ * Make sure the IOMMU is reset in 'exit' phase after
+ * all outstanding DMA requests have been quiesced during
+ * the 'enter' or 'hold' reset phases
+ */
+static void smmu_reset_exit(Object *obj, ResetType type)
 {
     SMMUv3State *s = ARM_SMMUV3(obj);
     SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
 
-    if (c->parent_phases.hold) {
-        c->parent_phases.hold(obj, type);
+    trace_smmu_reset_exit();
+    if (c->parent_phases.exit) {
+        c->parent_phases.exit(obj, type);
     }
 
     smmuv3_init_regs(s);
@@ -1999,7 +2005,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
     SMMUv3Class *c = ARM_SMMUV3_CLASS(klass);
 
     dc->vmsd = &vmstate_smmuv3;
-    resettable_class_set_parent_phases(rc, NULL, smmu_reset_hold, NULL,
+    resettable_class_set_parent_phases(rc, NULL, NULL, smmu_reset_exit,
                                        &c->parent_phases);
     device_class_set_parent_realize(dc, smmu_realize,
                                     &c->parent_realize);
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index c64ad344bd..7790db780e 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -56,6 +56,7 @@ smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
+smmu_reset_exit(void) ""
 
 # strongarm.c
 strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
-- 
MST

