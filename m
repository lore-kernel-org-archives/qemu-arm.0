Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026618lfb;
        Sat, 9 May 2020 06:09:42 -0700 (PDT)
X-Received: by 2002:a1c:7f4e:: with SMTP id a75mr21365929wmd.178.1589029781944;
        Sat, 09 May 2020 06:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029781; cv=none;
        d=google.com; s=arc-20160816;
        b=DdxgQ2yeFJn9o0LgTkA53oBKnsF7X+7cJR1OxFuPfdg7mw+f+6cYCZQcVpocdshiyv
         OdqNqcrJHvV5g7lqWTrGeSp+I68rd+ou2T/Igm3MDPgl+xIkq8qD8HNI3e3uXy4LDQ+5
         gS8Oe7YNtq49JfIv0WlyL4XEsEfOLLWntU4C1e/urF4UiZDmiePMqX7T8m+TuM4cWmsM
         cPYfXNFNE3jg3NvMp/7ax68CGByvUev5CTd8X/dYG3fEnrDCn3DCIUjzUUCC6lJJqoD9
         DnaXlCJRLqocAH5SkrN5mF4MufLVB2xeAXV0pOhwT6PJZM2B8z24iv2i2LInpA4Detns
         VJEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KCkyANn4FcnR5rJJUijQsegjOxElV+OnO2NwpohvbPI=;
        b=OVw3+K1l9GZLxhMVE7znHkESQZsGneBQRmydHPVBS8kO05Pxm93enINlaHGmjJ7oig
         EEMfdzq0aSGFbDH7qETCbWQdU4Mqb65tQowZRlpJwty6dercZCISEVo4tauynskXMAdk
         MTBQtklZrQFUeDO5MEOlASyJdQ2qiKNiVXA67bgwpQ9S37kVpAjgrpzCU3ukNbzcXQaP
         DsFWCqcd+ATrAQG+Tl2bc10hE8nrL/Fdv2biT3CB5vg9/eQj6ZtGZXjDXGKaxBENKpnD
         fo9bz7fh9jrMWxDUnDqt4NRiSbRR/TL1cWz6aIAZ5zEdAXCMqmmmH6c9qs0W5ymkdrCM
         gZAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="jDO/4+L2";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p8sor2863843wrq.35.2020.05.09.06.09.41
        (Google Transport Security);
        Sat, 09 May 2020 06:09:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="jDO/4+L2";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KCkyANn4FcnR5rJJUijQsegjOxElV+OnO2NwpohvbPI=;
        b=jDO/4+L2um5973o9LQ8Qntt5S4jpI0mKVBqOSsR7qXSd31oCrA+GubxLPSBjbUzagt
         brWe5+I2jWCoTMNYziZLAzTr67zfdJw1N4+ldwUBMcV5A9TGOROXaNpeZaOin+wWTS82
         4ygZbZRY8BLXpBHl58G9nUmjP5z/pXU739KrGWirFUUIXjnHvMinNPwhW4zFpqthMIj3
         P/pPsAzXLN1fecuVYB0ndnfvz2gh3M29QXtOy0JN9d8MyDaOum1Tp43u9m/ze+8pxlBY
         vzh16q4jHKyaJnUZJ1Gd7vux4WW+ZcQvulz7CCLnTrvcZASrX3Zn1tGhtMbfiqOocppP
         TQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=KCkyANn4FcnR5rJJUijQsegjOxElV+OnO2NwpohvbPI=;
        b=BOyjYuYPKya3+bSadR4KHEPSL394hrOjicEAzBzh0woU4XXb3092CYb9j1E0qyX8hy
         tBB4OR2Ec/zm/dutmCpMqFuYbkXCzP7FzbQxNzlR/WbEz194GjBqcLJfqT3VApAwsovz
         Kd58v7/PWKjEgzK5+bL9G6MxIutg6rSuGfmfpc0N+K/T4paPVE1BkCup281+GAPawE+k
         gk5/am/1SgZ0jLQHVGg9YwdL1Aqn99pHK752t77nIxuB701pT5HQt4bNothyitehhDHe
         neAuVlDaBiawLxMVUo01daFG/3rRCsr7L6oPoQiGSXSB5MRtIlj+zquLJsvmGq91R/oK
         LVTA==
