Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2661004wrw;
        Sun, 11 Nov 2018 19:20:31 -0800 (PST)
X-Google-Smtp-Source: AJdET5dgcsocEj00sYOD7Oq1nJvviE1Ry7i2QeY/C9njYaM9+hTV/8ffRLitzvIubDU2ch25IIbC
X-Received: by 2002:a37:a502:: with SMTP id o2mr17345178qke.111.1541992831378;
        Sun, 11 Nov 2018 19:20:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541992831; cv=none;
        d=google.com; s=arc-20160816;
        b=qLNtl5taW1YaqbdFLUIygGtTlVsO5bjArBn39Qjsw6xSq3ycpJvqVtdGB97Wnuyj+/
         TvYZLFwQjPfxfAGavH2EonsKmdSQ23RhIQpTMuPlSOTkKS4v7//nsLzCqvKzQJmjzdTj
         u8dZ8n0Mpp+11A7Yj05Bs0oNPtpA+Y25N13hRcYEV3FKoqajdm/rf2DYdH13rHZkX1J1
         qFwECfbHfTK86V5geWg8jNzyH8qcg6Ob7HnWpzwY2irsIVjNhvMa2qCb1+sq7B0VQHSs
         veuWaV7if9Zgmb6Cc7id99AA0AqMIqIMcP+LOPcIRjy7jpsxqU30HG829OOw7mbQQ5un
         wdjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3niWLmtCe5PBDs5AYXQ/5gqXixIIHJUS3EeLDOM9Eow=;
        b=viR+B7vLJArz8EOSNqQBwBnecBzSM2z47OemcfpexVY7pxNAaD/f9lNFp+DeX9sTiw
         mpSoA/7UKj3Lou26G08U5uC+2cxxsWTWMKHiJitKdTNUBgmpAnCnMZ4yJp7Pg2L8c3VU
         ShN4dBGqh1uP5egZ/NB0mOxcgDySJ1fDbptIRwG3LfMqL2BGiIUnz4FjMgshuwpk/YuI
         8DUPSXDE4DKw6sBPhTiOvKtAzeQF14/GJzdmiDVgRTbIvLyEGG6EabS3OouiV5s0flq9
         StMmG9w7O+RzV7vXxz0oFAQptxJyVwoUvo6Ioqomj8klIjYWnEogNtt0S7+vmyMgxP31
         r/9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s24si2748238qta.136.2018.11.11.19.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 19:20:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gM2m6-0001tH-Dm
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 22:20:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2lp-0001sC-Ew
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 22:20:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2ln-0001Sl-KN
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 22:20:13 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:61080)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gM2ll-0000xR-QO; Sun, 11 Nov 2018 22:20:11 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 729B4BEA64FC36B42F6A;
	Mon, 12 Nov 2018 11:20:00 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAC3JnYk084853;
	Mon, 12 Nov 2018 11:19:49 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111211195329-10076084 ;
	Mon, 12 Nov 2018 11:19:53 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Mon, 12 Nov 2018 19:42:17 +0800
Message-Id: <1542022940-46849-4-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
References: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-12 11:19:53,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-12 11:19:49
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAC3JnYk084853
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V6 3/6] hw/misc/pvpanic: Add the MMIO interface
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
X-TUID: ZXzNULmj2VqZ

Add pvpanic new type "TYPE=5FPVPANIC=5FMMIO"

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/pvpanic.c         | 81 +++++++++++++++++++++++++++++++++++++------=
----
 include/hw/misc/pvpanic.h |  1 +
 2 files changed, 65 insertions(+), 17 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index dd3aef2..5d0fbc6 100644
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
@@ -25,9 +27,6 @@
 /* The pv event value */
 #define PVPANIC=5FPANICKED        (1 << PVPANIC=5FF=5FPANICKED)
=20
-#define PVPANIC(obj)    \
-    OBJECT=5FCHECK(PVPanicState, (obj), TYPE=5FPVPANIC)
-
 static void handle=5Fevent(int event)
 {
     static bool logged;
@@ -45,30 +44,50 @@ static void handle=5Fevent(int event)
=20
 #include "hw/isa/isa.h"
=20
-typedef struct PVPanicState {
-    /* private */
-    ISADevice isadev;
+/* PVPanicISAState for ISA device and
+ * use ioport.
+ */
+typedef struct PVPanicISAState {
+     /* private */
+     ISADevice isadev;
+     uint16=5Ft ioport;
=20
     /* public */
     MemoryRegion mr;
-    uint16=5Ft ioport;
-} PVPanicState;
+} PVPanicISAState;
+
+/* PVPanicMMIOState for sysbus device and
+ * use mmio.
+ */
+typedef struct PVPanicMMIOState {
+    /* private */
+    SysBusDevice busdev;
+
+     /* public */
+    MemoryRegion mr;
+} PVPanicMMIOState;
+
+#define PVPANIC=5FISA(obj)    \
+    OBJECT=5FCHECK(PVPanicISAState, (obj), TYPE=5FPVPANIC)
+
+#define PVPANIC=5FMMIO(obj)    \
+    OBJECT=5FCHECK(PVPanicMMIOState, (obj), TYPE=5FPVPANIC=5FMMIO)
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
@@ -77,15 +96,16 @@ static const MemoryRegionOps pvpanic=5Fops =3D {
=20
 static void pvpanic=5Fisa=5Finitfn(Object *obj)
 {
-    PVPanicState *s =3D PVPANIC(obj);
+    PVPanicISAState *s =3D PVPANIC=5FISA(obj);
=20
-    memory=5Fregion=5Finit=5Fio(&s->mr, OBJECT(s), &pvpanic=5Fops, s, "pvp=
anic", 1);
+    memory=5Fregion=5Finit=5Fio(&s->mr, OBJECT(s), &pvpanic=5Fops, s,
+                          TYPE=5FPVPANIC, 1);
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
@@ -102,7 +122,7 @@ static void pvpanic=5Fisa=5Frealizefn(DeviceState *dev,=
 Error **errp)
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
@@ -118,14 +138,41 @@ static void pvpanic=5Fisa=5Fclass=5Finit(ObjectClass =
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
+
+static void pvpanic=5Fmmio=5Finitfn(Object *obj)
+{
+    PVPanicMMIOState *s =3D PVPANIC=5FMMIO(obj);
+    SysBusDevice *sbd =3D SYS=5FBUS=5FDEVICE(obj);
+
+    memory=5Fregion=5Finit=5Fio(&s->mr, OBJECT(s), &pvpanic=5Fops, s,
+                          TYPE=5FPVPANIC=5FMMIO, 2);
+    sysbus=5Finit=5Fmmio(sbd, &s->mr);
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
index 1ee071a..19c0fbb 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -17,6 +17,7 @@
 #define TYPE=5FPVPANIC "pvpanic"
=20
 #define PVPANIC=5FIOPORT=5FPROP "ioport"
+#define TYPE=5FPVPANIC=5FMMIO "pvpanic-mmio"
=20
 static inline uint16=5Ft pvpanic=5Fport(void)
 {
--=20
1.8.3.1

