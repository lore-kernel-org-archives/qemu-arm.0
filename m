Received: by 10.25.21.96 with SMTP id l93csp77100lfi;
        Thu, 16 Jun 2016 21:19:24 -0700 (PDT)
X-Received: by 10.140.20.136 with SMTP id 8mr66469qgj.14.1466137163970;
        Thu, 16 Jun 2016 21:19:23 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q68si29690127qkq.90.2016.06.16.21.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Jun 2016 21:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDlFb-0001mg-CM
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 00:19:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1bDjfF-0005rU-Mr
	for qemu-devel@nongnu.org; Thu, 16 Jun 2016 22:37:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1bDjfE-0007ix-1F
	for qemu-devel@nongnu.org; Thu, 16 Jun 2016 22:37:45 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35043)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>)
	id 1bDjf6-0007iA-5w; Thu, 16 Jun 2016 22:37:36 -0400
Received: by mail-pf0-x242.google.com with SMTP id t190so5128022pfb.2;
	Thu, 16 Jun 2016 19:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YjC1+XQvtvPwTpPASevUlc8BClDT4X06XoK8G+pEobI=;
	b=nGbLuHqJJ6P3hA52LNspubnMJH850rp8WJW8o6r+Y6vn0tyEA914YItYvOBr+KPyWd
	RwPcwMD5pwrFF5kkNLX6+WtU1531MzwL4PXf8RW5TuCRDSDLKzbAtdKC8KswyDSc/GvM
	o7YxUH54zX06XcXp8pqx6+he4/XfA0OSbKprjulo1OqKwBLHYC1t4/ryKGv2nhusymNc
	g2B2XvQki4mqr7B6UUSiF5p6OFCvWRG8/+m404DIT1zTHzO7PJUiLbwS4xdaG7ETf2uj
	AgVgWTef8K9SH5mlJGGdNE/T24SplzJl3AVrS+CxHC/kDZylwjdUgouduQyfZumldOhA
	U1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YjC1+XQvtvPwTpPASevUlc8BClDT4X06XoK8G+pEobI=;
	b=WiPaz3+TMOLJ5Sc0QchsgrKbAp7PEX4q5w06a7fDtBGlqeMQTYpbqe2PiBCo7SHIpH
	id4V00lkLRFAmt1PySRjCH0mo0XfVOwO9jvy0hRKOpO4RtoP+KNfqZ+3VEVJTQ0bk+WZ
	CGdQh9d9134S561si88vBeXkIgvi7kr+DutO/ptB62c/SzV/wa3B/peDAZPEoJSnyvfb
	e6FHsS35sf3QkA3h88bpuY3URoPWfw1JfQTnCjk4nKe8+KX23oqy9ibPsN2d8M10dc6G
	QqSQap4LIiAZlBflQtKL/0y4BM61dhWNY5eRUc3FRGjiH6yb0EBWfm6F0/RY9mskSoz0
	oK+Q==
X-Gm-Message-State: ALyK8tIhoKLKQfSRqLeRXsmPPj71JmwP3KcRRSbU7KFmcyujlg/vjaz3dsPHdK9jXYR+mQ==
X-Received: by 10.98.134.196 with SMTP id x187mr8914750pfd.21.1466131054827;
	Thu, 16 Jun 2016 19:37:34 -0700 (PDT)
Received: from Tari7Braves.flets-east.jp (p3b93c7bf.tokynt01.ap.so-net.ne.jp.
	[59.147.199.191]) by smtp.googlemail.com with ESMTPSA id
	h189sm24569791pfc.52.2016.06.16.19.37.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jun 2016 19:37:34 -0700 (PDT)
From: Tsung-Han Lin <tsunghan.tw@gmail.com>
To: peter.maydell@linaro.org,
	pbonzini@redhat.com
Date: Fri, 17 Jun 2016 11:37:26 +0900
Message-Id: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
X-Mailman-Approved-At: Fri, 17 Jun 2016 00:17:29 -0400
Subject: [Qemu-devel] [RFC] target-arm: fix semihosting ram base issue
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
Cc: tsunghan.tw@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QLxd41m680as

Hi, I made some changes to TRY TO fix the ARM semihosting issue in
SYS_HEAPINFO handling.
This problem has been bothering me for quite a while.

A new global variable 'main_ram_base' is added while a new memory
API, memory_region_add_subregion_main, is also provided to let
SoC/board creator to initialize this variable.
I am not sure if this is a good idea (to add a new API)
or maybe we just let SoC/board creator to simply
set 'main_ram_base' in their 'xxx_realize' functions?

As for Cortex-M series, 'main_ram_base' is set during cpu initialization.
A64 semihosting handling is also added and use zynqmp as an example.

Any comments/reviews are big welcome!
Thanks in advance!
---
 hw/arm/xlnx-zynqmp.c      |  2 +-
 include/exec/cpu-common.h |  1 +
 include/exec/memory.h     |  6 ++++++
 memory.c                  |  8 ++++++++
 target-arm/arm-semi.c     | 37 ++++++++++++++++++++++++++-----------
 target-arm/cpu.c          |  1 +
 vl.c                      |  1 +
 7 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 23c719986715..8124f71992b4 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -206,7 +206,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         memory_region_init_alias(&s->ddr_ram_high, NULL,
                                  "ddr-ram-high", s->ddr_ram,
                                   ddr_low_size, ddr_high_size);
