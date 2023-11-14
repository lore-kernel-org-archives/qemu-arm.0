Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2083038ejc;
        Tue, 14 Nov 2023 06:39:28 -0800 (PST)
X-Received: by 2002:ac2:5dea:0:b0:509:493d:25a3 with SMTP id z10-20020ac25dea000000b00509493d25a3mr6087261lfq.11.1699972768245;
        Tue, 14 Nov 2023 06:39:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972768; cv=none;
        d=google.com; s=arc-20160816;
        b=R31FdzK95UXVg0UVTEKEBcUxSkXDyoCnCIpsieC1nGgaWDq8wpnfLKPg7URbwxQetr
         4GBWnqbxZ1NlUrdIRg4r51PN4IoHL1AbpBon5N9VzJ8mYm2FcFbHtNIdfkQLtFzVz8Bg
         aaX6L03zEwCtc9HL0GTwAWy27K0XavLqc6x2kuDVLXWJ4zwxwxcY/Orexfb4L7RazmAe
         Sd/I2Lmngt7jS6DzA4vK7M4dx73avjb2d8bl4TtlDFd4jqmpS+PE9eJM+iOZMIa+Nyyi
         gcUnzCaqB0ZcFBec1QTSaEMY/FbeTsX7W8fjt+XcrZEHg9vAfBhs2c9TyXm7DfZ305Sg
         Gu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BqgJC9hPHkcXARLwNhCfo2KLP+5VvJiIzbHQjbp4PnI=;
        fh=1nz8wG6UuYay2KL0jZBUp30jkEi8Ayfk1emV35/PTDM=;
        b=TX2f9A2aK61EMqaEL5yg1sphlB+PS7PhSj5r4inz3i12QkVKthcAtjO2/YBVEcWt8m
         TCYetjv2iNHoIOxF8rxz1odmANB2KysK3Y7cYuR3AW3RcaKq1pKX0XvJjaeKMP4rWTFw
         zmAckzg5VuCUPkGY0YR4byG9TcVZ5DnGC0kG+ZFASIHovgI/nqVu88ENe6h9l8wuZUn2
         2xkW78thBUakl+yW1VVTh2AmZaI5ogtXOTjHQXeeahTd2f69C3YmhgdYqXHfYVBjQFaX
         8nvF6iJU9FkrlbMO0VJzKftCS6JrAe/dN+BjNtkGgd79lw/n7fwvSJwyhAwrsxEfmPe1
         0TwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MWyW2hX3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b30-20020a19645e000000b00507c535cf6esor1756750lfj.16.2023.11.14.06.39.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:39:28 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MWyW2hX3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972768; x=1700577568; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqgJC9hPHkcXARLwNhCfo2KLP+5VvJiIzbHQjbp4PnI=;
        b=MWyW2hX3tdq9lS+MtxXMFlz/TRbKdS6iGs7wb2Nv14kSECWBIguup8aW1M5I/t9/cQ
         iqDdF5tDo/r9yuP5Mue0aUN29ESMEHB4hI+Rn1y03SM6EW+dHyEVwLCVJwFI+4BZYukg
         l0VCqRF+2rzyC6rDMkbR8xJb7nLerbjzPWV4vZt10lS0MYLlWQCixa0RxCmdwKCQhaCs
         FcSIN1Q2k5qvvcKhlz4kEHu9iMC4ii5D7cQ2PGndWg7QYO+tYrLmsCOU+KUwyg7S9yiI
         qjL0dUMWbca8eAZv/IYHSuz37v1OuoJcOYUoscPPuxW6KRq2EjHt5bvp9+j29lDcxbJm
         ccdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972768; x=1700577568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqgJC9hPHkcXARLwNhCfo2KLP+5VvJiIzbHQjbp4PnI=;
        b=uNecwPArl143OFrlgHSQI+mSimOfQLP+mhaftumuMb9/HgoROQqA8L3DsM/eTbAXaS
         LfjikmmBM7/Miai0Y1vkx5/Wlaez6l5ZC+IW7cnaYpUCBcyGg5CI06COH4erxoZpdj+W
         T6O7gzCNo6WfXfsN6cJ8bj6GzpqBnAjl+9MwIcr5ujDLK+SexXR4tCbS2MzjNSWIhq4l
         +foDQyuGN0a1xws2lTjm15OEHGcgWIPyrx7xEU1lhifxi82NzotuMeeOqsOXXAqnbyBk
         +P8qUDlpgmJGzAyF4QjApKf6UNnwDIb2uxgZjaZeRJRG5zdlHM1WByC9mK3CcnOr0PqE
         uRzg==
X-Gm-Message-State: AOJu0YxymJVPSSN2V2QE+kcI7lO6WN1B+myhdt9iaF6m/Pxxhn+NhG2j
	WlkEHXQJqHPQd6LFzE1o9JnLm8pC
