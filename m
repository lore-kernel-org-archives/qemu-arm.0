Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3940067lfm;
        Tue, 23 Jun 2020 02:36:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdRKJCvct0f9mxw0EjWAdu1sunENthN3GarxtvGvpw7NCStc/A+flpRYIkvjXQlCPfEX0h
X-Received: by 2002:a25:d753:: with SMTP id o80mr33231801ybg.423.1592904967831;
        Tue, 23 Jun 2020 02:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592904967; cv=none;
        d=google.com; s=arc-20160816;
        b=HuPf/7ATAjCAV7Jgi5sRdKTndYXsEncQYG9xjm0qrUV+hyyMIScIUrbhQqR1mNR2P9
         y76OQ1ML3J8dEpamcmwQkwwrV9WryL/x9wjvbxg7ha/5fhAznHATG/5eqZGrc4JEE6uL
         HVOt/JVTqHe60ES0s+11j8BX+9/wh6QwDBq8fjbPye+QbbQopeIHgfGmoqXcRurXUeKn
         Rz/Mc8COVLZfIDk5TzraJ3rtudUG8n9EPSQ8V2OfLcMKFKH1yw21YEsgUXw+IfQtPBug
         jBHweuN75PmxBgl/LnV8UZ3fimVk9Cae0MQCqSOXkOC4G4sP8XoN2xh2gK/AP1lLDHRh
         XztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0xuyIauuoPrh72o/rX2s/HE00+PKmuKbiuFEJaL2zig=;
        b=HcTzW9VxAat8GL+7wK8Pu5c21KUJVQXtHzTMQzs28KpbhUw+NS/kfkDAHB2NEVnXuj
         Ar58UoTt/iJ07d/PYhXGbiMQ2IEIEIFM98xYqboyuLTteuDC47Uyx7Ym6HL3gG+z1gUX
         ahRRAlmmuPplMxLFqBFaTV7whDeidSipBMdV1qQt53Rj+Yh6oERRgTdEOKCbVPDLnj8+
         UlL6t9vt8OLb3BxkkUM7jC80jEdOIkWQoXYoJxkQu7k3MgvMOFUTpXAbD/314tF/5ab1
         HAiOl1Uzpw4Vez+v3wRzYsTaTPoYH+NN52GrT5aEcefyun41JOf9/1iTWFnkpwTK1X16
         4BHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xf9preIm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l124si16617444ybb.154.2020.06.23.02.36.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 02:36:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xf9preIm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnfLb-0007ar-6A
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 05:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnfIw-0002v2-SU
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 05:33:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22704
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnfIt-0001XK-RO
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 05:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592904799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0xuyIauuoPrh72o/rX2s/HE00+PKmuKbiuFEJaL2zig=;
 b=Xf9preImrkSL+KzYjPENTEvj0Zwg7VriNQE9uKZNjSQGMBVSwaiOpHRD54FRBzF8Z4j4NJ
 5ZoYpilSWqFD7SpanGWCsCgq1eB84Kn+Ok+npyDAwwR7PXVK/WvP04w6xKQ8muZ5iBh9JE
 Xpi/1bjOiVwumR4NyOZVAQAXf+xnviI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-r52wq-HmPYu9cWnZxvaxCA-1; Tue, 23 Jun 2020 05:33:17 -0400
X-MC-Unique: r52wq-HmPYu9cWnZxvaxCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 708C18005AD;
 Tue, 23 Jun 2020 09:33:16 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3F3C19930;
 Tue, 23 Jun 2020 09:33:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com
Subject: [PATCH v4 3/5] virtio-iommu: Handle reserved regions in the
 translation process
Date: Tue, 23 Jun 2020 11:32:42 +0200
Message-Id: <20200623093244.24931-4-eric.auger@redhat.com>
In-Reply-To: <20200623093244.24931-1-eric.auger@redhat.com>
References: <20200623093244.24931-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: wve0b/leFVil

When translating an address we need to check if it belongs to
a reserved virtual address range. If it does, there are 2 cases:

- it belongs to a RESERVED region: the guest should neither use
  this address in a MAP not instruct the end-point to DMA on
  them. We report an error

- It belongs to an MSI region: we bypass the translation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---

v1 -> v2:
- use addr when testing addr belongs to the reserved region
  and use a block local variable
---
 hw/virtio/virtio-iommu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 5e72fd53a1..4a50e24d21 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -603,6 +603,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     uint32_t sid, flags;
     bool bypass_allowed;
     bool found;
+    int i;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -636,6 +637,25 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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

