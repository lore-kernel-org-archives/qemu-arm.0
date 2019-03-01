Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp644925wrx;
        Fri, 1 Mar 2019 05:48:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqxBsHw7DYfq6HKq4DuOmYS+lk9qugpbx8WTw+rzMNXGl5zhs8wlSPc3zUQJ0FpFiwQoPrlU
X-Received: by 2002:a25:abeb:: with SMTP id v98mr4177789ybi.480.1551448088353;
        Fri, 01 Mar 2019 05:48:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551448088; cv=none;
        d=google.com; s=arc-20160816;
        b=Syz4BqjKV8SRw/QTdHiHDEsZTwdfXjRtVJoho+x1DNlcIp9MeGI/qEWsMtINcsDVuH
         Ka1vxHBabORzBQK5Q3IxZDAOvtsAXgR2AwmQY2WnjHqznqGB3MToQFD8Tc8CDCCm9YvJ
         9bdESlT8GjD17/HyqyJ5r5tNfQEDMoxOENHQYLycGbF/DErwenMA5sdJZVeVr1BWWK9/
         S8gLpp3KlUGuFtC4W7uG0QqNUP+RrrCNn9/M3a1mR+XNxTEKj2rraLvI99sGs1QBMFTU
         n3/Lb8ymHyStvkEd+RH0oQOlWJLiZryX620eVB+jFhek5EgypInHNa+VDKplXhES0Ynt
         QEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dXvRLu+M+eEYlTOjnvt/OqXnRdcRRARrJZI+ZQ7JUB4=;
        b=zD6jvV8WuhOeGOBZbmqVNyiVjRIxFvSqML0XiNQugGAM+srfME/BYfUaSEoyjfOM7Y
         OPMOQrIo+rvbEnRTYDh85niQpnGdCKvwP6CpCGP+SAH9+oSy+v7cxytqrqTRgt2p+Iqp
         V05X/W63rcd+7b4eQfV/cBy83HOyBBV3zF0xebXH/66/J/Pzy6ROIEh1Q+sOc/LWTI+M
         tR5ehf4Vd9D9t2R17l/jzQmYLgeWzsIhsNbNLsfbw6ASSQphS4tHktaeSbOLHlZB3oRT
         XNtF5lvQfdWFL4EO9yyguLcQPhekvWWFmorM1eRMTTLLNPjUn4u7UDp8FxKuY/kJ8xzy
         +siw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o132si12461857ywo.220.2019.03.01.05.48.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 05:48:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gziWF-0002x7-NL
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 08:48:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gziVs-0002rF-Vx
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 08:47:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gziVr-0002ir-CZ
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 08:47:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43804)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gziVr-0002gi-19; Fri, 01 Mar 2019 08:47:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BA433070264;
	Fri,  1 Mar 2019 13:47:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80F625D717;
	Fri,  1 Mar 2019 13:47:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Fri,  1 Mar 2019 14:47:04 +0100
Message-Id: <20190301134709.4695-6-eric.auger@redhat.com>
In-Reply-To: <20190301134709.4695-1-eric.auger@redhat.com>
References: <20190301134709.4695-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 01 Mar 2019 13:47:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v11 05/10] kvm: add kvm_arm_get_max_vm_ipa_size
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: skkEmDM1wCN1

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

