Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4974288lfb;
        Tue, 31 Aug 2021 05:17:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1Fk2zKpC/uBATxoLoYm62oLQxrZ7TTuOd2v76AIbL1D6ayZA/FYosyMiJITeZm6VdpmhO
X-Received: by 2002:a05:600c:1d29:: with SMTP id l41mr3879098wms.177.1630412243919;
        Tue, 31 Aug 2021 05:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412243; cv=none;
        d=google.com; s=arc-20160816;
        b=MFusHuwJpsA+fZdoS9MF0k3biz9CIig/20WtNyzj4+D7CPqCnI3Ta4j7wrm66tNllC
         bTmjo65Y2Vr6+E3qQpQkwWMksvgeJC16v7/idV01OD+6RcxUSGeHkRsesoZrPdz5F0VB
         inUcP1riTrRB9wIWyh4l/5j6Lh3t/RjW1tfMlrm4xIjwe22M5iXQA2V8Rki+MGOq1Xg4
         Fb/4n0O33K4evJY3rbJaJt/Z0U/XSLeUxs7mhxakqc1XRzAe23zViCwsuSpcsAyn2Y/V
         ROMiATScDD4TXJnSTlzsamkyYptgKbq9lcxrwJRgJ+4xKJVmHK4EXR/9XKEDg5G3b2HD
         do2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WVJXkv7PnGVo+pfS2DbdHeSNClsu8AfddP/bwIs4fak=;
        b=fCvZnlfkLNHX5Wng9L3hx5/VBVW2qIm/3XWAhBkkUdyBPQC2vcRYPx/8QysmEfNcUf
         FHULdTiRw1t61mTw8mOk7zfumYoZzArXGJ9vFd1O3sUSgczRVQwgwdps6bxJSKPRRpch
         wWPIGSxvlExhiiGIZxBrqpWcEDG3sMARzB6GodyPfbx41An346WMXjEpSfSj/w+Fi2zC
         yRdz/5kP21ygIhO5ZfWl3RpL84CD677fcTPZZCiGSaP/VbXfYlQpFqRk4bku1Mzvo4+O
         B0axOlYWe27M+Zjqil4qLfHefiLuFNEHlcny4tEOnUX5WyQpIBiIicfgLur492OGryzC
         zSeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BhBeqOrg;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id r21si17669393edy.434.2021.08.31.05.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:17:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BhBeqOrg;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WVJXkv7PnGVo+pfS2DbdHeSNClsu8AfddP/bwIs4fak=;
	b=BhBeqOrgSRlUOgwAvv9lwKk+RDVlD9OXw4V/ZiCLWXnn/LVbbSE9rsPeLushPBeMmAD8XJ
	w+ghtmFgy0WO07+nIDb9sh9keslSyksjoWk8p+0Lsh6jqFkCzo0Ykzawb6JmGnoQWHDjOu
	hs6+DouAGO1n9a8rNfA1uRVQKR3u+RU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-4GzA-E_ENkmnKBhoiJux7A-1; Tue, 31 Aug 2021 08:17:21 -0400
X-MC-Unique: 4GzA-E_ENkmnKBhoiJux7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF9F518A0F33;
	Tue, 31 Aug 2021 12:17:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93FAA5C1A1;
	Tue, 31 Aug 2021 12:17:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id AB5831800994; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	qemu-ppc@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-riscv@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stafford Horne <shorne@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Greg Kurz <groug@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-s390x@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 10/29] tcg_funcs: Add tlb_flush to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:26 +0200
Message-Id: <20210831121545.2874233-11-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: Zz6tGw7+LcET

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h       |  4 +---
 include/tcg/tcg-module.h      |  1 +
 accel/tcg/cpu-exec-common.c   |  8 ++++++++
 accel/tcg/cputlb.c            |  7 +++++++
 accel/tcg/tcg-module.c        |  5 +++++
 accel/tcg/translate-all.c     |  8 --------
 cpu.c                         |  2 +-
 softmmu/physmem.c             |  6 +++---
 target/arm/helper.c           | 22 +++++++++++-----------
 target/i386/helper.c          |  8 ++++----
 target/i386/machine.c         |  2 +-
 target/i386/tcg/fpu_helper.c  |  2 +-
 target/i386/tcg/misc_helper.c |  2 +-
 target/mips/sysemu/cp0.c      |  2 +-
 target/s390x/gdbstub.c        |  2 +-
 target/s390x/sigp.c           |  2 +-
 16 files changed, 47 insertions(+), 36 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 5d1b6d80fbd3..ddb1ab797978 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #endif
 #include "sysemu/cpu-timers.h"
