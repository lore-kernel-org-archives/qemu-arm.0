Received: by 2002:a17:505:4e90:b0:1be9:327d:8ee3 with SMTP id y16csp341297njx;
        Tue, 20 Aug 2024 07:30:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWEwCOuMSyyOOjw1lpOa6x64QPfy7er7kJ39E5VovsU9balQeP76kzc5p3h3KLKUQ/fmBNJr2wvFFdnA==@linaro.org
X-Received: by 2002:a05:6512:128b:b0:52e:9ecd:3465 with SMTP id 2adb3069b0e04-5331c6e4635mr9113111e87.57.1724164204375;
        Tue, 20 Aug 2024 07:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724164204; cv=none;
        d=google.com; s=arc-20160816;
        b=RDZ1ZzLe5sl7ikyYOMsAmzkezM52qZZmMkD6AifCGJ9BGxqZlI5F4fzUcwpXpxH9dd
         y9AcRnFcs4szIgHiCRMvsHBKSVlcNxlg/ermLS3a//fuuHWkOOT7imdY9s4fxJwiyHZf
         IKTZkoFkQ/lywbjeAl0LYk2DphPKDPpFgnDuuoDMRbG1pdDogzmD+uHNWuA4DRgndJbX
         3aMVIqPNT7V+ktz6dVh9BQ/HPdjSCBY/wW0FOXpLEUJ4YbRr8uyw+OLWotUVRbimTWyS
         v7FZVOwRpTNrgX/fddCZtVGIfD8vmMeKs8AlN1eWzLzFh+yFlqa2z+9EkQy7RBJa2NpC
         SPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P0gf4AWHulAzAV2HaIyUy+fKTdCex9KA7D9+c05rick=;
        fh=6QX88ed8J0z5ABbThEsDhzIJDvX/z3s76sbedieGI4k=;
        b=0GrO1G8jIa5SIs0i4jo3ZNMQMzu/uVNdeMSMv8vhOCObofgfXQBJCNWEYKCNSu6oeK
         ROmhi1U5VVaswAARcaq+7YesmU6SF+ERJD+yKuSQ+gphHLD+REpBOpS6WQVKokHUShOB
         +p5YhVjmT6KAvynPBHmdS1cOeqdk5WgV/RcdI/0KED8QssJuQDk5OaubHeFtJjTkqABm
         720MmLrknHJwHklFfBhP+S+Zq93qRzoiKSnZ4F41Am6CRsPRFbZSzXPY7rWLypMi9jl8
         EGqnrbv81LqiBKYiWelf9Ca5HFuArzUH/EE47eVzXOXoM7LEo0FD3MQ85WJ5g0DRdSTI
         zlYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AmUC6KMP;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5330d3e6854sor3227473e87.15.2024.08.20.07.30.04
        (Google Transport Security);
        Tue, 20 Aug 2024 07:30:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AmUC6KMP;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164204; x=1724769004; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0gf4AWHulAzAV2HaIyUy+fKTdCex9KA7D9+c05rick=;
        b=AmUC6KMPq4p0odABLD5wasUpLPs/H99vlpe075Zewml7t0gQGkx3t21AemHnVPQDKg
         EeHAE5mphSFUdSkTxQU+M9zA1EsmBAXrw9yXqUPBTS/JDJRb+i4g5pUBsJjHlUCzRHQl
         fpXl9JlZn4Bs03Qe9dG9gG3+MmzNf4f9ZP964dlIyTHsmesITjqou7qA/5xzZSP/smEa
         0wjg2RRVP41eibAEVRZCAHMNVnVHgS4JLT8nrfgE1M5N6IWBmg95irq8HxeuTqVOAQpn
         KTvoTp2KXXzw6OpLw0jNVOvozPzgDJtho8yLRJ+9Dwl5d1pJYAnxROKCJScppkEiPHQh
         h2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164204; x=1724769004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0gf4AWHulAzAV2HaIyUy+fKTdCex9KA7D9+c05rick=;
        b=pveTdMeWab9Cq/ZB+Qw1PJcnZkRLYNeFzhsq0vFrZDESLC4k9Mo0UarL0mPJt8Z/8x
         yHOfu3AXHZFeZ94voQ5Yy26reLIVU8ElUohMfDAdhjPiU2cRDdD2GsxMwP3gCthGZBsM
         b05IOxzNg5Q5reW0EI3eozPZV6oo57jp6vD3EDR3BqMXxWSgLLDxzMqO0u7vrzMBvRxy
         9u16wgc5B0b8l1E8zcMf/+jR0lN8Kek7SzC1KPiavkWMitsDvHSQIu718GWKETwRjVo8
         1Zui/BA5t7WD8XxY3ZHeHiiDd0DwZ835AsXw9dNEpsIw1sxa7mDyR52jczjgOILjlzZG
         c5GQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5PLAoHeHA8zFP7B4gfKd4rUCAQrG9sTKSy31xAUsGYq5WUquJyXOommc/SLoxDl/ZDQ8eALHNebHLuU7KtA==@linaro.org, AJvYcCWeZjS/r0BLah1CHxoQBEPzqDtOsDE1KW+RiBaTYUgHsqOFU0pydWjI1eE8uSze6JA0h28CIi0XMyzkDw==@linaro.org
X-Gm-Message-State: AOJu0Ywz3AG0opMc35lUGEVBYApsf0CxG0z6hHmsGw2VScn025IwMpl4
	fajCpIbEjw6/AFlXhhGahkIhSaLRk0U1fNUgiMzlEMQAcLv3Y9Og
X-Google-Smtp-Source: AGHT+IES1gNwxhhoBVLe4AixtVypdxMBk0O0dKwZ1tDvA9tVYLXBSnaAgHk6+BIt+ttxuzPWUzelPw==
X-Received: by 2002:a05:6512:2c98:b0:533:4191:fa47 with SMTP id 2adb3069b0e04-5334191fc44mr1624238e87.47.1724164203068;
        Tue, 20 Aug 2024 07:30:03 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d424725sm1790433e87.249.2024.08.20.07.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 07:30:02 -0700 (PDT)
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
Subject: [PATCH v2 06/12] hw/arm: xenpvh: Move stubbed functions to xen-stubs.c
Date: Tue, 20 Aug 2024 16:29:43 +0200
Message-ID: <20240820142949.533381-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mj1KFzbi/RG3

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
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
