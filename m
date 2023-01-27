Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232484ejc;
        Fri, 27 Jan 2023 07:15:59 -0800 (PST)
X-Received: by 2002:a05:600c:5390:b0:3d9:a145:4d1a with SMTP id hg16-20020a05600c539000b003d9a1454d1amr36986648wmb.34.1674832559561;
        Fri, 27 Jan 2023 07:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832559; cv=none;
        d=google.com; s=arc-20160816;
        b=MoIxd/u25FzlDNfzcmQWPArgBw9ThGIC7kLy9iRCtfPegjTy/ARWAaLLr6w8gossSy
         CbfnDR2sd11DYWRXcn32jE753tMM5R/Ur9HIV3rFXMJ0exUYzGqYiXHYBF7ESFdEQH4f
         H1miBh+2SnnQ7GA6a6lFse4St10hzApmP0IuVicxzUv/3cEtNeSEWnDblJBsotPh9kPT
         qUA9KTlpTeDGdYcUD/kSnBPiXfcp7K/6xynMV76Np4aGYHInPIICI0JAy5oaC/DOIJHy
         ZEF3tTsfiUDU0GPf3bYY2Qw0gHnC53wH/uVLAX/XA82U1Tmx3wW/9xSs4HSe0tgy5cqf
         unSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ig1TzNIoOeWwabviwLp2kbnIks9AjR0QHEy5oTBBhzE=;
        b=gH3/nxYEeoX/RfMAPx7mDTc0egn1jCHocEM2TpKLvsDpOgJqlZV7umaa801bV4rKfE
         s26lsejowTWuP5HLwFElEQhT6NUOconlFQ9y9dvJuQGZ9ud8ogSzjrVwUGg94Vj1SEEg
         o6AN3gE7SB6zhlAhfA2nAveovL9sB141G95SqG2Bl3W7TL1T9G3kOMKh0szhydANFlk9
         IFwHPEUMSNlJWiYfXni8xvGAWt7yPuh+dV6XYSqxBXvRu3W+f3Nz7r8W4vIWUC3JUjkm
         E0KaAUL/tlecAQ0ASWnb8ZtZjNtJ2jb5JFAbkGZl/RdLe8j4xdZaseqGU8dL2F+408wm
         kbBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=duGreVUw;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id he6-20020a05600c540600b003d99a390c37sor1669039wmb.45.2023.01.27.07.15.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=duGreVUw;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ig1TzNIoOeWwabviwLp2kbnIks9AjR0QHEy5oTBBhzE=;
        b=duGreVUwmGMLyACjwtvql9tRnvLaGDyPFQRari0JfPBcB/PTcwqcE6gbMqGyCqHlNY
         4vJq2EEALX/NSCSE6xo0EqfC9PN1dHrEBGNk+V0pa4iqVFxPfCzH2c+YOWW+V+8PQuIM
         PK29YfykPJpEtgyDPFYJArTSExzod+itJosppfW3wxkVuihhEsKDerxGhaQNqb+dBSYu
         EgF1Cej416O+t+q0jq8vLOoHnX7NYgzoC3Wx9At8CrXmEpQAk8XX92uvEoGxVQromIMK
         0jWV5pGg7CdPJnWLTeNcT2QmCfEWECDyIVqmJOaT684dniER07E7JwkDERjbUqjDxUQ9
         oBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ig1TzNIoOeWwabviwLp2kbnIks9AjR0QHEy5oTBBhzE=;
        b=pwvkpNSyPJQkGo5DX8/lhlPR6cFhSeuWICnHLW52CgSCP3mbbpx2V9YSWKAHQdz1D4
         yS5uLlt1Y0W5pjCpylh85Y0Xr++2smhaZypwWuFjrb4jrxIL0iV9bjBNZIXy835TWaFb
         vHHWmLfg1utpXvzFdcUnyQmWATkWHuDXmDnfgu6FtnXMCG38UUyduZ/0pgqSed71c63X
         /RjLSzGzIzpuArgN3tUwe1bAHnBOVFSs1gfpwk6AieK6xZ7kdIHLfm4eZ0rS5gT0RWkQ
         O2p4f2wgmOwr8F92RURQ1gdfo+K53Rr5DgxR4tYHxEMLZkK7f7fZwjqDxDtfVpcvYaMk
         LcXw==
X-Gm-Message-State: AFqh2ko7ulZtmblYkBhx0HWY7do80QX5CDn2BYfqzSLwGzc+vcAu9sC7
	zVHb+pqx4+k21yYQ82SRKtm6xmqx
