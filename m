Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8189ECD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:52:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Eo-00085P-R7; Fri, 29 May 2026 15:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3Eh-0007pd-Ra
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:51:17 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3Ed-0004v0-JC
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:51:15 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso906293f8f.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780084269; x=1780689069; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWnhuAA8R9T9RYOGxNIaIDGmYbKBGKM0uEReh2pp44c=;
 b=Rma/1w3mqhw9ks4KbjdJ17RK18ZK5WjU8vjYeNgql2CZE5qgF3Z3pSnhne3cFccsqG
 CauzJzXk0QvDr0gSheUosi2umDXFzVL6O5cDNGZSDUSHL6afbj1hHRqk2bW181jvkEKH
 MxMqAKRps/fjOgC1YQY7vsq+zL0JNsV3CqR0DR6HwyBTe+VTu4UNBnF+1wQTHAx4sRXA
 RKaigv0raqaf+qhKSnL0BH6HLb3o89LUWik30F5G3Fic/4Am1AxKzfH0mxM0/4isypY+
 LRoAVv1YYA0INgqtnaJ0fOYERFSxyatn+OfGnvTR7XRKbXRmOrI0w66uTErvn6Y3pNMN
 y6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084269; x=1780689069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sWnhuAA8R9T9RYOGxNIaIDGmYbKBGKM0uEReh2pp44c=;
 b=mzJethnrHTvbLbHKPRvcXkrNfg2SpJMfYVM1joJNx+ozHueHTTisaTzjCM6LyhfBet
 whapWhh0HaqJNrTeVn0gUON3PCvENcr4Rzz8DJnAmr+7Gj93korwSsYJLptfAG9tbQOU
 lcyeg+gv5tMtS+nJcnDdr1GMDsrj3anUbzs6bltSycvGYXa/wEuN2k9tH7YMgzf36D8b
 lznJwLY6ImFI49ozrPR5cVJeWEgnCxFeSevOGX+HrOT1Erh7fcREUihCbb6SVYU/E+Ld
 IMK6a9wzUwMK9ZC62xnwlQt73BL+KY3qZVJr9fF1vf2TRGqZevFqyqLUOASxGjCu0jfp
 yMAA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Ox8d3LKHkUPcyGd+XKCsAGz9Q3taRMbesvQunliT+NBcRJCkBhdaU3MCOOXumESBkXDH7ny9KQQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz5m98b7sItFH1L12+HetCqAFRJlcMoYw7ru3cLUHnZCb5O0NJ8
 35udeMiUamhtzurcEq3GZDj6jNVL65uIuKU5WZTliI1hWgGT/LR6tsnYCtilTMfsY5o=
X-Gm-Gg: Acq92OEQSB31Oa4209HH/FKJrDB7yXoWHe4OrUwbmPtTzlDROwzh21h4eLaB5cZ6o4v
 tRl9Ri3NN2t5uswgZ516RdUOVjeGN+LLFMUCMPy8wEKk9ydgfUr4sQuOyI2MuupkopLafaRbJ4N
 0iu4zUPoGsLTMww7pDex+pbNR1yhv/UJvorbcL3yk5Ob44Lg3ISsj7MB8KozUPZZkA9eKA5/yuZ
 CKZITqr8lLN6WJLWmsmiYv/NUn+ys4bCYH6QNH2o4zYJ/g6LRUmJxPVvkHZcGJOUOs4ND6Aac7N
 ibi1cDTbZo3InOFFhKxtjJqrSpKf4Fzkjr0aoSru4swIzE8wQX7k3g8QA8H5EQLmAeayJKI6sSA
 /hC5yXGFjFTtxm9NQjRnqbUFGufepzWQ55E7fVKhG5aMvcPuXvjscdK9fn25RmeTjMsmE7LD2GR
 NnmCHVRz1cRVvhzDv4Xs3/5fKxmkXVdvIOdvOD0rxAF16gld9YzsmqLCY5JX56KBljVQ==
X-Received: by 2002:a05:6000:4610:b0:45e:db3b:921d with SMTP id
 ffacd0b85a97d-45ef6b67882mr2410650f8f.31.1780084269413; 
 Fri, 29 May 2026 12:51:09 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef35601d7sm8034142f8f.28.2026.05.29.12.51.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 12:51:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, David Hildenbrand <david@kernel.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anton Johansson <anjo@rev.ng>, Claudio Fontana <cfontana@suse.de>,
 Eric Farman <farman@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Reinoud Zandijk <reinoud@netbsd.org>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/17] accel/kvm: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
Date: Fri, 29 May 2026 21:49:32 +0200
Message-ID: <20260529194940.97143-11-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
References: <20260529194940.97143-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Expose kvm_arch_cpu_instance_init() and register it as generic
AccelOpsClass::cpu_instance_init hook.

