Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp398281njb;
        Thu, 5 Sep 2024 00:40:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7lgJjrx57VKW+x5U/RX3paToCMa7PE+ATLCbvRlVLdBZRLO2tOFg8PYX01JNlk5GLXS3eCINFd5y9Uw==@linaro.org
X-Google-Smtp-Source: AGHT+IFhiWF25Npsj1FLhlsv/qjJPRIRC072rw+7zuKXjorQAC8772ZIS+56Whx3eCSPIrtoHkZb
X-Received: by 2002:a05:6214:4888:b0:6c3:e231:960e with SMTP id 6a1803df08f44-6c3e23196b1mr124308616d6.17.1725522012769;
        Thu, 05 Sep 2024 00:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725522012; cv=none;
        d=google.com; s=arc-20240605;
        b=jQ/qj7paK5kG14vsAH71taSQqxxr4AzeHkgSMtsxHvNb911sImP6NpAigSCdfqU6DC
         t08GNDX4NYdpQWGW4M3NyKo58cJVOOJUwqGIJutMP35oCPeedwM6JYmEWzheqeIo5+ZM
         gsS6a/pPFi7m30tNat0HGKyw1JI0YoyrOiXH+27OTyn/Ru9KPuTDzeXSIYBwX/FmAW/B
         T7BDYrGdQGAVECFn6XCwt2r7q+5KQWrsxJd5KN8vg9lfVrO1iGvqM1PBW7xVJDldrxrA
         JMuPk07YamGxh+6/xcfd6u+gxtT0wJDEalqd0ZhmTg/l6MearG3FkHIyB0EXsfGNZ6CT
         1YrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pGdI/U/PjWTM08E05dTtCVP/LnbVSGVkfN+LQ9L0LVw=;
        fh=q78dM+Yqx7MO/IxRFfSgoegC1ZncBJMyDf8sTfaCOz0=;
        b=Cw1saXgeL6DmWK+S4v/jUTz3lCfHCVbQNGkp9t486Yb05/v+C5Cs0boGcUIdKEwseO
         wz3CIckZ4idMQzpwXKp7i0Z81Nh8vJeIwIj9a65oQo8ZUlweL7mZuEnFcPrT3xC/VRmf
         ezx6X1gxYWg3WB7GYyy70SJ9KGh5LQA1LnWFWGcwetEo7WscEZHVR1b5Fd4z7QtEDpG4
         BuPQEzX/GaM2eAJFeWIqCiwgFki5fw8jDRMhuoJpwAF4wWUQj+bLcdQJWLHkqxu6xon5
         /hxispHZgL7TlnKVPY07n6mPVhD2o+T10wbCCm0sGs07JjVC91BtLbZiaB2PcKePca/g
         PHSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="crWBHnd/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c5202daa1asi14297716d6.161.2024.09.05.00.40.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2024 00:40:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="crWBHnd/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sm74z-0006Mi-L4; Thu, 05 Sep 2024 03:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1sm74v-00065B-FF; Thu, 05 Sep 2024 03:38:53 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1sm74t-0001f1-6A; Thu, 05 Sep 2024 03:38:52 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2f64cc05564so4710241fa.2; 
 Thu, 05 Sep 2024 00:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725521927; x=1726126727; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pGdI/U/PjWTM08E05dTtCVP/LnbVSGVkfN+LQ9L0LVw=;
 b=crWBHnd/oKPMhk6QiwT4HJvpe1McJRBoj9+tLCogwh+j/RC82MIOjEEPIFTyESqCQR
 aeoSbkJvrl3Dd94d+R/7VILY31dcjjclhNScI57mmDSSr2eQxhopWtQSFVFzZmKJkNa4
 tNI2QOjd9UIemeGuv0eFr1hrkW4CjcCOMrzfdMJOxTAYXphZwiBoETCTugkxVzeibJuP
 XqUXSssE74S0TtSNguV3HDqbh2ncfzFkO6xK+HBvpk2NT8kgwpWIKm8OA20JpqnGpAf1
 uwDTSh7cO8wK9CQ97VFf8nx03FNXaoUwybHFvpfBfXknHFt8VBqklTA8UfDdr42JXPOY
 N/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725521927; x=1726126727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGdI/U/PjWTM08E05dTtCVP/LnbVSGVkfN+LQ9L0LVw=;
 b=M26ZLil3CCZHF/ENhsRpCrb1XGhUt8DjF1E9uSIFfQnofFCFIzF9zgxWiJEiyZgSXg
 kdSzsabz1/w/kUnIMrVvV92RMAJGImUWdXKlEZYWbNXdpx9F8i2qWGp2CTHfYzEuh5Sg
 P8O1D0e8som+Wqqrw/qfPmygT43rdVw7HFYRsYl5G5o3w10BzzdDkQFLlXfUFcW8Msu4
 mIXnwg3Mw04vFvqxDiKM4AfgnfBDYRrLdK73uukrCkk8sfrzrtz+HKLzd1Rka55Xo9st
 doBS0vqvlNVwIUhZaml3rNvwGsa6faEpDXOS+wTUnfTADQU2P16ma/eRxrNo5L48gc32
 rFlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPTomG4klL9vZ/DciusBUmRKYV0FocFE7pZW3y0LM3baaPnYvV4GzJXfgE5WOHyLfQaKK+PvuQu8g=@nongnu.org,
 AJvYcCW2RgK10/kCz0QHdh4ivvC302RTSEuf3QbqWJLbQVrlsZLFvJLGMtcc2wQMUPEXyyKzS++jhA+uBg==@nongnu.org,
 AJvYcCWaaBx7Cwb0d18hIg6U8Mqk2ANFX3clYXHlP+x/qoLIBW78WFRuzd9yX/c/9yXq5Kx4n8cKNBdPDn/3Nw==@nongnu.org
