Received: by 10.25.159.19 with SMTP id i19csp1755545lfe;
        Sun, 17 Jan 2016 23:17:56 -0800 (PST)
X-Received: by 10.140.25.149 with SMTP id 21mr29782289qgt.89.1453101476057;
        Sun, 17 Jan 2016 23:17:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d32si22449377qgd.67.2016.01.17.23.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:17:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL44Z-0003Na-Ev
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:17:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL406-0003dJ-Tn
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL405-00079H-FX
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:18 -0500
Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d]:36086)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL405-000796-5m; Mon, 18 Jan 2016 02:13:17 -0500
Received: by mail-pf0-x22d.google.com with SMTP id n128so153121519pfn.3;
	Sun, 17 Jan 2016 23:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=LO8ymsobiQzX2PHuw2IsMp73L4WJiP3y10M3+b6vG0E=;
	b=MHcP0c4P2qJivfKLHlZadviDs3GF+RX66xO8gZwX4ISZj6SVMcnA/pFvXGX4ffRlha
	niA9dEPhTrZxArnUA9VoIK41tubV2cRNv1O2/vFiOJjKDKfp4m7MGAfFuBpu9xHvukzK
	zmVth89jjvcB09p3K8xKUuNueZW63WD1Tv6Y65i5GTtlh9hgQfrA3etutd4bjBcmZxvi
	EFtB4lsg2EPESqbnZdU/HlLi1crLf6OSciQRz7K05LEgYWxkknrGK213dalUvvrxSC85
	aDbyyEfPpHwhpDvwop19IMgjk2/NFiqYd5n2slJStoNuOVbSrS7EYBabZegkv6lTH9sZ
	rZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=LO8ymsobiQzX2PHuw2IsMp73L4WJiP3y10M3+b6vG0E=;
	b=kW353WLybuYiubaMvjPDkMw9C5hVlvp29HS9/TK38ummLy2TpXD9JWTGuAmyuGHeGZ
	NpANJXVHUBUJmGsSv6lQNebPnpr+Jsgy0T8Pd9deQTppMsz9RfKvi07gRBsO/pd5xzMH
	ZZjSr05hKbf4g9ieSU2WvD9QoWue4N0sAnMB8/MSkl+GeuhaO2+dt52G3mMPzfb18alT
	GzFV4ldlYVtm5ghtO6Ag40HIc97ZQzbBFqKKgkNpgafIeEnovB4rt5nnwa6IL9qzE93W
	pdzlThsp2b0APGlBLRd8mk3bfBJ3VWKVIfTCdIQEqWlSOPc2ym/G/8L97o2GXtM8Yld0
	lQKw==
X-Gm-Message-State: ALoCoQkFiw91Ax63YNUcEpvCkeA3xDw9YLEjgCwhzWT9g37D0AF283+1ozr6mniAQCg9SPneJ3nT4WgmowVQhsRPw5eko4dI6w==
X-Received: by 10.98.67.67 with SMTP id q64mr34488446pfa.133.1453101196559;
	Sun, 17 Jan 2016 23:13:16 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.13.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:13:15 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:44 -0800
Message-Id: <a423915e73675644ad71c6b87dcc0e334bbefee9.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22d
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v1 17/17] arm: boot: Support big-endian elfs
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
X-TUID: W7lbU1E5NVru

Support ARM big-endian ELF files in system-mode emulation. When loading
an elf, determine the endianness mode expected by the elf, and set the
relevant CPU state accordingly.

