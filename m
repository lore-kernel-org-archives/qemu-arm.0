Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp242832ejc;
        Wed, 12 Jun 2024 01:17:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/++Z2H4VRdJAVNLGkaj1QwHpWTtMkkCr3LrtMlffvdhjknjFSghk4bxsVjIGtkWMmZrMMSxHthH4TQKcaLT43TflIKs4o
X-Google-Smtp-Source: AGHT+IFpkbf3pSp1VhDWH5H5hyL6x6G3zxf6KLYY5KMhS+MwUUS2aUEUkUxkpFxuDOrxtuDCpfdo
X-Received: by 2002:a05:6214:5241:b0:6b0:668c:7b2f with SMTP id 6a1803df08f44-6b1a713168cmr12449516d6.59.1718180220372;
        Wed, 12 Jun 2024 01:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718180220; cv=none;
        d=google.com; s=arc-20160816;
        b=CRMYsNbfB0NjK7m910ms/hmghMDZmEkQvnaj/Xj7lBGnSdZZXrK1WOMx/Q7rWMOg9j
         JtuuUg+uYOkqLpJ8IjQEOF5lAkkJsuCNH4x7VM7nZJX+cbfS+taI/FnjMsLsMot+fSEQ
         r0YUpDX+DevbScR3Yvuhvge0BKloP8KY3ii5kPe/y1TxTXnYNSTa1qe1CwUx0eVq42v8
         9r2A0Wh95I+thBZvEoaR2nRlch3qqRbB23FNycmityo4+6UiKDdW7Avvx0m9vm+QDw0L
         cx32vz88dHA0tbjC2847hpzL0I27eizoduIMHxqxDwbOD6Tl7ztQ9g2FuEepyuUn/U6x
         CPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6oKmkxCufFR9XMY0JlGHXgLRvtGXtLT9oX2X0hjPKqA=;
        fh=TDBzvxSfdE6oPbnRjgmpeHbbsHtVpAEN4utndjBnqmU=;
        b=jCjqXSNoFe9JvHf7rRvIP8TAYBV5iTJuo30Tg4bvBGFqeLxV/3R3AH2wnA623Rs3/C
         y2f1y/p61heDX8Yguqu8hb890K05u4EN0G7SDdiHbeIsly8lFL0xiWL2aRpxrzLhbkqS
         OGoam+d0TvPpIpMiT6Y4strX0ci3LytZzNLVVLfJRxyC/iZTJM3a7d23KzdYZ3LVErll
         eb4o52mOFtbF4VLF4uZ07hfCY/BjP0zErB37oJdVWRBEJFRTBfyC8x4FBXA9aB5qledr
         bJk5kYyjRsRVfAdiT0LmDm8Mcl1xnWchL7ee0pK4KMYRnrrOlZZayahCissqChrgTzvN
         ftAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=gMteCJB8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b07366fc76si89245166d6.368.2024.06.12.01.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 01:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=gMteCJB8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sHJ8x-0003Uu-2u; Wed, 12 Jun 2024 04:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8s-00037V-PC
 for qemu-devel@nongnu.org; Wed, 12 Jun 2024 04:15:38 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8p-0006Va-Q8
 for qemu-devel@nongnu.org; Wed, 12 Jun 2024 04:15:38 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1f70131063cso16957485ad.2
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2024 01:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718180134; x=1718784934; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6oKmkxCufFR9XMY0JlGHXgLRvtGXtLT9oX2X0hjPKqA=;
 b=gMteCJB8dR+rodlZp4gDWzHDxC0ahE0Oz5DtNKvQQjWa4xbnd1el/i7oDudVHgVYY5
 GlMKc8Nh1F0DodV+Ge7nw6mT0VXMKC3yA/Tkq9DyabObtckU+IrVJ+smvNauVORR/Zlq
 PqoSWH+NvBKJc+ODCsNkGarYo4NVsUrKKvUKlCTBKdqki2xZYbtq5+mEeXwi3hh2P67d
 uKfiuFHuP7GFlj0AKydOUlJDVWFdGi5q+z8FciyJcrOMIJdmz9RAgrYibQaa/FpfhpdS
 R+lPx6mOYcd9X1VFRk/FLb0DdubOEVDdSxbp8JC37h4KGWroI8Yx1TuB1bWGN5PpqEjL
 xVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718180134; x=1718784934;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6oKmkxCufFR9XMY0JlGHXgLRvtGXtLT9oX2X0hjPKqA=;
 b=iZyBPMFQu7+4MGw1kzoV6MCdQuBJ8mXFXwAyfQ2j8BttjiToSPRPsq4/XkMwt9MTM1
 BKiOB3mFCkHRGGSCey9mTAx4ipnLlY+bcLh/dQrkas7ijGKk1issWrLhFFcfMz7sFAB3
 XqAWRlZbg0YcHtRW/e+LPmcBXom7HutyyfMweUBkFEkix8zugUM9f53p7f4QCN+z8LkJ
 RUijaEwkNpOaAbpsZeJQXZU3/WeNC+PwTtiwT+HFEETBy8IfnIfZOOsMei2/MJaWR+/z
 ZEY4Oyhol6Lg0Yoe2MXFg0PXhNaGexE4R/eZdxPm3hjQLuKY3nsA7LwcKok3k96eB/8c
 LWlg==
