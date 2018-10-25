Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp555727wro;
        Thu, 25 Oct 2018 04:13:33 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dKVr7AAa81hIXGWRlH+Aike114rHOr6S0yfsb8vGQDWtDJP/xWHdJhxAV3zJiwmKLPweZB
X-Received: by 2002:a0c:95b5:: with SMTP id s50mr1009017qvs.64.1540466013786;
        Thu, 25 Oct 2018 04:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540466013; cv=none;
        d=google.com; s=arc-20160816;
        b=rT0BJleQ5qUIvr/u4DfuXp0y7l2DbIZnnqL5DS2Z3CRJK9oOkim77BhLi1Fw+/qCID
         i7e/agd/e5vOkPBtDRJ1uNfk/x4gTwbENUM7Dd4GMhlFkPJ6ifZZ++jkw4iG6O2rf8nf
         vpbNnIWHyCkm2NziojZzJo+c8/yWrmLY1MPJRYulzRR+6Tzv6M9yERRqdnNu5bUl8koo
         sWnBP3GGOuan9U0V8rAYjxenkNNMzmN/CasdXS7d6VRC6xgXtVsTxg1J+JsmmW9Nf3L5
         AcQCNfLNrsAqzl823zpvTR0XBi5p8Q7pjWaclDO+km4hcaq6uhmBy3VsGciiPpq5gkzn
         SNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=TzBTvI2hVk4O6u/Dzm5mjPN4R2i7FtMIN9DtXL8+/Ck=;
        b=mh54kINyApwQdwhrIy4RR9tT7s5rMWXALQbxDsdrjH35MOgiIRzGrG7lpMh4lTflHd
         WUglpbn+VgDAASES5TnmiISfb8L2vkCuIabpP4T77SODxBmIYhUDFBfvZJfAuMwFbWfR
         DnCieS8Sq4BFkp69NAUTtncWuWuYEZeUTTcl7gmO7ahGTLFsw7gysQRwFRcsY/SeAVN2
         SFLpW0uIcpqgzAySOG0+n8sl83KIL9y3adhgJ9hgP2Km4LxerlWEDKQ9XOw9mbBm7SeZ
         pPxuZnZ9OE6I5inw2lyLQXoESNhzIYtyZs7XGRYajL3I/s7LOuzsk8+PhqIwI7K1cjqD
         Z4gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a103si6022101qkh.5.2018.10.25.04.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 04:13:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFda1-0006Lm-6b
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 07:13:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZX-0006EH-ON
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:13:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZP-0000cG-Ug
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:13:01 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:6838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gFdZM-0000Ri-1d; Thu, 25 Oct 2018 07:12:54 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id EB3DB6AD2BCCDAC64F8F;
	Thu, 25 Oct 2018 19:12:31 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9PBCLp7015386;
	Thu, 25 Oct 2018 19:12:21 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018102519125332-6703137 ;
	Thu, 25 Oct 2018 19:12:53 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, philmd@redhat.com
Date: Fri, 26 Oct 2018 03:23:16 +0800
Message-Id: <1540495397-88089-5-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
References: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-25 19:12:53,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-25 19:12:09
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn w9PBCLp7015386
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V4 4/5]  hw/arm/virt: Use the pvpanic device
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
X-TUID: 4xFm/Is2MoxT

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
+    [VIRT=5FPVPANIC=5FMMIO] =3D       { 0x09060000, 0x00000002 },
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
+    hwaddr base =3D vms->memmap[VIRT=5FPVPANIC=5FMMIO].base;
+    hwaddr size =3D vms->memmap[VIRT=5FPVPANIC=5FMMIO].size;
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
+    VIRT=5FPVPANIC=5FMMIO,
     VIRT=5FUART,
     VIRT=5FMMIO,
     VIRT=5FRTC,
--=20
1.8.3.1

