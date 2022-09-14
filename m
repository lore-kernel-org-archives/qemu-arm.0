Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id g5-20020a5d4885000000b00228de58ae2bsm13869284wrq.12.2022.09.14.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 09:09:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3FBDA1FFB8;
	Wed, 14 Sep 2022 17:09:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH  1/4] hw: encode accessing CPU index in MemTxAttrs
Date: Wed, 14 Sep 2022 17:09:52 +0100
Message-Id: <20220914160955.812151-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914160955.812151-1-alex.bennee@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xzKFt2TrjdhW

We currently have hacks across the hw/ to reference current_cpu to
work out what the current accessing CPU is. This breaks in some cases
including using gdbstub to access HW state. As we have MemTxAttrs to
describe details about the access lets extend it to mention if this is
a CPU access and which one it is.

There are a number of places we need to fix up including:

  CPU helpers directly calling address_space_*() fns
  models in hw/ fishing the data out of current_cpu

I'll start addressing some of these in following patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/memattrs.h |  4 +++-
 accel/tcg/cputlb.c      | 22 ++++++++++++++++------
 hw/core/cpu-sysemu.c    | 17 +++++++++++++----
 3 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..3bccd5d291 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -43,7 +43,9 @@ typedef struct MemTxAttrs {
      * (see MEMTX_ACCESS_ERROR).
      */
     unsigned int memory:1;
-    /* Requester ID (for MSI for example) */
+    /* Requester is CPU (or as CPU, e.g. debug) */
+    unsigned int requester_cpu:1;
+    /* Requester ID (for MSI for example) or cpu_index */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8fad2d9b83..68dc7dc646 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1340,8 +1340,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     uint64_t val;
     bool locked = false;
     MemTxResult r;
+    MemTxAttrs attrs = iotlbentry->attrs;
 
-    section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
+    /* encode the accessing CPU */
+    attrs.requester_cpu = 1;
+    attrs.requester_id = cpu->cpu_index;
+
+    section = iotlb_to_section(cpu, iotlbentry->addr, attrs);
     mr = section->mr;
     mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
     cpu->mem_io_pc = retaddr;
@@ -1353,14 +1358,14 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked = true;
     }
-    r = memory_region_dispatch_read(mr, mr_offset, &val, op, iotlbentry->attrs);
+    r = memory_region_dispatch_read(mr, mr_offset, &val, op, attrs);
     if (r != MEMTX_OK) {
         hwaddr physaddr = mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;
 
         cpu_transaction_failed(cpu, physaddr, addr, memop_size(op), access_type,
-                               mmu_idx, iotlbentry->attrs, r, retaddr);
+                               mmu_idx, attrs, r, retaddr);
     }
     if (locked) {
         qemu_mutex_unlock_iothread();
@@ -1395,8 +1400,13 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     MemoryRegion *mr;
     bool locked = false;
     MemTxResult r;
+    MemTxAttrs attrs = iotlbentry->attrs;
+
+    /* encode the accessing CPU */
+    attrs.requester_cpu = 1;
+    attrs.requester_id = cpu->cpu_index;
 
-    section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
+    section = iotlb_to_section(cpu, iotlbentry->addr, attrs);
     mr = section->mr;
     mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
     if (!cpu->can_do_io) {
@@ -1414,14 +1424,14 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked = true;
     }
-    r = memory_region_dispatch_write(mr, mr_offset, val, op, iotlbentry->attrs);
+    r = memory_region_dispatch_write(mr, mr_offset, val, op, attrs);
     if (r != MEMTX_OK) {
         hwaddr physaddr = mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;
 
         cpu_transaction_failed(cpu, physaddr, addr, memop_size(op),
-                               MMU_DATA_STORE, mmu_idx, iotlbentry->attrs, r,
+                               MMU_DATA_STORE, mmu_idx, attrs, r,
                                retaddr);
     }
     if (locked) {
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 00253f8929..bd7ae983ed 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -51,13 +51,22 @@ hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                      MemTxAttrs *attrs)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
+    MemTxAttrs local = { };
+    hwaddr res;
 
     if (cc->sysemu_ops->get_phys_page_attrs_debug) {
-        return cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, attrs);
+        res = cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, &local);
+    } else {
+        /* Fallback for CPUs which don't implement the _attrs_ hook */
+        local = MEMTXATTRS_UNSPECIFIED;
+        res = cc->sysemu_ops->get_phys_page_debug(cpu, addr);
     }
-    /* Fallback for CPUs which don't implement the _attrs_ hook */
-    *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->sysemu_ops->get_phys_page_debug(cpu, addr);
+
+    /* debug access is treated as though it came from the CPU */
+    local.requester_cpu = 1;
+    local.requester_id = cpu->cpu_index;
+    *attrs = local;
+    return res;
 }
 
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
-- 
2.34.1
