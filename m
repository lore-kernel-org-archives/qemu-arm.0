Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48554606A31C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tZj3LdyU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXuD-0005Re-0s; Mon, 09 Nov 2026 17:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXu3-0005JP-NA
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:52 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXu1-0003xW-KL
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:51 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-8a06e79e152so737029b3a.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263508; x=1794868308; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h5Uqi6g/D0f15AV2QVQ/dcG50oz8u/1r9m7QJ4cPsVg=;
 b=tZj3LdyUWO62dWvigsEwpmvn3TQQk1JCKvLxnEUovol1rsi7onGNDENItnkQpjvfms
 pmfPqx6FT9lMXlA10UP0Thv9ObAbiLlIlJA6VudT6TxQjrfsYS9bhoPkoHzS5sMWxD4C
 Gt412B2dScLUMmANz7IiaiSRXxslJFp1lOtQPyXjAV0Tvzv2zc5JSFxVPBfm7ovPhoBf
 9j1AsdulDp7qi7PxOwZRIQSzFegnXy6ldzZbHtR1c7e6H7DQsdCf1cteu1J97H8ShO03
 vrKdzjiigx0I/YC1cFx2iZwuIGTvNfOA0nylzoMtW5OSXqM5FFC61vLy2Sbacse7x53j
 OjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263508; x=1794868308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=h5Uqi6g/D0f15AV2QVQ/dcG50oz8u/1r9m7QJ4cPsVg=;
 b=LptzbEJ+X2WlWTOvGLd9XA6+VFj3Pkm7QAui6i0Tvhb+qh1R6qumzSQ6zR3cr0o63t
 dC6oeMur7SIPhIfCVSHohnl66m/ps9ojybxG+kEBC4sjYOljk5U6kklEUxb8filX94sE
 scSXAIufYpzgI3jWwMJB6PzFS/tASZOXoks5wu5kqUtXXXWUcC3uS+fqoHn7l7qMKP3X
 iD+1Y74V1uRYDY4czrO8tnX0wIZqfaSU6Dh2cZs7vCIi0ydTx2wxL5o87DjHWHRjxlMN
 poKxf0Azla7TuHUJHI7jR7OnF8auJuSKsp2Q6KmjYX4s5dZi0DTVVAhxXJoufEhjpByN
 h+Qg==
X-Forwarded-Encrypted: i=1;
 AL+hErHMDwZxEK+99X8GLd2pw1WglOMLx0hczYw6OQ7FxPxq4CCfGhBqlwlBkO679JJyOl6xFYCTnBBGMg==@nongnu.org
X-Gm-Message-State: APuU4Z8LceYfRDywIwvtpSmsM5otxmcivb8xnkhyItwV06SQGpyXBFj6
 m0yBGxufDArP7HrBUDPLD+erLhSENac/OjY/YYUOwdate7r96FFKM4x2wibWuXSqTV0=
X-Gm-Gg: AYBFou2UqYPYNuZ4gu03xi8ErNrAfGoJS04hKiOFBFZLA+0wnWNvdhWItw2mclUO+/x
 Doazy102VI8LC7CB6kG8mvVckyoi4BM4zBx4PzeoFkuhKqrkKXT5v99Vrd05KXVIYh/ACpc8Z04
 lrZIkPD9ZwPfGduUZjR9aTMbITVPUfgW7CGGIo1WrhAJKN1MMcQxerbBzGZW8qUGOi9F3khR8jL
 1MSlb3AcvefPkNqdy+EZC1MthM+WUmGbCTuRWWf4imtgXjWJvOT30lHxmb1DCw4A+QLjf4KvjWO
 W9QKb7OlqHhbr82sYg/k4UT4tV+DNykCBVuyc3cs6PFDyeVhRYUlmAphT5zLBWUkOOarycT1cKk
 k8/dc8mOOWLt+sS+xCMGVi41faZl+FNQpjnTAZiqG6F+BuKMSi5jAkHinwyGr3dV2Brr30AfF0D
 EbM6U93J5Kde+G9QN4Lh9jl0ODE/IfaeU8elOcBat0k6sale1ot5h+f65AR1YlgNtWzWywEFrTW
 wU72v+ZG0n7m5fwnB/qcGbz2TgMBrEgHxSwpGBI/Jnlx7HE7rqQ4ulZi2dBiMxnrRUiONWZ6YHF
 RoNI4w5eUZiuvsFDMA/DMhNvWF2NboIX2zlqz+R/MR06W/vM3/pX1A==
X-Received: by 2002:a05:6a20:7351:b0:3de:7add:653f with SMTP id
 adf61e73a8af0-3f18fd8b4bdmr489637637.44.1794263507627; 
 Mon, 09 Nov 2026 14:31:47 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:47 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 19/23] hw/arm/virt: Use RAM instead of flash for
 confidential guest firmware
