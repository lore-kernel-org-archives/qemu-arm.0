Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11097007wrx;
        Tue, 26 Feb 2019 05:57:21 -0800 (PST)
X-Google-Smtp-Source: AHgI3IauLccyrSGRwQyapcLY/PHTXwUC713s+0pfPX2dPhWjphib9qDWHlty2NCzZJ4keGaqEyFp
X-Received: by 2002:a25:708b:: with SMTP id l133mr18437264ybc.152.1551189441501;
        Tue, 26 Feb 2019 05:57:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551189441; cv=none;
        d=google.com; s=arc-20160816;
        b=bDSQv2Q0tNyxSuGHNwZdqoXcjQIQBCKsj0zSZ3Oq6OjmEx9ZyRGPiPLqV8Qdad7pSr
         ApF0OYyFbB0R/diRHcxSE9Gta2nyN0wcShivfjPCBgw3HbEtdr9tP0lWmo3522m4fqaK
         NdoYVjNi/v5EHJnZMfEm7c2hghP/9eCnd/YYsCaH9wtWHkfjWBGK1hclH7VPuauTyGP6
         XJ5zkR6mtvTp81yNaKLgpyPeZV7Hu6TlO9QPCBaP1oDDaAIlh5bJ4eXwaekS4hoh5IVB
         hubHYeGqHdEKzTbOYvh7iM5H98Ex2BObml4KVgwv0u/nogRVd8BSBQ8koMbCNxAZpKc8
         rV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oIE87mZKaXD5BawL9YDuMEUHC+qrw3lgh0NUMbAaGZk=;
        b=UhJByxnctFAtPzvSmnLlVlyIiyY26Q2kXlNHApCDQmsBM976pwCGckBzibkeAUD2zn
         Nb6QEXcSYN5Ysl+QwV7Gy2S32ivjCF8v0mTJ3mHs0YhUOH6ho77iavsfn1TkpIT0Jdz6
         hRIbDZwhFXBRBpPsF8qzy/oReFVpV5TWFdHtVyWq/UF9uundGtsAtQsSxV+af0Id+xFL
         4iUhsPfGuTVLTIKNMytTWCGetIW7mz/G6Gi35JxT7nChhqy/0W4gu4fnT3e7oIjwzvZX
         /HhiqyYs+pd/MWuexe5KEVlpQTkxzNhcjNMDVzfkvMkDXiC4ygEnRnk0rh1vY1yu9LQ8
         kZVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si2510255ywx.313.2019.02.26.05.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 05:57:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55692 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gydEW-0004cr-V8
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 08:57:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8S-00007j-Qv
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8R-0006zI-M1
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34188)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyd8P-0006mL-4d; Tue, 26 Feb 2019 08:51:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 93C032D808;
	Tue, 26 Feb 2019 13:50:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1B625E1CD;
	Tue, 26 Feb 2019 13:50:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 14:50:01 +0100
Message-Id: <20190226135014.31854-6-eric.auger@redhat.com>
In-Reply-To: <20190226135014.31854-1-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 26 Feb 2019 13:50:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v8 05/18] kvm: add kvm_arm_get_max_vm_ipa_size
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
X-TUID: dyx/X6/5nR9w

Add the kvm_arm_get_max_vm_ipa_size() helper that returns the
number of bits in the IPA address space supported by KVM.

This capability needs to be known to create the VM with a
specific IPA max size (kvm_type passed along KVM_CREATE_VM ioctl.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
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

