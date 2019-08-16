Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp493850wrs;
        Fri, 16 Aug 2019 01:00:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHj/Y+0KEN5v6uZwuSil4JGxCzzsxuyayQEgEUmCabk3omfXPwynlBJHZLY0fsVR3/ssCt
X-Received: by 2002:aed:3aa1:: with SMTP id o30mr7404634qte.198.1565942409878;
        Fri, 16 Aug 2019 01:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565942409; cv=none;
        d=google.com; s=arc-20160816;
        b=YCC824EA9LyzOZCjWyIyIVC8YyY/OXf3l3v4GKuvFZH0R4QDzy1XGHOPmZFt9z9yVB
         f13QXKrrDv4IVpDBEIlbwfTE1rIOgxSGxUIFKBZKwRQ1PT53jd/ZLtmM1naM57mr8IVq
         bC1NwKh9c6xzFY8fbdJRuSZKNMAwDsnp023zMF6rQGuHA7vfEGM/LvTwtnvKmeQ0nzv/
         cztownD7mxkMS0OhGnWcApJj6NXaBDZFlbfkrzYtspHzITFrXxA0irWyztla0sTTJ0FE
         2o07ktgvnPhvUQvMAlZi7LtTKqJBMaxwjp2S33sRg3BUFKr8bvJ/cIE4FhIV0OHQJJpv
         N5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=xhrxM/YsCu5wzv9H830bS1g23pFSwpFIJZNBYkqy8HU=;
        b=tsclTUPjQLIQKugOQnyP+AkfajYf+T5ZRgLzEvXfygyw536n66kt3kDZFH0WpFRvHH
         A0rP7W6w4ss6/bu0QpwZjqCXdIbTZzccL89zVuF9LkEn12ROjsGnbhX8lDg+N6diiKk9
         sXpK9WjgnfH0nqm50PGFFqB2tiYt57WSeeaOLn8be+o+Tq0t77bCX0Gjh/Bji2ff9fC+
         wGuGSbzHiOQLzw/ye6rHMz2KympYaDW2/r9Tj6SQ9FQN/iMv4YDvveBPa+G/MDzBeO1J
         2byWhQtdVUPysrvZEShAY+z51ryicaOt6SrF832RJqZzVqgoTKyXdwSedyTvHTlUfkhs
         PaQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y34si2949026qta.306.2019.08.16.01.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 01:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyX9d-0006Sm-0V
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 04:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWlP-0008VP-V6
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:35:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWlM-0001HF-6L
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:35:07 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.235]:51437)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWlL-0001Ek-QA; Fri, 16 Aug 2019 03:35:04 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 RDW083A011ED67.bt.com (10.187.98.37) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:40:57 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:35:00 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:35:00 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 26/42] hw/net: Declare device little or
 big endian
Thread-Index: AQHVVAUcPICP1n2ya0Cx6fWxt6l8Gg==
Date: Fri, 16 Aug 2019 07:35:00 +0000
Message-ID: <1565940899704.36138@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594089970436138btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.235
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 26/42] hw/net: Declare device
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
X-TUID: NmM8wgEYSzbG

--_000_156594089970436138btcom_
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
 hw/net/allwinner_emac.c | 2 +-
 hw/net/imx_fec.c        | 2 +-
 hw/net/lan9118.c        | 4 ++--
 hw/net/lance.c          | 2 +-
 hw/net/smc91c111.c      | 2 +-
 hw/net/stellaris_enet.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
