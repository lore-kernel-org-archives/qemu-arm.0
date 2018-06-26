Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4798341wrq;
        Tue, 26 Jun 2018 02:36:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf+ZYDGjpWEciEXmOhhK1Pv0YMV5wAJfj04zob0CZ2/VA5uC/fojrChuhqa4X2D10i6iYIf
X-Received: by 2002:ac8:65c5:: with SMTP id t5-v6mr605739qto.314.1530005791092;
        Tue, 26 Jun 2018 02:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530005791; cv=none;
        d=google.com; s=arc-20160816;
        b=SPy+cOIuHfnioLSyL3bpvVx1vVqbHTk6YSjRDqulN8s1rUWqBe3DC6QwZq+yypY3tA
         FIK7M8ZGrN19caZxHmrA+QHrMWAMr2dcIkw1SoeZHRn5Kat5SJBIRztrDUY9jj6R2S2Y
         xKFWPSNpIUcRFQ7tYWyz6PnzAelND5VOa2cllOi4+Pec2tF5sRiMLdZYhiiaz27Y8aUq
         HBEQjbOodKa05HVFYouPpa5+3wGJvdRlx6sejHZBMXvk55B2gYpwrOjez3R9L8MuX2q8
         m5ASF2UO1RLLt87h6NQ0+6xIfzZWCxkBE40VtGlssxfUqrrAs595TUZ9ABtrdUXLLrz3
         31WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=LwocR946EMHAP8o3mCXt/wiLqSjkCSwtNEZEBWRQziI=;
        b=sFf4q9Z0V7wwT61Y1gVys+5KzGeK21SsHsNqlceeTb7RVl48O7vAB+niUUi3T9hthe
         Z3Husrzg5emIaFLPNAd92xmC9QwHYHK72elQbBvHtNa16gaZwUfvLApEZworgRx3bbAH
         Bw9aNZv5I2XEQJ/h713U18bmZkttW72Qhq1jUMy9C9WeyRvo2sStAm2WknCIzLpoMZ2Y
         NCfypitRzGQMWdTVrRDR8xyoTiEklkBTMBsbUpd9VrDfYukvtseP9r2PxE696lIWjIBK
         F1qYgk11fwabuHRLI2AEgxQQITGeE00IoBkWcoDXAYNSSMs0IKCuH71UzzGAvLR+/rdM
         qaeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s29-v6si1161723qki.146.2018.06.26.02.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 02:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXkOk-0006uS-HR
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 05:36:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fXkOB-0006sl-0T
	for qemu-devel@nongnu.org; Tue, 26 Jun 2018 05:35:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fXkO8-0007rA-Ud
	for qemu-devel@nongnu.org; Tue, 26 Jun 2018 05:35:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58348 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fXkO2-0007p8-3s; Tue, 26 Jun 2018 05:35:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1144781A4EAD;
	Tue, 26 Jun 2018 09:35:45 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-204-33.brq.redhat.com [10.40.204.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92E59111AF0B;
	Tue, 26 Jun 2018 09:35:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>
Date: Tue, 26 Jun 2018 11:35:40 +0200
Message-Id: <1530005740-25254-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 26 Jun 2018 09:35:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 26 Jun 2018 09:35:45 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v4] loader: Check access size when calling
 rom_ptr() to avoid crashes
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.markovic@mips.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 08GcaLXf9tKN

The rom_ptr() function allows direct access to the ROM blobs that we
load during startup. However, there are currently no checks for the
size of the accesses, so it's currently possible to crash QEMU for
example with:

$ echo "Insane in the mainframe" > /tmp/test.txt
$ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
Segmentation fault (core dumped)
$ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
Segmentation fault (core dumped)
$ echo -n HdrS > /tmp/hdr.txt
$ sparc64-softmmu/qemu-system-sparc64 -kernel /tmp/hdr.txt -initrd /tmp/hdr.txt
Segmentation fault (core dumped)

