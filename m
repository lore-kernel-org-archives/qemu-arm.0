Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp311708eje;
        Tue, 13 Feb 2024 10:30:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRj3ZClOpctG0iF5nQs5HN52ZOnNBJJQcmoDYRcxfjx4yoa8yNnw48hjO/IcDb6mm+jKxt0GNK7dB7CkjBI5jIqx+8PYvm
X-Google-Smtp-Source: AGHT+IFGA3ESrp/olXy3/1H2TbN+oW8Sjjqyk2rOnj6ge4oKzF3p2/3EEqXWtwDmdKpg+x2auXAm
X-Received: by 2002:a05:6808:3a10:b0:3c0:3a33:655c with SMTP id gr16-20020a0568083a1000b003c03a33655cmr277038oib.13.1707849027163;
        Tue, 13 Feb 2024 10:30:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707849027; cv=none;
        d=google.com; s=arc-20160816;
        b=HL2T2qnZTHQ32DZ7tWze4FfWI7lvD8FW/xkpHvgi97Gumf4YoBVuWzIq4Ov4DdnrHr
         DXlVfw+siGyhNS+CQxbnDC7lOgo2797NTWTKPQMb2l1rP8wbE3+EDBHf4v+mK5JUg+FX
         7o3jplmbjOPYumwxyCsnNZohQjlrY33c5C/DNwg2sheRtLvQrtSTYvwS79EvR4TkRnzM
         JtOFfCKl70Ul1YMUNsGl1NF5fZcuvmoqefHWVxgEa57quPpQJa9xl6JnPm9bNbp59vh6
         AmL2GdZxkvGQF3QuDoPyMeK6W2Gxs4aBd8teExxlRHSpftHmZr7WsyU++Weu4YPcUIeB
         BFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cyZooDCSfcEkdv9/7vg+GOMr/LkugjJbT4YX/tuXRXs=;
        fh=3ARbC0AyeFY0HVeeqCUkdOZVBgYazQD4kXdxvJrrXt4=;
        b=bGw23rm7iPfsk40skFlFOFNm1Ha/ihtDniJG74oH30ieqn5j/C81jMgdNbOHg8ASg/
         Q8WkQIGaYvASm4oajmLLWdyRg2G3qFev0Cv3NutTAIz6NfGNfYV14gcqn/IZHyfht8wY
         dF6n57F8rl/MkvOn4M7D1m51MgauwQJmR3s1cgHvQBbCmG/3RKcrfP56LBMENEdZYCPo
         vFKVVojAIlYUS/DDLAae59odfUAzecJX5xEJfS5+AM9tG6d8KIwca9jWzTqtWWPt/Ad+
         H6hWxgLyQUmCkWOfcuOCrSBL2RYy7wmSO4bUhZn1GSrCBEkjJ8w4+eUvzaxa7fG6Rms1
         zS8w==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BC1QVW5R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCW2Ft0bqBdTl37nWtvGwzSSnv7edI/HUu8y+hbiJs+9NhsPx5HFfHc4IPitDelAsEkV6r/NrIXulO/8+FihG0t4A3RyZOgr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19-20020a05620a449300b0078553a07226si9789966qkp.570.2024.02.13.10.30.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 10:30:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BC1QVW5R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZxXZ-0006g2-Dk; Tue, 13 Feb 2024 13:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZxXX-0006fX-FY
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 13:29:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZxXW-0001tj-0j
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 13:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707848993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyZooDCSfcEkdv9/7vg+GOMr/LkugjJbT4YX/tuXRXs=;
 b=BC1QVW5Ryh1CVXUyln6SKRxUsFXh94X/0xsxS+n/DU7mDyHsCF4VvK9jNjRW+9LT/8OuNi
 F8sERs+hzCXODaIm3WjHC5GgtrmTe8NrsI9j72GHuz12tHMWbilB2OJA2BW/LVTNnI1/CN
 ypg70+Nf0MlbB9Dr79XwyfTxHHaDtus=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-0K4aJGfGObufIs4WC2umxg-1; Tue, 13 Feb 2024 13:29:49 -0500
X-MC-Unique: 0K4aJGfGObufIs4WC2umxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2396106D0C5;
 Tue, 13 Feb 2024 18:29:48 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC7B740D1B6A;
 Tue, 13 Feb 2024 18:29:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, mst@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v4 2/4] virtio-iommu: Trace domain range limits as unsigned int
Date: Tue, 13 Feb 2024 19:28:29 +0100
Message-ID: <20240213182933.825268-3-eric.auger@redhat.com>
In-Reply-To: <20240213182933.825268-1-eric.auger@redhat.com>
References: <20240213182933.825268-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.504,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: qF++KZ5ITEWA

Use %u format to trace domain_range limits.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/virtio/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 77905d1994..2350849fbd 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -111,7 +111,7 @@ virtio_iommu_device_reset(void) "reset!"
 virtio_iommu_system_reset(void) "system reset!"
 virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
 virtio_iommu_device_status(uint8_t status) "driver status = %d"
-virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_start, uint32_t domain_end, uint32_t probe_size, uint8_t bypass) "page_size_mask=0x%"PRIx64" input range start=0x%"PRIx64" input range end=0x%"PRIx64" domain range start=%d domain range end=%d probe_size=0x%x bypass=0x%x"
+virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_start, uint32_t domain_end, uint32_t probe_size, uint8_t bypass) "page_size_mask=0x%"PRIx64" input range start=0x%"PRIx64" input range end=0x%"PRIx64" domain range start=%u domain range end=%u probe_size=0x%x bypass=0x%x"
 virtio_iommu_set_config(uint8_t bypass) "bypass=0x%x"
 virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
-- 
2.41.0

