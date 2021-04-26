Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4122178lfb;
        Mon, 26 Apr 2021 12:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE5ev8f/4XF4eCgQCFRtcMMgifnPdwoAjLUdIRGD+hP3OnXkYy/P17q/QVI9xGOGDua8+/
X-Received: by 2002:a6b:d213:: with SMTP id q19mr15690648iob.203.1619465957872;
        Mon, 26 Apr 2021 12:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619465957; cv=none;
        d=google.com; s=arc-20160816;
        b=mAYXK/okokf4+4G5hKnfvdrv0HIw0nJi1q/35mKb4pRzXD5HOxEGfFX2fGESwffGo7
         Et8Qmvxx6Qvvb3cSTYesfbePPiAFddVBfiKmZ7DpJTufuyb3gH1odrl+5Du2PDg7dCPm
         xRAOrnpoP8lS6PukhSPJt4tcLwO3SBd1aKPXh7qC12a19RQAw35oV24yQ0CyADr3P5Ww
         7k+ISANjEiEORsiwAGfXr1E3sRcC8m3ouU2hwv/FA04gsH0vb4ii4TP+K0A2wF9suPmu
         biY/yF419krcoSbpVLleOh9NTFLdWbXZb7KJfGKS4eTsKHdsKug/fLIMYERzOZ+d3sLW
         GJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/NBJrN/GlacMceBg1qLAcbh146RyM7XsMz2+vmFelAU=;
        b=Kye3/Ouaa4ChfSmbQz/XCNE/osH5LyaPj0HJWidAwCb+OOQjqk8oA4fAC18ctztvOx
         1JfW7S4eXwTIcepQzBOeeHJ+3Ixo6eRO7iXnQzYO7ikChtre+CvIuvE/nfc0aOB8/nZt
         qAXXNdwiYXi5GTtNq8d8E2RTdKYZ50cFX6Q8aL9cRpBBxxfH0qYGJTXkLB9iF+GNFKfs
         afqvaxT07HTzPtLm0WdSqdMGvnGbT1grmaL0oqMHuDNqnzqdjLCAzDwv6DtstdI9Rzdu
         SJxMEdPxUzRsGQ7aw54JGnetQXmO2YM46ZbNrdVzbqPMm/zEABcInXK2gUsk7FW7fH7u
         VX4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a7aVwo0p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20si20679748iow.68.2021.04.26.12.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 12:39:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a7aVwo0p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lb74f-0003tK-4o
	for alex.bennee@linaro.org; Mon, 26 Apr 2021 15:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71S-0000TQ-JV
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 15:35:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71Q-0000H6-8g
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 15:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NBJrN/GlacMceBg1qLAcbh146RyM7XsMz2+vmFelAU=;
 b=a7aVwo0pmpruDVLEI/jgxKi06uActu6hBFUVdUw7XP/zI0PoYpxTQvh7jSheaPbig52X7/
 1PBGOBfxnFbwBam2AVKP9W4KU5az+rRdnnNOCsSNp5BAHLaITuahMWC/hGZWA/czbD6zvc
 G9jHsxkrcya+TedVCysXtiogS2qOc7Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-fCjiyK1DPk6m7wnXFxbJNQ-1; Mon, 26 Apr 2021 15:35:53 -0400
X-MC-Unique: fCjiyK1DPk6m7wnXFxbJNQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 j16-20020adfd2100000b02901022328749eso19472690wrh.4
 for <qemu-arm@nongnu.org>; Mon, 26 Apr 2021 12:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/NBJrN/GlacMceBg1qLAcbh146RyM7XsMz2+vmFelAU=;
 b=L8Y6jj5LrqNudtl83jUOMyQPyycKTe/JmkZldv0IKAJUJJVL8zPSzZNQY1TjQ+o07g
 hspwhk0LzESxYQAWiCX5XA0ZXaX8qQ+OrJq/7Jk8Vsa5GXBS8p+yLYCdNPi+2ULBT4oG
 bML/hkmji+8oHEIuC7p+YGMoLBLPBQWvDNOoTRhdY1EefqXP90ojvabCp6EDS13f1UN3
 rYPfNfPs/zQHqVs9GiPUugQNUssIsMHx4UtgCwWkABB8VqddttXlU16w2j32wm/9PPVY
 Lf00MtmG+ygpgzzvGnvmaR8L3yR2W04xYl3T+TxhNjZQl7Gr47vXn7AwuxqWxen5Wo08
 XPXA==
