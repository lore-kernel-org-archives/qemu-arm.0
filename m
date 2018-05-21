Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311143wme;
        Mon, 21 May 2018 07:04:08 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoJ9SAn5cSqnZQmOdLk7fy/JdLgeASWR0gjORNMxaq1fdJm7pySUCmjs65x47hZAr9fcpJi
X-Received: by 2002:a2e:88d7:: with SMTP id a23-v6mr12560929ljk.117.1526911448360;
        Mon, 21 May 2018 07:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911448; cv=none;
        d=google.com; s=arc-20160816;
        b=lCIerKy+L4adAc8y/UJeRFAHtCc4uoDt7RSAgKy6JL0m01sWkD5f8hGCqSnnZdV0af
         tbo1I8gDBt/UesPkdLgyzCb2e1exjQpR6dM3+p5owRcutqJAe1caBKNaKpcSuMAhxfMX
         eVDd+5UZcBq/+Se1RpTgpl2GLRFSQtFJTKk8plWLGQ3X6EBXrQ6G1afQvQRpFdFRoUHG
         rtLADRAoC2Wvr3P9K2toL2dz40c79qA7PCe+ySrzU5UInSLtj4o6CBMKByGil6m8du5D
         D3QkyyyEqQV+EWDi62XdWWVyRW2+pLXuPCvXFGN4uVekOJERIcG9MRlon9eTO61XBt57
         GINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=M0O8wDSdxS7N00zy1N3pbDjulAg7dSzHTq2p7ColeQk=;
        b=C6arHUu6VPRNLkjPTYwT/EbhoccP9UQ/JwvpMK44X9LgUQZ8ZLhA3bmoJu7V9LQA4j
         nQ3YJvt/e4fgF3NkpAjtR/SHtw1tLLcZRdLmfAqLauCy3mCmIO+4+37qh8XeAPCe+eft
         ZOgxV5Lrf/1QQ7HOcFdkLsZtuSZsJz7VW0qu8I3htvljqL2BvFW3CVwnn+TgxRmwdlSv
         xILEkc7DiF5hjFTB7516q15G942tgTwrsfY/P2kE6Ohw1uLgxQPgMbgnDZ1X1Zza7jyO
         L1+A8hoUKoVRh75qjH9IXF6kdPcoGI+xLK1/rsAmf+kzs+D1rlVvqRsOXEQP01valSm+
         dGYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id b202-v6si5877971lfg.145.2018.05.21.07.04.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:08 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlPw-0007dP-Ov; Mon, 21 May 2018 15:04:04 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 02/27] Make tb_invalidate_phys_addr() take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:37 +0100
Message-Id: <20180521140402.23318-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: 6oT9FlEUJjdQ

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to tb_invalidate_phys_addr().
Its callers either have an attrs value to hand, or don't care
and can use MEMTXATTRS_UNSPECIFIED.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/exec-all.h   | 5 +++--
 accel/tcg/translate-all.c | 2 +-
 exec.c                    | 2 +-
 target/xtensa/op_helper.c | 3 ++-
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index bd68328ed9..4d09eaba72 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -255,7 +255,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
 void tlb_set_page(CPUState *cpu, target_ulong vaddr,
                   hwaddr paddr, int prot,
                   int mmu_idx, target_ulong size);
-void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr);
+void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 void probe_write(CPUArchState *env, target_ulong addr, int size, int mmu_idx,
                  uintptr_t retaddr);
 #else
@@ -303,7 +303,8 @@ static inline void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                        uint16_t idxmap)
 {
 }
-static inline void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr)
+static inline void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr,
+                                           MemTxAttrs attrs)
 {
 }
 #endif
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f409d42d54..f04a922ef7 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1672,7 +1672,7 @@ static TranslationBlock *tb_find_pc(uintptr_t tc_ptr)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr)
+void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
 {
     ram_addr_t ram_addr;
     MemoryRegion *mr;
diff --git a/exec.c b/exec.c
index ffa1099547..c3a197e67b 100644
--- a/exec.c
+++ b/exec.c
@@ -898,7 +898,7 @@ static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
     if (phys != -1) {
         /* Locks grabbed by tb_invalidate_phys_addr */
         tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
-                                phys | (pc & ~TARGET_PAGE_MASK));
+                                phys | (pc & ~TARGET_PAGE_MASK), attrs);
     }
 }
 #endif
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index e3bcbe10d6..8a8c763c63 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -105,7 +105,8 @@ static void tb_invalidate_virtual_addr(CPUXtensaState *env, uint32_t vaddr)
     int ret = xtensa_get_physical_addr(env, false, vaddr, 2, 0,
             &paddr, &page_size, &access);
     if (ret == 0) {
-        tb_invalidate_phys_addr(&address_space_memory, paddr);
+        tb_invalidate_phys_addr(&address_space_memory, paddr,
+                                MEMTXATTRS_UNSPECIFIED);
     }
 }
 
-- 
2.17.0