X-Google-Smtp-Source: AMrXdXt8f78UgKcTF9N9KCMRHAtfi7ZSn55Nu7H1ij/q8FwoMTkWwVD+HUjBumnBhVzI82MPKgWDQw==
X-Received: by 2002:a05:600c:3110:b0:3dc:e66:4cb9 with SMTP id g16-20020a05600c311000b003dc0e664cb9mr16051820wmo.13.1674832559281;
        Fri, 27 Jan 2023 07:15:59 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:15:58 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	eblake@redhat.com,
	armbru@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 04/16] hw/arm/virt: Add support for Arm RME
Date: Fri, 27 Jan 2023 15:07:17 +0000
Message-Id: <20230127150727.612594-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GCIyb8ifJBiR

When confidential-guest-support is enabled for the virt machine, call
the RME init function, and add the RME flag to the VM type.

* The Realm differentiates non-secure from realm memory using the upper
  GPA bit. Reserve that bit when creating the memory map, to make sure
  that device MMIO located in high memory can still fit.

* pvtime is disabled for the moment. Since the hypervisor has to write
  into the shared pvtime page before scheduling a vcpu, it seems
  incompatible with confidential guests.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 48 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b871350856..df613e634a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -210,6 +210,11 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("max"),
 };
 
+static bool virt_machine_is_confidential(VirtMachineState *vms)
+{
+    return MACHINE(vms)->cgs;
+}
+
 static bool cpu_type_valid(const char *cpu)
 {
     int i;
@@ -247,6 +252,14 @@ static void create_fdt(VirtMachineState *vms)
         exit(1);
     }
 
+    /*
+     * Since the devicetree is included in the initial measurement, it must
+     * not contain random data.
+     */
+    if (virt_machine_is_confidential(vms)) {
+        vms->dtb_randomness = false;
+    }
+
     ms->fdt = fdt;
 
     /* Header */
@@ -1924,6 +1937,15 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
     steal_time = object_property_get_bool(OBJECT(first_cpu),
                                           "kvm-steal-time", NULL);
 
+    if (virt_machine_is_confidential(vms)) {
+        /*
+         * The host cannot write into a confidential guest's memory until the
+         * guest shares it. Since the host writes the pvtime region before the
+         * guest gets a chance to set it up, disable pvtime.
+         */
+        steal_time = false;
+    }
+
     if (kvm_enabled()) {
         hwaddr pvtime_reg_base = vms->memmap[VIRT_PVTIME].base;
         hwaddr pvtime_reg_size = vms->memmap[VIRT_PVTIME].size;
@@ -2053,10 +2075,11 @@ static void machvirt_init(MachineState *machine)
      * if the guest has EL2 then we will use SMC as the conduit,
      * and otherwise we will use HVC (for backwards compatibility and
      * because if we're using KVM then we must use HVC).
+     * Realm guests must also use SMC.
      */
     if (vms->secure && firmware_loaded) {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
-    } else if (vms->virt) {
+    } else if (vms->virt || virt_machine_is_confidential(vms)) {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     } else {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
@@ -2102,6 +2125,8 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    kvm_arm_rme_init(machine->cgs, &error_fatal);
+
     create_fdt(vms);
 
     assert(possible_cpus->len == max_cpus);
@@ -2854,15 +2879,26 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    int rme_vm_type = kvm_arm_rme_vm_type(ms);
     int max_vm_pa_size, requested_pa_size;
+    int rme_reserve_bit = 0;
     bool fixed_ipa;
 
-    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
+    if (rme_vm_type) {
+        /*
+         * With RME, the upper GPA bit differentiates Realm from NS memory.
+         * Reserve the upper bit to guarantee that highmem devices will fit.
+         */
+        rme_reserve_bit = 1;
+    }
+
+    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa) -
+                     rme_reserve_bit;
 
     /* we freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms, max_vm_pa_size);
 
-    requested_pa_size = 64 - clz64(vms->highest_gpa);
+    requested_pa_size = 64 - clz64(vms->highest_gpa) + rme_reserve_bit;
 
     /*
      * KVM requires the IPA size to be at least 32 bits.
@@ -2883,7 +2919,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
      * the implicit legacy 40b IPA setting, in which case the kvm_type
      * must be 0.
      */
-    return fixed_ipa ? 0 : requested_pa_size;
+    if (fixed_ipa) {
+        return 0;
+    }
+
+    return requested_pa_size | rme_vm_type;
 }
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
-- 
2.39.0
