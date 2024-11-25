Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569230njc;
        Mon, 25 Nov 2024 11:59:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYpkArg1FIbqzuAwKqfwVcpemYd9GLiru9ei5Ki5S9wOeAYcIY14MSbjXA4omB491jUY2FymS6FMg0Eg==@linaro.org
X-Received: by 2002:a5d:47ad:0:b0:382:359f:5333 with SMTP id ffacd0b85a97d-38260b690bfmr9946166f8f.22.1732564765755;
        Mon, 25 Nov 2024 11:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564765; cv=none;
        d=google.com; s=arc-20240605;
        b=F1HliiGqyIWJXzlG2AcN88UalzpA6TyPPC83qK7oGOoyAHT7fVPVy/lCXaoGfUPmTM
         ZGLEzkOlwBjSWpr8ivUnx3cgHexgrH/xv+TgEzTaTJ63T3/lU+pTHASWZ4x89MTtLuuJ
         smmGshfpYuxvQoYpFXnF/1ilzYZgaA7iNttWfvz3NhGiG+qiW3s5eeBLiKdfFd5zwUip
         al2fTh/YhkaDPP8q24E9DRpnF44uFT3h7BKPQoAVUWVqMRHQDePAKeM84dBn0GUi34qi
         gPQyfVcwUrx+NiLuLg/ar+fEM2mKfz5Adw/N0DvAL/b3RMDy+k2uEZWuCfFW3iBWR+2+
         dDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lPWuRq4ZMsQxJVcTsJdLWctdtR5b8av26RnGMZkAnrQ=;
        fh=sx63HYNBJG9UfWBtPM+bDEqEylr6tiJiFCvsn/M9t2Q=;
        b=hH/Bz8eR4uq55hteytyQNBt6WALqKXGHrsUC4XG+t1719nAFj4+kONa0dE/u/VuF+i
         R+ij6xxLQth9hCX/dN4CzECJ8He0MlIvOx9DecrV8G69f/jZq5a/iqQ0pis1jAG0vtnn
         TuNfcFVyBcnCpioZjJAevXO77ORNl5zclhLUf7sX8G7IlKm03nOZ33RAWGIp/fQnDiNo
         wH8OB2LjfZqrBGKtiO917xL1Dz3JbDehpNxso7xusM6LtIWBn9WRUxqTFaxI8UEZhjJr
         2TlF/jojG0/39C8Si5TsJoiwvMegfSKzvceMl8fJxHauzPZp1dWYVfssH2trmoED6Gv4
         MEUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQaIeXZU;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-433cd7e5e81sor42128635e9.4.2024.11.25.11.59.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:25 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQaIeXZU;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564765; x=1733169565; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPWuRq4ZMsQxJVcTsJdLWctdtR5b8av26RnGMZkAnrQ=;
        b=WQaIeXZUAXiVi2EoLtnQ6pmg9EpzsTllokLlmhbtvsyiIKhdxJ5t7kMXvYh0+xlsXM
         DBxBFzeH+EJsS0jgttevA/JCeDO8+93p1DTDPeEeRqyaVDNfG4D9xccZpEIIAqyAumnn
         LQw9Mhij/xmWBa5bCUnTdY+kCiEHbTxMGQ97KKnBnJdg3Fx7xmpNTgXXORdAja1uL/gt
         UTJ1MWa8ulMSJkhKoatMhf0czQpq6r3LEOqJeOH8H4pWxEh0QBLtkGfQeUBF6KurV6vs
         Pr1hgyT7nRkQXo+uhWUuT7PD9HPEE2kl7T6jYXVd1KyZ6M0vISEEaq6rv6fDdDPkLeh+
         JudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564765; x=1733169565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPWuRq4ZMsQxJVcTsJdLWctdtR5b8av26RnGMZkAnrQ=;
        b=UuFdmbdF6m/T+sPtpD346DSrqyZCRlFP/j40pW817A1uXSFiLDTQlqt64EvlphbWPj
         NoN6sFoC3qGQor3qc2uD3P0FhkxW2HH/nr4PYPoDAQEDYGSB4Yaf6Ln5hSzTlRmXT9Vp
         sZpNJVPqzjDIwbhxgeAVASlptQTnpgHM9APZXd4jql/xF8/94RtuZdUCBi7T6TRC7ESF
         JutviCuh+5n3Rryro6wcsGzM8vHkUI1oW7zhRK29j6E2qJCuXZYNGAXOZnEwgfisnSdk
         qx90qrRYZNV2b2ByTspBHFYFyWlskWxYUpAWLNzkmg3K/Ej2yQ5+vMSEvvaCG2H0bDTn
         vsRw==
X-Forwarded-Encrypted: i=1; AJvYcCVeSMV5/aYnwMoMWIuqo9F1YSJgdwYGqLWrStg53qoMSvrU+yqJ6HbnHKzEGzUiY/6bCh772DytuO/ySQ==@linaro.org
X-Gm-Message-State: AOJu0YzmsL1Ceky2cYyh471UKqMlPIl1wQF6isy4ASr4KxbqPhWe/Mgd
	S+j+aEc8697jxQODnfzrjKp9+h76Ek+IG1RId8tpfLg18UQhq08w98zIl81ayXfbiw==
