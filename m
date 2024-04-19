Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498109ejd;
        Fri, 19 Apr 2024 09:00:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgF1OhPJMf5Myh/f0tsI/aO2Zprc42plc2j5desaSIWgNLvlM4sZh6HVoNkjmsvJHZnN4Azc5fuQWf+JuJCtpjy4/ziRXU
X-Received: by 2002:a05:600c:35d0:b0:417:d01a:6d64 with SMTP id r16-20020a05600c35d000b00417d01a6d64mr2236317wmq.5.1713542401658;
        Fri, 19 Apr 2024 09:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542401; cv=none;
        d=google.com; s=arc-20160816;
        b=hnlMC6Q7gLr3R/65dG06boFBbuPyDvCt+CxkqTPO7cEq2zzsdKrZB3Fh4FwZHbB2MV
         EBmQU34QeR69FzGTZodc8XYDUamTOtMNg60ojokme9k2t6u/HjIMFpluyVpolsRMIy/J
         OD3sYhzPCBFKV1YXxg4ixL6zaiuX+Vp9TtO0srs0MATxQgurIUpIz++SMcNNEgs472lO
         kx7buiftciCDNcOekocb+lfB9OGnxYz0Spzmlrpyu4DznBMAUQbb7TyCkR80DQIa07Bo
         nzbrEobW8lAZcFB7YeWVu+7lCun0zt2KFqknrZAUGPTFWD8BbSla/vpnSZtKrHpPGBGK
         S6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=O6P7o8S6krw4zIbaWf8/FAfVFQ5WX21YqyvLNU1xBMQ=;
        fh=MBF7YJpy6ertE4SMfiEd/anZH2I7ce5qU+jDqEfVsJk=;
        b=PO1ASN1A1xomcNGd/RpLm8bfHX91DO6kdaOmozMEsy/Q1KxcGiwmZW0X8mVemreMbl
         PM5R7Rbb1PuoGJ4+kiGZA0fE1XXF651dehecSl6RzxpKL0M7fP8JMOt+66PDoEMQEs/W
         yzJLVTXdIB9kSVNLfqQy92Zg82xBOVhjWuC9WjsKMegnCxl2qjqExL8ltDo3wTJa/0a2
         XxyubI5rxDhj6lcjdkwhFchDVaDrjh7xPhZH+To8/WBUzz3tuCGT15wgoWp87ZDvDzL/
         DLrZcgkqtapdc9L5W5L0Aq5EkpeiW3W/f4whPUbUOMvzF0dCVCwvWDFt86jVzJGzc42Y
         qFKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1GKXRBF;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t18-20020a05600c199200b00418e86853a1sor955010wmq.0.2024.04.19.09.00.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 09:00:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1GKXRBF;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542401; x=1714147201; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6P7o8S6krw4zIbaWf8/FAfVFQ5WX21YqyvLNU1xBMQ=;
        b=m1GKXRBFnu7xo9dKfXsPyccjyMndTU3AlP1qoIRPspBzRlFTnJanuZmK0CxxchCaZ9
         CDfv8xDfkqdRxhFCoJz0yhB4TdCsNMmF65UC37Ie+SVupdH8Co5feY+/y7FDUHM4xXRu
         c5T7LTFXJ6IBW+yrQVJmUaPVClYp3isCTvKId3ARq4qdvx8RryTTedzKWGAX+FncPQG+
         9TBpU5nY9bFdZKRRf5vDrKv/7vTn+7Sqw0Fx6HIatz4qeX1RzNxRBIJecNHHCYkvsUaI
         /p0GJEXmHPELLggpPuOhoZ5O11946cnKOmW79NZWB3L+McIVA08Z8zn/hi5rLeLZWXtW
         jg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542401; x=1714147201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6P7o8S6krw4zIbaWf8/FAfVFQ5WX21YqyvLNU1xBMQ=;
        b=u8/xLLp4wiV/48fFA79cxHwB5UZTHR09kykwTVOQHstRc60ZnoaoybPMTJLhWYVvgc
         QvQELe+4HW0/SXqHUOWM1t107blUC/iFio4v/oUd+tfEveIKlAJqFvColjOmxcPZMnrT
         vcK7/SP97Uu6WkcJA70qXiLVvQz1K/9Sg/UxoS/meT/A8aYHjkOo8sXHYI07q3cSaFbK
         26W6kLz5rFaTZvY7jeJrIir7wvMS3fwCA+ToFIhOEsJWOSaq37+5qa9ViWpg5HGXKlAP
         UrVYFOLZJFL3xJ0URbQGrCGh+gN/cfcnEhdZmM5DczereIJ+LkwS+hbqrU3FLwbO4l8N
         /19Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6A+eo6fHEqAQpL9H+FFsDhRDuh4UVx8b1eM4uV6iD9BfB+Vksqdh0otcakpCWr3ibBpjT+9dPrKabKKZ61n4Qr/snZE5Y
