Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6253563wrv;
        Wed, 7 Aug 2019 01:32:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7bRVbudIhUOOC1xR96o8N3JxTqkbdjl2/GW2OePJZLabK99ilp8mxogEZMb1M52jqrVpU
X-Received: by 2002:a37:7cc5:: with SMTP id x188mr7000160qkc.456.1565166763903;
        Wed, 07 Aug 2019 01:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565166763; cv=none;
        d=google.com; s=arc-20160816;
        b=Kzjxscfp/CzV/s4A9HQpshux1BPYme3juRQvM+JDrYB7ohx6Dselz0q3o1mjHs4S3y
         WmbL9gp2mZjzuBpGX4mI8JdI/5K2d3bu7VBJ9MbTCBRZ5cXqum9FmBJfBnzzF1Y6mJYH
         h70Nl0STvHxllyMR/drRbV+EN++iUtIutPT6XwJ6myynut9kFIe/mrYcZzFJuGba/1Uo
         ULQShmuSJBdfR1TftSO2E7NiwLGwJINsQ8Xj38eCGKiwWyN2mj7IqI2+CFKRgs/oO8Xq
         MHnma+YYNq7xnFZFrsAxJe1/15wQHwQLIL+mBSc3w4Ee3gk2QYzv+HbkdQivQmud2K+J
         DJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=DewryHG8VF5zGy7Lvoo6+VqbAg09iy4Q8ETvgf+0ZUI=;
        b=fyEvbmVbLuBvzOeHYDSHeYxFJA9ouEF/dPpHeP0dTJeA3lt4vlWRZat6+JhHcreGKX
         kjgxSqOrHZ0sPXzGeond7t5PT1RHL3PaysYbjD0wKMyQtm3IupsSAzw+eAk6lFWIB5Bj
         bbRMQ8Ikgx6F/URbOeX/C03OqtY2wvTmCs4J1Po1ULkSCRytbZkVbGUnc6xZ6bKUxOdD
         TtjjtznMCbISYLJhEqdCjAKF9Xif9U9++MSH0l+6TfgjQW3bJ9pkWyS//DaCxNMjSP1B
         MryYHX85bHafli6PvFKyLrqFA7pHy5/AB/viquNyn5paokoz95n6qg+nkbUvB+9hHrsl
         jwag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12si32599902qva.159.2019.08.07.01.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 01:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:38458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvHND-0001Mi-FT
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 04:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45242)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHN5-0001Ha-4j
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:32:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHN3-0002X3-Ok
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:32:35 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.77]:9795)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvHN0-0002VN-8U; Wed, 07 Aug 2019 04:32:30 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926082.bt.com (10.36.82.113) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:32:14 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:32:27 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:32:27 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 18/26] exec: Delete device_endian
Thread-Index: AQHVTPqlw4QCqX/rC0CPqHm682cCsg==
Date: Wed, 7 Aug 2019 08:32:27 +0000
Message-ID: <1565166747494.26346@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156516674749426346btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.77
Subject: [Qemu-arm] [Qemu-devel] [PATCH v6 18/26] exec: Delete device_endian
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, pburton@wavecomp.com, xiaoguangrong.eric@gmail.com,
 peter.chubb@nicta.com.au, philmd@redhat.com, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, chouteau@adacore.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, jcd@tribudubois.net,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, mreitz@redhat.com,
 hpoussin@reactos.org, joel@jms.id.au, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au, lersek@redhat.com,
 green@moxielogic.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 marex@denx.de, jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org,
 qemu-s390x@nongnu.org, sw@weilnetz.de, alistair@alistair23.me,
 yuval.shaia@oracle.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jan.kiszka@web.de,
 clg@kaod.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 shorne@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-riscv@nongnu.org, proljc@gmail.com, pbonzini@redhat.com, andrew@aj.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, andrew.smirnov@gmail.com,
 michael@walle.cc, paul.durrant@citrix.com, qemu-ppc@nongnu.org,
 huth@tuxfamily.org, amarkovic@wavecomp.com, imammedo@redhat.com,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LWMKwxGBH/k2

--_000_156516674749426346btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

device_endian has been made redundant by MemOp.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/cpu-common.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 01a29ba..7eeb78c 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -18,14 +18,6 @@ void tcg_flush_softmmu_tlb(CPUState *cs);

 #include "exec/memop.h"

-enum device_endian {
-#ifdef NEED_CPU_H
-    DEVICE_NATIVE_ENDIAN =3D MO_TE,
-#endif
-    DEVICE_BIG_ENDIAN =3D MO_BE,
-    DEVICE_LITTLE_ENDIAN =3D MO_LE,
-};
-
 #if defined(HOST_WORDS_BIGENDIAN)
 #define DEVICE_HOST_ENDIAN MO_BE
 #else
--
1.8.3.1

?


--_000_156516674749426346btcom_
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
<div><span style=3D"font-size: 10pt;">device_endian has been made redundant=
 by MemOp.</span><br>
</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;include/exec/cpu-common.h | 8 --------</div>
<div>&nbsp;1 file changed, 8 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h</di=
v>
<div>index 01a29ba..7eeb78c 100644</div>
<div>--- a/include/exec/cpu-common.h</div>
<div>&#43;&#43;&#43; b/include/exec/cpu-common.h</div>
<div>@@ -18,14 &#43;18,6 @@ void tcg_flush_softmmu_tlb(CPUState *cs);</div>
<div>&nbsp;</div>
<div>&nbsp;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;</div>
<div>-enum device_endian {</div>
<div>-#ifdef NEED_CPU_H</div>
<div>- &nbsp; &nbsp;DEVICE_NATIVE_ENDIAN =3D MO_TE,</div>
<div>-#endif</div>
<div>- &nbsp; &nbsp;DEVICE_BIG_ENDIAN =3D MO_BE,</div>
<div>- &nbsp; &nbsp;DEVICE_LITTLE_ENDIAN =3D MO_LE,</div>
<div>-};</div>
<div>-</div>
<div>&nbsp;#if defined(HOST_WORDS_BIGENDIAN)</div>
<div>&nbsp;#define DEVICE_HOST_ENDIAN MO_BE</div>
<div>&nbsp;#else</div>
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

--_000_156516674749426346btcom_--