X-Gm-Gg: ASbGncunkScD9YK9dADZ3mZcrFk3d70NlIKl0yHW1Y8oZYp5SU5GJrJYOX2X2mEl0Ch
	6D/P/s3uPxQnPwWP1KT3sh2wG372bIVUpLqOZCGyDbsNdymhyEEPNUSCkkDf90xA47qo7ctW1rS
	YWZAybeFCIBrnXN6irqS0jmUKeIxZJCyH89WxQwWlWTWI71rnFnIHIlNt5DQ9eARaWA6T0hOaU9
	gbISVo7cS7Ttu8HXCl4km0H0ejOcWyNqMDSQvw6tezpFLAm1jWd/HDjWpcdtXbopqgb
X-Google-Smtp-Source: AGHT+IGlrn69zbFsAPm8N4oXGiZ1003KdIY3nIYvAHAfbGUJAyjEgBCTsF6eSMRF+mg0TiybTp9glA==
X-Received: by 2002:a05:6000:4026:b0:382:4f68:1f63 with SMTP id ffacd0b85a97d-38260b455cfmr12925648f8f.7.1732564765127;
        Mon, 25 Nov 2024 11:59:25 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:24 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 01/26] kvm: Merge kvm_check_extension() and kvm_vm_check_extension()
Date: Mon, 25 Nov 2024 19:56:00 +0000
Message-ID: <20241125195626.856992-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TJ+ez0x+B2+c

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
 include/sysemu/kvm.h     |  2 --
 include/sysemu/kvm_int.h |  1 +
 accel/kvm/kvm-all.c      | 41 +++++++++++++++++++---------------------
 target/arm/kvm.c         |  2 +-
 target/i386/kvm/kvm.c    |  6 +++---
 target/ppc/kvm.c         | 36 +++++++++++++++++------------------
 6 files changed, 42 insertions(+), 46 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index c3a60b2890..63c96d0096 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -437,8 +437,6 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cpu);
 
 int kvm_check_extension(KVMState *s, unsigned int extension);
 
-int kvm_vm_check_extension(KVMState *s, unsigned int extension);
-
 #define kvm_vm_enable_cap(s, capability, cap_flags, ...)             \
     ({                                                               \
         struct kvm_enable_cap cap = {                                \
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index a1e72763da..cb38085d54 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -166,6 +166,7 @@ struct KVMState
     uint16_t xen_gnttab_max_frames;
     uint16_t xen_evtchn_max_pirq;
     char *device;
+    bool check_extension_vm;
 };
 
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 801cff16a5..7ea016d598 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1238,7 +1238,11 @@ int kvm_check_extension(KVMState *s, unsigned int extension)
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
@@ -1246,19 +1250,6 @@ int kvm_check_extension(KVMState *s, unsigned int extension)
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
@@ -1622,10 +1613,10 @@ static int kvm_dirty_ring_init(KVMState *s)
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
@@ -1648,7 +1639,7 @@ static int kvm_dirty_ring_init(KVMState *s)
     }
 
     /* Enable the backup bitmap if it is supported */
-    ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP);
+    ret = kvm_check_extension(s, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP);
     if (ret > 0) {
         ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP, 0);
         if (ret) {
@@ -2404,7 +2395,7 @@ static void kvm_irqchip_create(KVMState *s)
  */
 static int kvm_recommended_vcpus(KVMState *s)
 {
-    int ret = kvm_vm_check_extension(s, KVM_CAP_NR_VCPUS);
+    int ret = kvm_check_extension(s, KVM_CAP_NR_VCPUS);
     return (ret) ? ret : 4;
 }
 
@@ -2625,7 +2616,12 @@ static int kvm_init(MachineState *ms)
 
     s->vmfd = ret;
 
-    s->nr_as = kvm_vm_check_extension(s, KVM_CAP_MULTI_ADDRESS_SPACE);
+    ret = kvm_vm_ioctl(s, KVM_CHECK_EXTENSION, KVM_CAP_CHECK_EXTENSION_VM);
+    if (ret > 0) {
+        s->check_extension_vm = true;
+    }
+
+    s->nr_as = kvm_check_extension(s, KVM_CAP_MULTI_ADDRESS_SPACE);
     if (s->nr_as <= 1) {
         s->nr_as = 1;
     }
@@ -2683,7 +2679,7 @@ static int kvm_init(MachineState *ms)
     }
 
     kvm_readonly_mem_allowed =