X-Gm-Message-State: AOJu0YzdkgAu6C0LCP4GByKICc56gixmXZ/OjtJhmZ0v1I4AhqZep634
	RkxygqkdUPLFelFe9XJB3BXCovWHkieG4yYISByFnBnQ+ztI1UYA6kBATEnhFKAqGQ==
X-Google-Smtp-Source: AGHT+IFEr1Eo5za6le6H3Fb4UwnWLTfpVCPtzDo/B+w0JhgSprFb67NzI/c2JAIDkViPEw6yFPK5mA==
X-Received: by 2002:a05:600c:4ec8:b0:418:bdcd:e59b with SMTP id g8-20020a05600c4ec800b00418bdcde59bmr4354518wmq.7.1713542401270;
        Fri, 19 Apr 2024 09:00:01 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 09:00:01 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 22/22] hw/arm/virt: Use RAM instead of flash for confidential guest firmware
Date: Fri, 19 Apr 2024 16:57:10 +0100
Message-ID: <20240419155709.318866-24-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KzrT+PLrvDUg

The flash device that holds firmware code relies on read-only stage-2
mappings. Read accesses behave as RAM and write accesses as MMIO. Since
the RMM does not support read-only mappings we cannot use the flash
device as-is.

That isn't a problem because the firmware does not want to disclose any
information to the host, hence will not store its variables in clear
persistent memory. We can therefore replace the flash device with RAM,
and load the firmware there.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: new
---
 include/hw/arm/boot.h |  9 +++++++++
 hw/arm/boot.c         | 34 ++++++++++++++++++++++++++++++---
 hw/arm/virt.c         | 44 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index 80c492d742..d91cfc6942 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -112,6 +112,10 @@ struct arm_boot_info {
      */
     bool firmware_loaded;
 
+    /* Used when loading firmware into RAM */
+    hwaddr firmware_base;
+    hwaddr firmware_max_size;
+
     /* Address at which board specific loader/setup code exists. If enabled,
      * this code-blob will run before anything else. It must return to the
      * caller via the link register. There is no stack set up. Enabled by
@@ -132,6 +136,11 @@ struct arm_boot_info {
     bool secure_board_setup;
 
     arm_endianness endianness;
+
+    /*
+     * Confidential guest boot loads everything into RAM so it can be measured.
+     */
+    bool confidential;
 };
 
 /**
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 9f522e332b..26c6334d52 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1154,7 +1154,31 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     }
 }
 
-static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info)
+static void arm_setup_confidential_firmware_boot(ARMCPU *cpu,
+                                                 struct arm_boot_info *info,
+                                                 const char *firmware_filename)
+{
+    ssize_t fw_size;
+    const char *fname;
+    AddressSpace *as = arm_boot_address_space(cpu, info);
+
+    fname = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
+    if (!fname) {
+        error_report("Could not find firmware image '%s'", firmware_filename);
+        exit(1);
+    }
+
+    fw_size = load_image_targphys_as(firmware_filename,
+                                     info->firmware_base,
+                                     info->firmware_max_size, as);
+    if (fw_size <= 0) {
+        error_report("could not load firmware '%s'", firmware_filename);
+        exit(1);
+    }
+}
+
+static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info,
+                                    const char *firmware_filename)
 {
     /* Set up for booting firmware (which might load a kernel via fw_cfg) */
 
@@ -1205,6 +1229,10 @@ static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info)
         }
     }
 