+#include "tcg/tcg-module.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
 #define DEBUG_DISAS
@@ -337,9 +338,6 @@ static inline void tlb_flush_page_all_cpus_synced(CPUState *src,
                                                   target_ulong addr)
 {
 }
-static inline void tlb_flush(CPUState *cpu)
-{
-}
 static inline void tlb_flush_all_cpus(CPUState *src_cpu)
 {
 }
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index 7e87aecb2357..b94bfdd362ed 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -2,6 +2,7 @@
 #define TCG_MODULE_H
 
 struct TCGModuleOps {
+    void (*tlb_flush)(CPUState *cpu);
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index be6fe45aa5a8..777ad00befc8 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -81,3 +81,11 @@ void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
     cpu->exception_index = EXCP_ATOMIC;
     cpu_loop_exit_restore(cpu, pc);
 }
+
+/* This is a wrapper for common code that can not use CONFIG_SOFTMMU */
+void tcg_flush_softmmu_tlb(CPUState *cs)
+{
+#ifdef CONFIG_SOFTMMU
+    tcg.tlb_flush(cs);
+#endif
+}
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b1e5471f949f..40c3d1b65ac5 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2767,3 +2767,10 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
     TCGMemOpIdx oi = make_memop_idx(MO_TEQ, cpu_mmu_index(env, true));
     return full_ldq_code(env, addr, oi, 0);
 }
+
+static void tcg_module_ops_tlb(void)
+{
+    tcg.tlb_flush = tlb_flush;
+}
+
+type_init(tcg_module_ops_tlb);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index e864fb20c141..a1e5728c8c1b 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -1,5 +1,10 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg-module.h"
 
+static void update_cpu_stub(CPUState *cpu)
+{
+}
+
 struct TCGModuleOps tcg = {
+    .tlb_flush = update_cpu_stub,
 };
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bbfcfb698c07..c7547cd923b4 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2463,11 +2463,3 @@ int page_unprotect(target_ulong address, uintptr_t pc)
     return 0;
 }
 #endif /* CONFIG_USER_ONLY */
-
-/* This is a wrapper for common code that can not use CONFIG_SOFTMMU */
-void tcg_flush_softmmu_tlb(CPUState *cs)
-{
-#ifdef CONFIG_SOFTMMU
-    tlb_flush(cs);
-#endif
-}
diff --git a/cpu.c b/cpu.c
index e1799a15bcf5..26277f387baf 100644
--- a/cpu.c
+++ b/cpu.c
@@ -51,7 +51,7 @@ static int cpu_common_post_load(void *opaque, int version_id)
     /* 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
        version_id is increased. */
     cpu->interrupt_request &= ~0x01;
-    tlb_flush(cpu);
+    tcg.tlb_flush(cpu);
 
     /* loadvm has just updated the content of RAM, bypassing the
      * usual mechanisms that ensure we flush TBs for writes to
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 23e77cb77153..dd17f80120dc 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -589,7 +589,7 @@ static void tcg_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     if (!notifier->active) {
         return;
     }
-    tlb_flush(notifier->cpu);
+    tcg.tlb_flush(notifier->cpu);
     notifier->active = false;
     /* We leave the notifier struct on the list to avoid reallocating it later.
      * Generally the number of IOMMUs a CPU deals with will be small.
@@ -796,7 +796,7 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
     if (len <= in_page) {
         tlb_flush_page(cpu, addr);
     } else {
-        tlb_flush(cpu);
+        tcg.tlb_flush(cpu);
     }
 
     if (watchpoint)
@@ -2654,7 +2654,7 @@ static void tcg_commit(MemoryListener *listener)
      */
     d = address_space_to_dispatch(cpuas->as);
     qatomic_rcu_set(&cpuas->memory_dispatch, d);
