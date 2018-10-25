Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp555774wro;
        Thu, 25 Oct 2018 04:13:37 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f+hx49jr3gY5i6+XSkR02MknYBCi9sFJhB1T/hM9tUziEu7R5+KGnURnkiYHrUpxihbUBL
X-Received: by 2002:aed:3165:: with SMTP id 92-v6mr964543qtg.72.1540466016933;
        Thu, 25 Oct 2018 04:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540466016; cv=none;
        d=google.com; s=arc-20160816;
        b=sHf3m4fZmqP19hDRRsEklglFlAhfg0C7Gc2VoNVqtUUsvVkQxl6aRzaFqargITnT42
         kREWpj1072JYHMMiXl0Fv45h3zVt1DxQDI8FB+SXLRfzmDfmP0kooZgBsyU49mlMJMrs
         fH6R3i8vqWjjpTOESmTTnYkxd6qZSQL60YGw8cfIekX6CwEc1n460NuWfIA59xypiL0b
         RUhtdiopDdGWkF+t7WGctek9kcDa0O34u7L6i3Ki/j0wex4SHIov1uJXfjue4WGlunOP
         h0F0ZHFr0MQYAhXeLeXYR33nUsCGvZ5rtIexs+1JyoTtV9HxthrXcWHWa97+GD2JLF53
         KH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=X/tN+9ns+wrj+UNREZCeKJlE1nAHQe17pR9gPKZX1BM=;
        b=uyR+eeCI4YiVkjxQELHiHvkvZE7bWJcyXwv2lTWoW5s05dfaArifPL/ybZ0kN8maad
         SnIQOjR7D2LfTM+AOxvcW+6ZnVwDqmRWlv0n+6BmKXFuhQXM9E/wJko3E/j3g3+zmEw3
         sHu8zFwoSsCbktrGWIK1QhYnTle2nGeUgPdgOitQq8kaW7kV4NpwwOFgWqd6wk4A+BPo
         a2kYkZyR+0wtO9dAZEGKnzIGdypBD6JmFvK8U6puJEP2Ofw7UOviNFlKFRE1TZHu/Dfo
         lXZyVLa4sbfsBcoadh92jHOY3yHSQ2a+9YZdgG2FqSzkzZrrhGGXAF77H2vq4HcNbo5+
         bgAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2-v6si5537548qtl.192.2018.10.25.04.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 04:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFda4-0006Mh-CB
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 07:13:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZQ-0006DO-6s
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZK-0000Yp-H9
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:12:55 -0400
Received: from out1.zte.com.cn ([202.103.147.172]:43350 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gFdZI-0000RT-51; Thu, 25 Oct 2018 07:12:48 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 5156459557B042DDA9BC;
	Thu, 25 Oct 2018 19:12:31 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9PBCKLA015355;
	Thu, 25 Oct 2018 19:12:20 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018102519125201-6703133 ;
	Thu, 25 Oct 2018 19:12:52 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, philmd@redhat.com
Date: Fri, 26 Oct 2018 03:23:15 +0800
Message-Id: <1540495397-88089-4-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
References: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-25 19:12:52,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-25 19:12:08
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn w9PBCKLA015355
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V4 3/5] hw/misc/pvpanic: Add the MMIO interface
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
X-TUID: sHqaGTqYmMaR

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/pvpanic.c         | 74 ++++++++++++++++++++++++++++++++++++++-----=
----
 include/hw/misc/pvpanic.h |  2 ++
 2 files changed, 62 insertions(+), 14 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index dd3aef2..b575e01 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -2,10 +2,12 @@
  * QEMU simulated pvpanic device.
  *
  * Copyright Fujitsu, Corp. 2013
+ * Copyright (c) 2018 ZTE Ltd.
  *
  * Authors:
  *     Wen Congyang <wency@cn.fujitsu.com>
  *     Hu Tao <hutao@cn.fujitsu.com>
+ *     Peng Hao <peng.hao2@zte.com.cn>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
  * See the COPYING file in the top-level directory.
@@ -45,30 +47,48 @@ static void handle=5Fevent(int event)
=20
 #include "hw/isa/isa.h"
=20
-typedef struct PVPanicState {
+typedef struct PVPanicCommonState {
+    MemoryRegion mr;
+} PVPanicCommonState;
+
+typedef struct PVPanicISAState {
     /* private */
     ISADevice isadev;
+    uint16=5Ft ioport;
+    /* public */
+    PVPanicCommonState common;
+} PVPanicISAState;
+
+typedef struct PVPanicMMIOState {
+    /* private */
+    SysBusDevice busdev;
=20
     /* public */
-    MemoryRegion mr;
-    uint16=5Ft ioport;
-} PVPanicState;
+    PVPanicCommonState common;
+} PVPanicMMIOState;
+
+#define PVPANIC=5FISA(obj)    \
+    OBJECT=5FCHECK(PVPanicISAState, (obj), TYPE=5FPVPANIC)
+
+#define PVPANIC=5FMMIO(obj)    \
+    OBJECT=5FCHECK(PVPanicMMIOState, (obj), TYPE=5FPVPANIC=5FMMIO)
+
=20
 /* return supported events on read */
