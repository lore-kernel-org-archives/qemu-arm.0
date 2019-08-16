Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp500026wrs;
        Fri, 16 Aug 2019 01:06:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqws48wY+guO58OLwh79Jgx/l56eqj62T4RE9PRObW8mCs6CwHlNxw5ean4CDKZ7ry6wpPSX
X-Received: by 2002:a17:906:8313:: with SMTP id j19mr8020011ejx.276.1565942804758;
        Fri, 16 Aug 2019 01:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565942804; cv=none;
        d=google.com; s=arc-20160816;
        b=WqgjWeI8nqB4Eoo9hTI3TNmJJNrMLxbYeFaJ25M4xwz/AHATVgIrk/TN3CReJB+70y
         gB/qmThTlDtp2iVYCWmxqhTYhUfQ5DExzqOI2vO0HwB54Q+0R0Nm0pi4M2braxwE4KIO
         QOqcWfNEsFoU6g39WuS4gBXqFdzmD2QwarpLd1bhfDNu4BdMO3tVN6RX39hPIqcrubcm
         kBbB1OZUCaWpFAnXqvZy+32mGM1b6HnRsOKGnAz9FsWUd2zImet0VeuOrgL7/J13M5Kv
         Iww3KyIp8kayVz8P5Jd/TcmxU7dNogXyyR5DF1dZNJBdRaboP8JP0fC946WpJqmkxkws
         SOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=cLYC7VW0lBKh3+br+pP2fRXOSQ4U/KSGms9DEJimpQE=;
        b=XLsDLfNwgot2f+AOyTMoGk7yTuNzX08Lg2//C+HcUZLeclGqEDnYAYZpK+nikIt5CS
         D4bGSc0wpoSO2hWdWYxdbDua31RKXnkyNF5At0SXcE98zFYTMItBdtl5kpvziHDPi5WD
         WRKki3CXa0W932cBsFYsmdCMAesNUFStkknyKoQJ0V0l09uR3UmIsNuFemI2aaHYJWOq
         tubxrEVfTv5zdji7gEmye9rrYQqsYtUETbOPJj0TIeNNRvW7qDPzJ6ELZjynQvQzuPCh
         yETRs7uLdcBwynhoABVu7RyCTBHxWFDvawh2W+kaYuNBWPL8GebSe2Y9NQMxC73RCVfa
         MNtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si2989166edc.2.2019.08.16.01.06.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 01:06:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyXFz-0006RG-Kc
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 04:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWoF-0003jp-It
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:38:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWoC-0003JO-Uv
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:38:03 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.73]:29778)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWo0-00036w-SN; Fri, 16 Aug 2019 03:37:49 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926078.bt.com (10.36.82.109) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:37:07 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:37:47 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:37:47 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 35/42] exec: Delete DEVICE_HOST_ENDIAN
Thread-Index: AQHVVAV/22SpmDs0VU2aZZpQIyY/gw==
Date: Fri, 16 Aug 2019 07:37:46 +0000
Message-ID: <1565941066081.69203@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594106608169203btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.73
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 35/42] exec: Delete
 DEVICE_HOST_ENDIAN
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
X-TUID: 7F4z0nTfdCuv

--_000_156594106608169203btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

DEVICE_HOST_ENDIAN is conditional upon HOST_WORDS_BIGENDIAN.

Code is cleaner if the single use of DEVICE_HOST_ENDIAN is instead
directly conditional upon HOST_WORDS_BIGENDIAN.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/cpu-common.h | 8 --------
 memory.c                  | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 7eeb78c..b33dc0c 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -16,14 +16,6 @@ void tcg_flush_softmmu_tlb(CPUState *cs);

 #if !defined(CONFIG_USER_ONLY)

-#include "exec/memop.h"
-
-#if defined(HOST_WORDS_BIGENDIAN)
-#define DEVICE_HOST_ENDIAN MO_BE
-#else
-#define DEVICE_HOST_ENDIAN MO_LE
-#endif
-
 /* address in the RAM (different from a physical address) */
 #if defined(CONFIG_XEN_BACKEND)
 typedef uint64_t ram_addr_t;
diff --git a/memory.c b/memory.c
index 3cabb52..689390f 100644
--- a/memory.c
+++ b/memory.c
@@ -1362,7 +1362,7 @@ static void memory_region_ram_device_write(void *opaq=
ue, hwaddr addr,
 static const MemoryRegionOps ram_device_mem_ops =3D {
     .read =3D memory_region_ram_device_read,
     .write =3D memory_region_ram_device_write,
-    .endianness =3D DEVICE_HOST_ENDIAN,
+    .endianness =3D 0, /* Host endianness */
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
--
1.8.3.1

?


--_000_156594106608169203btcom_
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
<div><span style=3D"font-size: 10pt;">DEVICE_HOST_ENDIAN is conditional upo=
n HOST_WORDS_BIGENDIAN.</span><br>
</div>
<div><br>
</div>
<div>Code is cleaner if the single use of DEVICE_HOST_ENDIAN is instead</di=
v>
<div>directly conditional upon HOST_WORDS_BIGENDIAN.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;include/exec/cpu-common.h | 8 --------</div>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| 2 &#43;-</div>
<div>&nbsp;2 files changed, 1 insertion(&#43;), 9 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h</di=
v>
<div>index 7eeb78c..b33dc0c 100644</div>
<div>--- a/include/exec/cpu-common.h</div>
<div>&#43;&#43;&#43; b/include/exec/cpu-common.h</div>
<div>@@ -16,14 &#43;16,6 @@ void tcg_flush_softmmu_tlb(CPUState *cs);</div>
<div>&nbsp;</div>
<div>&nbsp;#if !defined(CONFIG_USER_ONLY)</div>
<div>&nbsp;</div>
<div>-#include &quot;exec/memop.h&quot;</div>
<div>-</div>
<div>-#if defined(HOST_WORDS_BIGENDIAN)</div>
<div>-#define DEVICE_HOST_ENDIAN MO_BE</div>
<div>-#else</div>
<div>-#define DEVICE_HOST_ENDIAN MO_LE</div>
<div>-#endif</div>
<div>-</div>
<div>&nbsp;/* address in the RAM (different from a physical address) */</di=
v>
<div>&nbsp;#if defined(CONFIG_XEN_BACKEND)</div>
<div>&nbsp;typedef uint64_t ram_addr_t;</div>
<div>diff --git a/memory.c b/memory.c</div>
<div>index 3cabb52..689390f 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -1362,7 &#43;1362,7 @@ static void memory_region_ram_device_write(v=
oid *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps ram_device_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D memory_region_ram_device_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D memory_region_ram_device_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_HOST_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D 0, /* Host endianness */</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
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

--_000_156594106608169203btcom_--
