Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp276830ejk;
        Mon, 29 Jan 2024 08:10:36 -0800 (PST)
X-Received: by 2002:a05:6512:3996:b0:510:67d:7251 with SMTP id j22-20020a056512399600b00510067d7251mr4363433lfu.47.1706544636403;
        Mon, 29 Jan 2024 08:10:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706544636; cv=none;
        d=google.com; s=arc-20160816;
        b=vP8tXrhUuHW+56ktRTRfe02WOTRxKr4WcvLZmpsax0VSeYFSBeA8U9oi3DuqGNckmT
         W6CkFbNU9lFwc/42Y8R2J3yd/AtvnKl6eaqX+hADI0WJL0cvTp+ghoaV1/6gXh2W33wb
         8MA3EGkrqJ8jC+O6vTcqvYEopmzWdzKdjirh1WmiDVL2X4fp0RC6BNzLo2VA55JnymID
         UM7IoGzcMVq35nAldg6WRC2dyh6/fX9YEMabl2jX2+r/lbLLunFXpIggrWxhOfZpe/sh
         oPPEIgzFSVR5QVEQA4KMvHEAlQLbxmtEHIpEsHkiJcPicmAN4v7YWY1r+/8GXGLM2ARs
         1d+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mowSEhOgZzKcBJ9VgVtTRlxzjWwdK68BxpCMYQUxiN0=;
        fh=i8IrxfRLCV5OjP1q5SHj5PLJJsmsGE7RKBJUCNgfBeY=;
        b=Os9WLkWKhfX3RZ+yJo6w4/wEO6BBuuNToKv3GixW+jBU982jrPpadhLyU8asj828lQ
         Y3K9/VvuDtEpu9o5QvGyFZJiMSe0sScNvF2+iwBya6tgPgMkLqOsWhU2+jX3LwSWgdTt
         wMkUOBTx0uYlQascIlxoA2KRcO4a/g0Bry8oetk9P5T9BDwYmGUU2UZwdHDJ5hLxTxu5
         Sh84kBe8n28ka/64ejb1/OuGZfWcpUuGDg19SQMUIR94qZpdq5CM78175kfBQnWKc9H3
         QuSl+O/klWAH2Tcy3GjGJ66ueLTSLdPytGPTNjsEI30umt70dNOL8oDvEk8qDqn8iuNS
         7ibw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9nPMQzn;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l41-20020a05600c1d2900b0040ee66cfab8sor2366006wms.9.2024.01.29.08.10.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jan 2024 08:10:36 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9nPMQzn;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706544636; x=1707149436; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mowSEhOgZzKcBJ9VgVtTRlxzjWwdK68BxpCMYQUxiN0=;
        b=n9nPMQznjmotJY5TaJ3rhEMkK9zSLgAPr9QMiFDNDACdd5xZCpoHW5hpxk9wNwj52o
         p4Tqe0doinRfgSFWcU7YX5I5b473STw1tVVSloDBnlSzV+0UME7nWw8T0r9o6alxYI66
         f5sTFI92Rb7XfpjkL7MStRudl0FugaKfvF9a5Spp0QjrgziRfCyfbnBgASFYJzmyntPd
         8RhHe8A6g/ib/krmJjp424H4U7sD6X0KGVaW93Qh7udlFB6U1IZvNfQUJQLL53dSQK7d
         XeSL9YBC+/9ECN6ypJiDDfVkMjNpQjXAAyDHtR30SlpHn/b9EydMuQJqAS7hDTNw2ezy
         b6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706544636; x=1707149436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mowSEhOgZzKcBJ9VgVtTRlxzjWwdK68BxpCMYQUxiN0=;
        b=M3sfYEeOZdXF5LXAiEyieNtKfxhCLGphN+zhyO8p9Xn5VepM3aiiDa4nqNq7Cr4bXC
         Adg60qtrapFH55qvEcx8GePlPzX8h4cfv/DflnkNJ9WUEN8ui6dZ4sXg/75pbo1sNnW0
         zCKBvbJTniqFaDq1IsXGSvD8aF+pPGD3P8vAoZoQll/g/hSqZwTUzgd4LFS9L6Qd53j/
         ATOJw7gzVDWB2HXReCZS6jy7qKL6C1614qrH2qecJmeqCrASeuiwm74xYOAa2JY6DBVa
         hfOcw3ReP9dGAJtkB9If1YkDY5Z9/5S60OcLBfGpr3CgJwinftfvoRWm5q4t70x0URoG
         GNaw==
X-Gm-Message-State: AOJu0YyNqeyHMOr7AWf85kWC8xKJ73Xwick4za4SaJIwZa47+NBtF3oV
	GW/+pdnUffi/cQiFu+DXN58P44sQHQm7lCCxpSFGc+Ig3E6EDtstwikQFLcDXQfqcA==
X-Google-Smtp-Source: AGHT+IHJwGRqrJQIzllR5ddrn3Ul9ubdSRjAryKPH1AK1kiGYvbhTuS0azJwZJUfuup1+2wfPCWY3w==
X-Received: by 2002:a05:6000:1544:b0:33a:ed19:9f37 with SMTP id 4-20020a056000154400b0033aed199f37mr3033204wry.47.1706544636095;
        Mon, 29 Jan 2024 08:10:36 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr. [37.6.163.245])
        by smtp.gmail.com with ESMTPSA id co6-20020a0560000a0600b0033af4df8e1esm1219957wrb.47.2024.01.29.08.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:10:35 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 3/6] hw/arm/xen_arm.c: convert DPRINTF to trace events and error/warn reports
Date: Mon, 29 Jan 2024 18:09:38 +0200
Message-Id: <fe5e3bd54231abe933f95a24e0e88208cd8cfd8f.1706544115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: L4Q84brUl0qB

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
index 0ff41e6c78..fd0d92762e 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -65,3 +65,8 @@ z2_lcd_enable_disable_result(const char *result) "LCD %s"
 z2_aer915_send_too_long(int8_t msg) "message too long (%i bytes)"
 z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
 z2_aer915_event(int8_t event, int8_t len) "i2c event =0x%x len=%d bytes"
+
+# xen_arm.c
+xen_create_virtio_mmio_devices(int i, int irq, uint64_t base) "Created virtio-mmio device %d: irq %d base 0x%"PRIx64
+xen_init_ram(uint64_t machine_ram_size) "Initialized xen ram with size 0x%"PRIx64
+xen_enable_tpm(uint64_t addr) "Connected tpmdev at address 0x%"PRIx64
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
