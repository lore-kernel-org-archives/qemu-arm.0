Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569368njc;
        Mon, 25 Nov 2024 11:59:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAtfUdQ6ja0Z17s5UpiWV+O65KSrmLoEp1zPMsta4c4pRcdKTlFQhotGT5gyIDjg9rLtpb/qUXDm1SPw==@linaro.org
X-Received: by 2002:a05:600c:1d22:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-433ce4c1f63mr125214615e9.24.1732564776615;
        Mon, 25 Nov 2024 11:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564776; cv=none;
        d=google.com; s=arc-20240605;
        b=MRpLQ7o/wI/+txCz02Ji/DHtn33Om7HTcHhHnDFwRd77mKBC26LVrC/cuPMW2hgXcr
         kb0qY/CULAlOmLDGLWyrl6SD1wclv4hrK/n24teO3xcuWTNz//1INBw9tagfMvKfIIJS
         RMW3dpJW/VLeMfNdl8LTIsp4+eY3rwmsc46mt2OxiKm3MwkStlZTQ3Vn+v7aHd9BEFie
         B6q1y1/UChC6mmU/CsXppPL/CLr0kra+p1e5q4rOPd7QgDdfnQv2LA4IfSGGREW+h6uj
         yHF7ghC7VQU/F7W68PdtGB4k/ZwMKnt/luNEklv8QZV8muMmW9i1x95VT4UKCoaPvClB
         5M2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/1bXq+74SiZeUGfQFbFaJNCrHb1OmghaBQp3KgUN++M=;
        fh=N4xF2a6naWSUXQrviAiGHffH+LHVdyU46C4Cm2+uGAU=;
        b=LX2BKwMbs1TaQvs7v5cQvqh34psxO2DWZm0xyq+E7AhMQ0t+Pms5xvCZ+MEJfdHuhb
         9PIq9haUQGu9CDzyMyv/eCcZIPt8UTJ35mb/Nfd+2W6vfcPdc1Aw23zw27xDMnbNMHb2
         /RxgXPsWcguoy/hROg9jQdwP/79sh+SY9XOsYuygrwk7L73V4Oq4pwtiSpmHa0Lk1MgY
         9gT6P+q4UmAmockpgNxpH9ZSEGpGSQ+9iHzL2MrArk9l+dGjWCWLMWTMP7PAjHCPdUUu
         K7CId+/LAuVgdBMgZmxGwq8ZjOluM/XDuXz7dzyslaQG2og+a9zpwYsahk5w8+nNn7yW
         FRHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lyUs2JAq;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-433cd84fe51sor37039515e9.12.2024.11.25.11.59.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lyUs2JAq;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564776; x=1733169576; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1bXq+74SiZeUGfQFbFaJNCrHb1OmghaBQp3KgUN++M=;
        b=lyUs2JAqN6HujImALpDL+k7g4ZV6wuIDGyVuYsC3DfbpRSL5TnKpzNQoB2ZXY+RQR3
         p40u/XuJxSVenftPNY5Pa9FtKHkjfOEqXNG785HIecvmMGYhoclsv1SNTY0ipZyca6Vx
         40gLWdNJgm6oOkC1h6rnmixNjsJ9qbOSZaMsJY2RR5v3HzvZYy8jSuaIZZzlEgfZ+pal
         TsQtNHtvoPkhG/0H0AwFOyT+3bqlQP3y38cuj/EZzQTomwicACQXqUNQ5dIWM/NahHEG
         pRW3zHsoV30RKMq9FEJz9mCJHAEtfR8mOqEurPtPK/onpGUEQXl/i0FX1o5GZAv702Ip
         Fhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564776; x=1733169576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1bXq+74SiZeUGfQFbFaJNCrHb1OmghaBQp3KgUN++M=;
        b=CgAQaKNjH5qbcZU5S+iAXEyIiqnP/yJbLcMzROKaHdeCerZ2SGn0RTh7biOw1C5HSe
         YjTfP1dxlARIuV0jw8jtm7p/C91siMSRjaa3sMaWKV8uwR+5SEs2I+N2pGpGm92JmAaH
         UAjwpvBj/tMemUdjJxWDyQHSqYHOuGFkM/pOfrS5H/aE1/nlI6nzl3L64xX6bD8xITSn
         hmd1ZwXRo/OJd6DKosgO2syMouSECoDFIOgWsBKu3HAxUAh4BZ0Y1DvN/V9KPXdXoJLG
         DudN9rQ6/EhGNo2WCSTCcSlnett+5d6qwTkq6vAGzdp4xnLaS2hyfmyYknnsjG9ZJU1N
         IxTA==
