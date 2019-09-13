Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp542130wrp;
        Fri, 13 Sep 2019 02:57:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzuDb9lwKx/CCStfprNdvDSvxChdNX6JN/sxmMYdXzRa6w1u7tQ57VXbWtre4lNE+eBvDmY
X-Received: by 2002:ac8:7951:: with SMTP id r17mr2018615qtt.238.1568368632911;
        Fri, 13 Sep 2019 02:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568368632; cv=none;
        d=google.com; s=arc-20160816;
        b=BrSynP4U0MX0q33TNc2JXHxgD2CGrS1n74X49KZBYH0gtrvJ0eU2W2zgJQ/JMdMfdL
         k3er+hgv2i6mTw0mLdmbaZYWULul6B3T99UcGsmeOPDZn3qErKCbbngYEkB245MPwT+S
         G7Zm/kNGYY8WGqAyrbJEgCenZSWwUdK1YsxXdvbepCo9/hIDTJ9wlGzBFqswmFg//aC0
         ieScU4s7lLUX2V/vbl80XoYABNKLmKhWjA93AvwWIGioD/wmwYvdxTB5lBnRA/s0InAK
         RAVGeIKsux/q5jsUQloyhjjF+pv080+VY8GXE+pbAZvlXuwyyhYfkdEF9e4vli0iW9jJ
         kj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=8tsOLY0zBcl7qdWidPvH+ELR6ijqh+Y2wfvlGnkGz/I=;
        b=zevJqlhkXLPt1RKtXOkhkZytPXeb6tOdGHIW8ToftwES3NNwIgYuanchRaXiLJrP33
         AkcGPiJFiDQRzwjY34u8AQiahScrenR3m2ma6NNi8YzO2xF2pRmpG3BuDn+IK0SFwCBB
         ber1o5YygUOauThflLMJWiod8HrdrA+Wy6P288dHhK0ASMkhL+LmGbLuY3RMA2Du6rx7
         Z8MrzgSC3dJZRYigfJoGE3Yg7W+BZPQ0eXncdox8bDtstalvgv9zHqqOpKe7/fDsVIPS
         4HuUVI0vQ+9tABg862T4VQ3v/849lBWp1Bnu5ZwaOxfDgl9jRICRW60wLPLRrKIH9PtY
         iGWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si7471038qkj.33.2019.09.13.02.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2019 02:57:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8iKG-0008Kh-21
	for alex.bennee@linaro.org; Fri, 13 Sep 2019 05:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8iJz-0008G2-Ga
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 05:56:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8iJy-0007N4-Gc
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 05:56:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51016)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8iJy-0007Mv-Bp; Fri, 13 Sep 2019 05:56:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9FA72300C72B;
 Fri, 13 Sep 2019 09:56:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB97960C44;
 Fri, 13 Sep 2019 09:56:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 13 Sep 2019 11:56:39 +0200
Message-Id: <20190913095639.25447-4-eric.auger@redhat.com>
In-Reply-To: <20190913095639.25447-1-eric.auger@redhat.com>
References: <20190913095639.25447-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 13 Sep 2019 09:56:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 3/3] ARM: KVM: Check
 KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256
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
Cc: yuzenghui@huawei.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SmlurivPQRqS

Host kernel within [4.18, 5.3] report an erroneous KVM_MAX_VCPUS=3D512
for ARM. The actual capability to instantiate more than 256 vcpus
was fixed in 5.4 with the upgrade of the KVM_IRQ_LINE ABI to support
vcpu id encoded on 12 bits instead of 8 and a redistributor consuming
a single KVM IO device instead of 2.

So let's check this capability when attempting to use more than 256
vcpus within any ARM kvm accelerated machine.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- Implement the check in kvm_arch_init as suggested by Peter
---
 target/arm/kvm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b10581fa06..b473c63edb 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -182,6 +182,7 @@ int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
=20
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
+    int ret =3D 0;
     /* For ARM interrupt delivery is always asynchronous,
      * whether we are using an in-kernel VGIC or not.
      */
@@ -195,7 +196,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
=20
     cap_has_mp_state =3D kvm_check_extension(s, KVM_CAP_MP_STATE);
=20
-    return 0;
+    if (ms->smp.cpus > 256 &&
+        !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
+        error_report("Using more than 256 vcpus requires a host kernel "
+                     "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
+        ret =3D -EINVAL;
+    }
+
+    return ret;
 }
=20
 unsigned long kvm_arch_vcpu_id(CPUState *cpu)
--=20
2.20.1

