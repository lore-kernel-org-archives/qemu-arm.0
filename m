Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2797418ejf;
        Tue, 27 Feb 2024 08:58:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVrX/P+1RSjhXKtnVYB2TjbiZSHqKLsH2lDtNRUMHcNqWtfZSEHeQpID3IAJE6/MmbxxT2MCxVgNA12eHFhbK19XZOz2Fnb
X-Google-Smtp-Source: AGHT+IGeZ5fQ2aKQPyq3ofouGPkIsJfsOyu3NB8PmL3wB3MUrcZWPUOaSadKQRg+vWAcAafFhrOg
X-Received: by 2002:a05:620a:2105:b0:787:3aee:32dd with SMTP id l5-20020a05620a210500b007873aee32ddmr2877266qkl.57.1709053128766;
        Tue, 27 Feb 2024 08:58:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709053128; cv=none;
        d=google.com; s=arc-20160816;
        b=w6DGucL0s9Df5P8k0mrJ0AN6KEIaOLdtcITj2cEbNoC+KGcNHW7OAV3qwiNmB2kmIa
         LlhapziRb0h6ND7EuouVhIxdxOxesZLwsgeRwvwulYXdbX/D4rAxbmzoBqs8YeXT1TeI
         gP/LjzkFCe7L+7Vn4g7rYHm7MU+OsfkfbQJCyms3gMPM6fpyHuJCpiL6DTBT7jsBxk2K
         a3gGfhitWTfnt3EWWzpAfKBo/TYho47JTPd/4jDLvfWGgnPUOHrJpUJ06+tyH61hZmjS
         5OrZl9ai74/LxCBtBtx5xnkk0ya5kkuKBx/t7DFYgGHMjiNED/mFk/1FXXDVvCagDRTg
         bKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KTplvI6/gFdX2/UhXfHC90lA0fM8hwlb4jQEj8TJeWM=;
        fh=Qj9XkJT2wrGpuyrK8Cb5JvU0zaa7DXMs4s0kNIoBId8=;
        b=lhRAm01IVcY/qPOEGVlF9dBmMstT1t7avKSW356tclllSKUtdc9cebAi06RRpiKcLH
         9s2Wcq9a02q4t3MDdTVHfB7CaZ99nXMdEHE2fG/2w+hcOFVjALFkzA052KRccjCoLdAu
         kzsphE43L4CNHdW6fFG1N51s6CDIVcCfgVFHVPnrEvy7okobF7iegN9Pgtmp808CADiA
         XqEad+SsLcdTRDVJzYiuRGGzoGgVyBV6oa14THyZIF8aZd08BbECGDGmtpXE/kdHKTob
         e5MC2u9mxeIysUSFQVRpGlDEZ26yxHpnEcFAkR+nkkXicjXWQh1tMnCsETFDOQckOqO6
         hKLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AT8nIjvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4-20020a05620a0ec400b00787d4ed7e28si4225130qkm.545.2024.02.27.08.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 08:58:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AT8nIjvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rf0mG-0005NQ-0z; Tue, 27 Feb 2024 11:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rf0mE-0005MU-CF
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 11:57:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rf0mC-000561-TK
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 11:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709053075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTplvI6/gFdX2/UhXfHC90lA0fM8hwlb4jQEj8TJeWM=;
 b=AT8nIjvZXKveHMEc5+PSIzlvVD4vTbcT1asLIVBwDmK0DzFghLlQyZmtvLOhsuOoxq3vPN
 hjSvNutr83Np/jwlOrpOTstjjUiD9RPxfJP71twgiYKS6Q+cJ968d1hBwKCNWzFeN4K17Q
 mwa8p6Zo91GOvbXnkq9AyGJ0Sy7zDuA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-LJe9LkuhNzeHeTYa9gJSng-1; Tue, 27 Feb 2024 11:57:52 -0500
X-MC-Unique: LJe9LkuhNzeHeTYa9gJSng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC047185A785;
 Tue, 27 Feb 2024 16:57:51 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE88B2166B5D;
 Tue, 27 Feb 2024 16:57:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com, jasowang@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH v6 3/3] virtio-iommu: Change the default granule to the host
 page size
Date: Tue, 27 Feb 2024 17:55:50 +0100
Message-ID: <20240227165730.14099-4-eric.auger@redhat.com>
In-Reply-To: <20240227165730.14099-1-eric.auger@redhat.com>
References: <20240227165730.14099-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: kwcizwoicbvi

We used to set the default granule to 4KB but with VFIO assignment
it makes more sense to use the actual host page size.

Indeed when hotplugging a VFIO device protected by a virtio-iommu
on a 64kB/64kB host/guest config, we current get a qemu crash:

"vfio: DMA mapping failed, unable to continue"

This is due to the hot-attached VFIO device calling
memory_region_iommu_set_page_size_mask() with 64kB granule
whereas the virtio-iommu granule was already frozen to 4KB on
machine init done.

Set the granule property to "host" and introduce a new compat.
The page size mask used before 9.0 was qemu_target_page_mask().
Since the virtio-iommu currently only supports x86_64 and aarch64,
this matched a 4KB granule.

Note that the new default will prevent 4kB guest on 64kB host
because the granule will be set to 64kB which would be larger
than the guest page size. In that situation, the virtio-iommu
driver fails on viommu_domain_finalise() with
"granule 0x10000 larger than system page size 0x1000".

In that case the workaround is to request 4K granule.

The current limitation of global granule in the virtio-iommu
should be removed and turned into per domain granule. But
until we get this upgraded, this new default is probably
better because I don't think anyone is currently interested in
running a 4KB page size guest with virtio-iommu on a 64KB host.
However supporting 64kB guest on 64kB host with virtio-iommu and
VFIO looks a more important feature.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

---

v4 -> v5
- use low case, mandated by the jason qapi
---
 hw/core/machine.c        | 1 +
 hw/virtio/virtio-iommu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 70ac96954c..56f38b6579 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -35,6 +35,7 @@
 
 GlobalProperty hw_compat_8_2[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
+    { TYPE_VIRTIO_IOMMU_PCI, "granule", "4k" },
 };
 const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 33e0520bc8..6831446e29 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1548,7 +1548,7 @@ static Property virtio_iommu_properties[] = {
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
     DEFINE_PROP_GRANULE_MODE("granule", VirtIOIOMMU, granule_mode,
-                             GRANULE_MODE_4K),
+                             GRANULE_MODE_HOST),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

