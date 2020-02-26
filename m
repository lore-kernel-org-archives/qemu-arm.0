Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3314082lfg;
        Wed, 26 Feb 2020 09:05:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqyfoI81I2SV9WEknRraHbPRQteKss+XMYqpL8FBi8uWnx5Ywj0TYKm4p0zXCgk3EqFHNqUG
X-Received: by 2002:a17:906:ecf9:: with SMTP id qt25mr5704341ejb.160.1582736754046;
        Wed, 26 Feb 2020 09:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582736754; cv=none;
        d=google.com; s=arc-20160816;
        b=pg0TN88iIESDwZMAaKlFmaril8HzLjNt/Sbr4tgjAe80PUwRdxf4PQK8oyoF3Fsf/j
         F1h7kihVFzhmTNWuI3U+yGd++1+w/vw7zNtyn9mXud+hAxfxvfxPKOCrNeDJrbujaWAs
         iWe44cYpv7kS1NiRQsrWBak2uC/ZMekViNqLVm2g41soO8V1xyTRx1Y2VBwKAW25q6hu
         ccszuCSeNDxYlqRb3fPCqNSY51qg/wB2CDkJ9vYd6weOlIMH2PF9HtWOZaB67y4Kvni2
         VTUONISWMUquaEZUtabtZpbzzDvjwXRhTRFYvFvM5b6W1QZg3aNZs7i8VLprdhg9v+ZW
         eq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fiMsdSkcu0d/zaxBgsd4aL2q7dO5OqlYmsSRAPcXRGk=;
        b=ytxgxAsCS3AFlGaYS6TM6NbO544AHtFocA3iW5axMoIn5hOiyvEp7KT3E3DBO4fKTd
         2mrZ752t2CV/OCC42gjtGJ/e1E4QcvGHtuT1/mbRFl/u0afIcBlnUi9zYKKomIyNFc6Z
         kIbJZj8AI/w0kZXvISJ3ok5qq5N2lTwRHSOlntd9UynuNZp/3OpVGLYYbvREXpBXcVlZ
         1MgfwseFdY02yj3iY060aCM/yd4vdiXLSgzvJD/Ljb74/854Dt7VKZl9TeWCJOsx8wxD
         ME816Kxj0FUdzcFFNk08X0Ylm4K7cA+AEgvds+1wqLZb6wqR72rn+UqCAJxsIMwNkVel
         /mNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OmaCMbrv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j23si67244ejs.244.2020.02.26.09.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 09:05:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OmaCMbrv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7088-0005Rx-VN
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 12:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j707q-0005AY-6r
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:05:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j707o-0003G9-Hd
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:05:33 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29111
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j707k-0003Bx-8q
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582736727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fiMsdSkcu0d/zaxBgsd4aL2q7dO5OqlYmsSRAPcXRGk=;
 b=OmaCMbrvU3slUD/4EAsl6xaTmSPYmVTgH0gPPszjyo776XegdV3T04Y9E6PlBZrTpCdD/e
 JOxSgiozDHeZ2iISNhgfst+f+gkeKvW28pNTB9X5s1ir0fJ00MPFE+85aG0yTef0wTZ1w+
 eTMCq3ArPMBXgoLAb1tmPwb05DuwU0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-qg8SwqGVMLuiPFbyRemx8A-1; Wed, 26 Feb 2020 12:05:25 -0500
X-MC-Unique: qg8SwqGVMLuiPFbyRemx8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F9CF800D55;
 Wed, 26 Feb 2020 17:05:19 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24A0861069;
 Wed, 26 Feb 2020 17:05:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [RFC 1/2] target/arm/kvm: Let kvm_arm_vgic_probe() return a bitmap
Date: Wed, 26 Feb 2020 18:04:59 +0100
Message-Id: <20200226170500.17028-2-eric.auger@redhat.com>
In-Reply-To: <20200226170500.17028-1-eric.auger@redhat.com>
References: <20200226170500.17028-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CRiru+Ka4IlI

Let convert kvm_arm_vgic_probe() so that it returns a
bitmap of supported VGIC versions. This allows to expose
the case where the host GICv3 also supports GICv2 emulation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c        | 11 +++++++++--
 target/arm/kvm.c     | 14 ++++++++------
 target/arm/kvm_arm.h |  3 +++
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e591a126e7..a196bbf0d5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1540,11 +1540,18 @@ static void machvirt_init(MachineState *machine)
                 vms->gic_version =3D 3;
             }
         } else {
-            vms->gic_version =3D kvm_arm_vgic_probe();
-            if (!vms->gic_version) {
+            int probe_bitmap =3D kvm_arm_vgic_probe();
+
+            if (!probe_bitmap) {
                 error_report(
                     "Unable to determine GIC version supported by host");
                 exit(1);
+            } else {
+                if (probe_bitmap & KVM_ARM_VGIC_V3) {
+                    vms->gic_version =3D 3;
+                } else {
+                    vms->gic_version =3D 2;
+                }
             }
         }
     }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 85860e6f95..390077c518 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -874,15 +874,17 @@ int kvm_arch_irqchip_create(KVMState *s)
=20
 int kvm_arm_vgic_probe(void)
 {
+    int val =3D 0;
+
     if (kvm_create_device(kvm_state,
                           KVM_DEV_TYPE_ARM_VGIC_V3, true) =3D=3D 0) {
-        return 3;
-    } else if (kvm_create_device(kvm_state,
-                                 KVM_DEV_TYPE_ARM_VGIC_V2, true) =3D=3D 0)=
 {
-        return 2;
-    } else {
-        return 0;
+        val |=3D KVM_ARM_VGIC_V3;
     }
+    if (kvm_create_device(kvm_state,
+                          KVM_DEV_TYPE_ARM_VGIC_V2, true) =3D=3D 0) {
+        val |=3D KVM_ARM_VGIC_V2;
+    }
+    return val;
 }
=20
 int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index ae9e075d75..48bf5e16d5 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -15,6 +15,9 @@
 #include "exec/memory.h"
 #include "qemu/error-report.h"
=20
+#define KVM_ARM_VGIC_V2   (1 << 0)
+#define KVM_ARM_VGIC_V3   (1 << 1)
+
 /**
  * kvm_arm_vcpu_init:
  * @cs: CPUState
--=20
2.20.1

