Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp868804ejg;
        Fri, 19 Jan 2024 03:14:31 -0800 (PST)
X-Received: by 2002:a17:906:6dcc:b0:a28:e0a7:258e with SMTP id j12-20020a1709066dcc00b00a28e0a7258emr1448486ejt.22.1705662871795;
        Fri, 19 Jan 2024 03:14:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705662871; cv=none;
        d=google.com; s=arc-20160816;
        b=EOspi1qMuBJvk6B2UlO+QnrBiMmGckzxyLrAwNE8qhj+CezDYeiu+dA3m/ZKPrO+Bn
         AjTnygiAJrAHCP7K9ywOA6dG516AZZ/cMgfGNeSB+4xACJ3vtGHdkdbykFzAILjr1m2G
         0v1n+IGCme5hzTG6LQD/+0Qgf+ekmGA3blh2YS7mrQgxVusZYA6OGAzuhy/hLpC86IPx
         l2PgLLpxityVXYdINJuYSBUs565r2nIgCwqV0jtzlk066uVRoYd1Mb/c1DNvXrwoW8ON
         +iN8tDFXWzCxuRvYZaeLHlUSObhKkclVfoPhOozNET/Sb8FNP6cav3KidU+TM3r4hCDc
         zRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dRdxU4Ux/WYb9oau9qsh6pPUNLeWhKGZpVjne6FmQCA=;
        fh=2YMDnQ3SxoZ0TW62CmU2DrPnMMetFtoAQMKRN2o0WyY=;
        b=WJvFHBB41mDHJ4Ab67FaQcqgOuui+BcGBlczv2c8ypmAQgBU36QCY9iEJ3Hw55Cghb
         LkDRcBQzlhoISurU9gryDU5rr+oPUtvEqKVqMw0NAVPZwYBOoDL/T5Z/MIG1UXWYf4p2
         dmsYh5K3H8rbT4XfWJ8PRIrW52lJzL1Z9LSJW8WUw4ZuPxoZY6Ve+RTfIxTOyLG6bM7f
         Hr9JsygyDpdviura0WbMIO0Su3QhxlpLLQAdhd2u2mSc5RpSjZGs2JWh6oqpDNHlPzVP
         dpHT4D7NKDT/qT+jt24wwwECXdh/Wlpo+R36F6VyqnCEm/MqXQLUda8wnCPYedpSMJg/
         K17A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFFvLQ7u;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lf10-20020a170907174a00b00a2714f6863csor31899ejc.4.2024.01.19.03.14.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 03:14:31 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFFvLQ7u;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662871; x=1706267671; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRdxU4Ux/WYb9oau9qsh6pPUNLeWhKGZpVjne6FmQCA=;
        b=wFFvLQ7uLV86MdEMIHyN6kx/WKaMpTcZZ875aM9K102XfBC/awP/ylp5K3qpx4SC6J
         rwpJRWmnnQL/bZYYJn+/De6aIzMHrRuCUYNgjnmxF+WKPWEsWIWjVYSgTUIXUa7syJti
         VBHTCoPlNLzag7p3TUZcv863pQ7WzBc+9+WnJlxytkixlihYj/pKc4fcmGTAYt1a5lbM
         UwI3o3u+Yh/W45jcN/Ku7ECdWUzPeCGYwF/Gek/5Xi1/B8dF3C9RAerl9DQd6XIerSQL
         MEXfu7iFOV8BdRv7bm1YWvJTadIt+uFs56NPtyL95lNtnIfQVqiJV9kLoY1CCwKHH8V0
         lrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662871; x=1706267671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRdxU4Ux/WYb9oau9qsh6pPUNLeWhKGZpVjne6FmQCA=;
        b=RZIChUKpATEM6hN0K4Pqls2+8fJB+D19Vf6rHYKhtIyj61BantBOTtG65QL1slmuf0
         AZViLnZclQDQqM4mS5rpJS/mo6U/tW4Oa8jlIT25ag82jVOGDF2z5ulmy0eqb9m0af7F
         sAUIfOfQdwBD9nbzwrqfdBDnvx+EVZyXpTvkMMjn64TMm1gpW7PhN2bDZx3gjWXfPcpZ
         2UeIF9MdjO5NutSn7MOlHgwDnc07HYVXQ+4fUuJn+TUcqdWrBWqJhOD3lJmJOTQsM7Wn
         vkThA3mj02Q5lDUJjh0N9j1ho/PyjZSXQh2Ec9ahZyjZVhRbrD4He6v3AYRt+4i4ATVP
         kSdA==
X-Gm-Message-State: AOJu0YxxA0Xdm/BwpvVJA+MCapGIiMSUdWdD6QUUsFXFXJqvMWxUFsr8
	hNFirBhCPReWwmHBpn9pGZmvAk7Wy5tUiucywA7MVqD3uTif4O57uei+n3wSAeV8+A==
