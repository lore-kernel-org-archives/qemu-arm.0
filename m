Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4621D4922D
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Dec 2025 15:10:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vU4hQ-0001w1-6k; Fri, 12 Dec 2025 10:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1vU4hN-0001sG-0t
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 10:04:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1vU4hI-0005f3-SH
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 10:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765551884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjEcZQ1uHJTqefFeQEkw1uWuzKF1uPikpHMJbHt4BwE=;
 b=PlDPbPAUF9yN71VT36c37mAG3bP6JgWzMCfjWXShkbgBq4ctJWqkW4cL6WYAIFolSvznMU
 OOEbc42taqiRaoN5xZ+sCKwBZ6NEdCSCDfwLkKi5bZLzhmVISLqaKewHfjzIDXQ6Asjoeq
 unM3GiTW4/zHuvPYmhzNov0viI+zbKQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-rH_qkXS7P2GZAdgLxH0xfg-1; Fri, 12 Dec 2025 10:04:42 -0500
X-MC-Unique: rH_qkXS7P2GZAdgLxH0xfg-1
X-Mimecast-MFC-AGG-ID: rH_qkXS7P2GZAdgLxH0xfg_1765551882
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-299ddb0269eso17013035ad.0
 for <qemu-arm@nongnu.org>; Fri, 12 Dec 2025 07:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765551881; x=1766156681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PjEcZQ1uHJTqefFeQEkw1uWuzKF1uPikpHMJbHt4BwE=;
 b=cpNhOYV/8hiPKybEnyivbFIp5pOUYdhM3DO7ink98HnAxMsi8Iz2miul8iu8Wd8EGg
 RJWEvCh7xtNn4pDGiu4HfVRauE27JzjE9saDjNo/7FCD5xVnu4UwwescNjVQ+cotpwgM
 NKK1VI3quNLBOLX9/oIU0oT4o05ZJvac62BsJwDmHjOJu6Y6rzXvI8rMVe6XQXg60475
 FrtZVcyeREbbdCYd2VFATfVvEM1uc8fBe6NlQnvdQb8NnkAF+71tmApBF54A7m9QhPWL
 waEWNTpl8mPIIdnVzWYDSbglJhCAu4wJoZZ6y0/WKKAha3UKQXqQcomjfar/mtM3R6jL
 kuww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEWQoL1/PCU7jPRP65A6v2NAGjxFxV///4TFIDlx8E89GNnOqWA66mKAZ/F8lY2BLqmxbjsBnQTA==@nongnu.org
X-Gm-Message-State: AOJu0YwD5WBo6zS0Zt5UY047by48IrWZT/zj8Z+D4MK/DavUueBnuejT
 8AhQ30h3Fl0+Sgp2gJCHiOf98WWsCg1NUrkcYfVQvCifT5OqlUDq4NenlQFMC6wsR7jg+f+YMfh
 4TOOBPeNfsaG/drJ8yxk7j/UhnEmIQ6ufpLOpLWAgYnvc9Ztm3rq/7w==
X-Gm-Gg: AY/fxX6D4Z3aDasT+yKAXGlabzR8A65DY0kN433YQva+/9P8oR5vsKuqAMbfTYwnkPF
 venVrf1Snohi2JPLmK2aGTNKfayjIxiE1VWh+xzvYkJ5i7DKLT1o57uuBI4JqFke7uatBo6n4Dg
 pPX64FTKX5gRb9acg7ScMHjtf2qrPQs4/GFdbUVcp7YPagZGDaMfuxaPqKQcXZJjihhvdTK6ZYH
 8FEyVX2KUzgKlSYvmsBZUzHZhdGzeJep47LED4VlVCRPdbb7DNuP5ZxAoJchKGuV3r7Q9adESSZ
 mAP10aYtIHOiQY3xJ8tKARIiFINfYxdz5WfT9MNoxDbXgE0KpC2pKXXDLnNXtMB4Ea3GwIZfw+u
 23kG95TalvvR7FP0cqmE9KRrIIl8x7SRgRJOO7wDcPhc=
X-Received: by 2002:a17:903:230a:b0:2a0:81c1:6194 with SMTP id
 d9443c01a7336-2a081c16442mr6958365ad.47.1765551881160; 
 Fri, 12 Dec 2025 07:04:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8yblFgCzrr9m/ubmrYBSTPLesJuI39hqhYZI5/jPqA3lpx4dP+VaBeRXVg2kOQXvwTndbgA==
