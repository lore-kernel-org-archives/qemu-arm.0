Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp189263njb;
        Wed, 4 Sep 2024 09:15:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUggxsVQTDLJtZCjGrdSJapktD+I7uKTRYpS+3GmpSM1VZWVbV8ufGy85crTSEW0TzGDEe0VSicAX596Q==@linaro.org
X-Received: by 2002:a05:6512:3e1d:b0:530:ea2b:1a92 with SMTP id 2adb3069b0e04-53546b93fa8mr11330201e87.43.1725466550732;
        Wed, 04 Sep 2024 09:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725466550; cv=none;
        d=google.com; s=arc-20160816;
        b=jST86BIMpu6cSjRPIip9Lki6cMhBF3CX/YzdMJeaHxBX8N8nYudlqIaK3colQTRv5s
         5HHowkfA/8lr/faIDselPO/jBLHdTVIHZC9/fERrO+d/abYbxqLsM51i/6PqWbuZcfny
         iHkhgkhjvIw1aDzpLYPAiGMiGNBCq5KffzQRDXtVvnqB7tSztvDsd9RilrcCI+pSVcmN
         9y6JM3Fi+5IYbYW1QFjjYm6TL80IBdXNh7CdF26Ws7tvyaLqm+qkZwH/era362WlPk39
         h4XITqCY1yx/2smrVOgwet32DkpxpBe7P4nz8IBB+kSpozcNfAItDfRlu71pSml2jhYq
         K4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Je23wvBBopidSll9UpAaH5rZwvVBAj7ARc0Pm2/k3kk=;
        fh=Kha1G79GlTsgeRPJevgx6N24ZMNX+Q4q+Fk+r7313cI=;
        b=v5Ko5M5xm3N48K1pwJpt1wwhRzlUUH3xd3sULtUtfOwnA/wwbqlvU4FeEoI9zoTzi0
         twpOqBqbjzzlXqLeHhiVKQwFdRehDvRv/Zz18CQg7ujBB/fWmp3nMmEiOKZvuGQ0NjnH
         nl1DvlO/0094jbYX9pGBOWbmPkKOVwIWCyUwjokuo5zzKbMB0CEIjzGMN0K2Xz5dRMmj
         Fam0M0W4d8wY48VxXBmgFEDsIphMAnxphQ04ZoVTHNs8a9MQ7OXke986tgsKqCKCWlCx
         izsJhPJM/UiyggXuSLOyTsXcxKCHZnV/hbhgdoXtrxGNoi4Xo+frAA14l+1iwJrF/WWp
         eP5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="P/pWvBbs";
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-535407a96b3sor4640730e87.17.2024.09.04.09.15.50
        (Google Transport Security);
        Wed, 04 Sep 2024 09:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="P/pWvBbs";
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466550; x=1726071350; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Je23wvBBopidSll9UpAaH5rZwvVBAj7ARc0Pm2/k3kk=;
        b=P/pWvBbs6Bh15eMQczjtOkKyU0avVKAzqjdgsKJYqxiyqwz87WVdbqzmwWEArH8WUm
         Ix1/Bc3k+RdxxCguTLLGOiDRAupMdGJldUXqyTG0JLvrE5PXYzUCDYVmI1iLGJZaSWRf
         x3i0hO0eJWheVW8s4nXw2FlcApjtXqykvOyccNfhE9AVMbZXKK6wdcjjNrmqFhrVMjBI
         gad73+aNYqUj7nYDWus+VZ2Qymh8whI1T6UZdwoqwX32doBtGx4ANfRp8DE6+bWVEgIl
         JnvN2jCWzrSYv+JjybEchDh1PFp3zGsvrwqhJhJAVHbRSkMv24RYhjQpFFIeG3P3BBuV
         stKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466550; x=1726071350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Je23wvBBopidSll9UpAaH5rZwvVBAj7ARc0Pm2/k3kk=;
        b=QcKfkCPOJixB75Y8+dFsfded+m0byvlD2miF5Y7SH9AfZrNaepfqQ3M3SCPAGr36IR
         JJmYPLfeWvPcazEa2k1xSZe6f9Vvq9rkcnnhhUTpFumAHvqOXD7KaBi77ptnNGyTnhzh
         yPxbJSzgd2VnLz6u+1pVuFT2OgGeImXCsUrvHrLbzEVRE5RjL1i3k0ULe59bjeHVga3i
         ggd1FtlcKHsHD/hWproOlFUzGCq1U5r1ZlwSSIsBIGA0MrzhFXra8jMHGaHemA0h497W
         4qdf5eI87sAa3WEgaBzKJO5UHC+/MMX/VMciE8tF5dR7OqOf+774484jx4zESx+5bXVh
         qO2A==
