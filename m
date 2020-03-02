Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2300733lfg;
        Mon, 2 Mar 2020 02:59:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqwmrwbwRoGpPKtGt4AmCJ5L10ic+bHGcuFL+WpXoM9c1lIdXXRg8Y6ZoG99PghpVgFZKUDb
X-Received: by 2002:a37:6854:: with SMTP id d81mr15332673qkc.157.1583146767131;
        Mon, 02 Mar 2020 02:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583146767; cv=none;
        d=google.com; s=arc-20160816;
        b=SJUWtdNsuk7RES8D53Bsni9f4YEeNCrD/AWRe3xYeaXppnQouYr3tebtnndYEAj8jW
         ZJd1HvPTdflpMnxgrqsfVTXXW79drZlOO2wbiqVmdiF3vSHxaDzYDS9gIYC2ma8W+xng
         U5Cn5D+kBitHPkdIxLJcOpwuswHd5V+FZA7ZUZDzkiq6K6fhjzFfR7wKl7b6jb5urw1m
         ysxYJBgrU2TalROcSPFMa+/uPK7b6ZA6Q5adwN8jeX1oagqysVXHv3vzfWGjfvq8REQY
         a8lbnceFHEuiitJVhBDZ7BcDXCUOSLkLF3RxFwGgumYF8cEBdAwc0V41FsfgIlMUJETJ
         3ZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rxzzA7ONfUiFpNQxniznGhPZKJfiDxFGwvdTsIDhlts=;
        b=lPEWzYdMNfaa8vRO1hpS8enic/aBODka77jTN+mmLzDX5RqyczcWjSyXokDxjxrTrg
         Ov9xJXeWf8iJotyMjS4U6fng5KPQo1yO+s9dtwLs6XonRLcWplaX0DdxJhs3aGTUrqza
         cuLOZitS4DmPW9O/vw6KUM2sozXyMHf47IvHkWYrZbIyDrPFoKRHjXphn9STR0kTORqI
         sjPBJ6GBmi9QwWyrUjRZIEDEkzWYo2Ts7gRQbEz+vRH5TcQQy6rZSJr8vTMNsoMR5GLY
         dj3j3NN5ECyzp2V/tpCRbGJMMdiqjMajjcoAivUhD5T60ZSGKfxx01TrUm89Y/7L8bWu
         OoXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PcY1XZTO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si3757588qkf.202.2020.03.02.02.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 02:59:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PcY1XZTO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8inG-0005cx-KJ
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 05:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijc-00089W-W2
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijb-00047U-NN
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54514
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j8ijb-00046e-JH
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583146539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxzzA7ONfUiFpNQxniznGhPZKJfiDxFGwvdTsIDhlts=;
 b=PcY1XZTONa4VavssqDI8x53/Vgie+nma1bvwkdBlD2/6EWa7tZwJyvL/ErhRe48aXCv1jD
 DPE6g+Ma1jNW1uBqQRFLmEtYpz5ccJnLn2nETXMwi5CNNepKfODKjjprhTCQE4Dimh2TF1
 S2KohUI4GgamGhBL+RiMOz1Zxxz976g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-GrHsLY2SMwO2us2l3bnyWw-1; Mon, 02 Mar 2020 05:55:35 -0500
X-MC-Unique: GrHsLY2SMwO2us2l3bnyWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ED42800053;
 Mon,  2 Mar 2020 10:55:34 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C379F385;
 Mon,  2 Mar 2020 10:55:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 5/6] hw/arm/virt: kvm: Check the chosen gic version is
 supported by the host
Date: Mon,  2 Mar 2020 11:55:15 +0100
Message-Id: <20200302105516.5972-6-eric.auger@redhat.com>
In-Reply-To: <20200302105516.5972-1-eric.auger@redhat.com>
References: <20200302105516.5972-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: D4haDfxp8xBt

Restructure the finalize_gic_version with switch cases and, in
KVM mode, explictly check whether the chosen version is supported
by the host.

if the end-user explicitly sets v2/v3 and this is not supported by
the host, then the user gets an explicit error message.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>

---

v2 -> v3:
- explictly list V2 and V3 in the switch/case
- fix indent
---
 hw/arm/virt.c | 77 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 24 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index eb8c57c85e..aeb6c45e51 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1542,33 +1542,62 @@ static void virt_set_memmap(VirtMachineState *vms)
  */
 static void finalize_gic_version(VirtMachineState *vms)
 {
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
-            int probe_bitmap =3D kvm_arm_vgic_probe();
+    if (kvm_enabled()) {
+        int probe_bitmap =3D kvm_arm_vgic_probe();
=20
-            if (!probe_bitmap) {
-                error_report(
-                    "Unable to determine GIC version supported by host");
-                exit(1);
-            } else {
-                if (probe_bitmap & KVM_ARM_VGIC_V3) {
-                    vms->gic_version =3D VIRT_GIC_VERSION_3;
-                } else {
-                    vms->gic_version =3D VIRT_GIC_VERSION_2;
-                }
-            }
+        if (!probe_bitmap) {
+            error_report("Unable to determine GIC version supported by hos=
t");
+            exit(1);
         }
-    } else if (vms->gic_version =3D=3D VIRT_GIC_VERSION_NOSEL) {
+
+        switch (vms->gic_version) {
+        case VIRT_GIC_VERSION_NOSEL:
+            vms->gic_version =3D VIRT_GIC_VERSION_2;
+            break;
+        case VIRT_GIC_VERSION_HOST:
+        case VIRT_GIC_VERSION_MAX:
+            if (probe_bitmap & KVM_ARM_VGIC_V3) {
+                vms->gic_version =3D VIRT_GIC_VERSION_3;
+            } else {
+                vms->gic_version =3D VIRT_GIC_VERSION_2;
+            }
+            return;
+        case VIRT_GIC_VERSION_2:
+        case VIRT_GIC_VERSION_3:
+            break;
+        }
+
+        if (!kvm_irqchip_in_kernel()) {
+            return;
+        }
+
+        /* Check chosen version is effectively supported by the host */
+        if (vms->gic_version =3D=3D VIRT_GIC_VERSION_2 &&
+            !(probe_bitmap & KVM_ARM_VGIC_V2)) {
+            error_report("host does not support in-kernel GICv2 emulation"=
);
+            exit(1);
+        } else if (vms->gic_version =3D=3D VIRT_GIC_VERSION_3 &&
+                   !(probe_bitmap & KVM_ARM_VGIC_V3)) {
+            error_report("host does not support in-kernel GICv3 emulation"=
);
+            exit(1);
+        }
+        return;
+    }
+
+    /* TCG mode */
+    switch (vms->gic_version) {
+    case VIRT_GIC_VERSION_NOSEL:
         vms->gic_version =3D VIRT_GIC_VERSION_2;
+        break;
+    case VIRT_GIC_VERSION_MAX:
+        vms->gic_version =3D VIRT_GIC_VERSION_3;
+        break;
+    case VIRT_GIC_VERSION_HOST:
+        error_report("gic-version=3Dhost requires KVM");
+        exit(1);
+    case VIRT_GIC_VERSION_2:
+    case VIRT_GIC_VERSION_3:
+        break;
     }
 }
=20
--=20
2.20.1

