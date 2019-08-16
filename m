Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp473495wrs;
        Fri, 16 Aug 2019 00:30:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDuHlyPb3CZV+zHEPgY0JSi6AmzuVKIx8vUFAGiqSb+Xf2cgUvzHwwbf7laVXbarjo4pQk
X-Received: by 2002:ac8:c86:: with SMTP id n6mr7284851qti.345.1565940630413;
        Fri, 16 Aug 2019 00:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565940630; cv=none;
        d=google.com; s=arc-20160816;
        b=Mre24v6SaVxXX2Vj/Y4b+MwgrgRSfZi7JsZlqygAWMJgVWgqBNRcBp1RPYz+vIGQdT
         bkIthnEbyaQH3mPtXJKQ2VoFuF9wfiip074jsOCr8+1oQSij95/JXSfg6V/GBDVWL4qQ
         lFuAcl6Ph9pTKnFNAkH2I/5w5RIczXJofU5Yibb/+vZ+sNKNggZuDO+NYO3y93EE1XAB
         2slJR7ym537p9LAbQv571F9ZU2c3ljr8Oare97SClv8BvZ4SgvgIBzJLk2U7gUmcy99u
         xDZF4+EXztS9y52cvSDI4bvVD6qxmJLFo6w/FASFR4PAayf8SL6YTbfvWqArUVpND6Pu
         zwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=RtX+uCDKTw4zSy8wDlG7kyMY65iT/Qdd4bwO6m1oZKQ=;
        b=WeEUcFkXabwf77onpFbmMR1fhQWUo+ZB8Pf+5wjCQ3cjVTv6pwjd/bJrvOhLo0wV86
         M0msT3OFgElvSwAs/RPOMhvB7w8PuJXxEqUQHgARlonvmD2KYWS33NyWGTKhU4Ss7MXU
         wI/Z6pVNqc5sRCL5I49jA1NtYHJagu5WagcpUASdh2W//ZY4qBmxilzk2W9+uzGUaZjV
         /xadT+89m9CEnQftB6ru/5fvIrNL4hIq4nVJ0fGDYq7HmTec5yo3V0JVD7fsUJsGZTkG
         01pfbNPX//fKRqrKzrijrhPY/D/Hu5p9rab+9zyfFBtPHTTNKIi7JyBBMingsMGpLjPn
         9Yww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si3111571qtc.1.2019.08.16.00.30.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 00:30:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:50192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyWgv-00047n-EG
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 03:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37244)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWej-0001Fh-Pz
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:28:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWeh-0006lo-5o
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:28:13 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.237]:58447)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWeg-0006lW-OO; Fri, 16 Aug 2019 03:28:11 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 RDW083A010ED66.bt.com (10.187.98.36) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:27:12 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:28:07 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:28:07 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 05/42] hw/s390x: Access MemoryRegion with
 MemOp
Thread-Index: AQHVVAQm4YOYr/5qT0mFs0jMdf+W7Q==
Date: Fri, 16 Aug 2019 07:28:07 +0000
Message-ID: <1565940486725.11895@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594048672511895btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.237
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 05/42] hw/s390x: Access
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
X-TUID: zSXYYoynNpaL

--_000_156594048672511895btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The memory_region_dispatch_{read|write} operand "unsigned size" is
being converted into a "MemOp op".

Convert interfaces by using no-op size_memop.

After all interfaces are converted, size_memop will be implemented
and the memory_region_dispatch_{read|write} operand "unsigned size"
will be converted into a "MemOp op".

As size_memop is a no-op, this patch does not change any behaviour.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-pci-inst.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 0023514..0c958fc 100644
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
+    return memory_region_dispatch_read(mr, offset, data, size_memop(len),
                                        MEMTXATTRS_UNSPECIFIED);
 }

@@ -471,7 +472,7 @@ static MemTxResult zpci_write_bar(S390PCIBusDevice *pbd=
ev, uint8_t pcias,
     mr =3D pbdev->pdev->io_regions[pcias].memory;
     mr =3D s390_get_subregion(mr, offset, len);
     offset -=3D mr->addr;
-    return memory_region_dispatch_write(mr, offset, data, len,
+    return memory_region_dispatch_write(mr, offset, data, size_memop(len),
                                         MEMTXATTRS_UNSPECIFIED);
 }

@@ -780,7 +781,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8=
_t r3, uint64_t gaddr,

     for (i =3D 0; i < len / 8; i++) {
         result =3D memory_region_dispatch_write(mr, offset + i * 8,
-                                              ldq_p(buffer + i * 8), 8,
+                                              ldq_p(buffer + i * 8),
+                                              size_memop(8),
                                               MEMTXATTRS_UNSPECIFIED);
         if (result !=3D MEMTX_OK) {
             s390_program_interrupt(env, PGM_OPERAND, 6, ra);
--
1.8.3.1

?


--_000_156594048672511895btcom_
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
<div><span style=3D"font-size: 12pt;">The memory_region_dispatch_{read|writ=
e} operand &quot;unsigned size&quot; is</span><br>
</div>
<div>being converted into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>Convert interfaces by using no-op size_memop.</div>
<div><br>
</div>
<div>After all interfaces are converted, size_memop will be implemented</di=
v>
<div>and the memory_region_dispatch_{read|write} operand &quot;unsigned siz=
e&quot;</div>
<div>will be converted into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>As size_memop is a no-op, this patch does not change any behaviour.</d=
iv>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>Reviewed-by: Cornelia Huck &lt;cohuck@redhat.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/s390x/s390-pci-inst.c | 8 &#43;&#43;&#43;&#43;&#43;---</div>
<div>&nbsp;1 file changed, 5 insertions(&#43;), 3 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c</div>
<div>index 0023514..0c958fc 100644</div>
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
, size_memop(len),</div>
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
a, size_memop(len),</div>
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
 &nbsp; &nbsp; &nbsp;size_memop(8),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (result !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s390_program_interrupt=
(env, PGM_OPERAND, 6, ra);</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594048672511895btcom_--
