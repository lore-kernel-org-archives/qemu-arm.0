Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1526440lfc;
        Thu, 11 Jun 2020 08:21:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSiHJ+sekKoy+bPMjV2HxThBcQ7WrJRI3oaHvEDlYa3hVeUsOCe3XzQCv7SwAGw/9t6ReQ
X-Received: by 2002:a25:afcd:: with SMTP id d13mr14201663ybj.413.1591888912691;
        Thu, 11 Jun 2020 08:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591888912; cv=none;
        d=google.com; s=arc-20160816;
        b=OQt0U/BKxtlTWZsp6d1DYn1uBkHx8c172AjpDXryXAVec07MZK5Az4LzpsIVJiKYj7
         peCxbWpOmacWaNJyWMHjMifCJT/UCKpgXkDgMSRh/zwPySHLWLSbA+huwGQfSbORwMUA
         PHnT2wzIvOHPI+jmMc7wCc5tym28yE8BPNdHoYmhomJk0Dudt0ZxoWlQKpR8abS4p/Ct
         PGr5KC+fWnTj0VWQ549tGtUWn4JJq0yKDom0GW7Rwn+6wRY9+DYlWvcCbAqf5RWWpYIr
         UU9cZJs6P14Rgn/h6U/JiCwcXtTIltsKRaSWMzPmHmGvv8FhAe0zKqhCZfhqRn/QDJNk
         4Trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Szx7mFHhdUv+8B7blyxvd05ss7JydUiFKHj0I95qeOM=;
        b=kwcdmvrhlk1UiGC7gRSnyGn7BxeqctGydPO52uCfVUnijyDDY4QTELK5QsZdzO1Lak
         O6Q0ZaxbEzOtarfyZeX6zzQ8gebsgheXtZzQ1t582mLlx32xjZpgY9+VUijky/w0JVV5
         4Gelfk3TT7rgS31ejTUbxoHIsimcP8x2KukD9svCIkNQJHuU9QRoeLIQZ3dxcLhBI54v
         uCKKQmEyFYua8iOG468q5FJNkJPV8j0JN+ItBrOBWeK5eb6AcDaZhzRkBNiTFs4D2hH4
         UUUXsWYUcgCwpaqFlce/d6vVPvbakmhzJHo7DwhQARqxiA0QWzvK1TT13azbSSJ0n+rH
         AkDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U3BA4Mzq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si2596894ybl.92.2020.06.11.08.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 08:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U3BA4Mzq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjP1b-0005x7-QC
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 11:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjOsj-0004gc-Kl
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 11:12:41 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52792
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjOsg-0003Tt-S5
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 11:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591888355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Szx7mFHhdUv+8B7blyxvd05ss7JydUiFKHj0I95qeOM=;
 b=U3BA4MzqqGI5RvrgAVcwZAlpya9WjV5o/MO+7OPXe5blaASk6b35FcnpW3pFbHo+csXrBq
 ntna0z1RhK5PvMkZayPpb4h/7+cm3Zti2zeAvpr07exL8N4QVR8nfMNjtw6d4RCXCOZVpk
 Oz/INqh6jric3RnOKzjDwASru7z4AH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-MaC6aQJiN5qnnWVroscO7A-1; Thu, 11 Jun 2020 11:12:34 -0400
X-MC-Unique: MaC6aQJiN5qnnWVroscO7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE2A0835B43;
 Thu, 11 Jun 2020 15:12:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E51948FF81;
 Thu, 11 Jun 2020 15:12:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com
Subject: [PATCH v3 3/5] virtio-iommu: Handle reserved regions in the
 translation process
Date: Thu, 11 Jun 2020 17:12:07 +0200
Message-Id: <20200611151209.22547-4-eric.auger@redhat.com>
In-Reply-To: <20200611151209.22547-1-eric.auger@redhat.com>
References: <20200611151209.22547-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RNLfH1cGjZh8

When translating an address we need to check if it belongs to
a reserved virtual address range. If it does, there are 2 cases:

- it belongs to a RESERVED region: the guest should neither use
  this address in a MAP not instruct the end-point to DMA on
  them. We report an error

- It belongs to an MSI region: we bypass the translation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>

---

v1 -> v2:
- use addr when testing addr belongs to the reserved region
  and use a block local variable
---
 hw/virtio/virtio-iommu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index be1527c1d6..03535a6a14 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -604,6 +604,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     uint32_t sid, flags;
     bool bypass_allowed;
     bool found;
+    int i;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -637,6 +638,25 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto unlock;
     }
 
+    for (i = 0; i < s->nb_reserved_regions; i++) {
+        ReservedRegion *reg = &s->reserved_regions[i];
+
+        if (addr >= reg->low && addr <= reg->high) {
+            switch (reg->type) {
+            case VIRTIO_IOMMU_RESV_MEM_T_MSI:
+                entry.perm = flag;
+                break;
+            case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:
+            default:
+                virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                          VIRTIO_IOMMU_FAULT_F_ADDRESS,
+                                          sid, addr);
+                break;
+            }
+            goto unlock;
+        }
+    }
+
     if (!ep->domain) {
         if (!bypass_allowed) {
             error_report_once("%s %02x:%02x.%01x not attached to any domain",
-- 
2.20.1

