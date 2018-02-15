Received: by 10.28.71.27 with SMTP id u27csp2944657wma;
        Thu, 15 Feb 2018 10:00:17 -0800 (PST)
X-Google-Smtp-Source: AH8x224T9aMRY8It8nm1I86NuO5ElAL0LHY3icxWXCVe5ZsNSvv5K5Znc7djgDn/vnccwa1BOMAO
X-Received: by 10.13.219.212 with SMTP id d203mr841606ywe.247.1518717616918;
        Thu, 15 Feb 2018 10:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518717616; cv=none;
        d=google.com; s=arc-20160816;
        b=R8g8tHLRh/MNkv13oohn6V/ciFHn2m5GeLqhkLg/RwhD2drh13q+VRa1fFAl8qchBh
         u5TCKcwxybfH/Dc/vBnOb6A5kmCky2ReH82G7oVS7LQHjmfBIEyKoz7FuZ905aHznaLm
         Dypol1YsSbaUAc9ZhxwV4gzMZdNs0H5QQ5QURX1dmwBLqLj2ezxWp3JEHxPfHAErBvSv
         P58k1i49MR3ABKqDveKbk98WoLkC5v7qHXoiLKMEFctv6q8ccj1yHrCefzn9vD5p20aj
         TpapVCSI+Wt+9was4YvH3I56y/qzqv03eu04zemNPQ8TAXbL8kfasBsUqcONAPiZ6LG7
         iTKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JGdEdpTVaEci0KjvziN3fum1+vMkncUvJLFI3GUlVEU=;
        b=EH1h1PKEwSOPqb1FlZXXRJLsJOj2dZA5GdBmKtVcgkKy+DykdP0VQO7xWszUkJilxa
         wDoo/Q58F4nScvjyhkVg50kDbTx4K/u7uw2VWLBS0RXpc3aEDjCQGQadJNrKVcKgHX0A
         QqrQTGMaMmboMA55WVBlTKBU+45ty7a+cyYFtr5DTeF+M352YAZHasXkLZ09/evQou8H
         XKQf7PrOMVeLFCijylWTylY6NnGTfYNS0QOrPt7IhGEn5uwLrDQF5jj6PVUqztx8A9CG
         1R8PyCFABollNuKanX3RSEsqVhK9NTT6Ut1r9/D/ntkvp6j9mJd9YtifeTxrQEoI98Xu
         e3rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h26si2835264ywk.503.2018.02.15.10.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 10:00:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emNpQ-0002TV-AR
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 13:00:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1emNmZ-0008BF-W1
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 12:57:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1emNmY-0000eP-3W
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 12:57:20 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46422)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1emNmT-0000Xo-26; Thu, 15 Feb 2018 12:57:13 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1emNmP-00020p-OZ; Thu, 15 Feb 2018 17:57:09 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 15 Feb 2018 17:57:05 +0000
Message-Id: <20180215175707.15491-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180215175707.15491-1-peter.maydell@linaro.org>
References: <20180215175707.15491-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 2/3] hw/arm/boot: Honour CPU's address space
 for image loads
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tcJWDTx2TXtb

Instead of loading kernels, device trees, and the like to
the system address space, use the CPU's address space. This
is important if we're trying to load the file to memory or
via an alias memory region that is provided by an SoC
object and thus not mapped into the system address space.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 119 +++++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 76 insertions(+), 43 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 9b174b982c..0eac655c98 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -35,6 +35,25 @@
 #define ARM64_TEXT_OFFSET_OFFSET    8
 #define ARM64_MAGIC_OFFSET          56
 
