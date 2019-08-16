Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp491831wrs;
        Fri, 16 Aug 2019 00:57:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7aChtj8HJuRPp/ctO7sdvW5Y+viEnHE4BEeTt672LZRn39Z25wNxEjIU90qiPt+ia2Kuh
X-Received: by 2002:a50:97ea:: with SMTP id f39mr9440986edb.279.1565942238269;
        Fri, 16 Aug 2019 00:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565942238; cv=none;
        d=google.com; s=arc-20160816;
        b=AugcxV6owUR0O4YnJHzc3n70BJUnLqJi6tV0Tkp0MLBsPy/IfKaqKXD0pyTLvMdIx/
         SGp4MyM5dq7ONQ8eMtXagglXaZiCYmTkLx0ar7a+LC0w/7sfErwu3GNNDl32qoIgofY+
         ztmtHjfF4tfPgYcQoqU4g4Zjj8pdvwtLnXni5ehN/MGRWfolZHpQEeOLAUXxgZM/AaXC
         CDEQEt1jABFy/a9yWQ2EMYKZZMz4myd9mixxdZX23pDvZVty5BWtPNLdInxkG/Rx+CdF
         SXz8D3IFhtPfhbDoyAl4IUoc67YDX+DUs4f7CTA6ouA3db5LeGgzAmuS/AK8MbD/TerH
         yh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=JSfUiU31DpiNncusDuhPTnxKGpwQJPiG4+IdP5gnW6A=;
        b=fkpLv9nss0LuM00bpKRBbTJBGtOD/UeyoxLKQVsWH8Sxp6hNpv6MxcBTCTTNnTV45M
         9ECPf3Yy6Mvc9DN8tC7aZ9d7FxEQjwCtnjcdpD18CiRmDHRqH+eyHMFSCMtFDKE3YE4A
         dxMczgh75y01bc8wvjnsHawjtqE9nDoXILvPEFx7aNaf0DhkBUMmSH2eFXsjJPNLz7Lq
         e8NdhAQtl2lnRfFiDEAh6WWZL/ZiRgaDTCobFhNUm66tX017NOHqV6dZ6ORpPj34KESr
         5Vrs1FlmPeQSWJRiwABVivhTe3t04fIQLCGe1QGdHrgh6hUvIhw9OmcGIkDzZY6EyAij
         757g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si3055759ede.282.2019.08.16.00.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 00:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyX6q-0001we-Nm
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 03:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39641)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWlA-00088f-7n
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:34:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWl5-00014I-Oa
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:34:52 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.74]:54791)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWka-0000nh-Du; Fri, 16 Aug 2019 03:34:18 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926079.bt.com (10.36.82.110) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:33:51 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:34:13 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:34:13 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 23/42] hw/intc: Declare device little or
 big endian
Thread-Index: AQHVVAUArrlrR1Zn3E+pnWujKo/uiQ==
Date: Fri, 16 Aug 2019 07:34:13 +0000
Message-ID: <1565940852602.49352@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594085260249352btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.74
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 23/42] hw/intc: Declare device
 little or big endian
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 philmd@redhat.com, amarkovic@wavecomp.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, pburton@wavecomp.com, sagark@eecs.berkeley.edu,
 green@moxielogic.com, kraxel@redhat.com, gxt@mprc.pku.edu.cn, robh@kernel.org,
 borntraeger@de.ibm.com, joel@jms.id.au, antonynpavlov@gmail.com,
 chouteau@adacore.com, balrogg@gmail.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz, marex@denx.de,
 proljc@gmail.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OUC2hYtw1Go1

--_000_156594085260249352btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
respectively.

This *naive* deduction may result in genuinely native endian devices
being incorrectly declared as little or big endian, but should not
introduce regressions for current targets.

