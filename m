Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F435606A31A
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Oct 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YiVqQ2Pt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJ7MF-0007qA-Ci; Tue, 20 Oct 2026 06:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7K9-0004hN-9e
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 06:44:06 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7Jj-0004Tu-Og
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 06:44:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a1d484b4a9so39518585e9.0
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 03:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792493018; x=1793097818; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IZVpnwXNEyCCWDW5qZNv/CPNg86yVg361tAI8kFJxDQ=;
 b=YiVqQ2Ptvl1J0XlPGPNw+2LkQVoOZ8kzpbUZaqeeHlnuBJwK/HQQ33f3RvqTOTxgjf
 hwKiiajyuIC66nA9GzxjmCTbYo0dtqOv/A146S2NuihSqU/4B+jjCTvodUehD2AAALbA
 Ury2kanXzuC5O9EeY3wvBtfElqtYFcniJsuWw9HMX8/y62Zf1TrWgSwv7igQtHuLWY6m
 KmzuJA4e++18caMWTRmkoQ1Q0rHgKukLfjqHaYN34L9R4mve6kEg3C3JQmGFnXE5iN9N
 ueps+t/YOzo4scwS23F5w0apQx3sgopH5kfNGmT+bWFc98IINJ1p6pBOz0r2Mi4y1zB7
 rxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792493018; x=1793097818;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IZVpnwXNEyCCWDW5qZNv/CPNg86yVg361tAI8kFJxDQ=;
 b=BTO6b5JwGJ1Tc0BcX+BdZDKhffTXK3whiJHoMMoSHR4EMxL+mCnSEoUOuSlIxceBkH
 8gJjCytCwMyUmecK24nPR7SGvZ72tF+mBZ0qinzTdTAAgcim1spaB0U8ZQC9qNyyzX3K
 JfNfl2ulRDmK1NneqFuXDaDx2O0GuHnE1J3JBTtqbxkPhOVM18aKXV3xf3Dkih3ABI2Q
 DwGqAhrspUknaTL0KSnbi0kT4mmgru9CyxKUSs/yCrNEY7hDJXPqSQXg3XKhhGDiLD4M
 yG2dMkmed2tWsQBRmwKVzl/97A6KqB70rTsJjot9J/KyRV1JwB4kmmI4ggdNmVysB7wh
 q76w==
X-Forwarded-Encrypted: i=1;
 AKwUvByTDTQn2Ma7b+3VHl/QsbuENjcDWZ7ZxlE1zCAuIJdhsEF/IVEMULniMquWhiT60s0O7e2s5TL0Iw==@nongnu.org
X-Gm-Message-State: AFq9FYKHw62puSkArC7s15k1KsEYJwiU36guSQ5MRDXp0dscMJgEF6as
 O0dq58qBMpk8qS0o/ywC8loN4yxkARV/fOdipWYvvN3smT/2x3XMyPA84fGNvQQd3Sc=
X-Gm-Gg: AYBFou0DHinofVP7SONACOa2b+QJceO9MmqqZ38n7XVHDNnC7UQgpEJml+6g7q0+1J1
 B+J7Pra/7IfUIbqk9em7myhsJRpmV5REiEq2SpjNQMkPNipLO7E8QK84PhB3PECXmgfV9tqhiDJ
 3r6CQK8ZdI68G2e6BxBW0AKuUHYme4juU53YumQ3+dkjovA9Gau9Hh8sj0TTHiFdVf5aPC0yYME
 5kTHq/r7Bjan0LoY6irPe8qU8+SKjxOvjea8e9sk6kI9+KALr1KfoKNH7ZBzO4KXM6AJW4VaeVu
 6HhnQRLT3+A09iNB+OLysjbbLabGtDHFb4UxsHjRGfLK+ANBljfGMb9zx8aRKVZ8M7plhl4TJ3v
 /9Kl1R/gngstpuBfdSca3YsQEEnX1pPMomO7DrirIhJHQtZACJO6AktGh+GMFojuikGN26IB9pn
 9JlKUE2vLp/PnZ6dEOclsQ7Babp0Znorh4xwQA6ngJazjtwtpWV138+ZSniyzDnzQhZNqZLg==
