Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7766687wrw;
        Thu, 15 Nov 2018 18:28:34 -0800 (PST)
X-Google-Smtp-Source: AJdET5f4+dnLNHsa+3VBty93Rv/AqmxkNj0ZPMPkQiRb3bucv4k6TokU7ElWa1BiASSwMtzJ70Ge
X-Received: by 2002:a37:848:: with SMTP id 69mr2614643qki.351.1542335314528;
        Thu, 15 Nov 2018 18:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542335314; cv=none;
        d=google.com; s=arc-20160816;
        b=oE5pQV+QeWwqfMMn63/bAryvfMC4jS8FAUTe/DFjyjQkJy4/HS8F/E0SPDY5408l5p
         I8OGuQxqnlVYDhO68zo1l1cgqW086BOTz+ju5A830kJJoLxqUvsK5XGW7SqYOncVqe5W
         5JITXSUJjSMlfYkCMus5PAowzX5rAJza6medPSDu3zrpjEJCfVGzY50SPpTewc/5YSpG
         7nac7jCqKV0DVryn2dnfBqr6f3vZFSv18f2VCOEEPZgpt3yQtBUbXic5zXcFieBJOo9o
         kdPiwIzj47WYNw9/mfdQbBWGknl7b9wQY3RJOSfTk261GnCMpP+rlGMLFkSY32X7KWf4
         nOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qzWEsklVYsuWoJnJRkOvq5qNnYwLlbCkjzwvIyNk6Os=;
        b=QocfxlJX9MOeNB7rFjbN4KA9xXEFf50q2rLS0Us+buLd+PoiwpGs6fvlAj4YG/777v
         dfpXkArwzg+PVu4YgomKMKJuzMjBLMip2lnn1kQAbAp20n3uQmilCBH+25oQURKcsZ0V
         xj0fOp3F3iSkm2QzNrYqd98OoDO4qx9wwLxzrHA5R6CpYBLuA5xfYG+C+zpO9sjdMvcs
         VvTOGLEh5QuUSmIoRUSZTwMOC4WhGwJ+/d21h0n/cREG9QzXw14lGiVAJBNhmzzn0C0c
         7cJfXe0RnDNyg+bMPeYoer50TH44pzJI09qnrBZUzkBh/AMuBRmLgdNDo0lyBqJLdzww
         vccA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14si3390438qvm.164.2018.11.15.18.28.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 18:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNTs1-0003HC-Ug
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 21:28:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTrW-00036i-LR
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 21:28:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTrP-0007cc-Hm
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 21:28:02 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:39784)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gNTrP-0007Y1-5M; Thu, 15 Nov 2018 21:27:55 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 200D47D932E35AFBAC9F;
	Fri, 16 Nov 2018 10:27:53 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAG2RkY7028631;
	Fri, 16 Nov 2018 10:27:46 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111610282183-11036262 ;
	Fri, 16 Nov 2018 10:28:21 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Fri, 16 Nov 2018 18:50:02 +0800
Message-Id: <1542365406-81310-3-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
References: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-16 10:28:21,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-16 10:27:30
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAG2RkY7028631
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V7 2/6]  hw/misc/pvpanic: Cosmetic renaming
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
X-TUID: BbS7zdgjJbCb

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