X-Received: by 2002:a17:903:230a:b0:2a0:81c1:6194 with SMTP id
 d9443c01a7336-2a081c16442mr6957515ad.47.1765551880158; 
 Fri, 12 Dec 2025 07:04:40 -0800 (PST)
Received: from rhel9-box.lan ([122.172.173.62])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-29ee9d38ad1sm57046655ad.29.2025.12.12.07.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 07:04:39 -0800 (PST)
From: Ani Sinha <anisinha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <thuth@redhat.com>
Cc: vkuznets@redhat.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v1 04/28] accel/kvm: add changes required to support KVM VM
 file descriptor change
Date: Fri, 12 Dec 2025 20:33:32 +0530
Message-ID: <20251212150359.548787-5-anisinha@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251212150359.548787-1-anisinha@redhat.com>
References: <20251212150359.548787-1-anisinha@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eNbGp76uxTFtDc3oZYeIkyQxYrRkFrYJRry6hbl8NkI_1765551882
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This change adds common kvm specific support to handle KVM VM file descriptor
change. KVM VM file descriptor can change as a part of confidential guest reset
mechanism. A new function api kvm_arch_vmfd_change_ops() per
architecture platform is added in order to implement architecture specific
changes required to support it. A subsequent patch will add x86 specific
implementation for kvm_arch_vmfd_change_ops as currently only x86 supports
confidential guest reset.

Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 accel/kvm/kvm-all.c        | 70 ++++++++++++++++++++++++++++++++++++--
 include/system/kvm.h       |  1 +
 target/arm/kvm.c           |  5 +++
 target/i386/kvm/kvm.c      |  5 +++
 target/loongarch/kvm/kvm.c |  5 +++
 target/mips/kvm.c          |  5 +++
 target/ppc/kvm.c           |  5 +++
 target/riscv/kvm/kvm-cpu.c |  5 +++
 target/s390x/kvm/kvm.c     |  5 +++
 9 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 28006d73c5..c9564bf681 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2415,11 +2415,9 @@ void kvm_irqchip_set_qemuirq_gsi(KVMState *s, qemu_irq irq, int gsi)
     g_hash_table_insert(s->gsimap, irq, GINT_TO_POINTER(gsi));
 }
 
-static void kvm_irqchip_create(KVMState *s)
+static void do_kvm_irqchip_create(KVMState *s)
 {
     int ret;
-
-    assert(s->kernel_irqchip_split != ON_OFF_AUTO_AUTO);
     if (kvm_check_extension(s, KVM_CAP_IRQCHIP)) {
         ;
     } else if (kvm_check_extension(s, KVM_CAP_S390_IRQCHIP)) {
@@ -2452,7 +2450,13 @@ static void kvm_irqchip_create(KVMState *s)
         fprintf(stderr, "Create kernel irqchip failed: %s\n", strerror(-ret));
         exit(1);
     }
+}
 
