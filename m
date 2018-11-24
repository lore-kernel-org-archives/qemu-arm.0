Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3052525wrt;
        Sat, 24 Nov 2018 00:26:28 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VCqeOeF7kc8voyNpGD+TSu98LSpDvEnvsHa77hqiL1mwqCQ+PBLEf9rwHM72cttY0KwEvp
X-Received: by 2002:a25:aae2:: with SMTP id t89-v6mr19402385ybi.200.1543047988255;
        Sat, 24 Nov 2018 00:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543047988; cv=none;
        d=google.com; s=arc-20160816;
        b=y0nVlonLxkzjQ3gDMUg511PKOHRvBCmZaBsTJFJf8SoV0iOlCX7s85txr2DXfDrJCt
         iqB20mjJJG1b/eXCQvlPXio7m5uINRCZOa9hQ+voQpneWGtoUgTIV6BawoQ+1qxV9NO7
         /hclnClhRhajwjoaa2gVGJqjrDZENJ584nqXGuRy1ocDACoDZ7Un4WysKG0hOWhATa8D
         LI0AFAaYyxGSC7FsH98dSc5zQNIWvJyyisw2Hv6gqbFCMgbjxKxciZtybu0syubD/MBN
         0qxav+uXgdNnMfwj5ijkGeUJORmOgQvKzkmgBrL1BWYlWciSUCwRunWAYygdjTXml8Sq
         kB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=JnJfsbLbWMsiGMntNjrJtA6Dz5UHS3cjSEapDbS8Phs=;
        b=i9i5Du6dRgs5ztSTyGRjL9BArumdgJ8yHLwxry297KF9Yxu0HmIVwb2gZdEyJFn/Do
         0HCRwOBXk2gB43HPeVd0yVmV+9hSUM5ntGtpSak8Wgoc30PaNqsfNdQtSvhu5VcZeBxQ
         eGyx8Qr2D0xGuUTG2BZ6d1LbcrNsWrJYcQCjZw7qMaTqq3iX4eclO7sHJuE8yEGGufTl
         eJwIaVXKab0ug+jO6OjMsBhUAuO5D6XUr1Lq3AoNkvTIbV3eDwD4ZaRTrCa2OR1rjnlx
         F1BPxfgWnAzKnNpZg44dfjxrUXbIu7UMKaC8zVgRYTDSQpoCzM7GTsN6+FiGaIIZTajH
         36FA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s131-v6si15893036ybc.235.2018.11.24.00.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:26:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTGl-0004GA-N5
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:26:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTAm-0008It-4f
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:20:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQT48-0005sg-Pt
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:13:25 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:40540 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQT47-0005kj-AG; Sat, 24 Nov 2018 03:13:23 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 97F7AAB9D02382C6CA2B;
	Sat, 24 Nov 2018 16:12:55 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8ClQJ023393;
	Sat, 24 Nov 2018 16:12:47 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416133344-12697196 ;
	Sat, 24 Nov 2018 16:13:33 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 00:34:25 +0800
Message-Id: <1543077273-16201-2-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:13:33,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:12:27
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAO8ClQJ023393
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-devel] [PATCH 02/10]  hw/misc/pvpanic: Cosmetic renaming
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +t2PM1NVR60O

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

