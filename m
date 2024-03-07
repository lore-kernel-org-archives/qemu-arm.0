Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1151890ejb;
        Thu, 7 Mar 2024 05:49:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9w4NZ4PSiCc+Xp1Noa/QN0czeHTkQDH2W2wn52e8iuAhIQy7x0s8j+Yz9QJt51iYf8Q2a2/cnJolwvMKDWVD9vdJL2z+u
X-Google-Smtp-Source: AGHT+IE28soYRhMnaUeeoxpteJcvK+qNtixxivNjvOUCZQtE8aZlKuAApLeyTmDPpsusnaj9JIrw
X-Received: by 2002:a05:622a:120a:b0:42e:f8fe:5fde with SMTP id y10-20020a05622a120a00b0042ef8fe5fdemr9046475qtx.13.1709819386557;
        Thu, 07 Mar 2024 05:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709819386; cv=none;
        d=google.com; s=arc-20160816;
        b=Driex0UIO3tlEvpSzaQ94AWlF6ZqN4arrkF/zFelMbIFkvI7mDKR1CzVCp8zrIdvvz
         uTplHnREevmLcjLuGH+8nj9ZBRN47XBIJP/ZZm0W4DUDohWurWJcpyGXkcZ8t4uwWwdA
         365qrz/wYKGivoT36fJezXf8eSxTPfOagm8oKNG7k8iHHbNUtVUX1OPYV7kGWH3FM9rR
         tpznlNYkAvFF8eEokbW0Bh+sBMJuYqSh4E0OoWbwkwhAQHyEyxoVYMYigulPqIPA3Id9
         I3MBoDewGTIiTPxxqvig/g4zlX8j7ldfdT0pwgxkDfdnCf5fuIzyeSjCMOpc+t+T/3b/
         ieFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cyZooDCSfcEkdv9/7vg+GOMr/LkugjJbT4YX/tuXRXs=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=G36wK2T4QdMCFMbeQ7idvdnIwlZ35hISralkdg3lSpXX19fiOknx4pmlguvryD7+ih
         z0vxZfvElSSmwUJhRERd/SXfdruNHyh+QSIDi1oh++Kl4YDjTXpI8AgKOFPk2GtBwKER
         68mfax20D2eMAfWy0t1wB/ork5d5lUDabVQM4qnHNIo14bR/XX27mfrjsm8pV5HlwoSw
         GpjyR5hVdP9+49frR0cJHcVZ2O0ePvk4yJJBXdwh0Al6e82be3Hpo4HD3f/1tBNr0fTa
         HxBtrXTKx+AFZtE2+QpagpE1RzlEa7aFf+jrmTtRXsR86vTP8dj+uX0DdpsRXIjkZInm
         jeBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZTENNedP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020a05622a041100b0042f17a5ae99si1982213qtx.709.2024.03.07.05.49.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2024 05:49:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZTENNedP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1riE7F-0006m8-Lj; Thu, 07 Mar 2024 08:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE4H-00057d-V2
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 08:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE3m-0007G2-5e
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 08:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709819114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyZooDCSfcEkdv9/7vg+GOMr/LkugjJbT4YX/tuXRXs=;
 b=ZTENNedP0cxdrZtqzyVp21ocE8cxGsz0G0qnZUPlLgZf7uWjn6uHRrGMYMJ7N7oZLghcNS
 +zhSZNHSlZ11DWp/GVvBbpcpcqYDXFGKlDKdKoRQznMNd4pW9+MQ4zW5mYuskJ4QZxVcvr
 X/6jlm6Sh2jJCpT/ICIdtp4Y8UT7xqI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-59MbehsMP5GZ5I9H-EObkw-1; Thu,
 07 Mar 2024 08:45:11 -0500
X-MC-Unique: 59MbehsMP5GZ5I9H-EObkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6D2A3C0EAA3;
 Thu,  7 Mar 2024 13:45:10 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BC1E17AA5;
 Thu,  7 Mar 2024 13:45:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v8 5/9] virtio-iommu: Trace domain range limits as unsigned int
Date: Thu,  7 Mar 2024 14:43:06 +0100
Message-ID: <20240307134445.92296-6-eric.auger@redhat.com>
In-Reply-To: <20240307134445.92296-1-eric.auger@redhat.com>
References: <20240307134445.92296-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.583,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: vF98Crm6FqTW

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

