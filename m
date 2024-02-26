Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1911809ejf;
        Mon, 26 Feb 2024 00:07:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXaMPWKkxBIel8d37FG/A7M7wCz9z1OoRg+QBoH4UtZ94+1NBEtD9rtDioUOc2gj1iakodNHjSLWW9j+BxYyNs+AIDf9i1J
X-Google-Smtp-Source: AGHT+IGiTDaFDWiCWP+Uirp7+J7ISF/0aZxOSsMbjRioc52c6rz5Y1dBw0Cm/BEPwWJvuGJNffqS
X-Received: by 2002:a0c:f38c:0:b0:68f:2a2b:c6e5 with SMTP id i12-20020a0cf38c000000b0068f2a2bc6e5mr8774751qvk.31.1708934863429;
        Mon, 26 Feb 2024 00:07:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708934863; cv=none;
        d=google.com; s=arc-20160816;
        b=tcOC3ww0SwUcQsQQQ7WPooLDQSPftaUmIhtU632BU7317cZ6rKqITA23bCATNRhIt9
         SLJgRDGircjyT/CnbAWlmW9f/dYvpKeLuz3qxfLjtarc3XIzo4yxI1DvunvpjuCxlIUw
         nVcQrc/IVePIvaFTH/93+768Du1Dti4E1wOsRleUN7YSHrFACwzjlz3fUjv/Mh3GfBoW
         Nq4K1A2NYqHg2ZGDsHF0a8QK5ZW6/Zu5xs73tBlxDfetoRq5nV4hXImA5Wf7NWFNYkim
         TB9K7YQMll4h3DvGNtZ0Ai9jmDvkXxtvfYhBwN70d3Rw6uUEIfQF/CJUQPbEovNMXjPf
         /5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cNMtYfnXorOc38D7J1SGsfvj3HH829VNJ1q+mi/Zf5o=;
        fh=mjuSup+hwjtLXqK/ySKb9Dbl7jNMbqLUaLLXZTKGB0M=;
        b=qRZYTJjIHnrDCNIqp7TFrG/LV+jhfjjzO5v0rN4j5E9cxcmzogpb4P3Kv/3SrY54Bl
         +5LmErPE1fxchJRk3O9x0noeShBVWij/ZCZd9NkfUmLPv68uq1b9xMVEL6xnTPGuzPxU
         EH+RWdbkPfMGxhsjpB/vEKPT2IH5+JXP+NKxKqRDcRW6eCNBc33uLrAycrQCiFA3wCcQ
         I4krmcy7vyg0++MJZzSWe7a6MCCghI9zCu5PSXiGeUFTkzh2ibwwWzCb7HM93j5ECZNf
         YZtLCOGdndqb0BzJCU3Nm3dsSB6AsS/7vk3kq70CrqJNVN6PP3bUTRQ+BSDmtGEwrGF8
         vjWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxJVzfBE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a0562140cc400b0068f51dc06f1si4756511qvx.450.2024.02.26.00.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 00:07:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxJVzfBE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1reW0u-0004jx-C7; Mon, 26 Feb 2024 03:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW0t-0004io-G5
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 03:07:03 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW0q-0001e9-Bt
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 03:07:03 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d228a132acso35826211fa.0
 for <qemu-devel@nongnu.org>; Mon, 26 Feb 2024 00:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708934818; x=1709539618; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cNMtYfnXorOc38D7J1SGsfvj3HH829VNJ1q+mi/Zf5o=;
 b=zxJVzfBEvmeoiFyzksIXXkqZybYc4zfiBk2veMJuCC5uCWmFATJXsHOQfpDFyapxfA
 3sH7M1IvlUYj3QvhDBxvN9vw4m56xOn8K9KetbFSlXEoEhR7e79A2ndGSdC5F5mo0jyy
 m4fRoY3RodY4BP/7vEs7z4UVobR4xldTBCJEGhCOiG1N6qDzXxq1xt4tgY5dyqqF54v/
 ZQAynzL78kEI0ZhBiJNQJzzq3HaefJANFJWfMtDd2yQeex/71kaxitF2IzsXZXQAWWTE
 1u7tdabiJ3krDYx5NcTixiW88Z7lNKNZ/Xj5F7Ig1twBf9XJFRR7zM+WJD3nzY5ErvO7
 3SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708934818; x=1709539618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cNMtYfnXorOc38D7J1SGsfvj3HH829VNJ1q+mi/Zf5o=;
 b=KvenQiOzjq59OjBmlf7TcbFhQvweMT9H15LTZuPFxrmDHK9tNL8gptWGm/7IAKFtQ6
 0/6JvnV9lBFoTqfwsiqst5PmaLMCSrWI/75oVQtYyaXJKS9n2kmftgIcIEBA8O05C2mU
 klaERIIykXMJ83ohMRUVjaBHvjBxmm+ZXvSDifzA3XYDbUsEP6OxwD6cF74ZOn847idr
 E4BjTZKnsDmWtMFiK4tKKpT/KBgH0QfrieyKcVhjtANk2BhUPoTUS9kUZ67Z3JIYXrG2
 gTT784QscRgVkMigjsSH0SE3EkhHWwQ2SBeCZR4BCgloDvakJKsH2CkZGYx8FLDYSej1
 /WyQ==
