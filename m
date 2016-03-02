Received: by 10.25.208.211 with SMTP id h202csp2011313lfg;
        Tue, 1 Mar 2016 23:05:13 -0800 (PST)
X-Received: by 10.140.94.97 with SMTP id f88mr6817653qge.0.1456902313414;
        Tue, 01 Mar 2016 23:05:13 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5si34754793qhu.25.2016.03.01.23.05.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 23:05:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54521 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0qO-0004TN-SC
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 02:05:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iz-0007LU-G3
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iw-0003dp-Kn
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:33 -0500
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:34877)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iw-0003dh-5x; Wed, 02 Mar 2016 01:57:30 -0500
Received: by mail-pa0-x22a.google.com with SMTP id bj10so58536990pad.2;
	Tue, 01 Mar 2016 22:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=dsTCppooaQ1kGiC5dyDA+kpY8eFRD0BP9cMUZP2LDrU=;
	b=Hd8TW3RPi0l1QnmYAZYs0D6RAnkgkjevC9QZxuFATZP2kYX2iPHlHKenxXlSDtv4DD
	74/fGr29GvV3Ei/B3zNR4fIv71Zb4tK0+oF1POPWNBqpijv5tOKMDXlNDpUtiNqbj3tk
	sMXJvCAu8dSRCdzhq7PIagND88lQxhH3D17eRxIBjzkuaY2m5iN7K3KoxOrwZQIvP5b5
	364DMzeMOEJN/NhTf13RHcSBnhhuLcN3E8vks+wWDvyV+jNnDxrg5/7NbRRITueHZovR
	8sq8py4o9XATccICLOMmCFbnHyDWaScIhTW5LqsFThQSZQw2UktV4YdxGAmCjZKtP35r
	Wk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=dsTCppooaQ1kGiC5dyDA+kpY8eFRD0BP9cMUZP2LDrU=;
	b=iSLjw9d/jZSH1tVc+xTCPPoTpsnh8rud2x3xENr2Yv1tHo/RWhnGE4nm8V01bOHDGT
	WWLoiZdDsFSQOwJYbnpDwvdNJJHwaOowcczMI9mf64e3SesHCGpLboaoESTioUyROvbP
	J5IDWBUeivK7YLQ54VVQQFz3N9F/RY07rg7MSQmCPGfejy2zukCb0kImGHGz04qezPRu
	r/6udu7lMA7EghmPAd6CUJ59Cy6DbbFU1p/RANAiWkMsC6wTvtUibFSfJHO0RZhtvsd5
	tR+UIEQSC6R6MwqaudDtzQ4JzZpyRQhzbb36JCdJeEBl/iYhBsIWv2XKaWwgEAXMxh1O
	jE1A==
X-Gm-Message-State: AD7BkJLgAGfmSVzkFaWGK4SaYTUHG6UZKK1JLsspYpNx0MaO4XHOiSTAaUwr+lzm2ZCVZQ==
X-Received: by 10.66.160.231 with SMTP id xn7mr36986218pab.134.1456901849279; 
	Tue, 01 Mar 2016 22:57:29 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.57.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:57:28 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:21 -0800
Message-Id: <53b3fb5b5908adc8499ca9a792a43e1d97d6b082.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22a
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 17/18] loader: Add data swap option to
	load-elf
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2tYT0asYBDpB

Some CPUs are of an opposite data-endianness to other components in the
system. Sometimes elfs have the data sections layed out with this CPU
data-endianness accounting for when loaded via the CPU, so byte swaps
(relative to other system components) will occur.

The leading example, is ARM's BE32 mode, which is is basically LE with
address manipulation on half-word and byte accesses to access the
hw/byte reversed address. This means that word data is invariant
across LE and BE32. This also means that instructions are still LE.
The expectation is that the elf will be loaded via the CPU in this
endianness scheme, which means the data in the elf is reversed at
compile time.

