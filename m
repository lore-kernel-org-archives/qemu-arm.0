Received: by 10.25.21.156 with SMTP id 28csp1960567lfv;
        Tue, 19 Jul 2016 22:03:52 -0700 (PDT)
X-Received: by 10.66.90.34 with SMTP id bt2mr70995455pab.139.1468991023312;
        Tue, 19 Jul 2016 22:03:43 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id lr5si1245668pab.204.2016.07.19.22.03.43;
        Tue, 19 Jul 2016 22:03:43 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751558AbcGTFDj (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 01:03:39 -0400
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36819 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750888AbcGTFD1 (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 01:03:27 -0400
Received: by mail-pa0-f65.google.com with SMTP id ez1so2564645pab.3
        for <kvm@vger.kernel.org>; Tue, 19 Jul 2016 22:03:27 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=djqvyyDAFrMmkZ2o2JvtspsKM4YYdo0SnbNIWv0YbCU=;
        b=mErcruk2jDgpLNmlBEJJ2Rb6GBchjqxi6H302y5cZPIE7DqgNPSnqnQ/s3Z+0nzFk3
         PKaDY4yF5saq3veJJ+lUQv8tDw2gee2lI80Y7G/xtxTDXVA78Urd3fUzftNAQi7z+mUC
         POUfSeV4mZLLheLLuNDQt1R8FV0iZH5ZWtAAl9XxTSYDZNG2NqQdTdh2UXec3PgKklbe
         svl5I6Q/X8gl95umtg++LGV6CsfnJrivUNRi6N3B8QWv0NlwtaP1MI9t/Kp0Rzlyx8aR
         zmWdHgYjvl/YocVsuvilLhMC5r1ZEIxoYPBYuw7jI84qjpMLCyLrwXr7rsJnPKb+fbOl
         kePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=djqvyyDAFrMmkZ2o2JvtspsKM4YYdo0SnbNIWv0YbCU=;
        b=m1n16B8XeHi0AAaOXBhM+jUvk5tWOmW3mb23MQHn9QYMVBKwDmoZPj8x+dfnljwlsk
         ofefvSao80Gfz7/RdzzWbeVmMPjSfnbjNQ81SrKS7sXaTeGqM3oeCSaRx/+fkmJqQOuo
         GaczMtfbyn54Os2nwn1g2COYHf9iFxSW52MpCAu23FOEEsrI7n7qWpyTUvWC7yd/Akbp
         G0VDD1pHOCVn7CZxdvRahLOWFpT85jivlMbVkRdSYS5WQfTzsMCiI/zOfSWhjyqRWEaC
         xRkWyqZJVws8/vaWvW1TJybcZU8JsLGUld2y9ucV4Giu79cgwzBT5GhKhDIVfM/d4JuZ
         kIHg==
X-Gm-Message-State: ALyK8tIAjhwdREVCiD5HMWmfjEV6Fz6lT7TEHXtbZEFWeKpA6HvbNk5YEXQ2sCKe0bIJzg==
X-Received: by 10.66.191.234 with SMTP id hb10mr29612441pac.149.1468991007080;
        Tue, 19 Jul 2016 22:03:27 -0700 (PDT)
Received: from squirtle.localdomain.localdomain (c-73-225-163-254.hsd1.wa.comcast.net. [73.225.163.254])
        by smtp.gmail.com with ESMTPSA id c66sm1031757pfd.24.2016.07.19.22.03.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jul 2016 22:03:26 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v3 10/10] exec: Use address_space_rw to handle reads and wirtes
Date:	Tue, 19 Jul 2016 22:03:00 -0700
Message-Id: <1468990980-4598-11-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: AmRe4ubmS+jm

Use address_space_rw to handle reads and wirtes in cpu_memory_rw_debug()
this way it becomes possible to modify memory mapped registers through
GDB connection.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 exec.c            | 55 ++++++++++++++++++++++++++++++++++++++++---------------
 gdbstub.c         |  2 +-
 include/qom/cpu.h |  3 ++-
 3 files changed, 43 insertions(+), 17 deletions(-)

diff --git a/exec.c b/exec.c
index 5557cc9..565d494 100644
--- a/exec.c
+++ b/exec.c
@@ -2444,7 +2444,8 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
     uint8_t *buf = b;
 
     g_assert(access_type == MEM_DATA_STORE ||
-             access_type == MEM_DATA_LOAD);
+             access_type == MEM_DATA_LOAD  ||
+             access_type == MEM_DEBUG_STORE);
 
     while (len > 0) {
         page = addr & TARGET_PAGE_MASK;
@@ -2556,7 +2557,8 @@ static MemTxResult address_space_write_continue(AddressSpace *as, hwaddr addr,
                                                 MemTxAttrs attrs,
                                                 const uint8_t *buf,
                                                 int len, hwaddr addr1,
-                                                hwaddr l, MemoryRegion *mr)
+                                                hwaddr l, MemoryRegion *mr,
+                                                bool debug)
 {
     uint8_t *ptr;
     uint64_t val;
@@ -2564,7 +2566,15 @@ static MemTxResult address_space_write_continue(AddressSpace *as, hwaddr addr,
     bool release_lock = false;
 
     for (;;) {
-        if (!memory_access_is_direct(mr, true)) {
+        /*
+         * debug_direct is used to copy the semantics of
+         * cpu_physical_memory_write_rom() which was originally used
+         * to handle writes to memory with GDBStub
+         */
+        const bool debug_direct = (debug && !(memory_region_is_ram(mr) ||
+                                              memory_region_is_romd(mr)));
+
+        if (!memory_access_is_direct(mr, true) || !debug_direct) {
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
             /* XXX: could force current_cpu to NULL to avoid
@@ -2615,8 +2625,10 @@ static MemTxResult address_space_write_continue(AddressSpace *as, hwaddr addr,
     return result;
 }
 
-MemTxResult address_space_write(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
-                                const void *buf, int len)
+static MemTxResult address_space_write_combined(AddressSpace *as, hwaddr addr,
+                                                MemTxAttrs attrs,
+                                                const void *buf, int len,
+                                                bool debug)
 {
     hwaddr l;
     hwaddr addr1;
@@ -2628,11 +2640,25 @@ MemTxResult address_space_write(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
         l = len;
         mr = address_space_translate(as, addr, &addr1, &l, true);
         result = address_space_write_continue(as, addr, attrs, buf, len,
-                                              addr1, l, mr);
+                                              addr1, l, mr, debug);
         rcu_read_unlock();
     }
 
     return result;
+
+}
+
+MemTxResult address_space_write(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
+                                const void *buf, int len)
+{
+    return address_space_write_combined(as, addr, attrs, buf, len, false);
+}
+
+static MemTxResult address_space_write_debug(AddressSpace *as, hwaddr addr,
+                                             MemTxAttrs attrs,
+                                             const void *buf, int len)
+{
+    return address_space_write_combined(as, addr, attrs, buf, len, true);
 }
 
 /* Called within RCU critical section.  */
@@ -2734,6 +2760,8 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
         return address_space_write(as, addr, attrs, buf, len);
     case MEM_DATA_LOAD:
         return address_space_read(as, addr, attrs, buf, len);
+    case MEM_DEBUG_STORE:
+        return address_space_write_debug(as, addr, attrs, buf, len);
     default:
         abort();
     }
@@ -3633,7 +3661,8 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
     uint8_t *buf = b;
 
     g_assert(access_type == MEM_DATA_STORE ||
-             access_type == MEM_DATA_LOAD);
+             access_type == MEM_DATA_LOAD  ||
+             access_type == MEM_DEBUG_STORE);
 
     while (len > 0) {
         int asidx;
@@ -3649,14 +3678,10 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
         if (l > len)
             l = len;
         phys_addr += (addr & ~TARGET_PAGE_MASK);
-        if (access_type == MEM_DATA_STORE) {
-            cpu_physical_memory_write_rom(cpu->cpu_ases[asidx].as,
-                                          phys_addr, buf, l);
-        } else {
-            address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
-                             MEMTXATTRS_UNSPECIFIED,
-                             buf, l, access_type);
-        }
+        address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
+                         MEMTXATTRS_UNSPECIFIED,
+                         buf, l, access_type);
+
         len -= l;
         buf += l;
         addr += l;
diff --git a/gdbstub.c b/gdbstub.c
index c215672..03d45f7 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -991,7 +991,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
         hextomem(mem_buf, p, len);
         if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len,
-                                   MEM_DATA_STORE) != 0) {
+                                   MEM_DEBUG_STORE) != 0) {
             put_packet(s, "E14");
         } else {
             put_packet(s, "OK");
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index b23b4b1..28e30a1 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -63,7 +63,8 @@ typedef uint64_t vaddr;
 typedef enum MemoryAccessType {
     MEM_DATA_LOAD  = 0,
     MEM_DATA_STORE = 1,
-    MEM_INST_FETCH = 2
+    MEM_INST_FETCH = 2,
+    MEM_DEBUG_STORE = 3,
 } MemoryAccessType;
 
 typedef struct CPUWatchpoint CPUWatchpoint;
-- 
2.5.5

