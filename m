Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC746CCFA13
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:45:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINr2-0004vE-PL; Thu, 30 Apr 2026 05:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqr-0004gW-8t
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:33 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqi-0002VM-Ql
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:32 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43d75312379so1109144f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541901; x=1778146701; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DOKX0DPjwYUZpph6iph7SwRnGuSF5f4WQz6+Qq/UgBQ=;
 b=A+lK18QNA6IxuMjUR/9/ESTG7vCZs5U5PQi2j76GI0FUWCjBTIbGyGHh3l0jp4pUdN
 0lBURg0e0tPdcANAiGnRNE7GkhD0EAhLRyisiYi2gIYRleJUBNmLhKfTJP4aPYFnj6VQ
 cm1q3afaW2lopDPmePZnhYJ2EkzRgouuCqt8su4Yy/8+zLoFfU53fgBhzaHmEQhPHS9B
 c8Dgoc8N/+1+EbxbhbwztZxTHoJEvzFu+yCIXCqiWkqqo0V0VAtoJ+XLxjICSu6M3x3g
 68ehSFXk/kqQKRO7RWEeJKczrgQ1nW8VrRYOabaidbbI5cu6ZPCQNHag7Mzc65Sj2wRa
 uB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541901; x=1778146701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DOKX0DPjwYUZpph6iph7SwRnGuSF5f4WQz6+Qq/UgBQ=;
 b=hy4BUPcl01vmiEhGq4sh4qfRYqQnk/cuPGzEg+//zmrXua31j0orxc7K6MFJGlcImO
 vR09cxg2eAzqnangnvTw1Y+05p30xCZfytMBY9u8ibiuy/xy6wFJ/zmg9knEj1a2hnSL
 BZxSw7xiixgpPUXS0K+NmG+yDV/v7f5mztV5MlEEljpaLwH4IKDPrg4Ox0lxQPyOMjsS
 XUKBkMvkeC+/qc346WoOP0dIxf0SscOZeiJtlXVhyGA1qD43PZ5v0wNIL2b04/K12gBv
 Em/e4D4XQjnz/OKJOWG5JuOTBZi7zUGorQbhO5MQydB6s3DgvrFkIDoC3+ZagOgp+uQd
 yKcg==
X-Gm-Message-State: AOJu0YzE+zC13YwomSaG7/C2hesP+D0XyWSerzOJu9m2UEkbeJ19dV2m
 3hRXQDHjsdQ5GwcSUinWyqDEr9E5T1pmOy5lS6d75v0YLjQuVBmrALocA1UPylpM54o=
X-Gm-Gg: AeBDiesHeAB8OAmBIvO0Qf04lN8zqoIUZ4ry2TtYy4UrJBJlmiZiwGiMGSDsHAkhdyw
 8DiduxOgAB7t1XW29mmHG+DE5k1nW7abVvr0AGFEMRluxTKaP2FslSIdmdGJvFNvJA+AlMIwKK7
 QTGAl9uWPwIqGrGKCJ/GUkygmNKDspCBF9sXW6Ghtb5PT6AxJkMI+7n/icHdY9HV7OkZTposyvH
 TteEZCKCON2bs5W4rh0c6c0PFY1JU1O4jUJZm3OFR53yAdgmXOhoQjIuNZJ54m+ei6p38a6rr7S
 S5CprQu+oxy9yRGEdtAk3rXqpARSn73DbnYO1AnX8BLcaWZo2RNOHy1ZwGdECIJJp+J2Mmp46PU
 bktKC2USLgM3A/+MB2GPTWiPmeaR5H5rbHwqF7+jzBvXFsRc60SHtKU+lv4X+dQXTMinQEKmfqL
 18SVuXMWJEzijhr5jKVuU9sz4qAGyBhT8KjQCSoj0sNYbd9ukrLQN1X0sRLBLG+5g7eW7vK258d
 bhKPxAWNIxfYf0ng6k9/GBkyixsYQs2n9R6kIWDnQ==
X-Received: by 2002:a05:6000:2381:b0:43f:e9f0:87bd with SMTP id
 ffacd0b85a97d-4494e8d7bc5mr3084907f8f.10.1777541900731; 
 Thu, 30 Apr 2026 02:38:20 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
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
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 07/25] target/s390x: Make get_phys_page_debug handle
 non-page-aligned addrs
Date: Thu, 30 Apr 2026 10:37:52 +0100
Message-ID: <20260430093810.2762539-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20260417173105.1648172-7-peter.maydell@linaro.org
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