As QEMU loads via the system memory directly, rather than the CPU, we
need a mechanism to reverse elf data endianness to implement this
possibility.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
changed since v1:
Added doc comment (PMM review)
Commit message typos

 hw/alpha/dp264.c               |  4 ++--
 hw/arm/armv7m.c                |  2 +-
 hw/arm/boot.c                  |  2 +-
 hw/core/loader.c               |  9 ++++++---
 hw/cris/boot.c                 |  2 +-
 hw/i386/multiboot.c            |  3 ++-
 hw/lm32/lm32_boards.c          |  4 ++--
 hw/lm32/milkymist.c            |  2 +-
 hw/m68k/an5206.c               |  2 +-
 hw/m68k/dummy_m68k.c           |  2 +-
 hw/m68k/mcf5208.c              |  2 +-
 hw/microblaze/boot.c           |  4 ++--
 hw/mips/mips_fulong2e.c        |  2 +-
 hw/mips/mips_malta.c           |  2 +-
 hw/mips/mips_mipssim.c         |  2 +-
 hw/mips/mips_r4k.c             |  2 +-
 hw/moxie/moxiesim.c            |  3 ++-
 hw/openrisc/openrisc_sim.c     |  3 ++-
 hw/pci-host/prep.c             |  2 +-
 hw/ppc/e500.c                  |  2 +-
 hw/ppc/mac_newworld.c          |  5 +++--
 hw/ppc/mac_oldworld.c          |  5 +++--
 hw/ppc/ppc440_bamboo.c         |  3 ++-
 hw/ppc/spapr.c                 |  6 ++++--
 hw/ppc/virtex_ml507.c          |  3 ++-
 hw/s390x/ipl.c                 |  4 ++--
 hw/sparc/leon3.c               |  2 +-
 hw/sparc/sun4m.c               |  4 ++--
 hw/sparc64/sun4u.c             |  4 ++--
 hw/tricore/tricore_testboard.c |  2 +-
 hw/xtensa/sim.c                |  4 ++--
 hw/xtensa/xtfpga.c             |  2 +-
 include/hw/elf_ops.h           | 22 +++++++++++++++++++++-
 include/hw/loader.h            |  5 ++++-
 34 files changed, 81 insertions(+), 46 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 992d1b2..7c5989b 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -111,7 +111,7 @@ static void clipper_init(MachineState *machine)
     }
     size = load_elf(palcode_filename, cpu_alpha_superpage_to_phys,
                     NULL, &palcode_entry, &palcode_low, &palcode_high,
-                    0, EM_ALPHA, 0);
+                    0, EM_ALPHA, 0, 0);
     if (size < 0) {
         error_report("could not load palcode '%s'", palcode_filename);
         exit(1);
@@ -131,7 +131,7 @@ static void clipper_init(MachineState *machine)
 
         size = load_elf(kernel_filename, cpu_alpha_superpage_to_phys,
                         NULL, &kernel_entry, &kernel_low, &kernel_high,
-                        0, EM_ALPHA, 0);
+                        0, EM_ALPHA, 0, 0);
         if (size < 0) {
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index f3973f7..ed7d97f 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -211,7 +211,7 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
 
     if (kernel_filename) {
         image_size = load_elf(kernel_filename, NULL, NULL, &entry, &lowaddr,
-                              NULL, big_endian, EM_ARM, 1);
+                              NULL, big_endian, EM_ARM, 1, 0);
         if (image_size < 0) {
             image_size = load_image_targphys(kernel_filename, 0, mem_size);
             lowaddr = 0;
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 0a56d34c..17400be 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -755,7 +755,7 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
     /* Assume that raw images are linux kernels, and ELF images are not.  */
     kernel_size = load_elf(info->kernel_filename, NULL, NULL, &elf_entry,
                            &elf_low_addr, &elf_high_addr, big_endian,
-                           elf_machine, 1);
+                           elf_machine, 1, 0);
     if (kernel_size > 0 && have_dtb(info)) {
         /* If there is still some room left at the base of RAM, try and put
          * the DTB there like we do for images loaded with -bios or -pflash.
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 7d5e3a9..79877ec 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -390,7 +390,8 @@ fail:
 /* return < 0 if error, otherwise the number of bytes loaded in memory */
 int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
              void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
-             uint64_t *highaddr, int big_endian, int elf_machine, int clear_lsb)
+             uint64_t *highaddr, int big_endian, int elf_machine,
+             int clear_lsb, int data_swab)
 {
     int fd, data_order, target_data_order, must_swab, ret = ELF_LOAD_FAILED;
     uint8_t e_ident[EI_NIDENT];
@@ -429,10 +430,12 @@ int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
     lseek(fd, 0, SEEK_SET);
     if (e_ident[EI_CLASS] == ELFCLASS64) {
         ret = load_elf64(filename, fd, translate_fn, translate_opaque, must_swab,
-                         pentry, lowaddr, highaddr, elf_machine, clear_lsb);
+                         pentry, lowaddr, highaddr, elf_machine, clear_lsb,
+                         data_swab);
     } else {
         ret = load_elf32(filename, fd, translate_fn, translate_opaque, must_swab,
-                         pentry, lowaddr, highaddr, elf_machine, clear_lsb);
+                         pentry, lowaddr, highaddr, elf_machine, clear_lsb,
+                         data_swab);
     }
 
  fail:
