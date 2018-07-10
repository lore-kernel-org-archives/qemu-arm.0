Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3757293wrq;
        Tue, 10 Jul 2018 09:25:14 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfRSC8ewZ0Mj00vFCag4cmtYLyqeo/tkMDT9dLsCvEM3oxbPIi0yPvY146moD3O60+EPjzz
X-Received: by 2002:a37:9444:: with SMTP id w65-v6mr22117687qkd.268.1531239914613;
        Tue, 10 Jul 2018 09:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531239914; cv=none;
        d=google.com; s=arc-20160816;
        b=HDeOyr67atu7d3S/c2iV42TM5MxIDg4g+kKMJexzWelbzBF5mPv7Hy2NjH/vkCDVqE
         cuzM3y6MCu5JFrgRtw4hJfs2fWmtOl0T1om0OLHJAiCEwL5jdFHl4uRw2CK3naAnCSo8
         nA/zbiOB3z38Ux3NosrLZFx4efXGA3dDgB6EdiY6s5ze8ldjGn5jz0TxInp2LHThHk5e
         /Rwo38K7UoBBERe8PtbgiEcU3R9XZ8hHV+5n955zYc5skgBP/aME4qa7W6xiL8gv2vqM
         Y6L84wjEchLOX14wDdVZRP7ABiQP1+s0EJ0a5uyDmLdy/hR141Rk7dCBMGvZEr5fmsof
         3y2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1VsL72s3i2h5MzsUfVBZAWn2SyPwxjyiJIbCxv9KcS0=;
        b=mJnjcgcqFvzNFYgKf59iWpqC65uVouD1drOCaLdWimNPYHwrB/JH/98Ai6PgfmRCbJ
         nJdQqe1rWkNN22m30QwB+T0Jd8/GulFLvMLOr0PDhszRWE6CFxNBZnoguZOzjvcTdEvz
         8ahocoB65i36mJQTnSaHSXySJCpBq4+ZJJJhI/eMWGuaFnEwt9040u9kmQh5cGM481kH
         6sLBWMUTxqj/csoR6QnwjvDKyANiGs39FmT1FGQ0eNhc7nKesVvNNkjAQ+GxtzFcdpsk
         WtPYK59DS+GJ93F3com8H8lgvq4EHEznxq8HLXgjAfPi2AhR2d6IxC5pTwKSpYtSyTUA
         oYuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q16-v6si4029415qtf.380.2018.07.10.09.25.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 09:25:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcvRy-0005U7-2V
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 12:25:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcvRe-0005Kz-U2
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:24:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcvRd-0006XN-NQ
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:24:54 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43454)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fcvRd-0006Tu-E1; Tue, 10 Jul 2018 12:24:53 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fcv3q-0001po-QQ; Tue, 10 Jul 2018 17:00:18 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Jul 2018 17:00:12 +0100
Message-Id: <20180710160013.26559-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/6] accel/tcg: Return -1 for execution from MMIO
 regions in get_page_addr_code()
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
X-TUID: XGVZtfMPXtO1

Now that all the callers can handle get_page_addr_code() returning -1,
remove all the code which tries to handle execution from MMIO regions
or small-MMU-region RAM areas. This will mean that we can correctly
execute from these areas, rather than ending up either aborting QEMU
or delivering an incorrect guest exception.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/cputlb.c | 95 +++++-----------------------------------------
 1 file changed, 10 insertions(+), 85 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index c491703f15f..abb0225dc79 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -741,39 +741,6 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
                             prot, mmu_idx, size);
 }
 
