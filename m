Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2660947wrw;
        Sun, 11 Nov 2018 19:20:25 -0800 (PST)
X-Google-Smtp-Source: AJdET5dIs7MEKP+4XnHBTUtmvAm1HlF5olG/N/rU9q21veecXmkcj5V25Ty13PV/w2lqo8FYIoJJ
X-Received: by 2002:a0c:8ecc:: with SMTP id y12mr17760254qvb.41.1541992825768;
        Sun, 11 Nov 2018 19:20:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541992825; cv=none;
        d=google.com; s=arc-20160816;
        b=DFBbcLGcmPSGgCoySkcZw6AXHvjKKTpkEheL1isyG0xaKxWNTgxcK4yBFb1ZcYDluB
         aG2xsiXHMGDCK/tteCUHfaqXNeDKCEDsMyHK9z2b4SEKz9OPBJC+65bEXzMQAAWNoDxJ
         qwQQc2uWgsclK6bZNbcam+OUKa7jzwEmKQmAgkL2WunkdrdzVVvIVHMM+AbzOHOqihD4
         WIkxbXtfg7bMbhPPxqHOsdSdd5/hJ0vWN9bmCDpsy6wSZVxdhYRm4Tet9jUppUY9wh73
         f8iXQjnGefBPTxlYhylMKBsGj3Sp//nP5OT7s9Wu1/KgBldjy4UAJdblPDtw9gX/z/CM
         8gcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qzWEsklVYsuWoJnJRkOvq5qNnYwLlbCkjzwvIyNk6Os=;
        b=sGEW0iW0oHOFsIz25Y/rzHUOhHZHqnwNS6LbseO7fslXo8HwMh2M96gLKGvtGnsYrF
         oRLYQpm+4fRZrjENmKuSwQrRfKuEjPyQEhVl+NvcpPppC/yzk+ubTaKk/rW0oUrP6GHn
         HMOcS8Ah9Z5+6Jh2j4cylo0lgjlsnt7MIIeTHRZ/YZQIMznV95ig1SNvtGz4WjRcVWGH
         nWz5GtSY3c3e7vlkfLqX1cNwGGYOR0PlBZPhrUBSMnvikrmoZ8snHINKUxyoS/pIhXhl
         A34UTqFru8Ili8kZsvaWlJi2ZTN6+jwm3gWY3k0Fo5OLyGuFAlZt9SxzKMxOSQUCgGKW
         /+bw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x189-v6si9172qkc.167.2018.11.11.19.20.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 19:20:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gM2m0-0001sc-Lv
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 22:20:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2lp-0001sB-EM
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 22:20:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2lm-0001No-7o
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 22:20:13 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:16030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gM2ll-0000xO-QQ; Sun, 11 Nov 2018 22:20:10 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 3431A12166A64665D7E3;
	Mon, 12 Nov 2018 11:20:00 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAC3Jmxq084848;
	Mon, 12 Nov 2018 11:19:48 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111211195207-10076079 ;
	Mon, 12 Nov 2018 11:19:52 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Mon, 12 Nov 2018 19:42:16 +0800
Message-Id: <1542022940-46849-3-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
References: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-12 11:19:52,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-12 11:19:47
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAC3Jmxq084848
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V6 2/6]  hw/misc/pvpanic: Cosmetic renaming
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
X-TUID: 4c2mVZ4r9CHK

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

