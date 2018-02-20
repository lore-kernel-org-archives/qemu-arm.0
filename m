Received: by 10.28.71.27 with SMTP id u27csp1377111wma;
        Tue, 20 Feb 2018 10:07:57 -0800 (PST)
X-Google-Smtp-Source: AH8x227TM0VFvMN3WUoKeBM9VSLHvDb5loGhKhV1fczxZWdbt+LVHyW9RxIHfLcs/FL0se4E2jX/
X-Received: by 10.129.182.18 with SMTP id u18mr472628ywh.22.1519150077813;
        Tue, 20 Feb 2018 10:07:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519150077; cv=none;
        d=google.com; s=arc-20160816;
        b=H/NSZlhf1KQSSOqshv34DD4mu2/ia11/AcPqjNKeldWZu14LoWk27uQNqNPemuYLFr
         73kh/dS2OWOoAHqvqblQKExFDNiyEhbEiCZDnSLGrVNvemW5NkYfjp2Ijy5yAJN9zONQ
         WWgv0yhLnzZ7mLjjczyQ+MAvAXpuXcLh8+3hMK0ucHcp/oaZKu37tmcw8BvgqvAYGM3T
         8MHW3/1csWRAqND6abZRL7As6smjToO8QBk0JcYozMRRV2dB4GMyjSxI84DCdJevygLE
         HpFo0Mo8EE94QZ7fFZJ8FnIHeMblh1Mo+tBaFUkWo/IA7cBDyDRcyjYMPf3qmnhKKx/c
         DwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=mBFppzOvOEJzCACDUFkiiB07qFR55H6AhaTRk7fQBtw=;
        b=xhM4ZybhdHvqcit8JN0gGldQoj//ybxp9ANvSiw21aqoOVzt1I1g6R6ts9dogjeZGf
         pgmPrxifGIkSOeOv8CWKzjcIt/w1W76g9Kf3tOUMcbBydMwl66CbAOn4/jtQglWnvl7t
         +S4UFEAVCqDX8qnczmeD7Jwj83wgqId7UEsYNAds4wkLnvizXEKtiCf6znk6h8qDGT6n
         y687eDQD0HqDFuyq0hNqtF+xLNz6gDeYDr3GHDra1ngr/mS5u3EgccRR3UZwOz73gcu+
         zq4/5FETZ+tOz8DGE34lerm1/d4MRCNl2nfmVvNWD11IrxypvaSRQoorNlp0VNBUotIF
         6ijQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w124si25913ybb.171.2018.02.20.10.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:07:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCKb-0003IA-2K
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:07:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGa-0008EE-1N
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGW-0001h3-IW
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:48 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46566)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGW-0001cw-3f; Tue, 20 Feb 2018 13:03:44 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGF-0008QS-Q0; Tue, 20 Feb 2018 18:03:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:08 +0000
Message-Id: <20180220180325.29818-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 02/19] hw/arm/boot: Honour CPU's address space
 for image loads
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +gaahecYjlul

Instead of loading kernels, device trees, and the like to
the system address space, use the CPU's address space. This
is important if we're trying to load the file to memory or
via an alias memory region that is provided by an SoC
object and thus not mapped into the system address space.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Function name changed to arm_boot_address_space()
rather than arm_boot_addressspace(), following irc
conversation...
---
 hw/arm/boot.c | 119 +++++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 76 insertions(+), 43 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 05108bc42f..6d0c92ab88 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -36,6 +36,25 @@
 #define ARM64_TEXT_OFFSET_OFFSET    8
 #define ARM64_MAGIC_OFFSET          56
 
