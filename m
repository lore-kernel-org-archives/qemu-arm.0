Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp688683njb;
        Tue, 13 May 2025 10:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUv803DL8SnHqM9a6ZXA1jy6BOx07JRnNaY8+ugWYdf0snsaK4lPgm+bNwdfgC4l5vTAHwPob/owrpB3A==@linaro.org
X-Google-Smtp-Source: AGHT+IHu0E5fMuQ3QMEDCg2+jE/eW0evn+PwYAtUWn4S0pPEjSQsom4V08qTz18aQVQ4Mr2aU9oo
X-Received: by 2002:a05:622a:5815:b0:47a:e482:2eae with SMTP id d75a77b69052e-49495cca896mr5860591cf.31.1747158536235;
        Tue, 13 May 2025 10:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158536; cv=none;
        d=google.com; s=arc-20240605;
        b=Ae1l8OHL2oi4n68FIJW/bsq4Xgi+86mtF97tWmYBemiZFBPKqTKEX5obvh9ylPfwZo
         zHJCu3zonw6nnh88eI5jFGWE+fNwh1uisHPzs3EkJZHA0ga7VcUNO4A2x1uDL5TCFooK
         bfrqxMkmxHkz7tvqvJQhRiEZtxVz7P4TpwZQvklO8y04mREal/BN26aZEqLAB0BDJDrM
         66e7//DhKdHB8WLTq8OrkEFTIaN3tyR3Ij8macpQAU/kGUcazSWfc8RRjIiPoiFw4dtH
         AGakRhppuMOZX4YANERs12d0EHhXXpRiGgz+3KvBXKJM4yM2TN7ftCtBHmK32a9lZ6Br
         Zhsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=neloj2ajHaqhmJKWG5e1yATLyBo4rGwFX0cyyLIOZTY=;
        fh=WTgO2+h2ajIVWbN2+yyS3Aa187R+LuckKr5xjTV0+Qg=;
        b=DvtIW9y7ymPc5eYrFFWs3vKPE5HGt80cjTJ/Ilcv08RXrM36vMzLUdQY2hjXYMgDfq
         K77HiZ6EmBiF+f9SR0XL50h8tHcr4b/kXIBbzBwQV5YZDViEQa7G4s7RyRFA+j+6spdr
         Sc/WPY9rQeZaQXAhIJ3vGYXRdXexuEXQlTysyxHz4zZQnXFR1fiDWQRh+4wzaKL+FJ0q
         PWXR4n4eY+ZsQQR1wdaLu5HFJbu1LLHGBsk3BAKaZzvATuPS3CDSH51lq7LYi5JgnJW/
         r3iwqaPafaxsks/zxiXZCvUs5PGMZWyIuerNqprye10L2NnC0T+mTBKEMEwmUMSR6EJE
         y0Eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bfREviDu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945257ef24si115326831cf.356.2025.05.13.10.48.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bfREviDu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtkF-0001mR-JO; Tue, 13 May 2025 13:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcS-0000bp-Fd
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:44 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcP-0003QU-Om
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:44 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so66564325e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158040; x=1747762840; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=neloj2ajHaqhmJKWG5e1yATLyBo4rGwFX0cyyLIOZTY=;
 b=bfREviDu+0i//TdpfEOa3kEuqEgEEx92hYoR+mTs7hADq8ebbP/bN+EmmLIXxnDC/+
 E43p1ZlXPdpjwKQUY7HlQoo4rMa94XTJ67fSk9VTDmmNcdWKueIrrS9nA0y8zEKTCIxq
 iMt9xtGZrwu+PS6PXehK5M+7fyEBGq9Tk1ycO5w3Zfs0irEjsi1SAPIq7UZaLPEvjOY8
 UOLmFcRbNx2LLcq2/H5sc96NVNPfcQ7kdMQRRcw51TmBbaPPUwW306INPTzQPG7Z4ba5
 ftloINI86oMffxfPes+AjPKAG3zucXBoHxzIQyJc3fJsBtd8/f8mU0GkLQWH3ZipA0X6
 FWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158040; x=1747762840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=neloj2ajHaqhmJKWG5e1yATLyBo4rGwFX0cyyLIOZTY=;
 b=wDJRUwVKnzXWDdiLxpQ710gk9OjlZjQZW7x3SrpLF0xuOXjcGnWUC9IfnrZZiaxy/a
 AUGcosTuwtPwKv1LfIfdIWZkEy5ZSkskMNPAYdnNlsWBPuuF+AnPDwxLT2rNogqTTgom
 6vVxRLxsxw1LPh5k46RqcD5IkAJw74DobEM2c8Fxf999ZUMtLrzmF0yXzj69ohBOxEQm
 /VHYzjCV2jsqWFdFiS4/rtxnlGT5a22XlrOuolEuBwR++HhRb3KcdqR0xVQ2jW4oeJDZ
 kC8FPiaa1Sy6Ss9pr5I+xJmrkcgJhxr6qWNkK+P/ta2FzErz7ajq+y7auEmwts5KPgBN
 J5lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaTCRQBUBaX2RWvBQBpYhpWpO+ulUlAYsZQouLbhcbfzNliUT6ppG7MyIrl3lY0eIks/d2gQDWrQ==@nongnu.org
