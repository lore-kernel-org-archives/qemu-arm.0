Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7286DF8DFF9
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 17:33:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDn3A-0007Tg-1d; Fri, 17 Apr 2026 13:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2p-0006wb-8a
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wDn2i-0002P5-Kd
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 13:31:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43d77f60944so688541f8f.3
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 10:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776447105; x=1777051905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxY3ZiluRC3qmS1pGuPIEiJq7+uwFw+8gR7Q01pS8h0=;
 b=NAbTLBABACARBfKk+zUKPiARfN782ku57nrh0hHwzTMR457GYg9VKywf4jhlyqUf/i
 3ibZPnhg3qxjntjZ8H0JREBKqorNakUPDVrt7XmuqIPAygAiQr40RAR6l955jwUZhzmJ
 Fgdp/qqAXtiDaQbLc/JGeqhsmnUrYYtnlu2k7O5Qdjaz6x4gjmkHbW7DTfpgvsUQYh3y
 9irLztcHm1D/eG2J6Dl7LePfv1a+MKIwyVN5Wb09r7mM9O8C+zGGDlIK/AIMlthUW5sy
 Yndug+GDhe8m/BtOymoZm8GmJsQDLn9zFAzIb7tk0vfqmCKAswhu4z6VGk2VTJU5omSO
 383Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776447105; x=1777051905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wxY3ZiluRC3qmS1pGuPIEiJq7+uwFw+8gR7Q01pS8h0=;
 b=hn2LDWcxPGOIWHtko42XHNu/EH7xcefiUqFeRCb+lfuLIqIJlfbgT6AIJ8Vk6pE6p9
 7YoCNDPxszPmHkVUismAFY9IRXZWkuTBwRlwO/xhuRdzlCuh7GyFwksjCuh33FNbZ5KR
 /+EvzQTVXCYGbzjpG9ruOFfmKHdTdd7uaDYCkaMtpzTb1/YIV2V24mKm9H6/tnq59sKJ
 V12LSg5E01IAUtGAMp5edB4cAG2TjcbhtCXs27wldsNEHuwhK/NiGAXMmfJTdMz7G8EY
 Zmx6zlb5qIEXNwP7zPeFZlEB8+ksFwsuEA2rklpjKSqTx0suvkhCtEBnj0AnRekjj0w3
 bfOQ==
X-Gm-Message-State: AOJu0YwDk+/9bZcxugzp+i+a4Ta+f3rO3ex2wMuTmP3ulQhyBcb9duBh
 XYCt0y3VV57xK5l7JzmMHXdbxq9CjqQZIXh6rBQLkpWQdxa90HIdIbskBsGdr+21JSRrCOcI94g
 jVkWSb9U=
X-Gm-Gg: AeBDiesrX34bRjkTGIgP9td1Mqgd2PvboucIxuDc5Ck5MiplBhXET+iS9IZiSv7rO8G
 nH9cMh+bbXjtjq12aG4nOvWwQHLLAAoq1tzMUgN582ZuBFDS1Ih7OHCNc+i7LbdFgxYCUqY6l1g
 Cap08ix7CuREtL35lyPOS07GcsfUNUxnEs61iHohC85NJYzCcc/Qs6j+iAGr4xi70tXoNUQGBp/
 JCU7BodQjpsH/eYZ30iR5bT0n8Fkx0oEu4kkPX0kVJyAPVErkn0r96cqouf24+4vOTSSzC3brWg
 J5N3Ak3tqMA0VgGpVuMdlsDxYAQD9HKE8rdC0d6dX/bTw9Ik8v6J3HBont88DD0jRpnjk8f8YdQ
 ZrAXjK/7JA1sFfnB3ZfRNaVi0HCBmWXEf5W5e2vj/g9MZzB3CwyZXQS7ldJ4QzKwTQ5cuWKbPk2
 k1N3kFJPTpwnK5ZPzTXtST4jS7BcwFhw2qRiYAkMGm2kBWNbHXHxP5CIZW7WT1MJzabVejtmly3
 q20GRh0pxbifcZexrsQXcClnOLq9Vc9Z3KZrQGYw71jJdVbhiXx
X-Received: by 2002:a05:6000:1868:b0:43d:7a97:78af with SMTP id
 ffacd0b85a97d-43fe3e24bd3mr5924110f8f.42.1776447105123; 
 Fri, 17 Apr 2026 10:31:45 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm5819650f8f.35.2026.04.17.10.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 10:31:44 -0700 (PDT)
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
Subject: [PATCH 16/17] target/arm: Implement translate_for_debug
Date: Fri, 17 Apr 2026 18:31:04 +0100
Message-ID: <20260417173105.1648172-17-peter.maydell@linaro.org>
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