+static AddressSpace *arm_boot_address_space(ARMCPU *cpu,
+                                            const struct arm_boot_info *info)
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
@@ -125,7 +144,8 @@ static const ARMInsnFixup smpboot[] = {
 };
 
 static void write_bootloader(const char *name, hwaddr addr,
-                             const ARMInsnFixup *insns, uint32_t *fixupcontext)
+                             const ARMInsnFixup *insns, uint32_t *fixupcontext,
+                             AddressSpace *as)
 {
     /* Fix up the specified bootloader fragment and write it into
      * guest memory using rom_add_blob_fixed(). fixupcontext is
@@ -164,7 +184,7 @@ static void write_bootloader(const char *name, hwaddr addr,
         code[i] = tswap32(insn);
     }
 
-    rom_add_blob_fixed(name, code, len * sizeof(uint32_t), addr);
+    rom_add_blob_fixed_as(name, code, len * sizeof(uint32_t), addr, as);
 
     g_free(code);
 }
@@ -173,6 +193,7 @@ static void default_write_secondary(ARMCPU *cpu,
                                     const struct arm_boot_info *info)
 {
     uint32_t fixupcontext[FIXUP_MAX];
+    AddressSpace *as = arm_boot_address_space(cpu, info);
 
     fixupcontext[FIXUP_GIC_CPU_IF] = info->gic_cpu_if_addr;
     fixupcontext[FIXUP_BOOTREG] = info->smp_bootreg_addr;
@@ -183,13 +204,14 @@ static void default_write_secondary(ARMCPU *cpu,
     }
 
     write_bootloader("smpboot", info->smp_loader_start,
-                     smpboot, fixupcontext);
+                     smpboot, fixupcontext, as);
 }
 
 void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
                                             const struct arm_boot_info *info,
                                             hwaddr mvbar_addr)
 {
+    AddressSpace *as = arm_boot_address_space(cpu, info);
     int n;
     uint32_t mvbar_blob[] = {
         /* mvbar_addr: secure monitor vectors
@@ -227,22 +249,23 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
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
+    AddressSpace *as = arm_boot_address_space(cpu, info);
     CPUState *cs = CPU(cpu);
 
-    address_space_stl_notdirty(&address_space_memory, info->smp_bootreg_addr,
+    address_space_stl_notdirty(as, info->smp_bootreg_addr,
                                0, MEMTXATTRS_UNSPECIFIED, NULL);
     cpu_set_pc(cs, info->smp_loader_start);
 }
@@ -253,12 +276,12 @@ static inline bool have_dtb(const struct arm_boot_info *info)
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
@@ -289,8 +312,9 @@ static void set_kernel_args(const struct arm_boot_info *info)
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
@@ -304,7 +328,8 @@ static void set_kernel_args(const struct arm_boot_info *info)
         atag_board_len = (info->atag_board(info, atag_board_buf) + 3) & ~3;
         WRITE_WORD(p, (atag_board_len + 8) >> 2);
         WRITE_WORD(p, 0x414f4d50);
-        cpu_physical_memory_write(p, atag_board_buf, atag_board_len);
+        address_space_write(as, p, MEMTXATTRS_UNSPECIFIED,
+                            atag_board_buf, atag_board_len);
         p += atag_board_len;
     }
     /* ATAG_END */
@@ -312,7 +337,8 @@ static void set_kernel_args(const struct arm_boot_info *info)
     WRITE_WORD(p, 0);
 }
 
-static void set_kernel_args_old(const struct arm_boot_info *info)
+static void set_kernel_args_old(const struct arm_boot_info *info,
+                                AddressSpace *as)
 {
     hwaddr p;
     const char *s;
@@ -380,7 +406,8 @@ static void set_kernel_args_old(const struct arm_boot_info *info)
     }
     s = info->kernel_cmdline;
     if (s) {
-        cpu_physical_memory_write(p, s, strlen(s) + 1);
+        address_space_write(as, p, MEMTXATTRS_UNSPECIFIED,
+                            (const uint8_t *)s, strlen(s) + 1);
     } else {
         WRITE_WORD(p, 0);
     }
@@ -454,6 +481,7 @@ static void fdt_add_psci_node(void *fdt)
  * @addr:       the address to load the image at
  * @binfo:      struct describing the boot environment
  * @addr_limit: upper limit of the available memory area at @addr
