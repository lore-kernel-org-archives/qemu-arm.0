Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1569541njb;
        Thu, 6 Feb 2025 06:24:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVly7Q58srNelVNylIhEICiXrq+0/sW6quZMyhgRYZxwPnYsp3ZJfgh2QqKREkZzQlMvyaandni8RgJ8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IERnuoyyLwJKTufwWgATMSlyWGJTsE2MmarRKNKD4BW41o/rLKQpnxhVTyztrM7xa2lrr4h
X-Received: by 2002:a05:620a:294e:b0:7b6:cb81:95d with SMTP id af79cd13be357-7c039f983cemr1016252785a.21.1738851851486;
        Thu, 06 Feb 2025 06:24:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738851851; cv=none;
        d=google.com; s=arc-20240605;
        b=lVCumgjx5M8lCxFKbx+qlb8KkW0qi5f67PicOSespb/zrl4ONqY+mPnRWbP93CO6Rz
         O9yecUEKERd3GTqR4kIiXIXQQQhElHA/0lL9bagIOdQyuVm17iXu5/X4zWWUpt2RdCxC
         Tf3BmKb2Pqii7kN8Du0f848r4oC4hXh8RhbAPxCcwDZY7mJHpP+xJxN3MXmz1Zu4Ko82
         /WagaODqO1ildHO8a3QZlW4RizXFSFWMiDec7Yn+2W724oHrZJp1gr3Cow0GNroESF9P
         tgZs3Q2kTBjjrZBQpPatyVE49V2Uy0YdG4pje88ef9HhKxOQxj1l9Yw5EhMa6MZ8IsHB
         ffBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OwJOgKMx0mCJNKFJZr/JfU+XCS/7nyr6ABOgYudzD2Q=;
        fh=swiL4bERDBgIQIiNoTOu/2bBoUECE5mFI7R2Xc6Vuzs=;
        b=HhbiaGZDYGgXyzTFflCh3MGSwUabDBLvqMyRGX169+LUFMGlaB8b8iT4IBIT8ERcsm
         K+ga1ZRaOvUCKQFE0KsOBfZPW8hxkpEPyZNRuyMKy1ZTI7wIN8FafjfB0kWzKVk/t8HB
         Hh0YBQo5oC9FV6UdFHZ9FzMffniyAMUeCVxPiNvr2Lv6DK3x+D5ZQAJ6bJ/llpAofP8i
         QoZ7fvQbZR/0u5JB8URYqFtKX9zJjsiETa2NqTFL+JZeg+iw4aZphuf2PHUTyY+BdEqG
         r5Gk1CMqck59lzJRGIB42uASwrW7XQUl/fK03Odfkwggd3i4O8ewCDPiBztxBfLnXVRM
         4Y0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P+7l+85v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e95b87si118325485a.203.2025.02.06.06.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 06:24:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P+7l+85v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg2nJ-0002Jm-QC; Thu, 06 Feb 2025 09:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tg2nI-0002JN-DT
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 09:23:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tg2nH-0006tU-06
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 09:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738851830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwJOgKMx0mCJNKFJZr/JfU+XCS/7nyr6ABOgYudzD2Q=;
 b=P+7l+85v78Jgae6GUkxFiO7zBIWSEfQ2jAazIxId+dhWvrfSum96QErURQIujSai7HUhX+
 +fq1Ky0XnTukVpV7vQAf3qWAL+2Pda2RMYydTHLzqA4MearGr/Hbky8k0IiAdLJ5lK9rZJ
 4PK3XdGjmSi0WhSwSrV9zm3Q3UWM64U=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-120-xMTwQ4UhNNaW5LsjFzlxww-1; Thu,
 06 Feb 2025 09:23:47 -0500
X-MC-Unique: xMTwQ4UhNNaW5LsjFzlxww-1
X-Mimecast-MFC-AGG-ID: xMTwQ4UhNNaW5LsjFzlxww
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E5DD5195608C; Thu,  6 Feb 2025 14:23:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.9])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A929A1800570; Thu,  6 Feb 2025 14:23:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: [PATCH 5/5] hw/vfio/common: Add a trace point in vfio_reset_handler
Date: Thu,  6 Feb 2025 15:21:56 +0100
Message-ID: <20250206142307.921070-6-eric.auger@redhat.com>
In-Reply-To: <20250206142307.921070-1-eric.auger@redhat.com>
References: <20250206142307.921070-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7VNdxcH33VBw

To ease the debug of reset sequence, let's add a trace point
in vfio_reset_handler()

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c     | 1 +
 hw/vfio/trace-events | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f7499a9b74..173fb3a997 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1386,6 +1386,7 @@ void vfio_reset_handler(void *opaque)
 {
     VFIODevice *vbasedev;
 
+    trace_vfio_reset_handler();
     QLIST_FOREACH(vbasedev, &vfio_device_list, global_next) {
         if (vbasedev->dev->realized) {
             vbasedev->ops->vfio_compute_needs_reset(vbasedev);
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index cab1cf1de0..c5385e1a4f 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -120,6 +120,7 @@ vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype
 vfio_legacy_dma_unmap_overflow_workaround(void) ""
 vfio_get_dirty_bitmap(uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start, uint64_t dirty_pages) "iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64" dirty_pages=%"PRIu64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
+vfio_reset_handler(void) ""
 
 # platform.c
 vfio_platform_realize(char *name, char *compat) "vfio device %s, compat = %s"
-- 
2.47.1