These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
has a new target with an opposite endian or 2) someone informed knows
better =3D)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/intc/arm_gic.c     | 12 ++++++------
 hw/intc/arm_gicv3.c   |  4 ++--
 hw/intc/etraxfs_pic.c |  2 +-
 hw/intc/imx_avic.c    |  2 +-
 hw/intc/imx_gpcv2.c   |  2 +-
 hw/intc/pl190.c       |  2 +-
 hw/intc/puv3_intc.c   |  2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 77427a4..283a63a 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1999,38 +1999,38 @@ static const MemoryRegionOps gic_ops[2] =3D {
     {
         .read_with_attrs =3D gic_dist_read,
         .write_with_attrs =3D gic_dist_write,
-        .endianness =3D DEVICE_NATIVE_ENDIAN,
+        .endianness =3D DEVICE_LITTLE_ENDIAN,
     },
     {
         .read_with_attrs =3D gic_thiscpu_read,
         .write_with_attrs =3D gic_thiscpu_write,
-        .endianness =3D DEVICE_NATIVE_ENDIAN,
+        .endianness =3D DEVICE_LITTLE_ENDIAN,
     }
 };

 static const MemoryRegionOps gic_cpu_ops =3D {
     .read_with_attrs =3D gic_do_cpu_read,
     .write_with_attrs =3D gic_do_cpu_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const MemoryRegionOps gic_virt_ops[2] =3D {
     {
         .read_with_attrs =3D gic_thiscpu_hyp_read,
         .write_with_attrs =3D gic_thiscpu_hyp_write,
-        .endianness =3D DEVICE_NATIVE_ENDIAN,
+        .endianness =3D DEVICE_LITTLE_ENDIAN,
     },
     {
         .read_with_attrs =3D gic_thisvcpu_read,
         .write_with_attrs =3D gic_thisvcpu_write,
-        .endianness =3D DEVICE_NATIVE_ENDIAN,
+        .endianness =3D DEVICE_LITTLE_ENDIAN,
     }
 };

 static const MemoryRegionOps gic_viface_ops =3D {
     .read_with_attrs =3D gic_do_hyp_read,
     .write_with_attrs =3D gic_do_hyp_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void arm_gic_realize(DeviceState *dev, Error **errp)
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 66eaa97..9b4d5ba 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -352,12 +352,12 @@ static const MemoryRegionOps gic_ops[] =3D {
     {
         .read_with_attrs =3D gicv3_dist_read,
         .write_with_attrs =3D gicv3_dist_write,
-        .endianness =3D DEVICE_NATIVE_ENDIAN,
+        .endianness =3D DEVICE_LITTLE_ENDIAN,
     },
     {
         .read_with_attrs =3D gicv3_redist_read,
         .write_with_attrs =3D gicv3_redist_write,
-        .endianness =3D DEVICE_NATIVE_ENDIAN,
+        .endianness =3D DEVICE_LITTLE_ENDIAN,
     }
 };

diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c
index 20e1391..d4a27d1 100644
--- a/hw/intc/etraxfs_pic.c
+++ b/hw/intc/etraxfs_pic.c
@@ -111,7 +111,7 @@ static void pic_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps pic_ops =3D {
     .read =3D pic_read,
     .write =3D pic_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/intc/imx_avic.c b/hw/intc/imx_avic.c
index 83a4101..4bef842 100644
--- a/hw/intc/imx_avic.c
+++ b/hw/intc/imx_avic.c
@@ -308,7 +308,7 @@ static void imx_avic_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps imx_avic_ops =3D {
     .read =3D imx_avic_read,
     .write =3D imx_avic_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void imx_avic_reset(DeviceState *dev)
diff --git a/hw/intc/imx_gpcv2.c b/hw/intc/imx_gpcv2.c
index a83333b..f37e6b5 100644
--- a/hw/intc/imx_gpcv2.c
+++ b/hw/intc/imx_gpcv2.c
@@ -64,7 +64,7 @@ static void imx_gpcv2_write(void *opaque, hwaddr offset,
 static const struct MemoryRegionOps imx_gpcv2_ops =3D {
     .read =3D imx_gpcv2_read,
     .write =3D imx_gpcv2_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .impl =3D {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/intc/pl190.c b/hw/intc/pl190.c
index b4f31ef..e6eab1e 100644
--- a/hw/intc/pl190.c
+++ b/hw/intc/pl190.c
@@ -220,7 +220,7 @@ static void pl190_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl190_ops =3D {
     .read =3D pl190_read,
     .write =3D pl190_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void pl190_reset(DeviceState *d)
diff --git a/hw/intc/puv3_intc.c b/hw/intc/puv3_intc.c
index e2f6d98..97999cc 100644
--- a/hw/intc/puv3_intc.c
+++ b/hw/intc/puv3_intc.c
@@ -100,7 +100,7 @@ static const MemoryRegionOps puv3_intc_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void puv3_intc_realize(DeviceState *dev, Error **errp)
--
1.8.3.1

?


--_000_156594085260249352btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div style=3D"color: rgb(33, 33, 33);"><font size=3D"2"><span style=3D"font=
-size:10pt;">
<div class=3D"PlainText">
<div><span style=3D"font-size: 10pt;">For each device declared with DEVICE_=
NATIVE_ENDIAN, find the set of</span><br>
</div>
<div>targets from the set of target/hw/*/device.o.</div>
<div><br>
</div>
<div>If the set of targets are all little or all big endian, re-declare</di=
v>
<div>the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN</di=
v>
<div>respectively.</div>
<div><br>
</div>
<div>This *naive* deduction may result in genuinely native endian devices</=
div>
<div>being incorrectly declared as little or big endian, but should not</di=
v>
<div>introduce regressions for current targets.</div>
<div><br>
</div>
<div>These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it</=
div>
<div>has a new target with an opposite endian or 2) someone informed knows<=
/div>
<div>better =3D)</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/intc/arm_gic.c &nbsp; &nbsp; | 12 &#43;&#43;&#43;&#43;&#43;&#=
43;------</div>
<div>&nbsp;hw/intc/arm_gicv3.c &nbsp; | &nbsp;4 &#43;&#43;--</div>
<div>&nbsp;hw/intc/etraxfs_pic.c | &nbsp;2 &#43;-</div>
<div>&nbsp;hw/intc/imx_avic.c &nbsp; &nbsp;| &nbsp;2 &#43;-</div>
<div>&nbsp;hw/intc/imx_gpcv2.c &nbsp; | &nbsp;2 &#43;-</div>
<div>&nbsp;hw/intc/pl190.c &nbsp; &nbsp; &nbsp; | &nbsp;2 &#43;-</div>
<div>&nbsp;hw/intc/puv3_intc.c &nbsp; | &nbsp;2 &#43;-</div>
<div>&nbsp;7 files changed, 13 insertions(&#43;), 13 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c</div>
<div>index 77427a4..283a63a 100644</div>
<div>--- a/hw/intc/arm_gic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/arm_gic.c</div>
<div>@@ -1999,38 &#43;1999,38 @@ static const MemoryRegionOps gic_ops[2] =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_dist_read,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_dist_write=
,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,=
</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_thiscpu_rea=
d,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_thiscpu_wr=
ite,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,=
</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps gic_cpu_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_do_cpu_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_do_cpu_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps gic_virt_ops[2] =3D {</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_thiscpu_hyp=
_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_thiscpu_hy=
p_write,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,=
</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_thisvcpu_re=
ad,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_thisvcpu_w=
rite,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,=
</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps gic_viface_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D gic_do_hyp_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D gic_do_hyp_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void arm_gic_realize(DeviceState *dev, Error **errp)</div=
>
<div>diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c</div>
<div>index 66eaa97..9b4d5ba 100644</div>
<div>--- a/hw/intc/arm_gicv3.c</div>
<div>&#43;&#43;&#43; b/hw/intc/arm_gicv3.c</div>
<div>@@ -352,12 &#43;352,12 @@ static const MemoryRegionOps gic_ops[] =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gicv3_dist_read=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gicv3_dist_wri=
te,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,=
</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>&nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read_with_attrs =3D gicv3_redist_re=
ad,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write_with_attrs =3D gicv3_redist_w=
rite,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,=
</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c</div>
<div>index 20e1391..d4a27d1 100644</div>
<div>--- a/hw/intc/etraxfs_pic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/etraxfs_pic.c</div>
<div>@@ -111,7 &#43;111,7 @@ static void pic_write(void *opaque, hwaddr add=
r,</div>
<div>&nbsp;static const MemoryRegionOps pic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/intc/imx_avic.c b/hw/intc/imx_avic.c</div>
<div>index 83a4101..4bef842 100644</div>
<div>--- a/hw/intc/imx_avic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/imx_avic.c</div>
<div>@@ -308,7 &#43;308,7 @@ static void imx_avic_write(void *opaque, hwadd=
r offset,</div>
<div>&nbsp;static const MemoryRegionOps imx_avic_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_avic_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_avic_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void imx_avic_reset(DeviceState *dev)</div>
<div>diff --git a/hw/intc/imx_gpcv2.c b/hw/intc/imx_gpcv2.c</div>
<div>index a83333b..f37e6b5 100644</div>
<div>--- a/hw/intc/imx_gpcv2.c</div>
<div>&#43;&#43;&#43; b/hw/intc/imx_gpcv2.c</div>
<div>@@ -64,7 &#43;64,7 @@ static void imx_gpcv2_write(void *opaque, hwaddr=
 offset,</div>
<div>&nbsp;static const struct MemoryRegionOps imx_gpcv2_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_gpcv2_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_gpcv2_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Our device would not work correct=
ly if the guest was doing</div>
<div>diff --git a/hw/intc/pl190.c b/hw/intc/pl190.c</div>
<div>index b4f31ef..e6eab1e 100644</div>
<div>--- a/hw/intc/pl190.c</div>
<div>&#43;&#43;&#43; b/hw/intc/pl190.c</div>
<div>@@ -220,7 &#43;220,7 @@ static void pl190_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps pl190_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl190_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl190_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl190_reset(DeviceState *d)</div>
<div>diff --git a/hw/intc/puv3_intc.c b/hw/intc/puv3_intc.c</div>
<div>index e2f6d98..97999cc 100644</div>
<div>--- a/hw/intc/puv3_intc.c</div>
<div>&#43;&#43;&#43; b/hw/intc/puv3_intc.c</div>
<div>@@ -100,7 &#43;100,7 @@ static const MemoryRegionOps puv3_intc_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void puv3_intc_realize(DeviceState *dev, Error **errp)</d=
iv>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_156594085260249352btcom_--