-static void report_bad_exec(CPUState *cpu, target_ulong addr)
-{
-    /* Accidentally executing outside RAM or ROM is quite common for
-     * several user-error situations, so report it in a way that
-     * makes it clear that this isn't a QEMU bug and provide suggestions
-     * about what a user could do to fix things.
-     */
-    error_report("Trying to execute code outside RAM or ROM at 0x"
-                 TARGET_FMT_lx, addr);
-    error_printf("This usually means one of the following happened:\n\n"
-                 "(1) You told QEMU to execute a kernel for the wrong machine "
-                 "type, and it crashed on startup (eg trying to run a "
-                 "raspberry pi kernel on a versatilepb QEMU machine)\n"
-                 "(2) You didn't give QEMU a kernel or BIOS filename at all, "
-                 "and QEMU executed a ROM full of no-op instructions until "
-                 "it fell off the end\n"
-                 "(3) Your guest kernel has a bug and crashed by jumping "
-                 "off into nowhere\n\n"
-                 "This is almost always one of the first two, so check your "
-                 "command line and that you are using the right type of kernel "
-                 "for this machine.\n"
-                 "If you think option (3) is likely then you can try debugging "
-                 "your guest with the -d debug options; in particular "
-                 "-d guest_errors will cause the log to include a dump of the "
-                 "guest register state at this point.\n\n"
-                 "Execution cannot continue; stopping here.\n\n");
-
-    /* Report also to the logs, with more detail including register dump */
-    qemu_log_mask(LOG_GUEST_ERROR, "qemu: fatal: Trying to execute code "
-                  "outside RAM or ROM at 0x" TARGET_FMT_lx "\n", addr);
-    log_cpu_state_mask(LOG_GUEST_ERROR, cpu, CPU_DUMP_FPU | CPU_DUMP_CCOP);
-}
-
 static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
 {
     ram_addr_t ram_addr;
@@ -963,7 +930,6 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
     MemoryRegionSection *section;
     CPUState *cpu = ENV_GET_CPU(env);
     CPUIOTLBEntry *iotlbentry;
-    hwaddr physaddr, mr_offset;
 
     index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
     mmu_idx = cpu_mmu_index(env, true);
@@ -977,65 +943,24 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
                   (TLB_RECHECK | TLB_INVALID_MASK)) == TLB_RECHECK)) {
         /*
          * This is a TLB_RECHECK access, where the MMU protection
-         * covers a smaller range than a target page, and we must
-         * repeat the MMU check here. This tlb_fill() call might
-         * longjump out if this access should cause a guest exception.
-         */
-        int index;
-        target_ulong tlb_addr;
-
-        tlb_fill(cpu, addr, 0, MMU_INST_FETCH, mmu_idx, 0);
-
-        index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
-        tlb_addr = env->tlb_table[mmu_idx][index].addr_code;
-        if (!(tlb_addr & ~(TARGET_PAGE_MASK | TLB_RECHECK))) {
-            /* RAM access. We can't handle this, so for now just stop */
-            cpu_abort(cpu, "Unable to handle guest executing from RAM within "
-                      "a small MPU region at 0x" TARGET_FMT_lx, addr);
-        }
-        /*
-         * Fall through to handle IO accesses (which will almost certainly
-         * also result in failure)
+         * covers a smaller range than a target page. Return -1 to
+         * indicate that we cannot simply execute from RAM here;
+         * we will perform the necessary repeat of the MMU check
+         * when the "execute a single insn" code performs the
+         * load of the guest insn.
          */
+        return -1;
     }
 
     iotlbentry = &env->iotlb[mmu_idx][index];
     section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
     mr = section->mr;
     if (memory_region_is_unassigned(mr)) {
-        qemu_mutex_lock_iothread();
-        if (memory_region_request_mmio_ptr(mr, addr)) {
-            qemu_mutex_unlock_iothread();
-            /* A MemoryRegion is potentially added so re-run the
-             * get_page_addr_code.
-             */
-            return get_page_addr_code(env, addr);
-        }
-        qemu_mutex_unlock_iothread();
-
-        /* Give the new-style cpu_transaction_failed() hook first chance
-         * to handle this.
-         * This is not the ideal place to detect and generate CPU
-         * exceptions for instruction fetch failure (for instance
-         * we don't know the length of the access that the CPU would
-         * use, and it would be better to go ahead and try the access
-         * and use the MemTXResult it produced). However it is the
-         * simplest place we have currently available for the check.
+        /*
+         * Not guest RAM, so there is no ram_addr_t for it. Return -1,
+         * and we will execute a single insn from this device.
          */
-        mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
-        physaddr = mr_offset +
-            section->offset_within_address_space -
-            section->offset_within_region;
-        cpu_transaction_failed(cpu, physaddr, addr, 0, MMU_INST_FETCH, mmu_idx,
-                               iotlbentry->attrs, MEMTX_DECODE_ERROR, 0);
-
-        cpu_unassigned_access(cpu, addr, false, true, 0, 4);
-        /* The CPU's unassigned access hook might have longjumped out
-         * with an exception. If it didn't (or there was no hook) then
-         * we can't proceed further.
-         */
-        report_bad_exec(cpu, addr);
-        exit(1);
+        return -1;
     }
     p = (void *)((uintptr_t)addr + env->tlb_table[mmu_idx][index].addend);
     return qemu_ram_addr_from_host_nofail(p);
-- 
2.17.1

