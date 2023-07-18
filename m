Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp6564821eje;
        Tue, 18 Jul 2023 11:22:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEhiNMcol5Ivzx/UyV360PTsOGlbrip4PdFJU/ccXX3bC9gb+kBTq89AGSNo4LKM2lBgOgA
X-Received: by 2002:a05:6214:29c2:b0:637:707:120 with SMTP id gh2-20020a05621429c200b0063707070120mr11494758qvb.15.1689704542367;
        Tue, 18 Jul 2023 11:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689704542; cv=none;
        d=google.com; s=arc-20160816;
        b=caeJ4eGplLCxtVBfryh8zZHrrBaykG+2j7Nh91WFsKD9aEqui5xzAtp94LcvBqBE38
         vrBQDhUZmWQrPtzxGammQmTnkM/2lzZp5pNl51BFdCkk1bgIaurawDvudiGuP8LnsgBb
         q+2vAXqUXoj+KXtks9/UAVVON3N3l3V2UShkX6MaIQmrRXRjvXRUZPGAh692CzFix83S
         ndMP+ESBYQAEhTQ9AMvs/dcv75XdVfCbTXjNwkEUuEt2+vr/pofFQfqmRu4Q+3/YPawO
         1/Fgddwr755Jmzt8Pf8HJV2LjCx5toP4X1s2iIgrxgb9/BhS+yqLecBsJifxIpzVG+xX
         QEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2qEQaqKyMgIlf0PHl/5VaRa0YHppm9F9uoxUo8qKkCQ=;
        fh=FkCO6MPNNARALThDnl2p7rOyJGiNMYjmxSOYO6HJa5k=;
        b=U5ANvmVakIJNHV5ZpbFxCK8KC0gFIrhuf24goe0uO4iNhI8bwlNjdkfeSQG+ivgToM
         V/l/GmCOWcEVQb9rT2kRCT/K35nlR3TOndLadCZQKLxHxt7pyradI6PIiIakVasgcKvd
         h71mIYOIU9SqxF8rfh/tXAz+Jj/dvaBnBLF4HDbVYwAk9zY7jCiWnNirN4FFIP27HscY
         IyDfp8GLKGO6fdTimsIu1ItqkrEbqggSARXwiiDfDJ7XbAtc8NymgVYetvM3zKLGavq3
         dfiswcn9O4tSS8dd6UCeEfEhlw93UQhXOwsMQ5MB3jOKKljB9e624qvTs1J+5hoczO1P
         VucA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZDH6fViP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020a0cd651000000b005df47f81d70si1623608qvj.234.2023.07.18.11.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jul 2023 11:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZDH6fViP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qLpKh-00029S-28; Tue, 18 Jul 2023 14:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qLpKf-00028n-1h
 for qemu-devel@nongnu.org; Tue, 18 Jul 2023 14:21:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qLpKd-0005PU-5o
 for qemu-devel@nongnu.org; Tue, 18 Jul 2023 14:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689704514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2qEQaqKyMgIlf0PHl/5VaRa0YHppm9F9uoxUo8qKkCQ=;
 b=ZDH6fViPduVpKyLtvFLP+0o4sBts8bBoYCDIAQOsIt2QxHnt7NsOe3qCQLBMz3lvqQagNH
 uowF31A/wl+f6u/U9XwBSwzbqNEQspsaCX6MtMBXDHzyc2SzptTipIATU00Ihh6Xi0YzQ/
 xgDfX+R/u4pEKx3mhCPqLEejqeVzqcU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-d4L5UnhBPcq3m9Kesdsf3w-1; Tue, 18 Jul 2023 14:21:47 -0400
X-MC-Unique: d4L5UnhBPcq3m9Kesdsf3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0F9C82C8C9;
 Tue, 18 Jul 2023 18:21:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2231F2166B25;
 Tue, 18 Jul 2023 18:21:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org
Cc: peter.maydell@linaro.org
Subject: [PATCH for-8.1] virtio-iommu: Standardize granule extraction and
 formatting
Date: Tue, 18 Jul 2023 20:21:36 +0200
Message-Id: <20230718182136.40096-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: bgMdlKXFvfAB

At several locations we compute the granule from the config
page_size_mask using ctz() and then format it in traces using
BIT(). As the page_size_mask is 64b we should use ctz64 and
BIT_ULL() for formatting. We failed to be consistent.

Note the page_size_mask is garanteed to be non null. The spec
mandates the device to set at least one bit, so ctz64 cannot
return 64. This is garanteed by the fact the device
initializes the page_size_mask to qemu_target_page_mask()
and then the page_size_mask is further constrained by
virtio_iommu_set_page_size_mask() callback which can't
result in a new mask being null. So if Coverity complains
round those ctz64/BIT_ULL with CID 1517772 this is a false
positive

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes: 94df5b2180 ("virtio-iommu: Fix 64kB host page size VFIO device assignment")
---
 hw/virtio/virtio-iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 201127c488..c6ee4d7a3c 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -852,17 +852,19 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     VirtIOIOMMUEndpoint *ep;
     uint32_t sid, flags;
     bool bypass_allowed;
+    int granule;
     bool found;
     int i;
 
     interval.low = addr;
     interval.high = addr + 1;
+    granule = ctz64(s->config.page_size_mask);
 
     IOMMUTLBEntry entry = {
         .target_as = &address_space_memory,
         .iova = addr,
         .translated_addr = addr,
-        .addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1,
+        .addr_mask = BIT_ULL(granule) - 1,
         .perm = IOMMU_NONE,
     };
 
@@ -1115,7 +1117,7 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
     if (s->granule_frozen) {
         int cur_granule = ctz64(cur_mask);
 
-        if (!(BIT(cur_granule) & new_mask)) {
+        if (!(BIT_ULL(cur_granule) & new_mask)) {
             error_setg(errp, "virtio-iommu %s does not support frozen granule 0x%llx",
                        mr->parent_obj.name, BIT_ULL(cur_granule));
             return -1;
@@ -1161,7 +1163,7 @@ static void virtio_iommu_freeze_granule(Notifier *notifier, void *data)
     }
     s->granule_frozen = true;
     granule = ctz64(s->config.page_size_mask);
-    trace_virtio_iommu_freeze_granule(BIT(granule));
+    trace_virtio_iommu_freeze_granule(BIT_ULL(granule));
 }
 
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
-- 
2.38.1

