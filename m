Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1537673ejf;
        Wed, 17 Jan 2024 05:21:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSbOcTGJ+18D8FZEKhTfQDoof6gMOz15fozHA5g9BQhBDR8PuuEa8hp826k3JelkMIpXYf
X-Received: by 2002:a05:620a:3908:b0:783:24cc:e5a6 with SMTP id qr8-20020a05620a390800b0078324cce5a6mr12650834qkn.13.1705497690101;
        Wed, 17 Jan 2024 05:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705497690; cv=none;
        d=google.com; s=arc-20160816;
        b=ySNByJJpCNoIK4crkBNSYMmC6Eqk0PdTHIwETBfRUS6F+hXaTqnWg1LCW6J7J5lXcY
         7Nq+ky1HTJSBaCDbBylNkfbsVNtiPNMMAVHMhrrkKWqxbW3VYPF5zg5nfAqWVynaIXJa
         Ww/29NjK6PvaxRzROzhWDgbAD+kMD7uqPAeqip8B2cNazvLdzKWxORcciquWux9wSC4J
         AyNtSV4GhrjMY65m8r55kFGhbGNqFVOONAmgy3WHrk8vfgvv6vRcRp+XjpeNcaUxQfqD
         dB7s7Ozbvs/P5alNB8pngUgAhulnN3VuzboDTrYEPFEXolGaWYNUtnbs/xM3AAskAk5q
         MP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=NtRT0Yzo6YwG0ccDFigluvmKcfKoE9D5HXNZ9yiCCcc=;
        fh=/K+FsUxHNbAGi4yd41j/9wB/oHfdP7kWqJ4SMuYB2/Q=;
        b=An4kvl8/v1zhcxhYHx1kfVhZf0gyO3TmPPdkHv13wE4Tf/S3viAvsutJ6tdpJD5V3c
         oyRFPt2GNSwbgnj1pizsW4TGnsGvVB+tf806Ele4pI0q7e8pEX0FM73u4bJ/vO+O9G6a
         vYXu0JI3djrMyeTw4UGclYURb72jcupZLlWRH2J7rC7NmDLG9wpQ63VJqSRRJxtWG7Gs
         BmYOEh4OSYF7ou6sUTOQJU/HodOcUp/TsXO9Qh8g0gvO8BY+SphMJQiS4O2Yr7iG+F2Q
         1pFr4A5VJjOY9adsqb7QX1+ebkGm39wuRg2GhLwJfM3e2MBnsUwUpCXl75PWajhyqgHk
         kBfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HEwuDBWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26-20020a05620a269a00b007815f7168e6si12756750qkp.35.2024.01.17.05.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jan 2024 05:21:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HEwuDBWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQ5qj-0004Kt-O6; Wed, 17 Jan 2024 08:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ5qd-0004Jr-HT
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 08:20:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ5qb-0001Y1-BN
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 08:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705497647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NtRT0Yzo6YwG0ccDFigluvmKcfKoE9D5HXNZ9yiCCcc=;
 b=HEwuDBWTvar/6B/xGZ1ff2OSAOTbaeQ5mC2xR8gTV5Kfa8Eg0antsxXVCWN0v6YhfTfYN5
 or7bu0sIydAfEFiuGZvOgaxA4lTkek0ls348fI/GOS/d4nm6j1L9KqjDf/u/JwlcyLUunN
 W9wBfJdTnZ/sY5Cc0jLAV9DoUCkeTZU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-4GQLgHYENGS-4uLRlR-Vgw-1; Wed, 17 Jan 2024 08:20:44 -0500
X-MC-Unique: 4GQLgHYENGS-4uLRlR-Vgw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5EC610AFD62;
 Wed, 17 Jan 2024 13:20:43 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB1AF40C6EB9;
 Wed, 17 Jan 2024 13:20:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 mst@redhat.com, clg@redhat.com, peter.maydell@linaro.org
Subject: [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
Date: Wed, 17 Jan 2024 14:20:39 +0100
Message-ID: <20240117132039.332273-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
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
X-TUID: rpSZelJfdYg6

We used to set default page_size_mask to qemu_target_page_mask() but
with VFIO assignment it makes more sense to use the actual host page mask
instead.

So from now on qemu_real_host_page_mask() will be used as a default.
To be able to migrate older code, we increase the vmstat version_id
to 3 and if an older incoming v2 stream is detected we set the previous
default value.

The new default is well adapted to configs where host and guest have
the same page size. This allows to fix hotplugging VFIO devices on a
64kB guest and a 64kB host. This test case has been failing before
and even crashing qemu with hw_error("vfio: DMA mapping failed,
unable to continue") in VFIO common). Indeed the hot-attached VFIO
device would call memory_region_iommu_set_page_size_mask with 64kB
mask whereas after the granule was frozen to 4kB on machine init done.
Now this works. However the new default will prevent 4kB guest on
64kB host because the granule will be set to 64kB which would be
larger than the guest page size. In that situation, the virtio-iommu
driver fails on viommu_domain_finalise() with
"granule 0x10000 larger than system page size 0x1000".

The current limitation of global granule in the virtio-iommu
should be removed and turned into per domain granule. But
until we get this upgraded, this new default is probably
better because I don't think anyone is currently interested in
running a 4kB page size guest with virtio-iommu on a 64kB host.
However supporting 64kB guest on 64kB host with virtio-iommu and
VFIO looks a more important feature.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---

v1 -> v2:
- fixed 2 typos in the commit msg and added Jean's R-b and T-b
---
 hw/virtio/virtio-iommu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 8a4bd933c6..ec2ba11d1d 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1313,7 +1313,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
      * in vfio realize
      */
     s->config.bypass = s->boot_bypass;
-    s->config.page_size_mask = qemu_target_page_mask();
+    s->config.page_size_mask = qemu_real_host_page_mask();
     s->config.input_range.end = UINT64_MAX;
     s->config.domain_range.end = UINT32_MAX;
     s->config.probe_size = VIOMMU_PROBE_SIZE;
@@ -1491,13 +1491,16 @@ static int iommu_post_load(void *opaque, int version_id)
      * still correct.
      */
     virtio_iommu_switch_address_space_all(s);
+    if (version_id <= 2) {
+        s->config.page_size_mask = qemu_target_page_mask();
+    }
     return 0;
 }
 
 static const VMStateDescription vmstate_virtio_iommu_device = {
     .name = "virtio-iommu-device",
     .minimum_version_id = 2,
-    .version_id = 2,
+    .version_id = 3,
     .post_load = iommu_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 2,
-- 
2.41.0