Implement the translate_for_debug method instead of the
get_phys_addr_attrs_debug one.  This allows us to pass the caller the
lg_page_size from our internal GetPhysAddrResult struct.

Awkwardly, translate_for_debug's "true on success" convention
is the opposite of the one we use internally in ptw.c, so
we have to be careful about the sense of the return values.
This corresponds to the way that arm_cpu_tlb_fill_align()
also has to return true when get_phys_addr() returns false.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c       |  2 +-
 target/arm/cpu.h       |  3 ---
 target/arm/internals.h |  4 ++++
 target/arm/ptw.c       | 37 ++++++++++++++++++++++---------------
 4 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f28c74a94b..c014375cb7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2295,7 +2295,7 @@ static vaddr aarch64_untagged_addr(CPUState *cs, vaddr x)
 
 static const struct SysemuCPUOps arm_sysemu_ops = {
     .has_work = arm_cpu_has_work,
-    .get_phys_addr_attrs_debug = arm_cpu_get_phys_addr_attrs_debug,
+    .translate_for_debug = arm_cpu_translate_for_debug,
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 917e4668da..ea3c65ba1a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1231,9 +1231,6 @@ extern const VMStateDescription vmstate_arm_cpu;
 void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
 
-hwaddr arm_cpu_get_phys_addr_attrs_debug(CPUState *cpu, vaddr addr,
-                                         MemTxAttrs *attrs);
-
 typedef struct ARMGranuleProtectionConfig {
     /* GPCCR_EL3 */
     uint64_t gpccr;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 85980f0e69..5527c004db 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1532,6 +1532,10 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
 void arm_log_exception(CPUState *cs);
 
+/* Implementation of SysemuCPUOps::translate_for_debug */
+bool arm_cpu_translate_for_debug(CPUState *cs, vaddr addr,
+                                 TranslateForDebugResult *result);
+
 #endif /* !CONFIG_USER_ONLY */
 
 /*
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8be6f243e6..ae4089a14c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3922,8 +3922,9 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
                              memop, result, fi);
 }
 
-static hwaddr arm_cpu_get_phys_addr(CPUARMState *env, vaddr addr,
-                                    MemTxAttrs *attrs, ARMMMUIdx mmu_idx)
+static bool arm_cpu_get_phys_addr(CPUARMState *env, vaddr addr,
+                                  TranslateForDebugResult *result,
+                                  ARMMMUIdx mmu_idx)
 {
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
@@ -3935,25 +3936,30 @@ static hwaddr arm_cpu_get_phys_addr(CPUARMState *env, vaddr addr,
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
     bool ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
-    *attrs = res.f.attrs;
 
-    if (ret) {
-        return -1;
+    if (!ret) {
+        /* translation succeeded */
+        result->physaddr = res.f.phys_addr;
+        result->attrs = res.f.attrs;
+        result->lg_page_size = res.f.lg_page_size;
     }
-    return res.f.phys_addr;
+    return ret;
 }
 
-hwaddr arm_cpu_get_phys_addr_attrs_debug(CPUState *cs, vaddr addr,
-                                         MemTxAttrs *attrs)
+bool arm_cpu_translate_for_debug(CPUState *cs, vaddr addr,
+                                 TranslateForDebugResult *result)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
 
-    hwaddr res = arm_cpu_get_phys_addr(env, addr, attrs, mmu_idx);
-
-    if (res != -1) {
-        return res;
+    /*
+     * Note that this function returns true on translation success,
+     * but arm_cpu_get_phys_addr() and all the other get_phys_addr
+     * style functions in this file return true on failure.
+     */
+    if (!arm_cpu_get_phys_addr(env, addr, result, mmu_idx)) {
+        return true;
     }
 
     /*
@@ -3964,11 +3970,12 @@ hwaddr arm_cpu_get_phys_addr_attrs_debug(CPUState *cs, vaddr addr,
     switch (mmu_idx) {
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
-        return arm_cpu_get_phys_addr(env, addr, attrs, ARMMMUIdx_E10_0);
+        return !arm_cpu_get_phys_addr(env, addr, result, ARMMMUIdx_E10_0);
     case ARMMMUIdx_E20_2:
     case ARMMMUIdx_E20_2_PAN:
-        return arm_cpu_get_phys_addr(env, addr, attrs, ARMMMUIdx_E20_0);
+        return !arm_cpu_get_phys_addr(env, addr, result, ARMMMUIdx_E20_0);
     default:
-        return -1;
+        /* translation failed */
+        return false;
     }
 }
-- 
2.43.0