X-Gm-Message-State: AOAM530i3xqJgyvHf7hVpif3fJsEhLvxAuLGamhBXZCNdILHjDAVD7j1
 +Yu5ymA+dvVQuQX811Ek23X79WMO5VKKqQ6CD2vDcbjgRkoobNOZWXX6RUTCbeExBSasRHmxh82
 lu01xxftg818N
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr5882919wrn.180.1619465751926; 
 Mon, 26 Apr 2021 12:35:51 -0700 (PDT)
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr5882895wrn.180.1619465751734; 
 Mon, 26 Apr 2021 12:35:51 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z66sm464116wmc.4.2021.04.26.12.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] hw/{arm,hppa,riscv}: Add fw_cfg arch-specific stub
Date: Mon, 26 Apr 2021 21:35:19 +0200
Message-Id: <20210426193520.4115528-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WeTWRztj+aaS

The ARM, HPPA and RISC-V architectures don't declare any fw_cfg
specific key. To simplify the buildsys machinery and allow building
QEMU without the fw_cfg device (in the next commit), first add a
per-architecture empty stub defining the fw_cfg_arch_key_name().

Update the MAINTAINERS section to cover the various target-specific
fw_cfg.c files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/fw_cfg.c      | 19 +++++++++++++++++++
 hw/hppa/fw_cfg.c     | 19 +++++++++++++++++++
 hw/riscv/fw_cfg.c    | 19 +++++++++++++++++++
 MAINTAINERS          |  2 +-
 hw/arm/meson.build   |  1 +
 hw/hppa/meson.build  |  1 +
 hw/riscv/meson.build |  1 +
 7 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/fw_cfg.c
 create mode 100644 hw/hppa/fw_cfg.c
 create mode 100644 hw/riscv/fw_cfg.c

diff --git a/hw/arm/fw_cfg.c b/hw/arm/fw_cfg.c
new file mode 100644
index 00000000000..de2bca9c76c
--- /dev/null
+++ b/hw/arm/fw_cfg.c
@@ -0,0 +1,19 @@
+/*
+ * QEMU fw_cfg helpers (ARM specific)
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/mips/fw_cfg.h"
+#include "hw/nvram/fw_cfg.h"
+
+const char *fw_cfg_arch_key_name(uint16_t key)
+{
+    return NULL;
+}
diff --git a/hw/hppa/fw_cfg.c b/hw/hppa/fw_cfg.c
new file mode 100644
index 00000000000..322b03068c7
--- /dev/null
+++ b/hw/hppa/fw_cfg.c
@@ -0,0 +1,19 @@
+/*
+ * QEMU fw_cfg helpers (HPPA specific)
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/mips/fw_cfg.h"
+#include "hw/nvram/fw_cfg.h"
+
+const char *fw_cfg_arch_key_name(uint16_t key)
+{
+    return NULL;
+}
diff --git a/hw/riscv/fw_cfg.c b/hw/riscv/fw_cfg.c
new file mode 100644
index 00000000000..8e3d2a8bdea
--- /dev/null
+++ b/hw/riscv/fw_cfg.c
@@ -0,0 +1,19 @@
+/*
+ * QEMU fw_cfg helpers (RISC-V specific)
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/mips/fw_cfg.h"
+#include "hw/nvram/fw_cfg.h"
+
+const char *fw_cfg_arch_key_name(uint16_t key)
+{
+    return NULL;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c59..ab8f030d4c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2162,7 +2162,7 @@ R: Laszlo Ersek <lersek@redhat.com>
 R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: docs/specs/fw_cfg.txt
-F: hw/nvram/fw_cfg*.c
+F: hw/*/fw_cfg*.c
 F: stubs/fw_cfg.c
 F: include/hw/nvram/fw_cfg.h
 F: include/standard-headers/linux/qemu_fw_cfg.h
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index be39117b9b6..fd278de916f 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,6 +1,7 @@
 arm_ss = ss.source_set()
 arm_ss.add(files('boot.c'), fdt)
 arm_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
+arm_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
diff --git a/hw/hppa/meson.build b/hw/hppa/meson.build
index 1deae83aee8..10494cc24b7 100644
--- a/hw/hppa/meson.build
+++ b/hw/hppa/meson.build
@@ -1,4 +1,5 @@
 hppa_ss = ss.source_set()
 hppa_ss.add(when: 'CONFIG_DINO', if_true: files('pci.c', 'machine.c', 'dino.c', 'lasi.c'))
+hppa_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
 
 hw_arch += {'hppa': hppa_ss}
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 275c0f7eb7c..ab4d3adb924 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -8,5 +8,6 @@
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
+riscv_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
 
 hw_arch += {'riscv': riscv_ss}
-- 
2.26.3

