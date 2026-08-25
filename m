Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC54C61DC4
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:03:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzE5-0005jO-5q; Tue, 25 Aug 2026 18:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDL-0004AJ-Do
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:51 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDJ-00020l-Fo
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:51 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-39647aa9d52so361170a91.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695308; x=1788300108; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0GUEb8qrMFDYRu4TEpO3RbtQ1bMhwP3ADMRIC7mpS2I=;
 b=r8djbNISJw99/sktdVG+llz95z7UX7O9e3LmSy0EEtv2Cgm0CrGWb5fqWfXlEGeh+z
 zYJ3nzeeT/OSM4M5J5y8ystPWUKB259J3UeopzxtFxvDMxfJBtuvJjOM4T7hOpQkoIlR
 di+bQjc9tVIDTETnIy3A5rKQXULBn3rC2zaW1qzpNNYC0GTI1g8YPDRhJXIBdcY9+MyV
 nL1YDYKa5hz60kk88BNZ5nt9gTYmzJmrQZk5wtDQB7V7h2mOEYE9j+LPkIYeAkXM61gs
 kTr07mSX6wC4uf2ICk1tem9qEzqMCj2CakLPGHU+AI7VQRzWaILeQu7yTdvpRXtD6PB5
 7fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695308; x=1788300108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0GUEb8qrMFDYRu4TEpO3RbtQ1bMhwP3ADMRIC7mpS2I=;
 b=owNz835NU/is6houe/iyiqw9N0HbyYQqE8FHmNrS6Dc1D8LVglj17IvI9Bdwv5d2sN
 JplsatAiwZMXbasCq1OA7ort3zwW96e85qycs22nOXeyc3Qrp8QAAABwZ3UdakMsghlj
 Fy8107Qw5+9LZ6ux5k1no/3vsyGhPd5VceLJi3EoPfpHXt4o5pNd47t6cRDhwcXdK4KR
 29Jom0LPR6FxoUT/KVJvyLzMZpR9qIKqupJyOwL8/NouzlfHSdBgRSNfkQy8+ncO8vX8
 jG9NUT3l4izchPAU9Xw7ABCIi5LIOyLRDZWoYAJtIvOfDbcR0Wfe3dbRNJVABYLm99Qe
 i8cw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq5/O/DxFwJtaL+ArL6sk/VFE7A3Bx4PadchCOYc1l27KYgif8+FtMU/PHB5P/vdwx2LmWBRiOBAg==@nongnu.org
X-Gm-Message-State: AFuF++nClVl5BBf0u9LvP/ib3IAQtA8XH56yPpqPqon0EMMXCarQtXF8
 yjGqIzY1n9E454QxAco+uQhy8IqeHC1ChJQ2vpLgZ83BcQog8sjCVukQ8lnufwmvwL4=
X-Gm-Gg: AR+sD13583F4A5nX+e8O7xGUL24zBb/Cop8SlM1XBPG5GYVKjietcYZtD+lEfTkIQfm
 /e0RTkOpt0PfTlK/AqlG4sYdbSg54bXYEhMl3Sn0y1L0fhW8vwIWouuZ3jGcK5f9N396MMqXSSx
 H0Bb1cd91cRL5Z7UV6hbkW9J3boyJZmXtJwf6QG8GD0cICbmLm6oQmUj04juRdFRFkgIBUIuWb/
 VnUq/622VKmZF/mRtSeJNhJymbi0xGCm20/P6F/gtnhHmcnKcg845sCLlXhUTlLBEbpnRHufPVZ
 9WPLKoxoCE0eC1inOLQBRkesCYmYIG/GSmnhJSs36MCCgdswaSuj6XlAdkIR3zJSsBEhur0xogR
 /8FLd7p9S6kqRuZ14duVW9bRf4kgX4S9zPrPmfvhgKpRgX0oCdMGR/lC5vy49+P3a9xn+srzu21
 jdzQ38xLs694mTRYnlDQ6UpwleHrrta5DYjKnDZK40l2AzxZD4MPrQ/9gPJbA/l2woYXC4Ld34m
 T+iYMIVZAoqyj8=
X-Received: by 2002:a17:90b:3dcf:b0:38e:c232:9d2c with SMTP id
 98e67ed59e1d1-3966d372bf7mr2542412a91.2.1787695307862; 
 Tue, 25 Aug 2026 15:01:47 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:45 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 20/24] hw/arm/virt: Use RAM instead of flash for confidential
 guest firmware
Date: Tue, 25 Aug 2026 16:00:57 -0600
Message-ID: <20260825220101.3443954-21-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102c.google.com
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
index 780b6be63718..5e85be2bb462 100644
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
 
@@ -1163,6 +1192,10 @@ static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info)
         }
     }
 
+    if (info->confidential) {
+        arm_setup_confidential_firmware_boot(cpu, info, firmware_filename);
+    }
+
     /*
      * We will start from address 0 (typically a boot ROM image) in the
      * same way as hardware. Leave env->boot_info NULL, so that
@@ -1206,7 +1239,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
 
     /* Load the kernel.  */
     if (!info->kernel_filename || info->firmware_loaded) {
-        arm_setup_firmware_boot(cpu, info);
+        arm_setup_firmware_boot(cpu, info, ms->firmware);
     } else {
         arm_setup_direct_kernel_boot(cpu, info);
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 966577d6a66f..b799e5f44432 100644
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
+    assert(machine_require_guest_memfd(MACHINE(vms)));
+
+    fw_ram = g_new(MemoryRegion, 1);
+    memory_region_init_ram_guest_memfd(fw_ram, NULL, "fw_ram", fw_size,
+                                       &error_fatal);
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
@@ -3228,7 +3283,10 @@ static void machvirt_init(MachineState *machine)
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
index a2e22bda8a57..8a1bb1106930 100644
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
@@ -135,6 +139,11 @@ struct arm_boot_info {
 
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


