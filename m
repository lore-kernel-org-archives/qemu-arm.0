Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1026958ejo;
        Tue, 12 Dec 2023 08:32:55 -0800 (PST)
X-Received: by 2002:a7b:c44e:0:b0:40b:56f7:b359 with SMTP id l14-20020a7bc44e000000b0040b56f7b359mr2841087wmi.22.1702398775348;
        Tue, 12 Dec 2023 08:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398775; cv=none;
        d=google.com; s=arc-20160816;
        b=UQV3jCmzfdBIYC0s0Fm967Z4v70GWpOIAz7POwN46gz7waT3NCjVjq/PvabcqxoiH4
         tq54MMv8+mJ5kZCGHQzNxcsV//tgNoP6/paN63UY1VWNCcXquSbwHJcZ2GLVcQURo4oK
         /UjbrEQY2KOD9QC/1tQWwrZ9OQQURMkqorwBP9sFppCZc0Sry587MuBHdj17dcaW+SyN
         CCLNBa5c1Nr2CU1MNcTdu8wKQnX6upvrMD/Iy/kF/JX23+0ZLfHki8zKW1xMK/HCqodQ
         ht/Q1Cw/mbQVbq1hu3/EpJdFux0p2sN/eMGOhSPIYMmhRJckobCbQ34e9Fz2TLCRLqJb
         hScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=txm7/iHmv0X7jWBggjHofZpA3/2r+gkB1hvwujvQQ8k=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=0UGygMosObctzz63xMta5hELbP1xz9869yxejbriao3PCFNiTT5tBewM6jOVIOmUQ0
         /paOtQVyF6tICX2oEu1pdD3tcnPft1zZj7ZJ578KIdShSuGPHfX3yS5bLleZHaXIa2ce
         fSXcXjLmqwwaRRqwA5tc/jlM+cF96mlnNuEdWetJ2FVwW1/LjFUD3376fY3I147jH6dF
         5Yu820mItnma8WxCOp2IbDrtPqC9/wNeXsQqZmQPKHHCD/D4zT0kAo/nJEnp7yqYi+9J
         bdbS0Xh8BK1aKUp4L1vq4zWjm5U3+xXJ+u6s2/9+IK0vt+Np5oj/cxwkmhpyW+wi7XEf
         Eh5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sE0T+88b;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k6-20020a05600c168600b0040b473c398dsor3417327wmn.8.2023.12.12.08.32.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:32:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sE0T+88b;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398775; x=1703003575; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txm7/iHmv0X7jWBggjHofZpA3/2r+gkB1hvwujvQQ8k=;
        b=sE0T+88btDlLHqprLSBVVURNNoTgmMiIs1/HX+XqPGVA/yYPlvdyaUxZzKaAckC1uc
         zLCQe5vYkzzSG5GEVGvX2bVZx1JUB53/Ip0jx73wN4/yZOk3ZFZ1fTqKZHfid0frFsuK
         jLwTi8NpnXRw+SXKhKdBFlU2y/cBe3AJ7vIc80Fe1kI0LfivyyHTP4lv4MdgYbJOACaK
         jX1VAloe3StF/aWchx9Cpd2TgmAcg+b6gAnw09VifejywdHAAD4vHAg4LS6RaPz6WBy6
         koSBtyalrxOQh7GCUYXhwYw+ZubWJurfmzm7JWzr+xhbJA67LoToiJHEVKckP6WTu7zK
         Y+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398775; x=1703003575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txm7/iHmv0X7jWBggjHofZpA3/2r+gkB1hvwujvQQ8k=;
        b=haVDrBzIA4CQVEScc3QMuP0YP4EEhWd8D09svDrRmzam9kiMGeYu1NGa4C/PGmGdBp
         m8V5/2i+zrLmffLmuQFDMQ3qq7poC1JT9xed7HHewNQv1VxZN8SYxpKsHM8DbIMFi2TR
         /Y82N8zSVNzxvnCoPScSCb6bXdV4p9VDHFUAfPuZMTA9j+XHB5kL4C2MyL+yqNUIQCVY
         AbXr5aDY2KOV2VYHRjIdqCa+ynLbd7xeSp+RjLeaVfUf8rvnSDN9qJhZKRl1PGqOur/J
         VKkNxmOM4gGxDP/U3ExV/9jwddNcWMdkpyQOwMykWXMwR6W7NwydtG0yzjYTOu8GguRM
         rnPQ==
