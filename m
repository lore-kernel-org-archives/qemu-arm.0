Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp431673ejb;
        Thu, 15 Feb 2024 00:44:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV1tSHIfYlfMuuTzY1Q8UU8zVSA4r9Mf8uYaIpPi/+zH9QnuEtpiccMwDPeBhmnfvErURghBE0WlJq+EhXgAvfvFwhfCevN
X-Google-Smtp-Source: AGHT+IFJlPMJ26Dj11LWiWb925xn0oQvIBRpQsTtkhdq810I2+Wp8B4DeDm3zPQ8RcKxBGVIAyYb
X-Received: by 2002:a05:620a:2208:b0:785:b921:40a0 with SMTP id m8-20020a05620a220800b00785b92140a0mr1461412qkh.17.1707986666199;
        Thu, 15 Feb 2024 00:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707986666; cv=none;
        d=google.com; s=arc-20160816;
        b=te9qF7Emet+SjC/mpCSZXSszGLhNmujWBArDs7oHFzX1yKVKS9dUXKHgkE6OPx0BdS
         32mfS0HRwxAmLg45Ad3i93lB5zTUpqP3gwG/lUXMTe1K1OO8qUd+q32EEVrhfljlvEKY
         UKRI/S+JDv0hylIBJ0VXTMwE192QBa/4aGp5NVcMPtvA129PPTzg5BTKGGpO7V+3r9th
         62XfHGcQ3NrFv6A0Sv7fLNtSgWSLPctVtuthVVlyAQCXNROHs4+lW2HvrzCB7Fe8XK7P
         ETvIiD8o/M0d7y4MRVNPn6KMALqrWz9x1oBlu2ErN1RJQY5hTljS6DaFl6HFNFGn8MAk
         4zkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cyZooDCSfcEkdv9/7vg+GOMr/LkugjJbT4YX/tuXRXs=;
        fh=dsHfM+Mw8oDNXgO0Kstu1+xrcf1CHu/m35bC60t/K20=;
        b=pU0042cw2wcGovzrpWxpH7WU3rdDq1ZEo4wBGcjbQhSxkuTxf0R6gCyMh9HlcfG2/d
         BOY+ONM1urYB0LZd2fScB+v4zSbZ8YmgOOeGozM0cq3t0j5qJHzUnuIJguBHH6EWf93A
         uhq/DvVm5INihhbqAmtATyNXnOrdv9TTY1G3GN/IuUVouTFp/GSgsIzhsq7hJgHd+uAm
         TpqFnN6ygSPSdzH3Z0hVNwCRvZVYGTxKYNg9TWxmrNZG/uoiv+dsR/DWfCnpRvSTbI2c
         PSfRF5siMZow073hwKi8aRS7wI9AFdetZPRYZB+RU0S9mgyid9VsIGh9kwxnCuwjY4YJ
         1r9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MDR0kKvt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020a05620a248600b00785982ccee8si1129528qkn.130.2024.02.15.00.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 00:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MDR0kKvt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raXLx-0001aq-To; Thu, 15 Feb 2024 03:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1raXLt-0001T9-8Z
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 03:44:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1raXLq-0001Rf-QJ
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 03:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707986653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyZooDCSfcEkdv9/7vg+GOMr/LkugjJbT4YX/tuXRXs=;
 b=MDR0kKvt7Tkn8L0NTJEOuwk1LEy9VDTj6m1sdrvT/KyWQBbO0C+lVgth6pKzUxWMk1zEm1
 YVYCWqpqTBwM9Ir6QzozqJrTI01uti+yvHr4nPuxNF0Efax3ZuFPBA/RkaXQH82vo4Hh0v
 ZjA20KGW4D67B2yRKWjjChTRb5sZ6AE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-Uxham-c1OeObl78R7R1Bdg-1; Thu, 15 Feb 2024 03:43:30 -0500
X-MC-Unique: Uxham-c1OeObl78R7R1Bdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CBA9101A52A;
 Thu, 15 Feb 2024 08:43:29 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A992EAC0A;
 Thu, 15 Feb 2024 08:43:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, mst@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v5 2/4] virtio-iommu: Trace domain range limits as unsigned int
Date: Thu, 15 Feb 2024 09:42:12 +0100
Message-ID: <20240215084315.863897-3-eric.auger@redhat.com>
In-Reply-To: <20240215084315.863897-1-eric.auger@redhat.com>
References: <20240215084315.863897-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.531,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5b9Vazo2WtkM

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