X-Gm-Message-State: AGi0PubWaYKm3T47Jpvti5XxIrSip0xkSyh0XCkSTH9dOLde/fBeUk0P
	waFUYa8m33SuvsTRYnvKZJg=
X-Google-Smtp-Source: APiQypKTCzVWz4OtBkfMURyuhxOjXVPsQ8QTteSNFY+TQN3SepDpNDqC9FUtqNgzwnqJEPuvgZkE4Q==
X-Received: by 2002:a5d:6082:: with SMTP id w2mr8284190wrt.163.1589029781390;
        Sat, 09 May 2020 06:09:41 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Marek Vasut <marex@denx.de>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 09/11] target/cpu: Restrict handlers using hwaddr type to system-mode
Date: Sat,  9 May 2020 15:09:08 +0200
Message-Id: <20200509130910.26335-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: nKFQZrVk+RaM

Restrict the following handlers to system-mode:
- do_unaligned_access
- do_transaction_failed
- get_phys_page_debug
- get_phys_page_attrs_debug

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h           |  8 +++++---
 target/alpha/cpu.h              |  4 +++-
 target/arm/cpu.h                |  6 +++---
 target/arm/internals.h          |  4 ++++
 target/cris/cpu.h               |  2 ++
 target/hppa/cpu.h               |  2 +-
 target/i386/cpu.h               |  2 ++
 target/m68k/cpu.h               |  7 ++++++-
 target/microblaze/cpu.h         |  5 ++++-
 target/mips/internal.h          |  2 +-
 target/nios2/cpu.h              |  5 ++++-
 target/openrisc/cpu.h           |  3 ++-
 target/ppc/cpu.h                |  2 +-
 target/riscv/cpu.h              | 20 ++++++++++----------
 target/sh4/cpu.h                |  2 +-
 target/sparc/cpu.h              |  2 ++
 target/xtensa/cpu.h             | 12 +++++++-----
 target/hppa/cpu.c               |  4 +++-
 target/ppc/translate_init.inc.c |  2 +-
 19 files changed, 62 insertions(+), 32 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5bf94d28cf..ed09d056d1 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -167,6 +167,7 @@ typedef struct CPUClass {
     int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
     void (*do_interrupt)(CPUState *cpu);
+#ifndef CONFIG_USER_ONLY
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
@@ -174,6 +175,10 @@ typedef struct CPUClass {
                                   unsigned size, MMUAccessType access_type,
                                   int mmu_idx, MemTxAttrs attrs,
                                   MemTxResult response, uintptr_t retaddr);
+    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
+    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
+                                        MemTxAttrs *attrs);
+#endif /* CONFIG_USER_ONLY */
     bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
@@ -189,9 +194,6 @@ typedef struct CPUClass {
     bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr);
-    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
-    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
-                                        MemTxAttrs *attrs);
     int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index be29bdd530..b12021803e 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -279,12 +279,14 @@ extern const VMStateDescription vmstate_alpha_cpu;
 void alpha_cpu_do_interrupt(CPUState *cpu);
 bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
-hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+#ifndef CONFIG_USER_ONLY
+hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                    MMUAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr);
+#endif
 
 #define cpu_list alpha_cpu_list
 #define cpu_signal_handler cpu_alpha_signal_handler
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8608da6b6f..d333036bb4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -966,15 +966,15 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_arm_cpu;
+
+hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                         MemTxAttrs *attrs);
 #endif
 
 void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
 bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
 
-hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
-                                         MemTxAttrs *attrs);
-
 int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index e633aff36e..c0a2a5df71 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -812,6 +812,8 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
  * tables */
 bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
 
+#ifndef CONFIG_USER_ONLY
+
 /* Raise a data fault alignment exception for the specified virtual address */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