+static AddressSpace *arm_boot_addressspace(ARMCPU *cpu,
+                                           const struct arm_boot_info *info)
+{
+    /* Return the address space to use for bootloader reads and writes.
+     * We prefer the secure address space if the CPU has it and we're
+     * going to boot the guest into it.
+     */
+    int asidx;
+    CPUState *cs = CPU(cpu);
+
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL3) && info->secure_boot) {
+        asidx = ARMASIdx_S;
+    } else {
+        asidx = ARMASIdx_NS;
+    }
+
+    return cpu_get_address_space(cs, asidx);
+}
+
 typedef enum {
     FIXUP_NONE = 0,     /* do nothing */
     FIXUP_TERMINATOR,   /* end of insns */
@@ -124,7 +143,8 @@ static const ARMInsnFixup smpboot[] = {
 };
 
 static void write_bootloader(const char *name, hwaddr addr,
-                             const ARMInsnFixup *insns, uint32_t *fixupcontext)
+                             const ARMInsnFixup *insns, uint32_t *fixupcontext,
+                             AddressSpace *as)
 {
     /* Fix up the specified bootloader fragment and write it into
      * guest memory using rom_add_blob_fixed(). fixupcontext is
@@ -163,7 +183,7 @@ static void write_bootloader(const char *name, hwaddr addr,
         code[i] = tswap32(insn);
     }
 
-    rom_add_blob_fixed(name, code, len * sizeof(uint32_t), addr);
+    rom_add_blob_fixed_as(name, code, len * sizeof(uint32_t), addr, as);
 
     g_free(code);
 }
@@ -172,6 +192,7 @@ static void default_write_secondary(ARMCPU *cpu,
                                     const struct arm_boot_info *info)
 {
     uint32_t fixupcontext[FIXUP_MAX];
+    AddressSpace *as = CPU(cpu)->as;
 
     fixupcontext[FIXUP_GIC_CPU_IF] = info->gic_cpu_if_addr;
     fixupcontext[FIXUP_BOOTREG] = info->smp_bootreg_addr;
@@ -182,13 +203,14 @@ static void default_write_secondary(ARMCPU *cpu,
     }
 
     write_bootloader("smpboot", info->smp_loader_start,
-                     smpboot, fixupcontext);
+                     smpboot, fixupcontext, as);
 }
 
 void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
                                             const struct arm_boot_info *info,
                                             hwaddr mvbar_addr)
 {
+    AddressSpace *as = CPU(cpu)->as;
     int n;
     uint32_t mvbar_blob[] = {
         /* mvbar_addr: secure monitor vectors
@@ -226,22 +248,23 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
     for (n = 0; n < ARRAY_SIZE(mvbar_blob); n++) {
         mvbar_blob[n] = tswap32(mvbar_blob[n]);
     }
-    rom_add_blob_fixed("board-setup-mvbar", mvbar_blob, sizeof(mvbar_blob),
-                       mvbar_addr);
+    rom_add_blob_fixed_as("board-setup-mvbar", mvbar_blob, sizeof(mvbar_blob),
+                          mvbar_addr, as);
 
     for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
         board_setup_blob[n] = tswap32(board_setup_blob[n]);
     }
-    rom_add_blob_fixed("board-setup", board_setup_blob,
-                       sizeof(board_setup_blob), info->board_setup_addr);
+    rom_add_blob_fixed_as("board-setup", board_setup_blob,
+                          sizeof(board_setup_blob), info->board_setup_addr, as);
 }
 
 static void default_reset_secondary(ARMCPU *cpu,
                                     const struct arm_boot_info *info)
 {
+    AddressSpace *as = arm_boot_addressspace(cpu, info);
     CPUState *cs = CPU(cpu);
 
-    address_space_stl_notdirty(&address_space_memory, info->smp_bootreg_addr,
+    address_space_stl_notdirty(as, info->smp_bootreg_addr,
                                0, MEMTXATTRS_UNSPECIFIED, NULL);
     cpu_set_pc(cs, info->smp_loader_start);
 }
@@ -252,12 +275,12 @@ static inline bool have_dtb(const struct arm_boot_info *info)
 }
 
 #define WRITE_WORD(p, value) do { \
-    address_space_stl_notdirty(&address_space_memory, p, value, \
+    address_space_stl_notdirty(as, p, value, \
                                MEMTXATTRS_UNSPECIFIED, NULL);  \
     p += 4;                       \
 } while (0)
 
-static void set_kernel_args(const struct arm_boot_info *info)
+static void set_kernel_args(const struct arm_boot_info *info, AddressSpace *as)
 {
     int initrd_size = info->initrd_size;
     hwaddr base = info->loader_start;
@@ -288,8 +311,9 @@ static void set_kernel_args(const struct arm_boot_info *info)
         int cmdline_size;
 
         cmdline_size = strlen(info->kernel_cmdline);
-        cpu_physical_memory_write(p + 8, info->kernel_cmdline,
-                                  cmdline_size + 1);
+        address_space_write(as, p + 8, MEMTXATTRS_UNSPECIFIED,
+                            (const uint8_t *)info->kernel_cmdline,
+                            cmdline_size + 1);
         cmdline_size = (cmdline_size >> 2) + 1;
         WRITE_WORD(p, cmdline_size + 2);
         WRITE_WORD(p, 0x54410009);
@@ -303,7 +327,8 @@ static void set_kernel_args(const struct arm_boot_info *info)
         atag_board_len = (info->atag_board(info, atag_board_buf) + 3) & ~3;
         WRITE_WORD(p, (atag_board_len + 8) >> 2);
         WRITE_WORD(p, 0x414f4d50);
-        cpu_physical_memory_write(p, atag_board_buf, atag_board_len);
+        address_space_write(as, p, MEMTXATTRS_UNSPECIFIED,
+                            atag_board_buf, atag_board_len);
         p += atag_board_len;
     }
     /* ATAG_END */
@@ -311,7 +336,8 @@ static void set_kernel_args(const struct arm_boot_info *info)
     WRITE_WORD(p, 0);
 }
 