X-Received: by 2002:a05:600c:4455:b0:4a1:e225:b122 with SMTP id
 5b1f17b1804b1-4a1e225b8d7mr156541115e9.14.1792493017818; 
 Tue, 20 Oct 2026 03:43:37 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1dc952d63sm346602105e9.2.2026.10.20.03.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 03:43:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6F0A45FF88;
 Tue, 20 Oct 2026 11:43:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bibo Mao <maobibo@loongson.cn>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Song Gao <17746591750@163.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Bj=C3=B6rn=20Walk?= <bwalk@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-ppc@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, linux-edac@vger.kernel.org,
 Glenn Miles <milesg@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Menghani <gautam@linux.ibm.com>,
 Xianglai Li <lixianglai@loongson.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Chinmay Rath <rathc@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Weiwei Li <liwei1518@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 21/23] accel/kvm: port kvm_arch_on_sigbus_vcpu to KVMCPUOps
Date: Tue, 20 Oct 2026 11:43:15 +0100
Message-ID: <20261020104320.3686723-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020104320.3686723-1-alex.bennee@linaro.org>
References: <20261020104320.3686723-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This leaves hanging the question of if we should clean-up
KVM_HAVE_MCE_INJECTION? It is poisoned to avoid entering generic code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/specs/acpi_hest_ghes.rst |  3 ++-
 include/accel/kvm/cpu-ops.h   |  6 ++++++
 include/system/kvm.h          |  2 --
 target/i386/kvm/kvm_i386.h    |  1 +
 accel/kvm/kvm-all.c           | 19 ++++++++++++++++---
 target/arm/kvm.c              |  3 ++-
 target/i386/kvm/kvm-cpu.c     |  1 +
 target/i386/kvm/kvm.c         |  2 +-
 8 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
index aaf7b1ad11a..dfb319dc3b4 100644
--- a/docs/specs/acpi_hest_ghes.rst
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -114,5 +114,6 @@ Design Details
      kernel, on receiving notification, guest APEI driver could read the CPER error
      and take appropriate action.
 
-(11) kvm_arch_on_sigbus_vcpu() reports RAS errors via a SEA notifications,
+
+(11) The KVMCPUops::on_sigbus_vcpu callback reports RAS errors via a SEA notifications,
      when a SIGBUS event is triggered.
diff --git a/include/accel/kvm/cpu-ops.h b/include/accel/kvm/cpu-ops.h
index c2ae74f2b87..d43bc845ad5 100644
--- a/include/accel/kvm/cpu-ops.h
+++ b/include/accel/kvm/cpu-ops.h
@@ -101,6 +101,11 @@ struct kvm_run;
  *                           execution should stop.
  *                           Returns true to stop the VM, or false to dump state
  *                           and continue. If NULL, defaults to true.
+ * @on_sigbus_vcpu: Optional callback executed when a SIGBUS signal is received
+ *                  to inject an architecture-specific hardware memory error
+ *                  (e.g. MCE on x86 or SEA on ARM) into the guest.
+ *                  May be NULL if the target does not support hardware error
+ *                  injection.
  */
 typedef struct KVMCPUOps {
     int (*pre_create_vcpu)(CPUState *cpu, Error **errp);
@@ -122,6 +127,7 @@ typedef struct KVMCPUOps {
                                 GdbBreakpointType type);
     void (*remove_all_hw_breakpoints)(CPUState *cpu);
     bool (*stop_on_emulation_error)(CPUState *cpu);
+    void (*on_sigbus_vcpu)(CPUState *cpu, int code, void *addr);
 } KVMCPUOps;
 
 #define TYPE_KVM_ACCEL_CPU "kvm-accel-cpu"
diff --git a/include/system/kvm.h b/include/system/kvm.h
index 719ae1c71fb..98ef937eff1 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -352,8 +352,6 @@ bool kvm_vcpu_id_is_valid(int vcpu_id);
 /* Returns VCPU ID to be used on KVM_CREATE_VCPU ioctl() */
 unsigned long kvm_vcpu_id(CPUState *cpu);
 