@@ -827,6 +829,8 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                    int mmu_idx, MemTxAttrs attrs,
                                    MemTxResult response, uintptr_t retaddr);
 
+#endif /* !CONFIG_USER_ONLY */
+
 /* Call any registered EL change hooks */
 static inline void arm_call_pre_el_change_hook(ARMCPU *cpu)
 {
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 8f08d7628b..e9c858ada7 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -193,7 +193,9 @@ bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
 
 void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
+#ifndef CONFIG_USER_ONLY
 hwaddr cris_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+#endif
 
 int crisv10_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int cris_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 801a4fb1ba..7848425f6a 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -320,7 +320,6 @@ void cpu_hppa_change_prot_id(CPUHPPAState *env);
 #define cpu_signal_handler cpu_hppa_signal_handler
 
 int cpu_hppa_signal_handler(int host_signum, void *pinfo, void *puc);
-hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void hppa_cpu_do_interrupt(CPUState *cpu);
@@ -330,6 +329,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 #ifndef CONFIG_USER_ONLY
+hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
                               int type, hwaddr *pphys, int *pprot);
 extern const MemoryRegionOps hppa_io_eir_ops;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e818fc712a..00e0cc0828 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1767,8 +1767,10 @@ void x86_cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 
 void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
+#ifndef CONFIG_USER_ONLY
 hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
+#endif
 
 int x86_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int x86_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 521ac67cdd..efc940e7ec 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -167,10 +167,13 @@ struct M68kCPU {
 void m68k_cpu_do_interrupt(CPUState *cpu);
 bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void m68k_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
+#ifndef CONFIG_USER_ONLY
+hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+#endif
+
 void m68k_tcg_init(void);
 void m68k_cpu_init_gdb(M68kCPU *cpu);
 /*
@@ -529,10 +532,12 @@ static inline int cpu_mmu_index (CPUM68KState *env, bool ifetch)
 bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+#ifndef CONFIG_USER_ONLY
 void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                  unsigned size, MMUAccessType access_type,
                                  int mmu_idx, MemTxAttrs attrs,
                                  MemTxResult response, uintptr_t retaddr);
+#endif
 
 typedef CPUM68KState CPUArchState;
 typedef M68kCPU ArchCPU;
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index a31134b65c..eb57f04d3f 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -318,10 +318,13 @@ struct MicroBlazeCPU {
 void mb_cpu_do_interrupt(CPUState *cs);
 bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
 void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr mb_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
+#ifndef CONFIG_USER_ONLY
+hwaddr mb_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+#endif
+
 void mb_tcg_init(void);
 /* you can call this signal handler from your SIGBUS and SIGSEGV
    signal handlers to inform the virtual CPU of exceptions. non zero
diff --git a/target/mips/internal.h b/target/mips/internal.h
index 1bf274b3ef..c38666c6f5 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -81,7 +81,6 @@ enum CPUMIPSMSADataFormat {
 void mips_cpu_do_interrupt(CPUState *cpu);
 bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void mips_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int mips_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
@@ -150,6 +149,7 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     MemTxResult response, uintptr_t retaddr);
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
                                   int rw);
+hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif
 
 #define cpu_signal_handler cpu_mips_signal_handler
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 4dddf9c3a1..0703295133 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -199,11 +199,14 @@ void nios2_cpu_do_interrupt(CPUState *cs);
 int cpu_nios2_signal_handler(int host_signum, void *pinfo, void *puc);
 void dump_mmu(CPUNios2State *env);
 void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                    MMUAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr);
 
+#ifndef CONFIG_USER_ONLY
+hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+#endif
+
 qemu_irq *nios2_cpu_pic_init(Nios2CPU *cpu);
 void nios2_check_interrupts(CPUNios2State *env);
 
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index f37a52e153..60de8ed787 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -319,7 +319,6 @@ void cpu_openrisc_list(void);
 void openrisc_cpu_do_interrupt(CPUState *cpu);
 bool openrisc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void openrisc_translate_init(void);
@@ -335,6 +334,8 @@ int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_openrisc_cpu;
 
+hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+
 /* hw/openrisc_pic.c */
 void cpu_openrisc_pic_init(OpenRISCCPU *cpu);
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 73920a9cac..f7b27aefed 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1209,12 +1209,12 @@ void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void ppc_cpu_dump_statistics(CPUState *cpu, int flags);
-hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int reg);
 int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
+hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0e7f5b9c5..69edee6484 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -303,18 +303,9 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
 void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
-hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                    MMUAccessType access_type, int mmu_idx,
-                                    uintptr_t retaddr);
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
-void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-                                     vaddr addr, unsigned size,
-                                     MMUAccessType access_type,
-                                     int mmu_idx, MemTxAttrs attrs,
-                                     MemTxResult response, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
 
@@ -323,12 +314,21 @@ void riscv_cpu_list(void);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                    MMUAccessType access_type, int mmu_idx,
+                                    uintptr_t retaddr);
+void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                     vaddr addr, unsigned size,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, MemTxAttrs attrs,
+                                     MemTxResult response, uintptr_t retaddr);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void));
-#endif
+#endif /* !CONFIG_USER_ONLY */
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
 void riscv_translate_init(void);
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index dbe58c7888..40d92413b8 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -207,7 +207,6 @@ struct SuperHCPU {
 void superh_cpu_do_interrupt(CPUState *cpu);
 bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
@@ -223,6 +222,7 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 void sh4_cpu_list(void);
 #if !defined(CONFIG_USER_ONLY)
+hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void cpu_sh4_invalidate_tlb(CPUSH4State *s);
 uint32_t cpu_sh4_read_mmaped_itlb_addr(CPUSH4State *s,
                                        hwaddr addr);
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index b9369398f2..31887a811a 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -570,7 +570,9 @@ extern const VMStateDescription vmstate_sparc_cpu;
 
 void sparc_cpu_do_interrupt(CPUState *cpu);
 void sparc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+#ifndef CONFIG_USER_ONLY
 hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+#endif
 int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 7a46dccbe1..47fe57df87 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -564,19 +564,21 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          bool probe, uintptr_t retaddr);
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
-void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
-                                      unsigned size, MMUAccessType access_type,
-                                      int mmu_idx, MemTxAttrs attrs,
-                                      MemTxResult response, uintptr_t retaddr);
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
                        unsigned *n_regs, unsigned *n_core_regs);
 int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+#ifndef CONFIG_USER_ONLY
+hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
+                                      unsigned size, MMUAccessType access_type,
+                                      int mmu_idx, MemTxAttrs attrs,
+                                      MemTxResult response, uintptr_t retaddr);
 void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                     MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr);
+#endif /* !CONFIG_USER_ONLY */
 
 #define cpu_signal_handler cpu_xtensa_signal_handler
 #define cpu_list xtensa_cpu_list
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 71b6aca45d..6d33288d2a 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -70,6 +70,7 @@ static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
     info->print_insn = print_insn_hppa;
 }
 
+#ifndef CONFIG_USER_ONLY
 static void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                          MMUAccessType access_type,
                                          int mmu_idx, uintptr_t retaddr)
@@ -86,6 +87,7 @@ static void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 
     cpu_loop_exit_restore(cs, retaddr);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
 {
@@ -150,8 +152,8 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_hppa_cpu;
-#endif
     cc->do_unaligned_access = hppa_cpu_do_unaligned_access;
+#endif
     cc->disas_set_info = hppa_cpu_disas_set_info;
     cc->tcg_initialize = hppa_translate_init;
 
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
index 4ea0cc501b..8c428e2009 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -10892,8 +10892,8 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = ppc_cpu_set_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
-    cc->do_unaligned_access = ppc_cpu_do_unaligned_access;
 #ifndef CONFIG_USER_ONLY
+    cc->do_unaligned_access = ppc_cpu_do_unaligned_access;
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_ppc_cpu;
 #endif
-- 
2.21.3
