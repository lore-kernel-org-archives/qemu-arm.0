Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6504603wrv;
        Wed, 7 Aug 2019 05:41:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcjONJnI/ylEj9bCv+q1uGfCGf/lAysrpAgbiPyC8UXFDpVPGQoWB9hxICHdl3feaHg3f4
X-Received: by 2002:a37:a40f:: with SMTP id n15mr7578039qke.19.1565181683464;
        Wed, 07 Aug 2019 05:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565181683; cv=none;
        d=google.com; s=arc-20160816;
        b=fyQFDxVhNHgTfoiTGiv5dQH2lYbuiNk5UviW29aZ+xBvLPfNFjFVAp33QuAQBwsISl
         LNbkAHp69JjhpS/mm8oOlLAb6FpGnfn+xZAaJH1afZOE7ZxC8uoO5RosPlqZQuji/QEf
         imiAJ9QSE+w9LupiRgvnOxzYbM2hhZxnKoWkPN6s+gfMclfvDCVcUXIruHKcI6OvIZ5m
         G6P9Kpu629QoybRkkTcfZywa+galMBfRx452PyXwTvW1ZEtSR8qO+rcPwuM3xOwLAxpA
         9dZwXrC/tcokwfLWt90LKGVTtIuEWmoiH9yXcPHgnBJpx4URBdetPdapYOnlw3gu0Ag5
         1Pdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=igBySKzO/E6v6cJTEvioEgprIBN2B9d+M0wgH0Dltlk=;
        b=bNxLJRW+xgJ/r1uHmQ2PGXw8bK35NmoWoIGToBJJaEATM4yrQ0ocBmtta7XPFXzjoY
         gwvKTwQChgpngquwO+DMsecrs57lYFJbqEyQPYIVbeq9hEMMD1or598rwUkdFdzQirEE
         UuoNaHojF9cw3MOczlIHUNETRcoK9GijILYqD6rgOLD3zWm1G731VhynrcJNIPy7CR7h
         nTQuhihdwDJCaKJOKV9R5nZF2niiP0v4gpUE0qz0rT/OTk9w/1z/ghkGpKdgqSEJhuUR
         G8t70QYbRj8xTsudj9XuPcpe7bwGTuRlMcdXcd7AbTx+78uBRWUmCzuCR7RCCa3Jra9P
         cP7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si49643458qkm.276.2019.08.07.05.41.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 05:41:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:40578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvLFr-0003xk-1A
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 08:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46309)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLFl-0003tx-9J
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 08:41:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLFj-0007pY-Vh
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 08:41:17 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.234]:21551)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvLFe-0007ic-D8; Wed, 07 Aug 2019 08:41:10 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 7 Aug 2019 13:40:45 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 13:41:06 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 13:41:06 +0100
From: <tony.nguyen@bt.com>
To: <philmd@redhat.com>, <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in SPARCv9 MMU
 TTE
Thread-Index: AQHVTPljpfwTk/sMkk++4xOSHxskc6bvbaGAgAAxHHw=
Date: Wed, 7 Aug 2019 12:41:06 +0000
Message-ID: <1565181666201.26324@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>,
 <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
In-Reply-To: <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156518166620126324btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in
 SPARCv9 MMU TTE
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
 dmitry.fleytman@gmail.com, sagark@eecs.berkeley.edu, mst@redhat.com,
 green@moxielogic.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, pbonzini@redhat.com, kraxel@redhat.com,
 mreitz@redhat.com, pburton@wavecomp.com, marex@denx.de, robh@kernel.org,
 hare@suse.com, gxt@mprc.pku.edu.cn, berto@igalia.com, proljc@gmail.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 david@redhat.com, magnus.damm@gmail.com, yuval.shaia@oracle.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, hpoussin@reactos.org,
 joel@jms.id.au, marcel.apfelbaum@gmail.com, anthony.perard@citrix.com,
 marcandre.lureau@redhat.com, david@gibson.dropbear.id.au, balrogg@gmail.com,
 jasowang@redhat.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org, jcd@tribudubois.net,
 sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 sstabellini@kernel.org, jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 imammedo@redhat.com, xen-devel@lists.xenproject.org, shorne@gmail.com,
 andrew.smirnov@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, xiaoguangrong.eric@gmail.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, lersek@redhat.com, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 i.mitsyanko@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +FcmNozKJHLB

--_000_156518166620126324btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 8/7/19 8:37 PM, Philippe Mathieu-Daud=E9 wrote:

> I'm confused I think I already reviewed various patches of your previous
?> series but don't see my Reviewed-by tags.?


Apologies Philippe! I am the confused one here =3D/


Will append.


Thank you very much for the reviews and qemu-devel newbie tips so far. I ha=
ve felt very welcome.


Tony

--_000_156518166620126324btcom_
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
<p><span style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); fon=
t-family: Calibri, Arial, Helvetica, sans-serif; font-size: 13.333333015441=
895px; background-color: rgb(255, 255, 255);">On 8/7/19
<span style=3D"font-family: Calibri, sans-serif; font-size: 14.666666984558=
105px; background-color: rgb(255, 255, 255);">
8:37 PM</span>, <span style=3D"font-family: Calibri, sans-serif; font-size:=
 14.666666984558105px; background-color: rgb(255, 255, 255);">
Philippe Mathieu-Daud=E9</span> wrote:</span></p>
<p><span style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); fon=
t-family: Calibri, Arial, Helvetica, sans-serif; font-size: 13.333333015441=
895px; background-color: rgb(255, 255, 255);">&gt;&nbsp;I'm confused I thin=
k I already reviewed various patches of your
 previous</span><br style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 3=
3, 33); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 13.3=
33333015441895px;">
<span style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-f=
amily: Calibri, Arial, Helvetica, sans-serif; font-size: 13.333333015441895=
px; background-color: rgb(255, 255, 255);">&#8203;&gt;&nbsp;series but don'=
t see my Reviewed-by tags.</span>&#8203;<br>
</p>
<p><br>
</p>
<p>Apologies Philippe!&nbsp;I am the confused one here =3D/</p>
<p><br>
</p>
<p>Will append.<br>
</p>
<p><br>
</p>
<p>Thank you very much for&nbsp;the reviews and qemu-devel newbie&nbsp;tips=
 so far. I have&nbsp;felt very welcome.<br>
</p>
<p><br>
</p>
<p>Tony<br>
</p>
<div style=3D"color: rgb(33, 33, 33);"></div>
</body>
</html>

--_000_156518166620126324btcom_--
