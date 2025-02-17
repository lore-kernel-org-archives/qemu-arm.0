Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp38289njb;
        Mon, 17 Feb 2025 05:38:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWbznHoSEpZZ5lyLgvl90fH6s0+YrFksP77854FWTMQl830bQggNMWdxFiZt+I1wNGKZYcBosJFLjSqHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFOSI0iqb+HF5OhMD3Hjb9ROjQDuj/DdpAzhAq/bcljZiRlUnjljuLHYg3wt5LgV+aW6+LV
X-Received: by 2002:a05:620a:4607:b0:7c0:a3bd:a779 with SMTP id af79cd13be357-7c0a3bda99dmr255166985a.47.1739799511831;
        Mon, 17 Feb 2025 05:38:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739799511; cv=none;
        d=google.com; s=arc-20240605;
        b=KKmNSGqQsijHIYmeAAbw675ME3difzW0J0Ry/Kwb7BHSzNhtn3ZgyuuOPdzZ/vQSgc
         7vz8+OIVVgENuLSB28zUc9G68NWHsubuinwxFXiOkq+uy07L125MtKYO8JVUUsxsEQSl
         uvtducpNq0GGwbx2qFoewEaXMKlO5vqt4M6GpaMZkqWl5yk1gDrWo1N9ROUVOFBQVfaM
         239jsYh9ypWMV/MbYkF6ELQAcMKgcvO8YNCkbwGL/7yt5GiaNLH8a2Gn+Eqq0POtq5qc
         IU902QDDbkpd1843jCUAEeNrJC0gWUgLw34yV0I4kdlSx0d3Al/8QhSsaNP0XpdDkTJu
         OLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/xnxBjcUmXr1K9ZS/I+fCDxeNyRxUqcNF4akpKzPMC4=;
        fh=swiL4bERDBgIQIiNoTOu/2bBoUECE5mFI7R2Xc6Vuzs=;
        b=FqCr0w7fQcTjlhUXVwgqXaPxzIrlF4lBtZflHmFnmzIpVQfvDwJ3zxG0Ye5slS+6bP
         aFslcWsrlxPQWyTwtSheQIguyVoemF+PQsi7ISb9W4zEYne9xAlWugUIK3FAgZos/U13
         0UYb6pGBL3d9KmDaNiD8aaFAvBD8m/ITTVcpbgMEq0qOdPHz/mtGfZLEmWI9y8FwWM6A
         6YF5cSEb/62jGQ00ieImLADdzTlQzOE5w0VtV72yPBHGIvB8Wpv7uMM8O/LhVNfYo4Cc
         YR+EB10puGKdl0g8Ew2I4JLy0selHNMq1QiWTzmKKqD6SP0W2Cjdwo4EfT5aCIcjPbAQ
         bIhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dp04SHUp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c097bbb442si263115785a.255.2025.02.17.05.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 05:38:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dp04SHUp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tk1KJ-0007Yg-6Q; Mon, 17 Feb 2025 08:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tk1K1-0007V5-9M
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tk1Jz-00028Q-Jc
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739799483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xnxBjcUmXr1K9ZS/I+fCDxeNyRxUqcNF4akpKzPMC4=;
 b=dp04SHUp4IkH5sAkw6qW/zOWBX0vcjMPcD5Fp3q+aXd2Cw/8y3fnpgZpS7S6jSDKGJwZSU
 ixJrXfMgyMbHCvHpbKilT28oNGBuyRqae5d4ZhUIY8V6cQcAhXAiwlHGnKpcpuFdLUs2kp
 hmgWftC7lrTLwia5kQuDj+k3+f2BzN4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-vT7qcWpANHWTO3AaR_uX8w-1; Mon,
 17 Feb 2025 08:38:01 -0500
X-MC-Unique: vT7qcWpANHWTO3AaR_uX8w-1
X-Mimecast-MFC-AGG-ID: vT7qcWpANHWTO3AaR_uX8w_1739799480
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A84F41800873; Mon, 17 Feb 2025 13:38:00 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.254])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C2B551800570; Mon, 17 Feb 2025 13:37:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: [PATCH v2 1/5] hw/virtio/virtio-iommu: Migrate to 3-phase reset
Date: Mon, 17 Feb 2025 14:36:45 +0100
Message-ID: <20250217133746.6801-2-eric.auger@redhat.com>
In-Reply-To: <20250217133746.6801-1-eric.auger@redhat.com>
References: <20250217133746.6801-1-eric.auger@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: iYoluD7as32j

Currently the iommu may be reset before the devices
it protects. For example this happens with virtio-net.

Let's use 3-phase reset mechanism and reset the IOMMU on
exit phase after all DMA capable devices have been
reset during the 'enter' or 'hold' phase.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>

---
v2 -> v3:
- add a comment emphasizing the fact that the exit reset
  needs to be used
---
 hw/virtio/virtio-iommu.c | 14 ++++++++++----
 hw/virtio/trace-events   |  2 +-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index f41104a952..b6e7e01ef7 100644
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
@@ -1675,7 +1676,12 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     vdc->realize = virtio_iommu_device_realize;
     vdc->unrealize = virtio_iommu_device_unrealize;
-    vdc->reset = virtio_iommu_device_reset;
+
+    /*
+     * Use 'exit' reset phase to make sure all DMA requests
+     * have been quiesced during 'enter' or 'hold' phase
+     */
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

