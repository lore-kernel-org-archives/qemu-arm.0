Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp883747njb;
        Tue, 18 Feb 2025 10:28:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9iaI+vx4Q0tDzNpmJZj6o166Eh32km+U/IeZrShGMgpdgK+XbqXBCqM5OViXEH3m/kt5GBVIybPVqMw==@linaro.org
X-Google-Smtp-Source: AGHT+IEovvSv7jueZmjEbHFLjL4/5f7F3I6SMOqO1kIvaeBCJxiISKx9WtbOyFiYWPzatgOixOa9
X-Received: by 2002:a05:620a:4107:b0:7b1:3c0e:3289 with SMTP id af79cd13be357-7c0b4d97ab4mr128834285a.22.1739903315001;
        Tue, 18 Feb 2025 10:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739903314; cv=none;
        d=google.com; s=arc-20240605;
        b=HxfNR4Gl3yMlMaVH5CCq6Qyl/mq4LdCG9mNhRLC7457aPGuYWKe8/7yD7JgZyLb5ek
         WCDPSycm5yZFVu4+WzU7osBVdBpype4dzPrtuhg1t1xjo7QhaqN6tUPhO6M7mk3hdhMJ
         lg/KJFkvmG162aqoMOkfn+sfTSbpYoiSRxs0cIq2qdxDGqdaTjtFMm2+4cnCSUtwRmA8
         D0HQT9CVWCb37ks2IsdjYEPJqz4CSn8SLSzmaliDEGFdhmlqt3MPZQzzdCMRGEsgcH0P
         1Wm0rjR6edFnVZX6FkLQ+aPO/t4qZcbEJCmLtN/yvaojvQUTD0q2Py21Q1lc7+ffAo2N
         U44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=p+lEhl9xBKtLou/QnYm3DAM1jxeyS7N45z+8I9b4LHE=;
        fh=swiL4bERDBgIQIiNoTOu/2bBoUECE5mFI7R2Xc6Vuzs=;
        b=jwrHyFfZw98Rl1MSNstDL1cm3RbIO/Q8b5ay6c5hRPkegAB+4xD0MsZC8JL8uX1NpG
         G1y5sqCBBCMUjO6xAp45ljX33wMlL5IXoMgXpQ0kIPfPZzOt5OquupYq3qVa7GQgxaT6
         962LhlqYh+QiUEAFh1sEzmhr14Ox4+tF8a+9Gkf2j1Mt241qPcn53c3r6Nn4clsdqujQ
         dXx8ZvoXVWHkp3Uk9nfq0B2M5tZ69FhLIqQ705GB1z0EnV7mHBXeIojXl0M1HOOyxwCL
         NGKe56z1dU98zyAjoOM8AYSnQTkOrdZF7H0emfpglWj1USBS9UqeebIrm2d0zl7I9Ofl
         J0iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a9MR9Sdj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0b07df7afsi133813585a.299.2025.02.18.10.28.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 10:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a9MR9Sdj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkSKU-0006Px-OH; Tue, 18 Feb 2025 13:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tkSKQ-0006Ov-BX
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 13:28:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tkSKO-0008RE-6h
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 13:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739903293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+lEhl9xBKtLou/QnYm3DAM1jxeyS7N45z+8I9b4LHE=;
 b=a9MR9Sdjn4pgAdQDMOMYzp55s4wwQ7hjlu8skf89+KSYGPWMqooU7MDEltOyhmC69JyoP+
 IUjK+OGC+CiMuB3ONjH/tquw6QEAWxBJKLLf0piw2Q/p9oyUbcBorwcNxLICJlnnofljb8
 dQFokbHIMtXPnoIEb0cjXEPI2MLsWI0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-qm53hu94MKqvCedh2f8i2Q-1; Tue,
 18 Feb 2025 13:28:10 -0500
X-MC-Unique: qm53hu94MKqvCedh2f8i2Q-1
X-Mimecast-MFC-AGG-ID: qm53hu94MKqvCedh2f8i2Q_1739903289
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 62AC81800878; Tue, 18 Feb 2025 18:28:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.254])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 58ED7180035F; Tue, 18 Feb 2025 18:28:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: [PATCH v3 4/5] hw/vfio/common: Add a trace point in vfio_reset_handler
Date: Tue, 18 Feb 2025 19:25:34 +0100
Message-ID: <20250218182737.76722-5-eric.auger@redhat.com>
In-Reply-To: <20250218182737.76722-1-eric.auger@redhat.com>
References: <20250218182737.76722-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
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
X-TUID: EGm7yzkT1u5T

To ease the debug of reset sequence, let's add a trace point
in vfio_reset_handler()

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
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

