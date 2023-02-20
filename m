Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2098562ejb;
        Mon, 20 Feb 2023 01:14:16 -0800 (PST)
X-Received: by 2002:a5d:4b90:0:b0:2c5:5954:cb7b with SMTP id b16-20020a5d4b90000000b002c55954cb7bmr1348446wrt.34.1676884455992;
        Mon, 20 Feb 2023 01:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676884455; cv=none;
        d=google.com; s=arc-20160816;
        b=MA9PwYHReGYyUEVzqsjTl1HlWPelVgZkI23m5gc11z+zP4tuIpU7mwW/YWuhJ4JD9q
         Y5QRDFlpRt84CgU7EMcLK+QkSIs59iRhdIDCOLaWeg8K02yEuBEQh9Nu0JFLF+v65J1X
         D7tCvzqqKSQC4vq/5Km/NK4BgljmJjJrK7BdbqIOMqf94xbG0rLITw5T/Uu9fiGFSroB
         Ix/bjVDXqFIiNqQB0fenSw5dcCR4FblG8fnMYt/42n4WIKeAXpJv+bLiE7iYsueC9E9R
         LiCkoK4pp2bCjjT7mekMBZcuqcjgz0dz5N4TAWqIOxWFjJrZIH5w2h5r+ZZOg3t656Sj
         lJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qK71KEeZ1dXO+J7OSOV435FopVrvh5A+el2kM0w8yiE=;
        b=Du5mbBwRDrC5b/HuuCLNUqdXPg4vsaFaLVEhn2qyJpWHmLkU/yx9YAzTmlxoHFcH0+
         iRjF/jy6RzKK6yImTiJGCrBRu7zdfSnG/aLyVfhctvQkr5TsMsBymYRrr7o9T4Vjnvmq
         XefnEcrTGSsk6i2TSpN4ahsNblEeEVmEXvwMTwtzG03EJV3TGbbQHnVcPy6kjnLsHwoh
         fgaRjAKpYeGZyEidyRU3WFCJ/47KZOFIBI0Y2g6TuIG//8VsdvpLPMQKc47MA56CMcTW
         WHUUyPumrPiZGbIojCFOYJXnvW5S6BG60dnEFHra+m4E4qAO7RXiEpwgX4EGjOIZKaVx
         s6Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4kzdFZE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f6-20020a5d50c6000000b002c554760c2bsor955090wrt.49.2023.02.20.01.14.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 Feb 2023 01:14:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4kzdFZE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qK71KEeZ1dXO+J7OSOV435FopVrvh5A+el2kM0w8yiE=;
        b=E4kzdFZElZdBHc1j5MrlE89N7qaa4yexo/AxhYkWB593YndVBY+dsR0H0jYdvViQOA
         SROuqjlQY/pHYRp7d954cKLIl7KF/qBOvzSWb5cvo2De2gUcFDt4c9aRLaUp4ZozpNkP
         KZaStCdzw2+9LqrQuuH8fOk6AlTsk1PH+/8h2Z3Aom6PA2oJQkxnN/rhqThOe46jMce8
         pqxEAp/6ruXfFnL01b21RBvMTfKwYS7IFdFrxBBWaflDKgf/oO8Ifj6uoMJK/+0FT0Ui
         5OgRWucFcEzSolEtoyszDecoq90jAJIbVAllf77SWPvMRYUY4q2Dr881f0BZYaZ7yuZk
         weIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qK71KEeZ1dXO+J7OSOV435FopVrvh5A+el2kM0w8yiE=;
        b=7ZJajnbAn9chzVsGQh/HaYdTWACAwhhLlL7NKRCMO8NQ1lS9jfbJW5EWGGik24SfTx
         Umf8dYU5s7r5aLrW6mzEtaf+IDYcj+16kAAsL/NdeHJ/HcqU16NroMfRz3eJ1YmGMaO7
         PfwpvpP5cvRgMSr5RUujOtCFlNcr4jSlOn1rgemLCHSLacgsAd4u6yfnTy4jn9btDoM1
         b+iPtiisBix8x9QL0XIMcRU4wOxugMbCJp04DLRzuWCjEgXpVXxfZHZi6AzmMbj2bof8
         /De60oiB/Jpf2Ox7V8J91RR4byRHfl5R3JbqOCxSW0ApUROovVvoKF5YHyJ66/2QN+lW
         C6Ig==