-static void set_kernel_args_old(const struct arm_boot_info *info)
+static void set_kernel_args_old(const struct arm_boot_info *info,
+                                AddressSpace *as)
 {
     hwaddr p;
     const char *s;
@@ -379,7 +405,8 @@ static void set_kernel_args_old(const struct arm_boot_info *info)
     }
     s = info->kernel_cmdline;
     if (s) {
-        cpu_physical_memory_write(p, s, strlen(s) + 1);
+        address_space_write(as, p, MEMTXATTRS_UNSPECIFIED,
+                            (const uint8_t *)s, strlen(s) + 1);
     } else {
         WRITE_WORD(p, 0);
     }
@@ -453,6 +480,7 @@ static void fdt_add_psci_node(void *fdt)
  * @addr:       the address to load the image at
  * @binfo:      struct describing the boot environment
  * @addr_limit: upper limit of the available memory area at @addr
+ * @as:         address space to load image to
  *
  * Load a device tree supplied by the machine or by the user  with the
  * '-dtb' command line option, and put it at offset @addr in target
@@ -469,7 +497,7 @@ static void fdt_add_psci_node(void *fdt)
  * Note: Must not be called unless have_dtb(binfo) is true.
  */
 static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
-                    hwaddr addr_limit)
+                    hwaddr addr_limit, AddressSpace *as)
 {
     void *fdt = NULL;
     int size, rc;
@@ -615,7 +643,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     /* Put the DTB into the memory map as a ROM image: this will ensure
      * the DTB is copied again upon reset, even if addr points into RAM.
      */
-    rom_add_blob_fixed("dtb", fdt, size, addr);
+    rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
 
     g_free(fdt);
 
@@ -702,13 +730,15 @@ static void do_cpu_reset(void *opaque)
             }
 
             if (cs == first_cpu) {
+                AddressSpace *as = arm_boot_addressspace(cpu, info);
+
                 cpu_set_pc(cs, info->loader_start);
 
                 if (!have_dtb(info)) {
                     if (old_param) {
-                        set_kernel_args_old(info);
+                        set_kernel_args_old(info, as);
                     } else {
-                        set_kernel_args(info);
+                        set_kernel_args(info, as);
                     }
                 }
             } else {
@@ -783,7 +813,7 @@ static int do_arm_linux_init(Object *obj, void *opaque)
 
 static uint64_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
                              uint64_t *lowaddr, uint64_t *highaddr,
-                             int elf_machine)
+                             int elf_machine, AddressSpace *as)
 {
     bool elf_is64;
     union {
@@ -826,9 +856,9 @@ static uint64_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
         }
     }
 
-    ret = load_elf(info->kernel_filename, NULL, NULL,
-                   pentry, lowaddr, highaddr, big_endian, elf_machine,
-                   1, data_swab);
+    ret = load_elf_as(info->kernel_filename, NULL, NULL,
+                      pentry, lowaddr, highaddr, big_endian, elf_machine,
+                      1, data_swab, as);
     if (ret <= 0) {
         /* The header loaded but the image didn't */
         exit(1);
@@ -838,7 +868,7 @@ static uint64_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
 }
 
 static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
-                                   hwaddr *entry)
+                                   hwaddr *entry, AddressSpace *as)
 {
     hwaddr kernel_load_offset = KERNEL64_LOAD_ADDR;
     uint8_t *buffer;
@@ -873,7 +903,7 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
     }
 
     *entry = mem_base + kernel_load_offset;