+static void kvm_irqchip_create(KVMState *s)
+{
+    assert(s->kernel_irqchip_split != ON_OFF_AUTO_AUTO);
+
+    do_kvm_irqchip_create(s);
     kvm_kernel_irqchip = true;
     /* If we have an in-kernel IRQ chip then we must have asynchronous
      * interrupt delivery (though the reverse is not necessarily true)
@@ -2607,6 +2611,65 @@ static int kvm_setup_dirty_ring(KVMState *s)
     return 0;
 }
 
+static int kvm_reset_vmfd(MachineState *ms)
+{
+    KVMState *s;
+    KVMMemoryListener *kml;
+    int ret, type;
+    Error *err = NULL;
+
+    s = KVM_STATE(ms->accelerator);
+    kml = &s->memory_listener;
+
+    memory_listener_unregister(&kml->listener);
+    memory_listener_unregister(&kvm_io_listener);
+
+    if (s->vmfd >= 0) {
+        close(s->vmfd);
+    }
+
+    type = find_kvm_machine_type(ms);
+    if (type < 0) {
+        return -EINVAL;
+    }
+
+    ret = do_kvm_create_vm(s, type);
+    if (ret < 0) {
+        return ret;
+    }
+
+    s->vmfd = ret;
+
+    kvm_setup_dirty_ring(s);
+
+    /* rebind memory to new vm fd */
+    ret = ram_block_rebind(&err);
+    if (ret < 0) {
+        return ret;
+    }
+    assert(!err);
+
+    ret = kvm_arch_vmfd_change_ops(ms, s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (s->kernel_irqchip_allowed) {
+        do_kvm_irqchip_create(s);
+    }
+
+    /* these can be only called after ram_block_rebind() */
+    memory_listener_register(&kml->listener, &address_space_memory);
+    memory_listener_register(&kvm_io_listener, &address_space_io);
+
+    /*
+     * kvm fd has changed. Commit the irq routes to KVM once more.
+     */
+    kvm_irqchip_commit_routes(s);
+
+    return ret;
+}
+
 static int kvm_init(AccelState *as, MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
@@ -4014,6 +4077,7 @@ static void kvm_accel_class_init(ObjectClass *oc, const void *data)
     AccelClass *ac = ACCEL_CLASS(oc);
     ac->name = "KVM";
     ac->init_machine = kvm_init;
+    ac->reset_vmfd = kvm_reset_vmfd;
     ac->has_memory = kvm_accel_has_memory;
     ac->allowed = &kvm_allowed;
     ac->gdbstub_supported_sstep_flags = kvm_gdbstub_sstep_flags;
diff --git a/include/system/kvm.h b/include/system/kvm.h
index 8f9eecf044..ade13dd8cc 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -358,6 +358,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s);
 int kvm_arch_pre_create_vcpu(CPUState *cpu, Error **errp);
 int kvm_arch_init_vcpu(CPUState *cpu);
 int kvm_arch_destroy_vcpu(CPUState *cpu);
+int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s);
 
 #ifdef TARGET_KVM_HAVE_RESET_PARKED_VCPU
 void kvm_arch_reset_parked_vcpu(unsigned long vcpu_id, int kvm_fd);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 0d57081e69..919bf95ae1 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1568,6 +1568,11 @@ void kvm_arch_init_irq_routing(KVMState *s)
 {
 }
 
+int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
+{
+    abort();
+}
+
 int kvm_arch_irqchip_create(KVMState *s)
 {
     if (kvm_kernel_irqchip_split()) {
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 02819de625..cdfcb70f40 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3252,6 +3252,11 @@ static int kvm_vm_enable_energy_msrs(KVMState *s)
     return 0;
 }
 
+int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
+{
+    abort();
+}
+
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     int ret;
diff --git a/target/loongarch/kvm/kvm.c b/target/loongarch/kvm/kvm.c
index 26e40c9bdc..4171781346 100644
--- a/target/loongarch/kvm/kvm.c
+++ b/target/loongarch/kvm/kvm.c
@@ -1312,6 +1312,11 @@ int kvm_arch_irqchip_create(KVMState *s)
     return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
+int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
+{
+    return 0;
+}
+
 void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
 {
 }
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 912cd5dfa0..28730da06b 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -44,6 +44,11 @@ unsigned long kvm_arch_vcpu_id(CPUState *cs)
     return cs->cpu_index;
 }
 
+int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
+{
+    return 0;
+}
+
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     /* MIPS has 128 signals */
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 43124bf1c7..a48dc7670b 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -180,6 +180,11 @@ int kvm_arch_irqchip_create(KVMState *s)
     return 0;
 }
 
+int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
+{
+    return 0;
+}
+
 static int kvm_arch_sync_sregs(PowerPCCPU *cpu)
 {
     CPUPPCState *cenv = &cpu->env;
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 47e672c7aa..ca384a8b85 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1545,6 +1545,11 @@ int kvm_arch_irqchip_create(KVMState *s)
     return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
+int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
+{
+    return 0;
+}
+
 int kvm_arch_process_async_events(CPUState *cs)
 {
     return 0;
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 916dac1f14..671c854634 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -393,6 +393,11 @@ int kvm_arch_irqchip_create(KVMState *s)
     return 0;
 }
 
+int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
+{
+    return 0;
+}
+
 unsigned long kvm_arch_vcpu_id(CPUState *cpu)
 {
     return cpu->cpu_index;
-- 
2.42.0


