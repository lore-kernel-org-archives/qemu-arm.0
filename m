Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6528210wrv;
        Wed, 7 Aug 2019 06:04:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwfqq2tMMaXB4MMd1Rmi6hKNaxZnau9I6AiyVP/XuOOZA0jKQ2m4KbSCFjsKZAbyJWOmYp8
X-Received: by 2002:a17:906:430a:: with SMTP id j10mr8252790ejm.92.1565183057634;
        Wed, 07 Aug 2019 06:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565183057; cv=none;
        d=google.com; s=arc-20160816;
        b=sHCBmirj+nqWlSZT1OKgwH8BRIMJuxAPIf35Frk5AFUNstxAC+rcTwS3vnA5HHr51b
         4Y5TLDFDdquSMhOaNvAnG5dBtclvHO/5kJXd8A3+PmoNeOc8hOEqFEbKhnVLj4/PYBIt
         9YHb/WYnDmZeg7Cyk0vbiF/tb91H99zRknRxGhqXo+pZt7gZRuuYEhUXs3iiGGm66iyz
         Zlm/VFVRjCNxJOW63+bNk/80GgNkOoLKWUJdldRWMxuDsNsv63R8LNFG3yXWqNPJHWZP
         wHZGIykAdcBGIN2yr1mJRZtZ4/4BvbcXVNfTx9te3+NnZUY5uDWLFaatXtbt0ryb7PcS
         07rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=xyy5h6ZAe3LGBZUe4Cj2opc2d1itLkaEUAJNKzj1OFk=;
        b=mTZlynuOLUf8FQ9Vu3IC6cdNeUqb8jiFNc3k06HzKhN7L995W0mtFR8sceUlX2APp5
         Y9HB7ksQ3vYsU0wlcyLsgonEJEwxsHwHtkR3pBpwyCMrOkwU59ZHuKWY+MFQaucikJ3v
         L0VRU9uR/My7rScccuFH8aDCJjT0fasiXXIBgW4RYcce0pfRZM8cFF7ESMQwW8QoxL8Y
         dvMgkoPNA7K0i2atOiHQlP582iEOrLXWbQOso9Posk7UtasGX6iUTiAKgRVLZyRZWPll
         twf3oIg/Uq45cPA2uAUqFQ4qaQbAmQueY/97QhsioHq6FabR7MnVDJAX2sIOWqBYW9DR
         YnNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s27si33451350edb.6.2019.08.07.06.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 06:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:40900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvLc0-0003a8-O9
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 09:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52539)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLbs-0003ZW-98
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 09:04:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLbr-0006UE-6n
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 09:04:08 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.79]:17060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvLbr-0006Tn-1S; Wed, 07 Aug 2019 09:04:07 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 14:03:57 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 14:04:04 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 14:04:04 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 26/26] target/sparc: sun4u Invert Endian
 TTE bit
Thread-Index: AQHVTPt/lR9qsEqZQEWEZcnZpv0Fyabvpuwu
Date: Wed, 7 Aug 2019 13:04:04 +0000
Message-ID: <1565183043809.33207@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>,
 <1565166941186.41868@bt.com>
In-Reply-To: <1565166941186.41868@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156518304380933207btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.79
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 26/26] target/sparc: sun4u
 Invert Endian TTE bit
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
X-TUID: 1hHTgGNRAZNl

--_000_156518304380933207btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry, I missed a tag.?


Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

--_000_156518304380933207btcom_
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
<p>Sorry, I missed a tag.&#8203;<br>
</p>
<p><br>
</p>
<p>Tested-by:&nbsp;<span style=3D"font-variant-ligatures: no-common-ligatur=
es; color: #000000; background-color: #e6e600"></span><span style=3D"font-v=
ariant-ligatures: no-common-ligatures">Mark Cave-Ayland &lt;mark.cave-aylan=
d@ilande.co.uk&gt;</span><br>
</p>
</body>
</html>

--_000_156518304380933207btcom_--