-    tlb_flush(cpuas->cpu);
+    tcg.tlb_flush(cpuas->cpu);
 }
 
 static void memory_map_init(void)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a7ae78146d4b..0da65edd78cd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -674,7 +674,7 @@ static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     ARMCPU *cpu = env_archcpu(env);
 
     raw_write(env, ri, value);
-    tlb_flush(CPU(cpu)); /* Flush TLB as domain not tracked in TLB */
+    tcg.tlb_flush(CPU(cpu)); /* Flush TLB as domain not tracked in TLB */
 }
 
 static void fcse_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
@@ -685,7 +685,7 @@ static void fcse_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         /* Unlike real hardware the qemu TLB uses virtual addresses,
          * not modified virtual addresses, so this causes a TLB flush.
          */
-        tlb_flush(CPU(cpu));
+        tcg.tlb_flush(CPU(cpu));
         raw_write(env, ri, value);
     }
 }
@@ -701,7 +701,7 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
          * format) this register includes the ASID, so do a TLB flush.
          * For PMSA it is purely a process ID and no action is needed.
          */
-        tlb_flush(CPU(cpu));
+        tcg.tlb_flush(CPU(cpu));
     }
     raw_write(env, ri, value);
 }
@@ -758,7 +758,7 @@ static void tlbiall_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (tlb_force_broadcast(env)) {
         tlb_flush_all_cpus_synced(cs);
     } else {
-        tlb_flush(cs);
+        tcg.tlb_flush(cs);
     }
 }
 
@@ -785,7 +785,7 @@ static void tlbiasid_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (tlb_force_broadcast(env)) {
         tlb_flush_all_cpus_synced(cs);
     } else {
-        tlb_flush(cs);
+        tcg.tlb_flush(cs);
     }
 }
 
@@ -3840,7 +3840,7 @@ static void pmsav7_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 
     u32p += env->pmsav7.rnr[M_REG_NS];
-    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+    tcg.tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
     *u32p = value;
 }
 
@@ -3982,7 +3982,7 @@ static void vmsa_ttbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         /* With LPAE the TTBCR could result in a change of ASID
          * via the TTBCR.A1 bit, so do a TLB flush.
          */
-        tlb_flush(CPU(cpu));
+        tcg.tlb_flush(CPU(cpu));
     }
     /* Preserve the high half of TCR_EL1, set via TTBCR2.  */
     value = deposit64(tcr->raw_tcr, 0, 32, value);
@@ -4008,7 +4008,7 @@ static void vmsa_tcr_el12_write(CPUARMState *env, const ARMCPRegInfo *ri,
     TCR *tcr = raw_ptr(env, ri);
 
     /* For AArch64 the A1 bit could result in a change of ASID, so TLB flush. */
-    tlb_flush(CPU(cpu));
+    tcg.tlb_flush(CPU(cpu));
     tcr->raw_tcr = value;
 }
 
@@ -4019,7 +4019,7 @@ static void vmsa_ttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (cpreg_field_is_64bit(ri) &&
         extract64(raw_read(env, ri) ^ value, 48, 16) != 0) {
         ARMCPU *cpu = env_archcpu(env);
-        tlb_flush(CPU(cpu));
+        tcg.tlb_flush(CPU(cpu));
     }
     raw_write(env, ri, value);
 }
@@ -5035,7 +5035,7 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 
     /* This may enable/disable the MMU, so do a TLB flush.  */
-    tlb_flush(CPU(cpu));
+    tcg.tlb_flush(CPU(cpu));
 
     if (ri->type & ARM_CP_SUPPRESS_TB_END) {
         /*
@@ -5574,7 +5574,7 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
      * HCR_DCT enables tagging on (disabled) stage1 translation
      */
     if ((env->cp15.hcr_el2 ^ value) & (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT)) {
-        tlb_flush(CPU(cpu));
+        tcg.tlb_flush(CPU(cpu));
     }
     env->cp15.hcr_el2 = value;
 
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 533b29cb91b6..100add713c5d 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -103,7 +103,7 @@ void x86_cpu_set_a20(X86CPU *cpu, int a20_state)
 
         /* when a20 is changed, all the MMU mappings are invalid, so
            we must flush everything */
-        tlb_flush(cs);
+        tcg.tlb_flush(cs);
         env->a20_mask = ~(1 << 20) | (a20_state << 20);
     }
 }