diff --git a/hw/cris/boot.c b/hw/cris/boot.c
index 6608160..42485a4 100644
--- a/hw/cris/boot.c
+++ b/hw/cris/boot.c
@@ -73,7 +73,7 @@ void cris_load_image(CRISCPU *cpu, struct cris_load_info *li)
     /* Boots a kernel elf binary, os/linux-2.6/vmlinux from the axis 
        devboard SDK.  */
     image_size = load_elf(li->image_filename, translate_kernel_address, NULL,
-                          &entry, NULL, &high, 0, EM_CRIS, 0);
+                          &entry, NULL, &high, 0, EM_CRIS, 0, 0);
     li->entry = entry;
     if (image_size < 0) {
         /* Takes a kimage from the axis devboard SDK.  */
diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index c4d7d83..9e164e6 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -196,7 +196,8 @@ int load_multiboot(FWCfgState *fw_cfg,
         }
 
         kernel_size = load_elf(kernel_filename, NULL, NULL, &elf_entry,
-                               &elf_low, &elf_high, 0, I386_ELF_MACHINE, 0);
+                               &elf_low, &elf_high, 0, I386_ELF_MACHINE,
+                               0, 0);
         if (kernel_size < 0) {
             fprintf(stderr, "Error while loading elf kernel\n");
             exit(1);
diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index efa6f91..c5a848b 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -143,7 +143,7 @@ static void lm32_evr_init(MachineState *machine)
         int kernel_size;
 
         kernel_size = load_elf(kernel_filename, NULL, NULL, &entry, NULL, NULL,
-                               1, EM_LATTICEMICO32, 0);
+                               1, EM_LATTICEMICO32, 0, 0);
         reset_info->bootstrap_pc = entry;
 
         if (kernel_size < 0) {
@@ -245,7 +245,7 @@ static void lm32_uclinux_init(MachineState *machine)
         int kernel_size;
 
         kernel_size = load_elf(kernel_filename, NULL, NULL, &entry, NULL, NULL,
-                               1, EM_LATTICEMICO32, 0);
+                               1, EM_LATTICEMICO32, 0, 0);
         reset_info->bootstrap_pc = entry;
 
         if (kernel_size < 0) {
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 5a37b4a..f71492e 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -177,7 +177,7 @@ milkymist_init(MachineState *machine)
 
         /* Boots a kernel elf binary.  */
         kernel_size = load_elf(kernel_filename, NULL, NULL, &entry, NULL, NULL,
-                               1, EM_LATTICEMICO32, 0);
+                               1, EM_LATTICEMICO32, 0, 0);
         reset_info->bootstrap_pc = entry;
 
         if (kernel_size < 0) {
diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
index d87b945..85f7277 100644
--- a/hw/m68k/an5206.c
+++ b/hw/m68k/an5206.c
@@ -73,7 +73,7 @@ static void an5206_init(MachineState *machine)
     }
 
     kernel_size = load_elf(kernel_filename, NULL, NULL, &elf_entry,
-                           NULL, NULL, 1, EM_68K, 0);
+                           NULL, NULL, 1, EM_68K, 0, 0);
     entry = elf_entry;
     if (kernel_size < 0) {
         kernel_size = load_uimage(kernel_filename, &entry, NULL, NULL,
diff --git a/hw/m68k/dummy_m68k.c b/hw/m68k/dummy_m68k.c
index a213bcf..3c2174b 100644
--- a/hw/m68k/dummy_m68k.c
+++ b/hw/m68k/dummy_m68k.c
@@ -50,7 +50,7 @@ static void dummy_m68k_init(MachineState *machine)
     /* Load kernel.  */
     if (kernel_filename) {
         kernel_size = load_elf(kernel_filename, NULL, NULL, &elf_entry,
-                               NULL, NULL, 1, EM_68K, 0);
+                               NULL, NULL, 1, EM_68K, 0, 0);
         entry = elf_entry;
         if (kernel_size < 0) {
             kernel_size = load_uimage(kernel_filename, &entry, NULL, NULL,
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 9597e86..4f49d34 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -276,7 +276,7 @@ static void mcf5208evb_init(MachineState *machine)
     }
 
     kernel_size = load_elf(kernel_filename, NULL, NULL, &elf_entry,
-                           NULL, NULL, 1, EM_68K, 0);
+                           NULL, NULL, 1, EM_68K, 0, 0);
     entry = elf_entry;
     if (kernel_size < 0) {
         kernel_size = load_uimage(kernel_filename, &entry, NULL, NULL,
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 26cc378..c24014a 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -142,12 +142,12 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
         /* Boots a kernel elf binary.  */
         kernel_size = load_elf(kernel_filename, NULL, NULL,
                                &entry, &low, &high,
-                               big_endian, EM_MICROBLAZE, 0);
+                               big_endian, EM_MICROBLAZE, 0, 0);
         base32 = entry;
         if (base32 == 0xc0000000) {
             kernel_size = load_elf(kernel_filename, translate_kernel_address,
                                    NULL, &entry, NULL, NULL,
-                                   big_endian, EM_MICROBLAZE, 0);
+                                   big_endian, EM_MICROBLAZE, 0, 0);
         }
         /* Always boot into physical ram.  */
         boot_info.bootstrap_pc = (uint32_t)entry;
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 184c404..4e5581b 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -117,7 +117,7 @@ static int64_t load_kernel (CPUMIPSState *env)
 
     if (load_elf(loaderparams.kernel_filename, cpu_mips_kseg0_to_phys, NULL,
                  (uint64_t *)&kernel_entry, (uint64_t *)&kernel_low,
-                 (uint64_t *)&kernel_high, 0, EM_MIPS, 1) < 0) {
+                 (uint64_t *)&kernel_high, 0, EM_MIPS, 1, 0) < 0) {
         fprintf(stderr, "qemu: could not load kernel '%s'\n",
                 loaderparams.kernel_filename);
         exit(1);
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index c04aa2b..f5173c4 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -796,7 +796,7 @@ static int64_t load_kernel (void)
 
     if (load_elf(loaderparams.kernel_filename, cpu_mips_kseg0_to_phys, NULL,
                  (uint64_t *)&kernel_entry, NULL, (uint64_t *)&kernel_high,
-                 big_endian, EM_MIPS, 1) < 0) {
+                 big_endian, EM_MIPS, 1, 0) < 0) {
         fprintf(stderr, "qemu: could not load kernel '%s'\n",
                 loaderparams.kernel_filename);
         exit(1);
diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index 8951ae9..1ecff44 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -70,7 +70,7 @@ static int64_t load_kernel(void)
     kernel_size = load_elf(loaderparams.kernel_filename, cpu_mips_kseg0_to_phys,
                            NULL, (uint64_t *)&entry, NULL,
                            (uint64_t *)&kernel_high, big_endian,
-                           EM_MIPS, 1);
+                           EM_MIPS, 1, 0);
     if (kernel_size >= 0) {
         if ((entry & ~0x7fffffffULL) == 0x80000000)
             entry = (int32_t)entry;
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index b6625ae..724b1e9 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -88,7 +88,7 @@ static int64_t load_kernel(void)
     kernel_size = load_elf(loaderparams.kernel_filename, cpu_mips_kseg0_to_phys,
                            NULL, (uint64_t *)&entry, NULL,
                            (uint64_t *)&kernel_high, big_endian,
-                           EM_MIPS, 1);
+                           EM_MIPS, 1, 0);
     if (kernel_size >= 0) {
         if ((entry & ~0x7fffffffULL) == 0x80000000)
             entry = (int32_t)entry;
diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index 9191ae9..d88c942 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -54,7 +54,8 @@ static void load_kernel(MoxieCPU *cpu, LoaderParams *loader_params)
     ram_addr_t initrd_offset;
 
     kernel_size = load_elf(loader_params->kernel_filename,  NULL, NULL,
-                           &entry, &kernel_low, &kernel_high, 1, EM_MOXIE, 0);
+                           &entry, &kernel_low, &kernel_high, 1, EM_MOXIE,
+                           0, 0);
 
     if (kernel_size <= 0) {
         fprintf(stderr, "qemu: could not load kernel '%s'\n",
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 25c637a..46418c3 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -69,7 +69,8 @@ static void cpu_openrisc_load_kernel(ram_addr_t ram_size,
 
     if (kernel_filename && !qtest_enabled()) {
         kernel_size = load_elf(kernel_filename, NULL, NULL,
-                               &elf_entry, NULL, NULL, 1, EM_OPENRISC, 1);
+                               &elf_entry, NULL, NULL, 1, EM_OPENRISC,
+                               1, 0);
         entry = elf_entry;
         if (kernel_size < 0) {
             kernel_size = load_uimage(kernel_filename,
diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 5dc550f..49cdaab 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -313,7 +313,7 @@ static void raven_realize(PCIDevice *d, Error **errp)
         if (filename) {
             if (s->elf_machine != EM_NONE) {
                 bios_size = load_elf(filename, NULL, NULL, NULL,
-                                     NULL, NULL, 1, s->elf_machine, 0);
+                                     NULL, NULL, 1, s->elf_machine, 0, 0);
             }
             if (bios_size < 0) {
                 bios_size = get_image_size(filename);
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index bd84e9a..09154fa 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1017,7 +1017,7 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
 
     bios_size = load_elf(filename, NULL, NULL, &bios_entry, &loadaddr, NULL,
-                         1, PPC_ELF_MACHINE, 0);
+                         1, PPC_ELF_MACHINE, 0, 0);
     if (bios_size < 0) {
         /*
          * Hrm. No ELF image? Try a uImage, maybe someone is giving us an
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index f95086b..f0a36b3 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -221,7 +221,7 @@ static void ppc_core99_init(MachineState *machine)
     /* Load OpenBIOS (ELF) */
     if (filename) {
         bios_size = load_elf(filename, NULL, NULL, NULL,
-                             NULL, NULL, 1, PPC_ELF_MACHINE, 0);
+                             NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
 
         g_free(filename);
     } else {
@@ -244,7 +244,8 @@ static void ppc_core99_init(MachineState *machine)
         kernel_base = KERNEL_LOAD_ADDR;
 
         kernel_size = load_elf(kernel_filename, translate_kernel_address, NULL,
-                               NULL, &lowaddr, NULL, 1, PPC_ELF_MACHINE, 0);
+                               NULL, &lowaddr, NULL, 1, PPC_ELF_MACHINE,
+                               0, 0);
         if (kernel_size < 0)
             kernel_size = load_aout(kernel_filename, kernel_base,
                                     ram_size - kernel_base, bswap_needed,
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 8984398..d952713 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -149,7 +149,7 @@ static void ppc_heathrow_init(MachineState *machine)
     /* Load OpenBIOS (ELF) */
     if (filename) {
         bios_size = load_elf(filename, 0, NULL, NULL, NULL, NULL,
-                             1, PPC_ELF_MACHINE, 0);
+                             1, PPC_ELF_MACHINE, 0, 0);
         g_free(filename);
     } else {
         bios_size = -1;
@@ -170,7 +170,8 @@ static void ppc_heathrow_init(MachineState *machine)
 #endif
         kernel_base = KERNEL_LOAD_ADDR;
         kernel_size = load_elf(kernel_filename, translate_kernel_address, NULL,
-                               NULL, &lowaddr, NULL, 1, PPC_ELF_MACHINE, 0);
+                               NULL, &lowaddr, NULL, 1, PPC_ELF_MACHINE,
+                               0, 0);
         if (kernel_size < 0)
             kernel_size = load_aout(kernel_filename, kernel_base,
                                     ram_size - kernel_base, bswap_needed,
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index e535a9f..5c535b1 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -256,7 +256,8 @@ static void bamboo_init(MachineState *machine)
                               NULL, NULL);
         if (success < 0) {
             success = load_elf(kernel_filename, NULL, NULL, &elf_entry,
-                               &elf_lowaddr, NULL, 1, PPC_ELF_MACHINE, 0);
+                               &elf_lowaddr, NULL, 1, PPC_ELF_MACHINE,
+                               0, 0);
             entry = elf_entry;
             loadaddr = elf_lowaddr;
         }
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c119f55..0f42a8e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1942,11 +1942,13 @@ static void ppc_spapr_init(MachineState *machine)
         uint64_t lowaddr = 0;
 
         kernel_size = load_elf(kernel_filename, translate_kernel_address, NULL,
-                               NULL, &lowaddr, NULL, 1, PPC_ELF_MACHINE, 0);
+                               NULL, &lowaddr, NULL, 1, PPC_ELF_MACHINE,
+                               0, 0);
         if (kernel_size == ELF_LOAD_WRONG_ENDIAN) {
             kernel_size = load_elf(kernel_filename,
                                    translate_kernel_address, NULL,
-                                   NULL, &lowaddr, NULL, 0, PPC_ELF_MACHINE, 0);
+                                   NULL, &lowaddr, NULL, 0, PPC_ELF_MACHINE,
+                                   0, 0);
             kernel_le = kernel_size > 0;
         }
         if (kernel_size < 0) {
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index a902c88..b807a08 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -258,7 +258,8 @@ static void virtex_init(MachineState *machine)
 
         /* Boots a kernel elf binary.  */
         kernel_size = load_elf(kernel_filename, NULL, NULL,
-                               &entry, &low, &high, 1, PPC_ELF_MACHINE, 0);
+                               &entry, &low, &high, 1, PPC_ELF_MACHINE,
+                               0, 0);
         boot_info.bootstrap_pc = entry & 0x00ffffff;
 
         if (kernel_size < 0) {
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index c9cf7cc..41ff002 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -101,7 +101,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
 
         bios_size = load_elf(bios_filename, bios_translate_addr, &fwbase,
                              &ipl->bios_start_addr, NULL, NULL, 1,
-                             EM_S390, 0);
+                             EM_S390, 0, 0);
         if (bios_size > 0) {
             /* Adjust ELF start address to final location */
             ipl->bios_start_addr += fwbase;
@@ -124,7 +124,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
 
     if (ipl->kernel) {
         kernel_size = load_elf(ipl->kernel, NULL, NULL, &pentry, NULL,
-                               NULL, 1, EM_S390, 0);
+                               NULL, 1, EM_S390, 0, 0);
         if (kernel_size < 0) {
             kernel_size = load_image_targphys(ipl->kernel, 0, ram_size);
         }
diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 07c5c85..c579f5b 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -194,7 +194,7 @@ static void leon3_generic_hw_init(MachineState *machine)
         uint64_t entry;
 
         kernel_size = load_elf(kernel_filename, NULL, NULL, &entry, NULL, NULL,
-                               1 /* big endian */, EM_SPARC, 0);
+                               1 /* big endian */, EM_SPARC, 0, 0);
         if (kernel_size < 0) {
             fprintf(stderr, "qemu: could not load kernel '%s'\n",
                     kernel_filename);
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 20dc341..eebef37 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -279,7 +279,7 @@ static unsigned long sun4m_load_kernel(const char *kernel_filename,
         bswap_needed = 0;
 #endif
         kernel_size = load_elf(kernel_filename, translate_kernel_address, NULL,
-                               NULL, NULL, NULL, 1, EM_SPARC, 0);
+                               NULL, NULL, NULL, 1, EM_SPARC, 0, 0);
         if (kernel_size < 0)
             kernel_size = load_aout(kernel_filename, KERNEL_LOAD_ADDR,
                                     RAM_size - KERNEL_LOAD_ADDR, bswap_needed,
@@ -723,7 +723,7 @@ static void prom_init(hwaddr addr, const char *bios_name)
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
     if (filename) {
         ret = load_elf(filename, translate_prom_address, &addr, NULL,
-                       NULL, NULL, 1, EM_SPARC, 0);
+                       NULL, NULL, 1, EM_SPARC, 0, 0);
         if (ret < 0 || ret > PROM_SIZE_MAX) {
             ret = load_image_targphys(filename, addr, PROM_SIZE_MAX);
         }
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index add1e75..0a6f453 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -187,7 +187,7 @@ static uint64_t sun4u_load_kernel(const char *kernel_filename,
         bswap_needed = 0;
 #endif
         kernel_size = load_elf(kernel_filename, NULL, NULL, kernel_entry,
-                               kernel_addr, &kernel_top, 1, EM_SPARCV9, 0);
+                               kernel_addr, &kernel_top, 1, EM_SPARCV9, 0, 0);
         if (kernel_size < 0) {
             *kernel_addr = KERNEL_LOAD_ADDR;
             *kernel_entry = KERNEL_LOAD_ADDR;
@@ -633,7 +633,7 @@ static void prom_init(hwaddr addr, const char *bios_name)
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
     if (filename) {
         ret = load_elf(filename, translate_prom_address, &addr,
-                       NULL, NULL, NULL, 1, EM_SPARCV9, 0);
+                       NULL, NULL, NULL, 1, EM_SPARCV9, 0, 0);
         if (ret < 0 || ret > PROM_SIZE_MAX) {
             ret = load_image_targphys(filename, addr, PROM_SIZE_MAX);
         }
diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index 9392571..3cadb65 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -45,7 +45,7 @@ static void tricore_load_kernel(CPUTriCoreState *env)
     kernel_size = load_elf(tricoretb_binfo.kernel_filename, NULL,
                            NULL, (uint64_t *)&entry, NULL,
                            NULL, 0,
-                           EM_TRICORE, 1);
+                           EM_TRICORE, 1, 0);
     if (kernel_size <= 0) {
         error_report("qemu: no kernel file '%s'",
                 tricoretb_binfo.kernel_filename);
diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index 3a5060b..23050e8 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -94,10 +94,10 @@ static void xtensa_sim_init(MachineState *machine)
         uint64_t elf_lowaddr;
 #ifdef TARGET_WORDS_BIGENDIAN
         int success = load_elf(kernel_filename, translate_phys_addr, cpu,
-                &elf_entry, &elf_lowaddr, NULL, 1, EM_XTENSA, 0);
+                &elf_entry, &elf_lowaddr, NULL, 1, EM_XTENSA, 0, 0);
 #else
         int success = load_elf(kernel_filename, translate_phys_addr, cpu,
-                &elf_entry, &elf_lowaddr, NULL, 0, EM_XTENSA, 0);
+                &elf_entry, &elf_lowaddr, NULL, 0, EM_XTENSA, 0, 0);
 #endif
         if (success > 0) {
             env->pc = elf_entry;
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index fe7684d..ed09b9d 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -355,7 +355,7 @@ static void lx_init(const LxBoardDesc *board, MachineState *machine)
         uint64_t elf_entry;
         uint64_t elf_lowaddr;
         int success = load_elf(kernel_filename, translate_phys_addr, cpu,
-                &elf_entry, &elf_lowaddr, NULL, be, EM_XTENSA, 0);
+                &elf_entry, &elf_lowaddr, NULL, be, EM_XTENSA, 0, 0);
         if (success > 0) {
             entry_point = elf_entry;
         } else {
diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 0010c44..f510e7e 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -263,7 +263,7 @@ static int glue(load_elf, SZ)(const char *name, int fd,
                               void *translate_opaque,
                               int must_swab, uint64_t *pentry,
                               uint64_t *lowaddr, uint64_t *highaddr,
-                              int elf_machine, int clear_lsb)
+                              int elf_machine, int clear_lsb, int data_swab)
 {
     struct elfhdr ehdr;
     struct elf_phdr *phdr = NULL, *ph;
@@ -366,6 +366,26 @@ static int glue(load_elf, SZ)(const char *name, int fd,
                 addr = ph->p_paddr;
             }
 
+            if (data_swab) {
+                int j;
+                for (j = 0; j < file_size; j += (1 << data_swab)) {
+                    uint8_t *dp = data + j;
+                    switch (data_swab) {
+                    case (1):
+                        *(uint16_t *)dp = bswap16(*(uint16_t *)dp);
+                        break;
+                    case (2):
+                        *(uint32_t *)dp = bswap32(*(uint32_t *)dp);
+                        break;
+                    case (3):
+                        *(uint64_t *)dp = bswap64(*(uint64_t *)dp);
+                        break;
+                    default:
+                        g_assert_not_reached();
+                    }
+                }
+            }
+
             /* the entry pointer in the ELF header is a virtual
              * address, if the text segments paddr and vaddr differ
              * we need to adjust the entry */
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 264ef89..d68e222 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -44,6 +44,9 @@ const char *load_elf_strerror(int error);
  * @elf_machine: Expected ELF machine type
  * @clear_lsb: Set to mask off LSB of addresses (Some architectures use
  *             this for non-address data)
+ * @data_swab: Set to order of byte swapping for data. 0 for no swap, 1
+ *             for swapping bytes within halfwords, 2 for bytes within
+ *             words and 3 for within doublewords.
  *
  * Load an ELF file's contents to the emulated system's address space.
  * Clients may optionally specify a callback to perform address
@@ -58,7 +61,7 @@ const char *load_elf_strerror(int error);
 int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
              void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
              uint64_t *highaddr, int big_endian, int elf_machine,
-             int clear_lsb);
+             int clear_lsb, int data_swab);
 
 /** load_elf_hdr:
  * @filename: Path of ELF file
-- 
1.9.1

