Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp743735ejb;
        Wed, 6 Mar 2024 12:34:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU4+7iAEW83ANuiOmpNqUHEEsafdjbBm1oVp2OFZAwaxk1rhMGBUlADZlWG86Ptp1JGXeZ1ILg4rInximU5CZ/46R30yATI
X-Google-Smtp-Source: AGHT+IHyFcVC7llYm8FJgvwaQ7WUwE+9R6BYIeIlMjzokxlmQ0n4poKlGHqpHaTQorRxn0Q/Zndf
X-Received: by 2002:a05:620a:51c3:b0:788:1bda:8aa3 with SMTP id cx3-20020a05620a51c300b007881bda8aa3mr6768794qkb.19.1709757294968;
        Wed, 06 Mar 2024 12:34:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709757294; cv=none;
        d=google.com; s=arc-20160816;
        b=XkQCCKmYny1Uja1gYdB6DqBYXpqBkHfOdrkzH/woT/2oKnYanMdEff7+k9fF85EJCh
         bfDKhDup6rh6Z/drQQhjXBW9KbjHPqb12kcOqMPj92tL45alHXvRplOrXMS6+R5li/4K
         Vflu8cp69YX3OTVZWWc32NKVFYcFbo1Z0YJEACj6yPKfEw0yL2nH/AEyKi/U76Mnc5Fk
         3enoo4rkDmc9Daz0iZu4tFPvvwlfwFSpF8eCygllrvojm5pSGSg3Yntz4Aypp/YcK8j9
         0sLevTJa4nC1JxtrYam/RzRH3/0pe3UwvPPP4ntk493snu46SnP3a42d52WKjHD2p4K6
         dbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mtAnTSStkOKpy0/Q14u1Ipt8HVO4uL1e5P+fAKhJM+A=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=q9KsBuU7G/cbRe2oPrrlRqFywOPQbn3EezQ5SMpjZOutxCAPoYsiLbYcZz5fKHz8nd
         qDvozx8lfl9fXZRl1FZeRjqhxVeeL+JYKyN8fwANpFwq3BQ2UI7keVyK8QwrxAhzIXWs
         B98cudVZ4lyvpP5C/2B+wzzG/mDyb8TcA4wRg6/l5mIh4lIPKNADKZ11wA+wEjBL+p4s
         aQDtik13WNL6qk0sb2grK8F7KR232oqeixfHvHxPorxN5w141FXKd6XR2iLDHdIs7USE
         56r4HqR+Grr8F7mz3n9SGCJcQ5REqwj3HkmIgfg96Mylsh125MptBu3knZemxamp6a4o
         MOnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AeLiZPuo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op34-20020a05620a536200b0078812fe97cfsi11169702qkn.409.2024.03.06.12.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 12:34:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AeLiZPuo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhxyI-0004UJ-9N; Wed, 06 Mar 2024 15:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxy2-0004Ke-9c
 for qemu-devel@nongnu.org; Wed, 06 Mar 2024 15:34:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxy0-0001q2-SN
 for qemu-devel@nongnu.org; Wed, 06 Mar 2024 15:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709757259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtAnTSStkOKpy0/Q14u1Ipt8HVO4uL1e5P+fAKhJM+A=;
 b=AeLiZPuoOWYXyytSBQRn+BwH470K02+rSsfRXzr7O3umFl7t1Fe/YKm2SFWaojz15yletS
 ue7X06ImQ38IM2oWwwsJ5KE6HZfZ/fXZgyyKsju3aonD/cfMCglWIMRSBg8JIk9Ua8XgmP
 euxGXh2l6mRIojQLnGae/S4dpopTdw0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-rgH-kNiNO7yzoVsBvg7fUA-1; Wed,
 06 Mar 2024 15:34:17 -0500
X-MC-Unique: rgH-kNiNO7yzoVsBvg7fUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6033A2804800;
 Wed,  6 Mar 2024 20:34:17 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC9D336FF;
 Wed,  6 Mar 2024 20:34:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v7 6/9] virtio-iommu: Add an option to define the input range
 width
Date: Wed,  6 Mar 2024 21:32:45 +0100
Message-ID: <20240306203348.65776-7-eric.auger@redhat.com>
In-Reply-To: <20240306203348.65776-1-eric.auger@redhat.com>
References: <20240306203348.65776-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.365,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: nmc5uTY1DMhB

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

