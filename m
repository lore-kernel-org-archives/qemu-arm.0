Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5411364wrt;
        Mon, 26 Nov 2018 03:33:30 -0800 (PST)
X-Google-Smtp-Source: AJdET5fUm5ErlGX/rIgZI8lqcHlyI4Vk9IN67u7nNPY4WdJwljxpw0rSIPFvfPnDdJfYdzTILjq5
X-Received: by 2002:a81:3093:: with SMTP id w141mr28517956yww.24.1543232010871;
        Mon, 26 Nov 2018 03:33:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543232010; cv=none;
        d=google.com; s=arc-20160816;
        b=f+C2a96Ocg+QryKdITjuAHxAjU8+sCTQA5tpHGWE0YCkPdcTrG9cYMdoV7a/BafzeX
         Crldh9frs/uqvwnmxesnEyViUqMOuCpuSzyF7WaYvub75zFnD+Zem0G4re9uxKp1S/Vs
         6vgKoxXD8biZex7qgStZS/C7KuWceh3UwHxLig6zsdoA6170kHs/dU/ekX35vyss6cm5
         /XUyQA6Ok57vSqQLTCKDOhU+uxBR4A1KheRFbZ6rOXHGVTsBEGj0rrCmfWQDIe8J/Qfi
         nAvraReiCBKux/kRB8ptW8NkSnpXm0JpQdwvqjXgNhIvm+yTmywPuHo3KGMZIaSCEcIh
         w7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=DBqjQXLjPi8KkD19v3IMd7joKj9LAz8fu/GMzU6tKj4=;
        b=aj/kGlloH6xjkwk8wBSx+V3jz4hWw5pUObP/fhuOW9w3M3NCRarMUvULrVLZ0Rm0we
         Q1iBtaVSNxiYt6AzOp7xXGPOBp7dXCvdbkV+S+lXt8iQP2dRMp7/i+2hgNc2zEJrUuUn
         h9j7nS8tZpcbCYjp5cnz/aUYmV+j4jAzX78YbGj0O7JJ3/R1vaTFCtN5BpTfMeD8DBVo
         v1u85uV4UbbIsqW+uK8tmV7E50rh1z8hciOZHBrE4C54LyDIvGFX61JUNjaPpCCdOadP
         NXVYSK3su/liRMvISibOT2n/v8NLfse5ny7jSOUqMEBPqqv7cdxT3HMqr1RyQ3mkhMTi
         m1Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h67-v6si42516ywe.37.2018.11.26.03.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 03:33:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRF8q-0000Ez-Aj
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 06:33:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8c-0000DW-4n
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8X-0001s5-7j
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:13 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:56364 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRF8W-0001mh-DN; Mon, 26 Nov 2018 06:33:08 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id E524A28D3E9689AFD846;
	Mon, 26 Nov 2018 19:33:00 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAQBWsqQ031648;
	Mon, 26 Nov 2018 19:32:54 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112619330227-13057766 ;
	Mon, 26 Nov 2018 19:33:02 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 27 Nov 2018 03:55:55 +0800
Message-Id: <1543262162-6351-3-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-26 19:33:02,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-26 19:32:54
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAQBWsqQ031648
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V9 2/9]  hw/misc/pvpanic: Cosmetic renaming
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
X-TUID: MCBcyeZji7Fv

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

To ease the MMIO device addition in the next patch, rename:
- ISA=5FPVPANIC=5FDEVICE -> PVPANIC=5FISA=5FDEVICE.
- MemoryRegion io -> mr.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/misc/pvpanic.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 9d8961b..0f23a67 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -25,8 +25,8 @@
 /* The pv event value */
 #define PVPANIC=5FPANICKED        (1 << PVPANIC=5FF=5FPANICKED)
