Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1026604ejo;
        Tue, 12 Dec 2023 08:32:27 -0800 (PST)
X-Received: by 2002:a05:600c:1c05:b0:40c:3856:5e07 with SMTP id j5-20020a05600c1c0500b0040c38565e07mr3345002wms.9.1702398747319;
        Tue, 12 Dec 2023 08:32:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398747; cv=none;
        d=google.com; s=arc-20160816;
        b=hJEmDxVOeWvoLBd138uk58J9eMFD/nzUBix/MMznFoe3FdIMZNo0PKLsP6ifizV96A
         hbd0rYaS5wmseSW1LN/w3gGoTduYjcDnelYYSp7XRMfGizHg0/Qv51/mtEEDYg73wsXZ
         sYshin9RzZMK/3A7ohuChB/m8dv9t+IzgmmSvVLYq609xXgUCgQ/gXnwqSE4vjLq2lKF
         BSsfjpiED3XTjHQq1sXNdlO5fk7PHr+evM8vJ6FYhB+vMEc4yh6UVUHAnCe115IX+q7G
         5DgbS8Zk8MBfH6dWp/xCnZsZWagS4LmYPg5Z7fbn90yzOxQVCOk+5ndyxUpgrUCsOmsa
         GrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vFzkWMG0zGlWXgIPHI7/afHt/cki/WH0MbN3+yHSaoE=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=LPxiMWuCrj5ueIstLZIYhF7tbENRxzHVw0PsRLL3dprkwS/EEzxwYWUUcK8NbIcwVq
         Ikvp8XARdfW/XB+Kgeuj5nef1FTLd4W13+8CJXmW1zo7AXko/R2fhb/jM+BKtWuCtgGj
         gINFUbMy7K1qC1kD4sxrBXFf7ecxM7IGfvB3JXrCWJCXwiJeyuPKSoLNKcTor8d4frDm
         iFNEGbbCW6afomghtJp7pySTuTRefBycLFRNN4QrcQjek6+XlNhtaItTdlGO86+WHNLu
         BHu09cpkBNvcg6tTQAooLvjGZvZ5rlMk10ZIbURo7og47mlOF3DqIZHp1t33dF1RTXxV
         ucBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqEeM14B;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k30-20020a05600c081e00b004094d6a1347sor2589796wmp.3.2023.12.12.08.32.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:32:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqEeM14B;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398747; x=1703003547; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFzkWMG0zGlWXgIPHI7/afHt/cki/WH0MbN3+yHSaoE=;
        b=kqEeM14BvFs2lHoOpBc4c4Iexp3zSs45/3GGQgylgKSaREGzDosylxug4J9vO6efjW
         Pu+MmJ9Z6CP72CdaigiDARgcRpkqryp0pNSeAllIEnkjkNy0Gh2DrwTf9qFF6dXOOqls
         mJgt//XwqD66SKYuzdoEBAnAFyV4rPzTYG8waR00hhroydvAUd4UirHc8Lcc7b0uVTYS
         fAT9aiEPzirDb35YeRcA8066Rl+UnnqVpE61LVV5E43yyj+QyPDtHU6SB94d1AxJGSUa
         pCKoTb91X2HbSsxIL1/1G/Id0gu6UFMtKXdb8he0TZ3SnvZtk7JDxJMUhhh9Vtv/JSyv
         cD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398747; x=1703003547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFzkWMG0zGlWXgIPHI7/afHt/cki/WH0MbN3+yHSaoE=;
        b=BrQtfPJuc4Z1Q7WmPgh367YlnFj+WxtYXFixCbrULJTDXcutInsLhWM4xTKMamCEn7
         /O6o0pGkMThV7H+XjNqiZuJpKPwFO7N3/uaDDjaEV36nGxKmVPi28zciIbJVxiZ+PYAH
         mcJCYeOQ0WHrrGP+j8zu9UqRRJcv2EJ00b0CKHFN/nfGEaDJUd9Y+VWjjvO2/BUlyyDt
         yVK+T14et+shD1pLzLJFdG7sqYj6xFmfgUB+1jZX021d1ASno6S0vt8WYXyzNg67FTzI
         bRFMkH8E+12OLe98pQMInqRWZkwtwRYLlKQvWWZTw1lQ3WXyEovZKbrtlmeOLYszjJc+
         JAPg==
