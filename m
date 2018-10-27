Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1768416wro;
        Sat, 27 Oct 2018 02:57:18 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f5u1ytffGNROdKbRO6F+/vYDKlmf3QvNCvf8o6pf6jxjpw9V0qAx4nrbB82qy6eidYIS9S
X-Received: by 2002:ae9:c21a:: with SMTP id j26-v6mr5853663qkg.52.1540634238622;
        Sat, 27 Oct 2018 02:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540634238; cv=none;
        d=google.com; s=arc-20160816;
        b=jVRj4mlyLLhDaHrO3We1b3v0T00aAcY9sf30UhRVzMmQhl1Cx/4kPl9ZcgNuvUuXzI
         HeO4NCxvIeCZDZfXZL9BfRv/VL7wR7ZeK630tdNgnCfyTs1RhUOAxEpKjSrJQNHo8dCj
         r/cGjoVLzvzztB+zBxEyqx9+T8jSqzMXptxLG/H0jpg4UHgH7FAMg/Ks2pIXkJHC8iRj
         MefVEatjLwPB7iAJQZT5kKCr+kKE5PbimW2VC4AFwR6ns5131+3NIJR3bb0GQ7+P+PSg
         eURdJDqsrXlE1YJlO74j909kIuvm96fqXvwiKNMJQl04x520QnShE9Z6cCF23OOeC02f
         Qd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=J5SsW8B0oM/RiZKrP7w8NCyZTVT+jsgb0baN/xkxB/0=;
        b=Iwp9OwwQ0mSAjVaRWw3IkQUcCCM44azMQCj7CRBcZAAsWG81BiLxwUaHrPDznwFuvD
         ejWVQBIogYUIwycGXWiXHXThZ0MM4cBmSwXpfC/TZUf+K5mSnAhVfniPgQC1qR8YdPLz
         ZtOeG2wcRdW34uVji6jM942RJl7Nbrlg0m65pj30XNCVhDt13FR4IwexrOZVg35Wn4hC
         35/Luj8A/hA19CcUZY3UjkWhtwf/DTgOv5WVNp9oFZf+c59fJNa5CT6sSZeSoU6SGeJ+
         y599W82TlVVlhasoEfchaBUQzEUywQwXdCJR+cRyDzKcORVGJ5iZT8oDs+yZHGnawmVX
         Apgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i31-v6si996717qvd.196.2018.10.27.02.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Oct 2018 02:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gGLLK-00068z-4u
	for alex.bennee@linaro.org; Sat, 27 Oct 2018 05:57:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gGLL3-00067h-L4
	for qemu-arm@nongnu.org; Sat, 27 Oct 2018 05:57:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gGLL1-0003TO-Ar
	for qemu-arm@nongnu.org; Sat, 27 Oct 2018 05:57:01 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:37030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gGLL0-0003KN-UU; Sat, 27 Oct 2018 05:56:59 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 6EAEC1506D67DB051AA0;
	Sat, 27 Oct 2018 17:56:53 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9R9ukM3070674;
	Sat, 27 Oct 2018 17:56:46 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018102717573334-7044945 ;
	Sat, 27 Oct 2018 17:57:33 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, philmd@redhat.com
Date: Sun, 28 Oct 2018 02:07:29 +0800
Message-Id: <1540663650-106694-5-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
References: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-27 17:57:33,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-27 17:56:26
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn w9R9ukM3070674
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V5 4/5]  hw/arm/virt: Use the pvpanic device
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
X-TUID: pAq4CLm56cxc

add pvpanic device in aarch64 virt machine.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 default-configs/aarch64-softmmu.mak |  1 +
 hw/arm/virt.c                       | 21 +++++++++++++++++++++
 include/hw/arm/virt.h               |  1 +
 3 files changed, 23 insertions(+)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-=
softmmu.mak
index 6f790f0..57c6ca5 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -9,3 +9,4 @@ CONFIG=5FDPCD=3Dy
 CONFIG=5FXLNX=5FZYNQMP=3Dy
 CONFIG=5FXLNX=5FZYNQMP=5FARM=3Dy
 CONFIG=5FARM=5FSMMUV3=3Dy
+CONFIG=5FPVPANIC=3Dy
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9f67782..ffe8d00 100644
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
index 4cc57a7..ba54b84 100644
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