-        (kvm_vm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
+        (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
 
     kvm_resamplefds_allowed =
         (kvm_check_extension(s, KVM_CAP_IRQFD_RESAMPLE) > 0);
@@ -2717,7 +2713,8 @@ static int kvm_init(MachineState *ms)
         goto err;
     }
 
-    kvm_supported_memory_attributes = kvm_vm_check_extension(s, KVM_CAP_MEMORY_ATTRIBUTES);
+    kvm_supported_memory_attributes =
+        kvm_check_extension(s, KVM_CAP_MEMORY_ATTRIBUTES);
     kvm_guest_memfd_supported =
         kvm_check_extension(s, KVM_CAP_GUEST_MEMFD) &&
         kvm_check_extension(s, KVM_CAP_USER_MEMORY2) &&
@@ -2743,7 +2740,7 @@ static int kvm_init(MachineState *ms)
     memory_listener_register(&kvm_io_listener,
                              &address_space_io);
 
-    s->sync_mmu = !!kvm_vm_check_extension(kvm_state, KVM_CAP_SYNC_MMU);
+    s->sync_mmu = !!kvm_check_extension(kvm_state, KVM_CAP_SYNC_MMU);
     if (!s->sync_mmu) {
         ret = ram_block_discard_disable(true);
         assert(!ret);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7b6812c0de..8bdf4abeb6 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -601,7 +601,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     if (s->kvm_eager_split_size) {
         uint32_t sizes;
 
-        sizes = kvm_vm_check_extension(s, KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES);
+        sizes = kvm_check_extension(s, KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES);
         if (!sizes) {
             s->kvm_eager_split_size = 0;
             warn_report("Eager Page Split support not available");
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 8e17942c3b..2f35e7468c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -244,7 +244,7 @@ bool kvm_enable_hypercall(uint64_t enable_mask)
 
 bool kvm_has_smm(void)
 {
-    return kvm_vm_check_extension(kvm_state, KVM_CAP_X86_SMM);
+    return kvm_check_extension(kvm_state, KVM_CAP_X86_SMM);
 }
 
 bool kvm_has_adjust_clock_stable(void)
@@ -3320,7 +3320,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
-    if (kvm_vm_check_extension(s, KVM_CAP_X86_USER_SPACE_MSR)) {
+    if (kvm_check_extension(s, KVM_CAP_X86_USER_SPACE_MSR)) {
         ret = kvm_vm_enable_userspace_msr(s);
         if (ret < 0) {
             return ret;
@@ -5936,7 +5936,7 @@ static bool __kvm_enable_sgx_provisioning(KVMState *s)
 {
     int fd, ret;
 
-    if (!kvm_vm_check_extension(s, KVM_CAP_SGX_ATTRIBUTE)) {
+    if (!kvm_check_extension(s, KVM_CAP_SGX_ATTRIBUTE)) {
         return false;
     }
 
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 3efc28f18b..8bcb0368ce 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -110,7 +110,7 @@ static uint32_t debug_inst_opcode;
 static bool kvmppc_is_pr(KVMState *ks)
 {
     /* Assume KVM-PR if the GET_PVINFO capability is available */
-    return kvm_vm_check_extension(ks, KVM_CAP_PPC_GET_PVINFO) != 0;
+    return kvm_check_extension(ks, KVM_CAP_PPC_GET_PVINFO) != 0;
 }
 
 static int kvm_ppc_register_host_cpu_type(void);
@@ -127,11 +127,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
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
@@ -140,23 +140,23 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
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
@@ -166,8 +166,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         exit(1);
     }
 
-    cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
-    cap_ail_mode_3 = kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MODE_3);
+    cap_rpt_invalidate = kvm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
+    cap_ail_mode_3 = kvm_check_extension(s, KVM_CAP_PPC_AIL_MODE_3);
     kvm_ppc_register_host_cpu_type();
 
     return 0;
@@ -1976,7 +1976,7 @@ static int kvmppc_get_pvinfo(CPUPPCState *env, struct kvm_ppc_pvinfo *pvinfo)
 {
     CPUState *cs = env_cpu(env);
 
-    if (kvm_vm_check_extension(cs->kvm_state, KVM_CAP_PPC_GET_PVINFO) &&
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_PPC_GET_PVINFO) &&
         !kvm_vm_ioctl(cs->kvm_state, KVM_PPC_GET_PVINFO, pvinfo)) {
         return 0;
     }
@@ -2298,7 +2298,7 @@ int kvmppc_reset_htab(int shift_hint)
         /* Full emulation, tell caller to allocate htab itself */
         return 0;
     }
-    if (kvm_vm_check_extension(kvm_state, KVM_CAP_PPC_ALLOC_HTAB)) {
+    if (kvm_check_extension(kvm_state, KVM_CAP_PPC_ALLOC_HTAB)) {
         int ret;
         ret = kvm_vm_ioctl(kvm_state, KVM_PPC_ALLOCATE_HTAB, &shift);
         if (ret == -ENOTTY) {
@@ -2507,7 +2507,7 @@ static void kvmppc_get_cpu_characteristics(KVMState *s)
     cap_ppc_safe_bounds_check = 0;
     cap_ppc_safe_indirect_branch = 0;
 
-    ret = kvm_vm_check_extension(s, KVM_CAP_PPC_GET_CPU_CHAR);
+    ret = kvm_check_extension(s, KVM_CAP_PPC_GET_CPU_CHAR);
     if (!ret) {
         return;
     }
-- 
2.47.0
