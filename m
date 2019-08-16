Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp497723wrs;
        Fri, 16 Aug 2019 01:04:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwmMn4XTQ+THZ9O2KdEkwrp4ss9WPCbIQ9VQ/Std4ePXLlnuhTEiljMFKn0YCDgXIicTl1
X-Received: by 2002:a37:9e81:: with SMTP id h123mr7502563qke.347.1565942653270;
        Fri, 16 Aug 2019 01:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565942653; cv=none;
        d=google.com; s=arc-20160816;
        b=hlC/OBJj++eQjQCGQlZtD9ZoBsIlrMKIU/8Ng2h/6LzwmJgjZJYWA7EKN/9skxrFsZ
         9QpKQ4IMpTqMe0V/jLv6xGBXQaBBl3J1U07SIQ+hRHtYgrCm50pq262BdZ+CXdVSha0b
         FhiqwRNC4B4agFQNt9Ma8rDCc2BRG1o26JYW0PLi4fNHPBuigeLjGUhRyvXzH366S3cX
         2nAOHEvLbKCQt3sy+9Xn/lq+TZ03Dcun5F6yNt2IIosRTBAT5JB8PkA25/WnvhSLBsDg
         DjoXPGJJ04iPtMl7m+4dfFdXvF0Hgilda609PUiz4JQqKLzxq6qLv7evOvL28Tdmxhig
         ExJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=hMB7B2ks3YjAYe5a8FsxKvHF/dnsmOA5lNyX4cwOKQI=;
        b=F0TyMuuWnhSupiVVLPjUFAqigHMjsHHyUNsId7eb0MGsXTwF/7bFE1/s0u4gY1Zlg6
         vuqoC1aK5IMjkh7FopX4aMB/UYve62L6SVfaH6rT2XIqn1Wx0QP4AppFWGajyS6mFDjV
         VSKRLpH/fYj2LxccsZ8Giqw6aCVvUwMp2ZXDetiggwy9zbHbvzEt9MyO4OZuwfKnimVZ
         vqjFmJ+MsJilJsaMvxS81uDfT7b9DoTnyRT6E0CNnLiZD8UZPB0siVhyqEdpowfEjtxn
         biO5242MIwO7MUfene8eFfCJVuO0anlY0HOtdEbTp9LDLqa10FQ8VsZ6RYryRz1lpTyH
         5xwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20si3001382qtk.88.2019.08.16.01.04.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 01:04:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:51217 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyXDY-0003Ei-BA
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 04:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40694)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWnw-0003Jy-LY
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWnv-00034t-0l
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:37:44 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.74]:25481)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWnl-0002y2-5L; Fri, 16 Aug 2019 03:37:33 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926079.bt.com (10.36.82.110) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:37:08 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:37:31 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:37:31 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 34/42] exec: Delete device_endian
Thread-Index: AQHVVAV23bjkeyMUpEO6mGcxTLNfZg==
Date: Fri, 16 Aug 2019 07:37:31 +0000
Message-ID: <1565941050197.81674@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594105019781674btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.74
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 34/42] exec: Delete device_endian
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
X-TUID: tXiXYNVvcnhd

--_000_156594105019781674btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

device_endian has been made redundant by MemOp.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


--_000_156594105019781674btcom_
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
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
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

--_000_156594105019781674btcom_--
