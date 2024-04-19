Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2497922ejd;
        Fri, 19 Apr 2024 08:59:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUO4sD7ux3e7+J0Q5YsRZGSl6Te1UX6r5akR72puo+UXz+hB7HApVahDgCmVeHSoe0swL1aUjB31PLkyGInHNKMe7yJYhiC
X-Received: by 2002:a5d:64ef:0:b0:34a:5d59:5529 with SMTP id g15-20020a5d64ef000000b0034a5d595529mr1855137wri.5.1713542388376;
        Fri, 19 Apr 2024 08:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542388; cv=none;
        d=google.com; s=arc-20160816;
        b=alrhTtkNlVh+VZE72ugPFffz82dIpqFRi2z9RIYPJ6T8KjfQ58LtXGOj0yufHgmL4d
         gl9Mg1ouggCjkARA3e+TJ+lLS6Cz3wOUFCcmC9vwaoYcPOiQMQSjad14TTTEEifmCDoO
         XVFcWa83o2EEMranTsGpgNFgXQBLt0ePPsp8hKy+lGX9tP1gbF+82+MX2aDp98VmnMfm
         dIMI5QfgsNtyehqDJ4CknnOeuPrS7oKRi3CqTW/6W3lEbiT7ClklkMrjf4Dj7QxJXQec
         ilIeTMFJTzL/81Dp83+Me+kUdELu+yhbrTvkqNsv3Wjhlv4eVJ3HqVcKDQ3KzeK30297
         ft0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3wrHOYCEoMGT4WcYp0zjIsKj2FGGrD9J0aabeQrS3SU=;
        fh=gF5T87arFc082o60V0QFWXSCxQWDKyYd+mP1aRMfr8U=;
        b=CaF26b/Csv6jqUSy3mBu6VdKaTl7cozVCBIjsTAP5Pa7YtmV52zmllwAk7bZDBtQND
         40+qMTKaKerAe8rBsYIJdQGfa58WTpXGosz/Bv6VdP8fq9iSNVpXsID3VI2JUX2wZh24
         F4twGKzqyPXraQiTrm96ZLOdwmYGb5j+gOKf2cXGdhgSC2lbj2KB6YEImAm831Yil5/5
         tV9lKVXgqelJ6xPlBJ2U4YYRx9m9Vz77TB5FfSP9LT30uOFpkDwPOZqNs+236KlfCCvc
         bolu/9l5se2U7h72BhUyAyRXQgit2NBtZkwy7sEtzTdRfUGq/ZZt3gXE2QPHWhdVfuJa
         E8vA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mc7XYM+J;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s17-20020adf9791000000b0034a2d4eb18fsor970053wrb.2.2024.04.19.08.59.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mc7XYM+J;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542388; x=1714147188; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wrHOYCEoMGT4WcYp0zjIsKj2FGGrD9J0aabeQrS3SU=;
        b=mc7XYM+JbLB+xWLIKXp0De4Sl+L4WqrR2CpMmfSR+IPcf7rHvhhEpubdIP/u1X3Qkb
         GbQ9vq7QZTqMaCmAfItuLoBRUWkyYF0ehy80xVJbPjOcoykV1lodIp9OkWNAZUEYnyMB
         vu79iesIjpVJrR+x2vo0PimaAYnNNITzQU0DuwFbE/OpdSQTeWZSGdlhNILmsdeRt8+u
         T7GdyG6d3hy30epfkDnNuOSBWFbTAtQ7hGb2NzlF1hjkyNQc42TjMPYMS7EHnfAUu6UU
         M2RCO9RDxnfRBEC04UqadYM4OkUVNDrPphkFKKyKmjI4Yr2LF/xUO9LwHCStcwmJ8ZHi
         KToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542388; x=1714147188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wrHOYCEoMGT4WcYp0zjIsKj2FGGrD9J0aabeQrS3SU=;
        b=r5RsYDKRPmA16Uxg8Q4Ap6PjhKA4+OR7T3foYoN2aUWASZeWpKjPCWHIxQlkGUZ/3P
         OLrIDtNZsWhYdVr09JXQ9VPM/cgTMs3H8syTp3alh4cG+4tQeDajiufWGPtu0CGgAkov
         T16K7yJ/+e/gov0Wj4pQVrrPkCiP8V/O8V5D9Eufp4hwPSQHYswse5/gNNptQA1PsmIw
         ubXsTGBjMEjCqdFSgXsRLSE8FIv0p0a73f1RkmQL/PwKA6J1lZwEHg65QgDQ4LCcge4s
         H3jE7Z65OtU/rGgH434LmvidQVLDO1e0nx1Uk3+LBLYlvTtZVjYPWCi8z2+Zu2kiHk4C
         tsbA==
