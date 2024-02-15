Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp431750ejb;
        Thu, 15 Feb 2024 00:44:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVEJFR74s2S8pjFsD+eghg33oxFyrlNsgJ7oxNwdL5ivEWQQs7aJetiC2Tq93msnALcrVBhKPjEYF02q7ODRGlxLYHkf9FF
X-Google-Smtp-Source: AGHT+IHRDE3xuXr04Jhtx8kiYRm4/EuKW9cIFjj8BUzrxSZ/qWl/nR0sWDkVp4OzpKu5ugfNYOuB
X-Received: by 2002:a05:620a:4c6:b0:785:d857:20e0 with SMTP id 6-20020a05620a04c600b00785d85720e0mr1128432qks.69.1707986677643;
        Thu, 15 Feb 2024 00:44:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707986677; cv=none;
        d=google.com; s=arc-20160816;
        b=hW4wsnXIxwqR/IwmlBA+zo5EoYA5oOZ45XLf6ShfPDZ+n30GaBolR/ojAT56q2grPz
         zl0CEJnlQ9oA5642WNXQ1OCNdcnnPQfsrAR9nSJmJKD18MNptxNKtdQ613USslyHQPk+
         bnWa8GgWTf2HW/YfqSuIETTX2MtRW+5k5fJq07qp4ZWki531fk3zT7XqUIXcpSAjiIqx
         g5uxs9XoFIZKwbMYtVqnVBzraptOsBFETLg/xrH0iwmYkrD1flt7EydZvjDu1HSbttTW
         NvW5EhKaWa1065qiVwSXe1oqdZFhNC1oFbmc7gsZ00Xm0yZfxcGlzvXLJCdWUBq5kOCn
         BI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8ZKfU39A1bMk0UwDjVa+J1YcXnTXR8vg2vSYAIExryI=;
        fh=dsHfM+Mw8oDNXgO0Kstu1+xrcf1CHu/m35bC60t/K20=;
        b=y43f0iZUFK/4d7x8iea56UOR/bQPRAqhuAcagvsk/ZqKodIGqK9zrHvlVfNJWIuNlO
         rkomzVT9u3TA+P1bwUFKqzsCrELQqf2D1RPYVZGikH2pk9Xr2waG75Ajr2cu3AWeNIee
         uWpoiMM3pylFGKWqSmP+iQ9rHXwYnPb1G9EM/5Ll2k+C5EDIV0/Xw7ks4LB14jOynM2q
         gQs17Izj4O+dJmqzg1FV9j8zUGD5DhKm46h7YGb5pWSrU4d3EGSX4khu++6B2zsxnOll
         GNXXc1zAo5BoLfdVvBbHvPthhg+s7Y2TgLE5ei9Ij5AJZrcA7NqQ8W8BFoRRJrY8tqhz
         s4fA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JYtfxHH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z25-20020a05620a08d900b007872a126f57si1021772qkz.611.2024.02.15.00.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 00:44:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JYtfxHH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raXLG-000177-0D; Thu, 15 Feb 2024 03:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1raXLC-00015b-3A
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 03:43:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1raXLA-00019D-5Q
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 03:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707986611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ZKfU39A1bMk0UwDjVa+J1YcXnTXR8vg2vSYAIExryI=;
 b=JYtfxHH+prf8Zxl49LPVfRelwQ7UBm4t7oBdLI0D0vOY4yclRnFyeZB0/l5FY6WMp+kEHx
 J2Y2tPQDXzvNSncwFzgFpJXvU6/gTYVKAL9RYRGCONqNsHbcW2CLMIvlR/8SIO8r/R0saU
 nVX+tvt66fkfLh1fKmk5U2XqQgg/yXk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-qViMEr85OnC9Jn-M5PsGuA-1; Thu, 15 Feb 2024 03:43:26 -0500
X-MC-Unique: qViMEr85OnC9Jn-M5PsGuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63DC386F12E;
 Thu, 15 Feb 2024 08:43:26 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 701AFAC0C;
 Thu, 15 Feb 2024 08:43:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, mst@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v5 1/4] virtio-iommu: Add an option to define the input range
 width
Date: Thu, 15 Feb 2024 09:42:11 +0100
Message-ID: <20240215084315.863897-2-eric.auger@redhat.com>
In-Reply-To: <20240215084315.863897-1-eric.auger@redhat.com>
References: <20240215084315.863897-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.531,
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
X-TUID: XEBvuI2zoQef

aw-bits is a new option that allows to set the bit width of
the input address range. This value will be used as a default for
the device config input_range.end. By default it is set to 64 bits
which is the current value.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>

---

v1 -> v2:
- Check the aw-bits value is within [32,64]
---
 include/hw/virtio/virtio-iommu.h | 1 +
 hw/virtio/virtio-iommu.c         | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 781ebaea8f..5fbe4677c2 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -66,6 +66,7 @@ struct VirtIOIOMMU {
     bool boot_bypass;
     Notifier machine_done;
     bool granule_frozen;
+    uint8_t aw_bits;
 };
 
 #endif
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 86623d55a5..8b541de850 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1314,7 +1314,11 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
      */
     s->config.bypass = s->boot_bypass;
     s->config.page_size_mask = qemu_target_page_mask();
-    s->config.input_range.end = UINT64_MAX;
+    if (s->aw_bits < 32 || s->aw_bits > 64) {
+        error_setg(errp, "aw-bits must be within [32,64]");
+    }
+    s->config.input_range.end =
+        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;
     s->config.domain_range.end = UINT32_MAX;
     s->config.probe_size = VIOMMU_PROBE_SIZE;
 
@@ -1522,6 +1526,7 @@ static Property virtio_iommu_properties[] = {
     DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
                      TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
+    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

