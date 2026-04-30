Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E66FF886F
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:44:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINrH-0005OY-12; Thu, 30 Apr 2026 05:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINr7-0004zz-PT
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqt-0002gu-PY
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43d64313c39so533807f8f.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541914; x=1778146714; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9snYL6N/5LnNtzLZ3Lr1l12O+pLGtTzbqLqghTUwtI=;
 b=WYywqCBbQzH1VQkJNb/NHvj6KDKtDM6jVMT11PWLdrXfC1aICvpaU/RC0SnzRU5qE7
 T/3ug6f6fCDN6lqoOTOrJDW6l9FbKUntWwvexYgoWl/VlUgpA6XmMTa1UZuktqNXJJEY
 aG/K4rUHoIv+Q5MbJ5M6ZglCqh1cG7U9ujbgR915g43Df7BYu/KbxIfaAhkamPdFBZYa
 ep6fDa1FRXhsvBM6vUBcKVzX2w5Wf/crA+HM9t1JiRB30I2wtdUEOnx0inhO/4wFcgyr
 NDUA/NIEiUH4QCKsNcqDcpJUcHTFOtbOcO64jfk4bPg51nT3BWK9ti2eacPVJAmzpR1s
 QxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541914; x=1778146714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c9snYL6N/5LnNtzLZ3Lr1l12O+pLGtTzbqLqghTUwtI=;
 b=L0Kf8od+CzXDPUlQI363uz0yyiawN2XgFWscNdsljnJAsnQpqtx+MF+Q+b43/+Yrfx
 lhjSz3nNsyyG78eFwgKWb5MXatfjts0OBcMP3Q/4RbEFtpu+mF080Bnd10Z9XJ6ZXheg
 aM7M8e2HyXZbZ6ULkvcS1PoCVINmduGEzl5F7HMJSLNcpgrqIQosxyqHQJeS6bRYro47
 xtMrRh0IcD1kbbbqJohf4F9aocMIQfLVawt4qwFKFc/DKZ69qqoPRsm+HXhoqUayBoCY
 n0F8/Fw2e/jPCIJ7zlilmx4mqACTC/tf1peqmjKKPw0vsYPf9mIk15r4A7DJEedC6to7
 cYMA==
X-Gm-Message-State: AOJu0YxiJg5mGCeQOImYBOeV3izgTb5dGJcmT85fpX/PEvkFDQ4sS0AW
 4SwFQxmpmJuLZZEwgUKvczJFBdly1uJPAdb1+Rye38ghya6wBLhRvULmiCXKNzuhZRA=
X-Gm-Gg: AeBDietDR+HJBHHLsesfr3p/ULPVZt5MTAZ7WmbEfq/yZpMi73Wk5NifVe0Z2DGuqFM
 7O/IrAeJ2cpJjZapYXHJd9tGodBemaNuRGYxL/PGku5AYGJIE3F/966KjXcJ6FIe0IfJ+pVk6uO
 UDH/jk/GXhrSo4Uju63IjEq70bh7ErnIarKZYzvb2ypra+FuHdyNCBd3XYxKztb0Xr0MpOrUzPu
 LeFloQ3PXsqOcNg+/QtNlPLq0gd2vWJVuFRboA2R4nqTWFGtQN+ZtH+bxo6V03NaY6RhhStYNMX
 +oLL4Xn5OcCG9b9FNLKhLTqpJEqNU5Lao7W8UeYzQrdef7G/urz+XHKg78+7WjQPxcKkWKEYu1q
 zw48AbyHK++Bvv5h6E/YwKtAs2g/DhUVyIsEN3ZfsEGi/yIqH+/+RbbXoTkL0awhXZo+9oTkqXc
 SsZT/CUq2bTNAUz84lqhsC0Stgv7FAStjhebpIwjqztzHUxCgJLOUfh6WErp6s6eZmnKK++hy2b
 Scqrc7jnZNN6HekiDTZ0BryO0VWiNrMgC0msdoEnw==
X-Received: by 2002:a05:6000:2486:b0:43d:7d24:b4ff with SMTP id
 ffacd0b85a97d-4493f42e211mr3104854f8f.40.1777541914093; 
 Thu, 30 Apr 2026 02:38:34 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:33 -0700 (PDT)
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
Subject: [PATCH v2 17/25] target/arm: Implement translate_for_debug
Date: Thu, 30 Apr 2026 10:38:02 +0100
Message-ID: <20260430093810.2762539-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20260417173105.1648172-17-peter.maydell@linaro.org
---
v1->v2: use 'fault' for the bool variable, not 'ret'
---
 target/arm/cpu.c       |  2 +-
 target/arm/cpu.h       |  3 ---
 target/arm/internals.h |  4 ++++
 target/arm/ptw.c       | 39 +++++++++++++++++++++++----------------
 4 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9e6b4b1559..eaa1805160 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2436,7 +2436,7 @@ static vaddr aarch64_untagged_addr(CPUState *cs, vaddr x)
 
 static const struct SysemuCPUOps arm_sysemu_ops = {
     .has_work = arm_cpu_has_work,
-    .get_phys_addr_attrs_debug = arm_cpu_get_phys_addr_attrs_debug,
+    .translate_for_debug = arm_cpu_translate_for_debug,
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b1563a4d43..6fd7c4bd30 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1233,9 +1233,6 @@ extern const VMStateDescription vmstate_arm_cpu;
 void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
 
-hwaddr arm_cpu_get_phys_addr_attrs_debug(CPUState *cpu, vaddr addr,
-                                         MemTxAttrs *attrs);
-
 typedef struct ARMGranuleProtectionConfig {
     /* GPCCR_EL3 */
     uint64_t gpccr;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index a632584a4e..81b2973b20 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1540,6 +1540,10 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
 void arm_log_exception(CPUState *cs);
 
+/* Implementation of SysemuCPUOps::translate_for_debug */
+bool arm_cpu_translate_for_debug(CPUState *cs, vaddr addr,
+                                 TranslateForDebugResult *result);
+
 #endif /* !CONFIG_USER_ONLY */
 
 /*
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8be6f243e6..cc7f78c329 100644
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
@@ -3934,26 +3935,31 @@ static hwaddr arm_cpu_get_phys_addr(CPUARMState *env, vaddr addr,
     };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    bool ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
-    *attrs = res.f.attrs;
+    bool fault = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
 
-    if (ret) {
-        return -1;
+    if (!fault) {
+        /* translation succeeded */
+        result->physaddr = res.f.phys_addr;
+        result->attrs = res.f.attrs;
+        result->lg_page_size = res.f.lg_page_size;
     }
-    return res.f.phys_addr;
+    return fault;
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