X-Gm-Message-State: AOJu0YyJIZb62+mJypZE+HIEho1atnNr2XWDPqokE+T7L71gKU0WzUoJ
 1yfEiqKO4B0aKQyjNFwTskA7JcMhq+Ez/bEsPjUB1zJBXkmJsrL0m5r84AoYIxA=
X-Gm-Gg: ASbGncvIM+I4woRhTXe6kujwK5HNzu2cIuHAVJkLF+YHFqSzRWzfUPbcQYhYonuNHgi
 TLXT6wTIj3ycX3yLHH/pUsu+3i4ekYnvDibh68rZSGc+JR1EdOUDkuNXka8qOTBLD5ulkd2Ks6Q
 x0z7G5W7TwqNmtBLfAWaD5LSEMj+KKZZL6KDNtfCSrb+R6ioxZ3JG8mDdenS2SebvyyxLFoncpa
 syIqTcgJRakr1LI9f4JFUfk9KW6c4ffsLBEOPlf2BCOSNNHZxZNJn998afQSZwgfeysc0q8EvQk
 wUUqz4TJXmYAdt9vXWdSOVpr6kE74UL/NDmKlMuRvsnzX28RR07a+RJ0J2I/7X6+eBois8usGvV
 vZHqhAwQ8gUM/oHnh9g+QvgKXozss
X-Received: by 2002:a05:600c:3e88:b0:43c:ec28:d31b with SMTP id
 5b1f17b1804b1-442f20db116mr2935415e9.10.1747158039949; 
 Tue, 13 May 2025 10:40:39 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67d5c09sm178270065e9.7.2025.05.13.10.40.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:40:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/19] target/arm: Extract PSCI definitions to 'psci.h'
Date: Tue, 13 May 2025 18:39:23 +0100
Message-ID: <20250513173928.77376-15-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 3SiGrnpzryzO

