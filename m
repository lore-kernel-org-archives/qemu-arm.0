Received: by 10.25.21.156 with SMTP id 28csp1960556lfv;
        Tue, 19 Jul 2016 22:03:50 -0700 (PDT)
X-Received: by 10.66.89.66 with SMTP id bm2mr71063970pab.154.1468991020713;
        Tue, 19 Jul 2016 22:03:40 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d10si1260915pat.143.2016.07.19.22.03.40;
        Tue, 19 Jul 2016 22:03:40 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751288AbcGTFDh (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 01:03:37 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33746 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311AbcGTFD0 (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 01:03:26 -0400
Received: by mail-pf0-f196.google.com with SMTP id i6so2693336pfe.0
        for <kvm@vger.kernel.org>; Tue, 19 Jul 2016 22:03:25 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZG1nui5Dx5kEltxPtjo2o95ox7FNOAixynO6/0NliSo=;
        b=aADzO5tNNwVCjBzbFjbhKKIhLI+3NGCtFFhfj0xX8biiYAwOZfIOgiscCaG48ZOBlt
         ixH2iaI1MfHw+G21nDcSl4jsXmFN/oyMZYkaLWP3T7l9+oX4iATNiSaRJt2KNQ8RV4TF
         2bX3GGGDVJEqxGiNTOGUvi1elQnx4g7eWnB5T4spLYkSJG3tVwz8gSSLoSYedjVk4ldx
         N61lQb9W3KdpnKXobvQduw5nKRvxiUHYXmerIRw6Xq+F2EfXjXKaf5xIACquqfQtyho0
         mW/gCwjf4a3W439oWXexUV8oh+lWF7ldUeonzfTtkAc6vEFePmcW8AQ45z4YS2YZcCqK
         rZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZG1nui5Dx5kEltxPtjo2o95ox7FNOAixynO6/0NliSo=;
        b=PWxRapf4gbT9jqrZ8dtylsH5IdxvpI99uADaefejJ0yn7gr4jnqpQsUI0i2IvXd+Uu
         O7NiaCvAllOMszqwOMMX8ueY+YHAFjj+nHjM140KPeSeh2Evf1QmfI2MVgqvxFLZ7qoX
         SqUKEL+LimFVUfvAKfFYZ2Vj7vtvd3CLBAgeQaNszTsouJCzjq+1lUKu5/fwEC7IfzfI
         3g/IHlowXeWjPDbRFauVi3+/ZScfdcBcTweLJF1h/NyVFmZ/Eg7xWzRM+PSgYR4IVaMq
         o3411rGPyZKxbM81yDtX+dgVPhZvIccHCTS5Hsw8N8Z7jNGcf8+/OBVpKelFWEVoq3Ch
         K6Fw==
X-Gm-Message-State: ALyK8tL9ywWOMt+eZuT4+QV+2a6kEfNZ13/B91gOKyFLc8mMPgRCs2BATyUdu0/C6kD7kw==
X-Received: by 10.98.103.70 with SMTP id b67mr61880046pfc.30.1468991005280;
        Tue, 19 Jul 2016 22:03:25 -0700 (PDT)
Received: from squirtle.localdomain.localdomain (c-73-225-163-254.hsd1.wa.comcast.net. [73.225.163.254])
        by smtp.gmail.com with ESMTPSA id c66sm1031757pfd.24.2016.07.19.22.03.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jul 2016 22:03:24 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v3 08/10] Convert address_space_rw to use MemoryAccessType
Date:	Tue, 19 Jul 2016 22:02:58 -0700
Message-Id: <1468990980-4598-9-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: cx2NQkMmL/aU

Convert address_space_rw() to use MemoryAccessType following the
conversion of cpu_memory_rw_debug().

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 exec.c                   | 14 +++++++++-----
 include/exec/memory.h    |  7 +++++--
 kvm-all.c                |  8 +++++---
 scripts/coverity-model.c |  9 +++++++--
 4 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/exec.c b/exec.c
index 995ff60..5557cc9 100644
--- a/exec.c
+++ b/exec.c
@@ -2726,12 +2726,16 @@ MemTxResult address_space_read_full(AddressSpace *as, hwaddr addr,
 }
 
 MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
-                             uint8_t *buf, int len, bool is_write)
+                             uint8_t *buf, int len,
+                             MemoryAccessType access_type)
 {
-    if (is_write) {
+    switch (access_type) {
+    case MEM_DATA_STORE:
         return address_space_write(as, addr, attrs, buf, len);
-    } else {
+    case MEM_DATA_LOAD:
         return address_space_read(as, addr, attrs, buf, len);
+    default:
+        abort();
     }
 }
 
@@ -2739,7 +2743,7 @@ void cpu_physical_memory_rw(hwaddr addr, uint8_t *buf,
                             int len, int is_write)
 {
     address_space_rw(&address_space_memory, addr, MEMTXATTRS_UNSPECIFIED,
-                     buf, len, is_write);
+                     buf, len, is_write ? MEM_DATA_STORE : MEM_DATA_LOAD);
 }
 
 enum write_rom_type {
@@ -3651,7 +3655,7 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
         } else {
             address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
                              MEMTXATTRS_UNSPECIFIED,
-                             buf, l, 0);
+                             buf, l, access_type);
         }
         len -= l;
         buf += l;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 7851ca9..da56c0e 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -22,6 +22,7 @@
 #define DIRTY_MEMORY_NUM       3        /* num of dirty bits */
 
 #include "exec/cpu-common.h"
