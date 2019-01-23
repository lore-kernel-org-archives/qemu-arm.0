Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp517705wrt;
        Wed, 23 Jan 2019 02:16:21 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6VA49tkMcwNR9xTCNxHrFG97Ecuz7eHrgsQnvHjYCzNKoeud0Y/SkozXX3X/4jnzm3zR5b
X-Received: by 2002:a5d:634b:: with SMTP id b11mr2014676wrw.14.1548238581814;
        Wed, 23 Jan 2019 02:16:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548238581; cv=none;
        d=google.com; s=arc-20160816;
        b=QBhHuwjQ/bC9x1Adypwn/sVQ5051mQSsIVZJBUdA+Cx64tyGOxEACL9iBMInDlxS43
         AMzNUOMPmInk3pzJtNt1vE5TCb1TVnpjCi/L+rf1s04Kzb7bzN3/Bcdtb52e+TM2uGD5
         w/ierU9tx+WZl8gLgyfkc+gtdeaDZMds9musAZal1MfkjQVxoQNSkXd9UaQiPFbRBI77
         KBGi5o8ce4AtUsGBbOpODo1s9vejIxKR9hkynC3BMyyxVRML/cu11t0Rvjbrd9kj8IsZ
         tbvAuEUVvrXiv1BC8nKgP7+PbPfZkOlejmrr84FsE9QJwynphF5uE5QEACE8Bnf3dhgF
         UgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UAZSnHVmdPT+BWK1PyZe/MTx5YfEWSPITGPG16AWmqk=;
        b=taoEVsp3EV6mHyxRtuhehnRVcZ0boB6u6opW24o9BivjxnVVSLcBfucR5fD8bK4jeN
         q2J8lX1NgmmRkJo83xdBTJ0VkkNO6uWgm2MNzCRZPtyfLgUQ461l5whM02s+X7yeQbfO
         bs+RJWr9C8SNBnR7tGR0C+k/M1sLcw/lalWq3tNCSou1yYjeqsouwXyO+JrNK8rHttJm
         yvumcEDTZeqlrQTJUe+pVlQDQnyWSqyjR1IrGSKnlA+X9SPv6nG1OFHAzttTF/ULyevl
         LupbYk78fHEWgD5ObD0LdGhzmGuEmA9KedXuoXGxgj1jQDEOJlX+tP3GKa+d1gokWluy
         Kb2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si29772866wre.6.2019.01.23.02.16.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:16:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFa0-0001hq-R8
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:16:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZQ-0001PZ-Be
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZO-0007FT-1c
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFZN-0007DS-Qh; Wed, 23 Jan 2019 05:15:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2216C0495AE;
	Wed, 23 Jan 2019 10:15:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 285D7601A5;
	Wed, 23 Jan 2019 10:15:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:47 +0100
Message-Id: <20190123101458.12478-8-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 23 Jan 2019 10:15:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 07/18] kvm: add kvm_arm_get_max_vm_phys_shift
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8LVVUg5OPgSu

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
index e00ccf9c98..877c588ef5 100644
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
@@ -162,6 +163,13 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     env->features =3D arm_host_cpu_features.features;
 }
=20
+int kvm_arm_get_max_vm_phys_shift(MachineState *ms)
+{
+    KVMState *s =3D KVM_STATE(ms->accelerator);
+
+    return kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_SIZE);
+}
+
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     /* For ARM interrupt delivery is always asynchronous,
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 6393455b1d..5969c41f83 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -207,6 +207,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeature=
s *ahcf);
  */
 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
=20
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
@@ -239,6 +250,11 @@ static inline void kvm_arm_set_cpu_features_from_hos=
t(ARMCPU *cpu)
     cpu->host_cpu_probe_failed =3D true;
 }
=20
+static inline int kvm_arm_get_max_vm_phys_shift(MachineState *ms)
+{
+    return -ENOENT;
+}
+
 static inline int kvm_arm_vgic_probe(void)
 {
     return 0;
--=20
2.20.1

