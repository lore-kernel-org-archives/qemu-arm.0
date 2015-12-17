Received: by 10.182.158.201 with SMTP id ww9csp343918obb;
        Thu, 17 Dec 2015 04:24:14 -0800 (PST)
X-Received: by 10.140.98.53 with SMTP id n50mr31161010qge.9.1450355054583;
        Thu, 17 Dec 2015 04:24:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v9si11082651qhc.100.2015.12.17.04.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 04:24:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9XbS-0001cD-7N
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 07:24:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9XXS-0003Qt-Fv
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 07:20:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9XXM-0002jm-He
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 07:20:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a9XXM-0002jJ-7a; Thu, 17 Dec 2015 07:20:00 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 5EACB96EE;
	Thu, 17 Dec 2015 12:19:59 +0000 (UTC)
Received: from blackfin.pond.sub.org ([10.3.113.12])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBHCJukS007574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 17 Dec 2015 07:19:57 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 90300303E3DC; Thu, 17 Dec 2015 13:19:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 17 Dec 2015 13:19:43 +0100
Message-Id: <1450354795-31608-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1450354795-31608-1-git-send-email-armbru@redhat.com>
References: <1450354795-31608-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@pond.sub.org>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-arm] [PATCH v2 01/13] hw: Don't use hw_error() for machine
	initialization errors
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qeGqDFVzbcZ/

Printing CPU registers is not helpful during machine initialization.
Moreover, these are straightforward configuration or "can get
resources" errors, so dumping core isn't appropriate either.  Replace
hw_error() by error_report(); exit(1).  Matches how we report these
errors in other machine initializations.

Cc: Richard Henderson <rth@twiddle.net>
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Signed-off-by: Markus Armbruster <armbru@pond.sub.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/alpha/dp264.c          | 11 ++++++-----
 hw/arm/highbank.c         |  6 ++++--
 hw/char/exynos4210_uart.c |  9 ++++++---
 hw/m68k/an5206.c          |  4 +++-
 hw/ppc/mac_newworld.c     | 11 ++++++-----
 hw/ppc/mac_oldworld.c     | 16 +++++++++-------
 hw/ppc/prep.c             | 11 +++++++----
 hw/unicore32/puv3.c       | 10 +++++++---
 8 files changed, 48 insertions(+), 30 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 27bdaa1..38b85ba 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -11,6 +11,7 @@
 #include "hw/loader.h"
 #include "hw/boards.h"
 #include "alpha_sys.h"
+#include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
 #include "hw/timer/mc146818rtc.h"
 #include "hw/ide.h"
@@ -104,14 +105,14 @@ static void clipper_init(MachineState *machine)
     palcode_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
                                 bios_name ? bios_name : "palcode-clipper");
     if (palcode_filename == NULL) {
-        hw_error("no palcode provided\n");
+        error_report("no palcode provided");
         exit(1);
     }
     size = load_elf(palcode_filename, cpu_alpha_superpage_to_phys,
                     NULL, &palcode_entry, &palcode_low, &palcode_high,
                     0, EM_ALPHA, 0);
     if (size < 0) {
-        hw_error("could not load palcode '%s'\n", palcode_filename);
+        error_report("could not load palcode '%s'", palcode_filename);
         exit(1);
     }
     g_free(palcode_filename);
