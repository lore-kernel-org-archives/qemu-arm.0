Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5051146wrx;
        Wed, 20 Feb 2019 14:49:23 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaTjx7/gA74ZEMuxEOJ0A/0r8vMMOMGR+Vl3KWwH+4Ec7OBq9XPyzpc/sl1jryGvsNiLdmz
X-Received: by 2002:a25:8e07:: with SMTP id p7mr29581054ybl.193.1550702963459;
        Wed, 20 Feb 2019 14:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550702963; cv=none;
        d=google.com; s=arc-20160816;
        b=Kiimkc+ZCXJOt54RVSIZU02HgOgpxTGT+GvgemNBr485D+bK9fL+qJDSLJcWudRsFu
         bJu+aud2cEMpz7y5gY00zo+dcKBDeD2XuVpszJ2jtGUE9pTfC6UzUjvQ76vRZWSeNaF6
         A1bNJDhv04PkQizBmXOsLApUyoK9Y7bxSeTLMLuwZolCBkfgx8AQiNtflydk/NAneqr8
         ra72eXFqpVz3scyQYgaBFlCSAqCfri2LjxHXtb+39oVbj0866ficirZX8yVxffF7Yaw0
         EhPlV8Y++YnNLgFW0KRmH9SKJ560MMm6neIbreaYiJO0F9IdfNFLHiJ6AVNuamTHoDQU
         nzcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oIE87mZKaXD5BawL9YDuMEUHC+qrw3lgh0NUMbAaGZk=;
        b=Ve/t33s1KIXbnqQmHBUjFVYB/Y+z1vZQqaMOfoFuFtZhRymRWqB3O2uKb8cMnvSZtR
         8L0HK532z5LTjmXLOxDK1wqxcU1o6g+mMij1cRiuSnT2V7bVz6Aekn08f5hWm1vunyJl
         SJ5JzkTpgGzb0xTIPivwWrSxZglCqjG/s3StrRuHlz59oVHY9vBVBuw1g08mW+MzUlK8
         rCnaA/JW8XF6BlqNYohV77pPcjrW7LzcHxMUXDrseASsNe0wDjLFUWZfiOqA7TUQMUUS
         rYHKlROAC9U/vqZ0HSQkiXG8A41/UzmF7rxVIYctt9gsQCvYyB5FOoexu41axnlBI605
         Rf6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18si11898556ybp.31.2019.02.20.14.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:49:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwag6-0001uL-UB
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:49:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXd-00042x-0z
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 17:40:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXc-0008WQ-7y
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 17:40:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58236)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaXa-0008VJ-8J; Wed, 20 Feb 2019 17:40:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6C5EC049D67;
	Wed, 20 Feb 2019 22:40:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43FF45D6AA;
	Wed, 20 Feb 2019 22:40:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:51 +0100
Message-Id: <20190220224003.4420-6-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 20 Feb 2019 22:40:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 05/17] kvm: add kvm_arm_get_max_vm_ipa_size
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PfptP7N7FhHz

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

