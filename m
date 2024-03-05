Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp29698ejb;
        Tue, 5 Mar 2024 10:09:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcE9FbssjY+67L5jV9Ni/Ul2HXCK4vZ7RcXQzdI2JpjpIv3mWH991Ua1Gqeplm4/kgWR1b48ixxmhAU4QVsVp5W8ID7qGL
X-Google-Smtp-Source: AGHT+IH5aA0sNnTqbcdtFlYvoO1PbeH5OsKzdLBAO1w75l1ODic6latUCwAZlmhbTO1r/sy+Biix
X-Received: by 2002:a05:620a:4cb:b0:788:2f8f:1163 with SMTP id 11-20020a05620a04cb00b007882f8f1163mr2720695qks.12.1709662164456;
        Tue, 05 Mar 2024 10:09:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709662164; cv=none;
        d=google.com; s=arc-20160816;
        b=0HsCRw8jSCAlOn7S9VNh6Gq3Doilgcp/W1FlK8vVVmZfAICPyNmejvI6TgkHUnuDzG
         V5d3vVK1dWNZU61hG3c4sDZXUuwsb7Qb/ysEhygONxvsQYJM4Rm1lv5f5cqZv+n3Ym2W
         btNcFIDUqtjpxY8DFsSeEyjQU+qDSTMBJ7MZ/zLc3xH7YNq9aBoOnwfL/KBE/1bXCrJD
         Ftx8l8L4vX9cacQEAzqocFmOg4+NDFn3CBFA2KANPFH5XA5DIjMA/nrKwRbWbB81hXaH
         hAKob7btumCm0CI4RdjdQLcMl5p1eEmHtdGr0lpL71fEQAkbNhjrLWP0vzKQjt0xG1le
         O+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cyZooDCSfcEkdv9/7vg+GOMr/LkugjJbT4YX/tuXRXs=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=qSUn9YbK03A9Z1irGUSux/JbNi/RALykpBbV0ZS4x2omP2OLRlioMF3apbVdCRDcCI
         KpZULUfPCRniGq2R7y6/VshGkCdYa5faitNqVzl4kyBGn0+KtQ5bnoo4rPY0DpPKDGkW
         Q/vpOl1UbwnSgayvNdItj3bXUaXjt4nw1FT0/4IPyraS76hKDmgNkkh+WNhRLIh8AodP
         6Jf2uPFm3Nqe507BwReR1I2tNXItnLAW2kecZLRJG2MH+x0jjPcX4dDJ7wumUZiNmPMM
         un0cTUm1Zr6sV/KyMtL5zVxsBBMC46Xk9yCFJgwQpC0kAaL5EGyQFJq3pGG1GktqVYde
         NSvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VOC9kl7K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020a05620a404900b0078823b0fd0esi6897378qko.203.2024.03.05.10.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 10:09:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VOC9kl7K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhZCy-0001wP-Bi; Tue, 05 Mar 2024 13:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhZCw-0001vt-Il
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 13:08:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhZCv-0008WL-43
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 13:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709662083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyZooDCSfcEkdv9/7vg+GOMr/LkugjJbT4YX/tuXRXs=;
 b=VOC9kl7KLxhEgHO3mBbXUjVJtOQbcH81lSYuPU71CGApSGHUJRh9FHxHVvXI0ceDJG5Vm6
 WhcSVNcNn/1BgXdE5AJk/HnhcMo45u6MEZUJh9ZfBYvcZ/YPJbyeXbyYotQTxC6SnSxAwP
 qeBton2MHQzQbOwldzAvpB52ZXoz5wk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-64-DHunta95NMqFBozqg2-LnA-1; Tue,
 05 Mar 2024 13:08:00 -0500
X-MC-Unique: DHunta95NMqFBozqg2-LnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB511380673C;
 Tue,  5 Mar 2024 18:07:59 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC5B7C041F1;
 Tue,  5 Mar 2024 18:07:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v6 5/9] virtio-iommu: Trace domain range limits as unsigned int
Date: Tue,  5 Mar 2024 19:06:23 +0100
Message-ID: <20240305180734.48515-6-eric.auger@redhat.com>
In-Reply-To: <20240305180734.48515-1-eric.auger@redhat.com>
References: <20240305180734.48515-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ls5s1bW/Cu6d

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