-    rom_add_blob_fixed(filename, buffer, size, *entry);
+    rom_add_blob_fixed_as(filename, buffer, size, *entry, as);
 
     g_free(buffer);
 
@@ -895,6 +925,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
     ARMCPU *cpu = n->cpu;
     struct arm_boot_info *info =
         container_of(n, struct arm_boot_info, load_kernel_notifier);
+    AddressSpace *as = arm_boot_addressspace(cpu, info);
 
     /* The board code is not supposed to set secure_board_setup unless
      * running its code in secure mode is actually possible, and KVM
@@ -912,7 +943,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
              * the kernel is supposed to be loaded by the bootloader), copy the
              * DTB to the base of RAM for the bootloader to pick up.
              */
-            if (load_dtb(info->loader_start, info, 0) < 0) {
+            if (load_dtb(info->loader_start, info, 0, as) < 0) {
                 exit(1);
             }
         }
@@ -987,7 +1018,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
 
     /* Assume that raw images are linux kernels, and ELF images are not.  */
     kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
-                               &elf_high_addr, elf_machine);
+                               &elf_high_addr, elf_machine, as);
     if (kernel_size > 0 && have_dtb(info)) {
         /* If there is still some room left at the base of RAM, try and put
          * the DTB there like we do for images loaded with -bios or -pflash.
@@ -1000,25 +1031,26 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
             if (elf_low_addr < info->loader_start) {
                 elf_low_addr = 0;
             }
-            if (load_dtb(info->loader_start, info, elf_low_addr) < 0) {
+            if (load_dtb(info->loader_start, info, elf_low_addr, as) < 0) {
                 exit(1);
             }
         }
     }
     entry = elf_entry;
     if (kernel_size < 0) {
-        kernel_size = load_uimage(info->kernel_filename, &entry, NULL,
-                                  &is_linux, NULL, NULL);
+        kernel_size = load_uimage_as(info->kernel_filename, &entry, NULL,
+                                     &is_linux, NULL, NULL, as);
     }
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
         kernel_size = load_aarch64_image(info->kernel_filename,
-                                         info->loader_start, &entry);
+                                         info->loader_start, &entry, as);
         is_linux = 1;
     } else if (kernel_size < 0) {
         /* 32-bit ARM */
         entry = info->loader_start + KERNEL_LOAD_ADDR;
-        kernel_size = load_image_targphys(info->kernel_filename, entry,
-                                          info->ram_size - KERNEL_LOAD_ADDR);
+        kernel_size = load_image_targphys_as(info->kernel_filename, entry,
+                                             info->ram_size - KERNEL_LOAD_ADDR,
+                                             as);
         is_linux = 1;
     }
     if (kernel_size < 0) {
@@ -1030,15 +1062,16 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
         uint32_t fixupcontext[FIXUP_MAX];
 
         if (info->initrd_filename) {
-            initrd_size = load_ramdisk(info->initrd_filename,
-                                       info->initrd_start,
-                                       info->ram_size -
-                                       info->initrd_start);
+            initrd_size = load_ramdisk_as(info->initrd_filename,
+                                          info->initrd_start,
+                                          info->ram_size - info->initrd_start,
+                                          as);
             if (initrd_size < 0) {
-                initrd_size = load_image_targphys(info->initrd_filename,
-                                                  info->initrd_start,
-                                                  info->ram_size -
-                                                  info->initrd_start);
+                initrd_size = load_image_targphys_as(info->initrd_filename,
+                                                     info->initrd_start,
+                                                     info->ram_size -
+                                                     info->initrd_start,
+                                                     as);
             }
             if (initrd_size < 0) {
                 error_report("could not load initrd '%s'",
@@ -1079,7 +1112,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
 
             /* Place the DTB after the initrd in memory with alignment. */
             dtb_start = QEMU_ALIGN_UP(info->initrd_start + initrd_size, align);
-            if (load_dtb(dtb_start, info, 0) < 0) {
+            if (load_dtb(dtb_start, info, 0, as) < 0) {
                 exit(1);
             }
             fixupcontext[FIXUP_ARGPTR] = dtb_start;
@@ -1095,7 +1128,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
         fixupcontext[FIXUP_ENTRYPOINT] = entry;
 
         write_bootloader("bootloader", info->loader_start,
-                         primary_loader, fixupcontext);
+                         primary_loader, fixupcontext, as);
 
         if (info->nb_cpus > 1) {
             info->write_secondary_boot(cpu, info);
-- 
2.16.1