@@ -131,7 +132,7 @@ static void clipper_init(MachineState *machine)
                         NULL, &kernel_entry, &kernel_low, &kernel_high,
                         0, EM_ALPHA, 0);
         if (size < 0) {
-            hw_error("could not load kernel '%s'\n", kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
 
@@ -148,8 +149,8 @@ static void clipper_init(MachineState *machine)
 
             initrd_size = get_image_size(initrd_filename);
             if (initrd_size < 0) {
-                hw_error("could not load initial ram disk '%s'\n",
-                         initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
                 exit(1);
             }
 
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 85ae69e..1dd5170 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -320,11 +320,13 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         sysboot_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
         if (sysboot_filename != NULL) {
             if (load_image_targphys(sysboot_filename, 0xfff88000, 0x8000) < 0) {
-                hw_error("Unable to load %s\n", bios_name);
+                error_report("Unable to load %s", bios_name);
+                exit(1);
             }
             g_free(sysboot_filename);
         } else {
-           hw_error("Unable to find %s\n", bios_name);
+            error_report("Unable to find %s", bios_name);
+            exit(1);
         }
     }
 
diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 215f962..2736b37 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -20,6 +20,7 @@
  */
 
 #include "hw/sysbus.h"
+#include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/char.h"
 
@@ -595,15 +596,17 @@ DeviceState *exynos4210_uart_create(hwaddr addr,
 
     if (!chr) {
         if (channel >= MAX_SERIAL_PORTS) {
-            hw_error("Only %d serial ports are supported by QEMU.\n",
-                     MAX_SERIAL_PORTS);
+            error_report("Only %d serial ports are supported by QEMU",
+                         MAX_SERIAL_PORTS);
+            exit(1);
         }
         chr = serial_hds[channel];
         if (!chr) {
             snprintf(label, ARRAY_SIZE(label), "%s%d", chr_name, channel);
             chr = qemu_chr_new(label, "null", NULL);
             if (!(chr)) {
-                hw_error("Can't assign serial port to UART%d.\n", channel);
+                error_report("Can't assign serial port to UART%d", channel);
+                exit(1);
             }
         }
     }
diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
index c1dea17..8d9ccaa 100644
--- a/hw/m68k/an5206.c
+++ b/hw/m68k/an5206.c
@@ -12,6 +12,7 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "exec/address-spaces.h"
+#include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 
 #define KERNEL_LOAD_ADDR 0x10000
@@ -39,7 +40,8 @@ static void an5206_init(MachineState *machine)
     }
     cpu = cpu_m68k_init(cpu_model);
     if (!cpu) {
-        hw_error("Unable to find m68k CPU definition\n");
+        error_report("Unable to find m68k CPU definition");
+        exit(1);
     }
     env = &cpu->env;
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 1b9a573..ca3d6a8 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -62,6 +62,7 @@
 #include "hw/ide.h"
 #include "hw/loader.h"
 #include "elf.h"
+#include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
 #include "hw/usb.h"
@@ -226,7 +227,7 @@ static void ppc_core99_init(MachineState *machine)
         bios_size = -1;
     }
     if (bios_size < 0 || bios_size > BIOS_SIZE) {
-        hw_error("qemu: could not load PowerPC bios '%s'\n", bios_name);
+        error_report("could not load PowerPC bios '%s'", bios_name);
         exit(1);
     }
 
@@ -252,7 +253,7 @@ static void ppc_core99_init(MachineState *machine)
                                               kernel_base,
                                               ram_size - kernel_base);
         if (kernel_size < 0) {
-            hw_error("qemu: could not load kernel '%s'\n", kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
         /* load initrd */
@@ -261,8 +262,8 @@ static void ppc_core99_init(MachineState *machine)
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
-                hw_error("qemu: could not load initial ram disk '%s'\n",
-                         initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
                 exit(1);
             }
             cmdline_base = round_page(initrd_base + initrd_size);
@@ -344,7 +345,7 @@ static void ppc_core99_init(MachineState *machine)
             break;
 #endif /* defined(TARGET_PPC64) */
         default:
-            hw_error("Bus model not supported on mac99 machine\n");
+            error_report("Bus model not supported on mac99 machine");
             exit(1);
         }
     }
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 21eaf0e..c3f9fe3 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -38,6 +38,7 @@
 #include "hw/ide.h"
 #include "hw/loader.h"
 #include "elf.h"
+#include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
 #include "sysemu/block-backend.h"
@@ -153,7 +154,7 @@ static void ppc_heathrow_init(MachineState *machine)
         bios_size = -1;
     }
     if (bios_size < 0 || bios_size > BIOS_SIZE) {
-        hw_error("qemu: could not load PowerPC bios '%s'\n", bios_name);
+        error_report("could not load PowerPC bios '%s'", bios_name);
         exit(1);
     }
 
