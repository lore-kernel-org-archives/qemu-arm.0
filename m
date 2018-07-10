Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3741472wrq;
        Tue, 10 Jul 2018 09:10:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe68C5NYhW9yjHuq2Unmu3vyKBqoEnl3H28UbyL1nFpqx5bBbKpQR9Vwkvf9iZiqNR5fSrm
X-Received: by 2002:ac8:fb1:: with SMTP id b46-v6mr23586340qtk.31.1531239018632;
        Tue, 10 Jul 2018 09:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531239018; cv=none;
        d=google.com; s=arc-20160816;
        b=ZI+zYu1/N/yaD8UIqUFuuc/KvD2w+N9e2oAX5MWzc8avBZ7y7jSgh0LuwSMFF48uPO
         U65vePhIVrTxD10sPDAAOzkUaEPKsKcr4y0ifqW+XckOmzELBlrV8mRhbsO+YE4dnk/m
         XWcoMWxnJyoZ1FUWRCFbPS9yj2FUuCfRWcQxYB5ZxkVxr5zrnpXsjwqi6mbdE2s2TfWy
         HVVCSom/poDG8VMEn10OfsdmAqqVDPEi3ZcCrsg7FDNBrQjbCQWlUxwe1aXT+iVFsSAa
         Aqxp9Ea//SMWCMDJPqDs9YRM41F1IUTrv5Ub9JHRO1/nnkhNLMD3xC/EaN7VH0gXGowM
         Kf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=CxKKY7k8rX/dOVy4ACKHiKE1ylYBgSZ/45UFvCRr0mM=;
        b=u3l5jcCHAyHP2iA2BrVB1ChW7rYonMCc1dNBvzUPzuwLero9GuLMIOFi3LfiAfDuyN
         qgpV/zrRVb96kwLl9uGF0O1ymGScsJp7on5saOsuPjpWuuYabv7kQyrTDTsFfLxoHC8j
         wW+8TSnaeLYEHJ2JCgrTd+pWrr3vSa0NPuo+AwhzTGokUOypZw2BRQoRhwWJOxaQjCRo
         cHTRHoe19bE3/idSg/G8UhDnaZ5jppbAEsERAVsD5G1TCekcJ4e8e/uUI4akrXtwAZJG
         nemqexdQC4fetgmrk6z8rX7VbR0tyFNahmUSu2G18YIRAtdrelPTVa1FHFC5ORlHh0e5
         JVEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v72-v6si1857056qka.308.2018.07.10.09.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 09:10:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcvDV-0002oV-Qr
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 12:10:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcv3z-0003SN-Ih
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:00:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcv3x-0002Gl-U6
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:00:27 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fcv3x-0002Aw-KZ; Tue, 10 Jul 2018 12:00:25 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fcv3n-0001og-RB; Tue, 10 Jul 2018 17:00:15 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Jul 2018 17:00:08 +0100
Message-Id: <20180710160013.26559-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/6] accel/tcg: Pass read access type through to
 io_readx()
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
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bHCCk3dNpJGd

The io_readx() function needs to know whether the load it is
doing is an MMU_DATA_LOAD or an MMU_INST_FETCH, so that it
can pass the right value to the cpu_transaction_failed()
function. Plumb this information through from the softmmu
code.

This is currently not often going to give the wrong answer,
because usually instruction fetches go via get_page_addr_code().
However once we switch over to handling execution from non-RAM by
creating single-insn TBs, the path for an insn fetch to generate
a bus error will be through cpu_ld*_code() and io_readx(),
so without this change we will generate a d-side fault when we
should generate an i-side fault.

