Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp485156wrs;
        Fri, 16 Aug 2019 00:46:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxf/Y7gSBDJ03teaq4jz0BQWwnZwdbdADam2KiiKihlWPdeMzggpZsX9w5hN7/9ftstVSMW
X-Received: by 2002:a37:a40f:: with SMTP id n15mr7132909qke.19.1565941612558;
        Fri, 16 Aug 2019 00:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565941612; cv=none;
        d=google.com; s=arc-20160816;
        b=pD1AaQc0i19MfZdVTcYSNtRgotYs3oB6kM1kUatXI4a/7Li83Gd8OUX/hU2bTcDdJb
         fskYqX+yND28F1Uhhz1nUKwGiqM3MEvNj0/+kKqLHxJRaQ9rHg/U/q5zFoqAvv5MDfQH
         8XuYOE0If8Ka7t411DD8vlVZzg1JvQJOEpwAYZYkOrmeHgkcw2qTLj9Sr8BuMFiXExQB
         499Lgx6fsDoAbJVqzp0gtaPHwFBCeye8WqhsP1xoj/9wzLGjV8WXA9dKTCbk8Adu+yab
         lHciBKCJ448NZu6qlzx95R0Mw6bxA/IPJTq97XQM2MJfEMoMwxxIsjZOGydfH/SPgCpq
         Y0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=wRP+852eyDtKWAOHRuI0v+P37OCxsozkk8bUtg78rqA=;
        b=NMk1Zw42bseRQgt9pCJR8Jbx333byu9bmZiqq1Th3IIgyMTTqMvg/oT0z0xy4Kt0Ff
         cp4/Y6BKcY4EVZs9H0i+MFOOoFcW0YQwWzBz1d/5TnW993H5Kx13CVCFxx57v4lcqtDx
         Hh5PJbrA8E7IYesyIC9y56YN9p1+cxAtHRPqOnG6lZdl5Ho5cekLinWuHbH74HeoqxC8
         XNtliXjpFnRd8+Dgw04VCAAtywEI8jGXfjz4IdNpty8mb2sgPCs+g8Ix1HWUHmK7PkUp
         cmXm9zy/SZQsrpFjUm/19YQMKeJ3v8zI2H8ht4ccQx9GIZtHkiVcUvrxjuwEVAPdcHL3
         VOkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d207si2879024qkb.349.2019.08.16.00.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 00:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:50842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyWwl-0004k7-7v
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 03:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWlg-0000L2-7g
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:35:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWlc-0001NI-7W
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:35:24 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.237]:34366)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWlb-0001Me-Ry; Fri, 16 Aug 2019 03:35:20 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A010ED66.bt.com (10.187.98.36) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:34:21 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:35:16 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:35:17 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 27/42] hw/pci-host: Declare device little
 or big endian
Thread-Index: AQHVVAUm9cRG05Q0ik+pgpUUBF5+Rg==
Date: Fri, 16 Aug 2019 07:35:16 +0000
Message-ID: <1565940916012.8169@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_15659409160128169btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.237
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 27/42] hw/pci-host: Declare
 device little or big endian
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
X-TUID: wV1DJW5pzfGe

--_000_15659409160128169btcom_
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
 hw/pci-host/q35.c       | 2 +-
 hw/pci-host/versatile.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 0a010be..fd20f72 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -288,7 +288,7 @@ static void tseg_blackhole_write(void *opaque, hwaddr a=
ddr, uint64_t val,
 static const MemoryRegionOps tseg_blackhole_ops =3D {
     .read =3D tseg_blackhole_read,
     .write =3D tseg_blackhole_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
     .impl.min_access_size =3D 4,
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 791b321..e7017f3 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -240,7 +240,7 @@ static uint64_t pci_vpb_reg_read(void *opaque, hwaddr a=
ddr,
 static const MemoryRegionOps pci_vpb_reg_ops =3D {
     .read =3D pci_vpb_reg_read,
     .write =3D pci_vpb_reg_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
@@ -306,7 +306,7 @@ static uint64_t pci_vpb_config_read(void *opaque, hwadd=
r addr,
 static const MemoryRegionOps pci_vpb_config_ops =3D {
     .read =3D pci_vpb_config_read,
     .write =3D pci_vpb_config_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static int pci_vpb_map_irq(PCIDevice *d, int irq_num)
--
1.8.3.1

?


--_000_15659409160128169btcom_
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
<div>&nbsp;hw/pci-host/q35.c &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/pci-host/versatile.c | 4 &#43;&#43;--</div>
<div>&nbsp;2 files changed, 3 insertions(&#43;), 3 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c</div>
<div>index 0a010be..fd20f72 100644</div>
<div>--- a/hw/pci-host/q35.c</div>
<div>&#43;&#43;&#43; b/hw/pci-host/q35.c</div>
<div>@@ -288,7 &#43;288,7 @@ static void tseg_blackhole_write(void *opaque,=
 hwaddr addr, uint64_t val,</div>
<div>&nbsp;static const MemoryRegionOps tseg_blackhole_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D tseg_blackhole_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D tseg_blackhole_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.impl.min_access_size =3D 4,</div>
<div>diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c</div>
<div>index 791b321..e7017f3 100644</div>
<div>--- a/hw/pci-host/versatile.c</div>
<div>&#43;&#43;&#43; b/hw/pci-host/versatile.c</div>
<div>@@ -240,7 &#43;240,7 @@ static uint64_t pci_vpb_reg_read(void *opaque,=
 hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pci_vpb_reg_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_vpb_reg_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_vpb_reg_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>@@ -306,7 &#43;306,7 @@ static uint64_t pci_vpb_config_read(void *opaq=
ue, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps pci_vpb_config_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pci_vpb_config_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pci_vpb_config_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int pci_vpb_map_irq(PCIDevice *d, int irq_num)</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_15659409160128169btcom_--