X-Gm-Message-State: AO0yUKWa8brhtYaOYzWaYOJWrETDeSfqnMgHWPwOkd92GZhuWl+ZXdKQ
	CrqZARzOzREWW8ikghiqncyxNt2x
X-Google-Smtp-Source: AK7set/tmrcSRyxp53OiIqFH0gWMA28qGaCvciLvxUnS99dokxSCCh1iO4+PJzJsj9i/PwZeHlrNMA==
X-Received: by 2002:a5d:4e49:0:b0:2c3:e4f5:18c with SMTP id r9-20020a5d4e49000000b002c3e4f5018cmr302337wrt.30.1676884455709;
        Mon, 20 Feb 2023 01:14:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id b11-20020adfe30b000000b002c573a6216fsm11911601wrj.37.2023.02.20.01.14.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Feb 2023 01:14:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 03/24] hw/ide/mmio: Extract TYPE_MMIO_IDE declarations to 'hw/ide/mmio.h'
Date: Mon, 20 Feb 2023 10:13:37 +0100
Message-Id: <20230220091358.17038-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ijI+ynqnyM7k

"hw/ide.h" is a mixed bag of lost IDE declarations.

Extract mmio_ide_init_drives() and the TYPE_MMIO_IDE QOM
declarations to a new "hw/ide/mmio.h" header.

Document the SysBus interface.

Message-Id: <20230215112712.23110-4-philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/mmio.c         |  5 +----
 hw/sh4/r2d.c          |  4 ++--
 include/hw/ide.h      |  3 ---
 include/hw/ide/mmio.h | 26 ++++++++++++++++++++++++++
 4 files changed, 29 insertions(+), 9 deletions(-)
 create mode 100644 include/hw/ide/mmio.h

diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index c33d42437f..8b2ba604c5 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -29,9 +29,9 @@
 #include "qemu/module.h"
 #include "sysemu/dma.h"
 
+#include "hw/ide/mmio.h"
 #include "hw/ide/internal.h"
 #include "hw/qdev-properties.h"
-#include "qom/object.h"
 
 /***********************************************************/
 /* MMIO based ide port
@@ -39,9 +39,6 @@
  * dedicated ide controller, which is often seen on embedded boards.
  */
 
-#define TYPE_MMIO_IDE "mmio-ide"
-OBJECT_DECLARE_SIMPLE_TYPE(MmioIdeState, MMIO_IDE)
-
 struct MmioIdeState {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 39fc4f19d9..7aaa11b748 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -38,7 +38,7 @@
 #include "hw/qdev-properties.h"
 #include "net/net.h"
 #include "sh7750_regs.h"
-#include "hw/ide.h"
+#include "hw/ide/mmio.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
 #include "hw/usb.h"
@@ -283,7 +283,7 @@ static void r2d_init(MachineState *machine)
 
     /* onboard CF (True IDE mode, Master only). */
     dinfo = drive_get(IF_IDE, 0, 0);
-    dev = qdev_new("mmio-ide");
+    dev = qdev_new(TYPE_MMIO_IDE);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_connect_irq(busdev, 0, irq[CF_IDE]);
     qdev_prop_set_uint32(dev, "shift", 1);
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 60f1f4f714..5f8c36b2aa 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -8,9 +8,6 @@
 ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
                         DriveInfo *hd0, DriveInfo *hd1);
 
-/* ide-mmio.c */
-void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1);
-
 int ide_get_geometry(BusState *bus, int unit,
                      int16_t *cyls, int8_t *heads, int8_t *secs);
 int ide_get_bios_chs_trans(BusState *bus, int unit);
diff --git a/include/hw/ide/mmio.h b/include/hw/ide/mmio.h
new file mode 100644
index 0000000000..fccfd17c79
--- /dev/null
+++ b/include/hw/ide/mmio.h
@@ -0,0 +1,26 @@
+/*
+ * QEMU IDE Emulation: mmio support (for embedded).
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2006 Openedhand Ltd.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#ifndef HW_IDE_MMIO_H
+#define HW_IDE_MMIO_H
+
+#include "qom/object.h"
+
+/*
+ * QEMU interface:
+ *  + sysbus IRQ 0: asserted by the IDE channel
+ *  + sysbus MMIO region 0: data registers
+ *  + sysbus MMIO region 1: status & control registers
+ */
+#define TYPE_MMIO_IDE "mmio-ide"
+OBJECT_DECLARE_SIMPLE_TYPE(MmioIdeState, MMIO_IDE)
+
+void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1);
+
+#endif
-- 
2.38.1