@@ -178,8 +179,7 @@ static void ppc_heathrow_init(MachineState *machine)
                                               kernel_base,
                                               ram_size - kernel_base);
         if (kernel_size < 0) {
-            hw_error("qemu: could not load kernel '%s'\n",
-                      kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
         /* load initrd */
@@ -188,8 +188,8 @@ static void ppc_heathrow_init(MachineState *machine)
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
-                hw_error("qemu: could not load initial ram disk '%s'\n",
-                         initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
                 exit(1);
             }
             cmdline_base = round_page(initrd_base + initrd_size);
@@ -246,7 +246,8 @@ static void ppc_heathrow_init(MachineState *machine)
                 ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT];
             break;
         default:
-            hw_error("Bus model not supported on OldWorld Mac machine\n");
+            error_report("Bus model not supported on OldWorld Mac machine");
+            exit(1);
         }
     }
 
@@ -259,7 +260,8 @@ static void ppc_heathrow_init(MachineState *machine)
 
     /* init basic PC hardware */
     if (PPC_INPUT(env) != PPC_FLAGS_INPUT_6xx) {
-        hw_error("Only 6xx bus is supported on heathrow machine\n");
+        error_report("Only 6xx bus is supported on heathrow machine");
+        exit(1);
     }
     pic = heathrow_pic_init(&pic_mem, 1, heathrow_irqs);
     pci_bus = pci_grackle_init(0xfec00000, pic,
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 5ad28f7..0e102fc 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -33,6 +33,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/ppc/ppc.h"
 #include "hw/boards.h"
+#include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "hw/ide.h"
 #include "hw/loader.h"
@@ -532,7 +533,7 @@ static void ppc_prep_init(MachineState *machine)
         kernel_size = load_image_targphys(kernel_filename, kernel_base,
                                           ram_size - kernel_base);
         if (kernel_size < 0) {
-            hw_error("qemu: could not load kernel '%s'\n", kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
         /* load initrd */
@@ -541,8 +542,9 @@ static void ppc_prep_init(MachineState *machine)
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
-                hw_error("qemu: could not load initial ram disk '%s'\n",
-                          initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
+                exit(1);
             }
         } else {
             initrd_base = 0;
@@ -569,7 +571,8 @@ static void ppc_prep_init(MachineState *machine)
     }
 
     if (PPC_INPUT(env) != PPC_FLAGS_INPUT_6xx) {
-        hw_error("Only 6xx bus is supported on PREP machine\n");
+        error_report("Only 6xx bus is supported on PREP machine");
+        exit(1);
     }
 
     dev = qdev_create(NULL, "raven-pcihost");
diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index 91117b2..1968202 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -17,6 +17,7 @@
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/i386/pc.h"
+#include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 
 #undef DEBUG_PUV3
@@ -95,7 +96,8 @@ static void puv3_load_kernel(const char *kernel_filename)
     size = load_image_targphys(kernel_filename, KERNEL_LOAD_ADDR,
             KERNEL_MAX_SIZE);
     if (size < 0) {
-        hw_error("Load kernel error: '%s'\n", kernel_filename);
+        error_report("Load kernel error: '%s'", kernel_filename);
+        exit(1);
     }
 
     /* cheat curses that we have a graphic console, only under ocd console */
@@ -112,7 +114,8 @@ static void puv3_init(MachineState *machine)
     UniCore32CPU *cpu;
 
     if (initrd_filename) {
-        hw_error("Please use kernel built-in initramdisk.\n");
+        error_report("Please use kernel built-in initramdisk");
+        exit(1);
     }
 
     if (!cpu_model) {
@@ -121,7 +124,8 @@ static void puv3_init(MachineState *machine)
 
     cpu = uc32_cpu_init(cpu_model);
     if (!cpu) {
-        hw_error("Unable to find CPU definition\n");
+        error_report("Unable to find CPU definition");
+        exit(1);
     }
     env = &cpu->env;
 
-- 
2.4.3