+    if (info->confidential) {
+        arm_setup_confidential_firmware_boot(cpu, info, firmware_filename);
+    }
+
     /*
      * We will start from address 0 (typically a boot ROM image) in the
      * same way as hardware. Leave env->boot_info NULL, so that
@@ -1243,9 +1271,9 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
     info->dtb_filename = ms->dtb;
     info->dtb_limit = 0;
 
-    /* Load the kernel.  */
+    /* Load the kernel and/or firmware. */
     if (!info->kernel_filename || info->firmware_loaded) {
-        arm_setup_firmware_boot(cpu, info);
+        arm_setup_firmware_boot(cpu, info, ms->firmware);
     } else {
         arm_setup_direct_kernel_boot(cpu, info);
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index bed19d0b79..4a6281fc89 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1178,6 +1178,10 @@ static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
 
 static void virt_flash_create(VirtMachineState *vms)
 {
+    if (virt_machine_is_confidential(vms)) {
+        return;
+    }
+
     vms->flash[0] = virt_flash_create1(vms, "virt.flash0", "pflash0");
     vms->flash[1] = virt_flash_create1(vms, "virt.flash1", "pflash1");
 }
@@ -1213,6 +1217,10 @@ static void virt_flash_map(VirtMachineState *vms,
     hwaddr flashsize = vms->memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = vms->memmap[VIRT_FLASH].base;
 
+    if (virt_machine_is_confidential(vms)) {
+        return;
+    }
+
     virt_flash_map1(vms->flash[0], flashbase, flashsize,
                     secure_sysmem);
     virt_flash_map1(vms->flash[1], flashbase + flashsize, flashsize,
@@ -1228,6 +1236,10 @@ static void virt_flash_fdt(VirtMachineState *vms,
     MachineState *ms = MACHINE(vms);
     char *nodename;
 
+    if (virt_machine_is_confidential(vms)) {
+        return;
+    }
+
     if (sysmem == secure_sysmem) {
         /* Report both flash devices as a single node in the DT */
         nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
@@ -1263,6 +1275,26 @@ static void virt_flash_fdt(VirtMachineState *vms,
     }
 }
 
+static bool virt_confidential_firmware_init(VirtMachineState *vms,
+                                            MemoryRegion *sysmem)
+{
+    MemoryRegion *fw_ram;
+    hwaddr fw_base = vms->memmap[VIRT_FLASH].base;
+    hwaddr fw_size = vms->memmap[VIRT_FLASH].size;
+
+    if (!MACHINE(vms)->firmware) {
+        return false;
+    }
+
+    assert(machine_require_guest_memfd(MACHINE(vms)));
+
+    fw_ram = g_new(MemoryRegion, 1);
+    memory_region_init_ram_guest_memfd(fw_ram, NULL, "fw_ram", fw_size, &error_fatal);
+    memory_region_add_subregion(sysmem, fw_base, fw_ram);
+
+    return true;
+}
+
 static bool virt_firmware_init(VirtMachineState *vms,
                                MemoryRegion *sysmem,
                                MemoryRegion *secure_sysmem)
@@ -1271,6 +1303,15 @@ static bool virt_firmware_init(VirtMachineState *vms,
     const char *bios_name;
     BlockBackend *pflash_blk0;
 
+    /*
+     * For a confidential VM, the firmware image and any boot information,
+     * including EFI variables, are stored in RAM in order to be measurable and
+     * private. Create a RAM region and load the firmware image there.
+     */
+    if (virt_machine_is_confidential(vms)) {
+        return virt_confidential_firmware_init(vms, sysmem);
+    }
+
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(vms->flash); i++) {
         pflash_cfi01_legacy_drive(vms->flash[i],
@@ -2367,7 +2408,10 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.get_dtb = machvirt_dtb;
     vms->bootinfo.skip_dtb_autoload = true;
     vms->bootinfo.firmware_loaded = firmware_loaded;
+    vms->bootinfo.firmware_base = vms->memmap[VIRT_FLASH].base;
+    vms->bootinfo.firmware_max_size = vms->memmap[VIRT_FLASH].size;
     vms->bootinfo.psci_conduit = vms->psci_conduit;
+    vms->bootinfo.confidential = virt_machine_is_confidential(vms);
     arm_load_kernel(ARM_CPU(first_cpu), machine, &vms->bootinfo);
 
     vms->machine_done.notify = virt_machine_done;
-- 
2.44.0
