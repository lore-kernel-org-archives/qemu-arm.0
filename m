Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp632081lfc;
        Wed, 11 Mar 2020 04:17:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsLOP+PnVfVXarDs9vcbgjw7xd5awbFlwsmRQK1ah2IL2+vwNUlmjvspIJLRGuUEmbY2jMc
X-Received: by 2002:ad4:49b2:: with SMTP id u18mr2374533qvx.102.1583925436293;
        Wed, 11 Mar 2020 04:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583925436; cv=none;
        d=google.com; s=arc-20160816;
        b=zOLEb/TLQaMxQbVCFqLCfdiSc5+j0cAMZ9YLG2PV7HU08W1Z5mTb9/9Cj/hrQaCupc
         Ob6d8BV33ZcaDUVXyaG4jLSdATIDG2N+z2C2PAeqYnGDoKgfTXB9aCy4L+oKhwxgdOHo
         D5+chUplPc9KBZegRWHEL/VLLYxdxeFnqp8riljOPb39uQeJGSZKrKvHeMe/6xr2q1cK
         cZ3ISGFHB6OvYgFgHsG9hBQ1Tbb6TwB6xi0D+24BgoV7VxPtBaSRW0njvarzwbcg/DFC
         V2mxsGYwEDGcP3R2sol7koKoWhD+HUG3mCIJkKf6yUXfb4Uvtt5P8d6rJHqy60sSoXwy
         VTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zeB6cFMegs4WqfD1Cvq2byvQge1aNrou1NeftyjBdtw=;
        b=bhcbmqnEK7m26mkyQ9TbXJwLcCSAL1E6WMhHrGUifka9X8zyEXZQaWTM0GQqbFA5qd
         IQ7cHG4RjQN+2GWPkTy3gwolbRr67wJWgBZ6g92Sp61AD5NUR5hmR1TH2b57JhOFTvyE
         jAa5FMy+Qa7EWeL34WOcSh+LO1+i/F8Z1R4S2AB8F/w4ucUvYljKIMMv+3aw+GL4KzOy
         L7bU6I+7/91Ue8cZ9920f++UjckaQOcqIse2aGaP3ZYPWinlMSNzzkk/KrvZU+tf142e
         46tyq3g9hJVAKRHxHBq5FAWHhBceHvC8ATOKW6ljXIo/TKPZ201mHrBOlZrbiO8QAWup
         hZuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dirjsuba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h125si828337qke.59.2020.03.11.04.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 04:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dirjsuba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBzMR-00022Q-Nc
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 07:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55580)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jBzM3-0001ru-PQ
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 07:16:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jBzM2-0000IQ-Eu
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 07:16:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26994
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jBzM2-0000I6-A5
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 07:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583925409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zeB6cFMegs4WqfD1Cvq2byvQge1aNrou1NeftyjBdtw=;
 b=DirjsubaZdaavE3vlnqjOnuLden8pe4IT3sz78LYnwiRNeE4g3jHLRmN+F53u6nJ9ahqEp
 HJUIhNYon4fEBT50EinOH49DSuZA7hhbXlw0UZt5NmT9h8N7qX9oA/6jUXAtotfxKXtXOq
 mZg8CxLpVHSa4jBApeByAOs4x+arCZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-iSNzgdEDMjK8x2hj_1mXag-1; Wed, 11 Mar 2020 07:16:47 -0400
X-MC-Unique: iSNzgdEDMjK8x2hj_1mXag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EB48DB61;
 Wed, 11 Mar 2020 11:16:46 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFBFE91D9B;
 Wed, 11 Mar 2020 11:16:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 3/6] hw/arm/virt: Introduce finalize_gic_version()
Date: Wed, 11 Mar 2020 12:16:23 +0100
Message-Id: <20200311111626.5705-4-eric.auger@redhat.com>
In-Reply-To: <20200311111626.5705-1-eric.auger@redhat.com>
References: <20200311111626.5705-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: maz@kernel.org, drjones@redhat.com, richard.henderson@linaro.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1PQ/fTP3I5qr

Let's move the code which freezes which gic-version to
be applied in a dedicated function. We also now set by
default the VIRT_GIC_VERSION_NO_SET. This eventually
turns into the legacy v2 choice in the finalize() function.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>

---

v2 -> v3:
- add NOTSEL value at the end of the new enum type
---
 include/hw/arm/virt.h |  1 +
 hw/arm/virt.c         | 54 ++++++++++++++++++++++++++-----------------
 2 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c0827cacdf..893796d3b0 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -100,6 +100,7 @@ typedef enum VirtGICType {
     VIRT_GIC_VERSION_HOST,
     VIRT_GIC_VERSION_2,
     VIRT_GIC_VERSION_3,
+    VIRT_GIC_VERSION_NOSEL,
 } VirtGICType;
=20
 typedef struct MemMapEntry {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4ed1f0cb2e..22da0a7ad7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1535,6 +1535,37 @@ static void virt_set_memmap(VirtMachineState *vms)
     }
 }
=20
+/*
+ * finalize_gic_version - Determines the final gic_version
+ * according to the gic-version property
+ *
+ * Default GIC type is v2
+ */
+static void finalize_gic_version(VirtMachineState *vms)
+{
+    if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST ||
+        vms->gic_version =3D=3D VIRT_GIC_VERSION_MAX) {
+        if (!kvm_enabled()) {
+            if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST) {
+                error_report("gic-version=3Dhost requires KVM");
+                exit(1);
+            } else {
+                /* "max": currently means 3 for TCG */
+                vms->gic_version =3D VIRT_GIC_VERSION_3;
+            }
+        } else {
+            vms->gic_version =3D kvm_arm_vgic_probe();
+            if (!vms->gic_version) {
+                error_report(
+                    "Unable to determine GIC version supported by host");
+                exit(1);
+            }
+        }
+    } else if (vms->gic_version =3D=3D VIRT_GIC_VERSION_NOSEL) {
+        vms->gic_version =3D VIRT_GIC_VERSION_2;
+    }
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(machine);
@@ -1561,25 +1592,7 @@ static void machvirt_init(MachineState *machine)
     /* We can probe only here because during property set
      * KVM is not available yet
      */
-    if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST ||
-        vms->gic_version =3D=3D VIRT_GIC_VERSION_MAX) {
-        if (!kvm_enabled()) {
-            if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST) {
-                error_report("gic-version=3Dhost requires KVM");
-                exit(1);
-            } else {
-                /* "max": currently means 3 for TCG */
-                vms->gic_version =3D VIRT_GIC_VERSION_3;
-            }
-        } else {
-            vms->gic_version =3D kvm_arm_vgic_probe();
-            if (!vms->gic_version) {
-                error_report(
-                    "Unable to determine GIC version supported by host");
-                exit(1);
-            }
-        }
-    }
+     finalize_gic_version(vms);
=20
     if (!cpu_type_valid(machine->cpu_type)) {
         error_report("mach-virt: CPU type %s not supported", machine->cpu_=
type);
@@ -2140,8 +2153,7 @@ static void virt_instance_init(Object *obj)
                                     "Set on/off to enable/disable using "
                                     "physical address space above 32 bits"=
,
                                     NULL);
-    /* Default GIC type is v2 */
-    vms->gic_version =3D VIRT_GIC_VERSION_2;
+    vms->gic_version =3D VIRT_GIC_VERSION_NOSEL;
     object_property_add_str(obj, "gic-version", virt_get_gic_version,
                         virt_set_gic_version, NULL);
     object_property_set_description(obj, "gic-version",
--=20
2.20.1

