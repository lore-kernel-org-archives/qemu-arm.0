Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp12240lfp;
        Mon, 20 Jan 2020 02:11:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqxs/9m/cgAqoA6RhKFZdcCzZoACorgyCoZlUQpPTb0m9qogSYKb5MJCJHuhdFOGe0F4EDbS
X-Received: by 2002:a37:4792:: with SMTP id u140mr47551291qka.100.1579515112814;
        Mon, 20 Jan 2020 02:11:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579515112; cv=none;
        d=google.com; s=arc-20160816;
        b=gzuZgXL9pM1PKy6NTZGkEe+LaRxvavOwaJ2Ugv0mO/Hr3s3f52MP+LEdZgBJQM99MP
         WH/bpc+MHuxouBhwflssYQxlTe3Jnvh+680vScnh+9Es1ckK8AoWv8VZjCBchJJJZAE3
         vs7v1blbwdB0DhwxW1C6go5Cmc65IACZzzu4BRf4if/lotXvClhi+41J0qMTJwD0dL8B
         NAMYbsVf3oKt4UKWWefmJGivQt7fSR30FE7YutrLS20WKs6gZXEAAC35yr+x+R7v9vZu
         tmrgfeaG0z3WTyk4wZegUZFZH3pZ/d4s6FXbQSW/DoyiUb3eL90PRYXY5HM5SzYsniyG
         OHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5JK0SPejtfnhDv2PZmh14HOx+dBSg1c8oIKDy0lXZ34=;
        b=R9j1oqT7nkV7PY0CCQQ8jWqoue/OIazgPflItogXmVEPLQt8GoqiXWzp6+Irv4SSAI
         sTHRXTpgQZ+WriJyicWVmJCGXb83UvBze+spW4a0EV6L8QxdCaGCJytUIoV8xUUticmB
         HwLFtB3IzkTDjdIVg3m0/RvOlJbdQTNxwhHLSGEzDrq4ktdAOf3sgF7ZRnzGQlGsFgJr
         bag0aZewUxO8vVozZg37Z0GH+Z27ZAd/8/41FR34IqVGZykK30M0E7/riirj5pIO1aFM
         ukseRJpZsN3iPDf6OU9wKp4wiWjkThNX4xFYJQmkqu1sbfsYhHZ7WQstxvi3XLRjsdkW
         JyXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T63F3fOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk17si17923628qvb.219.2020.01.20.02.11.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:11:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T63F3fOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itU2B-0006iu-Ko
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1itU10-0005Om-12
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:10:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1itU0w-0002zd-46
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:10:37 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45171
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1itU0w-0002zR-0E
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579515033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JK0SPejtfnhDv2PZmh14HOx+dBSg1c8oIKDy0lXZ34=;
 b=T63F3fOggoWKldbIOZ0fWrE7T+L2AxzMrusD/DDv0P4hd+NMDeWODWzqaYofh+uWxst30e
 baL6yHov9Kdoe5aysTYQ0ZOskyJXITyxG9ZczjNOvyNFmcDn2qKAjiPvDIwiWtR4fgm/kd
 JPiDl9q+N3BHesuZZpv4u1kUpMa2mwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-2FuIHtcgPqWv671Nk2Qayg-1; Mon, 20 Jan 2020 05:10:30 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E25E9800D48;
 Mon, 20 Jan 2020 10:10:28 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24C3C48;
 Mon, 20 Jan 2020 10:10:26 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [RFC PATCH v3 1/6] target/arm/kvm: trivial: Clean up header
 documentation
Date: Mon, 20 Jan 2020 11:10:18 +0100
Message-Id: <20200120101023.16030-2-drjones@redhat.com>
In-Reply-To: <20200120101023.16030-1-drjones@redhat.com>
References: <20200120101023.16030-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 2FuIHtcgPqWv671Nk2Qayg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org,
 richard.henderson@linaro.org, guoheyi@huawei.com, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K0ndrh1AYA+A

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm_arm.h | 46 ++++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 8e14d400e8ab..b48a9c95573b 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -28,9 +28,9 @@
 int kvm_arm_vcpu_init(CPUState *cs);
