Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp937505ejg;
        Fri, 19 Jan 2024 05:24:54 -0800 (PST)
X-Received: by 2002:a2e:9bcd:0:b0:2cc:6bf0:8f3 with SMTP id w13-20020a2e9bcd000000b002cc6bf008f3mr1377915ljj.99.1705670694255;
        Fri, 19 Jan 2024 05:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705670694; cv=none;
        d=google.com; s=arc-20160816;
        b=hvZrPK7c1RjtDyyUOqxYr9irl+tmwJquDJf6SeuAquTm9R3QGufhSl/JIR5dHbvnZB
         hcWRxis+2nbHiBjTuvkIyrGkOO9Mtcfq71BTDYbjR6UAMKjc73qTZoVvMUw3K2/s+z7T
         Go33jQ9DEZrkbmv/BI1A3NeoKmi4qFpEF4HeXOxgLoqJDmHr2+YX2JGcAQsN/shM+Ele
         YPL70MAEW0X7MxpY0iKDshmsC6V1TOZHPWgrYiuZzJdd9m7a4ZQh/p9FLpqW+yqT3fDd
         oIr2s34vxBOBZCsnis7Md2q97gcv3LCjS+eQc66ODKrrbgz8G0OucyhB9fBJdTUU4fLp
         yVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VAngX4m6Z7n5rBnwPaU8JIuuuFcTQSGFa/hGBLJQ25E=;
        fh=f3Y3sZEpYRjfEg90XhED1f3vandGp5Hk3HJV5rk3gQA=;
        b=s8ZMRxXKyAgcnOzNdhSoli9uJOE1Qead4L8YsQZSfKVQE0xlyu6nl/ylr6DZuAnV1D
         PUUxGOf8jbFcf77FClpJ1OKpgvJOdJUEQ5txk/iAZ2TDcPzTS5cDltId/QbrgYfoBW4d
         1o7uyE8WlPCbZGGhFlXsM677SyY+kWj4rb3ZwJprUvULAx9xZnyCmNtNe1i4hVAAbQbd
         oht0X7qRqZEb2BsX9cqqmzQyZgijzZ7APwR22Uoz2GWvMLr1vVZix7iO1ZtGphkVFPu7
         ENsrac09OZ/myIW8BSS/PjiLV3cd3qwsjp4AI0H/pOH5POTESmMF+9xZ6B/nbERE9G7E
         eUrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LnKqjPIL;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o8-20020a2e9b48000000b002cd10c1ce58sor2471889ljj.7.2024.01.19.05.24.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 05:24:54 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LnKqjPIL;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705670694; x=1706275494; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAngX4m6Z7n5rBnwPaU8JIuuuFcTQSGFa/hGBLJQ25E=;
        b=LnKqjPILEP9cF6CdrUpTPoHtHUeIxNZtU6f0aRQC4JaIqiMEdu2h0tw8GVGSDsAxqN
         zzYdLTSJWMWklgF7J3rwA13dvVICeyJ4uZvwEMFRX9ciJqN+rqTRWl/a1YZsvQK7f9ir
         SdIbJ7jiJS4QQVqDZ1BmM1i0peZq4bE5qNT3buQW6+zYOAz20xSDI/8p1DjnDW1ueOk8
         +bgcTCotimToXYsdI1AiMoFRR4uM2LqHjJyxSJwhQXXmCXTJJmftGuwSg9MtQzcvxjMv
         bgT0DT6Q5rry+Oz7fe9Odb3a9WejdkqljaE/4CCp1AYV/aEK0obDn5vTfw3yOfB7/p8h
         ZIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705670694; x=1706275494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAngX4m6Z7n5rBnwPaU8JIuuuFcTQSGFa/hGBLJQ25E=;
        b=cnnGptF9RaLxx/wPDvfEwDb1UFPFGlfJ+LCzw8qEJts1FXGuce8Wxj9Ipgx0tdU+eG
         8wqC3X7kt43l/+9ZmbI4kA5hH9rgDW1B0l4C4Juh//T4fyHGt4mfBKEWKZwKLXsRQsB6
         ng5MJ0klo85Mf+yMh6Vk1ceXF38LdgYc35qUTGyyvYpMLdfzCkto6FMIK74lHbGXqz6b
         Bu6jWHeq7jmfSLrC7/Gf1+BFTgpiJzrnTCmOm8bSkTYE4iCXk/HkCMHZHoNgCgGKpo5R
         mEzQ+ldSnFe7pUKyOnuDpej16inDAJicDDg1SeSVmM6Vvl0XEsl7VOk6ZjQUQQulLuS7
         7h9g==
X-Gm-Message-State: AOJu0Yw2i994ZKn8kx048F6pAdNrzHl9vVENd2dQ3getv2JVlV+dVxK9
	gYf95sXyg2FD67Mvg3e9onUlGMzH3mMkHsTXt53nR/C/LRblPR90gXYVSZxoHLqOGA==
