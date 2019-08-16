Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp489518wrs;
        Fri, 16 Aug 2019 00:53:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBIiCQhZmHwS3q96Qf/oAJ/sftqjLbxsBXamnK03UlUWIXrGJW93vWHhG4T7qbViRLI/vi
X-Received: by 2002:ac8:40cc:: with SMTP id f12mr7332023qtm.256.1565942015069;
        Fri, 16 Aug 2019 00:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565942015; cv=none;
        d=google.com; s=arc-20160816;
        b=NevYwAhu9p/TFtog8bGtdoPyrfJ+EuRy4PDRh2v2yjPCLJyrqbmdoHYPT6P9pZYh2c
         u33isyGyGsg3+RMRDZt8ib9IeF5FJNrBNL4Ku+bEZfJgBZ+W8KA2vXzPnt14/AFL0wJ9
         3ilHEH3dpxDOzk7kjDO570qtMdVdPDIq9mZo8QkR5w1KMd+5BAsiUD+3VPhWGa1L7L09
         jZz7h9ArPCPl/fxCN1LIguww8HxaZdvobZoLos/i2g9eocO92ky9K1bBOuh1hJjYBH9B
         +sKyEEPeaw//3iRvlMD0rP+3TocOurgvqsGViF3nA3mNRTaOlvZ0o3PsCUGvDaVqSqne
         BxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=p3bEbkhXCAT7URPrnZOYHcbJ0S82v3OUWADayimiBBg=;
        b=Y1t6nNXrGqGU3tL/QYOUHxuJoFuleMB6FbM44/IRnDVJYfNnEE2jGWGUxmVKUTBC4x
         I6eBPtV/+z73sXKwaV5XDZrsj6nLno7g/q7iaD5C9Py16GA+Da/r0IvEciWx8Vb+ZZRK
         6fHPB13ALA0qR0QFgSE/dlLCjNXNG7+7L9IwMCt7KRgO7ODJNNcyuFnY5M56h9KtsNkR
         0cDok+d5RYdhANNadUTcA0GBxph1ExcieuC3jyp3c95WhBdTFjfTEUGG2DvGnKj21sKX
         B3J5QXbmCyqhrkfyuEIHIcO/97uppEqeY9eDrFKEBFvxY9v50f+XzbPgvlJMI5cvMACl
         Rysw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26si2869743qkl.23.2019.08.16.00.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 00:53:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyX3F-00053E-NJ
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 03:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39161)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWk5-00077B-Iz
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:33:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWk1-0000U4-Pg
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:33:45 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.78]:56457)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWjY-0000Av-HM; Fri, 16 Aug 2019 03:33:14 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926083.bt.com (10.36.82.114) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:32:44 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:33:05 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:33:05 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 19/42] hw/dma: Declare device little or
 big endian
Thread-Index: AQHVVATXv2y4d28XbEKe3xKBzbpwgA==
Date: Fri, 16 Aug 2019 07:33:05 +0000
Message-ID: <1565940784105.45471@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594078410545471btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.78
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 19/42] hw/dma: Declare device
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
X-TUID: iIJ8xOZxb7mU

