Received: by 10.25.208.211 with SMTP id h202csp2010648lfg;
        Tue, 1 Mar 2016 23:03:37 -0800 (PST)
X-Received: by 10.55.78.84 with SMTP id c81mr31680721qkb.85.1456902217890;
        Tue, 01 Mar 2016 23:03:37 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si2178264qho.50.2016.03.01.23.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 23:03:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0or-0001NJ-8f
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 02:03:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0j1-0007Q7-GU
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0j0-0003er-BP
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:35 -0500
Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231]:36785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0j0-0003ea-1S; Wed, 02 Mar 2016 01:57:34 -0500
Received: by mail-pa0-x231.google.com with SMTP id a9so5824908pat.3;
	Tue, 01 Mar 2016 22:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+a8RDYYI0c6+1AsQRSG7A/0N1OK86iNS5HjVNaU+Mu4=;
	b=dFBLQ6Siyx3K0uwlVzX8ybS+kKd1gChCJmDLHGa5vnaoDbJ8+cLZ2xR6h3aS6uVRul
	O087M99c2LDw5jlJHq4bf2uakcxxd6wsWakWXPs5HZGuudBKT/rL16lpj8BKaCHyVqV7
	gLjMK5YcHEqzzeHY2Kl+VQoq1shDMFCz/NUY1Ad6odkZ9T2VGDYWK6CyynbwAUtVpNYO
	OQL0vtWAyZbrhbkhGzRDa5sfV4Dp9P7P+luh8J1djiqH1sKfJi6YrIFPn4K5dlcAX/8f
	RQhiqlMgyafP5wy4o3gZCXaInkZkwyuoDXUhmHlYgt9raK3Qg7H4f2o6sETJnHFfo3aB
	WtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=+a8RDYYI0c6+1AsQRSG7A/0N1OK86iNS5HjVNaU+Mu4=;
	b=ETepHpA6DLJWB/eCrBgJzSzbVBOyx6H/+jaa2vkTla5GyFzvoJ2i4Tq9L2xp+LCWkK
	0Rv0Ii7s4Wi3GRRThdDYQugVkovKN634xn2OzcSRlH4WNu6Vae8Q/1WeQngS4VonQHw/
	jO4MLCCMpC8k4seaNGgTYQKIYQMT82cz59qht4KXsWE+xe0pAUa9CtJJvzsG92v9qPXb
	4xLz7q2oYpt5XXCQhszKB9/kd2KjlnSvP/+NGDegP0MNtexE4Uhmc7uJ8p94YnuLwnsy
	jMlmj06PKBa/dtPLdKPTn72dieDaXmKLHoR+LEh2ZdNmi/xRsD0WC+1I1FKVSxmp+0F1
	cvuw==
X-Gm-Message-State: AD7BkJLAYwe/qgmt3pUv6Kauj3CjgR6j5e2fTxiGwQUIbCcnt+0Snih4rARuqm6aU+d5uA==
X-Received: by 10.66.158.232 with SMTP id wx8mr36960451pab.159.1456901853228; 
	Tue, 01 Mar 2016 22:57:33 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.57.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:57:32 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:22 -0800
Message-Id: <de1440818b347c6d445313aa18440ca3b8b7676e.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::231
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 18/18] arm: boot: Support big-endian elfs
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
X-TUID: eYffu2IsSMJS

Support ARM big-endian ELF files in system-mode emulation. When loading
an elf, determine the endianness mode expected by the elf, and set the
relevant CPU state accordingly.

With this, big-endian modes are now fully supported via system-mode LE,
so there is no need to restrict the elf loading to the TARGET
endianness so the ifdeffery on TARGET_WORDS_BIGENDIAN goes away.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
Changed since v1:
Factor out elf manipulation logic into static helper (PMM review)

 hw/arm/boot.c        | 93 ++++++++++++++++++++++++++++++++++++++++++++++------
 include/hw/arm/arm.h |  9 +++++
 2 files changed, 92 insertions(+), 10 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 17400be..13aad42 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -518,9 +518,34 @@ static void do_cpu_reset(void *opaque)
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
@@ -638,6 +663,62 @@ static int do_arm_linux_init(Object *obj, void *opaque)
     return 0;
 }
 
+static uint64_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
+                             uint64_t *lowaddr, uint64_t *highaddr,
+                             int elf_machine)
+{
+    bool elf_is64;
+    union {
+        Elf32_Ehdr h32;
+        Elf64_Ehdr h64;
+    } elf_header;
+    int data_swab = 0;
+    bool big_endian;
+    uint64_t ret = -1;
+    Error *err = NULL;
+
+
+    load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, &err);
+    if (err) {
+        return ret;
+    }
+
+    if (elf_is64) {
+        big_endian = elf_header.h64.e_ident[EI_DATA] == ELFDATA2MSB;
+        info->endianness = big_endian ? ARM_ENDIANNESS_BE8
+                                      : ARM_ENDIANNESS_LE;
+    } else {
+        big_endian = elf_header.h32.e_ident[EI_DATA] == ELFDATA2MSB;
+        if (big_endian) {
+            if (bswap32(elf_header.h32.e_flags) & EF_ARM_BE8) {
+                info->endianness = ARM_ENDIANNESS_BE8;
+            } else {
+                info->endianness = ARM_ENDIANNESS_BE32;
+                /* In BE32, the CPU has a different view of the per-byte
+                 * address map than the rest of the system. BE32 elfs are
+                 * organised such that they can be programmed through the
+                 * CPUs per-word byte-reversed view of the world. QEMU
+                 * however loads elfs independently of the CPU. So tell
+                 * the elf loader to byte reverse the data for us.
+                 */
+                data_swab = 2;
+            }
+        } else {
+            info->endianness = ARM_ENDIANNESS_LE;
+        }
+    }
+
+    ret = load_elf(info->kernel_filename, NULL, NULL,
+                   pentry, lowaddr, highaddr, big_endian, elf_machine,
+                   1, data_swab);
+    if (ret <= 0) {
+        /* The header loaded but the image didn't */
+        exit(1);
+    }
+
+    return ret;
+}
+
 static void arm_load_kernel_notify(Notifier *notifier, void *data)
 {
     CPUState *cs;
@@ -647,7 +728,6 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
     uint64_t elf_entry, elf_low_addr, elf_high_addr;
     int elf_machine;
     hwaddr entry, kernel_load_offset;
-    int big_endian;
     static const ARMInsnFixup *primary_loader;
     ArmLoadKernelNotifier *n = DO_UPCAST(ArmLoadKernelNotifier,
                                          notifier, notifier);
@@ -733,12 +813,6 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
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
@@ -753,9 +827,8 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
         MIN(info->ram_size / 2, 128 * 1024 * 1024);
 
     /* Assume that raw images are linux kernels, and ELF images are not.  */
-    kernel_size = load_elf(info->kernel_filename, NULL, NULL, &elf_entry,
-                           &elf_low_addr, &elf_high_addr, big_endian,
-                           elf_machine, 1, 0);
+    kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
+                               &elf_high_addr, elf_machine);
     if (kernel_size > 0 && have_dtb(info)) {
         /* If there is still some room left at the base of RAM, try and put
          * the DTB there like we do for images loaded with -bios or -pflash.
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index 52ecf4a..b2517f9 100644
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

