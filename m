Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp479088wrs;
        Fri, 16 Aug 2019 00:37:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTS/PJrUcePIQTqa9wZvwmsEDUcdGqcdP2OXtBrxVRMVb/yWhEGsbiOdeJQozjPVVbcnpc
X-Received: by 2002:a17:906:e241:: with SMTP id gq1mr7847519ejb.265.1565941074117;
        Fri, 16 Aug 2019 00:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565941074; cv=none;
        d=google.com; s=arc-20160816;
        b=R+NC8dGFp8CRB32zyXpdnuYZhMzqROmRDuRUvYgZQYhKsKbRKuxxYwbsapKqRaDatU
         JvkZ9Fcwl+KRJiSDcLY7nTadToFtO88+Q78IbhFiIeAKoV43LPdzR4hLqIryIz4riOpm
         3AYitw59OcrsV0yVsfUn6Z9pL4HgrkA+V4xaJWOOmP6FuKDxGq7ptRD1zaMEgtwmuVQc
         OFsTyGxBN+pKy7KiQLcBofVqiIp8XMDLlGYcDU50OkibdDvvgb3sTpvrFfHYyVRH0dKZ
         1MGABgQpPwmOwtqCxKvu3AfpUC9it4vbXRWp436NzteiTkDCeWrIZZHeEeedrZMB0hVn
         cd3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=cPoGLjRbszw7wkquGXqhLOMti30aTfkWa/t7c0z4pFM=;
        b=hQtIi5QrGmwF+k8/xOqkQi5Ajk+9JGWcx32TzFjyR8UhcnyuhK7kZ9/lSrLywq+LTM
         27i6snidtwnU8ZasgOu4DICYXHSLLBagm1acaVD9NEdfKoCn0EajjhxCr1JoLARFG9O4
         zQFBFH1Ms8hQXxZv6LHmGNRTwKg8hUqn7gRDA1llpFBFfqV2CH/CJTH8ilohrT4f7z+C
         togKH7IQzcYBZQKHNAhcGwBnwJInKTvIKBREwfoV2uwYSQG+dJe49/xjPrVxa6QBf4If
         qEzoeAYKuRVCHh+Jble0kLZ9SxvbeTmvtz2sI8Epr58K3/aOYZJU72MK12kqwl4g6g2+
         9Wsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si2739262ede.278.2019.08.16.00.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 00:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyWo4-0003Ge-RH
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 03:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39150)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWk4-00076E-TD
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:33:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWk2-0000UK-Ip
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:33:44 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.77]:32339)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWjo-0000Ld-FN; Fri, 16 Aug 2019 03:33:28 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 BWP09926082.bt.com (10.36.82.113) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:33:03 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:33:26 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:33:26 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 20/42] hw/gpio: Declare device little or
 big endian
Thread-Index: AQHVVATkESyOX2J9ZE+VGJcdShqFzA==
Date: Fri, 16 Aug 2019 07:33:26 +0000
Message-ID: <1565940805795.99783@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594080579599783btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.77
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 20/42] hw/gpio: Declare device
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
X-TUID: CplPsw0YvaSU

--_000_156594080579599783btcom_
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
 hw/gpio/pl061.c  | 2 +-
 hw/gpio/zaurus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 02c01fd..da6ff6a 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -339,7 +339,7 @@ static void pl061_set_irq(void * opaque, int irq, int l=
evel)
 static const MemoryRegionOps pl061_ops =3D {
     .read =3D pl061_read,
     .write =3D pl061_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void pl061_luminary_init(Object *obj)
diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index f2f1f67..599d862 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -156,7 +156,7 @@ static void scoop_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps scoop_ops =3D {
     .read =3D scoop_read,
     .write =3D scoop_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void scoop_gpio_set(void *opaque, int line, int level)
--
1.8.3.1

?


--_000_156594080579599783btcom_
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
<div>&nbsp;hw/gpio/pl061.c &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/gpio/zaurus.c | 2 &#43;-</div>
<div>&nbsp;2 files changed, 2 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c</div>
<div>index 02c01fd..da6ff6a 100644</div>
<div>--- a/hw/gpio/pl061.c</div>
<div>&#43;&#43;&#43; b/hw/gpio/pl061.c</div>
<div>@@ -339,7 &#43;339,7 @@ static void pl061_set_irq(void * opaque, int i=
rq, int level)</div>
<div>&nbsp;static const MemoryRegionOps pl061_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl061_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl061_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl061_luminary_init(Object *obj)</div>
<div>diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c</div>
<div>index f2f1f67..599d862 100644</div>
<div>--- a/hw/gpio/zaurus.c</div>
<div>&#43;&#43;&#43; b/hw/gpio/zaurus.c</div>
<div>@@ -156,7 &#43;156,7 @@ static void scoop_write(void *opaque, hwaddr a=
ddr,</div>
<div>&nbsp;static const MemoryRegionOps scoop_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D scoop_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D scoop_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void scoop_gpio_set(void *opaque, int line, int level)</d=
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

--_000_156594080579599783btcom_--
