Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6508803wrv;
        Wed, 7 Aug 2019 05:45:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzx/smYFIykISSruLHjnQsYdJtBgX7Up0Ga7AXp+ypnBypZJUojHNd44tsM5oZU+SFHO60D
X-Received: by 2002:a0c:dd86:: with SMTP id v6mr7916406qvk.176.1565181955458;
        Wed, 07 Aug 2019 05:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565181955; cv=none;
        d=google.com; s=arc-20160816;
        b=PHrwRRx0bnwwoy5vFzUR9znspWCz4EfjXN+bBMSq8236ZyrXjHGPbpxFKU6jSPrpHm
         FST3RP4ekAmnjY+ZHHygniAwX/WM/0h7AIcbAsyPVxnZ0mM9bbILumEXs7RgPgqMSCmt
         jHiHF4ycAZcIzjSeIs4pSV601s9ThGh/JEh5MhDNNtb6KsOkJgEIM7kzWjyKqma2+gPm
         EG8HDHC8Kpx0uyM49KY69kfoNvVOwEZZOvyWbi2B3geh0EWWt2DHQR4nIaF23zD/3L2L
         GSgTVKrp+UT7cXxxUJJd2iPe754ohI+/5pLE3Gg5ubUyFrM3SwWoedXsiCUqHCBFFs48
         gsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=keMJRM8PirZMg6apc2/5h+lrbSQq8NSqvCqRDSGm5zs=;
        b=BGKz1M4pJTUEtTbsnzbbEU7jwwyartq3CPwKExjOZ4xqRrPCNhO+/tDuHYiel16IiB
         UyK8GqAbVgW9pKjgBF6Ja+Dqn7i5x37NNYTY/nUNLZXQ9SMHQ20DOaTeqb8jT9zSqMOm
         wSrjFSxvNkkWb2qBvxofN0cWHwGCXCrJDmBpFdcjCBxW2099Yj75gZajHgJqcI/JJyAZ
         IRoRXC+63rg3cZpP2+7SkKaHFpsm1eMdAaXw78gez7KammQLX5GTGU8pUL7tUyf3nX2L
         kDrWN90vcqPpUCXRm95qgaQlTOvhdEU8MbnE+8nUTLxStPAo9aCF/Y3ebZTOu0CvMYQd
         XKug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20si7119919qtn.300.2019.08.07.05.45.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 05:45:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvLKE-00078o-Uh
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 08:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48066)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLK9-00078R-IV
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 08:45:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLK8-0003fC-Mc
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 08:45:49 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.79]:52893)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvLK8-0003cm-GT; Wed, 07 Aug 2019 08:45:48 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 13:45:38 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 13:45:45 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 13:45:45 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 10/26] cputlb: Access MemoryRegion with
 MemOp
Thread-Index: AQHVTPqCAuIhvjfYMEeF4YwFDl9LJ6bvoa73
Date: Wed, 7 Aug 2019 12:45:45 +0000
Message-ID: <1565181944615.98693@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>,
 <1565166562774.65589@bt.com>
In-Reply-To: <1565166562774.65589@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156518194461598693btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.79
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 10/26] cputlb: Access
 MemoryRegion with MemOp
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
X-TUID: MB9S5FKj5Fl2

--_000_156518194461598693btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry, I missed a tag.


Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

--_000_156518194461598693btcom_
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
<p>Sorry, I&nbsp;missed a tag.<br>
</p>
<p><br>
</p>
<p><span style=3D"font-variant-ligatures: no-common-ligatures"></span><span=
 style=3D"font-variant-ligatures: no-common-ligatures"><span style=3D"font-=
variant-ligatures: no-common-ligatures">Reviewed-by: Philippe Mathieu-Daud=
=E9 &lt;philmd@redhat.com&gt;</span></span><br>
</p>
</body>
</html>

--_000_156518194461598693btcom_--
