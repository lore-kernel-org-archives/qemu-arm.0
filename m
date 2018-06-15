Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp638640wrq;
        Fri, 15 Jun 2018 02:49:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIa3zeC6f6BHbCPxcN763dRUGjEVGuUffJkIsDcnTIl+l0UJWKjA+wiYsyKJSIgl7DD6/2D
X-Received: by 2002:ac8:230a:: with SMTP id a10-v6mr744860qta.234.1529056169603;
        Fri, 15 Jun 2018 02:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529056169; cv=none;
        d=google.com; s=arc-20160816;
        b=M8wnkd0qe5GaBeFcI5jH5YWTwAHSzg2Cmvndjs7RQwF4eXu7aXcn0BQ5KY2lzYm4eW
         MBIJuON5YPQDdRfhnJ4HQlUNNqXhVFKS3bASGkU6E6NdP+jdz14xM8oZzcP4o85mnUgq
         wq7HO6fculYlHhQ5iApQM7nV/VFXD2ptdVnQYetfoewPvKLg0Lzr9Tnsg/DqV/ixKhIS
         IDw6o/A42nB0eoBzi/wZNtk1CoIXOX+LsXnZVxlK1B6jOxH/p3SlwXGMDcEzw3lsLOOq
         ODbVdo1bVk6FjE9egAf4L5T2n64Ivnr6Cvp7TGBUvrdQJNcc0PVueYWgtsQ3/uQCduzD
         bf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=/lazeiMs0l+MD6+0mpOyMyY1tgXmr+YvrO1NzZaWBRY=;
        b=fFOM2eqlL5FWki62N5IW38PgrPK40rbzIG1b9sU+yBNBlBngxuKbJSYEvwgM+iiTEi
         gRPU9SNQIW6Cq9TE/68z6XC1UFm+q1062ZpOuFdalo48TEN0TJ0RxxpENSuLitw7xPKK
         /vI+iZ19KOxIx8fapdjEy97mO16+rxMgyaBORbOsAcISWksOyTLyQ8JJEMi1x7Oh/3Dc
         RydN45ONIl25ozyRHbl685G3u0cdXM+XN0JhRgrbi7fQzbLhZNy7MmaHovSjGKNRzzjO
         owET2SFnyd/YQIZPZXDU31iIyqJKpL/ymmwRz+sOvk5IpqDlbsZV/sLC/Rrs8dluc/xJ
         1KIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p69-v6si5189035qkp.98.2018.06.15.02.49.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 02:49:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTlMH-0006RB-5i
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 05:49:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fTlM1-0006PU-Cj
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 05:49:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fTlLy-0005fn-7N
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 05:49:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46510 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fTlLy-0005fe-1Q; Fri, 15 Jun 2018 05:49:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64A68401EF2E;
	Fri, 15 Jun 2018 09:49:09 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-79.ams2.redhat.com [10.36.116.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 319E820284D6;
	Fri, 15 Jun 2018 09:49:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>
Date: Fri, 15 Jun 2018 11:49:05 +0200
Message-Id: <1529056145-6404-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 09:49:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 09:49:09 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3] loader: Check access size when calling
 rom_ptr() to avoid crashes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7ssGqobx2VQB

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

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v3: Fix the check in find_rom()

 hw/core/loader.c     | 10 +++++-----
 hw/mips/mips_malta.c |  6 ++++--
 hw/s390x/ipl.c       | 13 ++++++++++---
 hw/sparc/sun4m.c     |  4 ++--
 hw/sparc64/sun4u.c   |  4 ++--
 include/hw/loader.h  |  2 +-
 target/arm/cpu.c     |  2 +-
 7 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 06bdbca..4a06cce 100644
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
index 04245b5..bcac204 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -169,9 +169,12 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
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
@@ -179,6 +182,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
         if (ipl->initrd) {
             ram_addr_t initrd_offset;
             int initrd_size;
+            uint64_t *romptr;
 
             initrd_offset = INITRD_START;
             while (kernel_size + 0x100000 > initrd_offset) {
@@ -195,8 +199,11 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
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
index 0ee779f..8eef74b 100644
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
index 1bede85..5b76863 100644
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
index ab047b9..95f92b2 100644
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

