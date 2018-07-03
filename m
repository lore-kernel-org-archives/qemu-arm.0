Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp695483wrq;
        Tue, 3 Jul 2018 00:25:43 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeMQ2ZL87krPSgKPiGKqs97ZEpbw1IYXZfFUku2qwf57nIKXMMlHwlxXpDYr4X38F1TIUjo
X-Received: by 2002:a37:16c3:: with SMTP id 64-v6mr25114708qkw.381.1530602743871;
        Tue, 03 Jul 2018 00:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530602743; cv=none;
        d=google.com; s=arc-20160816;
        b=UXi2fsY4RE9f+bxRcjgpbG/HzmmsoHMhw8q0GJAkdZZqeYxffkb75VrBXb+Vt8UsFo
         /Cw0MfMKOJtn+AjUHpcuTqr6uNWWAJbveptPvOg/jWp0ndAO24hWD2vg+lKpL3vy2HbF
         J6Iieu4ScS2t+DbPLV474tDt8KTcwnIFRwnF4K4Je4jTga90MDeC22fe/FxPAutdaBxj
         pcpjb92VDCHVO29iZrYwJhz38hjBo1FyIs2fJw4QIA4VgedahGCYOpDjQZDqwdB5Eaz8
         Bua1pmfB1H0QlssJZVEDdM76Tzp1QU7PERg0qB91LdWXm3emnkZc+MVu/Jn/HExGExZ/
         +8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=PGYm28EFkvM+sOv5fF4z+Kvr0lcfzEl9JS3WCdTayJw=;
        b=t1U+Fy2hk4gb6wVbh3umHdr9nKy4w2O9sVeKKcuNkORQ3FLArT9PlclAEqH8/J+cvH
         CJlFFXYRK0ZZEoBML+Qr01Iut5EzS1zPbfDzyKvVdUZB17UwxIgr6MYSbjudK4IR/taO
         grbks5mH4ayuadBR0jnMLkhB5iFt6POgBd+Ddms/5vbted/IX81w7irmvG4SerooGt8V
         M7XuhyptQhPju5UW/pbT3Bpl0gI5y1gjDrqX/LYo4lTkqBpERpKBBZaoplnI2KOk/MmA
         PbrALDIXp3AKHn2O59mBnyEiP0VdHX1TlJBUWK7LnwBOqHJw7XOnr9sxk0tM9GwyWXU1
         B9JA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7-v6si446155qvo.87.2018.07.03.00.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 00:25:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faFh1-00046P-AM
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 03:25:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFcz-00039N-9g
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:25:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFbv-00053m-3b
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:21:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49500 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faFbu-00053Q-HE; Tue, 03 Jul 2018 03:20:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B6524075188;
	Tue,  3 Jul 2018 07:20:26 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D6D21C5A3;
	Tue,  3 Jul 2018 07:20:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  3 Jul 2018 09:19:46 +0200
Message-Id: <1530602398-16127-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 03 Jul 2018 07:20:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 03 Jul 2018 07:20:26 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 03/15] kvm: add kvm_arm_get_max_vm_phys_shift
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pDFN67RfHnXU

Add the kvm_arm_get_max_vm_phys_shift() helper that returns the
log of the maximum IPA size supported by KVM. This capability
needs to be known to create the VM with a correct IPA max size
(kvm_type passed along KVM_CREATE_VM ioctl.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v1 -> v2:
- put this in ARM specific code
---
 target/arm/kvm.c     |  9 +++++++++
 target/arm/kvm_arm.h | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 65f867d..7d501ca 100644
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
+    return kvm_ioctl(s, KVM_ARM_GET_MAX_VM_PHYS_SHIFT, 0);
+}
+
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     /* For ARM interrupt delivery is always asynchronous,
@@ -713,3 +721,4 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
 {
     return (data - 32) & 0xffff;
 }
+
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 863f205..ee973f6 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -183,6 +183,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
 /**
+ * kvm_arm_get_max_vm_phys_shift - Returns log2 of the max IPA size
+ * supported by KVM
+ *
+ * @s: Machine state handle
+ *
+ * Return the max number of IPA bits or a negative value if
+ * the host kernel does not expose this value.
+ */
+int kvm_arm_get_max_vm_phys_shift(MachineState *ms);
+
+/**
  * kvm_arm_sync_mpstate_to_kvm
  * @cpu: ARMCPU
  *
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
2.5.5

