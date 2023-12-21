Received: by 2002:a17:907:78c2:b0:a23:4dac:818 with SMTP id kv2csp203627ejc;
        Thu, 21 Dec 2023 05:45:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlL7D7SD6mATCPlnDiDnTZNYbJc4l6P+a5RMGfOzqcCF1prpCdg1YIhrYNhU/b305WWiZj
X-Received: by 2002:ac8:5846:0:b0:425:4a4f:4fd4 with SMTP id h6-20020ac85846000000b004254a4f4fd4mr1057513qth.44.1703166347613;
        Thu, 21 Dec 2023 05:45:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703166347; cv=none;
        d=google.com; s=arc-20160816;
        b=spB9wUQ4fa9q7GSdfoVYOBxY3qQ4FwUVNMj3a6df+C0FKf8f4dxho/JtNhin6DoCjz
         gD5uFL0OeUeUyPjuReVaFwlWhjSsTn0qKvF6DQbuRJpePskdYNkRTMqxxSR/GIwnXq54
         6BKGknHYoyuByM76yUdvIQ+8Of3og7qZTtkGgpe8jsEcvfl8uDbc70nrazQbzIb281NY
         qlg3HkuiGglDh9ZYgSkOSFEgfINwXLC1WV2paaJAn2yxP6fm2zxsa/sX/UR71VwapALm
         O+L7mGT3IuVc0C1L5qfzA+CLNuPWUSisj4zszRFYku98jCgno8GQ1HSpFMYBAkUNKL7A
         cAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=JEcE8EVRSkjDCsOnpmCh8P7aPJDqjwjz81BgQ6KJPlA=;
        fh=WYzFa20C8qCdPLTFd21aEsJ0LZadJK9ScQ1AmlpFHz8=;
        b=IqH/4Peb7yvQW7i8FP4D+K3yCh9PWOcOSsRojfGE2nCXEvlHaulVpXlV1F7a/BDRxn
         9gC5tMac4zZSCYlijpPxgDSvdoTQp6UwLXSZGbPL2JEJqSydn7157UCChbjrqYTwEMVd
         9h2z6obYUgLQ/BqXNrYEtX66mwwMy7RymFV3yyUa/TP2tJZsNGIQKxtd9jWUdfNV27Ti
         P8jE61i5lmyOjil6MCDt2ZegF+rNv36jwL3eLHDu1GAdqAPiRTuPHkrCpiWHI4Y8WY7q
         URD5yLikc5tux6irnYgVyWOAg+2aAwNxUpg7xPdXn1pKEcY56me8uIluowD6XAUEHYj3
         ji+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cU4sdsUn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020ac85c11000000b00423aa319fc4si2175159qti.236.2023.12.21.05.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Dec 2023 05:45:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cU4sdsUn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rGJMe-0006W4-Ro; Thu, 21 Dec 2023 08:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rGJMX-0006VN-3d
 for qemu-devel@nongnu.org; Thu, 21 Dec 2023 08:45:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rGJMV-0007jE-F5
 for qemu-devel@nongnu.org; Thu, 21 Dec 2023 08:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703166318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JEcE8EVRSkjDCsOnpmCh8P7aPJDqjwjz81BgQ6KJPlA=;
 b=cU4sdsUnph+ESvTUdeLLtxMxIDdzl/j1QwMRuAKvGDIlhFxv5b/l08BC6Os3wL+AecOLwe
 MndGBYsiBgIHllG7p8C7j4KfcQ0jWdj54lN9B7bf9VEq5nbXD/JC0jc9JTjj0iiAWoxFqc
 OntRix38u1PBOof/i02Yfpo/UbnOHLM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-172-X4RVILjWOD6etaGeVpAgZQ-1; Thu,
 21 Dec 2023 08:45:15 -0500
X-MC-Unique: X4RVILjWOD6etaGeVpAgZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6D423C29A6F;
 Thu, 21 Dec 2023 13:45:14 +0000 (UTC)
Received: from virtlab-arm04.virt.lab.eng.bos.redhat.com
 (virtlab-arm04.virt.lab.eng.bos.redhat.com [10.19.152.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AB68C15A0C;
 Thu, 21 Dec 2023 13:45:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, peter.maydell@linaro.org,
 mst@redhat.com
Cc: clg@redhat.com,
	alex.williamson@redhat.com
Subject: [PATCH] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
Date: Thu, 21 Dec 2023 08:45:05 -0500
Message-Id: <20231221134505.100916-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.061,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: UiofH3bXUsyz

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
driver fails the viommu_domain_finalise() with
"granule 0x10000 larger than system page zie 0x1000".

The current limitation of global granule in the virtio-iommu
should be removed and turned into per domain granule. But
until we get this upgraded, this new default is probably
better because I don't think anyone is currently interested in
running a 4kB page size guest with virtio-iommu on a 64kB host.
However supporting 64kB guest on 64kB host with virtio-iommu and
VFIO looks a more important feature.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 9d463efc52..b77e3644ea 100644
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
     .fields = (VMStateField[]) {
         VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 2,
-- 
2.27.0