We need a possibility to check the size of the ROM area that we want
to access, thus let's add a size parameter to the rom_ptr() function
to avoid these problems.

Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v4:
 - Rebase (two more spots were using rom_ptr now)
 - Remove INITRD_PARM_SIZE since it's unused now

 hw/core/loader.c     | 10 +++++-----
 hw/mips/mips_malta.c |  6 ++++--
 hw/s390x/ipl.c       | 18 ++++++++++++------
 hw/sparc/sun4m.c     |  4 ++--
 hw/sparc64/sun4u.c   |  4 ++--
 include/hw/loader.h  |  2 +-
 target/arm/cpu.c     |  2 +-
 7 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 06bdbca..bbb6e65 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -191,7 +191,7 @@ void pstrcpy_targphys(const char *name, hwaddr dest, int buf_size,
         rom_add_blob_fixed(name, source, (nulp - source) + 1, dest);
     } else {
         rom_add_blob_fixed(name, source, buf_size, dest);
-        ptr = rom_ptr(dest + buf_size - 1);
+        ptr = rom_ptr(dest + buf_size - 1, sizeof(*ptr));
         *ptr = 0;
     }
 }
@@ -1165,7 +1165,7 @@ void rom_reset_order_override(void)
     fw_cfg_reset_order_override(fw_cfg);
 }
 