--_000_156594078410545471btcom_
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
 hw/dma/bcm2835_dma.c | 4 ++--
 hw/dma/etraxfs_dma.c | 2 +-
 hw/dma/pl080.c       | 2 +-
 hw/dma/pl330.c       | 2 +-
 hw/dma/puv3_dma.c    | 2 +-
 hw/dma/sparc32_dma.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index a39e8f4..907d25c 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -288,7 +288,7 @@ static void bcm2835_dma15_write(void *opaque, hwaddr of=
fset, uint64_t value,
 static const MemoryRegionOps bcm2835_dma0_ops =3D {
     .read =3D bcm2835_dma0_read,
     .write =3D bcm2835_dma0_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
@@ -296,7 +296,7 @@ static const MemoryRegionOps bcm2835_dma0_ops =3D {
 static const MemoryRegionOps bcm2835_dma15_ops =3D {
     .read =3D bcm2835_dma15_read,
     .write =3D bcm2835_dma15_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index 85783eb..df3ba09 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -697,7 +697,7 @@ dma_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps dma_ops =3D {
  .read =3D dma_read,
  .write =3D dma_write,
- .endianness =3D DEVICE_NATIVE_ENDIAN,
+ .endianness =3D DEVICE_LITTLE_ENDIAN,
  .valid =3D {
  .min_access_size =3D 1,
  .max_access_size =3D 4
diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 7e57624..644eadb 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -346,7 +346,7 @@ static void pl080_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl080_ops =3D {
     .read =3D pl080_read,
     .write =3D pl080_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void pl080_reset(DeviceState *dev)
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index a56a3e7..4c51f2d 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1493,7 +1493,7 @@ static uint64_t pl330_iomem_read(void *opaque, hwaddr=
 offset,
 static const MemoryRegionOps pl330_ops =3D {
     .read =3D pl330_iomem_read,
     .write =3D pl330_iomem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c
index 122f87a..7002373 100644
--- a/hw/dma/puv3_dma.c
+++ b/hw/dma/puv3_dma.c
@@ -75,7 +75,7 @@ static const MemoryRegionOps puv3_dma_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void puv3_dma_realize(DeviceState *dev, Error **errp)
diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index 88765d0..6b32372 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -224,7 +224,7 @@ static void dma_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps dma_mem_ops =3D {
     .read =3D dma_mem_read,
     .write =3D dma_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
--
1.8.3.1

?


--_000_156594078410545471btcom_
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
<div><span style=3D"font-size: 12pt;">For each device declared with DEVICE_=
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
<div>&nbsp;hw/dma/bcm2835_dma.c | 4 &#43;&#43;--</div>
<div>&nbsp;hw/dma/etraxfs_dma.c | 2 &#43;-</div>
<div>&nbsp;hw/dma/pl080.c &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/dma/pl330.c &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/dma/puv3_dma.c &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/dma/sparc32_dma.c | 2 &#43;-</div>
<div>&nbsp;6 files changed, 7 insertions(&#43;), 7 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c</div>
<div>index a39e8f4..907d25c 100644</div>
<div>--- a/hw/dma/bcm2835_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/bcm2835_dma.c</div>
<div>@@ -288,7 &#43;288,7 @@ static void bcm2835_dma15_write(void *opaque, =
hwaddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_dma0_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_dma0_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_dma0_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>@@ -296,7 &#43;296,7 @@ static const MemoryRegionOps bcm2835_dma0_ops =
=3D {</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_dma15_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_dma15_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_dma15_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c</div>
<div>index 85783eb..df3ba09 100644</div>
<div>--- a/hw/dma/etraxfs_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/etraxfs_dma.c</div>
<div>@@ -697,7 &#43;697,7 @@ dma_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps dma_ops =3D {</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.read =3D dma_read,</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.write =3D dma_write,</div>
<div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>.end=
ianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>=
.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.valid =3D {</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.min_access_size =3D 1,</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.max_access_size =3D 4</div>
<div>diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c</div>
<div>index 7e57624..644eadb 100644</div>
<div>--- a/hw/dma/pl080.c</div>
<div>&#43;&#43;&#43; b/hw/dma/pl080.c</div>
<div>@@ -346,7 &#43;346,7 @@ static void pl080_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps pl080_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl080_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl080_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl080_reset(DeviceState *dev)</div>
<div>diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c</div>
<div>index a56a3e7..4c51f2d 100644</div>
<div>--- a/hw/dma/pl330.c</div>
<div>&#43;&#43;&#43; b/hw/dma/pl330.c</div>
<div>@@ -1493,7 &#43;1493,7 @@ static uint64_t pl330_iomem_read(void *opaqu=
e, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps pl330_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl330_iomem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl330_iomem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c</div>
<div>index 122f87a..7002373 100644</div>
<div>--- a/hw/dma/puv3_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/puv3_dma.c</div>
<div>@@ -75,7 &#43;75,7 @@ static const MemoryRegionOps puv3_dma_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void puv3_dma_realize(DeviceState *dev, Error **errp)</di=
v>
<div>diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c</div>
<div>index 88765d0..6b32372 100644</div>
<div>--- a/hw/dma/sparc32_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/sparc32_dma.c</div>
<div>@@ -224,7 &#43;224,7 @@ static void dma_mem_write(void *opaque, hwaddr=
 addr,</div>
<div>&nbsp;static const MemoryRegionOps dma_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D dma_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D dma_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594078410545471btcom_--
