Received: by 10.182.158.201 with SMTP id ww9csp129559obb;
        Mon, 16 Nov 2015 06:22:16 -0800 (PST)
X-Received: by 10.28.24.5 with SMTP id 5mr9656839wmy.3.1447683734665;
        Mon, 16 Nov 2015 06:22:14 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id l64si25973140wmb.78.2015.11.16.06.22.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:22:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPL-00013G-Mj; Mon, 16 Nov 2015 14:05:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 10/19] exec.c: Use correct AddressSpace in watch_mem_read and watch_mem_write
Date: Mon, 16 Nov 2015 14:05:14 +0000
Message-Id: <1447682723-3977-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: py6h5YkzCY58

In the watchpoint access routines watch_mem_read and watch_mem_write,
find the correct AddressSpace to use from current_cpu and the memory
transaction attributes, rather than always assuming address_space_memory.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/exec.c b/exec.c
index de540e4..a455632 100644
--- a/exec.c
+++ b/exec.c
@@ -2101,17 +2101,19 @@ static MemTxResult watch_mem_read(void *opaque, hwaddr addr, uint64_t *pdata,
 {
     MemTxResult res;
     uint64_t data;
+    int asidx = cpu_asidx_from_attrs(current_cpu, attrs);
+    AddressSpace *as = current_cpu->cpu_ases[asidx].as;
 
     check_watchpoint(addr & ~TARGET_PAGE_MASK, size, attrs, BP_MEM_READ);
     switch (size) {
     case 1:
-        data = address_space_ldub(&address_space_memory, addr, attrs, &res);
+        data = address_space_ldub(as, addr, attrs, &res);
         break;
     case 2:
-        data = address_space_lduw(&address_space_memory, addr, attrs, &res);
+        data = address_space_lduw(as, addr, attrs, &res);
         break;
     case 4:
-        data = address_space_ldl(&address_space_memory, addr, attrs, &res);
+        data = address_space_ldl(as, addr, attrs, &res);
         break;
     default: abort();
     }
@@ -2124,17 +2126,19 @@ static MemTxResult watch_mem_write(void *opaque, hwaddr addr,
                                    MemTxAttrs attrs)
 {
     MemTxResult res;
+    int asidx = cpu_asidx_from_attrs(current_cpu, attrs);
+    AddressSpace *as = current_cpu->cpu_ases[asidx].as;
 
     check_watchpoint(addr & ~TARGET_PAGE_MASK, size, attrs, BP_MEM_WRITE);
     switch (size) {
     case 1:
-        address_space_stb(&address_space_memory, addr, val, attrs, &res);
+        address_space_stb(as, addr, val, attrs, &res);
         break;
     case 2:
-        address_space_stw(&address_space_memory, addr, val, attrs, &res);
+        address_space_stw(as, addr, val, attrs, &res);
         break;
     case 4:
-        address_space_stl(&address_space_memory, addr, val, attrs, &res);
+        address_space_stl(as, addr, val, attrs, &res);
         break;
     default: abort();
     }
-- 
1.9.1
