Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10320220wrv;
        Thu, 25 Jul 2019 01:02:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVzpXMJFMO6nLwNw7z0hc6KTDIgaYJIelOe9j5sx/9NlUGWbJtntjTiYpgSi15qvYQ3rlT
X-Received: by 2002:ac8:252e:: with SMTP id 43mr60814725qtm.61.1564041726813;
        Thu, 25 Jul 2019 01:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564041726; cv=none;
        d=google.com; s=arc-20160816;
        b=jTTOaWLL4egJ2+p0rePFKoPV4UAybLY74UNduT12D8CSeZTJWSF8XJ9n3HH0LoAnL6
         D7F3fessTo5rKslze6E1rB/jdo61zK/REIUOdy3O0EvaNIEalO7cVHyH5iKPgu8zfJE8
         ET/1kBaDRFiso4dui6U1cgDUv4YpJhoD4Z95fy8/dIAAp4RlvuqjaXo5Tk7DgsC2urli
         dsATVZ9XnPXdvNprD5a5JvAj5SaoKTM3LK/ceDmBnuxS0IvNQU1X07/x4Xx4sV5kGIv9
         Nj9KoNUJ6BG4ORe7mnZJ/gKTrbqxlzHFlUXRp0m8fmi//istohv4DrqjwwLw4vncH0wA
         k7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=vXcigFAcDDCZxHb/Eojqk3zxjmUuI0LALFwMi9wCSnQ=;
        b=qP7dm5nb9WtERDyn9X0wEZRzqG8W0s+eDEvfqBfNJSU+aaV51whrXVNOXZ055SogCo
         6sBhvZkkLifHPs0146bnET30CoYhyqoj3VjAWGi/hYBTnKhyReCWH5fUv3rK7fgC0CFx
         Nt4cIpTwCGLpsZqr7WXrgykB7KfSCbGClOaH6W0D0DZQQ2xvEb9hvOSuQtp4m04uM3Ts
         Ag/1x/hMWsQk0zgdQRvHK4Zf2wjPtkDkea7ECK70oUdzFvzthBJrk8r9fcgRhNPHpSWL
         QmbEd5vQCwQpG2RP+nuW8dnaS+Ma5MEEdOshkVpaB1x9S5qAdwBf++lj99Jm3YjZNlR+
         VOFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8si28362761qkm.147.2019.07.25.01.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 01:02:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqYhS-0006PC-6p
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 04:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37061)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqYhO-0006Mw-0X
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 04:02:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqYhM-00029Q-L1
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 04:02:01 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.73]:28612)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqYhF-00025t-AY; Thu, 25 Jul 2019 04:01:53 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926078.bt.com (10.36.82.109) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 09:01:48 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 09:01:51 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 09:01:51 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v4 04/15] hw/s390x: Access MemoryRegion with
 MemOp
Thread-Index: AQHVQr836exqWWmOP0ypESrXknrVFA==
Date: Thu, 25 Jul 2019 08:01:51 +0000
Message-ID: <1564041710744.75150@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>, 
 <1563810716254.18886@bt.com>, <1564038073754.91133@bt.com>,
 <1564041524365.23360@bt.com>
In-Reply-To: <1564041524365.23360@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156404171074475150btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.73
Subject: [Qemu-arm] [Qemu-devel] [PATCH v4 04/15] hw/s390x: Access
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, mst@redhat.com,
 palmer@sifive.com, mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, sw@weilnetz.de, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, alex.williamson@redhat.com, qemu-ppc@nongnu.org,
 amarkovic@wavecomp.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AyqWiQAniO+y

--_000_156404171074475150btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/s390x/s390-pci-inst.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 0023514..c126bcc 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -15,6 +15,7 @@
 #include "cpu.h"
 #include "s390-pci-inst.h"
 #include "s390-pci-bus.h"
+#include "exec/memop.h"
 #include "exec/memory-internal.h"
 #include "qemu/error-report.h"
 #include "sysemu/hw_accel.h"
