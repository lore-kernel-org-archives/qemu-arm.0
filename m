Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp29846ejb;
        Tue, 5 Mar 2024 10:09:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5nyNuzxvJPvzEHNuqOneIGuSyGkt7H3IGuFD/WXP0EAOUd9eSqPoLcZgPYqrjUW5oAGaEURLiERZzcKVkb2qncu1L/mYs
X-Google-Smtp-Source: AGHT+IHMWnla6XDafpcjICQ2S3A9JGgEzcGydJlYtsfYCwCoNCTQOYmAIMJ9mrpynNfFZ3/KlnRU
X-Received: by 2002:a05:620a:cd6:b0:788:3416:3f08 with SMTP id b22-20020a05620a0cd600b0078834163f08mr2578996qkj.48.1709662180865;
        Tue, 05 Mar 2024 10:09:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709662180; cv=none;
        d=google.com; s=arc-20160816;
        b=REk98CCzKuwY758ETMz2ji3pHuAYpxg63ESnl85mV9OoRiEsGpIBN4H78QlF08KT6l
         tc+XL4AeTDzpKCxlBzcb88cKXz+W/cO30pOshwTLw5stSG0xd8Jp7QtdmO4J7PBaEDJ7
         QKe/HDY76+Rn2mq/uE9Sx6pKv6JEJ2pFs5dSXhvVlVzI0MGbCrpQhJ4t7XMkJjGGOzqL
         lKNOY64zJmeGe4Ey0SE0iqbm6hcNUJoFVOgsHASvTPxcaskVmxEAjrbxr5XXSN3NoV3D
         IvBFbi6BfUfIU3L4Fb2ZqP1eqnWuNmPVAK82FhqtXWWAIXsf0/vvpQKbZlqCMzpzInU+
         2cmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mtAnTSStkOKpy0/Q14u1Ipt8HVO4uL1e5P+fAKhJM+A=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=axJ/D8zeXwwRugfCSzs1/heY/EXadUxpwsbtwSXCO6NEY5I3q11N4BYsv73rk2Qrlx
         gBBrctQUH3DRWXCrMiuy7JVHrsAZiPlOWsgPzBATCbj8dT/qzBXPFEGo+X2ZyGH2NNEw
         RKHyAUjY/YziagXQSWhZivb5YUoHddmQh9emJzIVd9NSE8DlC1CremtZ1iHLbYStW7+g
         w+rVNpxsnbpG+0rtm5ceUvvaj+8tK9y9VFlxVR2/ddYVNyT3EzoFuaADvev1oIlGN3t4
         YRG71bX+M5awblonvlT0HP9n+OKoARWa2VIkSz/085NN90SCkOKTUOH1WmvxiZHEhmNa
         zciA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IgnxEzmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi32-20020a05620a37a000b00787a71e63d5si12524435qkn.151.2024.03.05.10.09.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 10:09:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IgnxEzmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhZD3-000259-CQ; Tue, 05 Mar 2024 13:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhZD1-00022x-EO
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 13:08:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhZCz-00008Z-TP
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 13:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709662088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtAnTSStkOKpy0/Q14u1Ipt8HVO4uL1e5P+fAKhJM+A=;
 b=IgnxEzmc7GGatKevioGfRsbsa+O82IvydMlrOEDn/dlOI4qU2Y89l/0nMU5TVhcDzvkFIg
 olfAYqhenBnXjb8w1emmlCS22jqIl6D+hu1JWopbKmUZai1n/J4NnDbOQRz/ob3eHffD4J
 Jb8tVH0MEEPESce3KSpQWv9M/z2oXSY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-JipZx50eP4-ixgtVQX04jA-1; Tue,
 05 Mar 2024 13:08:04 -0500
X-MC-Unique: JipZx50eP4-ixgtVQX04jA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 736263C0244C;
 Tue,  5 Mar 2024 18:08:03 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B183C041F0;
 Tue,  5 Mar 2024 18:07:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v6 6/9] virtio-iommu: Add an option to define the input range
 width
Date: Tue,  5 Mar 2024 19:06:24 +0100
Message-ID: <20240305180734.48515-7-eric.auger@redhat.com>
In-Reply-To: <20240305180734.48515-1-eric.auger@redhat.com>
References: <20240305180734.48515-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: YA9uSiPVdT1R

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
index 67ea5022af..83a52cc446 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -68,6 +68,7 @@ struct VirtIOIOMMU {
     Notifier machine_done;
     bool granule_frozen;
     GranuleMode granule_mode;
+    uint8_t aw_bits;
 };
 
 #endif
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index aab97e1527..9b2813188b 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1314,7 +1314,11 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
      * in vfio realize
      */
     s->config.bypass = s->boot_bypass;
-    s->config.input_range.end = UINT64_MAX;
+    if (s->aw_bits < 32 || s->aw_bits > 64) {
+        error_setg(errp, "aw-bits must be within [32,64]");
+    }
+    s->config.input_range.end =
+        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;
 
     switch (s->granule_mode) {
     case GRANULE_MODE_4K:
@@ -1544,6 +1548,7 @@ static Property virtio_iommu_properties[] = {
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_GRANULE_MODE("granule", VirtIOIOMMU, granule_mode,
                              GRANULE_MODE_HOST),
+    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