X-Gm-Message-State: AOJu0Yy9vpYY0AunxXYCB/XJFkU3teethcZ3GskDEAx9jUtrSJ2DEvql
 2gvagEym8y6steKhl95cE9JdXlBZJIVN3Vx/81A1szmYZ5CTHYRWGF46pA==
X-Received: by 2002:a2e:be09:0:b0:2f6:5c64:ccc3 with SMTP id
 38308e7fff4ca-2f65c64d01cmr27008101fa.16.1725521927105; 
 Thu, 05 Sep 2024 00:38:47 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-092-224-047-179.92.224.pool.telefonica.de. [92.224.47.179])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc5689d9sm848755a12.43.2024.09.05.00.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 00:38:46 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Joel Stanley <joel@jms.id.au>, Troy Lee <leetroy@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Tyrone Ting <kfting@nuvoton.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Sergio Lopez <slp@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Jia Liu <proljc@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 2/3] hw/char/serial.h: Extract serial-isa.h
Date: Thu,  5 Sep 2024 09:38:31 +0200
Message-ID: <20240905073832.16222-3-shentey@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905073832.16222-1-shentey@gmail.com>
References: <20240905073832.16222-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=shentey@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 40ffjeQ4iZuT

The includes where updated based on compile errors. Now, the inclusion of the
header roughly matches Kconfig dependencies:

  # grep -r -e "select SERIAL_ISA"
  hw/ppc/Kconfig:    select SERIAL_ISA
  hw/isa/Kconfig:    select SERIAL_ISA
  hw/sparc64/Kconfig:    select SERIAL_ISA
  hw/i386/Kconfig:    select SERIAL_ISA
  hw/i386/Kconfig:    select SERIAL_ISA # for serial_hds_isa_init()

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/char/serial-isa.h | 38 ++++++++++++++++++++++++++++++++++++
 include/hw/char/serial.h     |  9 ---------
 hw/char/serial-isa.c         |  1 +
 hw/i386/microvm-dt.c         |  2 +-
 hw/i386/microvm.c            |  2 +-
 hw/i386/pc.c                 |  2 +-
 hw/isa/isa-superio.c         |  2 +-
 hw/isa/vt82c686.c            |  2 +-
 hw/ppc/pnv.c                 |  2 +-
 hw/sparc64/sun4u.c           |  1 +
 10 files changed, 46 insertions(+), 15 deletions(-)
 create mode 100644 include/hw/char/serial-isa.h