+#include "qom/cpu.h"
 #ifndef CONFIG_USER_ONLY
 #include "exec/hwaddr.h"
 #endif
@@ -1284,11 +1285,13 @@ void address_space_destroy(AddressSpace *as);
  * @addr: address within that address space
  * @attrs: memory transaction attributes
  * @buf: buffer with the data transferred
- * @is_write: indicates the transfer direction
+ * @access_type: indicates the transfer direction (only valid values
+ * are MEM_DATA_LOAD for data reads and MEM_DATA_STORE for data
+ * writes)
  */
 MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
                              MemTxAttrs attrs, uint8_t *buf,
-                             int len, bool is_write);
+                             int len, MemoryAccessType access_type);
 
 /**
  * address_space_write: write to address space.
diff --git a/kvm-all.c b/kvm-all.c
index a88f917..ed45a95 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -1767,11 +1767,12 @@ static void kvm_handle_io(uint16_t port, MemTxAttrs attrs, void *data, int direc
 {
     int i;
     uint8_t *ptr = data;
+    MemoryAccessType access_type =
+        (direction == KVM_EXIT_IO_OUT) ? MEM_DATA_STORE : MEM_DATA_LOAD;
 
     for (i = 0; i < count; i++) {
         address_space_rw(&address_space_io, port, attrs,
-                         ptr, size,
-                         direction == KVM_EXIT_IO_OUT);
+                         ptr, size, access_type);
         ptr += size;
     }
 }
@@ -1947,7 +1948,8 @@ int kvm_cpu_exec(CPUState *cpu)
                              run->mmio.phys_addr, attrs,
                              run->mmio.data,
                              run->mmio.len,
-                             run->mmio.is_write);
+                             run->mmio.is_write ?
+                             MEM_DATA_STORE : MEM_DATA_LOAD);
             ret = 0;
             break;
         case KVM_EXIT_IRQ_WINDOW_OPEN:
diff --git a/scripts/coverity-model.c b/scripts/coverity-model.c
index ee5bf9d..c5603b5 100644
--- a/scripts/coverity-model.c
+++ b/scripts/coverity-model.c
@@ -68,13 +68,18 @@ static void __bufread(uint8_t *buf, ssize_t len)
 }
 
 MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
-                             uint8_t *buf, int len, bool is_write)
+                             uint8_t *buf, int len,
+                             MemoryAccessType access_type)
 {
     MemTxResult result;
 
     // TODO: investigate impact of treating reads as producing
     // tainted data, with __coverity_tainted_data_argument__(buf).
-    if (is_write) __bufread(buf, len); else __bufwrite(buf, len);
+    if (access_type == MEM_DATA_STORE) {
+        __bufread(buf, len);
+    } else {
+        __bufwrite(buf, len);
+    }
 
     return result;
 }
-- 
2.5.5