X-Forwarded-Encrypted: i=1; AJvYcCVj7u5pTOppPC+7eZnv6h/BLnkBVe6LvH8wMRDl34HlU9JckwI7UudwoBzZiVyUEG2iMWdYhUuKZmLLzFF8Nuf31Wgt6D6V
X-Gm-Message-State: AOJu0YweT1gyPi4F9ZdqbPcU0ZsQUVK7XKhGjIMN95QOPuzuofJDo4F4
	6UyN+o2Gw1aFPZEavzk9E+GYzdDtv7xHtv3uMSpGjrkkoKooNARKl7hOItMiY94wJg==
X-Google-Smtp-Source: AGHT+IHDcMsXxcAZVeWUKvFqKY0Svioja3hq4fhWiLNT+5ZPHue90fMMx2tRczJ0lS2P7Ol7fEAtGw==
X-Received: by 2002:adf:f190:0:b0:33e:a5e1:eccc with SMTP id h16-20020adff190000000b0033ea5e1ecccmr1824323wro.68.1713542387673;
        Fri, 19 Apr 2024 08:59:47 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:47 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 01/22] kvm: Merge kvm_check_extension() and kvm_vm_check_extension()
Date: Fri, 19 Apr 2024 16:56:49 +0100
Message-ID: <20240419155709.318866-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WsABxqugzEL/

The KVM_CHECK_EXTENSION ioctl can be issued either on the global fd
(/dev/kvm), or on the VM fd obtained with KVM_CREATE_VM. For most
extensions, KVM returns the same value with either method, but for some
of them it can refine the returned value depending on the VM type. The
KVM documentation [1] advises to use the VM fd:

  Based on their initialization different VMs may have different
  capabilities. It is thus encouraged to use the vm ioctl to query for
  capabilities (available with KVM_CAP_CHECK_EXTENSION_VM on the vm fd)

Ongoing work on Arm confidential VMs confirms this, as some capabilities
become unavailable to confidential VMs, requiring changes in QEMU to use
kvm_vm_check_extension() instead of kvm_check_extension() [2]. Rather
than changing each check one by one, change kvm_check_extension() to
always issue the ioctl on the VM fd when available, and remove
kvm_vm_check_extension().

Fall back to the global fd when the VM check is unavailable:

* Ancient kernels do not support KVM_CHECK_EXTENSION on the VM fd, since
  it was added by commit 92b591a4c46b ("KVM: Allow KVM_CHECK_EXTENSION
  on the vm fd") in Linux 3.17 [3]. Support for Linux 3.16 ended in June
  2020, but there may still be old images around.

* A couple of calls must be issued before the VM fd is available, since
  they determine the VM type: KVM_CAP_MIPS_VZ and KVM_CAP_ARM_VM_IPA_SIZE

Does any user actually depend on the check being done on the global fd
instead of the VM fd?  I surveyed all cases where KVM presently returns
different values depending on the query method. Luckily QEMU already
calls kvm_vm_check_extension() for most of those. Only three of them are
ambiguous, because currently done on the global fd:

* KVM_CAP_MAX_VCPUS and KVM_CAP_MAX_VCPU_ID on Arm, changes value if the
  user requests a vGIC different from the default. But QEMU queries this
  before vGIC configuration, so the reported value will be the same.

* KVM_CAP_SW_TLB on PPC. When issued on the global fd, returns false if
  the kvm-hv module is loaded; when issued on the VM fd, returns false
  only if the VM type is HV instead of PR. If this returns false, then
  QEMU will fail to initialize a BOOKE206 MMU model.

  So this patch supposedly improves things, as it allows to run this
  type of vCPU even when both KVM modules are loaded.

* KVM_CAP_PPC_SECURE_GUEST. Similarly, doing this check on a VM fd
  refines the returned value, and ensures that SVM is actually
  supported. Since QEMU follows the check with kvm_vm_enable_cap(), this
  patch should only provide better error reporting.

[1] https://www.kernel.org/doc/html/latest/virt/kvm/api.html#kvm-check-extension
[2] https://lore.kernel.org/kvm/875ybi0ytc.fsf@redhat.com/
[3] https://github.com/torvalds/linux/commit/92b591a4c46b

Cc: Marcelo Tosatti <mtosatti@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-ppc@nongnu.org
Suggested-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1: https://lore.kernel.org/qemu-devel/20230421163822.839167-1-jean-philippe@linaro.org/
v1->v2: Initialize check_extension_vm using kvm_vm_ioctl() as suggested
---
 include/sysemu/kvm.h     |  2 --
 include/sysemu/kvm_int.h |  1 +
 accel/kvm/kvm-all.c      | 34 +++++++++++++++-------------------
 target/arm/kvm.c         |  2 +-
 target/i386/kvm/kvm.c    |  6 +++---
 target/ppc/kvm.c         | 36 ++++++++++++++++++------------------
 6 files changed, 38 insertions(+), 43 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index c6f34d4794..df97077434 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -404,8 +404,6 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cpu);
 
 int kvm_check_extension(KVMState *s, unsigned int extension);
 