X-Forwarded-Encrypted: i=1; AJvYcCXj4YaGQuBq+aamHr0d+6T7malZil2vMt/7QFB+nVpSZo30uP5b9DzgmsSizhxDJRwfl7diGU5VeNqhHA==@linaro.org
X-Gm-Message-State: AOJu0YzQmQRv3AxL59PUdJSFmVflKcJlfYsOV1RUP6uCk7nFv9jxI/ue
	voeV53/eAULunbwtBhxrJS6wtG2YNxwV2ZV8zhAtHJZ/w9fUIU3OVQjYTGdHYkT+YictbUnmLoi
	ZCkY=
X-Gm-Gg: ASbGncvgWVutFjYf8tDZY91aeSWrdsBcm9rnhWV/8U7XYyA7y5/sLe2Iv2KtjbA3KBP
	ENBqKwITPiKYYXX6N8GLBloXJWxMeBQullT73ZrzBcv/qgj9fL7u82vc8OT37P7lrwDIkn4Dsc/
	wCei4Z+3I2QKGcLNKNjzpjF9Bnxp7Nicf3G83XaknbY/Q/Ok+GVC0ACVGRtzvNlqu88CrVIITe0
	UyRD/8Ct8zDYy2zc4l1ImeO4c9fRqCXSLMD17ciAQCpcX9WSDsT3HagZwph1nJq784I
X-Google-Smtp-Source: AGHT+IFQgR9S9GvWuMKUvIDpUn9BlZAf2a1+Fz9wP/Nv1NRFaz6POwZPlcO/sIKSbai/bFFqVIoa7g==
X-Received: by 2002:a05:6000:4026:b0:382:3400:1ee9 with SMTP id ffacd0b85a97d-38260b5d6c1mr13383314f8f.14.1732564775976;
        Mon, 25 Nov 2024 11:59:35 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:35 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 20/26] hw/arm/virt: Use RAM instead of flash for confidential guest firmware
Date: Mon, 25 Nov 2024 19:56:19 +0000
Message-ID: <20241125195626.856992-22-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8Xkk+yr4k22j

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
 include/hw/arm/boot.h |  9 +++++++++
 hw/arm/boot.c         | 32 ++++++++++++++++++++++++++++--
 hw/arm/virt.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+), 2 deletions(-)

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
index a2414b1f98..4cf7dd5b4d 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1150,7 +1150,31 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
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
 
@@ -1201,6 +1225,10 @@ static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info)
         }
     }
 
+    if (info->confidential) {
+        arm_setup_confidential_firmware_boot(cpu, info, firmware_filename);
+    }
+
     /*
      * We will start from address 0 (typically a boot ROM image) in the
      * same way as hardware. Leave env->boot_info NULL, so that
@@ -1244,7 +1272,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
 
     /* Load the kernel.  */
     if (!info->kernel_filename || info->firmware_loaded) {
-        arm_setup_firmware_boot(cpu, info);
+        arm_setup_firmware_boot(cpu, info, ms->firmware);
     } else {
         arm_setup_direct_kernel_boot(cpu, info);
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c4cf69ea33..0750c83fae 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1228,6 +1228,10 @@ static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
 
 static void virt_flash_create(VirtMachineState *vms)
 {
+    if (virt_machine_is_confidential(vms)) {
+        return;
+    }
+
     vms->flash[0] = virt_flash_create1(vms, "virt.flash0", "pflash0");
     vms->flash[1] = virt_flash_create1(vms, "virt.flash1", "pflash1");
 }
@@ -1263,6 +1267,10 @@ static void virt_flash_map(VirtMachineState *vms,
     hwaddr flashsize = vms->memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = vms->memmap[VIRT_FLASH].base;
 
+    if (virt_machine_is_confidential(vms)) {
+        return;
+    }
+
     virt_flash_map1(vms->flash[0], flashbase, flashsize,
                     secure_sysmem);
     virt_flash_map1(vms->flash[1], flashbase + flashsize, flashsize,
@@ -1278,6 +1286,10 @@ static void virt_flash_fdt(VirtMachineState *vms,
     MachineState *ms = MACHINE(vms);
     char *nodename;
 
+    if (virt_machine_is_confidential(vms)) {
+        return;
+    }
+
     if (sysmem == secure_sysmem) {
         /* Report both flash devices as a single node in the DT */
         nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
@@ -1313,6 +1325,27 @@ static void virt_flash_fdt(VirtMachineState *vms,
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
+    memory_region_init_ram_guest_memfd(fw_ram, NULL, "fw_ram", fw_size,
+                                       &error_fatal);
+    memory_region_add_subregion(sysmem, fw_base, fw_ram);
+
+    return true;
+}
+
 static bool virt_firmware_init(VirtMachineState *vms,
                                MemoryRegion *sysmem,
                                MemoryRegion *secure_sysmem)
@@ -1321,6 +1354,15 @@ static bool virt_firmware_init(VirtMachineState *vms,
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
@@ -2463,7 +2505,10 @@ static void machvirt_init(MachineState *machine)
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
2.47.0