-static uint64=5Ft pvpanic=5Fioport=5Fread(void *opaque, hwaddr addr, unsig=
ned size)
+static uint64=5Ft pvpanic=5Fread(void *opaque, hwaddr addr, unsigned size)
 {
     return PVPANIC=5FPANICKED;
 }
=20
-static void pvpanic=5Fioport=5Fwrite(void *opaque, hwaddr addr, uint64=5Ft=
 val,
+static void pvpanic=5Fwrite(void *opaque, hwaddr addr, uint64=5Ft val,
                                  unsigned size)
 {
     handle=5Fevent(val);
 }
=20
 static const MemoryRegionOps pvpanic=5Fops =3D {
-    .read =3D pvpanic=5Fioport=5Fread,
-    .write =3D pvpanic=5Fioport=5Fwrite,
+    .read =3D pvpanic=5Fread,
+    .write =3D pvpanic=5Fwrite,
     .impl =3D {
         .min=5Faccess=5Fsize =3D 1,
         .max=5Faccess=5Fsize =3D 1,
@@ -77,15 +97,15 @@ static const MemoryRegionOps pvpanic=5Fops =3D {
=20
 static void pvpanic=5Fisa=5Finitfn(Object *obj)
 {
-    PVPanicState *s =3D PVPANIC(obj);
+    PVPanicISAState *s =3D PVPANIC=5FISA(obj);
=20
-    memory=5Fregion=5Finit=5Fio(&s->mr, OBJECT(s), &pvpanic=5Fops, s, "pvp=
anic", 1);
+    memory=5Fregion=5Finit=5Fio(&s->common.mr, OBJECT(s), &pvpanic=5Fops, =
s, TYPE=5FPVPANIC, 1);
 }
=20
 static void pvpanic=5Fisa=5Frealizefn(DeviceState *dev, Error **errp)
 {
     ISADevice *d =3D ISA=5FDEVICE(dev);
-    PVPanicState *s =3D PVPANIC(dev);
+    PVPanicISAState *s =3D PVPANIC=5FISA(dev);
     FWCfgState *fw=5Fcfg =3D fw=5Fcfg=5Ffind();
     uint16=5Ft *pvpanic=5Fport;
=20
@@ -98,11 +118,11 @@ static void pvpanic=5Fisa=5Frealizefn(DeviceState *dev=
, Error **errp)
     fw=5Fcfg=5Fadd=5Ffile(fw=5Fcfg, "etc/pvpanic-port", pvpanic=5Fport,
                     sizeof(*pvpanic=5Fport));
=20
-    isa=5Fregister=5Fioport(d, &s->mr, s->ioport);
+    isa=5Fregister=5Fioport(d, &s->common.mr, s->ioport);
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
@@ -118,14 +138,40 @@ static void pvpanic=5Fisa=5Fclass=5Finit(ObjectClass =
*klass, void *data)
 static TypeInfo pvpanic=5Fisa=5Finfo =3D {
     .name          =3D TYPE=5FPVPANIC,
     .parent        =3D TYPE=5FISA=5FDEVICE,
-    .instance=5Fsize =3D sizeof(PVPanicState),
+    .instance=5Fsize =3D sizeof(PVPanicISAState),
     .instance=5Finit =3D pvpanic=5Fisa=5Finitfn,
     .class=5Finit    =3D pvpanic=5Fisa=5Fclass=5Finit,
 };
=20
+static void pvpanic=5Fmmio=5Finitfn(Object *obj)
+{
+    PVPanicMMIOState *s =3D PVPANIC=5FMMIO(obj);
+    SysBusDevice *sbd =3D SYS=5FBUS=5FDEVICE(obj);
+
+    memory=5Fregion=5Finit=5Fio(&s->common.mr, OBJECT(s), &pvpanic=5Fops, =
s,
+                          TYPE=5FPVPANIC=5FMMIO, 2);
+    sysbus=5Finit=5Fmmio(sbd, &s->common.mr);
+}
+
+static void pvpanic=5Fmmio=5Fclass=5Finit(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE=5FCLASS(klass);
+
+    set=5Fbit(DEVICE=5FCATEGORY=5FMISC, dc->categories);
+}
+
+static TypeInfo pvpanic=5Fmmio=5Finfo =3D {
+    .name          =3D TYPE=5FPVPANIC=5FMMIO,
+    .parent        =3D TYPE=5FSYS=5FBUS=5FDEVICE,
+    .instance=5Fsize =3D sizeof(PVPanicMMIOState),
+    .instance=5Finit =3D pvpanic=5Fmmio=5Finitfn,
+    .class=5Finit    =3D pvpanic=5Fmmio=5Fclass=5Finit,
+};
+
 static void pvpanic=5Fregister=5Ftypes(void)
 {
     type=5Fregister=5Fstatic(&pvpanic=5Fisa=5Finfo);
+    type=5Fregister=5Fstatic(&pvpanic=5Fmmio=5Finfo);
 }
=20
 type=5Finit(pvpanic=5Fregister=5Ftypes)
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index 1ee071a..c0d2d38 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -16,6 +16,8 @@
=20
 #define TYPE=5FPVPANIC "pvpanic"
=20
+#define TYPE=5FPVPANIC=5FMMIO "pvpanic-mmio"
+
 #define PVPANIC=5FIOPORT=5FPROP "ioport"
=20
 static inline uint16=5Ft pvpanic=5Fport(void)
--=20
1.8.3.1

