Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2298156lfg;
        Mon, 2 Mar 2020 02:56:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqz82iF57njRo8SsQsT713nc3GQojpBPyYIUYa+12eOGJGQCTmJM4ocB8t6NvFBXup8dNjVV
X-Received: by 2002:ac8:425a:: with SMTP id r26mr15150117qtm.138.1583146560521;
        Mon, 02 Mar 2020 02:56:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583146560; cv=none;
        d=google.com; s=arc-20160816;
        b=x5YOMT1mXNleLnuMFJUgMVfXmtZI1qC/83hm51GLnLc/hTU45YMofotFTDhO+n9NS1
         IECvkZhKKVK5gOWvhkP/yuBQuMobViao0JDcTyOrLPujBSBwzeUotNJe4W0cXFzx2Uss
         06iB5gcMMI9r+b2IfAVC/KoKhVyIEEr3dHoPsnqEZFdzvVUwlmyZ0ZwOlMksL0Pm6bxq
         YcZ/YuWdCwgMODfroPB1rdVC0W5h3mCszPaEiUtUedszquA9KQw7+WSQ4zWr+C5KEY+t
         FZMpdHnga9ez9bGn91d2AM4Xej0b4IckuY35DAyihP/FlcJP3DlKJkunKMqHAhG02VUv
         r+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T6nJe3eQ8rW2+21nG+AcWSCiN0SMuEbkmlN6bWatc18=;
        b=yy6N+D4bKQeJz7zgmMyFx/CU07Nd+AX0EgD/mJn2Tj0JMVxXohIIKyl4OHfitgtOhm
         m8eJkiQ00mGADw7kryeBC0p4aYgO3TsD6+ChWEoZeI8XP7HbIwVwzpHmNhz6j2ys1u69
         hv4jVxg874XK3cYVjn3u1sOenN8QRHcT574cuLaQwWWSYRlq/b2I2/HdtAEjP/DfxAUN
         I265V1yy10v2sNsd8fhE3eTOwU8jsgfgeAPV8E1cy86yjXfejOywvIVSWTLfEiPHLzFd
         79sKCprPJpu7Nk86KdngLf/pq7oDpD27pPCxvAtDcgUUun5cZZ4bT+EUR35aM/WsQUEP
         1PDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JKuoPTkm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si1035845qke.50.2020.03.02.02.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 02:56:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JKuoPTkm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8ijv-0008AV-PQ
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 05:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j8ija-00083b-G4
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijZ-00045B-Ba
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52081
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j8ijZ-000453-7i
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583146536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6nJe3eQ8rW2+21nG+AcWSCiN0SMuEbkmlN6bWatc18=;
 b=JKuoPTkmUyMVOE11kjyBmO+EdP7a69sMqfr4Bk4vzh0/vGkOG1bXciSyZ9ug0J9zzd93w7
 fZpQsd6svwrr2B4RgBa4+qR5bzfoNtdAMk3GSOqMJHvBves8rkGIqKvBlWTnM6vmHmQ6eF
 5Wfbx+nXBzjRTPUwMsfyjxvva2wP5RI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-JWGKAbg-OsWKoJkTSRrqAQ-1; Mon, 02 Mar 2020 05:55:33 -0500
X-MC-Unique: JWGKAbg-OsWKoJkTSRrqAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6798210509AD;
 Mon,  2 Mar 2020 10:55:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96810385;
 Mon,  2 Mar 2020 10:55:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 4/6] target/arm/kvm: Let kvm_arm_vgic_probe() return a
 bitmap
Date: Mon,  2 Mar 2020 11:55:14 +0100
Message-Id: <20200302105516.5972-5-eric.auger@redhat.com>
In-Reply-To: <20200302105516.5972-1-eric.auger@redhat.com>
References: <20200302105516.5972-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-TUID: b9x3ZR3Dfaf7

Convert kvm_arm_vgic_probe() so that it returns a
bitmap of supported in-kernel emulation VGIC versions instead
of the max version: at the moment values can be v2 and v3.
This allows to expose the case where the host GICv3 also
supports GICv2 emulation. This will be useful to choose the
default version in KVM accelerated mode.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c        | 11 +++++++++--
 target/arm/kvm.c     | 14 ++++++++------
 target/arm/kvm_arm.h |  3 +++
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 338d56999f..eb8c57c85e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1553,11 +1553,18 @@ static void finalize_gic_version(VirtMachineState *=
vms)
                 vms->gic_version =3D VIRT_GIC_VERSION_3;
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
+                    vms->gic_version =3D VIRT_GIC_VERSION_3;
+                } else {
+                    vms->gic_version =3D VIRT_GIC_VERSION_2;
+                }
             }
         }
     } else if (vms->gic_version =3D=3D VIRT_GIC_VERSION_NOSEL) {
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