Extract PSCI definitions (which are not target specific)
to the new "target/arm/psci.h", so code from hw/arm/ can
use them without having to include the target specific
"cpu.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/hw/arm/boot.h      |  3 ++-
 target/arm/cpu.h           |  7 ++-----
 target/arm/psci.h          | 18 ++++++++++++++++++
 hw/arm/bananapi_m2u.c      |  1 +
 hw/arm/boot.c              |  1 +
 hw/arm/highbank.c          |  1 +
 hw/arm/imx8mp-evk.c        |  1 +
 hw/arm/mcimx6ul-evk.c      |  1 +
 hw/arm/mcimx7d-sabre.c     |  1 +
 hw/arm/orangepi.c          |  1 +
 hw/arm/sbsa-ref.c          |  1 +
 hw/arm/virt-acpi-build.c   |  1 +
 hw/arm/virt.c              |  1 +
 hw/arm/xlnx-versal-virt.c  |  1 +
 hw/arm/xlnx-zcu102.c       |  1 +
 hw/vmapple/vmapple.c       |  1 +
 target/arm/helper.c        |  1 +
 target/arm/hvf/hvf.c       |  1 +
 target/arm/tcg/op_helper.c |  1 +
 target/arm/tcg/psci.c      |  1 +
 20 files changed, 39 insertions(+), 6 deletions(-)
 create mode 100644 target/arm/psci.h

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index b12bf61ca81..648fdb88862 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -12,6 +12,7 @@
 #define HW_ARM_BOOT_H
 
 #include "target/arm/cpu-qom.h"
