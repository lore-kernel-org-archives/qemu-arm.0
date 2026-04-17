Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A00DF8E4A6
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 17:35:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDn2y-0007Ea-Jc; Fri, 17 Apr 2026 13:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2Q-0006l1-VC
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:37 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2L-000256-2I
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43d7a5e77b1so683882f8f.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776447082; x=1777051882; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dnIJ3EmNqXbziGIQGEMV/q/0xOD9YQRq2D+dL5Z773s=;
 b=ohf+deQWd2ed5G8KdTvZpzMjE7hsOEPXk5Scs0bgj168ou2eVGmiG8HIp9R4zND4Gd
 EYpyM1alqL2K55Im4cfvC7togpJXZd/fvwJkmB4chFwwT1MZKF46Lr3jEFRW+OGml9Ou
 2/XtYX2w3k6ce7euJvIY2AsOujLM/0t2v2dYnfWpkDdYiX/h5GtKfLaT1ktkxWU2t0/e
 k1exrbo+nV3AJsI+CB4orN/wi/lXzyWfUKgl5GI7J4J9SpmSLn7mQ5q3sN/oQGi3vBG4
 Y35qH/7XGNBun/1K9px8qcNG0gKF2N/fglSd0HPQU7/rPzHUSzbAjBEQ6wh52BsMb/ay
 VOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776447082; x=1777051882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dnIJ3EmNqXbziGIQGEMV/q/0xOD9YQRq2D+dL5Z773s=;
 b=IOq6Mi1HVrePJWPTI51Pte2qhcYEizQfF/OpeWPLe0pF/h6Bmo6faTeEJLRKjjew52
 ZbKalULCbsXRv7zd9pw0UbjkkeyoTl6W6FOZzmK4pCKjY80zQH+Pa8R0ARwvbfEM1x6V
 JQxd/6saErWJUNaw3i1cKbxsqSCbprdEoGAMVb5a9htF9tO+O+hkRDTM1IZ0RFLzsnts
 Vw1YBNpke8SjDDTduLNZ/Hcimz22t9WwSObwiycYR7VYDu6F7Jjbp58C4rCa3eqZNHAi
 P6UTHzLCf9BNHeY0n1UmW+ut99waLNpdj/HQzt7J9dinZQx4CXjDA2Iaex2xdRlOAUK4
 hdjg==
X-Gm-Message-State: AOJu0YyZrDxWxFQACOMURKqW5XQ4Q0QTSkQCGMOED4eeWteJ6eJD6/Ia
 Cq9LJYni06H8YZYsBOBAWbCF7XlPCTrdldEB1sm8nEUJ4wyVmkKbcWQD23sPlBaJ+8krdu6uZIQ
 EM0xBsm0=
X-Gm-Gg: AeBDiet5/tTflbm7wGUfHdEgoQpzys+5Z2OCCwGPB/3d5fb7J07T3LncyEAzLn9Yl3E
 L0DWiiHVmfBL2T+VuToHAdUW0VhO6ylRdqwMmSRW60pRjD53WHKDEfGw8x0rWZYg1JGBSRtn5QR
 XhE1N+LE8ZDBgdUEKgaSu4GwdmU1gk5A6Q5evEB2dn4p9pAAel3sGcmK6ydyvwy3Ui9T2fvAZWU
 SFLe0AgItfZhVUv8V6wutKUxU5AS4clv4qc3/P07o7b4VdbM/aoniUOH1rgyGgA1xgLGJcvHwNd
 HLr+zZRFHGtgITBfQut9GKs0D4A3L0GN9PQtEAwQRWR+ra69dRCzwu7fV2Ls5n/5zys9/Zwa6KZ
 GLFrqIfM6uUdZuUttAdOg5GhtCE+UEHTt8L74JHUFV3+VuQC8TSoHAqTZKm982ARrNzttfEfpbQ
 7ebj6ZJ24Qr1ooxgPTBmiIJXtY+H+WERdH72iFKE4EUhLixUZwRWUpLORUKMBkH6LBwbCWljmGR
 0Zv13kf2rZuxkk3PHGsDCNCakzLXYULUBpUnFUvyQ==
X-Received: by 2002:a5d:6e66:0:b0:43d:7cc0:dac2 with SMTP id
 ffacd0b85a97d-43fe409de50mr4168195f8f.30.1776447081616; 
 Fri, 17 Apr 2026 10:31:21 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm5819650f8f.35.2026.04.17.10.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 10:31:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 06/17] target/s390x: Make get_phys_page_debug handle
 non-page-aligned addrs