-static Rom *find_rom(hwaddr addr)
+static Rom *find_rom(hwaddr addr, size_t size)
 {
     Rom *rom;
 
@@ -1179,7 +1179,7 @@ static Rom *find_rom(hwaddr addr)
         if (rom->addr > addr) {
             continue;
         }
-        if (rom->addr + rom->romsize < addr) {
+        if (rom->addr + rom->romsize < addr + size) {
             continue;
         }
         return rom;
@@ -1249,11 +1249,11 @@ int rom_copy(uint8_t *dest, hwaddr addr, size_t size)
     return (d + l) - dest;
 }
 
-void *rom_ptr(hwaddr addr)
+void *rom_ptr(hwaddr addr, size_t size)
 {
     Rom *rom;
 
-    rom = find_rom(addr);
+    rom = find_rom(addr, size);
     if (!rom || !rom->data)
         return NULL;
     return rom->data + (addr - rom->addr);
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 494f84e..3733e2f 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1133,11 +1133,13 @@ void mips_malta_init(MachineState *machine)
            a neat trick which allows bi-endian firmware. */
 #ifndef TARGET_WORDS_BIGENDIAN
         {
-            uint32_t *end, *addr = rom_ptr(FLASH_ADDRESS);
+            uint32_t *end, *addr;
+            const size_t swapsize = MIN(bios_size, 0x3e0000);
+            addr = rom_ptr(FLASH_ADDRESS, swapsize);
             if (!addr) {
                 addr = memory_region_get_ram_ptr(bios);
             }
-            end = (void *)addr + MIN(bios_size, 0x3e0000);
+            end = (void *)addr + swapsize;
             while (addr < end) {
                 bswap32s(addr);
                 addr++;
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index f278036..21f64ad 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -33,7 +33,6 @@
 #define KERN_PARM_AREA                  0x010480UL
 #define INITRD_START                    0x800000UL
 #define INITRD_PARM_START               0x010408UL
-#define INITRD_PARM_SIZE                0x010410UL
 #define PARMFILE_START                  0x001000UL
 #define ZIPL_IMAGE_START                0x009000UL
 #define IPL_PSW_MASK                    (PSW_MASK_32 | PSW_MASK_64)
@@ -165,12 +164,12 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
                 goto error;
             }
             /* if this is Linux use KERN_IMAGE_START */
-            magic = rom_ptr(LINUX_MAGIC_ADDR);
+            magic = rom_ptr(LINUX_MAGIC_ADDR, 6);
             if (magic && !memcmp(magic, "S390EP", 6)) {
                 pentry = KERN_IMAGE_START;
             } else {
                 /* if not Linux load the address of the (short) IPL PSW */
-                ipl_psw = rom_ptr(4);
+                ipl_psw = rom_ptr(4, 4);
                 if (ipl_psw) {
                     pentry = be32_to_cpu(*ipl_psw) & 0x7fffffffUL;
                 } else {
@@ -186,9 +185,12 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
          * loader) and it won't work. For this case we force it to 0x10000, too.
          */
         if (pentry == KERN_IMAGE_START || pentry == 0x800) {
+            char *parm_area = rom_ptr(KERN_PARM_AREA, strlen(ipl->cmdline) + 1);
             ipl->start_addr = KERN_IMAGE_START;
             /* Overwrite parameters in the kernel image, which are "rom" */
-            strcpy(rom_ptr(KERN_PARM_AREA), ipl->cmdline);
+            if (parm_area) {
+                strcpy(parm_area, ipl->cmdline);
+            }
         } else {
             ipl->start_addr = pentry;
         }
@@ -196,6 +198,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
         if (ipl->initrd) {
             ram_addr_t initrd_offset;
             int initrd_size;
+            uint64_t *romptr;
 
             initrd_offset = INITRD_START;
             while (kernel_size + 0x100000 > initrd_offset) {
@@ -212,8 +215,11 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
              * we have to overwrite values in the kernel image,
              * which are "rom"
              */
-            stq_p(rom_ptr(INITRD_PARM_START), initrd_offset);
-            stq_p(rom_ptr(INITRD_PARM_SIZE), initrd_size);
+            romptr = rom_ptr(INITRD_PARM_START, 16);
+            if (romptr) {
+                stq_p(romptr, initrd_offset);
+                stq_p(romptr + 1, initrd_size);
+            }
         }
     }
     /*
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index b984d2d..21078cc 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -272,8 +272,8 @@ static unsigned long sun4m_load_kernel(const char *kernel_filename,
         }
         if (initrd_size > 0) {
             for (i = 0; i < 64 * TARGET_PAGE_SIZE; i += TARGET_PAGE_SIZE) {
-                ptr = rom_ptr(KERNEL_LOAD_ADDR + i);
-                if (ldl_p(ptr) == 0x48647253) { // HdrS
+                ptr = rom_ptr(KERNEL_LOAD_ADDR + i, 24);
+                if (ptr && ldl_p(ptr) == 0x48647253) { /* HdrS */
                     stl_p(ptr + 16, INITRD_LOAD_ADDR);
                     stl_p(ptr + 20, initrd_size);
                     break;
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 3975a7b..334dd70 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -186,8 +186,8 @@ static uint64_t sun4u_load_kernel(const char *kernel_filename,
         }
         if (*initrd_size > 0) {
             for (i = 0; i < 64 * TARGET_PAGE_SIZE; i += TARGET_PAGE_SIZE) {
-                ptr = rom_ptr(*kernel_addr + i);
-                if (ldl_p(ptr + 8) == 0x48647253) { /* HdrS */
+                ptr = rom_ptr(*kernel_addr + i, 32);
+                if (ptr && ldl_p(ptr + 8) == 0x48647253) { /* HdrS */
                     stl_p(ptr + 24, *initrd_addr + *kernel_addr);
                     stl_p(ptr + 28, *initrd_size);
                     break;
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 5ed3fd8..e98b84b 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -226,7 +226,7 @@ void rom_set_fw(FWCfgState *f);
 void rom_set_order_override(int order);
 void rom_reset_order_override(void);
 int rom_copy(uint8_t *dest, hwaddr addr, size_t size);
-void *rom_ptr(hwaddr addr);
+void *rom_ptr(hwaddr addr, size_t size);
 void hmp_info_roms(Monitor *mon, const QDict *qdict);
 
 #define rom_add_file_fixed(_f, _a, _i)          \
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e1de45e..9822b14 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -232,7 +232,7 @@ static void arm_cpu_reset(CPUState *s)
 
         /* Load the initial SP and PC from offset 0 and 4 in the vector table */
         vecbase = env->v7m.vecbase[env->v7m.secure];
-        rom = rom_ptr(vecbase);
+        rom = rom_ptr(vecbase, 8);
         if (rom) {
             /* Address zero is covered by ROM which hasn't yet been
              * copied into physical memory.
-- 
1.8.3.1

