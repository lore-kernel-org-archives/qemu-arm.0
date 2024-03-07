Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1152717ejb;
        Thu, 7 Mar 2024 05:51:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWqAcH8s48cAz92l/76epjbyfxw/bWY7PcbGCyQ3hw82dYFho+1EEkw5KwQpmjj8sokqaw0DdQZqia7DJROJzvGOgv1rbiD
X-Google-Smtp-Source: AGHT+IE7z5dTiFz2A+yT2mM311jd3j5Tx4db4YO26XWB+5iFnq0jxZoZHhZCH87IBEZQZyb96Ysl
X-Received: by 2002:a05:620a:113c:b0:788:3a16:d8ac with SMTP id p28-20020a05620a113c00b007883a16d8acmr6383984qkk.39.1709819497382;
        Thu, 07 Mar 2024 05:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709819497; cv=none;
        d=google.com; s=arc-20160816;
        b=TJxtqA0fFZEZ8LWjyNHgFX3iN0kqVvOJrYr403emt3m3bbM3ubw2QTSKMfXvtOEf4M
         UnDPg+7HW9CxNw9xW6B1IkuncmHACk1hkv2GpksLabdj2EBBUJJjXAOnQd5518uPPD0M
         /6q4q2BJ63xHaQz+JUQPs8oRmiar+N/fE411PzcxhVHu6Y3LdRdTCcrws4BSXmcPYk/c
         Qf7YQB7tZfjnhOCWgKQ038EGF3H/BoiW/n1ke1ul+r0Hk+Ec87fQiikhiMxdlqwzJ0Kz
         jUUF8zR7NtWPLSyBUWiBBpwOrW2TvlMcBg6l58HoCdxvGvjxycbT2s5Jib+wDBsdVlhm
         dMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=czEcqsIErIQNXIn00F0Uho7fUouArtsC4cjIi74+OlU=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=RELUBoQ7TQdvQroRRt/nMr9MX+GSXoWhMCpoM3zORurK/cYzz+5FIia1mJ+3ijuTjr
         TShnf0gz4M75fY7Tdzfs536KLylHnUv/fTTuhDFVjjpa9RBjhzGGsKgCBz6Nk16hjJop
         nuGCj0h4l0CGZXuELORkqu4mDZhJzH9q9m8byYlTZtETdG+dnstsbpb/ZAZgNswbnkcd
         RhBYkA1eHoZItv7uhlPd0Ac5Be8/m3MuATyX4FRhT6QMJfWUuKvViKH+epvhcBJ5d2/s
         vFcZGPSLBAIrQSUKjU/8Sn2CtPfdKglLezcpenSFb1CeWYIoY5ul2QnvgSe5IBzwokaO
         bVhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fk8hYDo5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt22-20020a05620a479600b00787c19596e1si11045606qkb.57.2024.03.07.05.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2024 05:51:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fk8hYDo5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1riE7v-0007P4-QG; Thu, 07 Mar 2024 08:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE4R-00059S-Mg
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 08:46:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE3y-0007KH-UT
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 08:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709819122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=czEcqsIErIQNXIn00F0Uho7fUouArtsC4cjIi74+OlU=;
 b=fk8hYDo5GP2YvVDqkCRlUZP+QNULJPvhEWUBgiGGvbpvxmLIT05MoprA5fWK3aFPbACVDz
 Ge8tEKd3YXVgVL6RccMWEyWI2lLIFfgNL7U3DA6zwbIFTSTpfNZ7kf4t4JkvP5Xd3jPoyj
 rB0QoNCiq68EzoKJBqQMPgIzFG7ITnI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-456-QiUoSJkzNPO-XPXDh28xbQ-1; Thu,
 07 Mar 2024 08:45:18 -0500
X-MC-Unique: QiUoSJkzNPO-XPXDh28xbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26DE01C00D27;
 Thu,  7 Mar 2024 13:45:18 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC5B417AA8;
 Thu,  7 Mar 2024 13:45:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v8 7/9] hw/i386/q35: Set virtio-iommu aw-bits default value to
 39
Date: Thu,  7 Mar 2024 14:43:08 +0100
Message-ID: <20240307134445.92296-8-eric.auger@redhat.com>
In-Reply-To: <20240307134445.92296-1-eric.auger@redhat.com>
References: <20240307134445.92296-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.583,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: g+DmKKW2q4lL

Currently the default input range can extend to 64 bits. On x86,
when the virtio-iommu protects vfio devices, the physical iommu
may support only 39 bits. Let's set the default to 39, as done
for the intel-iommu.

We use hw_compat_8_2 to handle the compatibility for machines
before 9.0 which used to have a virtio-iommu default input range
of 64 bits.

Of course if aw-bits is set from the command line, the default
is overriden.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v6 -> v7:
- use static pc_q35_compat_defaults
- remove spurious header addition
- s/32/UINT32_MAX in the qtest

v5 -> v6:
- split pc/arm settings

v3 -> v4:
- update the qos test to relax the check on the max input IOVA

v2 -> v3:
- collected Zhenzhong's R-b
- use &error_abort instead of NULL error handle
  on object_property_get_uint() call (Cédric)
- use VTD_HOST_AW_39BIT (Cédric)

v1 -> v2:
- set aw-bits to 48b on ARM
- use hw_compat_8_2 to handle the compat for older machines
  which used 64b as a default
---
 hw/core/machine.c               | 1 +
 hw/i386/pc_q35.c                | 9 +++++++++
 tests/qtest/virtio-iommu-test.c | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 6bd09d4592..4b89172d1c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -35,6 +35,7 @@
 
 GlobalProperty hw_compat_8_2[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "granule", "4k" },
+    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
 };
 const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 45a4102e75..1e7464d39a 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -45,6 +45,7 @@
 #include "hw/i386/pc.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "hw/display/ramfb.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci-pci.h"
@@ -63,6 +64,12 @@
 /* ICH9 AHCI has 6 ports */
 #define MAX_SATA_PORTS     6
 
+static GlobalProperty pc_q35_compat_defaults[] = {
+    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
+};
+static const size_t pc_q35_compat_defaults_len =
+    G_N_ELEMENTS(pc_q35_compat_defaults);
+
 struct ehci_companions {
     const char *name;
     int func;
@@ -356,6 +363,8 @@ static void pc_q35_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
+    compat_props_add(m->compat_props,
+                     pc_q35_compat_defaults, pc_q35_compat_defaults_len);
 }
 
 static void pc_q35_9_0_machine_options(MachineClass *m)
diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
index 068e7a9e6c..afb225971d 100644
--- a/tests/qtest/virtio-iommu-test.c
+++ b/tests/qtest/virtio-iommu-test.c
@@ -34,7 +34,7 @@ static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
     uint8_t bypass = qvirtio_config_readb(dev, 36);
 
     g_assert_cmpint(input_range_start, ==, 0);
-    g_assert_cmphex(input_range_end, ==, UINT64_MAX);
+    g_assert_cmphex(input_range_end, >=, UINT32_MAX);
     g_assert_cmpint(domain_range_start, ==, 0);
     g_assert_cmpint(domain_range_end, ==, UINT32_MAX);
     g_assert_cmpint(bypass, ==, 1);
-- 
2.41.0