+ * @as:         address space to load image to
  *
  * Load a device tree supplied by the machine or by the user  with the
  * '-dtb' command line option, and put it at offset @addr in target
@@ -470,7 +498,7 @@ static void fdt_add_psci_node(void *fdt)
  * Note: Must not be called unless have_dtb(binfo) is true.
  */
 static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
-                    hwaddr addr_limit)
+                    hwaddr addr_limit, AddressSpace *as)
 {
     void *fdt = NULL;
     int size, rc;
@@ -616,7 +644,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     /* Put the DTB into the memory map as a ROM image: this will ensure
      * the DTB is copied again upon reset, even if addr points into RAM.
      */
-    rom_add_blob_fixed("dtb", fdt, size, addr);
+    rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
 
     g_free(fdt);
 
@@ -703,13 +731,15 @@ static void do_cpu_reset(void *opaque)
             }
 
             if (cs == first_cpu) {
+                AddressSpace *as = arm_boot_address_space(cpu, info);
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
@@ -784,7 +814,7 @@ static int do_arm_linux_init(Object *obj, void *opaque)
 
 static uint64_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
                              uint64_t *lowaddr, uint64_t *highaddr,
-                             int elf_machine)
+                             int elf_machine, AddressSpace *as)
 {
     bool elf_is64;
     union {
@@ -827,9 +857,9 @@ static uint64_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
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
@@ -839,7 +869,7 @@ static uint64_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
 }
 
 static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
-                                   hwaddr *entry)
+                                   hwaddr *entry, AddressSpace *as)
 {
     hwaddr kernel_load_offset = KERNEL64_LOAD_ADDR;
     uint8_t *buffer;
@@ -874,7 +904,7 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
     }
 
     *entry = mem_base + kernel_load_offset;
-    rom_add_blob_fixed(filename, buffer, size, *entry);
+    rom_add_blob_fixed_as(filename, buffer, size, *entry, as);
 
     g_free(buffer);
 
@@ -896,6 +926,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
     ARMCPU *cpu = n->cpu;
     struct arm_boot_info *info =
         container_of(n, struct arm_boot_info, load_kernel_notifier);
+    AddressSpace *as = arm_boot_address_space(cpu, info);
 
     /* The board code is not supposed to set secure_board_setup unless
      * running its code in secure mode is actually possible, and KVM
@@ -913,7 +944,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
              * the kernel is supposed to be loaded by the bootloader), copy the
              * DTB to the base of RAM for the bootloader to pick up.
              */
-            if (load_dtb(info->loader_start, info, 0) < 0) {
+            if (load_dtb(info->loader_start, info, 0, as) < 0) {
                 exit(1);
             }
         }
@@ -988,7 +1019,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
 
     /* Assume that raw images are linux kernels, and ELF images are not.  */
     kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
-                               &elf_high_addr, elf_machine);
+                               &elf_high_addr, elf_machine, as);
     if (kernel_size > 0 && have_dtb(info)) {
         /* If there is still some room left at the base of RAM, try and put
          * the DTB there like we do for images loaded with -bios or -pflash.
@@ -1001,25 +1032,26 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
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
@@ -1031,15 +1063,16 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
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
@@ -1080,7 +1113,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
 
             /* Place the DTB after the initrd in memory with alignment. */
             dtb_start = QEMU_ALIGN_UP(info->initrd_start + initrd_size, align);
-            if (load_dtb(dtb_start, info, 0) < 0) {
+            if (load_dtb(dtb_start, info, 0, as) < 0) {
                 exit(1);
             }
             fixupcontext[FIXUP_ARGPTR] = dtb_start;
@@ -1096,7 +1129,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
         fixupcontext[FIXUP_ENTRYPOINT] = entry;
 
         write_bootloader("bootloader", info->loader_start,
-                         primary_loader, fixupcontext);
+                         primary_loader, fixupcontext, as);
 
         if (info->nb_cpus > 1) {
             info->write_secondary_boot(cpu, info);
-- 
2.16.1

