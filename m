Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6251080wrv;
        Wed, 7 Aug 2019 01:29:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMDG6Rtv2G8jUPLS3f8dVcFRaI5W5qsgJBn5cxqC0fIXZ/+f+4j/9bQgCAkNx1ZvXKWVnc
X-Received: by 2002:aed:3ed8:: with SMTP id o24mr6694067qtf.252.1565166598441;
        Wed, 07 Aug 2019 01:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565166598; cv=none;
        d=google.com; s=arc-20160816;
        b=Me6V1a4ZfXZq2wgNwKzuIUghFmXiywSXG5Gf4NxOai+dPslEESLLeVNSd2OpS7aIy1
         xyvcoewpPNAwp0ARYMOYymIk1a5OUbqDmUL/aP3ltmBRKSTp0QHN6eVJ49PJsRGgRWqu
         U4YR1sNPjaNb52Lc8p3C+c+C51Np67CnqyeSTPfQCzYBUavobKw8B+1L0KFxbW5sfyXG
         K1N/A2vP1850cpAw3qNucamCC257qr0MuibQyF2NyDUV6F/i++tbHXLwC6KnyZnuohLl
         jGnQMdLAfQF1YR6AIM1iqGRF0XoA2B+Tpr0vOjPn9+/ulfA1eUWl4ca5R4i0bii/lfBR
         o1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=iU+Ib4eEBlnRCi4533TXGftA0Aq+o7HaI6Iz4fTmsG8=;
        b=E8S5Ec8l+eGzleIUE9gZHtIUwVX7+P8colyuWQIGixj6pgFlMHNyTDFZPMOZRPx6Yc
         fFQFli/nmR0X5/eNuyAKN1OUpe5JKaJNCiY5Fk51O2trT2ZoQrL1GQ5FjVY1pu4E+Hau
         hJ0C6vPK7+9EqMg8wPqj0l2GHaNqArU4WmxsmX8z8jM7P7GJt7gy5YpOJM1iSmXQ9/ct
         IQ7cToY83Kd5S4k+l57RUXT4j3Ze0GNGQszerldMcwU0fdZ0qV7PJDHoU/akBQR+p8fl
         k8dpnU5U/Xvsye3KN7L2sR3m0z6xyT1ujCW5pqhm9QmMG0yEyhjhl/dH6VzmcJYcYKiX
         YPMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20si15084963qtb.397.2019.08.07.01.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 01:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:38340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvHKY-0003FP-0h
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 04:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44113)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHKB-00037f-SD
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:29:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHK9-0000tg-UT
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:29:35 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.72]:35110)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvHK4-0000nu-24; Wed, 07 Aug 2019 04:29:29 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926077.bt.com (10.36.82.108) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:29:02 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:29:23 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:29:23 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 10/26] cputlb: Access MemoryRegion with
 MemOp
Thread-Index: AQHVTPo3/fbgDfmaOEuIplRQ5wIAjA==
Date: Wed, 7 Aug 2019 08:29:23 +0000
Message-ID: <1565166562774.65589@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156516656277465589btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.72
Subject: [Qemu-arm] [Qemu-devel] [PATCH v6 10/26] cputlb: Access
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
X-TUID: g3Y7xhodbemN

--_000_156516656277465589btcom_
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
---
 accel/tcg/cputlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 523be4c..6c83878 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -906,8 +906,8 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEnt=
ry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_read(mr, mr_offset,
-                                    &val, size, iotlbentry->attrs);
+    r =3D memory_region_dispatch_read(mr, mr_offset, &val, size_memop(size=
),
+                                    iotlbentry->attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
             section->offset_within_address_space -
@@ -947,8 +947,8 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry =
*iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_write(mr, mr_offset,
-                                     val, size, iotlbentry->attrs);
+    r =3D memory_region_dispatch_write(mr, mr_offset, val, size_memop(size=
),
+                                     iotlbentry->attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
             section->offset_within_address_space -
--
1.8.3.1

?


--_000_156516656277465589btcom_
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
<div><span style=3D"font-size: 10pt;">The memory_region_dispatch_{read|writ=
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
<div>---</div>
<div>&nbsp;accel/tcg/cputlb.c | 8 &#43;&#43;&#43;&#43;----</div>
<div>&nbsp;1 file changed, 4 insertions(&#43;), 4 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index 523be4c..6c83878 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -906,8 &#43;906,8 @@ static uint64_t io_readx(CPUArchState *env, CP=
UIOTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_lock_iothread();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;locked =3D true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, mr_offset,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;val, size, io=
tlbentry-&gt;attrs);</div>
<div>&#43; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, mr_offset, &a=
mp;val, size_memop(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iotlbentry-&gt=
;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (r !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr physaddr =3D mr_offset &#43;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_address_space -</div>
<div>@@ -947,8 &#43;947,8 @@ static void io_writex(CPUArchState *env, CPUIO=
TLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_lock_iothread();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;locked =3D true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, mr_offset,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; val, size, iotlbe=
ntry-&gt;attrs);</div>
<div>&#43; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, mr_offset, v=
al, size_memop(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iotlbentry-&g=
t;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (r !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr physaddr =3D mr_offset &#43;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_address_space -</div>
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

--_000_156516656277465589btcom_--