@@ -116,7 +116,7 @@ void cpu_x86_update_cr0(CPUX86State *env, uint32_t new_cr0)
     qemu_log_mask(CPU_LOG_MMU, "CR0 update: CR0=0x%08x\n", new_cr0);
     if ((new_cr0 & (CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK)) !=
         (env->cr[0] & (CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK))) {
-        tlb_flush(CPU(cpu));
+        tcg.tlb_flush(CPU(cpu));
     }
 
 #ifdef TARGET_X86_64
@@ -156,7 +156,7 @@ void cpu_x86_update_cr3(CPUX86State *env, target_ulong new_cr3)
     if (env->cr[0] & CR0_PG_MASK) {
         qemu_log_mask(CPU_LOG_MMU,
                         "CR3 update: CR3=" TARGET_FMT_lx "\n", new_cr3);
-        tlb_flush(env_cpu(env));
+        tcg.tlb_flush(env_cpu(env));
     }
 }
 
@@ -170,7 +170,7 @@ void cpu_x86_update_cr4(CPUX86State *env, uint32_t new_cr4)
     if ((new_cr4 ^ env->cr[4]) &
         (CR4_PGE_MASK | CR4_PAE_MASK | CR4_PSE_MASK |
          CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_LA57_MASK)) {
-        tlb_flush(env_cpu(env));
+        tcg.tlb_flush(env_cpu(env));
     }
 
     /* Clear bits we're going to recompute.  */
diff --git a/target/i386/machine.c b/target/i386/machine.c
index f6f094f1c938..571e98853c64 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -383,7 +383,7 @@ static int cpu_post_load(void *opaque, int version_id)
         env->dr[7] = dr7 & ~(DR7_GLOBAL_BP_MASK | DR7_LOCAL_BP_MASK);
         cpu_x86_update_dr7(env, dr7);
     }
-    tlb_flush(cs);
+    tcg.tlb_flush(cs);
     return 0;
 }
 
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index cdd8e9f9471f..eddf0bb9dfc4 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2874,7 +2874,7 @@ void helper_xrstor(CPUX86State *env, target_ulong ptr, uint64_t rfbm)
         }
         if (env->pkru != old_pkru) {
             CPUState *cs = env_cpu(env);
-            tlb_flush(cs);
+            tcg.tlb_flush(cs);
         }
     }
 }
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index baffa5d7ba9a..dc974dad6acc 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -142,5 +142,5 @@ void helper_wrpkru(CPUX86State *env, uint32_t ecx, uint64_t val)
     }
 
     env->pkru = val;
-    tlb_flush(cs);
+    tcg.tlb_flush(cs);
 }
diff --git a/target/mips/sysemu/cp0.c b/target/mips/sysemu/cp0.c
index bae37f515bf8..f966991c7cc9 100644
--- a/target/mips/sysemu/cp0.c
+++ b/target/mips/sysemu/cp0.c
@@ -81,7 +81,7 @@ void cpu_mips_store_status(CPUMIPSState *env, target_ulong val)
 #if defined(TARGET_MIPS64)
     if ((env->CP0_Status ^ old) & (old & (7 << CP0St_UX))) {
         /* Access to at least one of the 64-bit segments has been disabled */
-        tlb_flush(env_cpu(env));
+        tcg.tlb_flush(env_cpu(env));
     }
 #endif
     if (ase_mt_available(env)) {
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index a5d69d0e0bc5..b60bdc1fbded 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -191,7 +191,7 @@ static int cpu_write_c_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
     case S390_C0_REGNUM ... S390_C15_REGNUM:
         env->cregs[n] = ldtul_p(mem_buf);
         if (tcg_enabled()) {
-            tlb_flush(env_cpu(env));
+            tcg.tlb_flush(env_cpu(env));
         }
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index d57427ced84d..d2c0b877cee4 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -294,7 +294,7 @@ static void sigp_set_prefix(CPUState *cs, run_on_cpu_data arg)
     }
 
     cpu->env.psa = addr;
-    tlb_flush(cs);
+    tcg.tlb_flush(cs);
     cpu_synchronize_post_init(cs);
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
 }
-- 
2.31.1