X-Google-Smtp-Source: AGHT+IF+7XPCWKeLDrzf6iHr4qRyOyhOD+FEWclxYKDEEIwHcmnG5F2DBjnw5UTyO1yybUu3tkl6kw==
X-Received: by 2002:a17:906:f190:b0:a26:ea22:e62b with SMTP id gs16-20020a170906f19000b00a26ea22e62bmr1295323ejb.43.1705662871389;
        Fri, 19 Jan 2024 03:14:31 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-114.109.242.227.tellas.gr. [109.242.227.114])
        by smtp.gmail.com with ESMTPSA id vq9-20020a170907a4c900b00a2ca97242d5sm9283321ejc.120.2024.01.19.03.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:14:31 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/6] hw/arm/xen_arm.c: convert DPRINTF to tracepoints
Date: Fri, 19 Jan 2024 13:14:21 +0200
Message-Id: <49905a0d22aa80956645d6dd74e9bc098c56555b.1705662313.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
References: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: tdNdeZdEwWQi

Tracing DPRINTFs to stderr might not be desired. A developer that relies
on tracepoints should be able to opt-in to each tracepoint and rely on
QEMU's log redirection, instead of stderr by default.

This commit converts DPRINTFs in this file that are used for tracing
into tracepoints.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/trace-events |  7 +++++++
 hw/arm/xen_arm.c    | 26 +++++++++++++++-----------
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index a6a67d5f16..e3f5d677d7 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -81,3 +81,10 @@ strongarm_ssp_read(uint64_t addr) "Bad register 0x%zu"
 strongarm_ssp_write_wrong_data_size(int v) "Wrong data size: %i bits"
 strongarm_ssp_write_wrong_data_size_invalid(void) "Attempt to use SSP LBM mode"
 strongarm_ssp_write_bad_register(uint64_t addr) "Bad register 0x%zu"
+
+# xen_arm.c
+xen_create_virtio_mmio_devices(int i, int irq, uint64_t base) "Created virtio-mmio device %d: irq %d base 0x%lx"
+xen_init_ram(const char *hi_xor_low, uint64_t base, uint64_t size) "Initialized region xen.ram.%s: base 0x%lx size 0x%lx"
+xen_enable_tpm_not_found(void) "Couldn't find tmp0 backend"
+xen_enable_tpm(uint64_t addr) "Connected tpmdev at address 0x%lx"
+xen_arm_init(const char *msg) "%s"
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index a5631529d0..a024117d22 100644
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
 
@@ -117,15 +119,13 @@ static void xen_init_ram(MachineState *machine)
     memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &ram_memory,
                              GUEST_RAM0_BASE, ram_size[0]);
     memory_region_add_subregion(sysmem, GUEST_RAM0_BASE, &ram_lo);
-    DPRINTF("Initialized region xen.ram.lo: base 0x%llx size 0x%lx\n",
-            GUEST_RAM0_BASE, ram_size[0]);
+    trace_xen_init_ram("lo", GUEST_RAM0_BASE, ram_size[0]);
 
     if (ram_size[1] > 0) {
         memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &ram_memory,
                                  GUEST_RAM1_BASE, ram_size[1]);
         memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
-        DPRINTF("Initialized region xen.ram.hi: base 0x%llx size 0x%lx\n",
-                GUEST_RAM1_BASE, ram_size[1]);
+        trace_xen_init_ram("hi", GUEST_RAM1_BASE, ram_size[1]);
     }
 }
 
@@ -158,7 +158,7 @@ static void xen_enable_tpm(XenArmState *xam)
 
     TPMBackend *be = qemu_find_tpm_be("tpm0");
     if (be == NULL) {
-        DPRINTF("Couldn't fine the backend for tpm0\n");
+        trace_xen_enable_tpm_not_found();
         return;
     }
     dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
@@ -168,7 +168,7 @@ static void xen_enable_tpm(XenArmState *xam)
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, xam->cfg.tpm_base_addr);
 
-    DPRINTF("Connected tpmdev at address 0x%lx\n", xam->cfg.tpm_base_addr);
+    trace_xen_enable_tpm(xam->cfg.tpm_base_addr);
 }
 #endif
 
@@ -179,8 +179,11 @@ static void xen_arm_init(MachineState *machine)
     xam->state =  g_new0(XenIOState, 1);
 
     if (machine->ram_size == 0) {
-        DPRINTF("ram_size not specified. QEMU machine started without IOREQ"
-                "(no emulated devices including Virtio)\n");
+        trace_xen_arm_init("ram_size not specified. "
+                           "QEMU machine started "
+                           "without IOREQ "
+                           "(no emulated devices"
+                           "including Virtio)");
         return;
     }
 
@@ -194,7 +197,8 @@ static void xen_arm_init(MachineState *machine)
     if (xam->cfg.tpm_base_addr) {
         xen_enable_tpm(xam);
     } else {
-        DPRINTF("tpm-base-addr is not provided. TPM will not be enabled\n");
+        trace_xen_arm_init("tpm-base-addr is not provided."
+                           "TPM will not be enabled");
     }
 #endif
 }
-- 
γαῖα πυρί μιχθήτω
