Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp556024wro;
        Thu, 25 Oct 2018 04:13:52 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dzoha3Ry2fv5swZJtQCx/Gh4VtVwycp9TkZEOg5x/20D3zc90QRtmy5kFtt3Ih25yRAztk
X-Received: by 2002:ac8:29b4:: with SMTP id 49-v6mr956220qts.259.1540466032122;
        Thu, 25 Oct 2018 04:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540466032; cv=none;
        d=google.com; s=arc-20160816;
        b=UPB818wFip/kKOC/VGPhfj2AgGVSTGsDSeaTjYhNP5ON9zbKLSEZmQGrTxj+iVo5X8
         yERDEJEEYP2qbxp8ageSdvKbHneFP3zGB0hfaLTeh79syhc36U8bWKJhpaD3DF46HnI1
         SVkZqI6UO88tr8S62GG9dv64TyhzUZ9WNo18HDtXcC0DYeoRnUoZUOmiLnyWDmOfGeAJ
         9UxxALXSAAU3qCAD+udT3zmnBYyjJKBJ2fExp4nXE5OI8W8F4LW3W/rOvjBmPLfOz2tU
         HFRmoN1SUcnxsYk7Uee9qssQCSR0enepYbGaFp2tch8pW/oBTlwfaCd0lgELFe3y2vFq
         77tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qzWEsklVYsuWoJnJRkOvq5qNnYwLlbCkjzwvIyNk6Os=;
        b=JQP8RuV8V2Oh+9bDV4ZZoFORHABJsTeXJoZVelnOBJfsr12aSe74tReOTZESWrjLMx
         fPSy+RGRbNnVHTKLbTjcmOQmtE14bYiK6vU1nWJe2ejcxHWvtlGDTSIJpvm6tqss2aBv
         gMcFSysJIEeBix9jj4dJPCv3KJqh3Iag6Rk+oVZPKIg8Iy4aAfUZZC9iOMoTlMwiCdSc
         njvppvj1NwtDpph/pvfXB15mXaoC2smkIRhI2DVBQAeH0U5xZRrrHA/v2GLfNEUeDzkD
         XE6vJc8dpIaXgZs8QCAdlmdTesKJYl0qB5tQeaqAWzSWhTzUf6hmRA1XJ4xo7/2z3n2F
         zEWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o70-v6si6338208qke.266.2018.10.25.04.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 04:13:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53773 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFdaJ-0006j2-J5
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 07:13:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZZ-0006EZ-He
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:13:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZQ-0000cR-0n
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:13:02 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:9358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gFdZM-0000R2-0J; Thu, 25 Oct 2018 07:12:54 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id ABD28929F24AA5F32B51;
	Thu, 25 Oct 2018 19:12:30 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9PBCJLo015337;
	Thu, 25 Oct 2018 19:12:19 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018102519125091-6703129 ;
	Thu, 25 Oct 2018 19:12:50 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, philmd@redhat.com
Date: Fri, 26 Oct 2018 03:23:14 +0800
Message-Id: <1540495397-88089-3-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
References: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-25 19:12:51,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-25 19:12:07
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn w9PBCJLo015337
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V4 2/5]  hw/misc/pvpanic: Cosmetic renaming
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YzCmTyBDwbyD

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

To ease the MMIO device addition in the next patch, rename:
- ISA=5FPVPANIC=5FDEVICE -> PVPANIC (this just returns a generic Object),
- ISADevice parent=5Fobj -> isadev,
- MemoryRegion io -> mr.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/pvpanic.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 9d8961b..dd3aef2 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -25,7 +25,7 @@
 /* The pv event value */
 #define PVPANIC=5FPANICKED        (1 << PVPANIC=5FF=5FPANICKED)
=20
-#define ISA=5FPVPANIC=5FDEVICE(obj)    \
+#define PVPANIC(obj)    \
     OBJECT=5FCHECK(PVPanicState, (obj), TYPE=5FPVPANIC)
=20
 static void handle=5Fevent(int event)
@@ -46,9 +46,11 @@ static void handle=5Fevent(int event)
 #include "hw/isa/isa.h"
=20
 typedef struct PVPanicState {
-    ISADevice parent=5Fobj;
+    /* private */
+    ISADevice isadev;
=20
-    MemoryRegion io;
+    /* public */
+    MemoryRegion mr;
     uint16=5Ft ioport;
 } PVPanicState;
=20
@@ -75,15 +77,15 @@ static const MemoryRegionOps pvpanic=5Fops =3D {
=20
 static void pvpanic=5Fisa=5Finitfn(Object *obj)
 {
-    PVPanicState *s =3D ISA=5FPVPANIC=5FDEVICE(obj);
+    PVPanicState *s =3D PVPANIC(obj);
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
+    PVPanicState *s =3D PVPANIC(dev);
     FWCfgState *fw=5Fcfg =3D fw=5Fcfg=5Ffind();
     uint16=5Ft *pvpanic=5Fport;
=20
@@ -96,7 +98,7 @@ static void pvpanic=5Fisa=5Frealizefn(DeviceState *dev, E=
rror **errp)
     fw=5Fcfg=5Fadd=5Ffile(fw=5Fcfg, "etc/pvpanic-port", pvpanic=5Fport,
                     sizeof(*pvpanic=5Fport));
=20
-    isa=5Fregister=5Fioport(d, &s->io, s->ioport);
+    isa=5Fregister=5Fioport(d, &s->mr, s->ioport);
 }
=20
 static Property pvpanic=5Fisa=5Fproperties[] =3D {
--=20
1.8.3.1