Date: Fri, 17 Apr 2026 18:30:54 +0100
Message-ID: <20260417173105.1648172-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417173105.1648172-1-peter.maydell@linaro.org>
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Currently our implementations of SysemuCPUOps::get_phys_page_debug
and SysemuCPUOps::get_phys_page_attrs_debug are a mix of "accepts a
non-page-aligned virtual address and returns the corresponding
non-page-aligned physical address" and "only returns a page-aligned
physical address".  This is awkward for callsites, which in practice
all want the physical address for an arbitrary virtual address and
have to work around the possibility of getting a page-aligned
address, and it doesn't account for protection being possibly on a
sub-page-sized granularity.  We want to standardize on the
implementation having to handle non-page-aligned addresses.

s390x already has an implementation of "give me the actual physical
address, not rounded down", in s390_get_phys_addr_debug(), so we can
use this for the SysemuCPUOps::get_phys_page_debug method, and merge
the s390_cpu_get_phys_page_debug() function into
s390_get_phys_addr_debug() which is now its only caller.

This leaves the function implementing the method with a name
that doesn't match the method name, but we will fix that shortly
by renaming the method to *_addr_* for all targets.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/s390x/cpu-system.c     |  2 +-
 target/s390x/helper.c         | 20 +++++---------------
 target/s390x/s390x-internal.h |  1 -
 3 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/target/s390x/cpu-system.c b/target/s390x/cpu-system.c
index 881171d71a..c133b0c262 100644
--- a/target/s390x/cpu-system.c
+++ b/target/s390x/cpu-system.c
@@ -176,7 +176,7 @@ void s390_cpu_finalize(Object *obj)
 
 static const struct SysemuCPUOps s390_sysemu_ops = {
     .has_work = s390_cpu_has_work,
-    .get_phys_page_debug = s390_cpu_get_phys_page_debug,
+    .get_phys_page_debug = s390_cpu_get_phys_addr_debug,
     .get_crash_info = s390_cpu_get_crash_info,
     .write_elf64_note = s390_cpu_write_elf64_note,
     .legacy_vmsd = &vmstate_s390_cpu,
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 667d4a0da7..1a2658eaf9 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -39,7 +39,7 @@ void s390x_cpu_timer(void *opaque)
     cpu_inject_cpu_timer((S390CPU *) opaque);
 }
 
-hwaddr s390_cpu_get_phys_page_debug(CPUState *cs, vaddr vaddr)
+hwaddr s390_cpu_get_phys_addr_debug(CPUState *cs, vaddr addr)
 {
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
@@ -47,10 +47,11 @@ hwaddr s390_cpu_get_phys_page_debug(CPUState *cs, vaddr vaddr)
     int prot;
     uint64_t asc = env->psw.mask & PSW_MASK_ASC;
     uint64_t tec;
+    vaddr page = addr & TARGET_PAGE_MASK;
 
     /* 31-Bit mode */
     if (!(env->psw.mask & PSW_MASK_64)) {
-        vaddr &= 0x7fffffff;
+        page &= 0x7fffffff;
     }
 
     /* We want to read the code (e.g., see what we are single-stepping).*/
@@ -62,24 +63,13 @@ hwaddr s390_cpu_get_phys_page_debug(CPUState *cs, vaddr vaddr)
      * We want to read code even if IEP is active. Use MMU_DATA_LOAD instead
      * of MMU_INST_FETCH.
      */
-    if (mmu_translate(env, vaddr, MMU_DATA_LOAD, asc, &raddr, &prot, &tec)) {
+    if (mmu_translate(env, page, MMU_DATA_LOAD, asc, &raddr, &prot, &tec)) {
         return -1;
     }
+    raddr += (addr & ~TARGET_PAGE_MASK);
     return raddr;
 }
 
-hwaddr s390_cpu_get_phys_addr_debug(CPUState *cs, vaddr v_addr)
-{
-    hwaddr phys_addr;
-    vaddr page;
-
-    page = v_addr & TARGET_PAGE_MASK;
-    phys_addr = cpu_get_phys_page_debug(cs, page);
-    phys_addr += (v_addr & ~TARGET_PAGE_MASK);
-
-    return phys_addr;
-}
-
 static inline bool is_special_wait_psw(uint64_t psw_addr)
 {
     /* signal quiesce */
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 40850bcdc4..e7e4f2b45d 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -321,7 +321,6 @@ void do_restart_interrupt(CPUS390XState *env);
 void s390x_tod_timer(void *opaque);
 void s390x_cpu_timer(void *opaque);
 void s390_handle_wait(S390CPU *cpu);
-hwaddr s390_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 hwaddr s390_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 LowCore *cpu_map_lowcore(CPUS390XState *env);
 void cpu_unmap_lowcore(CPUS390XState *env, LowCore *lowcore);
-- 
2.43.0