With this, big-endian modes are now fully supported via system-mode LE,
so there is no need to restrict the elf loading to the TARGET
endianness so the ifdeffery on TARGET_WORDS_BIGENDIAN goes away.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 hw/arm/boot.c        | 96 ++++++++++++++++++++++++++++++++++++++++++----------
 include/hw/arm/arm.h |  9 +++++
 2 files changed, 88 insertions(+), 17 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 0de4269..053c9e8 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -465,9 +465,34 @@ static void do_cpu_reset(void *opaque)
     cpu_reset(cs);
     if (info) {
         if (!info->is_linux) {
+            int i;
             /* Jump to the entry point.  */
             uint64_t entry = info->entry;
 
+            switch (info->endianness) {
+            case ARM_ENDIANNESS_LE:
+                env->cp15.sctlr_el[1] &= ~SCTLR_E0E;
+                for (i = 1; i < 4; ++i) {
+                    env->cp15.sctlr_el[i] &= ~SCTLR_EE;
+                }
+                env->uncached_cpsr &= ~CPSR_E;
+                break;
+            case ARM_ENDIANNESS_BE8:
+                env->cp15.sctlr_el[1] |= SCTLR_E0E;
+                for (i = 1; i < 4; ++i) {
+                    env->cp15.sctlr_el[i] |= SCTLR_EE;
+                }
+                env->uncached_cpsr |= CPSR_E;
+                break;
+            case ARM_ENDIANNESS_BE32:
+                env->cp15.sctlr_el[1] |= SCTLR_B;
+                break;
+            case ARM_ENDIANNESS_UNKNOWN:
+                break; /* Board's decision */
+            default:
+                g_assert_not_reached();
+            }
+
             if (!env->aarch64) {
                 env->thumb = info->entry & 1;
                 entry &= 0xfffffffe;
@@ -589,16 +614,23 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
     int kernel_size;
     int initrd_size;
     int is_linux = 0;
+
     uint64_t elf_entry, elf_low_addr, elf_high_addr;
     int elf_machine;
+    bool elf_is64;
+    union {
+        Elf32_Ehdr h32;
+        Elf64_Ehdr h64;
+    } elf_header;
+
     hwaddr entry, kernel_load_offset;
-    int big_endian;
     static const ARMInsnFixup *primary_loader;
     ArmLoadKernelNotifier *n = DO_UPCAST(ArmLoadKernelNotifier,
                                          notifier, notifier);
     ARMCPU *cpu = n->cpu;
     struct arm_boot_info *info =
         container_of(n, struct arm_boot_info, load_kernel_notifier);
+    Error *err = NULL;
 
     /* The board code is not supposed to set secure_board_setup unless
      * running its code in secure mode is actually possible, and KVM
@@ -678,12 +710,6 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
     if (info->nb_cpus == 0)
         info->nb_cpus = 1;
 
-#ifdef TARGET_WORDS_BIGENDIAN
-    big_endian = 1;
-#else
-    big_endian = 0;
-#endif
-
     /* We want to put the initrd far enough into RAM that when the
      * kernel is uncompressed it will not clobber the initrd. However
      * on boards without much RAM we must ensure that we still leave
@@ -698,16 +724,52 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
         MIN(info->ram_size / 2, 128 * 1024 * 1024);
 
     /* Assume that raw images are linux kernels, and ELF images are not.  */
-    kernel_size = load_elf(info->kernel_filename, NULL, NULL, &elf_entry,
-                           &elf_low_addr, &elf_high_addr, big_endian,
-                           elf_machine, 1, 0);
-    if (kernel_size > 0 && have_dtb(info)) {
-        /* If there is still some room left at the base of RAM, try and put
-         * the DTB there like we do for images loaded with -bios or -pflash.
-         */
-        if (elf_low_addr > info->loader_start
-            || elf_high_addr < info->loader_start) {
-            /* Pass elf_low_addr as address limit to load_dtb if it may be
+
+    load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, &err);
+
+    if (!err) {
+        int data_swab = 0;
+        bool big_endian;
+
+        if (elf_is64) {
+            big_endian = elf_header.h64.e_ident[EI_DATA] == ELFDATA2MSB;
+            info->endianness = big_endian ? ARM_ENDIANNESS_BE8
+                                          : ARM_ENDIANNESS_LE;
+        } else {
+            big_endian = elf_header.h32.e_ident[EI_DATA] == ELFDATA2MSB;
+            if (big_endian) {
+                if (bswap32(elf_header.h32.e_flags) & EF_ARM_BE8) {
+                    info->endianness = ARM_ENDIANNESS_BE8;
+                } else {
+                    info->endianness = ARM_ENDIANNESS_BE32;
+                    /* In BE32, the CPU has a different view of the per-byte
+                     * address map than the rest of the system. BE32 elfs are
+                     * organised such that they can be programmed through the
+                     * CPUs per-word byte-reversed view of the world. QEMU
+                     * however loads elfs independently of the CPU. So tell
+                     * the elf loader to byte reverse the data for us.
+                     */
+                    data_swab = 2;
+                }
+            } else {
+                info->endianness = ARM_ENDIANNESS_LE;
+            }
+        }
+
+        kernel_size = load_elf(info->kernel_filename, NULL, NULL, &elf_entry,
+                               &elf_low_addr, &elf_high_addr, big_endian,
+                               elf_machine, 1, data_swab);
+        if (kernel_size <= 0) {
+            exit(1);
+        }
+
+        if (have_dtb(info) && (elf_low_addr > info->loader_start ||
+                               elf_high_addr < info->loader_start)) {
+            /* If there is still some room left at the base of RAM, try and
+             * put the DTB there like we do for images loaded with -bios or
+             * -pflash.
+             *
+             * Pass elf_low_addr as address limit to load_dtb if it may be
              * pointing into RAM, otherwise pass '0' (no limit)
              */
             if (elf_low_addr < info->loader_start) {
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index c26b0e3..75d77c9 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -16,6 +16,13 @@
 #include "qemu/notify.h"
 #include "cpu.h"
 
+typedef enum {
+    ARM_ENDIANNESS_UNKNOWN = 0,
+    ARM_ENDIANNESS_LE,
+    ARM_ENDIANNESS_BE8,
+    ARM_ENDIANNESS_BE32,
+} arm_endianness;
+
 /* armv7m.c */
 DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
                       const char *kernel_filename, const char *cpu_model);
@@ -103,6 +110,8 @@ struct arm_boot_info {
      * changing to non-secure state if implementing a non-secure boot
      */
     bool secure_board_setup;
+
+    arm_endianness endianness;
 };
 
 /**
-- 
1.9.1

