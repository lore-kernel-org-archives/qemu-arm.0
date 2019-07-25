Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10321665wrv;
        Thu, 25 Jul 2019 01:03:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzn5LbbLucxx/2wKCvh8oyzjyjMM1kwavuuSEkvJ4vrpdIrEO/ZLuVhRr2ugqdnlmbq5LU1
X-Received: by 2002:a17:906:8603:: with SMTP id o3mr65334478ejx.162.1564041801678;
        Thu, 25 Jul 2019 01:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564041801; cv=none;
        d=google.com; s=arc-20160816;
        b=HfL0ViODfLRuG1LbJAwUDY3iC5xRG9a0zn9GSA6sPZ/1Upmm0h5Og8MjaFwJWE4u9t
         K+apjlVaufGXd3dnRyrBOcZGO83xjdwWEFI4qOpfjcn9r6VSMom8AFaDUI6f1Lrj6jpG
         XNcm4iM+1Otrv1j35IlYi5UT9qwBKkpeM6k1/ZE5JDcitBT+IytQ/rzabiHM5y1baz9Q
         5AUXDDDRZEDrkyg2HUxIjY//J3/RFPeyFTxuVnD9bsC2RfMnGZiaOlHY7K1cL+OvyQKW
         BOgcLxtonCWooiXvTp8za/YBD2j7BPZOBLReMqCe+JrOm0xWmv97+ec0O7ZNTFGccRLS
         8Vlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=K6ecUnzx2K/lYmSHvb6S2CoikhXUh7eSa60Bi8a/WDk=;
        b=0rAzy7ZT0cBtNjY7LpnbwY1lNK5DPkSykjBj9ksCJ8M94gJV0jbL11HC8oXmTBRYhl
         vi5gmnCwB8p6XaJZzC+8v/uZbPtmbEeNcB0DZn4qV6OfLQ1/BrxMs2J7qzYIH+RxAjNl
         2i/jxe3GXdg0r0Zpn4zhFqhPGNE7F+VZmmgBddjgnjigybXr8azMoMTjdx3QZdvcebWv
         w+NouXgwq6ZCi7v3+LHyz5KTj2AR7h3kCL272WN1peGluOvRgVa7yhT+5yJ/cEG3NXlz
         /Io6DCzlGd7rc0DE/NukPSLuN1/IOFMxHw7AwTN5reULyqYCO2bZ+OSdi0bULiBFW8tD
         gSUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m34si10394978edm.5.2019.07.25.01.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 01:03:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:56758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqYie-0001eD-MM
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 04:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37430)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqYiO-0000us-Jl
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 04:03:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqYiI-0002XN-Li
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 04:03:00 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.79]:43323)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqYiB-0002US-Tr; Thu, 25 Jul 2019 04:02:52 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 09:02:48 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 09:02:50 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 09:02:50 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v4 06/15] hw/virtio: Access MemoryRegion
 with MemOp
Thread-Index: AQHVQr9aWjsGVtoI+0+ukPHrC9AMQg==
Date: Thu, 25 Jul 2019 08:02:50 +0000
Message-ID: <1564041770084.57820@bt.com>
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
Content-Type: multipart/alternative; boundary="_000_156404177008457820btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.79
Subject: [Qemu-arm] [Qemu-devel] [PATCH v4 06/15] hw/virtio: Access
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
X-TUID: OI0eSFr4JRw1

--_000_156404177008457820btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/virtio/virtio-pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index ce928f2..265f066 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -17,6 +17,7 @@

 #include "qemu/osdep.h"

+#include "exec/memop.h"
 #include "standard-headers/linux/virtio_pci.h"
 #include "hw/virtio/virtio.h"
 #include "hw/pci/pci.h"
@@ -550,7 +551,8 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, =
hwaddr addr,
         /* As length is under guest control, handle illegal values. */
         return;
     }
-    memory_region_dispatch_write(mr, addr, val, len, MEMTXATTRS_UNSPECIFIE=
D);
+    memory_region_dispatch_write(mr, addr, val, SIZE_MEMOP(len),
+                                 MEMTXATTRS_UNSPECIFIED);
 }

 static void
@@ -573,7 +575,8 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwaddr=
 addr,
     /* Make sure caller aligned buf properly */
     assert(!(((uintptr_t)buf) & (len - 1)));

-    memory_region_dispatch_read(mr, addr, &val, len, MEMTXATTRS_UNSPECIFIE=
D);
+    memory_region_dispatch_read(mr, addr, &val, SIZE_MEMOP(len),
+                                MEMTXATTRS_UNSPECIFIED);
     switch (len) {
     case 1:
         pci_set_byte(buf, val);
--
1.8.3.1




--_000_156404177008457820btcom_
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
<div>&nbsp;hw/virtio/virtio-pci.c | 7 &#43;&#43;&#43;&#43;&#43;--</div>
<div>&nbsp;1 file changed, 5 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c</div>
<div>index ce928f2..265f066 100644</div>
<div>--- a/hw/virtio/virtio-pci.c</div>
<div>&#43;&#43;&#43; b/hw/virtio/virtio-pci.c</div>
<div>@@ -17,6 &#43;17,7 @@</div>
<div>&nbsp;</div>
<div>&nbsp;#include &quot;qemu/osdep.h&quot;</div>
<div>&nbsp;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;standard-headers/linux/virtio_pci.h&quot;</div>
<div>&nbsp;#include &quot;hw/virtio/virtio.h&quot;</div>
<div>&nbsp;#include &quot;hw/pci/pci.h&quot;</div>
<div>@@ -550,7 &#43;551,8 @@ void virtio_address_space_write(VirtIOPCIProxy=
 *proxy, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* As length is under guest control,=
 handle illegal values. */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, len, MEMTXA=
TTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, SIZE_ME=
MOP(len),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MEMTXATTRS_UNSPECIFIED);</d=
iv>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void</div>
<div>@@ -573,7 &#43;575,8 @@ virtio_address_space_read(VirtIOPCIProxy *prox=
y, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;/* Make sure caller aligned buf properly */</div>
<div>&nbsp; &nbsp; &nbsp;assert(!(((uintptr_t)buf) &amp; (len - 1)));</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;memory_region_dispatch_read(mr, addr, &amp;val, len, ME=
MTXATTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp;memory_region_dispatch_read(mr, addr, &amp;val, SIZ=
E_MEMOP(len),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</di=
v>
<div>&nbsp; &nbsp; &nbsp;switch (len) {</div>
<div>&nbsp; &nbsp; &nbsp;case 1:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pci_set_byte(buf, val);</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156404177008457820btcom_--
