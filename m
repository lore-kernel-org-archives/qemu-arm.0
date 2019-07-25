Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10274461wrv;
        Thu, 25 Jul 2019 00:10:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyySh9ArUPY42n39b6FCm3EUpW2zEZ2ygTXogCzCckuoLEHV1HKj+RO2VR4lzal7NQFGk6J
X-Received: by 2002:a50:9947:: with SMTP id l7mr76252603edb.305.1564038602023;
        Thu, 25 Jul 2019 00:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564038602; cv=none;
        d=google.com; s=arc-20160816;
        b=V+cREoueYru0W9zn4/fVI4zWDHRz3wnj/uinzfAEr5jLPSUQbDU2XI9FaHhoypT1rb
         1Lmjc9o5ilviK32/JF3458N88C8MGvJQuaDKyyiu4QEiAfqnA5IhuTvUyfsSsDgMUFPQ
         T+FID1wOFq0gVTmGyzQulTWbVt3z1pQixKSuyVsrVKFRXfXTcec5LrFVc385F0BjTjy5
         gxyFp+zg3VL7hysxS/Nxt0zZRgHiuzYP6P6f1y7vEBJ6cSxbjwtuDlT6C5GbuNAoWPvp
         voOiv+AlU9U5FJPT+KxySj4TBPgLHdRMYRdJtJ11luPtjLyxnzdlc3jTm9TQ62fODjab
         bN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=L3MCDr66oTZiEIBxiKeoj/2KlJTTMFrAd5D/b0sgXcI=;
        b=ckxDReMJwshLIkKTAQob02PsKRPIObHZQiyrp7ZEogLQfp0HFEtLAUf1iuVDsmTDvc
         OcAWcmRl2FNAqJxc/5XF/Wa8Vhao30eomHbyfzcYE/b8Xt80uqfzZC3g6JRVf6pHmElv
         CNrUYHHrBuUr9yC4f2R6Ebxhzz8NHaxuhDe4qUmtr+O2NBGmt/NLfiTwFMUTueGD24fp
         xhm01CegsZkZwiDZefOER0847R/Hs0GqZ58jaLzZ+S6Qw9F//UWVegV28/JTgjLHEgHi
         5YkDjJUYAnArTduS6WiNhnwG5K0P8INkI/pVEgTbDx37lT7KagxE6EwuT76USsbvXQ0O
         A8Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e33si11006991eda.183.2019.07.25.00.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 00:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqXt3-0005r2-4n
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 03:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53459)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqXsz-0005pQ-Bl
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 03:09:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqXsy-0002wj-Ba
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 03:09:57 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.78]:45158)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqXst-0002q0-Pf; Thu, 25 Jul 2019 03:09:51 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 BWP09926083.bt.com (10.36.82.114) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 08:09:46 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 08:09:47 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 08:09:47 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v3 10/15] memory: Access MemoryRegion with
 MemOp semantics
Thread-Index: AQHVQrfxPtZP/QR+vUG3ewcqt8H5PQ==
Date: Thu, 25 Jul 2019 07:09:46 +0000
Message-ID: <1564038586947.36125@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>, 
 <1563810716254.18886@bt.com>,<1564038073754.91133@bt.com>
In-Reply-To: <1564038073754.91133@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156403858694736125btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.78
Subject: [Qemu-arm] [Qemu-devel] [PATCH v3 10/15] memory: Access
 MemoryRegion with MemOp semantics
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
 ehabkost@redhat.com, sw@weilnetz.de, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 amarkovic@wavecomp.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OQNBC2tXc3X5

--_000_156403858694736125btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

To convert interfaces of MemoryRegion access, MEMOP_SIZE and
SIZE_MEMOP no-op stubs were introduced to change syntax while keeping
the existing semantics.

Now with interfaces converted, we fill the stubs and use MemOp
semantics.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/memop.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 09c8d20..f2847e8 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -106,8 +106,7 @@ typedef enum MemOp {
     MO_SSIZE =3D MO_SIZE | MO_SIGN,
 } MemOp;

-/* No-op while memory_region_dispatch_[read|write] is converted to MemOp *=
/
-#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
-#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
+#define MEMOP_SIZE(op)  (1 << ((op) & MO_SIZE)) /* MemOp to size.  */
+#define SIZE_MEMOP(ul)  (ctzl(ul))              /* Size to MemOp.  */

 #endif
--
1.8.3.1




--_000_156403858694736125btcom_
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
<div><span style=3D"font-size: 12pt;">To convert interfaces of MemoryRegion=
 access, MEMOP_SIZE and</span><br>
</div>
<div>SIZE_MEMOP no-op stubs were introduced to change syntax while keeping<=
/div>
<div>the existing semantics.</div>
<div><br>
</div>
<div>Now with interfaces converted, we fill the stubs and use MemOp</div>
<div>semantics.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;include/exec/memop.h | 5 &#43;&#43;---</div>
<div>&nbsp;1 file changed, 2 insertions(&#43;), 3 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>index 09c8d20..f2847e8 100644</div>
<div>--- a/include/exec/memop.h</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -106,8 &#43;106,7 @@ typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_SSIZE =3D MO_SIZE | MO_SIGN,</div>
<div>&nbsp;} MemOp;</div>
<div>&nbsp;</div>
<div>-/* No-op while memory_region_dispatch_[read|write] is converted to Me=
mOp */</div>
<div>-#define MEMOP_SIZE(op) &nbsp;(op) &nbsp; &nbsp;/* MemOp to size. &nbs=
p;*/</div>
<div>-#define SIZE_MEMOP(ul) &nbsp;(ul) &nbsp; &nbsp;/* Size to MemOp. &nbs=
p;*/</div>
<div>&#43;#define MEMOP_SIZE(op) &nbsp;(1 &lt;&lt; ((op) &amp; MO_SIZE)) /*=
 MemOp to size. &nbsp;*/</div>
<div>&#43;#define SIZE_MEMOP(ul) &nbsp;(ctzl(ul)) &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;/* Size to MemOp. &nbsp;*/</div>
<div>&nbsp;</div>
<div>&nbsp;#endif</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156403858694736125btcom_--