We also have to pass the access type via a CPU struct global
down to unassigned_mem_read(), for the benefit of the targets
which still use the cpu_unassigned_access() hook (m68k, mips,
sparc, xtensa).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/softmmu_template.h | 11 +++++++----
 include/qom/cpu.h            |  6 ++++++
 accel/tcg/cputlb.c           |  5 +++--
 memory.c                     |  3 ++-
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/softmmu_template.h b/accel/tcg/softmmu_template.h
index badbf148803..f060a693d41 100644
--- a/accel/tcg/softmmu_template.h
+++ b/accel/tcg/softmmu_template.h
@@ -99,11 +99,12 @@ static inline DATA_TYPE glue(io_read, SUFFIX)(CPUArchState *env,
                                               size_t mmu_idx, size_t index,
                                               target_ulong addr,
                                               uintptr_t retaddr,
-                                              bool recheck)
+                                              bool recheck,
+                                              MMUAccessType access_type)
 {
     CPUIOTLBEntry *iotlbentry = &env->iotlb[mmu_idx][index];
     return io_readx(env, iotlbentry, mmu_idx, addr, retaddr, recheck,
-                    DATA_SIZE);
+                    access_type, DATA_SIZE);
 }
 #endif
 
@@ -140,7 +141,8 @@ WORD_TYPE helper_le_ld_name(CPUArchState *env, target_ulong addr,
         /* ??? Note that the io helpers always read data in the target
            byte ordering.  We should push the LE/BE request down into io.  */
         res = glue(io_read, SUFFIX)(env, mmu_idx, index, addr, retaddr,
-                                    tlb_addr & TLB_RECHECK);
+                                    tlb_addr & TLB_RECHECK,
+                                    READ_ACCESS_TYPE);
         res = TGT_LE(res);
         return res;
     }
@@ -207,7 +209,8 @@ WORD_TYPE helper_be_ld_name(CPUArchState *env, target_ulong addr,
         /* ??? Note that the io helpers always read data in the target
            byte ordering.  We should push the LE/BE request down into io.  */
         res = glue(io_read, SUFFIX)(env, mmu_idx, index, addr, retaddr,
-                                    tlb_addr & TLB_RECHECK);
+                                    tlb_addr & TLB_RECHECK,
+                                    READ_ACCESS_TYPE);
         res = TGT_BE(res);
         return res;
     }
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index bd796579ee4..ecf6ed556a9 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -386,6 +386,12 @@ struct CPUState {
      */
     uintptr_t mem_io_pc;
     vaddr mem_io_vaddr;
+    /*
+     * This is only needed for the legacy cpu_unassigned_access() hook;
+     * when all targets using it have been converted to use
+     * cpu_transaction_failed() instead it can be removed.
+     */
+    MMUAccessType mem_io_access_type;
 
     int kvm_fd;
     struct KVMState *kvm_state;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 20c147d6554..c491703f15f 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -789,7 +789,7 @@ static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
 static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
                          int mmu_idx,
                          target_ulong addr, uintptr_t retaddr,
-                         bool recheck, int size)
+                         bool recheck, MMUAccessType access_type, int size)
 {
     CPUState *cpu = ENV_GET_CPU(env);
     hwaddr mr_offset;
@@ -831,6 +831,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     }
 
     cpu->mem_io_vaddr = addr;
+    cpu->mem_io_access_type = access_type;
 
     if (mr->global_locking && !qemu_mutex_iothread_locked()) {
         qemu_mutex_lock_iothread();
@@ -843,7 +844,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
             section->offset_within_address_space -
             section->offset_within_region;
 
-        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_LOAD,
+        cpu_transaction_failed(cpu, physaddr, addr, size, access_type,
                                mmu_idx, iotlbentry->attrs, r, retaddr);
     }
     if (locked) {
diff --git a/memory.c b/memory.c
index e9cd4469688..2ea16e7bfb0 100644
--- a/memory.c
+++ b/memory.c
@@ -1249,7 +1249,8 @@ static uint64_t unassigned_mem_read(void *opaque, hwaddr addr,
     printf("Unassigned mem read " TARGET_FMT_plx "\n", addr);
 #endif
     if (current_cpu != NULL) {
-        cpu_unassigned_access(current_cpu, addr, false, false, 0, size);
+        bool is_exec = current_cpu->mem_io_access_type == MMU_INST_FETCH;
+        cpu_unassigned_access(current_cpu, addr, false, is_exec, 0, size);
     }
     return 0;
 }
-- 
2.17.1

