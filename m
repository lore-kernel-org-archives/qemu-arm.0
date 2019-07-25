Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10423596wrv;
        Thu, 25 Jul 2019 02:54:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9XveGHcXr1NbTvYddexs6pwU2M1lrt8ftQBWRiQtLUzy28KvUWQLcw2s3JeB2Uswa2hmN
X-Received: by 2002:ac8:c0e:: with SMTP id k14mr61047952qti.72.1564048499830;
        Thu, 25 Jul 2019 02:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564048499; cv=none;
        d=google.com; s=arc-20160816;
        b=mkfZ7pa0pZMEQYqTHKBYah1xPEeZTgJJhkOJl4LiHbwtuf1Cm+FQQb1zYTvPutZezy
         IrWK9A8fWKEccH5RAdYogQ6w/1Zmk4+0TL9z+CkOJWJkKaIYwHVbHMot7r3VkDzxI7OS
         8FULJwn2gUyBrWhjHKx3glmy5fTWos7q0qtmJ1syd4v7NAUJFAkt6z3kg0yEyEUX3Mhk
         uaI4Ri258JsYDSkTSEA3Y7z43zXGdcRs/pSy56WLDYyeh8mly8f0C/k0AOW+MGx6HG3j
         ZhjQFGlksLcd20lX4kXIQF9u7hKXjvta/0X4Ppwt1NtXEW8UBBvFNAqcRFfzn8j+EtgM
         auEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=u2v4RO13qrT2IVr3x2lqPmDLSE4zrv5t+zI3fnwHGag=;
        b=YH0bYkpYlKQcBSD0vj8OiDGczWDBjh0ss5P6MBUS/7hMgTKDmdR+yWxEgom0OaZ2Zq
         1LBrMbzrUJB9Ay+dplZ6JCq3axndKp0xZpYFDdvV3HHtBVFvN+JymuzwP08ubZZXZgwg
         mDw4vUfj+KjGtjhmE/vxh4rElCU1q2ZMV7BgRbt+6hEDYdSeBBCMWyOxhWzJKtXEL7H9
         uEFboymSJ64rvxeRYhaWge7YAEEatv7TkbR4m+HDGIWBV8FKZNbE9alzARSrYqJpHe7X
         CBofnyzla2IhfIWIqQYDcKYeZl0WHsbFtQohnlCNUSHajwJjYEGRsxqmoDrvLF/HS0QB
         CNlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y77si30231618qkb.124.2019.07.25.02.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 02:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqaSh-0003o8-3D
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 05:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45183)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaSc-0003ck-5g
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 05:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaSZ-0000oi-6U
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 05:54:54 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.80]:27373)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqaSR-0000l0-Dr; Thu, 25 Jul 2019 05:54:43 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926085.bt.com (10.36.82.116) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 10:54:39 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 10:54:40 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 10:54:40 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v4 07/15] hw/vfio: Access MemoryRegion with
 MemOp
Thread-Index: AQHVQs76iiBWTBabRU6U6h3bqlqytQ==
Date: Thu, 25 Jul 2019 09:54:40 +0000
Message-ID: <1564048480457.19093@bt.com>
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156404848045719093btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.80
Subject: [Qemu-arm] [Qemu-devel] [PATCH v4 07/15] hw/vfio: Access
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 david@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, Alistair.Francis@wdc.com, arikalo@wavecomp.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VtUnwplsUXQ8

--_000_156404848045719093btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/vfio/pci-quirks.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index b35a640..3240afa 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1071,7 +1071,7 @@ static void vfio_rtl8168_quirk_address_write(void *op=
aque, hwaddr addr,

                 /* Write to the proper guest MSI-X table instead */
                 memory_region_dispatch_write(&vdev->pdev.msix_table_mmio,
-                                             offset, val, size,
+                                             offset, val, SIZE_MEMOP(size)=
,
                                              MEMTXATTRS_UNSPECIFIED);
             }
             return; /* Do not write guest MSI-X data to hardware */
@@ -1102,7 +1102,8 @@ static uint64_t vfio_rtl8168_quirk_data_read(void *op=
aque,
     if (rtl->enabled && (vdev->pdev.cap_present & QEMU_PCI_CAP_MSIX)) {
         hwaddr offset =3D rtl->addr & 0xfff;
         memory_region_dispatch_read(&vdev->pdev.msix_table_mmio, offset,
-                                    &data, size, MEMTXATTRS_UNSPECIFIED);
+                                    &data, SIZE_MEMOP(size),
+                                    MEMTXATTRS_UNSPECIFIED);
         trace_vfio_quirk_rtl8168_msix_read(vdev->vbasedev.name, offset, da=
ta);
     }

--
1.8.3.1




--_000_156404848045719093btcom_
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
<div>&nbsp;hw/vfio/pci-quirks.c | 5 &#43;&#43;&#43;--</div>
<div>&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c</div>
<div>index b35a640..3240afa 100644</div>
<div>--- a/hw/vfio/pci-quirks.c</div>
<div>&#43;&#43;&#43; b/hw/vfio/pci-quirks.c</div>
<div>@@ -1071,7 &#43;1071,7 @@ static void vfio_rtl8168_quirk_address_write=
(void *opaque, hwaddr addr,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Write=
 to the proper guest MSI-X table instead */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_r=
egion_dispatch_write(&amp;vdev-&gt;pdev.msix_table_mmio,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; offset, val, size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; offset, val, SIZE_MEMOP(size),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return; /* Do not writ=
e guest MSI-X data to hardware */</div>
<div>@@ -1102,7 &#43;1102,8 @@ static uint64_t vfio_rtl8168_quirk_data_read=
(void *opaque,</div>
<div>&nbsp; &nbsp; &nbsp;if (rtl-&gt;enabled &amp;&amp; (vdev-&gt;pdev.cap_=
present &amp; QEMU_PCI_CAP_MSIX)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr offset =3D rtl-&gt;addr &amp;=
 0xfff;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_read(&amp;vde=
v-&gt;pdev.msix_table_mmio, offset,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;data, size, M=
EMTXATTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;data, SIZ=
E_MEMOP(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNS=
PECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;trace_vfio_quirk_rtl8168_msix_read(v=
dev-&gt;vbasedev.name, offset, data);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156404848045719093btcom_--
