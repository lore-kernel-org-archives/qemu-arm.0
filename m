Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1768639wro;
        Sat, 27 Oct 2018 02:57:37 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cOU9j8EvW2U8DZKHrUEXJkPKtT+Fkj4te+ffLni2l4d11cfUtAbZk/PzQ9wAvCeZrQPPWW
X-Received: by 2002:a37:8305:: with SMTP id f5-v6mr6052360qkd.230.1540634257270;
        Sat, 27 Oct 2018 02:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540634257; cv=none;
        d=google.com; s=arc-20160816;
        b=e9cu8YIkRhj+kovB6LGW4DQud7DPQwAb+shT1Z3osxIuKqhQCjdYA+d+abx7TgIU5k
         OT9Af5rlBHUXw8Z7Wf45z+DR/yuy1MSpS+VlXDpUKXbhNzP7AKltj6QyTLVRKxQJwx1M
         lFGJwkSAQFG16Tbc+l33b6I1B/0jE+baPBUiESZUPlEnR4WNGleMl5gH+wRwg9+bk/RJ
         BUff6Ox5jEuYC970IUHix994QHCVbw+RbgwPotyP9XG71HPY1tTbysXdaC7YLVmJ7Bo5
         +fW0+4JM2MUE9/ioxODB0Yl6g6wAtV2U6ftlpvMwt06HdKFFoWoB9LYhIY1WD1z9mblU
         3rng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qzWEsklVYsuWoJnJRkOvq5qNnYwLlbCkjzwvIyNk6Os=;
        b=v396+PVfW8FX8W77zRj2kar00FG3nHosSCOB+gyapCHR0246UIU3+AlDDV1z6hALD+
         fhy/+H2VH20ISuzphK/5IW/j/u2oVnZRsGqCfrVwk9PavG1IrMqLR1M2KGX7uFAbsKn5
         /27D+KodPpRogSlp/87RecE9LP8G/9T2nr+A6ZCp47W0dFALXEGXiyBGByunCauVhzoN
         wll9jjHwg18YfK+Ls55GpsUy+rRpSnKVsC6Qgtz91gLYYUAGd20tjLD1SgYx/jGmkpel
         v4K0XS65r4ecs72KSnNLNj3Hql8v2twHt2P9Q9px1GGqubPg4XGcwr8alb8OElGswsvL
         CU1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p13-v6si9132853qti.90.2018.10.27.02.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Oct 2018 02:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gGLLc-0006NR-RP
	for alex.bennee@linaro.org; Sat, 27 Oct 2018 05:57:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gGLL3-00067g-L0
	for qemu-arm@nongnu.org; Sat, 27 Oct 2018 05:57:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gGLL0-0003R6-Bt
	for qemu-arm@nongnu.org; Sat, 27 Oct 2018 05:57:01 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:32106)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gGLKz-0003Ia-Uj; Sat, 27 Oct 2018 05:56:58 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 147C3937A60FB8628266;
	Sat, 27 Oct 2018 17:56:50 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9R9uiMO070657;
	Sat, 27 Oct 2018 17:56:44 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018102717573126-7044942 ;
	Sat, 27 Oct 2018 17:57:31 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, philmd@redhat.com
Date: Sun, 28 Oct 2018 02:07:27 +0800
Message-Id: <1540663650-106694-3-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
References: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-27 17:57:31,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-27 17:56:24
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn w9R9uiMO070657
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V5 2/5]  hw/misc/pvpanic: Cosmetic renaming
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
X-TUID: i4/UYtflDMIG

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

