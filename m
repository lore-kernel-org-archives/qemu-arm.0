Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2252731njc;
        Mon, 16 Jun 2025 20:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBq/HYoFVie+mD/pnIXYjmH1iT+k9+l9tC0KhCybbjitvBOjYlwqeAoHDacA/Xq8Vw7Id0dw9vrYstsg==@linaro.org
X-Google-Smtp-Source: AGHT+IFCSBdORYspCE1yBvxFCwWvMgsvMx65CwA/hxyJBBW2sTPYwjbLOTtIt9PhrdaO1JAX7D3s
X-Received: by 2002:a05:620a:44d0:b0:7d3:90ab:804 with SMTP id af79cd13be357-7d3c6d124eemr1899691885a.58.1750129555582;
        Mon, 16 Jun 2025 20:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750129555; cv=none;
        d=google.com; s=arc-20240605;
        b=bAWTvuVvAk2ar3PilFMUtmQhG9dP40gtscnJKHyQBFldQWDE/kz/7UIYOtTE932EEN
         4LsE60GJE+wmT10GFvodeDcS+3SCyMJRkGy4bXM6JCeV77no1GEgZDyXB5uEG/R7u0lJ
         7W7nAEmalIClHz1t649s3VYfbJDz7xt8ct04ifH4wSprQOItI7kGyVTG84nK+ysrbWgz
         jfGKCLwfHH6RhjsnqqhnAGGHlUSc0CCjobPkY9XelVXVzau7JataZRN2XqIUUC+lKpdW
         GTETCdpdmfSzIRXqVBnKq7dBlR9cfBMGMkP+ZDnygL/D7JWoj4gswA7tWcBUvjfzZzRL
         QWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UuWdnZphGQ2D0JIEKbjSdEcI/ZBMMQb3cMoI9G1w4/M=;
        fh=kJp5zm8Mfs6U4zxdDWQRDwjEAch+t3G7kKIHh+4Vd5k=;
        b=RmRf7WnKLlj8kdIZDl0va52tD7tYEXc4WWXsamWFK4g2HBoum/Ndu1D9vIfTFc+UG6
         jN/jjSpNh8KYpcaty6neTaBvNsTq/ZoQTQlAyzVgVP1G1a8EXxwm4jbOqNkuJjlLfIFu
         VJB03DPA1bOZvNfBM21l1u3uA23eal8yPuRn4AfNLw8yQfa3kEsFFFruIL17UMLV/idS
         4w442wALzibJqk4nguBi75aUjw4kruJajhngZzhPDeK6qyQ63bI32ykhX3gBCUKt/U2W
         gLTnsTp4gpqI6kG5/uiog9o2/xncTcwqQmywjgSUB0Bi6X6lyzbfkvfRfM6fb35l3YH0
         Ngdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B3UFZA44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f36d23si1048838385a.546.2025.06.16.20.05.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 20:05:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B3UFZA44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRMdq-000536-24; Mon, 16 Jun 2025 23:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uRMdo-00052A-IN
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 23:05:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uRMdm-0004dW-Eo
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 23:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750129537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuWdnZphGQ2D0JIEKbjSdEcI/ZBMMQb3cMoI9G1w4/M=;
 b=B3UFZA449jfs6/sAuMg6ptXGIh+r0CchpNIGOHxorfm48kpkgbxVcEcF7ytCLXHGbP9bzS
 zEmhbk/qcblU6CW1uL34dC+MeeNvLkbzqBtYCbzeWCQnPwmNbrNnIAHRwGj+ayMb8yLQri
 gIGXIrXxFaQVeXl+c7HAVjGarF590uU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-bnNSijE8OUK7998LtbMyqw-1; Mon,
 16 Jun 2025 23:05:33 -0400
X-MC-Unique: bnNSijE8OUK7998LtbMyqw-1
X-Mimecast-MFC-AGG-ID: bnNSijE8OUK7998LtbMyqw_1750129532
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 95DA6195608C; Tue, 17 Jun 2025 03:05:31 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7717819560A3; Tue, 17 Jun 2025 03:05:29 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-arm@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] hw/i386: Add the ramfb romfile compatatibility
Date: Mon, 16 Jun 2025 23:05:21 -0400
Message-Id: <20250617030521.2109305-3-shahuang@redhat.com>
In-Reply-To: <20250617030521.2109305-1-shahuang@redhat.com>
References: <20250617030521.2109305-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.892,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: of+bvtn166o5

Set the "use-legacy-x86-rom" property to false by default, and only set
it to true on x86 since only x86 will need it.

Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
---
 hw/display/ramfb-standalone.c | 2 +-
 hw/i386/pc_q35.c              | 3 +++
 hw/vfio/pci.c                 | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index af1175bf96..ddbf42f181 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -63,7 +63,7 @@ static const VMStateDescription ramfb_dev_vmstate = {
 
 static const Property ramfb_properties[] = {
     DEFINE_PROP_BOOL("x-migrate", RAMFBStandaloneState, migrate,  true),
-    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, true),
+    DEFINE_PROP_BOOL("use-legacy-x86-rom", RAMFBStandaloneState, use_legacy_x86_rom, false),
 };
 
 static void ramfb_class_initfn(ObjectClass *klass, void *data)
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index fd96d0345c..f6d89578d0 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -45,6 +45,7 @@
 #include "hw/i386/pc.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/vfio/pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/display/ramfb.h"
 #include "hw/ide/pci.h"
@@ -67,6 +68,8 @@
 
 static GlobalProperty pc_q35_compat_defaults[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "39" },
+    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
+    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "true" },
 };
 static const size_t pc_q35_compat_defaults_len =
     G_N_ELEMENTS(pc_q35_compat_defaults);
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ff0d93fae0..a529500b70 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3564,7 +3564,7 @@ static const TypeInfo vfio_pci_dev_info = {
 
 static const Property vfio_pci_dev_nohotplug_properties[] = {
     DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
-    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, true),
+    DEFINE_PROP_BOOL("use-legacy-x86-rom", VFIOPCIDevice, use_legacy_x86_rom, false),
     DEFINE_PROP_ON_OFF_AUTO("x-ramfb-migrate", VFIOPCIDevice, ramfb_migrate,
                             ON_OFF_AUTO_AUTO),
 };
-- 
2.40.1