X-Forwarded-Encrypted: i=1; AJvYcCWepwSqsFhiHXuhgHjWb3saJxcUvZlpkpSVA2UHcYdQ/Ru6X7MYzwhHQzHZgX8rfmSwQ3b7a2PHJ0+cpYOEXw==@linaro.org, AJvYcCX0DqC1JTSu0G+wzEbFENGxy+jAzwWDWEj+UZAUD33Cwsd4IVIsCJ2Re5IwYoZggSHyLthXBsVqlKMZiA==@linaro.org
X-Gm-Message-State: AOJu0YwtLGRg3IM0vIIw4rYoIQvYzTM62Ag5TUDhceKv7+Pb1DVSmBa8
	hE54PNobBYqw17aer3JlVoYJPHsEp1BDBGAHtfAlw5eC6hlWUwgwrdpDm2vZ
X-Google-Smtp-Source: AGHT+IFDpz1IZD0Qtgo2lbwg04ZmmoJdx9qSrR477CRxTjdjnUIVorw3NCNELME4Ae86vdZ9W6Lr1A==
X-Received: by 2002:a05:6512:3da9:b0:530:ae4a:58d0 with SMTP id 2adb3069b0e04-53546af3605mr12601930e87.8.1725466549784;
        Wed, 04 Sep 2024 09:15:49 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac380sm2378135e87.83.2024.09.04.09.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 09:15:48 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PULL v1 06/12] hw/arm: xenpvh: Move stubbed functions to xen-stubs.c
Date: Wed,  4 Sep 2024 18:15:30 +0200
Message-ID: <20240904161537.664189-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tToReHdyRGXB

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/meson.build |  5 ++++-
 hw/arm/xen-stubs.c | 32 ++++++++++++++++++++++++++++++++
 hw/arm/xen_arm.c   | 20 --------------------
 3 files changed, 36 insertions(+), 21 deletions(-)
 create mode 100644 hw/arm/xen-stubs.c

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 0c07ab522f..074612b40c 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -59,7 +59,10 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
-arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
+arm_ss.add(when: 'CONFIG_XEN', if_true: files(
+  'xen-stubs.c',
+  'xen_arm.c',
+))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
diff --git a/hw/arm/xen-stubs.c b/hw/arm/xen-stubs.c
new file mode 100644
index 0000000000..4ac6a56a96
--- /dev/null
+++ b/hw/arm/xen-stubs.c
@@ -0,0 +1,32 @@
+/*
+ * Stubs for unimplemented Xen functions for ARM.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/qapi-commands-migration.h"
+#include "hw/boards.h"
+#include "sysemu/sysemu.h"
+#include "hw/xen/xen-hvm-common.h"
+#include "hw/xen/arch_hvm.h"
+
+void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
+{
+    hw_error("Invalid ioreq type 0x%x\n", req->type);
+    return;
+}
+
+void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
+                         bool add)
+{
+}
+
+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
+{
+}
+
+void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
+{
+}
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 16b3f00992..f0868e7be5 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -115,26 +115,6 @@ static void xen_init_ram(MachineState *machine)
     memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
 }
 
-void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
-{
-    hw_error("Invalid ioreq type 0x%x\n", req->type);
-
-    return;
-}
-
-void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
-                         bool add)
-{
-}
-
-void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
-{
-}
-
-void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
-{
-}
-
 #ifdef CONFIG_TPM
 static void xen_enable_tpm(XenArmState *xam)
 {
-- 
2.43.0
