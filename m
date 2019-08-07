Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6517267wrv;
        Wed, 7 Aug 2019 05:54:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEdB20P1By58aWlAayCtU3c9c8Gu2ao2BsCm0WCBiI8Ktu9hgP55UWXrkUYCzfWbbjEdPM
X-Received: by 2002:ac8:23cc:: with SMTP id r12mr3891451qtr.241.1565182480453;
        Wed, 07 Aug 2019 05:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565182480; cv=none;
        d=google.com; s=arc-20160816;
        b=LPUdHpdon/VTGIMFN3k8E8aUYMY5TmHZLdInQhKFelbzNmapdbQiISaanEYLCpDZKV
         aZt9e9xxmvPvZa8DMwjZfZ/r7loO/Q9X0Wu9AgjLd4sp0sbPAzGTrvg81hmnkL3dEOxn
         /Jwz3HVdSROowVQaYSh8OAwS6T1IKfAhi3aMGK24w3+TQNgdxaN5DDJy8O6MFogh5kNB
         8eyTUPlqrNruogz91sV6PIaAFHsG8rwDSbsG3DWFxsCH8Wt7QgfHmnZNhZkDINVeHjlu
         cO5TEoeRetsESdIXmy9GCaMWtmMg36TdaXuiU+Hh+MsgJbg9fgbVpZl88gg9fcCG1+jo
         aS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=ukxxgGL8AbVUps5hmnw+oBiMzjJCQJSnb0Wg2DZcZW0=;
        b=AFPTMdQI76zgiqQVpKnE4JUGsz5BpM9K/1zD+S/9jjqBJIwZO9DWb7Kb57xM7WktC+
         hFxsqHLJIPHZZfrA1Qz7iClelKtdFz6SvMI2f8/OC/pIAG/t3p7sROY6/bSe+Q92jf5E
         jsBpm+kYa+tMm4pI/FC84G1LCl4gbUKy2l0B346wE6LKpxqUgzOxfedDBVR4Ykh7NnXU
         q0q6HYyBo+kTyXvksu3eIiC++E2GNp1L9etPlH271TWYELuRg1XmBfu9m+34WJHehn94
         dtlLmzWHzT7KE9gbjDadGlQ2aHMr4sIdoyMVqNGzj8ApuiBgSNeYMBi1OLmJDtcWgXDU
         QCpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y66si1374391qkd.319.2019.08.07.05.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 05:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvLSi-0007Mj-0y
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 08:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50741)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLSY-0007MZ-8I
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 08:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLSU-0001Y1-Ez
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 08:54:28 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.75]:47769)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvLSS-0001W7-HJ; Wed, 07 Aug 2019 08:54:25 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926080.bt.com (10.36.82.111) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 13:54:09 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 13:54:22 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 13:54:21 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 06/26] hw/intc/armv7m_nic: Access
 MemoryRegion with MemOp
Thread-Index: AQHVTPo9Nitkix1nrECC/c6xbRw536bvpFu4
Date: Wed, 7 Aug 2019 12:54:21 +0000
Message-ID: <1565182461098.338@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>,
 <1565166476779.68828@bt.com>
In-Reply-To: <1565166476779.68828@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_1565182461098338btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.75
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 06/26] hw/intc/armv7m_nic:
 Access MemoryRegion with MemOp
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
 dmitry.fleytman@gmail.com, imammedo@redhat.com, sagark@eecs.berkeley.edu,
 david@redhat.com, jasowang@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, keith.busch@intel.com,
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, pbonzini@redhat.com,
 kraxel@redhat.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com, marex@denx.de,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 proljc@gmail.com, qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz,
 deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, mreitz@redhat.com, hpoussin@reactos.org,
 joel@jms.id.au, anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 rth@twiddle.net, philmd@redhat.com, green@moxielogic.com, atar4qemu@gmail.com,
 antonynpavlov@gmail.com, jiri@resnulli.us, ehabkost@redhat.com,
 minyard@acm.org, sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, yuval.shaia@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, shorne@gmail.com,
 sundeep.lkml@gmail.com, jsnow@redhat.com, david@gibson.dropbear.id.au,
 kwolf@redhat.com, crwulff@gmail.com, qemu-riscv@nongnu.org,
 xiaoguangrong.eric@gmail.com, i.mitsyanko@gmail.com, lersek@redhat.com,
 cohuck@redhat.com, alex.williamson@redhat.com, Andrew.Baumann@microsoft.com,
 jcd@tribudubois.net, andrew@aj.id.au, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de, jan.kiszka@web.de,
 stefanb@linux.ibm.com, andrew.smirnov@gmail.com, aurelien@aurel32.net,
 clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2880y9fXvSUh

--_000_1565182461098338btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry, I missed a tag.


Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>?


--_000_1565182461098338btcom_
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
<p style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
16px; background-color: rgb(255, 255, 255);">
Sorry, I&nbsp;missed a tag.<br>
</p>
<p style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
16px; background-color: rgb(255, 255, 255);">
<br>
</p>
<p style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
16px; background-color: rgb(255, 255, 255);">
<span style=3D"font-variant-ligatures: no-common-ligatures;"></span><span s=
tyle=3D"font-variant-ligatures: no-common-ligatures;">Reviewed-by: Philippe=
 Mathieu-Daud=E9 &lt;philmd@redhat.com&gt;&#8203;</span></p>
<p><br>
</p>
</body>
</html>

--_000_1565182461098338btcom_--