Date: Mon,  9 Nov 2026 16:31:06 -0600
Message-ID: <20261109223110.1619504-20-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Use RAM instead of flash to store firmware image and boot information,
including UEFI variables.  That way the firmware can be measured and
included in the Realm's initial measurements.  It also prevents
variable stored in flash and modified as part of the boot process to
be leaked outside the Realm.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/boot.c         | 37 +++++++++++++++++++++++++--
 hw/arm/virt.c         | 58 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/boot.h |  9 +++++++
 3 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 9b7553dde5e1..1e8efada209f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1112,7 +1112,36 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
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
+    /*
+     * Load the firmware image in the Realm's address space.  Mapping of the
+     * firmware area in the Realm's address space is done in function
+     * virt_confidential_firmware_init().
+     */
+    fw_size = load_image_targphys_as(firmware_filename,
+                                     info->firmware_base,
+                                     info->firmware_max_size, as, NULL);
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
 
@@ -1168,6 +1197,10 @@ static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info)
         }
     }
 
+    if (info->confidential) {
+        arm_setup_confidential_firmware_boot(cpu, info, firmware_filename);
+    }
+
     /*
      * We will start from address 0 (typically a boot ROM image) in the
      * same way as hardware. Leave env->boot_info NULL, so that
@@ -1212,7 +1245,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
 
     /* Load the kernel.  */
     if (!info->kernel_filename || info->firmware_loaded) {
-        arm_setup_firmware_boot(cpu, info);
+        arm_setup_firmware_boot(cpu, info, ms->firmware);
     } else {
         arm_setup_direct_kernel_boot(cpu, info);
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f1ca233a1566..dbb5d2d6fc0c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1832,6 +1832,16 @@ static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
 
 static void virt_flash_create(VirtMachineState *vms)
 {
+    /*
+     * For Realms, the firmware image is placed directly in the guest's
+     * RAM area.  The association between the final location in the
+     * guest's RAM and the system memory is done in function
+     * virt_confidential_firmware_init().
+     */
+    if (virt_machine_is_confidential(vms)) {
+        return;
+    }
+
     vms->flash[0] = virt_flash_create1(vms, "virt.flash0", "pflash0");
     vms->flash[1] = virt_flash_create1(vms, "virt.flash1", "pflash1");
 }
@@ -1882,6 +1892,16 @@ static void virt_flash_fdt(VirtMachineState *vms,
     MachineState *ms = MACHINE(vms);
     char *nodename;
 
+    /*
+     * For Realms the firmware images are stored in the guest's address
+     * space.  As such there is no need for flash configuration in the FDT.
+     * See function virt_confidential_firmware_init() and
+     * arm_setup_confidential_firmware_boot() for details.
+     */
+    if (virt_machine_is_confidential(vms)) {
+        return;
+    }
+
     if (sysmem == secure_sysmem) {
         /* Report both flash devices as a single node in the DT */
         nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
@@ -1917,6 +1937,32 @@ static void virt_flash_fdt(VirtMachineState *vms,
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
+    assert(machine_require_guest_memfd_private(MACHINE(vms)));
+
+    fw_ram = g_new(MemoryRegion, 1);
+    memory_region_init_ram_guest_memfd_private(fw_ram, NULL, "fw_ram", fw_size,
+                                               &error_fatal);
+    /*
+     * Map the guest's firmware image directly in its address space.
+     * Copying of the firmware image itself is done in function
+     * arm_setup_confidential_firmware_boot().
+     */
+    memory_region_add_subregion(sysmem, fw_base, fw_ram);
+
+    return true;
+}
+
 static bool virt_firmware_init(VirtMachineState *vms,
                                MemoryRegion *sysmem,
                                MemoryRegion *secure_sysmem)
@@ -1925,6 +1971,15 @@ static bool virt_firmware_init(VirtMachineState *vms,
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
@@ -3289,7 +3344,10 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.get_dtb = machvirt_dtb;
     vms->bootinfo.skip_dtb_autoload = true;
     vms->bootinfo.firmware_loaded = firmware_loaded;
+    vms->bootinfo.firmware_base = vms->memmap[VIRT_FLASH].base;
+    vms->bootinfo.firmware_max_size = vms->memmap[VIRT_FLASH].size;
     vms->bootinfo.psci_conduit = vms->psci_conduit;
+    vms->bootinfo.confidential = virt_machine_is_confidential(vms);
     arm_load_kernel(ARM_CPU(first_cpu), machine, &vms->bootinfo);
 
     vms->machine_done.notify = virt_machine_done;
diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index 94386fdbea6c..fe7e14e94651 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -113,6 +113,10 @@ struct arm_boot_info {
      */
     bool firmware_loaded;
 
+    /* Used when loading firmware into RAM */
+    hwaddr firmware_base;
+    hwaddr firmware_max_size;
+
     /* Address at which board specific loader/setup code exists. If enabled,
      * this code-blob will run before anything else. It must return to the
      * caller via the link register. There is no stack set up. Enabled by
@@ -136,6 +140,11 @@ struct arm_boot_info {
 
     /* CPU having load the kernel and that should be the first to boot.  */
     ARMCPU *primary_cpu;
+
+    /*
+     * Confidential guest boot loads everything into RAM so it can be measured.
+     */
+    bool confidential;
 };
 
 /**
-- 
2.53.0


