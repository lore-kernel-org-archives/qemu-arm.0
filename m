Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp311989eje;
        Tue, 13 Feb 2024 10:30:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXWiNPdariFjZ3ewSRTUOE3N60SziCA5ilFtQyFgnuwI+FPgupImk0wcLEqpE0DffmJLZic7xbsfD8C6BZ9ohTJb1zYk7c
X-Google-Smtp-Source: AGHT+IEpvUuMypp+GN189yPAkjeDRTVETqbtcd6SvxcJxDfzoF7HLXXfCn5jbVjXt8X0uRs4HKnS
X-Received: by 2002:a0c:ca92:0:b0:68e:facf:fe4 with SMTP id a18-20020a0cca92000000b0068efacf0fe4mr325036qvk.22.1707849055420;
        Tue, 13 Feb 2024 10:30:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707849055; cv=none;
        d=google.com; s=arc-20160816;
        b=fSs4kemnzoE3zTbHLwOu5olH0TDvgxfuiV4shFtOGJvK4U7pwVO5EB6t0Nyvg4v0SM
         XboMwqhh6LN2bGhYGabxJqCcIpk0Dp6P2QBqQnAC7lDSlkTE5LoRomsNoAQM71Rzyz2x
         kglRFajQ9uDiR1IEC5qUD0d4sgUZn4ptKkiOFAn9yy/bNKaffitRH0IkJmWjZmVCareW
         J/mUkczdGKKFDCm7Sh+VnZdmXklPx0/0dJP6Mhse1+K67I/GbDi3e/ERonmsWdUXcKSZ
         KyuFPcV/2nLZLV0pOpAEk3aXGUx/Em9WZpMOvaN201K9idUfWhPu+1Td8juL7vtmB+On
         Nqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DscdrCDEILIfcHZ5zn4fM+ulztQdQb55b4XjcXiZaTk=;
        fh=UEm+4LnEX14981jrmuz88Swpykqc0XPtC5hJpZ2P9tY=;
        b=JaTReeIDSq8f2ZNe+Iu8Xn13PdqS9bpd8/OFMH+Ibw8mSXIwJ7oT0oyYKpv/LQaXmn
         iHxvU6SsJevq9zckUCpm12IoR6ZPcR/bt7FC7z+okcEGhtfwsTQ4UJd6aXI32w8fgNPU
         6kHPN4x7/llAPjUWHaFQqsVrzM0IRNA6pbXkdz8odCghtHTIqkXdatdy/ns3NpCtgyac
         gtE47xPTDHj7DQtepz3chsxNHnShcxgXMXSFylynlBZfww5c51AWsny+5VfLH+NseoIz
         pUrhHPFyPpdgISd2x0BLGOJ0FUeBweO1bBPWq1O/hA0O9VNssBaAdGA0iv3HASoxxfNQ
         MYWQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TSHTtvlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCVYml6Y97yI4+zcX/V2EAX61ihuWfTsUofLbdteaG1dx6XxVQNtHxwUZwJmsjboGetbVVi+Fn3I5ICCO1w09H4bzYXUMy96
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2-20020a0cf682000000b0068ecf8aeed1si2388646qvn.464.2024.02.13.10.30.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 10:30:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TSHTtvlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZxXV-0006fE-F5; Tue, 13 Feb 2024 13:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZxXU-0006ew-88
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 13:29:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZxXR-0001sl-Rb
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 13:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707848989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DscdrCDEILIfcHZ5zn4fM+ulztQdQb55b4XjcXiZaTk=;
 b=TSHTtvlSSjn02eXL/u1ZGEm4DPOXZk7XVI9rbBVia65J81K1mI3cXBqRF07WHM/e2qgmBO
 XYaRVLUA9HTQSNomvS5cwlN1KSPCXtwTIY/2tXqXYT32OK0T6vryvEFzxiiobQ6qq51W+v
 9GadytZnIhtauB0HQVVuZztpxbr6NA8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-ROirourNM5eZmg_rc4prAg-1; Tue, 13 Feb 2024 13:29:45 -0500
X-MC-Unique: ROirourNM5eZmg_rc4prAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 811BD863061;
 Tue, 13 Feb 2024 18:29:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 663BD40CD15F;
 Tue, 13 Feb 2024 18:29:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, mst@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v4 1/4] virtio-iommu: Add an option to define the input range
 width
Date: Tue, 13 Feb 2024 19:28:28 +0100
Message-ID: <20240213182933.825268-2-eric.auger@redhat.com>
In-Reply-To: <20240213182933.825268-1-eric.auger@redhat.com>
References: <20240213182933.825268-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.504,
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
X-TUID: MaXjGnW+M3/j

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
index 8a4bd933c6..666c41fe64 100644
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

