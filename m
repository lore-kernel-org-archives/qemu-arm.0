Received: by 10.25.159.19 with SMTP id i19csp1801938lfe;
        Thu, 14 Jan 2016 06:17:46 -0800 (PST)
X-Received: by 10.28.214.76 with SMTP id n73mr34839866wmg.52.1452781066251;
        Thu, 14 Jan 2016 06:17:46 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id m12si37526052wmg.59.2016.01.14.06.17.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 06:17:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKd-0008UZ-I5; Thu, 14 Jan 2016 13:52:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 09/19] exec.c: Use cpu_get_phys_page_attrs_debug
Date: Thu, 14 Jan 2016 13:52:45 +0000
Message-Id: <1452779575-32582-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 57fDkGV7EIkt

Use cpu_get_phys_page_attrs_debug() when doing virtual-to-physical
conversions in debug related code, so that we can obtain the right
address space index and thus select the correct AddressSpace,
rather than always using cpu->as.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 exec.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/exec.c b/exec.c
index cbadca4..590a018 100644
--- a/exec.c
+++ b/exec.c
@@ -667,9 +667,11 @@ static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
 #else
 static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
 {
-    hwaddr phys = cpu_get_phys_page_debug(cpu, pc);
+    MemTxAttrs attrs;
+    hwaddr phys = cpu_get_phys_page_attrs_debug(cpu, pc, &attrs);
+    int asidx = cpu_asidx_from_attrs(cpu, attrs);
     if (phys != -1) {
-        tb_invalidate_phys_addr(cpu->as,
+        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
                                 phys | (pc & ~TARGET_PAGE_MASK));
     }
 }
@@ -3586,8 +3588,12 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
     target_ulong page;
 
     while (len > 0) {
+        int asidx;
+        MemTxAttrs attrs;
+
         page = addr & TARGET_PAGE_MASK;
-        phys_addr = cpu_get_phys_page_debug(cpu, page);
+        phys_addr = cpu_get_phys_page_attrs_debug(cpu, page, &attrs);
+        asidx = cpu_asidx_from_attrs(cpu, attrs);
         /* if no physical page mapped, return an error */
         if (phys_addr == -1)
             return -1;
@@ -3596,9 +3602,11 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
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
