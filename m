Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3407616ejx;
        Mon, 7 Nov 2022 14:56:52 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4VoR9zbWNKwOlPCbcj+NJTUD8iXMOvHuQbAJz5m28nmxn7JSuQR+KlgVsiTSTH0tg1lCsE
X-Received: by 2002:a05:6214:c21:b0:4ad:75e:93bb with SMTP id a1-20020a0562140c2100b004ad075e93bbmr48751232qvd.27.1667861812030;
        Mon, 07 Nov 2022 14:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667861812; cv=none;
        d=google.com; s=arc-20160816;
        b=cECFhQt3VI5ESBZK3uHRDnGpxFN8AZM57JOZusV9Nhc41qcNTqXq1Z35vsJs+kYNqz
         /wdpucCS5GfSmG88wBqKLv/Qq36p/k6Xfs2himTYirbhsgnNLMqkQHg3mZVqrNauTWQt
         lweE4AGtzlJsBET6d35mI2hQBSx6fWhbG4Fjd7Vcv0RDXVKZq3i+7JgBO+OhotpSCMUA
         b4UgxpZzQV6g0Gg6u5nowJzIpikUl+o2jizuwdlIsd/F0IVpVAji1suU4stsZevvYyWb
         B+cOP1O1k3Xo0+59YTiJpXfFZxDDPHrcltYKcJyD8wIs/cqtmeIrDmgtn3CHSk6zqepp
         vKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
        b=CYjkVwcjQ9rOl5fgW9a5BiQQAxfAlebR3zbo5oe/5zvkBIZVKXtstquczOlZG0kwGn
         Avb/zn52S5V3ZbUtjuNAqTsuX7TJVmiAUldX1uwyTzQkwiYoE9Lzsv3mYdj6EQERRW2D
         Nvn2zh6aaMdpRNXyiY1ti4HsIJ5sjeIqaTUlWQv1RMfaWnaPSV2+fdyoDn08mPz3Anq3
         Am211cVXqX3qzJIOBNDDpP48sUlZHTPY8RsZ3pcHQ5xsQekNYJzoSwjJJFXfhlZMMxlw
         Ri17FRgWjOUP5YwMPpVkW2p8nUMBhQmj0Jv+Y/NkcL4XVAwA4PqlnnMjMnRsWBbAxVet
         +Yuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DfJye0pJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq6-20020ad45fc6000000b004b3e2fa07edsi5374925qvb.32.2022.11.07.14.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 14:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DfJye0pJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1osAzo-0005KM-4g; Mon, 07 Nov 2022 17:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAze-0005EO-Ga
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 17:53:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzQ-0000ZN-KC
 for qemu-arm@nongnu.org; Mon, 07 Nov 2022 17:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
 b=DfJye0pJItj2rhbMs+5JGePGWjEvjKii48aGkPZ/10XkForNudwUiiLJ2nQgluBkH8sdqE
 Fu/Tmyt+qjUIrnCpk+tB4TN5IGM1S3FTAr947g2KIFnfIDbRkXfrRK1Q7IDiPaY+sxs+Hj
 4WNnWf66THHMLfFAc4wfdoaSbIqV9/g=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-3YqfK7AuMtqewFYZuKybhg-1; Mon, 07 Nov 2022 17:53:11 -0500
X-MC-Unique: 3YqfK7AuMtqewFYZuKybhg-1
Received: by mail-qt1-f197.google.com with SMTP id
 ay12-20020a05622a228c00b003a52bd33749so9027087qtb.8
 for <qemu-arm@nongnu.org>; Mon, 07 Nov 2022 14:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
 b=qo94knsWX1xQCl3n0TRh/cF/2MxTiGBDdiN0SoHwKH8RzcY3TbTDgDqUSFUzJFIXBN
 LX+Sq8c98ODkQmOLpt9Q7uuAwxoftz2KlNTNnpQKS9c6IlVf3/ahD8I5uT7TC6LSOD14
 tXdTr4F7Yt8UngsKzCndlpxM4VpGgN/+OngqhyjaZSymxSX2dU4TGqOuQHpSi78Vk8SQ
 PP4sLr2yWx3qZVrytAPFkzDrz5Rm5m1QGgXkOlQhzzEI980cFZLNHFlZqOmGo5bbsdq7
 kdi45N6ybsU3KMJ0lyVyCzmUZ4WLF8kH61fqy/IsSrsq9S3W3mqMAorjkQDD9B7qSgVx
 hM0A==
X-Gm-Message-State: ACrzQf00jMbIrLdHYC26eCvy+e3F8ZYdJSi2Kews669tTEUHlLYo2jgf
 hm+ICAqCnwtxTqMQu3rsU4piqdUd0VN0d9Qt5cNZo72gdCDRZh69ZM4yc5HdUW+5K+0Gs12SvJZ
 MyWbv12GlzcgR
X-Received: by 2002:ac8:4d0e:0:b0:3a5:17fe:aa58 with SMTP id
 w14-20020ac84d0e000000b003a517feaa58mr788103qtv.355.1667861590680; 
 Mon, 07 Nov 2022 14:53:10 -0800 (PST)
X-Received: by 2002:ac8:4d0e:0:b0:3a5:17fe:aa58 with SMTP id
 w14-20020ac84d0e000000b003a517feaa58mr788100qtv.355.1667861590437; 
 Mon, 07 Nov 2022 14:53:10 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 bp30-20020a05622a1b9e00b003a50248b89esm7055626qtb.26.2022.11.07.14.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:53:10 -0800 (PST)
Date: Mon, 7 Nov 2022 17:53:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ani Sinha <ani@anisinha.ca>, qemu-arm@nongnu.org
Subject: [PULL v4 67/83] hw/arm/virt: Enable HMAT on arm virt machine
Message-ID: <20221107224600.934080-68-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: fo+MHNhpjy8+

From: Xiang Chen <chenxiang66@hisilicon.com>

Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221027100037.251-7-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index da9e41e72b..4156111d49 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -42,6 +42,7 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
+#include "hw/acpi/hmat.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
@@ -987,6 +988,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
             build_slit(tables_blob, tables->linker, ms, vms->oem_id,
                        vms->oem_table_id);
         }
+
+        if (ms->numa_state->hmat_enabled) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_hmat(tables_blob, tables->linker, ms->numa_state,
+                       vms->oem_id, vms->oem_table_id);
+        }
     }
 
     if (ms->nvdimms_state->is_enabled) {
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 15fa79afd3..17fcde8e1c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -30,6 +30,7 @@ config ARM_VIRT
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
+    select ACPI_HMAT
 
 config CHEETAH
     bool
-- 
MST