X-Google-Smtp-Source: AGHT+IG5cdmuSMLF1QQ3nk9d4MKQ+Rf9u6gyzBn2OUTA0N6PdU8Lc7kj9gwB2wtfxvTcro7nwctRJA==
X-Received: by 2002:a05:6512:3d90:b0:507:9a49:2d3d with SMTP id k16-20020a0565123d9000b005079a492d3dmr7641727lfv.31.1699972767814;
        Tue, 14 Nov 2023 06:39:27 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id c19-20020a50f613000000b00542d3e470f9sm5256915edn.10.2023.11.14.06.39.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:39:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 v2 10/19] hw/xen: Rename 'ram_memory' global variable as 'xen_memory'
Date: Tue, 14 Nov 2023 15:38:06 +0100
Message-ID: <20231114143816.71079-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /mEX70gGH9OB

To avoid a potential global variable shadow in
hw/i386/pc_piix.c::pc_init1(), rename Xen's
"ram_memory" as "xen_memory".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h |  2 +-
 hw/arm/xen_arm.c                |  6 +++---
 hw/i386/xen/xen-hvm.c           | 10 +++++-----
 hw/xen/xen-hvm-common.c         |  6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 4e9904f1a6..d3fa5ed29b 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -16,7 +16,7 @@
 #include "qemu/error-report.h"
 #include <xen/hvm/ioreq.h>
 
-extern MemoryRegion ram_memory;
+extern MemoryRegion xen_memory;
 extern MemoryListener xen_io_listener;
 extern DeviceListener xen_device_listener;
 
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index a5631529d0..8a185da193 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -111,17 +111,17 @@ static void xen_init_ram(MachineState *machine)
         block_len = GUEST_RAM1_BASE + ram_size[1];
     }
 
-    memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
+    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
                            &error_fatal);
 
-    memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &ram_memory,
+    memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &xen_memory,
                              GUEST_RAM0_BASE, ram_size[0]);
     memory_region_add_subregion(sysmem, GUEST_RAM0_BASE, &ram_lo);
     DPRINTF("Initialized region xen.ram.lo: base 0x%llx size 0x%lx\n",
             GUEST_RAM0_BASE, ram_size[0]);
 
     if (ram_size[1] > 0) {
-        memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &ram_memory,
+        memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &xen_memory,
                                  GUEST_RAM1_BASE, ram_size[1]);
         memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
         DPRINTF("Initialized region xen.ram.hi: base 0x%llx size 0x%lx\n",
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f42621e674..1ae943370b 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -149,12 +149,12 @@ static void xen_ram_init(PCMachineState *pcms,
          */
         block_len = (4 * GiB) + x86ms->above_4g_mem_size;
     }
-    memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
+    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
                            &error_fatal);
-    *ram_memory_p = &ram_memory;
+    *ram_memory_p = &xen_memory;
 
     memory_region_init_alias(&ram_640k, NULL, "xen.ram.640k",
-                             &ram_memory, 0, 0xa0000);
+                             &xen_memory, 0, 0xa0000);
     memory_region_add_subregion(sysmem, 0, &ram_640k);
     /* Skip of the VGA IO memory space, it will be registered later by the VGA
      * emulated device.
@@ -163,12 +163,12 @@ static void xen_ram_init(PCMachineState *pcms,
      * the Options ROM, so it is registered here as RAM.
      */
     memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo",
-                             &ram_memory, 0xc0000,
+                             &xen_memory, 0xc0000,
                              x86ms->below_4g_mem_size - 0xc0000);
     memory_region_add_subregion(sysmem, 0xc0000, &ram_lo);
     if (x86ms->above_4g_mem_size > 0) {
         memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi",
-                                 &ram_memory, 0x100000000ULL,
+                                 &xen_memory, 0x100000000ULL,
                                  x86ms->above_4g_mem_size);
         memory_region_add_subregion(sysmem, 0x100000000ULL, &ram_hi);
     }
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 565dc39c8f..cf4053c9f2 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -9,7 +9,7 @@
 #include "hw/boards.h"
 #include "hw/xen/arch_hvm.h"
 
-MemoryRegion ram_memory;
+MemoryRegion xen_memory;
 
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
                    Error **errp)
@@ -26,7 +26,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
         return;
     }
 
-    if (mr == &ram_memory) {
+    if (mr == &xen_memory) {
         return;
     }
 
@@ -53,7 +53,7 @@ static void xen_set_memory(struct MemoryListener *listener,
 {
     XenIOState *state = container_of(listener, XenIOState, memory_listener);
 
-    if (section->mr == &ram_memory) {
+    if (section->mr == &xen_memory) {
         return;
     } else {
         if (add) {
-- 
2.41.0