-int kvm_vm_check_extension(KVMState *s, unsigned int extension);
-
 #define kvm_vm_enable_cap(s, capability, cap_flags, ...)             \
     ({                                                               \
         struct kvm_enable_cap cap = {                                \
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index cad763e240..fa4c9aeb96 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -123,6 +123,7 @@ struct KVMState
     uint16_t xen_gnttab_max_frames;
     uint16_t xen_evtchn_max_pirq;
     char *device;
+    bool check_extension_vm;
 };
 
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e08dd04164..3d9fbc8a98 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1128,7 +1128,11 @@ int kvm_check_extension(KVMState *s, unsigned int extension)
 {
     int ret;
 
-    ret = kvm_ioctl(s, KVM_CHECK_EXTENSION, extension);
+    if (!s->check_extension_vm) {
+        ret = kvm_ioctl(s, KVM_CHECK_EXTENSION, extension);
+    } else {
+        ret = kvm_vm_ioctl(s, KVM_CHECK_EXTENSION, extension);
+    }
     if (ret < 0) {
         ret = 0;
     }
@@ -1136,19 +1140,6 @@ int kvm_check_extension(KVMState *s, unsigned int extension)
     return ret;
 }
 
-int kvm_vm_check_extension(KVMState *s, unsigned int extension)
-{
-    int ret;
-
-    ret = kvm_vm_ioctl(s, KVM_CHECK_EXTENSION, extension);
-    if (ret < 0) {
-        /* VM wide version not implemented, use global one instead */
-        ret = kvm_check_extension(s, extension);
-    }
-
-    return ret;
-}
-
 /*
  * We track the poisoned pages to be able to:
  * - replace them on VM reset
@@ -1515,10 +1506,10 @@ static int kvm_dirty_ring_init(KVMState *s)
      * Read the max supported pages. Fall back to dirty logging mode
      * if the dirty ring isn't supported.
      */
-    ret = kvm_vm_check_extension(s, capability);
+    ret = kvm_check_extension(s, capability);
     if (ret <= 0) {
         capability = KVM_CAP_DIRTY_LOG_RING_ACQ_REL;
-        ret = kvm_vm_check_extension(s, capability);
+        ret = kvm_check_extension(s, capability);
     }
 
     if (ret <= 0) {
@@ -1541,7 +1532,7 @@ static int kvm_dirty_ring_init(KVMState *s)
     }
 
     /* Enable the backup bitmap if it is supported */
-    ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP);
+    ret = kvm_check_extension(s, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP);
     if (ret > 0) {
         ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP, 0);
         if (ret) {
@@ -2360,7 +2351,7 @@ static void kvm_irqchip_create(KVMState *s)
  */
 static int kvm_recommended_vcpus(KVMState *s)
 {
-    int ret = kvm_vm_check_extension(s, KVM_CAP_NR_VCPUS);
+    int ret = kvm_check_extension(s, KVM_CAP_NR_VCPUS);
     return (ret) ? ret : 4;
 }
 
@@ -2526,6 +2517,11 @@ static int kvm_init(MachineState *ms)
 
     s->vmfd = ret;
 
+    ret = kvm_vm_ioctl(s, KVM_CHECK_EXTENSION, KVM_CAP_CHECK_EXTENSION_VM);
+    if (ret > 0) {
+        s->check_extension_vm = true;
+    }
+
     /* check the vcpu limits */
     soft_vcpus_limit = kvm_recommended_vcpus(s);
     hard_vcpus_limit = kvm_max_vcpus(s);
@@ -2668,7 +2664,7 @@ static int kvm_init(MachineState *ms)
     memory_listener_register(&kvm_io_listener,
                              &address_space_io);
 
-    s->sync_mmu = !!kvm_vm_check_extension(kvm_state, KVM_CAP_SYNC_MMU);
+    s->sync_mmu = !!kvm_check_extension(kvm_state, KVM_CAP_SYNC_MMU);
     if (!s->sync_mmu) {
         ret = ram_block_discard_disable(true);
         assert(!ret);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ab85d628a8..3371ffa401 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -582,7 +582,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     if (s->kvm_eager_split_size) {
         uint32_t sizes;
 
-        sizes = kvm_vm_check_extension(s, KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES);
+        sizes = kvm_check_extension(s, KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES);
         if (!sizes) {
             s->kvm_eager_split_size = 0;
             warn_report("Eager Page Split support not available");
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e68cbe9293..f16229d0a8 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -163,7 +163,7 @@ static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value);
 
 bool kvm_has_smm(void)
 {
-    return kvm_vm_check_extension(kvm_state, KVM_CAP_X86_SMM);
+    return kvm_check_extension(kvm_state, KVM_CAP_X86_SMM);
 }
 
 bool kvm_has_adjust_clock_stable(void)
@@ -2697,7 +2697,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
                 return ret;
             }
     }
-    if (kvm_vm_check_extension(s, KVM_CAP_X86_USER_SPACE_MSR)) {
+    if (kvm_check_extension(s, KVM_CAP_X86_USER_SPACE_MSR)) {
         bool r;
 
         ret = kvm_vm_enable_cap(s, KVM_CAP_X86_USER_SPACE_MSR, 0,
@@ -5236,7 +5236,7 @@ static bool __kvm_enable_sgx_provisioning(KVMState *s)
 {
     int fd, ret;
 
-    if (!kvm_vm_check_extension(s, KVM_CAP_SGX_ATTRIBUTE)) {
+    if (!kvm_check_extension(s, KVM_CAP_SGX_ATTRIBUTE)) {
         return false;
     }
 
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 8231feb2d4..0699030a6f 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -101,7 +101,7 @@ static uint32_t debug_inst_opcode;
 static bool kvmppc_is_pr(KVMState *ks)
 {
     /* Assume KVM-PR if the GET_PVINFO capability is available */
-    return kvm_vm_check_extension(ks, KVM_CAP_PPC_GET_PVINFO) != 0;
+    return kvm_check_extension(ks, KVM_CAP_PPC_GET_PVINFO) != 0;
 }
 
 static int kvm_ppc_register_host_cpu_type(void);
@@ -118,11 +118,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_interrupt_unset = kvm_check_extension(s, KVM_CAP_PPC_UNSET_IRQ);
     cap_segstate = kvm_check_extension(s, KVM_CAP_PPC_SEGSTATE);
     cap_booke_sregs = kvm_check_extension(s, KVM_CAP_PPC_BOOKE_SREGS);
-    cap_ppc_smt_possible = kvm_vm_check_extension(s, KVM_CAP_PPC_SMT_POSSIBLE);
+    cap_ppc_smt_possible = kvm_check_extension(s, KVM_CAP_PPC_SMT_POSSIBLE);
     cap_spapr_tce = kvm_check_extension(s, KVM_CAP_SPAPR_TCE);
     cap_spapr_tce_64 = kvm_check_extension(s, KVM_CAP_SPAPR_TCE_64);
     cap_spapr_multitce = kvm_check_extension(s, KVM_CAP_SPAPR_MULTITCE);
-    cap_spapr_vfio = kvm_vm_check_extension(s, KVM_CAP_SPAPR_TCE_VFIO);
+    cap_spapr_vfio = kvm_check_extension(s, KVM_CAP_SPAPR_TCE_VFIO);
     cap_one_reg = kvm_check_extension(s, KVM_CAP_ONE_REG);
     cap_hior = kvm_check_extension(s, KVM_CAP_PPC_HIOR);
     cap_epr = kvm_check_extension(s, KVM_CAP_PPC_EPR);
@@ -131,23 +131,23 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
      * Note: we don't set cap_papr here, because this capability is
      * only activated after this by kvmppc_set_papr()
      */
-    cap_htab_fd = kvm_vm_check_extension(s, KVM_CAP_PPC_HTAB_FD);
+    cap_htab_fd = kvm_check_extension(s, KVM_CAP_PPC_HTAB_FD);
     cap_fixup_hcalls = kvm_check_extension(s, KVM_CAP_PPC_FIXUP_HCALL);
-    cap_ppc_smt = kvm_vm_check_extension(s, KVM_CAP_PPC_SMT);
-    cap_htm = kvm_vm_check_extension(s, KVM_CAP_PPC_HTM);
-    cap_mmu_radix = kvm_vm_check_extension(s, KVM_CAP_PPC_MMU_RADIX);
-    cap_mmu_hash_v3 = kvm_vm_check_extension(s, KVM_CAP_PPC_MMU_HASH_V3);
-    cap_xive = kvm_vm_check_extension(s, KVM_CAP_PPC_IRQ_XIVE);
-    cap_resize_hpt = kvm_vm_check_extension(s, KVM_CAP_SPAPR_RESIZE_HPT);
+    cap_ppc_smt = kvm_check_extension(s, KVM_CAP_PPC_SMT);
+    cap_htm = kvm_check_extension(s, KVM_CAP_PPC_HTM);
+    cap_mmu_radix = kvm_check_extension(s, KVM_CAP_PPC_MMU_RADIX);
+    cap_mmu_hash_v3 = kvm_check_extension(s, KVM_CAP_PPC_MMU_HASH_V3);
+    cap_xive = kvm_check_extension(s, KVM_CAP_PPC_IRQ_XIVE);
+    cap_resize_hpt = kvm_check_extension(s, KVM_CAP_SPAPR_RESIZE_HPT);
     kvmppc_get_cpu_characteristics(s);
-    cap_ppc_nested_kvm_hv = kvm_vm_check_extension(s, KVM_CAP_PPC_NESTED_HV);
+    cap_ppc_nested_kvm_hv = kvm_check_extension(s, KVM_CAP_PPC_NESTED_HV);
     cap_large_decr = kvmppc_get_dec_bits();
-    cap_fwnmi = kvm_vm_check_extension(s, KVM_CAP_PPC_FWNMI);
+    cap_fwnmi = kvm_check_extension(s, KVM_CAP_PPC_FWNMI);
     /*
      * Note: setting it to false because there is not such capability
      * in KVM at this moment.
      *
-     * TODO: call kvm_vm_check_extension() with the right capability
+     * TODO: call kvm_check_extension() with the right capability
      * after the kernel starts implementing it.
      */
     cap_ppc_pvr_compat = false;
@@ -157,8 +157,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         exit(1);
     }
 
-    cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
-    cap_ail_mode_3 = kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MODE_3);
+    cap_rpt_invalidate = kvm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
+    cap_ail_mode_3 = kvm_check_extension(s, KVM_CAP_PPC_AIL_MODE_3);
     kvm_ppc_register_host_cpu_type();
 
     return 0;
@@ -1969,7 +1969,7 @@ static int kvmppc_get_pvinfo(CPUPPCState *env, struct kvm_ppc_pvinfo *pvinfo)
 {
     CPUState *cs = env_cpu(env);
 
-    if (kvm_vm_check_extension(cs->kvm_state, KVM_CAP_PPC_GET_PVINFO) &&
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_PPC_GET_PVINFO) &&
         !kvm_vm_ioctl(cs->kvm_state, KVM_PPC_GET_PVINFO, pvinfo)) {
         return 0;
     }
@@ -2289,7 +2289,7 @@ int kvmppc_reset_htab(int shift_hint)
         /* Full emulation, tell caller to allocate htab itself */
         return 0;
     }
-    if (kvm_vm_check_extension(kvm_state, KVM_CAP_PPC_ALLOC_HTAB)) {
+    if (kvm_check_extension(kvm_state, KVM_CAP_PPC_ALLOC_HTAB)) {
         int ret;
         ret = kvm_vm_ioctl(kvm_state, KVM_PPC_ALLOCATE_HTAB, &shift);
         if (ret == -ENOTTY) {
@@ -2474,7 +2474,7 @@ static void kvmppc_get_cpu_characteristics(KVMState *s)
     cap_ppc_safe_bounds_check = 0;
     cap_ppc_safe_indirect_branch = 0;
 
-    ret = kvm_vm_check_extension(s, KVM_CAP_PPC_GET_CPU_CHAR);
+    ret = kvm_check_extension(s, KVM_CAP_PPC_GET_CPU_CHAR);
     if (!ret) {
         return;
     }
-- 
2.44.0
