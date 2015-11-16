Received: by 10.182.158.201 with SMTP id ww9csp129619obb;
        Mon, 16 Nov 2015 06:22:23 -0800 (PST)
X-Received: by 10.28.148.133 with SMTP id w127mr17901013wmd.92.1447683737215;
        Mon, 16 Nov 2015 06:22:17 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id 81si25938820wmm.87.2015.11.16.06.22.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:22:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPL-00013C-LE; Mon, 16 Nov 2015 14:05:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 09/19] exec.c: Use cpu_get_phys_page_attrs_debug
Date: Mon, 16 Nov 2015 14:05:13 +0000
Message-Id: <1447682723-3977-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: Ck7rNofv7fS2

Use cpu_get_phys_page_attrs_debug() when doing virtual-to-physical
conversions in debug related code, so that we can obtain the right
address space index and thus select the correct AddressSpace,
rather than always using cpu->as.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/exec.c b/exec.c
index 0d7af0c..de540e4 100644
--- a/exec.c
+++ b/exec.c
@@ -682,9 +682,11 @@ static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
 #else
 static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
 {
-    hwaddr phys = cpu_get_phys_page_debug(cpu, pc);
+    MemTxAttrs attrs = {};
+    hwaddr phys = cpu_get_phys_page_attrs_debug(cpu, pc, &attrs);
+    int asidx = cpu_asidx_from_attrs(cpu, attrs);
     if (phys != -1) {
-        tb_invalidate_phys_addr(cpu->as,
+        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
                                 phys | (pc & ~TARGET_PAGE_MASK));
     }
 }
@@ -3558,8 +3560,12 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
     target_ulong page;
 
     while (len > 0) {
+        int asidx;
+        MemTxAttrs attrs = {};
+
         page = addr & TARGET_PAGE_MASK;
-        phys_addr = cpu_get_phys_page_debug(cpu, page);
+        phys_addr = cpu_get_phys_page_attrs_debug(cpu, page, &attrs);
+        asidx = cpu_asidx_from_attrs(cpu, attrs);
         /* if no physical page mapped, return an error */
         if (phys_addr == -1)
             return -1;
@@ -3568,9 +3574,11 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
             l = len;
         phys_addr += (addr & ~TARGET_PAGE_MASK);
         if (is_write) {
-            cpu_physical_memory_write_rom(cpu->as, phys_addr, buf, l);
+            cpu_physical_memory_write_rom(cpu->cpu_ases[asidx].as,
+                                          phys_addr, buf, l);
         } else {
-            address_space_rw(cpu->as, phys_addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
+                             MEMTXATTRS_UNSPECIFIED,
                              buf, l, 0);
         }
         len -= l;
-- 
1.9.1
