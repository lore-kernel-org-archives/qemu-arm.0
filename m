Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp492045ejc;
        Tue, 23 Jan 2024 10:18:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEykDyFPpzRZ9AM9ZVO6KgwsHEo1M9ncayXELtuO1TUFO6K+x6qyJxyP6Jhspp2+spVQkJf
X-Received: by 2002:a05:620a:45a3:b0:783:47c6:6ae5 with SMTP id bp35-20020a05620a45a300b0078347c66ae5mr8485186qkb.149.1706033915806;
        Tue, 23 Jan 2024 10:18:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706033915; cv=none;
        d=google.com; s=arc-20160816;
        b=1B7gq9DuGzmjuhfHEVC8onMcufcNOLQsLxzyA4IjP+jRM8mIuKcr0nDscgSNFDgVyN
         blTww2tASipIEyZ/pzfd1SWaCMlzXhyuvW1ns2EopIXxDRKSFnIWOo2TyBktrSE3A2n9
         3MCyWaWcEuTEEaFl9009tdCeYFrtZDTeM2FOaYSGORLB6mY57HsV1o0GrxmmTbSZk0eM
         20ks83PRwjSidP5OX6jKHWNCrRaFoBu+Ymwu1u4A3eaWpSh0MABn55fGGXql7dcKZwvu
         9cdbxLDGmExcZwuP/zgsEFCp/yeIesIv8o5hCwbrdMb9jbC2Nmfut5EYGVf75z2e355g
         MJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7nSeV79E+t9oTnAn/7HnXx00d5vhgYI0Nd2a/g3zPQY=;
        fh=6gTb9VNh6LOeqNyIPKrEwVzrOlAOUavPKoS18EAi0QU=;
        b=L1htb6xkhuHzHvuq/NOPO2Ss6QR5IrcTd+jzwAhFJBF0KR5Dk6LmhrRX7VoQQiiX8D
         Rw5JikbPulO+AYgedtEJWHwoaJ3egHjTeAZyp/vxOLnHy2Dd5ZV3Sh6dr55XxZtK224b
         BCGVEzahlMqv0uTOVHwhKKk9xylr4fN/IxYDWerdtxhXu2nxCWSoeYyfsg8rIr4jr4lw
         X1yLATYRJwGG2FyYGKnbC9Vhh/Y/fM0NDg+SBuYq/eNYuQuu4otcCbJX0qGVWAypWYkZ
         G/jRN/XVhHHT1/vtRa9RmeqcxNkgPpOnhUfzz6+V3rFi1+4dJSWYXSwzjQYsWuMDn4Xf
         S3qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eb+n50Pj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020a05620a03c900b007831a529fd4si8253960qkm.626.2024.01.23.10.18.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 10:18:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eb+n50Pj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSLLl-0007Bq-6z; Tue, 23 Jan 2024 13:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSLLd-00077H-Mp
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 13:18:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSLLb-00064J-Hu
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 13:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706033886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nSeV79E+t9oTnAn/7HnXx00d5vhgYI0Nd2a/g3zPQY=;
 b=Eb+n50PjNn+voCJcApiimVQiDC9/UI6JfHMMvhqSYMRbs0viJtoi0Ad11ZqLbPpQN2AyLY
 ox5aY2/Zo6HuBjtKpuMfJ6ckUpDW2wz6TSw7cwSGfzwbIC+piC8XyO+kZM3dq+WdT0sbBR
 liNdlHRLDha7J14hIlftoxAeaMY+Sj8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-1nSc43LZPOK4Rquay1pofQ-1; Tue, 23 Jan 2024 13:18:01 -0500
X-MC-Unique: 1nSc43LZPOK4Rquay1pofQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4233C862DC4;
 Tue, 23 Jan 2024 18:18:01 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F149A2166B32;
 Tue, 23 Jan 2024 18:17:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, peterx@redhat.com,
 yanghliu@redhat.com
Cc: mst@redhat.com,
	clg@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 1/3] virtio-iommu: Add an option to define the input range
 width
Date: Tue, 23 Jan 2024 19:15:55 +0100
Message-ID: <20240123181753.413961-2-eric.auger@redhat.com>
In-Reply-To: <20240123181753.413961-1-eric.auger@redhat.com>
References: <20240123181753.413961-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.327,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: jaTqtM3SHOXd

aw-bits is a new option that allows to set the bit width of
the input address range. This value will be used as a default for
the device config input_range.end. By default it is set to 64 bits
which is the current value.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/virtio/virtio-iommu.h | 1 +
 hw/virtio/virtio-iommu.c         | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

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
index ec2ba11d1d..e7f299e0c6 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1314,7 +1314,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
      */
     s->config.bypass = s->boot_bypass;
     s->config.page_size_mask = qemu_real_host_page_mask();
-    s->config.input_range.end = UINT64_MAX;
+    s->config.input_range.end =
+        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;
     s->config.domain_range.end = UINT32_MAX;
     s->config.probe_size = VIOMMU_PROBE_SIZE;
 
@@ -1525,6 +1526,7 @@ static Property virtio_iommu_properties[] = {
     DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
                      TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
+    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