diff --git a/include/hw/char/serial-isa.h b/include/hw/char/serial-isa.h
new file mode 100644
index 0000000000..8517afa128
--- /dev/null
+++ b/include/hw/char/serial-isa.h
@@ -0,0 +1,38 @@
+/*
+ * QEMU ISA 16550A UART emulation
+ *
+ * Copyright (c) 2003-2004 Fabrice Bellard
+ * Copyright (c) 2008 Citrix Systems, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_SERIAL_ISA_H
+#define HW_SERIAL_ISA_H
+
+#include "hw/isa/isa.h"
+
+#define MAX_ISA_SERIAL_PORTS 4
+
+#define TYPE_ISA_SERIAL "isa-serial"
+void serial_hds_isa_init(ISABus *bus, int from, int to);
+void isa_serial_set_iobase(ISADevice *serial, hwaddr iobase);
+void isa_serial_set_enabled(ISADevice *serial, bool enabled);
+
+#endif
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 6e14099ee7..fca32a532b 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -106,13 +106,4 @@ SerialMM *serial_mm_init(MemoryRegion *address_space,
                          qemu_irq irq, int baudbase,
                          Chardev *chr, enum device_endian end);
 
-/* serial-isa.c */
-
-#define MAX_ISA_SERIAL_PORTS 4
-
-#define TYPE_ISA_SERIAL "isa-serial"
-void serial_hds_isa_init(ISABus *bus, int from, int to);
-void isa_serial_set_iobase(ISADevice *serial, hwaddr iobase);
-void isa_serial_set_enabled(ISADevice *serial, bool enabled);
-
 #endif
diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index 329b352b9a..b562ec9d37 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -29,6 +29,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/acpi/acpi_aml_interface.h"
 #include "hw/char/serial.h"
+#include "hw/char/serial-isa.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index b3049e4f9f..fc5db6ed7f 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -34,7 +34,7 @@
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "sysemu/device_tree.h"
-#include "hw/char/serial.h"
+#include "hw/char/serial-isa.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/sysbus.h"
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 40edcee7af..05c882669c 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -39,7 +39,7 @@
 #include "hw/intc/i8259.h"
 #include "hw/timer/i8254.h"
 #include "hw/rtc/mc146818rtc.h"
-#include "hw/char/serial.h"
+#include "hw/char/serial-isa.h"
 #include "hw/display/ramfb.h"
 #include "hw/i386/topology.h"
 #include "hw/i386/e820_memory_layout.h"
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7779c88a91..8de5fa3b55 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "hw/i386/pc.h"
-#include "hw/char/serial.h"
+#include "hw/char/serial-isa.h"
 #include "hw/char/parallel.h"
 #include "hw/hyperv/hv-balloon.h"
 #include "hw/i386/fw_cfg.h"
diff --git a/hw/isa/isa-superio.c b/hw/isa/isa-superio.c
index a8c8c58ef7..cff756e791 100644
--- a/hw/isa/isa-superio.c
+++ b/hw/isa/isa-superio.c
@@ -22,7 +22,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/input/i8042.h"
 #include "hw/char/parallel-isa.h"
-#include "hw/char/serial.h"
+#include "hw/char/serial-isa.h"
 #include "trace.h"
 
 static void isa_superio_realize(DeviceState *dev, Error **errp)
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 505b44c4e6..1aa5c9613f 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -17,7 +17,7 @@
 #include "hw/isa/vt82c686.h"
 #include "hw/block/fdc.h"
 #include "hw/char/parallel-isa.h"
-#include "hw/char/serial.h"
+#include "hw/char/serial-isa.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/ide/pci.h"
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 3526852685..ffc3f2bca0 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -53,7 +53,7 @@
 #include "hw/ppc/pnv_pnor.h"
 
 #include "hw/isa/isa.h"
-#include "hw/char/serial.h"
+#include "hw/char/serial-isa.h"
 #include "hw/rtc/mc146818rtc.h"
 
 #include <libfdt.h>
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 4ece1ac1ff..a839abbf5d 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -35,6 +35,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/pci-host/sabre.h"
 #include "hw/char/serial.h"
+#include "hw/char/serial-isa.h"
 #include "hw/char/parallel-isa.h"
 #include "hw/rtc/m48t59.h"
 #include "migration/vmstate.h"
-- 
2.46.0

