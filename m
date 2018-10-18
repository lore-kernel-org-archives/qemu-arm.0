Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2381466wrt;
        Thu, 18 Oct 2018 07:36:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62bDicifRneqvq40x/Lb70XU0u7+OTPD6PG29tt1L3KoeSyByuoeriisPQi1opcZyjBtJPB
X-Received: by 2002:a05:6214:1091:: with SMTP id o17mr24507585qvr.94.1539873361668;
        Thu, 18 Oct 2018 07:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873361; cv=none;
        d=google.com; s=arc-20160816;
        b=gH6t96R+rhOcRzfJMEDiXScEZFmZhMaVJSJJ+QolxUgrpiCJ+Fg+FOBsWAEvWOrgvI
         0ZU+bF1VAaXiqo43j5SYSDN2ER1LVHarHWMRqq7M2Ilm3SvbsrxYzhh0xFjF+Xt9KvQS
         iCGJLs6kTd0U7xKww3o6WE7ygFFS4nYEmiWoIGEgQfB2CheJ8/aQSYlIMJYU3GcNMatT
         4iWd/tR+aAT0lHw6/qo4sE6XiM4+3YxIpMIYPo3+pmls0+sk6gO+hLWBo/rQK1UO70Rn
         bR2KIA8HJZaujwOCjwpW7yHfdeTUB0+H/i/5Fb/zTEJfaZZgCaC3s0zi6zhwzpYG7+GY
         7PQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Tet2O5AYKkMKfGSSxHQ63aLhNV0QkvrIx8loYIE1DhU=;
        b=aXyBRiYxNWrQo9zwgr6up80CpvBAmIO76OsQgHYuwARwJ9niq+eLOojhMefAk+/ruX
         LY3SJRPHZtiXQAHzH7sXZ3VL0pIKOMba92Tfn+8lyW3GD8NzQSMVr7IZdFyCTzE9OdTi
         3rbjC3XOK//vzBuxs4IsuH4/sCkvUSgDS5lgXtmY0Xb2s8p/X9cr1x+CzrsFGxEkXrMg
         OflJ59jqElf0GiZwVU5twNd+mwgUvJsNgY0g+408zuAEF8tZDf9GPideKksb+m2ShEne
         b3Zq2sPz5xcma/orQ3gFw5z/lcGZa9xgwttcWn3f9R3C9U3Th0Wxz4x8A3i2VaGninN+
         RJvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c29-v6si4177940qkj.2.2018.10.18.07.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:36:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42706 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9P7-0001IV-2l
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:36:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Kw-0005rn-1T
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Ks-0007Ck-WF
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54376)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9Ks-0006lF-KE; Thu, 18 Oct 2018 10:31:38 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4A1230A0210;
	Thu, 18 Oct 2018 14:31:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D423789A3;
	Thu, 18 Oct 2018 14:31:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:30 +0200
Message-Id: <20181018143042.29588-5-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 18 Oct 2018 14:31:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 04/16] kvm: add kvm_arm_get_max_vm_phys_shift
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hyor83ICxth0

Add the kvm_arm_get_max_vm_phys_shift() helper that returns the
log of the maximum IPA size supported by KVM. This capability
needs to be known to create the VM with a specific IPA max size
(kvm_type passed along KVM_CREATE_VM ioctl.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- s/s/ms in kvm_arm_get_max_vm_phys_shift function comment
- check KVM_CAP_ARM_VM_IPA_SIZE extension

v1 -> v2:
- put this in ARM specific code
---
 target/arm/kvm.c     |  8 ++++++++
 target/arm/kvm_arm.h | 16 ++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 54ef5f711b..485e3291ae 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -18,6 +18,7 @@
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
+#include "sysemu/kvm_int.h"
 #include "kvm_arm.h"
 #include "cpu.h"
 #include "trace.h"
@@ -154,6 +155,13 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     env->features = arm_host_cpu_features.features;
 }
 
+int kvm_arm_get_max_vm_phys_shift(MachineState *ms)
+{
+    KVMState *s = KVM_STATE(ms->accelerator);
+
+    return kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_SIZE);
+}
+
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     /* For ARM interrupt delivery is always asynchronous,
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 5948e8b560..749c38cb35 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -182,6 +182,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
  */
 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
+/**
+ * kvm_arm_get_max_vm_phys_shift - Returns log2 of the max IPA size
+ * supported by KVM
+ *
+ * @ms: Machine state handle
+ *
+ * Return the max number of IPA bits or a negative value if
+ * the host kernel does not expose this value.
+ */
+int kvm_arm_get_max_vm_phys_shift(MachineState *ms);
+
 /**
  * kvm_arm_sync_mpstate_to_kvm
  * @cpu: ARMCPU
@@ -214,6 +225,11 @@ static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     cpu->host_cpu_probe_failed = true;
 }
 
+static inline int kvm_arm_get_max_vm_phys_shift(MachineState *ms)
+{
+    return -ENOENT;
+}
+
 static inline int kvm_arm_vgic_probe(void)
 {
     return 0;
-- 
2.17.1