X-Gm-Message-State: AOJu0Yy2g+yOyYKJPMKduIFqRnKezJnZhh39phHF2LR/LageDK+eZTTc
	r8WI5FZA1Hk1ApzRxYPExIOgeWPJ
X-Google-Smtp-Source: AGHT+IFZd1CMjh6Gzr06q97rlXMejC01TVbKDESXkHnVYzgAhizQSnBEAprdGTA0lpX/odIAhjlgMg==
X-Received: by 2002:a05:600c:3784:b0:40b:47f0:66b5 with SMTP id o4-20020a05600c378400b0040b47f066b5mr3699516wmr.26.1702398746978;
        Tue, 12 Dec 2023 08:32:26 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id l39-20020a05600c1d2700b0040c2c5f5844sm17191224wms.21.2023.12.12.08.32.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:32:26 -0800 (PST)
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
Subject: [PATCH 23/33] hw/arm/exynos4210: Let the A9MPcore create/wire the CPU cores
Date: Tue, 12 Dec 2023 17:29:23 +0100
Message-ID: <20231212162935.42910-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: k2Y5ycMYanGQ

Set the properties on the a9mpcore object to let it create and
wire the CPU cores. Remove the redundant code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/exynos4210.h |  4 +--
 hw/arm/exynos4210.c         | 62 +++++++++++++------------------------
 hw/arm/exynos4_boards.c     |  6 ++--
 3 files changed, 26 insertions(+), 46 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index f95e3232c5..28a64f275c 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -83,10 +83,8 @@
 #define EXYNOS4210_NUM_SPLITTERS (EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ + 38)
 
 struct Exynos4210State {
-    /*< private >*/
     SysBusDevice parent_obj;
-    /*< public >*/
-    ARMCPU *cpu[EXYNOS4210_NCPUS];
+
     qemu_irq irq_table[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
 
     MemoryRegion chipid_mem;
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 7386a8fe57..c6da908961 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -501,12 +501,6 @@ void exynos4210_write_secondary(ARMCPU *cpu,
                        info->smp_loader_start);
 }
 
-static uint64_t exynos4210_calc_affinity(int cpu)
-{
-    /* Exynos4210 has 0x9 as cluster ID */
-    return (0x9 << ARM_AFF1_SHIFT) | cpu;
-}
-
 static DeviceState *pl330_create(uint32_t base, OrIRQState *orgate,
                                  qemu_irq irq, int nreq, int nevents, int width)
 {
@@ -549,26 +543,25 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     MemoryRegion *system_mem = get_system_memory();
     SysBusDevice *busdev;
     DeviceState *dev, *mpdev, *uart[4], *pl330[3];
+    CortexMPPrivState *mpcore;
     int i, n;
 
-    for (n = 0; n < EXYNOS4210_NCPUS; n++) {
-        Object *cpuobj = object_new(ARM_CPU_TYPE_NAME("cortex-a9"));
-
-        /* By default A9 CPUs have EL3 enabled.  This board does not currently
-         * support EL3 so the CPU EL3 property is disabled before realization.
-         */
-        if (object_property_find(cpuobj, "has_el3")) {
-            object_property_set_bool(cpuobj, "has_el3", false, &error_fatal);
-        }
-
-        s->cpu[n] = ARM_CPU(cpuobj);
-        object_property_set_int(cpuobj, "mp-affinity",
-                                exynos4210_calc_affinity(n), &error_abort);
-        object_property_set_int(cpuobj, "reset-cbar",
-                                EXYNOS4210_SMP_PRIVATE_BASE_ADDR,
-                                &error_abort);
-        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
-    }
+    /* Private memory region and Internal GIC */
+    mpdev = DEVICE(&s->a9mpcore);
+    mpcore = CORTEX_MPCORE_PRIV(&s->a9mpcore);
+    /* Exynos4210 has 0x9 as cluster ID */
+    qdev_prop_set_uint32(mpdev, "cluster-id", 0x9);
+    qdev_prop_set_uint32(mpdev, "num-cores", EXYNOS4210_NCPUS);
+    /*
+     * By default A9 CPUs have EL3 enabled.  This board does not currently
+     * support EL3 so the CPU EL3 property is disabled before realization.
+     */
+    qdev_prop_set_bit(mpdev, "cpu-has-el3", false);
+    qdev_prop_set_uint64(mpdev, "cpu-reset-cbar",
+                         EXYNOS4210_SMP_PRIVATE_BASE_ADDR);
+    busdev = SYS_BUS_DEVICE(&s->a9mpcore);
+    sysbus_realize(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, EXYNOS4210_SMP_PRIVATE_BASE_ADDR);
 
     /* IRQ Gate */
     for (i = 0; i < EXYNOS4210_NCPUS; i++) {
@@ -578,23 +571,10 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
                                 &error_abort);
         qdev_realize(orgate, NULL, &error_abort);
         qdev_connect_gpio_out(orgate, 0,
-                              qdev_get_gpio_in(DEVICE(s->cpu[i]), ARM_CPU_IRQ));
-    }
-
-    /* Private memory region and Internal GIC */
-    mpdev = DEVICE(&s->a9mpcore);
-    qdev_prop_set_uint32(mpdev, "num-cores", EXYNOS4210_NCPUS);
-    /*
-     * By default A9 CPUs have EL3 enabled.  This board does not currently
-     * support EL3 so the CPU EL3 property is disabled before realization.
-     */
-    qdev_prop_set_bit(mpdev, "cpu-has-el3", false);
-    busdev = SYS_BUS_DEVICE(&s->a9mpcore);
-    sysbus_realize(busdev, &error_fatal);
-    sysbus_mmio_map(busdev, 0, EXYNOS4210_SMP_PRIVATE_BASE_ADDR);
-    for (n = 0; n < EXYNOS4210_NCPUS; n++) {
-        sysbus_connect_irq(busdev, n,
-                           qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 0));
+                              qdev_get_gpio_in(DEVICE(mpcore->cpu[i]),
+                                               ARM_CPU_IRQ));
+        sysbus_connect_irq(busdev, i,
+                           qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[i]), 0));
     }
 
     /* Cache controller */
diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index b0e13eb4f0..7eea66d027 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -136,18 +136,20 @@ static void nuri_init(MachineState *machine)
 {
     Exynos4BoardState *s = exynos4_boards_init_common(machine,
                                                       EXYNOS4_BOARD_NURI);
+    CortexMPPrivState *mp = CORTEX_MPCORE_PRIV(&s->soc.a9mpcore);
 
-    arm_load_kernel(s->soc.cpu[0], machine, &exynos4_board_binfo);
+    arm_load_kernel(mp->cpu[0], machine, &exynos4_board_binfo);
 }
 
 static void smdkc210_init(MachineState *machine)
 {
     Exynos4BoardState *s = exynos4_boards_init_common(machine,
                                                       EXYNOS4_BOARD_SMDKC210);
+    CortexMPPrivState *mp = CORTEX_MPCORE_PRIV(&s->soc.a9mpcore);
 
     lan9215_init(SMDK_LAN9118_BASE_ADDR,
             qemu_irq_invert(s->soc.irq_table[exynos4210_get_irq(37, 1)]));
-    arm_load_kernel(s->soc.cpu[0], machine, &exynos4_board_binfo);
+    arm_load_kernel(mp->cpu[0], machine, &exynos4_board_binfo);
 }
 
 static void nuri_class_init(ObjectClass *oc, void *data)
-- 
2.41.0