Both X86 / RISCV's ACCEL_CPU_NAME("kvm") TypeInfo are now empty,
remove them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 include/system/kvm.h       |  1 +
 accel/kvm/kvm-accel-ops.c  |  1 +
 target/arm/kvm.c           |  4 ++++
 target/i386/kvm/kvm-cpu.c  | 22 +---------------------
 target/loongarch/kvm/kvm.c |  4 ++++
 target/ppc/kvm.c           |  4 ++++
 target/riscv/kvm/kvm-cpu.c | 23 +----------------------
 target/s390x/kvm/kvm.c     |  4 ++++
 8 files changed, 20 insertions(+), 43 deletions(-)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index cb077d6d863..a249f076763 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -223,6 +223,7 @@ void kvm_irqchip_add_change_notifier(Notifier *n);
 void kvm_irqchip_remove_change_notifier(Notifier *n);
 void kvm_irqchip_change_notify(void);
 
+void kvm_arch_cpu_instance_init(CPUState *cpu);
 bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp);
 
 #ifdef COMPILING_PER_TARGET
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 4e7e3039208..edad3c1acea 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -97,6 +97,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, const void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = kvm_start_vcpu_thread;
+    ops->cpu_instance_init = kvm_arch_cpu_instance_init;
     ops->cpu_realize = kvm_arch_cpu_realize;
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
     ops->cpus_are_resettable = kvm_cpus_are_resettable;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 22bd924a399..0f1a98b430f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1783,6 +1783,10 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
         "Eager Page Split chunk size for hugepages. (default: 0, disabled)");
 }
 
+void kvm_arch_cpu_instance_init(CPUState *cpu)
+{
+}
+
 bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp)
 {
     return true;
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 36634ec8929..6d93b50248c 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -16,7 +16,6 @@
 #include "hw/i386/x86.h"
 
 #include "kvm_i386.h"
-#include "accel/accel-cpu-target.h"
 
 static void kvm_set_guest_phys_bits(CPUState *cs)
 {
@@ -207,7 +206,7 @@ static void x86_cpu_change_kvm_default(const char *prop, const char *value)
     assert(pv->prop);
 }
 
-static void kvm_cpu_instance_init(CPUState *cs)
+void kvm_arch_cpu_instance_init(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
@@ -232,22 +231,3 @@ static void kvm_cpu_instance_init(CPUState *cs)
 
     kvm_cpu_xsave_init();
 }
-
-static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-    acc->cpu_instance_init = kvm_cpu_instance_init;
-}
-static const TypeInfo kvm_cpu_accel_type_info = {
-    .name = ACCEL_CPU_NAME("kvm"),
-
-    .parent = TYPE_ACCEL_CPU,
-    .class_init = kvm_cpu_accel_class_init,
-    .abstract = true,
-};
-static void kvm_cpu_accel_register_types(void)
-{
-    type_register_static(&kvm_cpu_accel_type_info);
-}
-type_init(kvm_cpu_accel_register_types);
diff --git a/target/loongarch/kvm/kvm.c b/target/loongarch/kvm/kvm.c
index ec4c05006c6..167fdd515be 100644
--- a/target/loongarch/kvm/kvm.c
+++ b/target/loongarch/kvm/kvm.c
@@ -1496,6 +1496,10 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
 {
 }
 
+void kvm_arch_cpu_instance_init(CPUState *cpu)
+{
+}
+
 bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp)
 {
     return true;
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 013f5e852e1..894962d509f 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2352,6 +2352,10 @@ static void alter_insns(uint64_t *word, uint64_t flags, bool on)
     }
 }
 
+void kvm_arch_cpu_instance_init(CPUState *cpu)
+{
+}
+
 bool kvm_arch_cpu_realize(CPUState *cs, Error **errp)
 {
     int ret;
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 7c4440d0025..b8e08d810a8 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -32,7 +32,6 @@
 #include "system/kvm_int.h"
 #include "cpu.h"
 #include "trace.h"
-#include "accel/accel-cpu-target.h"
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "system/address-spaces.h"
@@ -1981,7 +1980,7 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
     kvm_msi_via_irqfd_allowed = true;
 }
 
-static void kvm_cpu_instance_init(CPUState *cs)
+void kvm_arch_cpu_instance_init(CPUState *cs)
 {
     Object *obj = OBJECT(RISCV_CPU(cs));
 
@@ -2108,26 +2107,6 @@ void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
 }
 
-static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-    acc->cpu_instance_init = kvm_cpu_instance_init;
-}
-
-static const TypeInfo kvm_cpu_accel_type_info = {
-    .name = ACCEL_CPU_NAME("kvm"),
-
-    .parent = TYPE_ACCEL_CPU,
-    .class_init = kvm_cpu_accel_class_init,
-    .abstract = true,
-};
-static void kvm_cpu_accel_register_types(void)
-{
-    type_register_static(&kvm_cpu_accel_type_info);
-}
-type_init(kvm_cpu_accel_register_types);
-
 static const TypeInfo riscv_kvm_cpu_type_infos[] = {
     {
         .name = TYPE_RISCV_CPU_HOST,
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 1c259652925..46730e72a92 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2612,6 +2612,10 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
 {
 }
 
+void kvm_arch_cpu_instance_init(CPUState *cpu)
+{
+}
+
 bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp)
 {
     return true;
-- 
2.53.0


