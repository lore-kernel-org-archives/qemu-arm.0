Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1026763ejo;
        Tue, 12 Dec 2023 08:32:41 -0800 (PST)
X-Received: by 2002:a05:600c:450e:b0:40c:2b4c:ea8 with SMTP id t14-20020a05600c450e00b0040c2b4c0ea8mr3584530wmo.113.1702398761325;
        Tue, 12 Dec 2023 08:32:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398761; cv=none;
        d=google.com; s=arc-20160816;
        b=tlMZ/B64TkFvHAI/0gM5m673kNcwjzmkLGr7Xokneq1hJWpphyqGgYRWhkZ/LJpT6t
         QC44qatxYsWb8mcnzLR6OR5oG4mm0N6bd6ZR47WmHxvJGP3AmEGJoxKgDDyz7VbBdRgU
         KL+qaFN0f9+S9o/ffZ1PU9ufEXv0ePrPZugqJOrpo61zbIzYeYma+fQhyJA0+LJTOTKc
         RFjXZofFqYcstaSHXzGQfrPThUgKRW1mnWUKH1Obi6r+WA714CluxfP3iq9cKnporsIa
         h1ZygSswEfRhzDkcgZTwEhFC6+MH68cp4MssbSIMiIHWQVEuSNJ8By1nNW4eSUKIV9bx
         +dZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QBOGPnHHB3911qXPeC7joHkuSv4mKQWNp402DQT8HUM=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=PKQVaOj3XYDPEgWyoo+9waSyjD/gFU3R1m+S92ua83ZqLEm/o3crQJoEp5TZ6QZy1T
         ivnF7JHf7wAEc+Xmt68I+98lqHnQPDF1XQLkBhADTdmMNTSf3cVsqTnwBYd/AucwH+2r
         b+ARn+HYQAJ2UVPsd6zmIdqICODf1ttePcGFQmU0GxKGKqCkkEqyzGBHCT/qGhhohqEC
         fH9udu8TjVVt1HN/r7ACxiaO6T1TGWQTEO6C8EVQxADEt+jng6eY0bRUffP3CIIygq1S
         6ZyjwUhp/tPQBvB1kM25vFT7rz78pSOf2lFtZwksvm/NHG01f8osSfp4s+AzIDyvCBEI
         fErA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dhmsw5qm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id az1-20020a05600c600100b0040c243ddabasor3218162wmb.2.2023.12.12.08.32.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:32:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dhmsw5qm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398761; x=1703003561; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBOGPnHHB3911qXPeC7joHkuSv4mKQWNp402DQT8HUM=;
        b=Dhmsw5qmmRHXidaGFQSneYr9jwKlbM9H7GdPTs8Qhdd1mWs2bv2UeJIQOxXg+MwoVy
         XWFT0m0pkPikk/YG1dHa2RuF1MGkjiALA9fZRDnGcNpmzx+N5fkZC1YNNe/8qCA52uSn
         E8O+FPB2/jApTuLV37G8qk4vrwrbN5j4WkpXiX5KQWfkgu1/0tDoYN10nxBfA7+Cn7T1
         mvCEcrWd5KlrHgUFZZ/NhhWWXgGkvaUlFD3mXaAq+xRJrZRPATOLbgaYYQTP5pI7AHiR
         FnLKht3OF5Xd9nhkREmvBam2x1GxldC+BpZykuPIP4NeI5/ApJIZCezwTh5vbFFLdCd4
         E6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398761; x=1703003561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBOGPnHHB3911qXPeC7joHkuSv4mKQWNp402DQT8HUM=;
        b=YsieEckUmbtPMFh8WJiSHK5T9LdsH4ZG/4DruOzIGrJN6e9RDFbZiFuxd8PqVdtDJA
         ilFpwskESWjxSySgJyew3AS+26yX+fHfc2o8b0k9+L6tMLLNHqrg65zEAstqomh9BSxF
         I0pRyNm7/RnObNHB1M1RwoHSydAWfh08P+T/3R261kp2L/HwY5jVTFSYpEcuQ7wHBdow
         PCzlsn2W9TUb+/zBM07ihpG9+HI0GPzXZdxNhinsokDQDwvJRV1DKPGuEq9gYFfKGss6
         HwH0llFQz9DJXfehXxTRKHtPd6i9PrEa370J6O9XLu2cLeiEa892B+C+uoQdn4E5CW1I
         Mtdw==
X-Gm-Message-State: AOJu0YwIk0h6OP9uXGUAAQKNrkx7dbgycini3KQZUcrASEeZ97aRXSm2
	wQWGSmfXCveQm9CQ1sCyLMVDnaxL