@@ -372,7 +373,7 @@ static MemTxResult zpci_read_bar(S390PCIBusDevice *pbde=
v, uint8_t pcias,
     mr =3D pbdev->pdev->io_regions[pcias].memory;
     mr =3D s390_get_subregion(mr, offset, len);
     offset -=3D mr->addr;
-    return memory_region_dispatch_read(mr, offset, data, len,
+    return memory_region_dispatch_read(mr, offset, data, SIZE_MEMOP(len),
                                        MEMTXATTRS_UNSPECIFIED);
 }

@@ -471,7 +472,7 @@ static MemTxResult zpci_write_bar(S390PCIBusDevice *pbd=
ev, uint8_t pcias,
     mr =3D pbdev->pdev->io_regions[pcias].memory;
     mr =3D s390_get_subregion(mr, offset, len);
     offset -=3D mr->addr;
-    return memory_region_dispatch_write(mr, offset, data, len,
+    return memory_region_dispatch_write(mr, offset, data, SIZE_MEMOP(len),
                                         MEMTXATTRS_UNSPECIFIED);
 }

@@ -780,7 +781,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8=
_t r3, uint64_t gaddr,

     for (i =3D 0; i < len / 8; i++) {
         result =3D memory_region_dispatch_write(mr, offset + i * 8,
-                                              ldq_p(buffer + i * 8), 8,
+                                              ldq_p(buffer + i * 8),
+                                              SIZE_MEMOP(8),
                                               MEMTXATTRS_UNSPECIFIED);
         if (result !=3D MEMTX_OK) {
             s390_program_interrupt(env, PGM_OPERAND, 6, ra);
--
1.8.3.1




--_000_156404171074475150btcom_
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
<div><span style=3D"font-size: 12pt;">Signed-off-by: Tony Nguyen &lt;tony.n=
guyen@bt.com&gt;</span><br>
</div>
<div>---</div>
<div>&nbsp;hw/s390x/s390-pci-inst.c | 8 &#43;&#43;&#43;&#43;&#43;---</div>
<div>&nbsp;1 file changed, 5 insertions(&#43;), 3 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c</div>
<div>index 0023514..c126bcc 100644</div>
<div>--- a/hw/s390x/s390-pci-inst.c</div>
<div>&#43;&#43;&#43; b/hw/s390x/s390-pci-inst.c</div>
<div>@@ -15,6 &#43;15,7 @@</div>
<div>&nbsp;#include &quot;cpu.h&quot;</div>
<div>&nbsp;#include &quot;s390-pci-inst.h&quot;</div>
<div>&nbsp;#include &quot;s390-pci-bus.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;exec/memory-internal.h&quot;</div>
<div>&nbsp;#include &quot;qemu/error-report.h&quot;</div>
<div>&nbsp;#include &quot;sysemu/hw_accel.h&quot;</div>
<div>@@ -372,7 &#43;373,7 @@ static MemTxResult zpci_read_bar(S390PCIBusDev=
ice *pbdev, uint8_t pcias,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D pbdev-&gt;pdev-&gt;io_regions[pcias].memory=
;</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D s390_get_subregion(mr, offset, len);</div>
<div>&nbsp; &nbsp; &nbsp;offset -=3D mr-&gt;addr;</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_read(mr, offset, data, le=
n,</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_read(mr, offset, data=
, SIZE_MEMOP(len),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MEMTX=
ATTRS_UNSPECIFIED);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -471,7 &#43;472,7 @@ static MemTxResult zpci_write_bar(S390PCIBusDe=
vice *pbdev, uint8_t pcias,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D pbdev-&gt;pdev-&gt;io_regions[pcias].memory=
;</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D s390_get_subregion(mr, offset, len);</div>
<div>&nbsp; &nbsp; &nbsp;offset -=3D mr-&gt;addr;</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_write(mr, offset, data, l=
en,</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_write(mr, offset, dat=
a, SIZE_MEMOP(len),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -780,7 &#43;781,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t =
r1, uint8_t r3, uint64_t gaddr,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; len / 8; i&#43;&#43;) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result =3D memory_region_dispatch_wr=
ite(mr, offset &#43; i * 8,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;ldq_p(buffer &#43; i * 8), 8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;ldq_p(buffer &#43; i * 8),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;SIZE_MEMOP(8),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (result !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s390_program_interrupt=
(env, PGM_OPERAND, 6, ra);</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156404171074475150btcom_--