-void kvm_arch_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
-
 void kvm_arch_init_irq_routing(KVMState *s);
 
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index 9d4be604443..88aa0699c28 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -52,6 +52,7 @@ int x86_kvm_remove_hw_breakpoint(CPUState *cs, vaddr addr, vaddr len,
                                  GdbBreakpointType type);
 void x86_kvm_remove_all_hw_breakpoints(CPUState *cs);
 bool x86_kvm_stop_on_emulation_error(CPUState *cs);
+void x86_kvm_on_sigbus_vcpu(CPUState *c, int code, void *addr);
 void kvm_arch_after_reset_vcpu(X86CPU *cpu);
 void kvm_arch_do_init_vcpu(X86CPU *cs);
 uint32_t kvm_arch_get_supported_cpuid(KVMState *env, uint32_t function,
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 62ebb3458c8..5189cdc6a01 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3535,8 +3535,10 @@ int kvm_cpu_exec(CPUState *cpu)
 #ifdef KVM_HAVE_MCE_INJECTION
         if (unlikely(have_sigbus_pending)) {
             bql_lock();
-            kvm_arch_on_sigbus_vcpu(cpu, pending_sigbus_code,
+            if (ops->on_sigbus_vcpu) {
+                ops->on_sigbus_vcpu(cpu, pending_sigbus_code,
                                     pending_sigbus_addr);
+            }
             have_sigbus_pending = false;
             bql_unlock();
         }
@@ -4080,6 +4082,11 @@ void kvm_init_cpu_signals(CPUState *cpu)
 int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr)
 {
 #ifdef KVM_HAVE_MCE_INJECTION
+    const KVMCPUOps *ops = kvm_get_cpu_ops(cpu);
+
+    if (!ops || !ops->on_sigbus_vcpu) {
+        return 1;
+    }
     if (have_sigbus_pending) {
         return 1;
     }
@@ -4097,13 +4104,19 @@ int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr)
 int kvm_on_sigbus(int code, void *addr)
 {
 #ifdef KVM_HAVE_MCE_INJECTION
+    const KVMCPUOps *ops;
+
     /* Action required MCE kills the process if SIGBUS is blocked.  Because
      * that's what happens in the I/O thread, where we handle MCE via signalfd,
      * we can only get action optional here.
      */
     assert(code != BUS_MCEERR_AR);
-    kvm_arch_on_sigbus_vcpu(first_cpu, code, addr);
-    return 0;
+    ops = kvm_get_cpu_ops(first_cpu);
+    if (ops && ops->on_sigbus_vcpu) {
+        ops->on_sigbus_vcpu(first_cpu, code, addr);
+        return 0;
+    }
+    return 1;
 #else
     return 1;
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ed99699098c..563b331a7cf 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2486,7 +2486,7 @@ static int arm_kvm_get_registers(CPUState *cs, Error **errp)
     return ret;
 }
 
-void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
+static void arm_kvm_on_sigbus_vcpu(CPUState *c, int code, void *addr)
 {
     ram_addr_t ram_addr;
     hwaddr paddr;
@@ -2656,6 +2656,7 @@ static const KVMCPUOps arm_kvm_cpu_ops = {
     .insert_hw_breakpoint = arm_kvm_insert_hw_breakpoint,
     .remove_hw_breakpoint = arm_kvm_remove_hw_breakpoint,
     .remove_all_hw_breakpoints = arm_kvm_remove_all_hw_breakpoints,
+    .on_sigbus_vcpu = arm_kvm_on_sigbus_vcpu,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index c9340183eaf..e876ec6b794 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -252,6 +252,7 @@ static const KVMCPUOps x86_kvm_cpu_ops = {
     .remove_hw_breakpoint = x86_kvm_remove_hw_breakpoint,
     .remove_all_hw_breakpoints = x86_kvm_remove_all_hw_breakpoints,
     .stop_on_emulation_error = x86_kvm_stop_on_emulation_error,
+    .on_sigbus_vcpu = x86_kvm_on_sigbus_vcpu,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e419af944cb..26d30629272 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -767,7 +767,7 @@ static void hardware_memory_error(void *host_addr)
     exit(1);
 }
 
-void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
+void x86_kvm_on_sigbus_vcpu(CPUState *c, int code, void *addr)
 {
     X86CPU *cpu = X86_CPU(c);
     CPUX86State *env = &cpu->env;
-- 
2.47.3


