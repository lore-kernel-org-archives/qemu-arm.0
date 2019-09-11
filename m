Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1035239wrp;
        Wed, 11 Sep 2019 08:54:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwzp/M4RJTmtJVpe6tBxjpURG0aQis38n87fm78f1YSnCeC9Y/LQkqasVtktRKDXB4SMtEm
X-Received: by 2002:a50:b885:: with SMTP id l5mr36139972ede.190.1568217296758;
        Wed, 11 Sep 2019 08:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568217296; cv=none;
        d=google.com; s=arc-20160816;
        b=V2TXsvie2r9vorX9hjk829Mh/83Ux6tNgsH42h9NgnoHScetqyMToadF3g+khE3lpF
         Mv7qQhVPCd62UEHiAmmndiAMuoQ37k3wUaGBf2enDUsv0npOvcgKhZ10SVQnYkBsV3WB
         /EqXxaCl90l88CZsnJEDTX2IJzsBV10MehJ8OXJmmceOZkZanG5FCjv1v9ZDWwqPr3In
         Up9IlkuhEk7+y6FJtXcSDUPdGYHQmnOosu0QnXILiUIHlzZJqKbygjT/LBcPKq+4qNlv
         HzB2cufZeTLf3OI3JDI680XgLO/jbqf4KJHbAvmr6y2IWO/e2gP8hsEYAXJfudO8B5pQ
         qsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=er/7tjw+adpuHgbjDCxAD8UQ09LXUwOxioC5t6IKi/g=;
        b=lI/+lbfrSwZ5d5STnfr8EEZvvBdzHXAFJKUat4N3VSGQHSRIMxFbS89hdfPL7ipYsQ
         HAbMgJH8BqpU2A2DXYBV3DPRzTN7fWi0IOF1VTmR1KPHQZFV8jGWZS+oLPLLOYLKJa0s
         xYRDdmTcmflrreidI5EdyGMW0AzD1hpFjDpmqTGlATWN44MPQvlZugxHYVgPY6NqelC0
         5t1AIBIosmDKbED7xVKUvQ9M8nHuF0J3bVQA3woHfZqz5+qfW3EH7omjGuNYU+BxIki/
         tjb8ScEBQAsx/frfZYMwTy1MIMerUBnuxTFkSGJJEJ6jO6gWUCuwB358AlVBi8jerto8
         Fb9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5si9268873ejd.400.2019.09.11.08.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 08:54:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i84xK-0004Xn-T6
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 11:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59952)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i84uP-0002Jp-Rl
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:51:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i84uO-00039P-No
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:51:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55328)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i84uJ-00036x-A1; Wed, 11 Sep 2019 11:51:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8477310F23E0;
 Wed, 11 Sep 2019 15:51:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-168.ams2.redhat.com [10.36.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF5B060852;
 Wed, 11 Sep 2019 15:51:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 11 Sep 2019 17:51:25 +0200
Message-Id: <20190911155125.11932-4-eric.auger@redhat.com>
In-Reply-To: <20190911155125.11932-1-eric.auger@redhat.com>
References: <20190911155125.11932-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Wed, 11 Sep 2019 15:51:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 3/3] virt: Check KVM_CAP_ARM_IRQ_LINE_LAYOUT_2
 for smp_cpus > 256
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yuzenghui@huawei.com, maz@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AdAeSrOCld/6

Host kernel within [4.18, 5.3] report an erroneous KVM_MAX_VCPUS=3D512
for ARM. The actual capability to instantiate more than 256 vcpus
was fixed in 5.4 with the upgrade of the KVM_IRQ_LINE ABI to support
vcpu id encoded on 12 bits instead of 8 and a redistributor consuming
a single KVM IO device instead of 2.

So let's check this capability when attempting to use more than 256
vcpus.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c        |  4 ++++
 target/arm/kvm.c     | 21 +++++++++++++++++++++
 target/arm/kvm_arm.h | 15 +++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0d1629ccb3..465e3140f7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1575,6 +1575,10 @@ static void machvirt_init(MachineState *machine)
         virt_max_cpus =3D GIC_NCPU;
     }
=20
+    if (kvm_arm_irq_line_layout_mismatch(MACHINE(vms), max_cpus)) {
+        exit(1);
+    }
+
     if (max_cpus > virt_max_cpus) {
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs=
 "
                      "supported by machine 'mach-virt' (%d)",
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 6cdfa2204f..b601e2f35a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -171,6 +171,27 @@ bool kvm_arm_pmu_supported(CPUState *cpu)
     return kvm_check_extension(s, KVM_CAP_ARM_PMU_V3);
 }
=20
+bool kvm_arm_irq_line_layout_mismatch(MachineState *ms, int vcpus)
+{
+    KVMState *s;
+    bool ret;
+
+    if (!kvm_enabled()) {
+        return false;
+    }
+
+    s =3D KVM_STATE(ms->accelerator);
+
+    ret =3D vcpus > 256 &&
+          !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2);
+
+    if (ret) {
+        error_report("Using more than 256 vcpus requires a host kernel "
+                     "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
+    }
+    return ret;
+}
+
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     KVMState *s =3D KVM_STATE(ms->accelerator);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b4e19457a0..d893d950d8 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -233,6 +233,16 @@ bool kvm_arm_pmu_supported(CPUState *cs);
  */
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
=20
+/**
+ * kvm_arm_irq_line_layout_mismatch - Returns whether the number of vcpu=
s
+ * exceeds the limit imposed by the legacy KVM_IRQ_LINE ARM layout
+ * (without the vcpu2_index field).
+ *
+ * @ms: Machine state handle
+ * @vcpus: number of vcpus
+ */
+bool kvm_arm_irq_line_layout_mismatch(MachineState *ms, int vcpus);
+
 /**
  * kvm_arm_sync_mpstate_to_kvm
  * @cpu: ARMCPU
@@ -281,6 +291,11 @@ static inline int kvm_arm_get_max_vm_ipa_size(Machin=
eState *ms)
     return -ENOENT;
 }
=20
+static inline bool kvm_arm_irq_line_layout_mismatch(MachineState *ms, in=
t vcpus)
+{
+    return false;
+}
+
 static inline int kvm_arm_vgic_probe(void)
 {
     return 0;
--=20
2.20.1