+//#include "target/arm/psci.h"
 #include "qemu/notify.h"
 
 typedef enum {
@@ -100,7 +101,7 @@ struct arm_boot_info {
      * as the conduit specifies calls should go to (eg guest firmware booted
      * to EL3) then PSCI will not be enabled.
      */
-    int psci_conduit;
+    int psci_conduit;//
     /* Used internally by arm_boot.c */
     int is_linux;
     hwaddr initrd_start;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b70c7a3ecd2..116745975fa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3098,11 +3098,8 @@ static inline bool bswap_code(bool sctlr_b)
 #endif
 }
 
-enum {
-    QEMU_PSCI_CONDUIT_DISABLED = 0,
-    QEMU_PSCI_CONDUIT_SMC = 1,
-    QEMU_PSCI_CONDUIT_HVC = 2,
-};
+void cpu_get_tb_cpu_state(CPUARMState *env, vaddr *pc,
+                          uint64_t *cs_base, uint32_t *flags);
 
 #ifndef CONFIG_USER_ONLY
 /* Return the address space index to use for a memory access */
diff --git a/target/arm/psci.h b/target/arm/psci.h
new file mode 100644
index 00000000000..8b868dfbb91
--- /dev/null
+++ b/target/arm/psci.h
@@ -0,0 +1,18 @@
+/*
+ * ARM Power State Coordination Interface (PSCI) definitions
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef TARGET_ARM_PSCI_H
+#define TARGET_ARM_PSCI_H
+
+enum {
+    QEMU_PSCI_CONDUIT_DISABLED = 0,
+    QEMU_PSCI_CONDUIT_SMC = 1,
+    QEMU_PSCI_CONDUIT_HVC = 2,
+};
+
+#endif
diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
index b750a575f72..61e01a38099 100644
--- a/hw/arm/bananapi_m2u.c
+++ b/hw/arm/bananapi_m2u.c
@@ -27,6 +27,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-r40.h"
 #include "hw/arm/boot.h"
+#include "target/arm/psci.h"
 
 static struct arm_boot_info bpim2u_binfo;
 
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 79afb51b8a5..b81a850819b 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -29,6 +29,7 @@
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "target/arm/psci.h"
 
 /* Kernel boot protocol is specified in the kernel docs
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 5b2719555af..0ce39877822 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -36,6 +36,7 @@
 #include "qemu/log.h"
 #include "qom/object.h"
 #include "target/arm/cpu-qom.h"
+#include "target/arm/psci.h"
 
 #define SMP_BOOT_ADDR           0x100
 #define SMP_BOOT_REG            0x40
diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
index b3082fa60d8..81fe0361ea7 100644
--- a/hw/arm/imx8mp-evk.c
+++ b/hw/arm/imx8mp-evk.c
@@ -15,6 +15,7 @@
 #include "system/qtest.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "target/arm/psci.h"
 #include <libfdt.h>
 
 static void imx8mp_evk_modify_dtb(const struct arm_boot_info *info, void *fdt)
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 86982cb0772..be5e50abf17 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -18,6 +18,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "system/qtest.h"
+#include "target/arm/psci.h"
 
 static void mcimx6ul_evk_init(MachineState *machine)
 {
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 33119610113..e0f25b92594 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -20,6 +20,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "system/qtest.h"
+#include "target/arm/psci.h"
 
 static void mcimx7d_sabre_init(MachineState *machine)
 {
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index e0956880d11..99037a09a36 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -26,6 +26,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-h3.h"
 #include "hw/arm/boot.h"
+#include "target/arm/psci.h"
 
 static struct arm_boot_info orangepi_binfo;
 
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 25ffb029ff4..d5ce15b688f 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -53,6 +53,7 @@
 #include "target/arm/cpu-qom.h"
 #include "target/arm/gtimer.h"
 #include "target/arm/multiprocessing.h"
+#include "target/arm/psci.h"
 
 #define RAMLIMIT_GB 8192
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7e8e0f0298d..20dc93fbc54 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -59,6 +59,7 @@
 #include "hw/acpi/viot.h"
 #include "hw/virtio/virtio-acpi.h"
 #include "target/arm/multiprocessing.h"
+#include "target/arm/psci.h"
 
 #define ARM_SPI_BASE 32
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9a6cd085a37..d110cb07943 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -79,6 +79,7 @@
 #include "target/arm/internals.h"
 #include "target/arm/multiprocessing.h"
 #include "target/arm/gtimer.h"
+#include "target/arm/psci.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/generic_event_device.h"
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index adadbb72902..7e1b93b782d 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -21,6 +21,7 @@
 #include "hw/arm/xlnx-versal.h"
 #include "hw/arm/boot.h"
 #include "target/arm/multiprocessing.h"
+#include "target/arm/psci.h"
 #include "qom/object.h"
 
 #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 14b6641a713..c46bf11ce24 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -26,6 +26,7 @@
 #include "qom/object.h"
 #include "net/can_emu.h"
 #include "audio/audio.h"
+#include "target/arm/psci.h"
 
 struct XlnxZCU102 {
     MachineState parent_obj;
diff --git a/hw/vmapple/vmapple.c b/hw/vmapple/vmapple.c
index 2dc5e15e791..b61f5ea51a4 100644
--- a/hw/vmapple/vmapple.c
+++ b/hw/vmapple/vmapple.c
@@ -53,6 +53,7 @@
 #include "system/system.h"
 #include "target/arm/gtimer.h"
 #include "target/arm/multiprocessing.h"
+#include "target/arm/psci.h"
 
 struct VMAppleMachineState {
     MachineState parent;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 76312102879..7859729c39f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -34,6 +34,7 @@
 #endif
 #include "cpregs.h"
 #include "target/arm/gtimer.h"
+#include "target/arm/psci.h"
 
 #define HELPER_H "tcg/helper.h"
 #include "exec/helper-proto.h.inc"
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 42258cc2d88..8fbd4c4be59 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -33,6 +33,7 @@
 #include "target/arm/internals.h"
 #include "target/arm/multiprocessing.h"
 #include "target/arm/gtimer.h"
+#include "target/arm/psci.h"
 #include "trace.h"
 #include "migration/vmstate.h"
 
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 073a8319fa5..e0f9c91450a 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -26,6 +26,7 @@
 #include "accel/tcg/cpu-ldst.h"
 #include "accel/tcg/probe.h"
 #include "target/arm/gtimer.h"
+#include "target/arm/psci.h"
 #include "cpregs.h"
 
 #define SIGNBIT (uint32_t)0x80000000
diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c
index cabed43e8a8..0313cdd6ba2 100644
--- a/target/arm/tcg/psci.c
+++ b/target/arm/tcg/psci.c
@@ -25,6 +25,7 @@
 #include "internals.h"
 #include "arm-powerctl.h"
 #include "target/arm/multiprocessing.h"
+#include "target/arm/psci.h"
 
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
-- 
2.47.1

