Received: by 10.182.105.169 with SMTP id gn9csp618868obb;
        Thu, 5 Nov 2015 10:16:01 -0800 (PST)
X-Received: by 10.28.5.4 with SMTP id 4mr5664446wmf.22.1446747361031;
        Thu, 05 Nov 2015 10:16:01 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id r12si11535978wmd.12.2015.11.05.10.16.00
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4p-0004kh-7T; Thu, 05 Nov 2015 18:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 07/16] exec.c: Use cpu_get_phys_page_asidx_debug
Date: Thu,  5 Nov 2015 18:15:49 +0000
Message-Id: <1446747358-18214-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: lYBY1NsrGaEe

Use cpu_get_phys_page_asidx_debug() when doing virtual-to-physical
conversions in debug related code, so that we can obtain the right
address space index and thus select the correct AddressSpace,
rather than always using cpu->as.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/exec.c b/exec.c
index 13da780..bc6ab8a 100644
--- a/exec.c
+++ b/exec.c
@@ -684,9 +684,10 @@ static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
 #else
 static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
 {
-    hwaddr phys = cpu_get_phys_page_debug(cpu, pc);
+    int asidx;
+    hwaddr phys = cpu_get_phys_page_asidx_debug(cpu, pc, &asidx);
     if (phys != -1) {
-        tb_invalidate_phys_addr(cpu->as,
+        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
                                 phys | (pc & ~TARGET_PAGE_MASK));
     }
 }
@@ -3502,8 +3503,10 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
     target_ulong page;
 
     while (len > 0) {
+        int asidx;
+
         page = addr & TARGET_PAGE_MASK;
-        phys_addr = cpu_get_phys_page_debug(cpu, page);
+        phys_addr = cpu_get_phys_page_asidx_debug(cpu, page, &asidx);
         /* if no physical page mapped, return an error */
         if (phys_addr == -1)
             return -1;
@@ -3512,9 +3515,11 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
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
