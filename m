Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1116184lff;
        Tue, 10 Aug 2021 01:48:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJSIYc48JcgPeTT/mmZ6cxq83o12zORYtAKJFlS+1w7ntwB0HBDY/xoVvO6sHDVSuTgvdf
X-Received: by 2002:a05:6638:3889:: with SMTP id b9mr26315606jav.83.1628585333522;
        Tue, 10 Aug 2021 01:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628585333; cv=none;
        d=google.com; s=arc-20160816;
        b=lFWtJCfeUNCynpbZxkygOV31TNocJuPfdyFxFLIcIRB+nvG3ZFthEZldl5Q/udzJxE
         /TkR/DBDZC3LJ645Lt9Wdy+WZhgqDJD1epoTFAEkjM1DaygVrpuwdtwUdgNebPAL4lex
         vSOAhmBCpsFtSFOHkPBC1dx2qjwl/8+AG8TKd4p9zzBztUtYJY/PjInghmL1psG90NNf
         NyGkXtw5Lmv6OJG7Cf3V+dBXZ3vIdckTfLn7F97lh7QU7ZBWlecBMHwm4cgzRm8n182s
         Z4JQHF78rH2q8vSPIdz6f2QGDpTs7XtKTvbHdb1gNtXBh1ryZXyTeUwToGeUdd3GyQIS
         EGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=a03XgQNkFMPjBL/zvIBVfYCJefW6jvTdpIcqSkUY9rI=;
        b=lXkZXbrxkqx6I2p8LsiB6eRhIaPcTFtSHuGzabAav9w3fM0ygDT/x4GNUX1A+1y0FA
         RxQrbp4l+al7gAnatiwU79QfP8Bh8I3K3D+toTh7RqBFDPWFcWQW50YACNAorwcg0TOn
         KD5wON5szNmwbx+30waKsTBMWJ2A13y+U1/ZpkkHNaLBzoBL7p6XGlNZESgcGDavNKrs
         rhMh2ynfFzq/SxSUIUkAOTsH3pTLUJJRMB70Yb7w6Fi+NBXmS60Pojca+Pb5zIe3XF5H
         X1SWyMvNkjHHQluYtEl5FjsMSnlKz93N9B4Mzm3aUnYWs04uFFqBml4oPKXhz4tXpoSJ
         Zfeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u1e5c0Sk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22si20311930iow.33.2021.08.10.01.48.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 01:48:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u1e5c0Sk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDNRM-0004JO-PY
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 04:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPJ-0006Uj-G3
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 04:46:45 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:36567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPI-00083w-02
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 04:46:45 -0400
Received: by mail-ed1-x52f.google.com with SMTP id b7so29126716edu.3
 for <qemu-arm@nongnu.org>; Tue, 10 Aug 2021 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a03XgQNkFMPjBL/zvIBVfYCJefW6jvTdpIcqSkUY9rI=;
 b=u1e5c0Sk3pIOVi1F9DI9SZVYO4dUSulXZ81wo6KgFlZA7aJlfITm5Eru4O7myZ8xEn
 czUTu6hJ5Sy8a+HuZAGdn2CbOLXEJ+30wvgwJaUwObGiOZVGwV5nxbLAYqT1n6BddoUq
 J8+534SSeeINaLRkj7+hxWe58EWwZ5gjpMzxtkkAjcao0ds8ziQEq+cWhyw5aXe5k1oz
 T+W9d8fMzAuN0ZSsmd86+kFpt83jcm3mJiPeUlgL1QCEV2yKFZ3u38JEEmtcGgtA4wpY
 pESnSWHe/60wuRThjkDeIRjwstFgfVjp+EkoZXBGKiUSZRem23yVnkuLtCw2gEysGNuA
 xv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a03XgQNkFMPjBL/zvIBVfYCJefW6jvTdpIcqSkUY9rI=;
 b=T9y89c35HTFYNkSm2dwGUTxE4n9H5A80TnW/LJBWZQQfLtWvoLuyoDOi7tLODaFUNC
 GYml0dV6ux5PuzBki8nWC1wIymaoA2noT/2XZfdmPuHiCKMLYgfgdtuhA5axAKkTOySv
 GIhgxto4B2c9VMG0xoQVXC+m4ffKZyvva6Ae4uxB8CSv4vqPvyzFjHTCpz+j2ETyqBiH
 rFz77dhiQbSnAwkDFd8YbLGmnlFUDGJq0nBJFniKtYVYPcSfKCUw8B+EcEGhu62GuGMN
 pM5+IxBf36bSRh9N1Nxb/s5eWoi9qY+y8CpmygMq26t/p/LQ9iJ5gswJnOis/TOTFLUI
 Abgg==
X-Gm-Message-State: AOAM533l8TCkKSguT/Ju3o4xAV0i98Jx/o1lrfKnENInCtIb/ovUrCLT
 yQXmCkN8hKniT+ZD1Qriwr9QlQ==
X-Received: by 2002:a05:6402:619:: with SMTP id
 n25mr3645198edv.243.1628585202531; 
 Tue, 10 Aug 2021 01:46:42 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id fl2sm1533516ejc.114.2021.08.10.01.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:46:42 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 3/6] hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
Date: Tue, 10 Aug 2021 10:45:03 +0200
Message-Id: <20210810084505.2257983-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810084505.2257983-1-jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BBKLMKFB1wf1

When a virtio-iommu is instantiated, describe it using the ACPI VIOT
table.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 037cc1fd82..e2fa677d80 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -55,6 +55,7 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
+#include "hw/acpi/viot.h"
 
 #define ARM_SPI_BASE 32
 
@@ -849,6 +850,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     }
 #endif
 
+    if (vms->iommu == VIRT_IOMMU_VIRTIO) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(tables_blob, tables->linker, vms->virtio_iommu_bdf,
+                   vms->oem_id, vms->oem_table_id);
+    }
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4ba0aca067..7da0422446 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -29,6 +29,7 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_NVDIMM
     select ACPI_APEI
+    select ACPI_VIOT
 
 config CHEETAH
     bool
-- 
2.32.0