=20
 /**
- * kvm_arm_vcpu_finalize
+ * kvm_arm_vcpu_finalize:
  * @cs: CPUState
- * @feature: int
+ * @feature: feature to finalize
  *
  * Finalizes the configuration of the specified VCPU feature by
  * invoking the KVM_ARM_VCPU_FINALIZE ioctl. Features requiring
@@ -75,8 +75,8 @@ void kvm_arm_register_device(MemoryRegion *mr, uint64_t d=
evid, uint64_t group,
 int kvm_arm_init_cpreg_list(ARMCPU *cpu);
=20
 /**
- * kvm_arm_reg_syncs_via_cpreg_list
- * regidx: KVM register index
+ * kvm_arm_reg_syncs_via_cpreg_list:
+ * @regidx: KVM register index
  *
  * Return true if this KVM register should be synchronized via the
  * cpreg list of arbitrary system registers, false if it is synchronized
@@ -85,8 +85,8 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu);
 bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx);
=20
 /**
- * kvm_arm_cpreg_level
- * regidx: KVM register index
+ * kvm_arm_cpreg_level:
+ * @regidx: KVM register index
  *
  * Return the level of this coprocessor/system register.  Return value is
  * either KVM_PUT_RUNTIME_STATE, KVM_PUT_RESET_STATE, or KVM_PUT_FULL_STAT=
E.
@@ -148,6 +148,8 @@ void kvm_arm_init_serror_injection(CPUState *cs);
  * @cpu: ARMCPU
  *
  * Get VCPU related state from kvm.
+ *
+ * Returns: 0 if success else < 0 error code
  */
 int kvm_get_vcpu_events(ARMCPU *cpu);
=20
@@ -156,6 +158,8 @@ int kvm_get_vcpu_events(ARMCPU *cpu);
  * @cpu: ARMCPU
  *
  * Put VCPU related state to kvm.
+ *
+ * Returns: 0 if success else < 0 error code
  */
 int kvm_put_vcpu_events(ARMCPU *cpu);
=20
@@ -205,10 +209,12 @@ typedef struct ARMHostCPUFeatures {
=20
 /**
  * kvm_arm_get_host_cpu_features:
- * @ahcc: ARMHostCPUClass to fill in
+ * @ahcf: ARMHostCPUClass to fill in
  *
  * Probe the capabilities of the host kernel's preferred CPU and fill
  * in the ARMHostCPUClass struct accordingly.
+ *
+ * Returns true on success and false otherwise.
  */
 bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
=20
@@ -242,7 +248,7 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
 bool kvm_arm_aarch32_supported(CPUState *cs);
=20
 /**
- * bool kvm_arm_pmu_supported:
+ * kvm_arm_pmu_supported:
  * @cs: CPUState
  *
  * Returns: true if the KVM VCPU can enable its PMU
@@ -251,7 +257,7 @@ bool kvm_arm_aarch32_supported(CPUState *cs);
 bool kvm_arm_pmu_supported(CPUState *cs);
=20
 /**
- * bool kvm_arm_sve_supported:
+ * kvm_arm_sve_supported:
  * @cs: CPUState
  *
  * Returns true if the KVM VCPU can enable SVE and false otherwise.
@@ -259,26 +265,30 @@ bool kvm_arm_pmu_supported(CPUState *cs);
 bool kvm_arm_sve_supported(CPUState *cs);
=20
 /**
- * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
- * IPA address space supported by KVM
- *
+ * kvm_arm_get_max_vm_ipa_size:
  * @ms: Machine state handle
+ *
+ * Returns the number of bits in the IPA address space supported by KVM
  */
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
=20
 /**
- * kvm_arm_sync_mpstate_to_kvm
+ * kvm_arm_sync_mpstate_to_kvm:
  * @cpu: ARMCPU
  *
  * If supported set the KVM MP_STATE based on QEMU's model.
+ *
+ * Returns 0 on success and -1 on failure.
  */
 int kvm_arm_sync_mpstate_to_kvm(ARMCPU *cpu);
=20
 /**
- * kvm_arm_sync_mpstate_to_qemu
+ * kvm_arm_sync_mpstate_to_qemu:
  * @cpu: ARMCPU
  *
  * If supported get the MP_STATE from KVM and store in QEMU's model.
+ *
+ * Returns 0 on success and aborts on failure.
  */
 int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu);
=20
@@ -292,7 +302,8 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int =
level);
=20
 static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
 {
-    /* This should never actually be called in the "not KVM" case,
+    /*
+     * This should never actually be called in the "not KVM" case,
      * but set up the fields to indicate an error anyway.
      */
     cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_NONE;
@@ -377,23 +388,20 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_de=
bug_exit_arch *debug_exit);
  *
  * Return: TRUE if any hardware breakpoints in use.
  */
-
 bool kvm_arm_hw_debug_active(CPUState *cs);
=20
 /**
  * kvm_arm_copy_hw_debug_data:
- *
  * @ptr: kvm_guest_debug_arch structure
  *
  * Copy the architecture specific debug registers into the
  * kvm_guest_debug ioctl structure.
  */
 struct kvm_guest_debug_arch;
-
 void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr);
=20
 /**
- * its_class_name
+ * its_class_name:
  *
  * Return the ITS class name to use depending on whether KVM acceleration
  * and KVM CAP_SIGNAL_MSI are supported
--=20
2.21.1

