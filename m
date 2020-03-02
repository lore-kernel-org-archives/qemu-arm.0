Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2299113lfg;
        Mon, 2 Mar 2020 02:57:15 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuQ/HIs5KkRpQyEEL0c0ZobhICWsVIPEkjgH05tdQvYQXIIE1U5UinXolX0My80mfYnXe/H
X-Received: by 2002:a37:70e:: with SMTP id 14mr8445473qkh.290.1583146635112;
        Mon, 02 Mar 2020 02:57:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583146635; cv=none;
        d=google.com; s=arc-20160816;
        b=nZn4XNwQwoveP6/+hCZkF67iFXN+6WNCyMV1hmtoNseKwfmd+KiIA9GoJgaIejIszQ
         hN+xzBuTQm0z1Xh002hYRH7RnSDv8+29m9jZmWrGL5IhAnaXagaM8UCDg6beQawetVp5
         UJ3rd+5RsblPWGnA45xP9/JCHjksJFTUaDXglr4wPTVUQjaUVfP2gCrsBWT/Pc4v40RG
         6bVHiIbRoRDB2uljX2FYH9roq7xX5JtNfJGcsLrcjM54dMd8v6MSi1FKG/hdnSJZec6e
         RhZsACOmDu3nxXA2KzeI55ZVI7QbK1YjAeaa64Qg9nZ47hVNx7NpqcVVosm7dfUsxJWz
         izkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yESME0J2zi6n1uTTdPb/wvyyf9B/m1foWQEzYZZQ62Q=;
        b=MpFXI5OblmzKSGtjDe8HJrZyTjNE1D1XxdIxMnrU6qGMebnzQ4wvcQN4K6p3lurpME
         zQ4MpNXX3lAo/I/xC15Ahwuk2wf/4+CeBOnW7/8EgosV9mZJMx9ZzUgBuKvXpPFJ+bn1
         RAzIDxOM7BD5T5vCdY9/uTQ6unqxmu8J81WWIgWeH8fNvZdnV7LVfckN32XEZvQ3ga8F
         O/u1dTRY8JVOfMimWkwAfW2D48KSDRE3yMTVVJ0AbrFyw2PuyqKWi7nMppu2ZC4AtoUU
         bbjbD4E5Z2wDHyJ5HMMRhcO/PRRFxJG2vf8JgSb5jON3lA/l5C+YnuX70PPP1MhzI8LX
         VjUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="RYOP/2Qy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7si5696185qtd.328.2020.03.02.02.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 02:57:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="RYOP/2Qy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8il8-0001sX-Ff
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 05:57:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijW-0007ry-8F
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:55:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijV-00043Y-0U
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:55:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35338
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j8ijU-00043M-So
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583146532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yESME0J2zi6n1uTTdPb/wvyyf9B/m1foWQEzYZZQ62Q=;
 b=RYOP/2QyYmHlPcNtc4W0PxTDP6FIqTnorZ4eangNjqkxMfXyRpQ29Tr+uh5p/41B0X60Va
 kIhhtOhHtakFWNF6/W1oq/Yd+IuDgSdKCbiEt5Xdvst6T/pkY8KcH36WeHcPE9NLz/Ppi8
 agmBB4KvYzJAga/TiFyehdxE2xtoltE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-BZi8esCMPdG2wbvMCQlSrw-1; Mon, 02 Mar 2020 05:55:31 -0500
X-MC-Unique: BZi8esCMPdG2wbvMCQlSrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40DBC800D5F;
 Mon,  2 Mar 2020 10:55:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FA442719A;
 Mon,  2 Mar 2020 10:55:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 3/6] hw/arm/virt: Introduce finalize_gic_version()
Date: Mon,  2 Mar 2020 11:55:13 +0100
Message-Id: <20200302105516.5972-4-eric.auger@redhat.com>
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pJsiELB1xPZq

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
 hw/arm/virt.c         | 54 ++++++++++++++++++++++++++-----------------
 include/hw/arm/virt.h |  1 +
 2 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b449a445de..338d56999f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1534,6 +1534,37 @@ static void virt_set_memmap(VirtMachineState *vms)
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
@@ -1560,25 +1591,7 @@ static void machvirt_init(MachineState *machine)
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
@@ -2138,8 +2151,7 @@ static void virt_instance_init(Object *obj)
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
--=20
2.20.1