=20
-#define ISA=5FPVPANIC=5FDEVICE(obj)    \
-    OBJECT=5FCHECK(PVPanicState, (obj), TYPE=5FPVPANIC)
+#define PVPANIC=5FISA=5FDEVICE(obj)    \
+    OBJECT=5FCHECK(PVPanicISAState, (obj), TYPE=5FPVPANIC)
=20
 static void handle=5Fevent(int event)
 {
@@ -45,12 +45,16 @@ static void handle=5Fevent(int event)
=20
 #include "hw/isa/isa.h"
=20
-typedef struct PVPanicState {
+/* PVPanicISAState for ISA device and
+ * use ioport.
+ */
+typedef struct PVPanicISAState {
     ISADevice parent=5Fobj;
-
-    MemoryRegion io;
+    /*< private>*/
     uint16=5Ft ioport;
-} PVPanicState;
+    /*<public>*/
+    MemoryRegion mr;
+} PVPanicISAState;
=20
 /* return supported events on read */
 static uint64=5Ft pvpanic=5Fioport=5Fread(void *opaque, hwaddr addr, unsig=
ned size)
@@ -75,15 +79,15 @@ static const MemoryRegionOps pvpanic=5Fops =3D {
=20
 static void pvpanic=5Fisa=5Finitfn(Object *obj)
 {
-    PVPanicState *s =3D ISA=5FPVPANIC=5FDEVICE(obj);
+    PVPanicISAState *s =3D PVPANIC=5FISA=5FDEVICE(obj);
=20
-    memory=5Fregion=5Finit=5Fio(&s->io, OBJECT(s), &pvpanic=5Fops, s, "pvp=
anic", 1);
+    memory=5Fregion=5Finit=5Fio(&s->mr, OBJECT(s), &pvpanic=5Fops, s, "pvp=
anic", 1);
 }
=20
 static void pvpanic=5Fisa=5Frealizefn(DeviceState *dev, Error **errp)
 {
     ISADevice *d =3D ISA=5FDEVICE(dev);
-    PVPanicState *s =3D ISA=5FPVPANIC=5FDEVICE(dev);
+    PVPanicISAState *s =3D PVPANIC=5FISA=5FDEVICE(dev);
     FWCfgState *fw=5Fcfg =3D fw=5Fcfg=5Ffind();
     uint16=5Ft *pvpanic=5Fport;
=20
@@ -96,11 +100,11 @@ static void pvpanic=5Fisa=5Frealizefn(DeviceState *dev=
, Error **errp)
     fw=5Fcfg=5Fadd=5Ffile(fw=5Fcfg, "etc/pvpanic-port", pvpanic=5Fport,
                     sizeof(*pvpanic=5Fport));
=20
-    isa=5Fregister=5Fioport(d, &s->io, s->ioport);
+    isa=5Fregister=5Fioport(d, &s->mr, s->ioport);
 }
=20
 static Property pvpanic=5Fisa=5Fproperties[] =3D {
-    DEFINE=5FPROP=5FUINT16(PVPANIC=5FIOPORT=5FPROP, PVPanicState, ioport, =
0x505),
+    DEFINE=5FPROP=5FUINT16(PVPANIC=5FIOPORT=5FPROP, PVPanicISAState, iopor=
t, 0x505),
     DEFINE=5FPROP=5FEND=5FOF=5FLIST(),
 };
=20
@@ -116,7 +120,7 @@ static void pvpanic=5Fisa=5Fclass=5Finit(ObjectClass *k=
lass, void *data)
 static TypeInfo pvpanic=5Fisa=5Finfo =3D {
     .name          =3D TYPE=5FPVPANIC,
     .parent        =3D TYPE=5FISA=5FDEVICE,
-    .instance=5Fsize =3D sizeof(PVPanicState),
+    .instance=5Fsize =3D sizeof(PVPanicISAState),
     .instance=5Finit =3D pvpanic=5Fisa=5Finitfn,
     .class=5Finit    =3D pvpanic=5Fisa=5Fclass=5Finit,
 };
--=20
1.8.3.1

