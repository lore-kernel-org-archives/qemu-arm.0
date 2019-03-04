Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3447135wrx;
        Mon, 4 Mar 2019 02:15:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqza0L3N6D+FIQ1jmcvODiMMPhhno0sPixEKRe14ARhVyvYZdDD+ef6yRLUrhIunMqbsKTHV
X-Received: by 2002:a0d:d70f:: with SMTP id z15mr13642064ywd.249.1551694537750;
        Mon, 04 Mar 2019 02:15:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551694537; cv=none;
        d=google.com; s=arc-20160816;
        b=LJXFz8pjrBoWChpVepE9iNPDa+qkJnFCfdgwijbyoN7jXnNbIrQTwHlvu5nqfX2k20
         z/AtjpPG1nux0r3gNZZNJC2NbaR1pwwVn762Hufet0/0cOG1X9HAVKvHSjxfs/O+81yC
         BeBMZ9/v8pL6a6dQuTWMgLhExKwckTcgE1Fa5EiWy+W0hbaGZvEbJ2kAC/Wzpov49B8s
         y07HK0hC5SNTBvt324q1TM9bpRI2PtzhGxw6/pov0tyBzqe7c+HKhpqB2nUcLv4b1Qc2
         vCLqZCSUJ88O6DluUZN8LBMcRWZsegCUOAK0Nt0HRCPIKI6FkW2DQcZ3R3tFI9xLn1fC
         f3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dXvRLu+M+eEYlTOjnvt/OqXnRdcRRARrJZI+ZQ7JUB4=;
        b=uEPMsFU+jkyY7vk54GAgbInn7AF1mSnLpHLS7JJ95lXuUIyBlPQJ7U4FOao3O0ENyA
         guDKiEGg7J1HeS2BjC6rw/IQsUrWJVxVAxXFHSY3ewDaf1qQ+VjCFQy+Wzs/5k/f2EL5
         8dJeFU6cP0Pst1ASwfEf4ZSu8S/JH35JYyVvDrNvU8o8iy0MTO/972fmiTZZnaq33NcR
         s3cIjvSjrjPAX5LsQo1cSqlOGDz/49ggmbet74nk+ZBebCsuXgPlG7RMrj4BJoCr6YYL
         QhUgNFRjJztGoBLf4YxHeT5NCYhiB/iK4Eo2RnWkWMKO6O4yd9J1EZYQnPjaN/0hVpFC
         BZyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e135si2996368ywa.372.2019.03.04.02.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 02:15:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0kdF-0001j0-5K
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 05:15:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kcH-0001bZ-7g
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 05:14:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kcG-00009Y-Au
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 05:14:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h0kcE-00006x-6D; Mon, 04 Mar 2019 05:14:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64B6086678;
	Mon,  4 Mar 2019 10:14:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1F2051F00;
	Mon,  4 Mar 2019 10:14:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Mon,  4 Mar 2019 11:13:34 +0100
Message-Id: <20190304101339.25970-6-eric.auger@redhat.com>
In-Reply-To: <20190304101339.25970-1-eric.auger@redhat.com>
References: <20190304101339.25970-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 04 Mar 2019 10:14:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v12 05/10] kvm: add kvm_arm_get_max_vm_ipa_size
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r7d02scUb7W7

Add the kvm_arm_get_max_vm_ipa_size() helper that returns the
number of bits in the IPA address space supported by KVM.

This capability needs to be known to create the VM with a
specific IPA max size (kvm_type passed along KVM_CREATE_VM ioctl.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v10 -> v11:
- added Igor's R-b

v6 -> v7:
- s/kvm_arm_get_max_vm_phys_shift/kvm_arm_get_max_vm_ipa_size
- reword the comment

v4 -> v5:
- return 40 if the host does not support the capability

v3 -> v4:
- s/s/ms in kvm_arm_get_max_vm_phys_shift function comment
- check KVM_CAP_ARM_VM_IPA_SIZE extension

v1 -> v2:
- put this in ARM specific code
---
 target/arm/kvm.c     | 10 ++++++++++
 target/arm/kvm_arm.h | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e00ccf9c98..79a79f0190 100644
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
@@ -162,6 +163,15 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     env->features =3D arm_host_cpu_features.features;
 }
=20
+int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
+{
+    KVMState *s =3D KVM_STATE(ms->accelerator);
+    int ret;
+
+    ret =3D kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_SIZE);
+    return ret > 0 ? ret : 40;
+}
+
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     /* For ARM interrupt delivery is always asynchronous,
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 6393455b1d..2a07333c61 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -207,6 +207,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeature=
s *ahcf);
  */
 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
=20
+/**
+ * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
+ * IPA address space supported by KVM
+ *
+ * @ms: Machine state handle
+ */
+int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
+
 /**
  * kvm_arm_sync_mpstate_to_kvm
  * @cpu: ARMCPU
@@ -239,6 +247,11 @@ static inline void kvm_arm_set_cpu_features_from_hos=
t(ARMCPU *cpu)
     cpu->host_cpu_probe_failed =3D true;
 }
=20
+static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
+{
+    return -ENOENT;
+}
+
 static inline int kvm_arm_vgic_probe(void)
 {
     return 0;
--=20
2.20.1

