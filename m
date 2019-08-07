Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6513902wrv;
        Wed, 7 Aug 2019 05:51:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxcXF1qgOQarxyASRqtrVJK6IzzHBnwi0JJ15h810+Lml9yePRYAp8Z1RuaaODB8yZCvku
X-Received: by 2002:ac8:2763:: with SMTP id h32mr8209848qth.350.1565182270993;
        Wed, 07 Aug 2019 05:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565182270; cv=none;
        d=google.com; s=arc-20160816;
        b=i73ih6ddY74ad0NI/A6rTV8a/MTqgnWNtEexna+gRxzqu2/HRf/7UjjXq9HRCz/e3u
         s2ZlzsPYA3yJhLyqgOQ6dqgo/v4hOhd/RmybutFlPPKU2FCncDclgyXBFTp8cdwnwEAx
         H/cQcYLfaMXsayPyKfSjcfThDF0AA71g2bN0aqaeazmBq3QpRDrXiQl8fSf+7kK+MPWi
         oUkdWc30gp8cxsGM/3FMtEkHdA+1OTODT6ll3UAWUyX/4iBJFxrARfdzqim6W3AltJpD
         z8BLgEV6kxPo5GC7P+KPo9cwa3rL4zrFElpNZf3WDPljKgKOnVfce2RHxVgstW9JtIZd
         gROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=fxfNTAaokqo8KmtaYawI/qm2rxpVoAqQdlBeZ7O0IOo=;
        b=gLRakqxVH7unriE4IVsgBCbLcXFJf34hZ/i2piNdqLmHFxumRu9ukJaNDaZTUzTEhz
         eVoGuEaTkOwwolE5jj4pZ/vdd0v7wKkW1nMFWNIxtS2Trz0JLZCvyBKaFO9LsrIWeVnt
         hyFNkLhiIvfDfl+dRCNFQ1AMor+Cx25OvO09OoOvgm9gl8jDgBYO2gXkjh/96+e9TsFD
         07aXc1WfpH9fBP1S31ZyhRXscj1baBfRy1J4nI78EiZcu+jK+PDAZkWfeT+cRSKu1BnE
         o+P6fHm6C2BsNmOoWlopqHH7jkSDqVbBWZ/xgzvER3qYp3HeNZCix36KFz0DJjXGT+De
         6f5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 36si53189474qtv.312.2019.08.07.05.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 05:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvLPK-00044h-If
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 08:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49651)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLOh-0002zc-9P
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 08:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLOg-0007Hs-6d
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 08:50:31 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.75]:53205)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvLOg-0007Gi-0R; Wed, 07 Aug 2019 08:50:30 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926080.bt.com (10.36.82.111) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 13:50:15 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 13:50:27 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 13:50:27 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 04/26] target/mips: Access MemoryRegion
 with MemOp
Thread-Index: AQHVTPoNBYhBjLpPjkG1RME0yabwpKbvo0z1
Date: Wed, 7 Aug 2019 12:50:27 +0000
Message-ID: <1565182226992.11938@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>,
 <1565166433653.42084@bt.com>
In-Reply-To: <1565166433653.42084@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156518222699211938btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.75
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 04/26] target/mips: Access
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
X-TUID: dfWC3qcWC6XF

--_000_156518222699211938btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry, I missed a tag.


Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>?


--_000_156518222699211938btcom_
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

--_000_156518222699211938btcom_--