X-Gm-Message-State: AOJu0YxAeOnpu7cfL+Root+0ag0k7r+6yGcTcJ5NfzNYD9UC5aOoKowv
 7FD3wDR89Aq8XVhEQYPk3fkhhLnpYNOQYsLNMNJxYzHies1AGnx9KaO3T+WGkUeJvEr4tQ2hUq/
 /
X-Received: by 2002:a05:6512:acc:b0:512:f892:7f0c with SMTP id
 n12-20020a0565120acc00b00512f8927f0cmr1980949lfu.38.1708934818267; 
 Mon, 26 Feb 2024 00:06:58 -0800 (PST)
Received: from m1x-phil.lan ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 d20-20020ac25454000000b0051300b6a1casm85182lfn.84.2024.02.26.00.06.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Feb 2024 00:06:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-block@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 3/3] hw/ide: Include 'ide_internal.h' from current path
Date: Mon, 26 Feb 2024 09:06:31 +0100
Message-ID: <20240226080632.9596-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240226080632.9596-1-philmd@linaro.org>
References: <20240226080632.9596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XLfs83MJehTo

Rename "internal.h" as "ide_internal.h", and include
it via its relative local path, instead of absolute
to the project root path.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ahci_internal.h                | 2 +-
 hw/ide/{internal.h => ide-internal.h} | 0
 hw/ide/ahci.c                         | 2 +-
 hw/ide/atapi.c                        | 2 +-
 hw/ide/cmd646.c                       | 2 +-
 hw/ide/core.c                         | 2 +-
 hw/ide/ide-bus.c                      | 2 +-
 hw/ide/ide-dev.c                      | 2 +-
 hw/ide/ioport.c                       | 2 +-
 hw/ide/isa.c                          | 2 +-
 hw/ide/macio.c                        | 2 +-
 hw/ide/microdrive.c                   | 2 +-
 hw/ide/mmio.c                         | 2 +-
 hw/ide/pci.c                          | 2 +-
 hw/ide/piix.c                         | 2 +-
 hw/ide/sii3112.c                      | 2 +-
 hw/ide/via.c                          | 2 +-
 17 files changed, 16 insertions(+), 16 deletions(-)
 rename hw/ide/{internal.h => ide-internal.h} (100%)

diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index 4e13329bb2..7e63ea2310 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -25,8 +25,8 @@
 #define HW_IDE_AHCI_INTERNAL_H
 
 #include "hw/ide/ahci.h"
-#include "hw/ide/internal.h"
 #include "hw/pci/pci_device.h"
+#include "ide-internal.h"
 
 #define AHCI_MEM_BAR_SIZE         0x1000
 #define AHCI_MAX_PORTS            32
diff --git a/hw/ide/internal.h b/hw/ide/ide-internal.h
similarity index 100%
rename from hw/ide/internal.h
rename to hw/ide/ide-internal.h
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 54c9685495..b8123bc73d 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -34,11 +34,11 @@
 #include "qemu/module.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/dma.h"
-#include "hw/ide/internal.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci-pci.h"
 #include "hw/ide/ahci-sysbus.h"
 #include "ahci_internal.h"
+#include "ide-internal.h"
 
 #include "trace.h"
 
diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index dcc39df9a4..73ec373184 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -24,10 +24,10 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/ide/internal.h"
 #include "hw/scsi/scsi.h"
 #include "sysemu/block-backend.h"
 #include "scsi/constants.h"
+#include "ide-internal.h"
 #include "trace.h"
 
 #define ATAPI_SECTOR_BITS (2 + BDRV_SECTOR_BITS)
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 23d213ff01..8cebd1b63d 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -33,7 +33,7 @@
 #include "sysemu/reset.h"
 
 #include "hw/ide/pci.h"
