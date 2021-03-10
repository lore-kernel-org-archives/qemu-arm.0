Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp540742lfg;
        Wed, 10 Mar 2021 05:53:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY79nw51nkMBu8HmTylIF4k5ZCPmXP/VMTfynUBGxm3ldpXpg3B9/vBxAEKKRymoHyA3/+
X-Received: by 2002:aed:2c41:: with SMTP id f59mr2687574qtd.222.1615384382359;
        Wed, 10 Mar 2021 05:53:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615384382; cv=none;
        d=google.com; s=arc-20160816;
        b=G1wAO6Z7iOHw6ZOqRRau4VJHfmrLLNt3V3GhH5iYzc9UE6my0bISGJMqKK5nN7R4vT
         admtItiW2t8Dh7QDGwXeXYbOj6aIpPCbIzEg4Z8dQcc6exvfjoOmZxQyKelRB6OM9mE7
         OEBbM/usRKOL83eR9E2ZhFEAJNU5WUi4ARszJvsWaQ8M+d9Nn39PtGLMkwzBBiDhzZ7q
         DWXuCE/Dys/ALa8V/J1Meo5SF1ayWSxmOAk4oVoLhJ/sc48UWFf41UmFLzMVZ5M58rZx
         Ye5JNr4VxqL6vBGyr2UlkK7WOHgdjIx+QkDo4wm6KcXdapszA/UIJ48RH1vKP28KypRj
         0hzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Z+jdT4HNcIBKIsz34GsS2v9ZkPu8cEdjsPZp1m32Vhg=;
        b=C4L0UhZdrVZfIH57rQxwER15X66/fACiV+NFCvyXMsn+Z8meR12wqX18NanldE5bB5
         aMDWaehQ8fdrJX9FlpxjP9N1a9ksJhAtJiWYEnO/oc4pohLcg+U0N5KzTk+LyWXL7Z5I
         RW82vKiKDDNvpSUJwDprpylpYiPjc2tyoc7Me3YVoEBkU60qMrT1w61CGTqct94Zrvzi
         z1vNclo7Q5ERSIRJPZ60ebZNg2GM2CNrMIh/X5cDkyZVozo8D1CDWhnKpFyolidB6f7N
         S/M7vEmeG2q4i8Pf9tHfwKeV6qU09snP9H5OA4u+syzOlIXk1CnYp1iYFHLtEj7o7luO
         aovA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mj4ii1mO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si9679566qvk.173.2021.03.10.05.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 05:53:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mj4ii1mO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJzGn-0001VF-Kg
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 08:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJzGV-0001RD-MX
 for qemu-arm@nongnu.org; Wed, 10 Mar 2021 08:52:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJzGS-00048t-L2
 for qemu-arm@nongnu.org; Wed, 10 Mar 2021 08:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615384360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+jdT4HNcIBKIsz34GsS2v9ZkPu8cEdjsPZp1m32Vhg=;
 b=Mj4ii1mOYHtG5+WldoMQX58XYrYKiSG+sl7T51bhR0uyakWshJfGoWHEztWwyt6oE4IMRA
 +Y7rGhTTxo8ZUuF3AsWDblIP1p3qdFzEEsW1SfaOQfJAzlieRlgpbpAaijE2XEOCGp23WA
 EDk+o5azeRoQSqsZF0GGCvBjmfsXbPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-nCOn6wODMOaIjpJ_lkby0w-1; Wed, 10 Mar 2021 08:52:36 -0500
X-MC-Unique: nCOn6wODMOaIjpJ_lkby0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DF9C1005D4A;
 Wed, 10 Mar 2021 13:52:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9AD360C13;
 Wed, 10 Mar 2021 13:52:30 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/2] hw/arm/virt: KVM: The IPA lower bound is 32
Date: Wed, 10 Mar 2021 14:52:18 +0100
Message-Id: <20210310135218.255205-3-drjones@redhat.com>
In-Reply-To: <20210310135218.255205-1-drjones@redhat.com>
References: <20210310135218.255205-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: pbonzini@redhat.com, maz@kernel.org, eric.auger@redhat.com,
 peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O1J6UhdIlXKm

The virt machine already checks KVM_CAP_ARM_VM_IPA_SIZE to get the
upper bound of the IPA size. If that bound is lower than the highest
possible GPA for the machine, then QEMU will error out. However, the
IPA is set to 40 when the highest GPA is less than or equal to 40,
even when KVM may support an IPA limit as low as 32. This means KVM
may fail the VM creation unnecessarily. Additionally, 40 is selected
with the value 0, which means use the default, and that gets around
a check in some versions of KVM, causing a difficult to debug fail.
Always use the IPA size that corresponds to the highest possible GPA,
unless it's lower than 32, in which case use 32. Also, we must still
use 0 when KVM only supports the legacy fixed 40 bit IPA.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c        | 23 ++++++++++++++++-------
 target/arm/kvm.c     |  4 +++-
 target/arm/kvm_arm.h |  6 ++++--
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 371147f3ae9c..3ed94d24d70b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2534,27 +2534,36 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
-    int max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms);
-    int requested_pa_size;
+    int max_vm_pa_size, requested_pa_size;
+    bool fixed_ipa;
+
+    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
 
     /* we freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms);
 
     requested_pa_size = 64 - clz64(vms->highest_gpa);
 
+    /*
+     * KVM requires the IPA size to be at least 32 bits.
+     */
+    if (requested_pa_size < 32) {
+        requested_pa_size = 32;
+    }
+
     if (requested_pa_size > max_vm_pa_size) {
         error_report("-m and ,maxmem option values "
                      "require an IPA range (%d bits) larger than "
                      "the one supported by the host (%d bits)",
                      requested_pa_size, max_vm_pa_size);
-       exit(1);
+        exit(1);
     }
     /*
-     * By default we return 0 which corresponds to an implicit legacy
-     * 40b IPA setting. Otherwise we return the actual requested PA
-     * logsize
+     * We return the requested PA log size, unless KVM only supports
+     * the implicit legacy 40b IPA setting, in which case the kvm_type
+     * must be 0.
      */
-    return requested_pa_size > 40 ? requested_pa_size : 0;
+    return fixed_ipa ? 0 : requested_pa_size;
 }
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 00e124c81239..1fcab0e1d37b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -230,12 +230,14 @@ bool kvm_arm_pmu_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
 }
 
-int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
+int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
 {
     KVMState *s = KVM_STATE(ms->accelerator);
     int ret;
 
     ret = kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_SIZE);
+    *fixed_ipa = ret <= 0;
+
     return ret > 0 ? ret : 40;
 }
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index eb81b7059eb1..d36d76403ff2 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -311,10 +311,12 @@ bool kvm_arm_sve_supported(void);
 /**
  * kvm_arm_get_max_vm_ipa_size:
  * @ms: Machine state handle
+ * @fixed_ipa: True when the IPA limit is fixed at 40. This is the case
+ * for legacy KVM.
  *
  * Returns the number of bits in the IPA address space supported by KVM
  */
-int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
+int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa);
 
 /**
  * kvm_arm_sync_mpstate_to_kvm:
@@ -409,7 +411,7 @@ static inline void kvm_arm_add_vcpu_properties(Object *obj)
     g_assert_not_reached();
 }
 
-static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
+static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
 {
     g_assert_not_reached();
 }
-- 
2.26.2

