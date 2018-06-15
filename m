Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp499780wrq;
        Thu, 14 Jun 2018 23:58:39 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKVLpFsJtIcTSU0NjVjpkFW7klD5u30XDu1uRtFHrNzK7GeuY1KUg4J+5FSUE4CdDstoQuh
X-Received: by 2002:a37:9e89:: with SMTP id h131-v6mr304819qke.269.1529045918927;
        Thu, 14 Jun 2018 23:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529045918; cv=none;
        d=google.com; s=arc-20160816;
        b=BCDPi0B/aBkkT0toszQR/u8BfWrG1QjaBSpt5FguOIKeJjRzWH2HbETkSOQPhi+BBh
         N6QIE3gQfkKpAMzeER2LkZ9y9uwNP3axoUmU2mvRVHRrlU8mcxWpsu6Pqz0KM5wEnaMb
         pUFQmwY2YDni8GIAgfRqf7hDvtKmUBzN8qiCBDIOiOXk0DPO+OpwF31+mRfFmL/56P2n
         Qu0KWjsU13ie4S8wa1L3NkcdzxV3rCrwYQxJBPxen4dy3DCKSWAwWNcQrxlhdxKLk/pH
         baTQhJ5jPIdg1ANAgsHxuPptFk5K/rZHIIpg8/PNYl5EvpKzIJvcQr4lnnxqS3wXIgJ2
         YOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=RiriZ6TPudn4d2yiUIhI0Jp0O35YInBQls+yhfiYm/E=;
        b=HbSvpLEopx/xPfUZrFPdFha8vNV8dAhGadY8Cw51hAkitQ3ZiGcGuF0x2lzu3CmEC7
         qlqs2oayvtMCfrAjkQ6Pwa4YJwYXUSZ41fvtYX6hAZKmyjzSxVDEQ05tUqYvzm4RIUWu
         /3Pqaui2ymItccKXJ3hqLrmmD6CqbGnUrXBvl9WR32X3zy63LU9wU0NCwLQ6U/3ZyKB3
         6K0T1pqAiAjhFmB1cIf7GLaqIlz74SPqgg0H1V9s2OwVaMKdvV6KQ4XnSpiJzRZXdi9b
         Ma5XLKkDIpTya6Be4HUkgzXrIEwz+2a22VYtWb+BMulG8Gsvf+uMCrDbiRdCnrpsFrlW
         oKFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e26-v6si3340921qvb.180.2018.06.14.23.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 23:58:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44653 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTigw-0001ew-EW
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 02:58:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fTigj-0001d5-LN
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 02:58:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fTigg-0000YC-HR
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 02:58:25 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42090 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fTigg-0000Xm-BM; Fri, 15 Jun 2018 02:58:22 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 697C5401EF03;
	Fri, 15 Jun 2018 06:58:21 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-79.ams2.redhat.com [10.36.116.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CB351116718;
	Fri, 15 Jun 2018 06:58:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>
Date: Fri, 15 Jun 2018 08:58:17 +0200
Message-Id: <1529045897-25260-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 06:58:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 06:58:21 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH] loader: Check access size when calling rom_ptr()
 to avoid crashes
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
X-TUID: Tto9tUh5K1ft

The rom_ptr() function allows direct access to the ROM blobs that we
load during startup. However, there are currently no checks for the
size of the accesses, so it's currently possible to crash QEMU for
example with:

$ echo "Insane in the mainframe" > /tmp/test.txt
$ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
Segmentation fault (core dumped)
$ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
Segmentation fault (core dumped)

We need a possibility to check the size of the ROM area that we want
to access, thus let's add a size parameter to the rom_ptr() function
to avoid these problems.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/loader.c     | 10 +++++-----
 hw/mips/mips_malta.c |  6 ++++--
 hw/s390x/ipl.c       | 13 ++++++++++---
 hw/sparc/sun4m.c     |  2 +-
 hw/sparc64/sun4u.c   |  2 +-
 include/hw/loader.h  |  2 +-
 target/arm/cpu.c     |  2 +-
 7 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 06bdbca..54be522 100644
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
 
@@ -1176,7 +1176,7 @@ static Rom *find_rom(hwaddr addr)
         if (rom->mr) {
             continue;
         }
-        if (rom->addr > addr) {
+        if (rom->addr > addr + size) {
             continue;
         }
         if (rom->addr + rom->romsize < addr) {
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
index 0ee779f..2375cb2 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -272,7 +272,7 @@ static unsigned long sun4m_load_kernel(const char *kernel_filename,
         }
         if (initrd_size > 0) {
             for (i = 0; i < 64 * TARGET_PAGE_SIZE; i += TARGET_PAGE_SIZE) {
-                ptr = rom_ptr(KERNEL_LOAD_ADDR + i);
+                ptr = rom_ptr(KERNEL_LOAD_ADDR + i, 24);
                 if (ldl_p(ptr) == 0x48647253) { // HdrS
                     stl_p(ptr + 16, INITRD_LOAD_ADDR);
                     stl_p(ptr + 20, initrd_size);
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 1bede85..8b09090 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -186,7 +186,7 @@ static uint64_t sun4u_load_kernel(const char *kernel_filename,
         }
         if (*initrd_size > 0) {
             for (i = 0; i < 64 * TARGET_PAGE_SIZE; i += TARGET_PAGE_SIZE) {
-                ptr = rom_ptr(*kernel_addr + i);
+                ptr = rom_ptr(*kernel_addr + i, 32);
                 if (ldl_p(ptr + 8) == 0x48647253) { /* HdrS */
                     stl_p(ptr + 24, *initrd_addr + *kernel_addr);
                     stl_p(ptr + 28, *initrd_size);
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

