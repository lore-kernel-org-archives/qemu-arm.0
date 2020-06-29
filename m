Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2730023lfm;
        Mon, 29 Jun 2020 00:05:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/11I/8LFunDZxkJiAdxluZ/SeebgjlxGt2jLxNg2IDgdOYfukn9U/odZHbM83dshep7o9
X-Received: by 2002:a25:eb05:: with SMTP id d5mr23252181ybs.12.1593414324920;
        Mon, 29 Jun 2020 00:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593414324; cv=none;
        d=google.com; s=arc-20160816;
        b=rX3IKb9FHNSa4TAof7zn4jhm/sRvxCJz3538TycgUp2TYHoYv4/B8ahu2H+lMNiFKy
         4Ox/NRU2OlVvLSGdxdkwl+rk+N83grtKpSmtqz8Ap2PA4q9mya7DIfomXi+xK0h4tJi7
         UzBaoiO8n47Tqpv2YCyhCY4FUW1KHtIIIwdxJHwDnkLhNoZ/VvRBHUe1f/nHl5qKOQCT
         QZpl6X0+AnSWFMTJqXr6a9Ib+THQMYKQ+JPYI4tO9n1H7p5rW+hXhe0U+1ciYQHrK7E4
         RCgRXMnqEEtR/omwVyHpiRk9+d0ZwCXcy3MWgCORgyhV/ylJeU0ulf4wfxXr480vmmSX
         ugIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jSe98R+ToRO1JWfbelSsIl/kZ4qctesqG1jp0l8to4U=;
        b=ONf958m2mXK+AjwNE79NDlaXMxm2xUG4N6ardDG+dCHxAQKgsor8dDCOsNnViC//Ni
         lyk2q91zvtLS3NjqCvRRhXW2kFv2rJFFRFc3UKWVHnyARDCEhcdxWk74qt7SCkJ97DLS
         +BFeITCP8PzX6L0sdoyRT02Bg4mreODfMTJnsYXqYtvkrvg0PWtiRmyuccxQajrPIQDQ
         BK6p0nukZGeYiXJShNQRtpIqiWGppTw6pi6dzVvxVer2WtWX+I9x059UgBuZUHlCZetH
         66CvEwyvWiMKcHZIm9ZbItIozaiazE3g9yKEP9A1mYmzKEc3kei8O5/JTk+M6l/mQu4E
         jqXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fvEFBYux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si12154700ybp.39.2020.06.29.00.05.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 00:05:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fvEFBYux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpnr2-0006Ar-8y
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 03:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jpnqo-000673-PT
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 03:05:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47749
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jpnql-0007vX-LZ
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 03:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593414305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jSe98R+ToRO1JWfbelSsIl/kZ4qctesqG1jp0l8to4U=;
 b=fvEFBYuxB5VENA61Og+7ejhbj7kADEhIr3/b1ASz2wN7QuwyTVzMIi8QKf5DwBgN9ieMZ1
 nHBYPBKBsRvJZp4rDRKkbOzCETrP+zcou5kMaTBa9EB2J1dHD7TlJzeE3Epmd7XvoZmQnf
 NQoonUe5VNZ52e6dqQSIy/QLt46iD6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-t4y9kH1ZOceagA3SmtAi5Q-1; Mon, 29 Jun 2020 03:05:03 -0400
X-MC-Unique: t4y9kH1ZOceagA3SmtAi5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 275AD8AB380;
 Mon, 29 Jun 2020 07:04:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52E909033E;
 Mon, 29 Jun 2020 07:04:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com
Subject: [PATCH v7 3/5] virtio-iommu: Handle reserved regions in the
 translation process
Date: Mon, 29 Jun 2020 09:04:02 +0200
Message-Id: <20200629070404.10969-4-eric.auger@redhat.com>
In-Reply-To: <20200629070404.10969-1-eric.auger@redhat.com>
References: <20200629070404.10969-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:03:51
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
X-TUID: 9itFcdSfGBUc

When translating an address we need to check if it belongs to
a reserved virtual address range. If it does, there are 2 cases:

- it belongs to a RESERVED region: the guest should neither use
  this address in a MAP not instruct the end-point to DMA on
  them. We report an error

- It belongs to an MSI region: we bypass the translation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

---

v1 -> v2:
- use addr when testing addr belongs to the reserved region
  and use a block local variable
---
 hw/virtio/virtio-iommu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 2cdaa1969b..b39e836181 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -607,6 +607,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     uint32_t sid, flags;
     bool bypass_allowed;
     bool found;
+    int i;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -640,6 +641,25 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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

