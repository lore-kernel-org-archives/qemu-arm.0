Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1569265njb;
        Thu, 6 Feb 2025 06:23:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXv7L81DCjPiBehusLvAQF0GULFzgRSyKfjOSne7WxtRvHzQmvaQf0xrj4kBtMkGvl5kDBk2FfM5zaFDw==@linaro.org
X-Google-Smtp-Source: AGHT+IHsAVdWkb7p9pEfCF3EPf36FE1yzLoWf6KKWaCu26yxdPKpfZt+jGrSrlYOX3v6wG/Ef8Je
X-Received: by 2002:a05:6214:252f:b0:6d9:353b:aa26 with SMTP id 6a1803df08f44-6e42fbba032mr106786276d6.13.1738851820051;
        Thu, 06 Feb 2025 06:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738851820; cv=none;
        d=google.com; s=arc-20240605;
        b=Cv9IXOHjgYBub/IBnzOirj8croJby7mMLWXSwexT397sgyO+6FSxKpQIlSFqXCDG5x
         tQ352K9oeUVf+Bnp2QkB/qLQlCFL0nKZDH/cZWVweWJ8e6QxW57KFgk4WChl1XXfIEtI
         3CYkHNKd5Q6/70Su6scHMhltdnjz55Sux5alEdmDWHTU8sOmLl4So5NuN5iA+I9H2Rw7
         7COYX670Ufd0R2gVE4v/YKowAA5wVtu0qUQGwRrLusMeE726SX98yHo6XQPMtYuJKt3F
         Wh7mW1ql8gxGxlI2zKy8oi3CFGMw3xiTSkU/17frXEXbYX56bW7L7DDbuhme1oazZJg3
         /HGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pye4F/5Cd7B6ILcQ7uy6RhAoscXnje+gWkCZxwi9eNA=;
        fh=swiL4bERDBgIQIiNoTOu/2bBoUECE5mFI7R2Xc6Vuzs=;
        b=NlGXHs2UxwjRGO1N7cybTXQU3o8esxJgOaS3ozaW66LKjcBCcXQwVD0HXcN3A6PQad
         5nLKfi8lD6Vmx5kAEJdXyeZ002EXaYYKkZpWPMfaMDo0lOvOU+VUKxcCo7zGrEZU662Y
         OWozWYVutzR5cDHav/SyeEu5K9fZcPW8om3iDUtMicU3d1ge7bbQjWsn6j1wywB/x9Nc
         DdRONoOdAiVWaCXt1oFRvhPiZosddCPjTbjZ8Ec7PiU8MlqBpKrv48edosQGRMrYrqic
         a0xYnb4zdhhcAut2rB9NMGLnb9cu09fKTAXtQFq3O3vqc6uHGAHfUCQe6ISohtV+ShwK
         z0uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ekDtZXTE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43badf59fsi12236826d6.270.2025.02.06.06.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 06:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ekDtZXTE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg2my-0002Bg-0w; Thu, 06 Feb 2025 09:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tg2mv-00029d-IK
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 09:23:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tg2mu-0006kE-14
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 09:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738851807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pye4F/5Cd7B6ILcQ7uy6RhAoscXnje+gWkCZxwi9eNA=;
 b=ekDtZXTESGGsBO7pv/+s9H77P79dXdG6hTRhPxwFiUfUKPdzn+W/2HeSOTjWctE6tEKgJ/
 qZTxsvV/TFPAE4fly8dVSWrlZxpHOFOeTGh+MeTvfu8um6W1YS/eNdTzD/F4QE4BM8tV0n
 5GyCtnB7JBOQCVkt7xrM5QQSoCa6MKA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-DQJgYmpFOvm0JRp5PGbtgQ-1; Thu,
 06 Feb 2025 09:23:24 -0500
X-MC-Unique: DQJgYmpFOvm0JRp5PGbtgQ-1
X-Mimecast-MFC-AGG-ID: DQJgYmpFOvm0JRp5PGbtgQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 161911800872; Thu,  6 Feb 2025 14:23:23 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.9])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8D97D1800267; Thu,  6 Feb 2025 14:23:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: [PATCH 1/5] hw/virtio/virtio-iommu: Migrate to 3-phase reset
Date: Thu,  6 Feb 2025 15:21:52 +0100
Message-ID: <20250206142307.921070-2-eric.auger@redhat.com>
In-Reply-To: <20250206142307.921070-1-eric.auger@redhat.com>
References: <20250206142307.921070-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: JioTzgE9lInh

Currently the iommu may be reset before the devices
it protects. For example this happens with virtio-net.

Let's use 3-phase reset mechanism and reset the IOMMU on
exit phase intead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 9 +++++----
 hw/virtio/trace-events   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index f41104a952..eae3bcedde 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1504,11 +1504,11 @@ static void virtio_iommu_device_unrealize(DeviceState *dev)
     virtio_cleanup(vdev);
 }
 
-static void virtio_iommu_device_reset(VirtIODevice *vdev)
+static void virtio_iommu_device_reset_exit(Object *obj, ResetType type)
 {
-    VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
+    VirtIOIOMMU *s = VIRTIO_IOMMU(obj);
 
-    trace_virtio_iommu_device_reset();
+    trace_virtio_iommu_device_reset_exit();
 
     if (s->domains) {
         g_tree_destroy(s->domains);
@@ -1668,6 +1668,7 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     device_class_set_props(dc, virtio_iommu_properties);
     dc->vmsd = &vmstate_virtio_iommu;
@@ -1675,7 +1676,7 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     vdc->realize = virtio_iommu_device_realize;
     vdc->unrealize = virtio_iommu_device_unrealize;
-    vdc->reset = virtio_iommu_device_reset;
+    rc->phases.exit = virtio_iommu_device_reset_exit;
     vdc->get_config = virtio_iommu_get_config;
     vdc->set_config = virtio_iommu_set_config;
     vdc->get_features = virtio_iommu_get_features;
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 04e36ae047..76f0d458b2 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -108,7 +108,7 @@ virtio_pci_notify_write(uint64_t addr, uint64_t val, unsigned int size) "0x%" PR
 virtio_pci_notify_write_pio(uint64_t addr, uint64_t val, unsigned int size) "0x%" PRIx64" = 0x%" PRIx64 " (%d)"
 
 # hw/virtio/virtio-iommu.c
-virtio_iommu_device_reset(void) "reset!"
+virtio_iommu_device_reset_exit(void) "reset!"
 virtio_iommu_system_reset(void) "system reset!"
 virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
 virtio_iommu_device_status(uint8_t status) "driver status = %d"
-- 
2.47.1