index eecda52..97e22e7 100644
--- a/hw/net/allwinner_emac.c
+++ b/hw/net/allwinner_emac.c
@@ -418,7 +418,7 @@ static void aw_emac_set_link(NetClientState *nc)
 static const MemoryRegionOps aw_emac_mem_ops =3D {
     .read =3D aw_emac_read,
     .write =3D aw_emac_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 404154e..76d42c8 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1278,7 +1278,7 @@ static const MemoryRegionOps imx_eth_ops =3D {
     .write                 =3D imx_eth_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness            =3D DEVICE_NATIVE_ENDIAN,
+    .endianness            =3D DEVICE_LITTLE_ENDIAN,
 };

 static void imx_eth_cleanup(NetClientState *nc)
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index f6120be..bb1bbb3 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1304,13 +1304,13 @@ static uint64_t lan9118_16bit_mode_read(void *opaqu=
e, hwaddr offset,
 static const MemoryRegionOps lan9118_mem_ops =3D {
     .read =3D lan9118_readl,
     .write =3D lan9118_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const MemoryRegionOps lan9118_16bit_mem_ops =3D {
     .read =3D lan9118_16bit_mode_read,
     .write =3D lan9118_16bit_mode_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static NetClientInfo net_lan9118_info =3D {
diff --git a/hw/net/lance.c b/hw/net/lance.c
index 2978c01..d95f170 100644
--- a/hw/net/lance.c
+++ b/hw/net/lance.c
@@ -74,7 +74,7 @@ static uint64_t lance_mem_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps lance_mem_ops =3D {
     .read =3D lance_mem_read,
     .write =3D lance_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 2,
         .max_access_size =3D 2,
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 4a612ee..49e4bf5 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -757,7 +757,7 @@ static const MemoryRegionOps smc91c111_mem_ops =3D {
     .write =3D smc91c111_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static NetClientInfo net_smc91c111_info =3D {
diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 2f645bf..15ec227 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -456,7 +456,7 @@ static void stellaris_enet_write(void *opaque, hwaddr o=
ffset,
 static const MemoryRegionOps stellaris_enet_ops =3D {
     .read =3D stellaris_enet_read,
     .write =3D stellaris_enet_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void stellaris_enet_reset(DeviceState *dev)
--
1.8.3.1

?


--_000_156594089970436138btcom_
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
<div>&nbsp;hw/net/allwinner_emac.c | 2 &#43;-</div>
<div>&nbsp;hw/net/imx_fec.c &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/net/lan9118.c &nbsp; &nbsp; &nbsp; &nbsp;| 4 &#43;&#43;--</di=
v>
<div>&nbsp;hw/net/lance.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-</div=
>
<div>&nbsp;hw/net/smc91c111.c &nbsp; &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/net/stellaris_enet.c | 2 &#43;-</div>
<div>&nbsp;6 files changed, 7 insertions(&#43;), 7 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c</div>
<div>index eecda52..97e22e7 100644</div>
<div>--- a/hw/net/allwinner_emac.c</div>
<div>&#43;&#43;&#43; b/hw/net/allwinner_emac.c</div>
<div>@@ -418,7 &#43;418,7 @@ static void aw_emac_set_link(NetClientState *n=
c)</div>
<div>&nbsp;static const MemoryRegionOps aw_emac_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aw_emac_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aw_emac_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c</div>
<div>index 404154e..76d42c8 100644</div>
<div>--- a/hw/net/imx_fec.c</div>
<div>&#43;&#43;&#43; b/hw/net/imx_fec.c</div>
<div>@@ -1278,7 &#43;1278,7 @@ static const MemoryRegionOps imx_eth_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp;.write &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; =3D imx_eth_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
=3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;=3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void imx_eth_cleanup(NetClientState *nc)</div>
<div>diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c</div>
<div>index f6120be..bb1bbb3 100644</div>
<div>--- a/hw/net/lan9118.c</div>
<div>&#43;&#43;&#43; b/hw/net/lan9118.c</div>
<div>@@ -1304,13 &#43;1304,13 @@ static uint64_t lan9118_16bit_mode_read(vo=
id *opaque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps lan9118_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lan9118_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lan9118_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps lan9118_16bit_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lan9118_16bit_mode_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lan9118_16bit_mode_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static NetClientInfo net_lan9118_info =3D {</div>
<div>diff --git a/hw/net/lance.c b/hw/net/lance.c</div>
<div>index 2978c01..d95f170 100644</div>
<div>--- a/hw/net/lance.c</div>
<div>&#43;&#43;&#43; b/hw/net/lance.c</div>
<div>@@ -74,7 &#43;74,7 @@ static uint64_t lance_mem_read(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps lance_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lance_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lance_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 2,</div>
<div>diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c</div>
<div>index 4a612ee..49e4bf5 100644</div>
<div>--- a/hw/net/smc91c111.c</div>
<div>&#43;&#43;&#43; b/hw/net/smc91c111.c</div>
<div>@@ -757,7 &#43;757,7 @@ static const MemoryRegionOps smc91c111_mem_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D smc91c111_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static NetClientInfo net_smc91c111_info =3D {</div>
<div>diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c</div>
<div>index 2f645bf..15ec227 100644</div>
<div>--- a/hw/net/stellaris_enet.c</div>
<div>&#43;&#43;&#43; b/hw/net/stellaris_enet.c</div>
<div>@@ -456,7 &#43;456,7 @@ static void stellaris_enet_write(void *opaque,=
 hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps stellaris_enet_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stellaris_enet_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stellaris_enet_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void stellaris_enet_reset(DeviceState *dev)</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594089970436138btcom_--
