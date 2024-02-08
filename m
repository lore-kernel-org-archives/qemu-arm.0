Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp2744ejb;
        Thu, 8 Feb 2024 02:12:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2O3N+xKtLqMW9L8t+eVIIxHmG9CDKS4QhKGWTVSvq/tj+10xzp9+vZPOhYGQIK2dt0Xgn
X-Received: by 2002:a05:620a:5587:b0:785:3f31:b660 with SMTP id vq7-20020a05620a558700b007853f31b660mr8080827qkn.16.1707387149197;
        Thu, 08 Feb 2024 02:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707387149; cv=none;
        d=google.com; s=arc-20160816;
        b=FwUI3DSQTaYIMpX3Uy/YSh/nvmj/NaSOtVwGsiWoH0O+Q/2mvJOFya90QmSpadgD4J
         u3BCdU3r6ZNJl6KJd90ZeBlp1hZ+CHB9nSWLnlM9Bv8G8Pv4Rqricf1foKjpHKz4OlXB
         50hP2/fC+ovC4dcEcNYtk8OXt0uXeIlpir2tNbZl6ScRExLwtBofxVil52dCzN13S3HZ
         625DGnrj3/CLRDn4lZaPKFz1NqI50aRNxfILNtuvFqXk8HDrA5rC++yyOVXkvnyZFV2Y
         s4RIelXVK7671AeqbS4+KiaR+GyB+WVdaBuxGIlCQLjgKL509M9RoX/XLP6RRIzrGQ0E
         su3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cyZooDCSfcEkdv9/7vg+GOMr/LkugjJbT4YX/tuXRXs=;
        fh=OB1DeOQxYU6QtTONEciZu+yfVT1TlWDaL8i9G7nAhfc=;
        b=o4MizpCTxcWc4m1qYd9RRbuHwr5kkdnSsFfmAgsLMNRPS7s6m0e/+mQsgaxka7UvpB
         EuED+ixWK47nVZhoLOjKZMNfOu5pZ4+rbfg2u/TiwGau8Lmx2pgMQNMsRtNFghzHW9La
         yFs2ZJRLlg8qzig4ER0Tj7U6sPKuwKcbFi0jm+6RV+EsZ0akS7GYCcShvdJ40+wdmKAZ
         PMew4abQ+9GYYQ9R6+EP6GxSUzM20gYCAFed7SWuJ9JZ00ON0R6CV7LB7weLCURJaqIS
         C3FS/BygkbYysLQmmhVtNiJ34cQx7Z47yrgy9fdpHySZN5pqKBAG/pkE2uzm/gti17kO
         bZhw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bk7yT5Kz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCVbzFqMpfB0UDTrkrm1CqFB3lpkD83ls5DBpoYv81olC3NwkUAHheDGtenEPyPwmbLWqyQwVV3XSBrnykhpbLsLK5NYX+Qo
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vu1-20020a05620a560100b007840499694csi2801647qkn.206.2024.02.08.02.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 02:12:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bk7yT5Kz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY1Ni-0003yO-KG; Thu, 08 Feb 2024 05:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rY1Nh-0003wC-07
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:11:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rY1Nf-0000Rt-7q
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707387102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyZooDCSfcEkdv9/7vg+GOMr/LkugjJbT4YX/tuXRXs=;
 b=bk7yT5Kz1tHvVPN7s5l0NfBFMSM+PkgWa0mz1NmX/PULKzSzWj/L8dHMBn+NY/PUFp/Vll
 Jr0Z9C4cwm/rIlzgHjOJaPj2pfzVVez0xpyrMPe0d0lLzmP3H+9u/e6yMbM8LrZ3gEfT3p
 sRxQ5ZX//hetETC8DYOwq8mHUB5jDcM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-dbEcN7FINUWz14uKv7p4zw-1; Thu,
 08 Feb 2024 05:11:39 -0500
X-MC-Unique: dbEcN7FINUWz14uKv7p4zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2AF42806664;
 Thu,  8 Feb 2024 10:11:38 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 948FDC1EA62;
 Thu,  8 Feb 2024 10:11:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, mst@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v3 2/3] virtio-iommu: Trace domain range limits as unsigned int
Date: Thu,  8 Feb 2024 11:10:18 +0100
Message-ID: <20240208101128.655167-3-eric.auger@redhat.com>
In-Reply-To: <20240208101128.655167-1-eric.auger@redhat.com>
References: <20240208101128.655167-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.106,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3Yq4jP3U87MQ

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

