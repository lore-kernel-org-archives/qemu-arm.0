Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516D3CA5FE5
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:24:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjki-0007aN-Gz; Fri, 02 Oct 2026 16:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkg-0007Ww-7J
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:06 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkd-0005qI-W8
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:05 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2d747f01363so51438185ad.2
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972462; x=1791577262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j+ANu5/w+3rJ4mUcgJRlo2PrYM3VCrz9wWUfzRyMbAU=;
 b=RGAX3AqNPOothrIS3hj+FrR+/Td0rKOKRrG3d5nnMfJ8qnsENM34+jdK7M8W5xP5um
 Qhec9Y7kj6Xomv07QqtufYCMUKXXRzUVPdl8Rd1HCYCYn2ztB6/LWCi4wADb/CPEag/T
 TLTbAkLQy43RYU5KFJdcm1tOTyFai2ZP7NWtw2cUMf4jrUEt36UCM+oUsbOhuhbX/hHb
 8YQKR8mc90pQbs+DWIkHfT+J0Pxpi8txFZ1l9NQL30Ejodi0EelU7D5FwoQytHL8KK8G
 UTgyZw6Jms0b+qQNqc/0n1Y6T0qraLTvoLosuH5tBkcixNTVQKrrB1L8Z/HhY2Ex5bJ7
 w4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972462; x=1791577262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=j+ANu5/w+3rJ4mUcgJRlo2PrYM3VCrz9wWUfzRyMbAU=;
 b=DNS/Rn7jthh/+bGS3jvha27BD8ulQa/WaJlanjSQ/aKpEizxfn2MbgDsGtlOeEs3Pb
 kM6+C+FGmpcPMZCBMAiz4zbpBxtrOfIruY9eigdyq36Nv/1kR31fFpHJ2ub3UWDgdnd/
 reS3vpPrgvlU+y7wtEqG15Rah/jMcMlxRF1LeOWmGqYRif/ViocUgaIjcBfsknXPPBu5
 MtKuP2K/N1iSFyjkH5QKMxXl6vaXN8lmKMUACHnaxt1Pw1jCGu4fj1Y7yRlqSXlNn96x
 BKRdVsHBu4J+zzhvaPXYZyV6FneIeHvIojyirqzUt7DnX83tkB4qerxExUVpx6h7fSqh
 bsQQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxNbfCHg25x4PL8h1G9Y/CvYHWjfwdjxm6B3WCKwxlAzUYGHUI9dwl+JCGdIpLW/hMPD83Zz3OxTw==@nongnu.org
X-Gm-Message-State: AFq9FYIVgqxB/nhNZzEnzIDt9xURfcC/7hxdxs4IjOn2PTMGtqdqQVNl
 CThTgc9GsqmJ8672WCKTzingakuqgNvpDitIX7MQyoGAH62Z5YVZiaK6iSsDDnIFQj4=
X-Gm-Gg: AYBFou2zm8a+nQcgJ86InAQ2rY9nHS8DhBvbiO4Qt9Tv6S//F23oba77PKS5OeILqVA
 xXqoQhxCPSgLVB52mxI8yIBI0hOAd1MzfvEkcUESPKsKihaC11TnaMGABA0Nt4jscOU490kphao
 5MAWy70fU4whoK6S5V955mOobLtzpT926Xp7Ax6SH/rvoD6Zzh4OWV7wIEaDmnQtHqqaaBPGE5C
 qDZgxH3LSMOK14kyr0utm8esi8SA37cMafu5FD7LSfoVPfNYhgbz4tA6bKu2+zgPNCCPkzOvzJA
 p7ZKpq8t2hf2uhDIdWXhwGwbjY7ZX8EYVgY1ufZDfWoMCQK71/R7Sx5EduYEaTTrOuxQQWkk++r
 NJSYWk2xYYV3IINBrvR5pEzm6QSZo6fUE23aqprPxfsFCI50ChvBE59C3Te2yhPTMbVPS0VRoDw
 JbySD8PuhF3Y8bnnrpXS2P7sfAbYZFmV0UXQc4ge3bV5rLIjrke2tg5YPi7yLcX7unZ7vEDbHPb
 W0k5pKaDwvSk0unVRwOwhli
X-Received: by 2002:a17:902:d98c:b0:2df:8b9e:f87b with SMTP id
 d9443c01a7336-2e49b64e333mr34944315ad.15.1790972462440; 
 Fri, 02 Oct 2026 13:21:02 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:21:01 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 18/22] hw/arm/virt: Use RAM instead of flash for confidential
 guest firmware
Date: Fri,  2 Oct 2026 14:20:22 -0600
Message-ID: <20261002202026.1204110-19-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

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
index 886ea7a97ea0..7accb9f55ec8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1816,6 +1816,16 @@ static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
 
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
@@ -1866,6 +1876,16 @@ static void virt_flash_fdt(VirtMachineState *vms,
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
@@ -1901,6 +1921,32 @@ static void virt_flash_fdt(VirtMachineState *vms,
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
@@ -1909,6 +1955,15 @@ static bool virt_firmware_init(VirtMachineState *vms,
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
@@ -3271,7 +3326,10 @@ static void machvirt_init(MachineState *machine)
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
2.43.0