X-Gm-Message-State: AOJu0Yz7ExAxDktQJe0/m49wCZHyfhDI+Cp/TwQz+b3qGosS9WrnVDpc
	m/0z12SLOyyR/nuUE5m5RrAMdYtm
X-Google-Smtp-Source: AGHT+IE0bfcnrZKyfEhNF02tMu/TlCdEaOo1xp30m/2KU7QLmd5GRJV+BDgr/OoDe4TdwAqyB16mVQ==
X-Received: by 2002:a05:600c:4ca5:b0:40c:2630:1743 with SMTP id g37-20020a05600c4ca500b0040c26301743mr3033640wmp.84.1702398775012;
        Tue, 12 Dec 2023 08:32:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id d13-20020a05600c34cd00b0040c496c64cfsm6831542wmq.12.2023.12.12.08.32.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:32:54 -0800 (PST)
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
Subject: [PATCH 27/33] hw/arm/highbank: Let the A9/A15MPcore create/wire the CPU cores
Date: Tue, 12 Dec 2023 17:29:27 +0100
Message-ID: <20231212162935.42910-28-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vlMNBltcATvE

Set the properties on the mpcore object to let it create and
wire the CPU cores. Remove the redundant code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/highbank.c | 53 +++++++----------------------------------------
 1 file changed, 8 insertions(+), 45 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index a184bee993..b4f8304146 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -180,47 +180,10 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     SysBusDevice *busdev;
     qemu_irq pic[128];
     int n;
-    unsigned int smp_cpus = machine->smp.cpus;
-    qemu_irq cpu_irq[4];
-    qemu_irq cpu_fiq[4];
-    qemu_irq cpu_virq[4];
-    qemu_irq cpu_vfiq[4];
     MemoryRegion *sysram;
     MemoryRegion *sysmem;
     char *sysboot_filename;
 
-    switch (machine_id) {
-    case CALXEDA_HIGHBANK:
-        machine->cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
-        break;
-    case CALXEDA_MIDWAY:
-        machine->cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
-        break;
-    default:
-        assert(0);
-    }
-
-    for (n = 0; n < smp_cpus; n++) {
-        Object *cpuobj;
-        ARMCPU *cpu;
-
-        cpuobj = object_new(machine->cpu_type);
-        cpu = ARM_CPU(cpuobj);
-
-        object_property_set_int(cpuobj, "psci-conduit", QEMU_PSCI_CONDUIT_SMC,
-                                &error_abort);
-
-        if (object_property_find(cpuobj, "reset-cbar")) {
-            object_property_set_int(cpuobj, "reset-cbar", MPCORE_PERIPHBASE,
-                                    &error_abort);
-        }
-        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
-        cpu_irq[n] = qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ);
-        cpu_fiq[n] = qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_FIQ);
-        cpu_virq[n] = qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_VIRQ);
-        cpu_vfiq[n] = qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_VFIQ);
-    }
-
     sysmem = get_system_memory();
     /* SDRAM at address zero.  */
     memory_region_add_subregion(sysmem, 0, machine->ram);
@@ -251,22 +214,22 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         sysbus_mmio_map(busdev, 0, 0xfff12000);
 
         dev = qdev_new(TYPE_A9MPCORE_PRIV);
+        qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-a9"));
         break;
     case CALXEDA_MIDWAY:
         dev = qdev_new(TYPE_A15MPCORE_PRIV);
+        qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-a15"));
         break;
+    default:
+        g_assert_not_reached();
     }
-    qdev_prop_set_uint32(dev, "num-cpu", smp_cpus);
-    qdev_prop_set_uint32(dev, "num-irq", NIRQ_GIC);
+    qdev_prop_set_uint32(dev, "num-cores", machine->smp.cpus);
+    qdev_prop_set_uint32(dev, "cpu-psci-conduit", QEMU_PSCI_CONDUIT_SMC);
+    qdev_prop_set_uint64(dev, "cpu-reset-cbar", MPCORE_PERIPHBASE);
+    qdev_prop_set_uint32(dev, "gic-spi-num", NIRQ_GIC);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
-    for (n = 0; n < smp_cpus; n++) {
-        sysbus_connect_irq(busdev, n, cpu_irq[n]);
-        sysbus_connect_irq(busdev, n + smp_cpus, cpu_fiq[n]);
-        sysbus_connect_irq(busdev, n + 2 * smp_cpus, cpu_virq[n]);
-        sysbus_connect_irq(busdev, n + 3 * smp_cpus, cpu_vfiq[n]);
-    }
 
     for (n = 0; n < 128; n++) {
         pic[n] = qdev_get_gpio_in(dev, n);
-- 
2.41.0