X-Google-Smtp-Source: AGHT+IFY85TUfdmGhOXUuurdf83wXKDDr4KyWdYQqIWsb6PeMKNpY7955RyDKWckr/AX+oUl6YMs8w==
X-Received: by 2002:a05:651c:1991:b0:2cd:494b:b4aa with SMTP id bx17-20020a05651c199100b002cd494bb4aamr1997659ljb.30.1705670693620;
        Fri, 19 Jan 2024 05:24:53 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-138.37.6.1.tellas.gr. [37.6.1.138])
        by smtp.gmail.com with ESMTPSA id b11-20020aa7dc0b000000b00558fc426affsm8568310edu.88.2024.01.19.05.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:24:53 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/5] hw/arm/xen_arm.c: convert DPRINTF to trace events and error/warn reports
Date: Fri, 19 Jan 2024 15:24:44 +0200
Message-Id: <c7eb8943f085e0f68e3471fecf49cc96571c8852.1705670342.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
References: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: IkQsF1IxAZvR

Tracing DPRINTFs to stderr might not be desired. A developer that relies
on trace events should be able to opt-in to each trace event and rely on
QEMU's log redirection, instead of stderr by default.

This commit converts DPRINTFs in this file that are used for tracing
into trace events. Errors or warnings are converted to error_report and
warn_report calls.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/trace-events |  5 +++++
 hw/arm/xen_arm.c    | 23 +++++++++++------------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index b0a56fcdc6..623eb003bb 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -65,3 +65,8 @@ z2_aer915_event(int8_t event, int8_t len) "i2c event =0x%x len=%d bytes"
 # strongarm.c
 strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
 strongarm_ssp_read_underrun(void) "SSP rx underrun"
+
+# xen_arm.c
+xen_create_virtio_mmio_devices(int i, int irq, uint64_t base) "Created virtio-mmio device %d: irq %d base 0x%lx"
+xen_init_ram(uint64_t machine_ram_size) "Initialized xen ram with size 0x%lx"
+xen_enable_tpm(uint64_t addr) "Connected tpmdev at address 0x%lx"
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index a5631529d0..32776d94df 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -34,6 +34,7 @@
 #include "hw/xen/xen-hvm-common.h"
 #include "sysemu/tpm.h"
 #include "hw/xen/arch_hvm.h"
+#include "trace.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
@@ -91,8 +92,9 @@ static void xen_create_virtio_mmio_devices(XenArmState *xam)
 
         sysbus_create_simple("virtio-mmio", base, irq);
 
-        DPRINTF("Created virtio-mmio device %d: irq %d base 0x%lx\n",
-                i, GUEST_VIRTIO_MMIO_SPI_FIRST + i, base);
+        trace_xen_create_virtio_mmio_devices(i,
+                                             GUEST_VIRTIO_MMIO_SPI_FIRST + i,
+                                             base);
     }
 }
 
@@ -101,6 +103,7 @@ static void xen_init_ram(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
     ram_addr_t block_len, ram_size[GUEST_RAM_BANKS];
 
+    trace_xen_init_ram(machine->ram_size);
     if (machine->ram_size <= GUEST_RAM0_SIZE) {
         ram_size[0] = machine->ram_size;
         ram_size[1] = 0;
@@ -117,15 +120,10 @@ static void xen_init_ram(MachineState *machine)
     memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &ram_memory,
                              GUEST_RAM0_BASE, ram_size[0]);
     memory_region_add_subregion(sysmem, GUEST_RAM0_BASE, &ram_lo);
-    DPRINTF("Initialized region xen.ram.lo: base 0x%llx size 0x%lx\n",
-            GUEST_RAM0_BASE, ram_size[0]);
-
     if (ram_size[1] > 0) {
         memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &ram_memory,
                                  GUEST_RAM1_BASE, ram_size[1]);
         memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
-        DPRINTF("Initialized region xen.ram.hi: base 0x%llx size 0x%lx\n",
-                GUEST_RAM1_BASE, ram_size[1]);
     }
 }
 
@@ -158,7 +156,7 @@ static void xen_enable_tpm(XenArmState *xam)
 
     TPMBackend *be = qemu_find_tpm_be("tpm0");
     if (be == NULL) {
-        DPRINTF("Couldn't fine the backend for tpm0\n");
+        error_report("Couldn't find tmp0 backend");
         return;
     }
     dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
@@ -168,7 +166,7 @@ static void xen_enable_tpm(XenArmState *xam)
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, xam->cfg.tpm_base_addr);
 
-    DPRINTF("Connected tpmdev at address 0x%lx\n", xam->cfg.tpm_base_addr);
+    trace_xen_enable_tpm(xam->cfg.tpm_base_addr);
 }
 #endif
 
@@ -179,8 +177,9 @@ static void xen_arm_init(MachineState *machine)
     xam->state =  g_new0(XenIOState, 1);
 
     if (machine->ram_size == 0) {
-        DPRINTF("ram_size not specified. QEMU machine started without IOREQ"
-                "(no emulated devices including Virtio)\n");
+        warn_report("%s non-zero ram size not specified. QEMU machine started"
+                    " without IOREQ (no emulated devices including virtio)",
+                    MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
         return;
     }
 
@@ -194,7 +193,7 @@ static void xen_arm_init(MachineState *machine)
     if (xam->cfg.tpm_base_addr) {
         xen_enable_tpm(xam);
     } else {
-        DPRINTF("tpm-base-addr is not provided. TPM will not be enabled\n");
+        warn_report("tpm-base-addr is not provided. TPM will not be enabled");
     }
 #endif
 }
-- 
γαῖα πυρί μιχθήτω
