Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2661600wrw;
        Sun, 11 Nov 2018 19:21:28 -0800 (PST)
X-Google-Smtp-Source: AJdET5fsCzED2eCHk5bsBXTfIVkcgUVetstJzAiG0CBzOSbxejGtpq1CqcT8cshMQX8ClUtOxYeR
X-Received: by 2002:a37:298f:: with SMTP id p15mr16894144qkp.327.1541992888415;
        Sun, 11 Nov 2018 19:21:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541992888; cv=none;
        d=google.com; s=arc-20160816;
        b=YveiKJyHVcxHGUz2Kkg3ToZ4niNEVhXi5Ds0fx2utUmivWErPCxHoGYchS+Uq3v182
         h6Aq5r3SHn2PE5Ga5mqVHf5e9xwzX/hDmXb5qGf5EBZTJQnRjmMZmZ92kIGX/ffBDvwE
         9MrZ5mr8U5rwhfOnAodgKxzB/Jz5sbwGoECjauCk5yzkRHUkYt2fD70Dg2R2NmNVC3Gu
         /7BzlL2MCNZGGPi5ueUCX+zz+uIYm9VV8+RvQELTq30GxyORHw4dSU1oaIdTPVgG+XBW
         2ZzCUFeyHFT1NAk2TPOXgelsSFbswNnuf3VlsJKNPILoMXw8kbN9vV3i0RqpnHjZGQp2
         9ofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=piRz2dTBO2OUaV0PUUV5/1BIjkRPMGivps8OBKtfOcM=;
        b=oSKDgfjVEUI6e2fhVREjC2cPhzbk0KAoNuNL9vZM0R2F0oZoyNSNSgJrRxeIGRx9As
         vRK98LgwrTnRzfjDqDvRhXRzVr6RiPB3MFhjZOXxQafCe+eMOxZioiLTfo9ASD4eVBkn
         xGY+27LoXcrpYNwUKgYrzL7ToAKMWvSoEIlctPg1/9xgJ9vlTP6CsK0a7GBFFOWauh27
         2UFZP9S2U5u0ueU+kx5KVOoAH3eOPoPNciL6wt26V/MkQdqV4dMaB4DR2OeoGnrIGxGH
         HTA9FP74H+fTqepY1c/RFxORzLecH0Nox3/gStLQYJ0FHIwiEURKTjJnKiCVDFfFnApp
         q8Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d32si5817489qtd.307.2018.11.11.19.21.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 19:21:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44568 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gM2n1-0002R4-AS
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 22:21:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2mi-0002Pf-71
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 22:21:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2mg-00048Z-9Y
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 22:21:08 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:33074 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gM2mf-00042z-R8; Sun, 11 Nov 2018 22:21:06 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 2AA7E2CF90A55F95AF27;
	Mon, 12 Nov 2018 11:20:01 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAC3Jooi084858;
	Mon, 12 Nov 2018 11:19:50 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111211195446-10076090 ;
	Mon, 12 Nov 2018 11:19:54 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Mon, 12 Nov 2018 19:42:18 +0800
Message-Id: <1542022940-46849-5-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
References: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-12 11:19:54,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-12 11:19:50
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAC3Jooi084858
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V6 4/6]  hw/arm/virt: Use the pvpanic device
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: detDkVf8dUqh

 Add pvpanic device in arm virt machine.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 default-configs/arm-softmmu.mak |  1 +
 hw/arm/virt.c                   | 21 +++++++++++++++++++++
 include/hw/arm/virt.h           |  1 +
 3 files changed, 23 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.=
mak
index 2420491..50345df 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -159,3 +159,4 @@ CONFIG=5FPCI=5FDESIGNWARE=3Dy
 CONFIG=5FSTRONGARM=3Dy
 CONFIG=5FHIGHBANK=3Dy
 CONFIG=5FMUSICPAL=3Dy
+CONFIG=5FPVPANIC=3Dy
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9f67782..c4f29c8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,7 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/misc/pvpanic.h"
=20
 #define DEFINE=5FVIRT=5FMACHINE=5FLATEST(major, minor, latest) \
     static void virt=5F##major##=5F##minor##=5Fclass=5Finit(ObjectClass *o=
c, \
@@ -143,6 +144,7 @@ static const MemMapEntry a15memmap[] =3D {
     [VIRT=5FGPIO] =3D               { 0x09030000, 0x00001000 },
     [VIRT=5FSECURE=5FUART] =3D        { 0x09040000, 0x00001000 },
     [VIRT=5FSMMU] =3D               { 0x09050000, 0x00020000 },
+    [VIRT=5FPVPANIC] =3D            { 0x09070000, 0x00000002 },
     [VIRT=5FMMIO] =3D               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM=5FVIRTIO=5FTRANSPORTS, each of that=
 size */
     [VIRT=5FPLATFORM=5FBUS] =3D       { 0x0c000000, 0x02000000 },
@@ -190,6 +192,23 @@ static bool cpu=5Ftype=5Fvalid(const char *cpu)
     return false;
 }
=20
+static void create=5Fpvpanic=5Fdevice(const VirtMachineState *vms)
+{
+    char *nodename;
+    hwaddr base =3D vms->memmap[VIRT=5FPVPANIC].base;
+    hwaddr size =3D vms->memmap[VIRT=5FPVPANIC].size;
+
+    sysbus=5Fcreate=5Fsimple(TYPE=5FPVPANIC=5FMMIO, base, NULL);
+
+    nodename =3D g=5Fstrdup=5Fprintf("/pvpanic-mmio@%" PRIx64, base);
+    qemu=5Ffdt=5Fadd=5Fsubnode(vms->fdt, nodename);
+    qemu=5Ffdt=5Fsetprop=5Fstring(vms->fdt, nodename,
+                            "compatible", "qemu,pvpanic-mmio");
+    qemu=5Ffdt=5Fsetprop=5Fsized=5Fcells(vms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    g=5Ffree(nodename);
+}
+
 static void create=5Ffdt(VirtMachineState *vms)
 {
     void *fdt =3D create=5Fdevice=5Ftree(&vms->fdt=5Fsize);
@@ -1531,6 +1550,8 @@ static void machvirt=5Finit(MachineState *machine)
=20
     create=5Fflash(vms, sysmem, secure=5Fsysmem ? secure=5Fsysmem : sysmem=
);
=20
+    create=5Fpvpanic=5Fdevice(vms);
+
     create=5Fgic(vms, pic);
=20
     fdt=5Fadd=5Fpmu=5Fnodes(vms);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4cc57a7..937c124 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -66,6 +66,7 @@ enum {
     VIRT=5FGIC=5FREDIST,
     VIRT=5FGIC=5FREDIST2,
     VIRT=5FSMMU,
+    VIRT=5FPVPANIC,
     VIRT=5FUART,
     VIRT=5FMMIO,
     VIRT=5FRTC,
--=20
1.8.3.1