-        memory_region_add_subregion(get_system_memory(),
+        memory_region_add_subregion_main(get_system_memory(),
                                     XLNX_ZYNQMP_HIGH_RAM_START,
                                     &s->ddr_ram_high);
     } else {
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index aaee99563464..c345e61ede16 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -49,6 +49,7 @@ typedef uintptr_t ram_addr_t;
 #endif
 
 extern ram_addr_t ram_size;
+extern ram_addr_t main_ram_base;
 
 /* memory API */
 
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 4ab680052f27..d76b0a069c98 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -972,6 +972,8 @@ void memory_region_del_eventfd(MemoryRegion *mr,
  * may only be added once as a subregion (unless removed with
  * memory_region_del_subregion()); use memory_region_init_alias() if you
  * want a region to be a subregion in multiple locations.
+ * The _main version is used to define the main working ram area, such ddr
+ * ram region.
  *
  * @mr: the region to contain the new subregion; must be a container
  *      initialized with memory_region_init().
@@ -981,6 +983,10 @@ void memory_region_del_eventfd(MemoryRegion *mr,
 void memory_region_add_subregion(MemoryRegion *mr,
                                  hwaddr offset,
                                  MemoryRegion *subregion);
+
+void memory_region_add_subregion_main(MemoryRegion *mr,
+                                 hwaddr offset,
+                                 MemoryRegion *subregion);
 /**
  * memory_region_add_subregion_overlap: Add a subregion to a container
  *                                      with overlap.
diff --git a/memory.c b/memory.c
index 8ba496dc7b2a..3221838abefe 100644
--- a/memory.c
+++ b/memory.c
@@ -1911,6 +1911,14 @@ void memory_region_add_subregion(MemoryRegion *mr,
     memory_region_add_subregion_common(mr, offset, subregion);
 }
 
+void memory_region_add_subregion_main(MemoryRegion *mr,
+                                 hwaddr offset,
+                                 MemoryRegion *subregion)
+{
+    main_ram_base = offset;
+    memory_region_add_subregion(mr, offset, subregion);
+}
+
 void memory_region_add_subregion_overlap(MemoryRegion *mr,
                                          hwaddr offset,
                                          MemoryRegion *subregion,
diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
index 8be0645eb08b..d30469688b01 100644
--- a/target-arm/arm-semi.c
+++ b/target-arm/arm-semi.c
@@ -599,17 +599,32 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             unlock_user(ptr, arg0, 16);
 #else
             limit = ram_size;
-            ptr = lock_user(VERIFY_WRITE, arg0, 16, 0);
-            if (!ptr) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
-            }
-            /* TODO: Make this use the limit of the loaded application.  */
-            ptr[0] = tswap32(limit / 2);
-            ptr[1] = tswap32(limit);
-            ptr[2] = tswap32(limit); /* Stack base */
-            ptr[3] = tswap32(0); /* Stack limit.  */
-            unlock_user(ptr, arg0, 16);
+			if (is_a64(env)) {
+				uint64_t *ptrx;
+				ptrx = lock_user(VERIFY_WRITE, arg0, 32, 0);
+				if (!ptrx) {
+					/* FIXME - should this error code be -TARGET_EFAULT ? */
+					return (uint32_t)-1;
+				}
+				/* TODO: Make this use the limit of the loaded application.  */
+				ptrx[0] = tswap64(main_ram_base + ram_size / 2); /* Heap base */
+				ptrx[1] = tswap64(main_ram_base + ram_size);         /* limit */
+				ptrx[2] = tswap64(main_ram_base + ram_size); /* Stack base */
+				ptrx[3] = tswap64(main_ram_base + ram_size / 2);  /* limit */
+				unlock_user(ptrx, arg0, 32);
+			} else {
+				ptr = lock_user(VERIFY_WRITE, arg0, 16, 0);
+				if (!ptr) {
+					/* FIXME - should this error code be -TARGET_EFAULT ? */
+					return (uint32_t)-1;
+				}
+				/* TODO: Make this use the limit of the loaded application.  */
+				ptr[0] = tswap32(main_ram_base + limit / 2);
+				ptr[1] = tswap32(main_ram_base + limit);
+				ptr[2] = tswap32(main_ram_base + limit); /* Stack base */
+				ptr[3] = tswap32(main_ram_base); /* Stack limit.  */
+				unlock_user(ptr, arg0, 16);
+			}
 #endif
             return 0;
         }
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 3fd0743cb391..fbc7d6914694 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -193,6 +193,7 @@ static void arm_cpu_reset(CPUState *s)
             initial_msp = ldl_phys(s->as, 0);
             initial_pc = ldl_phys(s->as, 4);
         }
+		main_ram_base = 0x20000000;
 
         env->regs[13] = initial_msp & 0xFFFFFFFC;
         env->regs[15] = initial_pc & ~1;
diff --git a/vl.c b/vl.c
index 0736d8430dc3..ff1eeb50329f 100644
--- a/vl.c
+++ b/vl.c
@@ -133,6 +133,7 @@ int request_opengl = -1;
 int display_opengl;
 const char* keyboard_layout = NULL;
 ram_addr_t ram_size;
+ram_addr_t main_ram_base = 0x0; /* default ram base to 0 */
 const char *mem_path = NULL;
 int mem_prealloc = 0; /* force preallocation of physical target memory */
 bool enable_mlock = false;
-- 
2.7.4