-#include "hw/ide/internal.h"
+#include "ide-internal.h"
 #include "trace.h"
 
 /* CMD646 specific */
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 9c4a812902..130c4d8865 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -41,7 +41,7 @@
 #include "qemu/cutils.h"
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
-#include "hw/ide/internal.h"
+#include "ide-internal.h"
 #include "trace.h"
 
 /* These values were based on a Seagate ST3500418AS but have been modified
diff --git a/hw/ide/ide-bus.c b/hw/ide/ide-bus.c
index 57fe67b29c..37d003dd9a 100644
--- a/hw/ide/ide-bus.c
+++ b/hw/ide/ide-bus.c
@@ -21,10 +21,10 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
-#include "hw/ide/internal.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/runstate.h"
+#include "ide-internal.h"
 
 static char *idebus_get_fw_dev_path(DeviceState *dev);
 static void idebus_unrealize(BusState *qdev);
diff --git a/hw/ide/ide-dev.c b/hw/ide/ide-dev.c
index c8e2033469..799bd4b6ec 100644
--- a/hw/ide/ide-dev.c
+++ b/hw/ide/ide-dev.c
@@ -23,11 +23,11 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "hw/ide/ide-dev.h"
-#include "hw/ide/internal.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
 #include "qapi/visitor.h"
+#include "ide-internal.h"
 
 static Property ide_props[] = {
     DEFINE_PROP_UINT32("unit", IDEDevice, unit, -1),
diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index 0b283ac783..a2f457f0bd 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -25,7 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
-#include "hw/ide/internal.h"
+#include "ide-internal.h"
 #include "trace.h"
 
 int ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index cc865c83dc..934c45887c 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -32,8 +32,8 @@
 #include "sysemu/dma.h"
 
 #include "hw/ide/isa.h"
-#include "hw/ide/internal.h"
 #include "qom/object.h"
+#include "ide-internal.h"
 
 /***********************************************************/
 /* ISA IDE definitions */
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 0d2c6ba910..aca90d04f0 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -33,7 +33,7 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/dma.h"
 
-#include "hw/ide/internal.h"
+#include "ide-internal.h"
 
 /* debug MACIO */
 // #define DEBUG_MACIO
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index a7f415f0fc..3bb152b5d3 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -31,8 +31,8 @@
 #include "sysemu/dma.h"
 #include "hw/irq.h"
 
-#include "hw/ide/internal.h"
 #include "qom/object.h"
+#include "ide-internal.h"
 
 #define TYPE_MICRODRIVE "microdrive"
 OBJECT_DECLARE_SIMPLE_TYPE(MicroDriveState, MICRODRIVE)
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index e8f41c0610..8736281305 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -30,8 +30,8 @@
 #include "sysemu/dma.h"
 
 #include "hw/ide/mmio.h"
-#include "hw/ide/internal.h"
 #include "hw/qdev-properties.h"
+#include "ide-internal.h"
 
 /***********************************************************/
 /* MMIO based ide port
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 73efeec7f4..4675d079a1 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -30,8 +30,8 @@
 #include "sysemu/dma.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
-#include "hw/ide/internal.h"
 #include "hw/ide/pci.h"
+#include "ide-internal.h"
 #include "trace.h"
 
 #define BMDMA_PAGE_SIZE 4096
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 1773a068c3..80efc633d3 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -30,9 +30,9 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/pci/pci.h"
-#include "hw/ide/internal.h"
 #include "hw/ide/piix.h"
 #include "hw/ide/pci.h"
+#include "ide-internal.h"
 #include "trace.h"
 
 static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 321b9e46a1..af17384ff2 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -13,11 +13,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/ide/internal.h"
 #include "hw/ide/pci.h"
 #include "qemu/module.h"
 #include "trace.h"
 #include "qom/object.h"
+#include "ide-internal.h"
 
 #define TYPE_SII3112_PCI "sii3112"
 OBJECT_DECLARE_SIMPLE_TYPE(SiI3112PCIState, SII3112_PCI)
diff --git a/hw/ide/via.c b/hw/ide/via.c
index cf151e70ec..a32f56b0e7 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -25,7 +25,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/ide/internal.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
@@ -34,6 +33,7 @@
 #include "hw/isa/vt82c686.h"
 #include "hw/ide/pci.h"
 #include "hw/irq.h"
+#include "ide-internal.h"
 #include "trace.h"
 
 static uint64_t bmdma_read(void *opaque, hwaddr addr,
-- 
2.41.0