X-Gm-Message-State: AOJu0YwlVOSMklRyR9tUF1g8rbT+1+clpZeIB+2Oz+tpCc+xvgHzMZqL
 wvNOssBMsfAvOK1/WvKTweWDYPzlBoLWIfuh6hvOo4OaqhurPATRE+2ExGX3pj9y19BbgzBCGHt
 QOTPaRy3iok+XAdtaTy0zLQ0bWz4YIb4oxlHtDLUnK8AZsozl000C8bhoqirzSmSVTrN3xbKnM5
 A1eqyHCGfolCaggZQreOu6UMTp58EQOHyuomfFtye2fQ==
X-Received: by 2002:a17:903:40c1:b0:1f4:aa72:1db with SMTP id
 d9443c01a7336-1f83b5e4b50mr14099615ad.22.1718180133624; 
 Wed, 12 Jun 2024 01:15:33 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f8393e8e53sm11363875ad.16.2024.06.12.01.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:15:33 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [RFC PATCH 10/16] target/riscv: Add WID to MemTxAttrs of CPU memory
 transactions
Date: Wed, 12 Jun 2024 16:14:10 +0800
Message-Id: <20240612081416.29704-11-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240612081416.29704-1-jim.shu@sifive.com>
References: <20240612081416.29704-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 99IjThMYj29s

When a RISC-V HART has WG extension, their memory transactions will
contain WID. Support MemTxAttrs in RISC-V target and add WID inside if
a HART has WG extension.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_helper.c | 51 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ff1c22c71c..55d980ff4b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2343,7 +2343,7 @@ static int64_t riscv_get_arch_id(CPUState *cs)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
-    .get_phys_page_debug = riscv_cpu_get_phys_page_debug,
+    .get_phys_page_attrs_debug = riscv_cpu_get_phys_page_attrs_debug,
     .write_elf64_note = riscv_cpu_write_elf64_note,
     .write_elf32_note = riscv_cpu_write_elf32_note,
     .legacy_vmsd = &vmstate_riscv_cpu,
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 43ab558111..588f5de7f7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -512,6 +512,7 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 int riscv_env_mmu_index(CPURISCVState *env, bool ifetch);
+hwaddr riscv_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr, MemTxAttrs *attrs);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                MMUAccessType access_type,
                                                int mmu_idx, uintptr_t retaddr);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ff20ab6ab8..afdccdd672 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -150,6 +150,34 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
 }
 
 #ifndef CONFIG_USER_ONLY
+static uint32_t riscv_cpu_wg_get_wid(CPURISCVState *env, int mode)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    bool virt = env->virt_enabled;
+
+    if (mode == PRV_M) {
+        return cpu->cfg.mwid;
+    } else if (mode == PRV_S) {
+        if (!virt || !env->mwiddeleg) {
+            /* HS-mode, S-mode w/o RVH, or VS-mode but mwiddeleg = 0 */
+            return env->mlwid;
+        } else {
+            /* VS-mode */
+            return env->slwid;
+        }
+    } else if (mode == PRV_U) {
+        if (!riscv_has_ext(env, RVS) || !env->mwiddeleg) {
+            /* M/U mode CPU or mwiddeleg = 0 */
+            return env->mlwid;
+        } else {
+            return env->slwid;
+        }
+    }
+
+    return cpu->cfg.mwid;
+}
+
 void riscv_cpu_set_wg_mwid(CPURISCVState *env, uint32_t mwid)
 {
     CPUState *cs = env_cpu(env);
@@ -1229,13 +1257,22 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     env->two_stage_indirect_lookup = two_stage_indirect;
 }
 
-hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+hwaddr riscv_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr, MemTxAttrs *attrs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     hwaddr phys_addr;
     int prot;
     int mmu_idx = riscv_env_mmu_index(&cpu->env, false);
+    int mode = mmuidx_priv(mmu_idx);
+    uint32_t wid;
+
+    if (riscv_cpu_cfg(env)->ext_smwg && env->wid_to_mem_attrs) {
+        wid = riscv_cpu_wg_get_wid(env, mode);
+        env->wid_to_mem_attrs(attrs, wid);
+    } else {
+        *attrs = MEMTXATTRS_UNSPECIFIED;
+    }
 
     if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
                              true, env->virt_enabled, true)) {
@@ -1339,12 +1376,20 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     int mode = mmuidx_priv(mmu_idx);
     /* default TLB page size */
     target_ulong tlb_size = TARGET_PAGE_SIZE;
+    uint32_t wid;
+    MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
 
     env->guest_phys_fault_addr = 0;
 
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
+    if (riscv_cpu_cfg(env)->ext_smwg && env->wid_to_mem_attrs) {
+        mode = mmuidx_priv(mmu_idx);
+        wid = riscv_cpu_wg_get_wid(env, mode);
+        env->wid_to_mem_attrs(&attrs, wid);
+    }
+
     pmu_tlb_fill_incr_ctr(cpu, access_type);
     if (two_stage_lookup) {
         /* Two stage lookup */
@@ -1436,8 +1481,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     if (ret == TRANSLATE_SUCCESS) {
-        tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
-                     prot, access_type, mmu_idx, tlb_size);
+        tlb_set_page_with_attrs(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
+                                attrs, prot, access_type, mmu_idx, tlb_size);
         return true;
     } else if (probe) {
         return false;
-- 
2.17.1