X-Google-Smtp-Source: AGHT+IHdDnlbdk7OHM8tTTeyyle5mW0FYFGDZn5ZKs+vQ26Fe4J2l4AZ68x14i6EIP/rf8xO94PXYg==
X-Received: by 2002:a05:600c:c8d:b0:40c:2b85:5b87 with SMTP id fj13-20020a05600c0c8d00b0040c2b855b87mr4315249wmb.98.1702398760868;
        Tue, 12 Dec 2023 08:32:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id t4-20020adff044000000b0033340937da6sm11071845wro.95.2023.12.12.08.32.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:32:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 25/33] hw/arm/fsl-imx6ul: Let the A7MPcore create/wire the CPU cores
Date: Tue, 12 Dec 2023 17:29:25 +0100
Message-ID: <20231212162935.42910-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VxitDWelvFHR

Set the properties on the a7mpcore object to let it create and
wire the CPU cores. Remove the redundant code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/fsl-imx6ul.h |  4 ----
 hw/arm/fsl-imx6ul.c         | 24 ++++++------------------
 hw/arm/mcimx6ul-evk.c       |  3 ++-
 3 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index b37d544319..9957ab5be0 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -34,7 +34,6 @@
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
-#include "cpu.h"
 #include "qom/object.h"
 #include "qemu/units.h"
 
@@ -63,11 +62,8 @@ enum FslIMX6ULConfiguration {
 };
 
 struct FslIMX6ULState {
-    /*< private >*/
     DeviceState    parent_obj;
 
-    /*< public >*/
-    ARMCPU             cpu;
     CortexMPPrivState  a7mpcore;
     IMXGPTState        gpt[FSL_IMX6UL_NUM_GPTS];
     IMXEPITState       epit[FSL_IMX6UL_NUM_EPITS];
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 6e4343efaa..512973e3c1 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -25,6 +25,7 @@
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "target/arm/cpu.h" /* qom */
 
 #define NAME_SIZE 20
 
@@ -34,9 +35,6 @@ static void fsl_imx6ul_init(Object *obj)
     char name[NAME_SIZE];
     int i;
 
-    object_initialize_child(obj, "cpu0", &s->cpu,
-                            ARM_CPU_TYPE_NAME("cortex-a7"));
-
     /*
      * A7MPCORE
      */
@@ -158,8 +156,6 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
     DeviceState *gic;
     int i;
     char name[NAME_SIZE];
-    SysBusDevice *sbd;
-    DeviceState *d;
 
     if (ms->smp.cpus > 1) {
         error_setg(errp, "%s: Only a single CPU is supported (%d requested)",
@@ -167,26 +163,18 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    qdev_realize(DEVICE(&s->cpu), NULL, &error_abort);
-
     /*
      * A7MPCORE
      */
-    object_property_set_int(OBJECT(&s->a7mpcore), "num-cores", 1, &error_abort);
-    object_property_set_int(OBJECT(&s->a7mpcore), "num-irq",
-                            FSL_IMX6UL_MAX_IRQ + GIC_INTERNAL, &error_abort);
+    qdev_prop_set_uint32(DEVICE(&s->a7mpcore), "num-cores", 1);
+    qdev_prop_set_string(DEVICE(&s->a7mpcore), "cpu-type",
+                         ARM_CPU_TYPE_NAME("cortex-a7"));
+    qdev_prop_set_uint32(DEVICE(&s->a7mpcore), "gic-spi-num",
+                         FSL_IMX6UL_MAX_IRQ + GIC_INTERNAL);
     sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX6UL_A7MPCORE_ADDR);
     gic = DEVICE(&s->a7mpcore);
 
-    sbd = SYS_BUS_DEVICE(&s->a7mpcore);
-    d = DEVICE(&s->cpu);
-
-    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(d, ARM_CPU_IRQ));
-    sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(d, ARM_CPU_FIQ));
-    sysbus_connect_irq(sbd, 2, qdev_get_gpio_in(d, ARM_CPU_VIRQ));
-    sysbus_connect_irq(sbd, 3, qdev_get_gpio_in(d, ARM_CPU_VFIQ));
-
     /*
      * A7MPCORE DAP
      */
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 500427e94b..a19834930f 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -18,6 +18,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
+#include "target/arm/cpu.h" /* qom */
 
 static void mcimx6ul_evk_init(MachineState *machine)
 {
@@ -64,7 +65,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
     }
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu, machine, &boot_info);
+        arm_load_kernel(s->a7mpcore.cpu[0], machine, &boot_info);
     }
 }
 
-- 
2.41.0
